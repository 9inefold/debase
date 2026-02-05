//===- driver/NameClassifier.cpp ------------------------------------------===//
//
// Copyright (C) 2026 Ninefold
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
//     limitations under the License.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// Provide utilities to parse symbol names from itanium/microsoft ABIs.
///
//===----------------------------------------------------------------------===//

#include "NameClassifier.hpp"
#include "SymbolFeatures.hpp"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/EnumeratedArray.h"
//#include "llvm/ADT/PointerEmbeddedInt.h"
#include "llvm/ADT/PointerIntPair.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Demangle/Demangle.h"
#include "llvm/Demangle/ItaniumDemangle.h"
#include "llvm/Demangle/MicrosoftDemangle.h"
#include "llvm/Support/Allocator.h"
#include "llvm/Support/raw_ostream.h"

using namespace debase_tool;
using namespace llvm;

#define DEBUG_DUMP 1
#define DEBUG_DUMP_X DEBUG_DUMP && 0

namespace {
class ItaniumAllocator {
  BumpPtrAllocator Alloc;
public:
  void reset() { Alloc.Reset(); }

  template <typename T, typename ...Args> T* makeNode(Args&&...args) {
    return new (Alloc) T(std::forward<Args>(args)...);
    //return new (Alloc.Allocate(sizeof(T), alignof(T))) T(std::forward<Args>(args)...);
  }

  void* allocateNodeArray(size_t sz) {
    return Alloc.Allocate(sz * sizeof(itanium_demangle::Node*),
                              alignof(itanium_demangle::Node*));
  }
};
} // namespace `anonymous`

using IDemangler = llvm::itanium_demangle::ManglingParser<ItaniumAllocator>;
using MDemangler = llvm::ms_demangle::Demangler;

void Classifier::anchor() {}

////////////////////////////////////////////////////////////////////////////////
// Itanium (gnu)

namespace {
namespace gnu {

using namespace llvm::itanium_demangle;
using NodeKind = itanium_demangle::Node::Kind;

static constexpr NodeKind NodeKind_LAST =
  static_cast<NodeKind>(NodeKind::KExplicitObjectParameter + 1u);
static EnumeratedArray<std::string_view, NodeKind, NodeKind_LAST> NodeKindNames {
#define NODE(KIND) #KIND,
#include "llvm/Demangle/ItaniumNodes.def"
  // Terminator Node
  "Invalid"
};

static std::string_view classifyNode(const Node* N) {
  if (LLVM_UNLIKELY(N == nullptr))
    return "Invalid";
  return NodeKindNames[N->getKind()];
}

static bool IsNamedKind(NodeKind K) {
  return K == NodeKind::KNestedName || K == NodeKind::KNameType;
}
LLVM_ATTRIBUTE_ALWAYS_INLINE static bool IsNamedKind(const Node* N) {
  assert(N != nullptr);
  return IsNamedKind(N->getKind());
}

static bool IsNamedKindEx(NodeKind K) {
  return IsNamedKind(K) || K == NodeKind::KSpecialName;
}
LLVM_ATTRIBUTE_ALWAYS_INLINE static bool IsNamedKindEx(const Node* N) {
  assert(N != nullptr);
  return IsNamedKindEx(N->getKind());
}

static raw_ostream& printNode(const Node* AST, raw_ostream& OS) {
  assert(AST != nullptr);
  itanium_demangle::OutputBuffer OB;
  AST->print(OB);
  return OS << std::string_view(OB);
}

static void printAST(Node* AST, std::string_view Name, raw_ostream& OS) {
  assert(AST != nullptr);
  itanium_demangle::OutputBuffer OB;
  AST->print(OB);
  OS << Name << ": " << std::string_view(OB);
}

static void PrintNestedNameForFeatures(const Node* N, SymbolFeatures& Out, int Depth = 0) {
#if DEBUG_DUMP_X
  outs().indent(Depth * 2);

  if (!IsNamedKind(N)) {
    outs() << "End[" << classifyNode(N) << "]\n";
    // End recursion?
    return;
  }

  if (N->getKind() == NodeKind::KNameType) {
    auto* Name = static_cast<const NameType*>(N);
    outs() << "Name\n";
    outs().indent(Depth * 2 + 1);
    if (!Name->getName().starts_with('('))
      outs() << Name->getName() << "\n";
    else
      outs() << "`anonymous`" << "\n";
    return;
  }

  auto* NName = static_cast<const NestedName*>(N);
  outs() << "Nest\n";
  outs().indent(Depth * 2 + 1) << "Left\n";
    PrintNestedNameForFeatures(NName->Qual, Out, Depth + 1);
  outs().indent(Depth * 2 + 1) << "Right\n";
    PrintNestedNameForFeatures(NName->Name, Out, Depth + 1);
#endif // DEBUG_DUMP_X
}

static bool AddNestedNameToFeatures(Node* N, SmallVectorImpl<std::string>& Out) {
  if (N->getKind() == NodeKind::KNameType) {
    std::string_view Name = static_cast<NameType*>(N)->getName();
    Out.emplace_back(std::string(Name));
    return true;
  } else if (N->getKind() != NodeKind::KNestedName)
    // Unsupported name type
    return false;

  auto* Nested = static_cast<NestedName*>(N);
  if (!AddNestedNameToFeatures(Nested->Qual, Out))
    return false;
  //assert(Nested->Name->getKind() == NodeKind::KNameType);
  //std::string_view Name =
  //    static_cast<NameType*>(Nested->Name)->getName();
  //Out.emplace_back(std::string(Name));
  return AddNestedNameToFeatures(Nested->Name, Out);
}

static bool AddBaseNameToFeatures(const Node* N, SymbolFeatures& Out) {
  if (N->getKind() == NodeKind::KNameType) {
    //Out.BaseName = static_cast<const NameType*>(N)->getName();
    Out.setBase(static_cast<const NameType*>(N)->getName());
    return true;
  } else if (N->getKind() == NodeKind::KNestedName) {
    auto* Nested = static_cast<const NestedName*>(N);
    assert(Nested->Name->getKind() == NodeKind::KNameType);
    //Out.BaseName = static_cast<NameType*>(Nested->Name)->getName();
    //return AddNestedNameToFeatures(Nested->Qual, Out.NestedNames);
    if (AddNestedNameToFeatures(Nested->Qual, Out.NestedNames)) {
      Out.setBase(static_cast<NameType*>(Nested->Name)->getName());
      return true;
    }
  }
  // Unsupported type
  return false;
}

static SymbolKind ClassifyFunction(
    Node* ASTVal, SymbolFeatures* Out, std::string_view Name) {
  if (!ASTVal || !IsNamedKindEx(ASTVal)) {
#if DEBUG_DUMP
    if (ASTVal /*&& ASTVal->getKind() != NodeKind::KNameType*/) {
      outs() << "ErrorType[" << classifyNode(ASTVal) << "]\n  ";
      printAST(ASTVal, Name, outs());
      outs() << "\n\n";
    }
#endif
    // Log here? Could be something else of importance.
    return SymbolKind::Invalid;
  }

  auto SetSymbol = [Out] (SymbolKind K) {
    if (Out)
      Out->SymKind = K;
    return K;
  };

  if (ASTVal->getKind() == NodeKind::KNameType) {
    // Simplest case, none of these functions are interesting...
#if DEBUG_DUMP_X
    outs() << "Ignored[" << classifyNode(N) << "]\n  ";
    printAST(ASTVal, Name, outs());
    outs() << "\n\n";
#endif
    return SetSymbol(SymbolKind::Ignorable);
  } else if (ASTVal->getKind() == NodeKind::KSpecialName) {
    auto* SN = static_cast<SpecialName*>(ASTVal);
    SN->match([&] (std::string_view Special, const Node* Child) {
#if DEBUG_DUMP
      printAST(ASTVal, Name, outs());
      outs() << "\n  Special[" << Special << classifyNode(Child) << "]";
      outs() << "\n\n";
#endif
    });
    return SetSymbol(SymbolKind::Other);
  }
  
  auto* AST = static_cast<NestedName*>(ASTVal);
  if (AST->Name->getKind() != NodeKind::KCtorDtorName) {
#if DEBUG_DUMP_X
    printAST(AST, Name, outs());
    outs() << "\n  Qual: " << classifyNode(AST->Qual) << '\n';
    outs() <<   "  Name: " << classifyNode(AST->Name) << '\n';
#endif
    // Simplest case, none of these functions are interesting...
    return SetSymbol(SymbolKind::Ignorable);
  }

  auto* CDName = static_cast<CtorDtorName*>(AST->Name);
  bool DidSucceed = true;
  CDName->match([Out, &DidSucceed] (const Node* Basename, bool IsDtor, int Variant) {
    if (Out != nullptr) {
      DidSucceed = AddBaseNameToFeatures(Basename, *Out);
      Out->SymKind = IsDtor
        ? SymbolKind::Destructor
        : SymbolKind::Constructor;
      Out->Variant = Variant;
    }
  });

  if (LLVM_UNLIKELY(!DidSucceed)) {
    assert(Out != nullptr && "Wtf");
#if DEBUG_DUMP
    outs() << "ErrorType[" << classifyNode(ASTVal) << "]\n  ";
    printAST(ASTVal, Name, outs());
    outs() << "\n\n";
#endif
    // Encountered some name which isn't supported.
    Out->clear();
    return SymbolKind::Invalid;
  }

  
  auto DumpInfo = [=] (bool Colors = false) {
#if DEBUG_DUMP
    SmallString<128> Buf; {
      raw_svector_ostream OS(Buf);
      OS.enable_colors(Colors);
      printAST(AST, Name, OS);
      OS << '\n';
      CDName->match([&OS, Out] (const Node* Basename, bool IsDtor, int Variant) {
        //OS << "  Base: " << classifyNode(Basename) << '\n';
        //OS << "    Name: "; printNode(Basename, OS) << '\n';
        if (Out) {
          OS << "  Name: ";
          for (auto& Nested : Out->nestedNames())
            OS << Nested << "::";
          OS << Out->baseName() << '\n';
        }
        OS << "  Dtor: " << (IsDtor ? "yes" : "no") << '\n';
        OS << "  Type: " << (IsDtor ? 'D' : 'C') << Variant << '\n';
      });
    }
    outs() << Buf.str() << '\n';
    if (!Colors)
      outs().flush();
#endif
  };

  DumpInfo();
  return SymbolKind::Invalid;
}

} // namespace gnu
} // namespace `anonymous`

SymbolKind ItaniumClassifier::classify(const std::string& Sym, SymbolFeatures* Out) {
  using namespace llvm::itanium_demangle;
  if (Out)
    Out->clear();
  if (Sym.empty())
    return SymbolKind::Invalid;
  std::string_view SymL = Sym;
  IDemangler D(SymL.begin(), SymL.end());
  Node* AST = D.parse(/*ParseParams=*/false);
  if (AST == nullptr)
    // Print error?
    return SymbolKind::Invalid;
  // Determines the type and features of a function.
  return gnu::ClassifyFunction(AST, Out, Sym);
}

////////////////////////////////////////////////////////////////////////////////
// Microsoft (msvc)

namespace {
namespace msvc {

using namespace llvm::ms_demangle;

static EnumeratedArray<std::string_view, NodeKind,
                       NodeKind::SpecialTableSymbol> NodeKindNames {
  "Unknown",
  "Md5Symbol",
  "PrimitiveType",
  "FunctionSignature",
  "Identifier",
  "NamedIdentifier",
  "VcallThunkIdentifier",
  "LocalStaticGuardIdentifier",
  "IntrinsicFunctionIdentifier",
  "ConversionOperatorIdentifier",
  "DynamicStructorIdentifier",
  "StructorIdentifier",
  "LiteralOperatorIdentifier",
  "ThunkSignature",
  "PointerType",
  "TagType",
  "ArrayType",
  "Custom",
  "IntrinsicType",
  "NodeArray",
  "QualifiedName",
  "TemplateParameterReference",
  "EncodedStringLiteral",
  "IntegerLiteral",
  "RttiBaseClassDescriptor",
  "LocalStaticGuardVariable",
  "FunctionSymbol",
  "VariableSymbol",
  "SpecialTableSymbol"
};

using EmbeddedStringView = llvm::PointerIntPair<std::string_view*, 1, bool>;

static std::string_view classifyNode(Node* N) {
  if (LLVM_UNLIKELY(N == nullptr))
    return "Invalid";
  return NodeKindNames[N->kind()];
}

static ArrayRef<Node*> GetNodeArray(NodeArrayNode* Arr) {
  if (Arr == nullptr)
    return ArrayRef<Node*>();
  return ArrayRef(Arr->Nodes, Arr->Count);
}

static EnumeratedArray<std::string_view, IntrinsicFunctionKind,
                       IntrinsicFunctionKind::Spaceship> IntrinsicFunctionKindNames {
  "operator @",                             // None
  "operator new",                           // ?2
  "operator delete",                        // ?3
  "operator=",                              // ?4
  "operator>>",                             // ?5
  "operator<<",                             // ?6
  "operator!",                              // ?7
  "operator==",                             // ?8
  "operator!=",                             // ?9
  "operator[]",                             // ?A
  "operator->",                             // ?C
  "operator*",                              // ?D
  "operator++",                             // ?E
  "operator--",                             // ?F
  "operator-",                              // ?G
  "operator+",                              // ?H
  "operator&",                              // ?I
  "operator->*",                            // ?J
  "operator/",                              // ?K
  "operator%",                              // ?L
  "operator<",                              // ?M
  "operator<=",                             // ?N
  "operator>",                              // ?O
  "operator>=",                             // ?P
  "operator,",                              // ?Q
  "operator()",                             // ?R
  "operator~",                              // ?S
  "operator^",                              // ?T
  "operator|",                              // ?U
  "operator&&",                             // ?V
  "operator||",                             // ?W
  "operator*=",                             // ?X
  "operator+=",                             // ?Y
  "operator-=",                             // ?Z
  "operator/=",                             // ?_0
  "operator%=",                             // ?_1
  "operator>>=",                            // ?_2
  "operator<<=",                            // ?_3
  "operator&=",                             // ?_4
  "operator|=",                             // ?_5
  "operator^=",                             // ?_6
  "vbase destructor",                       // ?_D
  "vector deleting destructor",             // ?_E
  "default constructor closure",            // ?_F
  "scalar deleting destructor",             // ?_G
  "vector constructor iterator",            // ?_H
  "vector destructor iterator",             // ?_I
  "vector vbase constructor iterator",      // ?_J
  "virtual displacement map",               // ?_K
  "eh vector constructor iterator",         // ?_L
  "eh vector destructor iterator",          // ?_M
  "eh vector vbase constructor iterator",   // ?_N
  "copy constructor closure",               // ?_O
  "local vftable constructor closure",      // ?_T
  "operator new[]",                         // ?_U
  "operator delete[]",                      // ?_V
  "managed vector ctor iterator",           // ?__A
  "managed vector dtor iterator",           // ?__B
  "EH vector copy ctor iterator",           // ?__C
  "EH vector vbase copy ctor iterator",     // ?__D
  "vector copy constructor iterator",       // ?__G
  "vector vbase copy constructor iterator", // ?__H
  "managed vector vbase copy constructor",  // ?__I
  "operator co_await",                      // ?__L
  "operator<=>"                             // ?__M
};

class NameGetter {
  using enum NodeKind;
  SmallVectorImpl<std::string_view>& NameTypes;
  SmallVectorImpl<EmbeddedStringView>& NameParts;
public:
  NameGetter(SmallVectorImpl<std::string_view>& NameTypes,
             SmallVectorImpl<EmbeddedStringView>& NameParts)
   : NameTypes(NameTypes), NameParts(NameParts) {}
  
  static EmbeddedStringView GetRealNamePart(Node* NamePart);
  void addToNameParts(ArrayRef<Node*> QualName);
  void addNamePartToArrays(Node* NamePart);
};

EmbeddedStringView NameGetter::GetRealNamePart(Node* NamePart) {
  EmbeddedStringView Out(nullptr, false);
  if (NamePart->kind() == NamedIdentifier)
    Out.setPointer(&static_cast<NamedIdentifierNode*>(NamePart)->Name);
  else if (NamePart->kind() == LiteralOperatorIdentifier)
    Out.setPointer(&static_cast<LiteralOperatorIdentifierNode*>(NamePart)->Name);
  else if (NamePart->kind() == IntrinsicFunctionIdentifier) {
    auto* IFINode = static_cast<IntrinsicFunctionIdentifierNode*>(NamePart);
    Out.setPointer(&IntrinsicFunctionKindNames[IFINode->Operator]);
  } else if (NamePart->kind() == ConversionOperatorIdentifier) {
    auto* COINode = static_cast<ConversionOperatorIdentifierNode*>(NamePart);
    if (COINode && COINode->TargetType)
      Out.setPointer(&NodeKindNames[COINode->TargetType->kind()]);
  } else if (NamePart->kind() == StructorIdentifier) {
    StructorIdentifierNode* SID
      = static_cast<StructorIdentifierNode*>(NamePart);
    if (SID->Class) {
      Out = GetRealNamePart(SID->Class);
      Out.setInt(SID->IsDestructor);
      //Out.setPointerAndInt(
      //  &NodeKindNames[SID->Class->kind()],
      //  SID->IsDestructor);
    }
  }
  return Out;
}

void NameGetter::addNamePartToArrays(Node* NamePart) {
  NameTypes.push_back(classifyNode(NamePart));
  NameParts.push_back(GetRealNamePart(NamePart));
}

void NameGetter::addToNameParts(ArrayRef<Node*> QualName) {
  for (Node* NamePart : QualName) {
    if (LLVM_UNLIKELY(!NamePart))
      continue;
    this->addNamePartToArrays(NamePart);
  }
}

static std::string GetNamePart(Node* Part) {
  EmbeddedStringView EName = NameGetter::GetRealNamePart(Part);
  if (auto* Name = EName.getPointer())
    return std::string(*Name);
  return "!";
}

static void PrintQualName(ArrayRef<Node*> QualName, raw_ostream& OS) {
  SmallVector<std::string_view> NameTypes;
  SmallVector<EmbeddedStringView> NameParts;
  /*Get names*/ {
    NameGetter G(NameTypes, NameParts);
    G.addToNameParts(QualName);
  }
  for (auto [NameType, NamePart] : llvm::zip_equal(NameTypes, NameParts)) {
    auto* Name = NamePart.getPointer();
    if (NameType.empty() && !Name) {
      OS << " ::";
      continue;
    }
    OS << ' ' << NameType;
    if (Name) {
      std::string_view DtorTok = NamePart.getInt() ? "~" : "";
      OS << '<' << DtorTok << *Name << '>';
    }
  }
}

static void printAST(Node* AST, std::string_view Name, raw_ostream& OS) {
  assert(AST != nullptr);
  itanium_demangle::OutputBuffer OB;
  AST->output(OB, OutputFlags(
    OF_NoAccessSpecifier    |
    OF_NoCallingConvention  |
    OF_NoTagSpecifier       |
    OF_NoMemberType         |
    OF_NoReturnType
  ));
  OS << Name << ": " << std::string_view(OB);
}

static SymbolKind ClassifyFunction(
    Node* ASTVal, SymbolFeatures* Out, std::string_view Name) {
  if (!ASTVal || ASTVal->kind() == NodeKind::FunctionSymbol)
    // Log here? Could be something else of importance.
    return SymbolKind::Invalid;
  
  auto* AST = static_cast<FunctionSymbolNode*>(ASTVal);
  auto QualName = GetNodeArray(AST->Name->Components);
  if (QualName.empty()) {
    // TODO: Check if any of these types could be valid?
    return SymbolKind::Invalid;
  }
  
  [[maybe_unused]] auto DumpInfo = [=] (bool Colors = false) {
#if DEBUG_DUMP
    SmallString<128> Buf; {
      raw_svector_ostream OS(Buf);
      OS.enable_colors(Colors);
      printAST(AST, Name, OS);
      OS << "\n  |";
      PrintQualName(QualName, OS);
      OS << '\n';
    }
    outs() << Buf.str() << '\n';
    if (!Colors)
      outs().flush();
#endif
  };
  
  Node* LastNode = QualName.back();
  QualName = QualName.drop_back();

  auto WriteFeatures = [&, Out] (const SymbolKind K,
                                 const std::string_view* BName = nullptr) -> SymbolKind {
    if (Out != nullptr) {
      Out->SymKind = K;
      for (Node* Nested : QualName) {
        assert(Nested != nullptr && "Invalid QualName value?");
        Out->addNested(GetNamePart(Nested));
      }
      if (!BName)
        //Out->BaseName = GetNamePart(LastNode);
        Out->setBase(GetNamePart(LastNode));
      else
        // Manually specified name pointer.
        //Out->BaseName = *BName;
        Out->setBase(*BName);
    }
#if DEBUG_DUMP
    DumpInfo();
#endif
    return K;
  };

  if (LastNode->kind() == NodeKind::NamedIdentifier) {
    // Simplest case, none of these functions are interesting...
    if (Out)
      Out->SymKind = SymbolKind::Ignorable;
    return SymbolKind::Ignorable;
  } else if (LastNode->kind() != NodeKind::StructorIdentifier)
    // Some other function type, write it out so we can check?
    return WriteFeatures(SymbolKind::Other);

  auto* SID = static_cast<StructorIdentifierNode*>(LastNode);
  if (!SID->Class)
    return SymbolKind::Invalid;
  
  EmbeddedStringView EName
    = NameGetter::GetRealNamePart(SID->Class);
  SymbolKind SymKind = EName.getInt()
    ? SymbolKind::Constructor
    : SymbolKind::Destructor;

  //DumpInfo();
  return WriteFeatures(SymKind, EName.getPointer());
}

} // namespace msvc
} // namespace `anonymous`

SymbolKind MSVCClassifier::classify(const std::string& Sym, SymbolFeatures* Out) {
  using namespace llvm::ms_demangle;
  if (Out)
    Out->clear();
  if (Sym.empty())
    return SymbolKind::Invalid;
  std::string_view SymL = Sym;
  MDemangler D;
  SymbolNode* AST = D.parse(SymL);
  if (D.Error) {
    // Print error?
    return SymbolKind::Invalid;
  }
  // Determines the type and features of a function.
  return msvc::ClassifyFunction(AST, Out, Sym);
}
