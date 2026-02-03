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

#include "NameClassifier.hpp"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/EnumeratedArray.h"
//#include "llvm/ADT/PointerEmbeddedInt.h"
#include "llvm/ADT/PointerIntPair.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Demangle/ItaniumDemangle.h"
#include "llvm/Demangle/MicrosoftDemangle.h"
#include "llvm/Support/raw_ostream.h"

using namespace debase_tool;
using namespace llvm;

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

namespace {
namespace gnu {

using namespace llvm::itanium_demangle;

static SymbolKind ClassifyFunction(Node* AST, Features* Out, std::string_view Name) {
  // TODO: Handle
  itanium_demangle::OutputBuffer OB;
  AST->print(OB);
  outs() << Name << ": "
         << std::string_view(OB) << '\n';
  return SymbolKind::Invalid;
}

} // namespace gnu
} // namespace `anonymous`

SymbolKind ItaniumClassifier::classify(const std::string& Sym, Features* Out) {
  using namespace llvm::itanium_demangle;
  if (Sym.empty())
    return SymbolKind::Invalid;
  std::string_view SymL = Sym;
  IDemangler D(SymL.begin(), SymL.end());
  Node* AST = D.parse(/*ParseParams=*/false);
  if (AST == nullptr)
    // Print error?
    return SymbolKind::Invalid;
  if (true)
    // TODO: Handle
    return gnu::ClassifyFunction(AST, Out, Sym);
  // TODO: Handle
  return SymbolKind::Invalid;
}

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

static void printAST(FunctionSymbolNode* AST, std::string_view Name) {
  itanium_demangle::OutputBuffer OB;
  AST->output(OB, OutputFlags(
    OF_NoAccessSpecifier    |
    OF_NoCallingConvention  |
    OF_NoTagSpecifier       |
    OF_NoMemberType         |
    OF_NoReturnType
  ));
  outs() << Name << ": " << std::string_view(OB) << '\n';
}

static void PrintQualName(ArrayRef<Node*> QualName, raw_ostream& OS) {
  SmallVector<std::string_view> NameTypes;
  SmallVector<EmbeddedStringView> NameParts;
  {
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
      OS << "<" << DtorTok << *Name << ">";
    }
  }
  OS << "\n";
}

static SymbolKind ClassifyFunction(
 FunctionSymbolNode* AST, Features* Out, std::string_view Name) {
  auto QualName = GetNodeArray(AST->Name->Components);
  if (QualName.empty()) {
    return SymbolKind::Invalid;
  }
  
#if 1
  auto DumpInfo = [=] () {
    printAST(AST, Name);
    PrintQualName(QualName, outs() << "  |");
    outs() << '\n';
  };
#endif

  if (Out)
    Out->clear();
  
  Node* LastNode = QualName.back();
  QualName = QualName.drop_back();
  if (LastNode->kind() == NodeKind::NamedIdentifier)
    // Simplest case, none of these functions are interesting...
    return SymbolKind::Other;
  else if (LastNode->kind() != NodeKind::StructorIdentifier) {
    DumpInfo();
    if (Out) {
      Out->SymKind  = SymbolKind::Other;
      Out->BaseName = GetNamePart(LastNode);
      for (Node* Nested : QualName)
        Out->NestedNames.push_back(GetNamePart(Nested));
    }
    return SymbolKind::Other;
  }

  StructorIdentifierNode* SID
    = static_cast<StructorIdentifierNode*>(LastNode);
  if (!SID->Class)
    return SymbolKind::Invalid;
  
  auto EName = NameGetter::GetRealNamePart(SID->Class);
  auto SymKind = EName.getInt()
    ? SymbolKind::Constructor
    : SymbolKind::Destructor;
  
  if (Out) {
    Out->SymKind  = SymKind;
    Out->BaseName = *EName.getPointer();
    for (Node* Nested : QualName)
      Out->NestedNames.push_back(GetNamePart(Nested));
  }

  //DumpInfo();
  return SymKind;
}

} // namespace msvc
} // namespace `anonymous`

SymbolKind MSVCClassifier::classify(const std::string& Sym, Features* Out) {
  using namespace llvm::ms_demangle;
  if (Sym.empty())
    return SymbolKind::Invalid;
  std::string_view SymL = Sym;
  MDemangler D;
  SymbolNode* AST = D.parse(SymL);
  if (D.Error) {
    // Print error?
    return SymbolKind::Invalid;
  }
  if (AST->kind() == NodeKind::FunctionSymbol)
    return msvc::ClassifyFunction(
      static_cast<FunctionSymbolNode*>(AST), Out, Sym);
  return SymbolKind::Invalid;
}

void Classifier::anchor() {}
