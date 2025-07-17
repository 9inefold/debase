; ModuleID = 'Simple.cpp'
; CommandLine = clang++ -I../../runtime -O1 -g -S -emit-llvm -DDISABLE_NOINLINE=0 Simple.cpp -o SimpleNI.ll
source_filename = "Simple.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

$__clang_call_terminate = comdat any

$_ZTS1A = comdat any

$_ZTI1A = comdat any

$_ZTS1B = comdat any

$_ZTI1B = comdat any

$_ZTS1C = comdat any

$_ZTI1C = comdat any

@_ZTV1A = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1A, ptr @_ZN1AD2Ev, ptr @_ZN1AD0Ev] }, align 8
@_ZTV1B = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1B, ptr @_ZN1BD2Ev, ptr @_ZN1BD0Ev] }, align 8
@_ZTV1C = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1C, ptr @_ZN1CD2Ev, ptr @_ZN1CD0Ev] }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTS1A = linkonce_odr dso_local constant [3 x i8] c"1A\00", comdat, align 1
@_ZTI1A = linkonce_odr dso_local constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTS1A }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTS1B = linkonce_odr dso_local constant [3 x i8] c"1B\00", comdat, align 1
@_ZTI1B = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1B, ptr @_ZTI1A }, comdat, align 8
@_ZTS1C = linkonce_odr dso_local constant [3 x i8] c"1C\00", comdat, align 1
@_ZTI1C = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1C, ptr @_ZTI1B }, comdat, align 8
@str = private unnamed_addr constant [3 x i8] c"A!\00", align 1
@str.3 = private unnamed_addr constant [3 x i8] c"B!\00", align 1
@str.4 = private unnamed_addr constant [3 x i8] c"C!\00", align 1

@_ZN1AD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1AD2Ev
@_ZN1BD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1BD2Ev
@_ZN1CD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1CD2Ev

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_ZN1AD2Ev(ptr nocapture noundef nonnull writeonly align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !216 {
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !229, metadata !DIExpression()), !dbg !231
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1A, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !dbg !232, !tbaa !233
  invoke preserve_mostcc void @__debase_mark_begin()
          to label %2 unwind label %5, !dbg !236

2:                                                ; preds = %1
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !238
  invoke preserve_mostcc void @__debase_mark_begin()
          to label %4 unwind label %5, !dbg !239

4:                                                ; preds = %2
  ret void, !dbg !240

5:                                                ; preds = %2, %1
  %6 = landingpad { ptr, i32 }
          catch ptr null, !dbg !236
  %7 = extractvalue { ptr, i32 } %6, 0, !dbg !236
  tail call void @__clang_call_terminate(ptr %7) #6, !dbg !236
  unreachable, !dbg !236
}

declare !dbg !241 dso_local preserve_mostcc void @__debase_mark_begin() local_unnamed_addr #1

declare dso_local i32 @__gxx_personality_seh0(...)

; Function Attrs: noinline noreturn nounwind uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #2 comdat {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #7
  tail call void @_ZSt9terminatev() #6
  unreachable
}

declare dso_local ptr @__cxa_begin_catch(ptr) local_unnamed_addr

declare dso_local void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_ZN1AD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !245 {
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !247, metadata !DIExpression()), !dbg !248
  tail call void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #7, !dbg !249
  tail call void @_ZdlPv(ptr noundef nonnull %0) #8, !dbg !249
  ret void, !dbg !250
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_ZN1BD2Ev(ptr nocapture noundef nonnull writeonly align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !251 {
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !261, metadata !DIExpression()), !dbg !263
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1B, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !dbg !264, !tbaa !233
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.3), !dbg !265
  invoke preserve_mostcc void @__debase_mark_end()
          to label %3 unwind label %4, !dbg !267

3:                                                ; preds = %1
  tail call void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #7, !dbg !268
  ret void, !dbg !269

4:                                                ; preds = %1
  %5 = landingpad { ptr, i32 }
          catch ptr null, !dbg !265
  %6 = extractvalue { ptr, i32 } %5, 0, !dbg !265
  tail call void @__clang_call_terminate(ptr %6) #6, !dbg !265
  unreachable, !dbg !265
}

declare !dbg !270 dso_local preserve_mostcc void @__debase_mark_end() local_unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_ZN1BD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !272 {
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !274, metadata !DIExpression()), !dbg !275
  tail call void @_ZN1BD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #7, !dbg !276
  tail call void @_ZdlPv(ptr noundef nonnull %0) #8, !dbg !276
  ret void, !dbg !277
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_ZN1CD2Ev(ptr nocapture noundef nonnull writeonly align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !278 {
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !288, metadata !DIExpression()), !dbg !290
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1C, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !dbg !291, !tbaa !233
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4), !dbg !292
  tail call void @_ZN1BD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #7, !dbg !294
  ret void, !dbg !295
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_ZN1CD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !296 {
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !298, metadata !DIExpression()), !dbg !299
  tail call void @_ZN1CD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #7, !dbg !300
  tail call void @_ZdlPv(ptr noundef nonnull %0) #8, !dbg !300
  ret void, !dbg !301
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { mustprogress noinline nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline noreturn nounwind uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nofree nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }
attributes #8 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!208, !209, !210, !211, !212, !213, !214}
!llvm.ident = !{!215}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 18.1.8", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !2, imports: !14, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Simple.cpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Simple")
!2 = !{!3, !10, !12}
!3 = !DIGlobalVariableExpression(var: !4, expr: !DIExpression())
!4 = distinct !DIGlobalVariable(scope: null, file: !1, line: 7, type: !5, isLocal: true, isDefinition: true)
!5 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !8)
!6 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!9}
!9 = !DISubrange(count: 4)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(scope: null, file: !1, line: 12, type: !5, isLocal: true, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !1, line: 17, type: !5, isLocal: true, isDefinition: true)
!14 = !{!15, !22, !25, !29, !35, !37, !44, !48, !54, !56, !60, !64, !68, !76, !80, !84, !88, !92, !94, !98, !102, !106, !108, !110, !112, !118, !125, !131, !136, !142, !146, !150, !152, !154, !156, !160, !164, !168, !172, !176, !180, !184, !188, !192, !196, !198, !202, !204}
!15 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !18, file: !21, line: 117)
!16 = !DINamespace(name: "__1", scope: !17, exportSymbols: true)
!17 = !DINamespace(name: "std", scope: null)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !19, line: 47, baseType: !20)
!19 = !DIFile(filename: "C:/msys64/clang64/include/stdio.h", directory: "")
!20 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !19, line: 33, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS6_iobuf")
!21 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cstdio", directory: "")
!22 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !23, file: !21, line: 118)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !19, line: 112, baseType: !24)
!24 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!25 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !26, file: !21, line: 119)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 35, baseType: !28)
!27 = !DIFile(filename: "C:/msys64/clang64/include/corecrt.h", directory: "")
!28 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !30, file: !21, line: 121)
!30 = !DISubprogram(name: "fclose", scope: !19, file: !19, line: 525, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !34}
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !36, file: !21, line: 122)
!36 = !DISubprogram(name: "fflush", scope: !19, file: !19, line: 534, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !38, file: !21, line: 123)
!38 = !DISubprogram(name: "setbuf", scope: !19, file: !19, line: 631, type: !39, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !41, !42}
!41 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !34)
!42 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !45, file: !21, line: 124)
!45 = !DISubprogram(name: "setvbuf", scope: !19, file: !19, line: 635, type: !46, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!46 = !DISubroutineType(types: !47)
!47 = !{!33, !41, !42, !33, !26}
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !49, file: !21, line: 125)
!49 = !DISubprogram(name: "fprintf", scope: !19, file: !19, line: 418, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!50 = !DISubroutineType(types: !51)
!51 = !{!33, !41, !52, null}
!52 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !55, file: !21, line: 126)
!55 = !DISubprogram(name: "fscanf", scope: !19, file: !19, line: 433, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !57, file: !21, line: 127)
!57 = !DISubprogram(name: "snprintf", scope: !19, file: !19, line: 719, type: !58, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!58 = !DISubroutineType(types: !59)
!59 = !{!33, !42, !26, !52, null}
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !61, file: !21, line: 128)
!61 = !DISubprogram(name: "sprintf", scope: !19, file: !19, line: 422, type: !62, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!62 = !DISubroutineType(types: !63)
!63 = !{!33, !42, !52, null}
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !65, file: !21, line: 129)
!65 = !DISubprogram(name: "sscanf", scope: !19, file: !19, line: 439, type: !66, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!66 = !DISubroutineType(types: !67)
!67 = !{!33, !52, !52, null}
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !69, file: !21, line: 130)
!69 = !DISubprogram(name: "vfprintf", scope: !19, file: !19, line: 425, type: !70, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!70 = !DISubroutineType(types: !71)
!71 = !{!33, !41, !52, !72}
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !73, line: 31, baseType: !74)
!73 = !DIFile(filename: "C:/msys64/clang64/include/vadefs.h", directory: "")
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !73, line: 24, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1, baseType: !43)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !77, file: !21, line: 131)
!77 = !DISubprogram(name: "vfscanf", scope: !19, file: !19, line: 448, type: !78, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!78 = !DISubroutineType(types: !79)
!79 = !{!33, !34, !53, !75}
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !81, file: !21, line: 132)
!81 = !DISubprogram(name: "vsscanf", scope: !19, file: !19, line: 451, type: !82, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!82 = !DISubroutineType(types: !83)
!83 = !{!33, !52, !52, !75}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !85, file: !21, line: 133)
!85 = !DISubprogram(name: "vsnprintf", scope: !19, file: !19, line: 716, type: !86, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!86 = !DISubroutineType(types: !87)
!87 = !{!33, !42, !26, !52, !72}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !89, file: !21, line: 134)
!89 = !DISubprogram(name: "vsprintf", scope: !19, file: !19, line: 429, type: !90, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!90 = !DISubroutineType(types: !91)
!91 = !{!33, !42, !52, !72}
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !93, file: !21, line: 135)
!93 = !DISubprogram(name: "fgetc", scope: !19, file: !19, line: 535, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !95, file: !21, line: 136)
!95 = !DISubprogram(name: "fgets", scope: !19, file: !19, line: 539, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!96 = !DISubroutineType(types: !97)
!97 = !{!43, !42, !33, !41}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !99, file: !21, line: 137)
!99 = !DISubprogram(name: "fputc", scope: !19, file: !19, line: 548, type: !100, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!100 = !DISubroutineType(types: !101)
!101 = !{!33, !33, !34}
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !103, file: !21, line: 138)
!103 = !DISubprogram(name: "fputs", scope: !19, file: !19, line: 550, type: !104, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!104 = !DISubroutineType(types: !105)
!105 = !{!33, !52, !41}
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !107, file: !21, line: 139)
!107 = !DISubprogram(name: "getc", scope: !19, file: !19, line: 598, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !109, file: !21, line: 140)
!109 = !DISubprogram(name: "putc", scope: !19, file: !19, line: 616, type: !100, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !111, file: !21, line: 141)
!111 = !DISubprogram(name: "ungetc", scope: !19, file: !19, line: 654, type: !100, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !113, file: !21, line: 142)
!113 = !DISubprogram(name: "fread", scope: !19, file: !19, line: 551, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!114 = !DISubroutineType(types: !115)
!115 = !{!26, !116, !26, !26, !41}
!116 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !117)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !119, file: !21, line: 143)
!119 = !DISubprogram(name: "fwrite", scope: !19, file: !19, line: 597, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!120 = !DISubroutineType(types: !121)
!121 = !{!26, !122, !26, !26, !41}
!122 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !123)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !126, file: !21, line: 144)
!126 = !DISubprogram(name: "fgetpos", scope: !19, file: !19, line: 537, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!127 = !DISubroutineType(types: !128)
!128 = !{!33, !41, !129}
!129 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !130)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !132, file: !21, line: 145)
!132 = !DISubprogram(name: "fseek", scope: !19, file: !19, line: 555, type: !133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!133 = !DISubroutineType(types: !134)
!134 = !{!33, !34, !135, !33}
!135 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !137, file: !21, line: 146)
!137 = !DISubprogram(name: "fsetpos", scope: !19, file: !19, line: 553, type: !138, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!138 = !DISubroutineType(types: !139)
!139 = !{!33, !34, !140}
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !143, file: !21, line: 147)
!143 = !DISubprogram(name: "ftell", scope: !19, file: !19, line: 556, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!144 = !DISubroutineType(types: !145)
!145 = !{!135, !34}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !147, file: !21, line: 148)
!147 = !DISubprogram(name: "rewind", scope: !19, file: !19, line: 629, type: !148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!148 = !DISubroutineType(types: !149)
!149 = !{null, !34}
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !151, file: !21, line: 149)
!151 = !DISubprogram(name: "clearerr", scope: !19, file: !19, line: 524, type: !148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !153, file: !21, line: 150)
!153 = !DISubprogram(name: "feof", scope: !19, file: !19, line: 532, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !155, file: !21, line: 151)
!155 = !DISubprogram(name: "ferror", scope: !19, file: !19, line: 533, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !157, file: !21, line: 152)
!157 = !DISubprogram(name: "perror", scope: !19, file: !19, line: 606, type: !158, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!158 = !DISubroutineType(types: !159)
!159 = !{null, !53}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !161, file: !21, line: 154)
!161 = !DISubprogram(name: "fopen", scope: !19, file: !19, line: 546, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!162 = !DISubroutineType(types: !163)
!163 = !{!34, !52, !52}
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !165, file: !21, line: 155)
!165 = !DISubprogram(name: "freopen", scope: !19, file: !19, line: 552, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!166 = !DISubroutineType(types: !167)
!167 = !{!34, !52, !52, !41}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !169, file: !21, line: 156)
!169 = !DISubprogram(name: "remove", scope: !19, file: !19, line: 622, type: !170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!170 = !DISubroutineType(types: !171)
!171 = !{!33, !53}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !173, file: !21, line: 157)
!173 = !DISubprogram(name: "rename", scope: !19, file: !19, line: 623, type: !174, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!174 = !DISubroutineType(types: !175)
!175 = !{!33, !53, !53}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !177, file: !21, line: 158)
!177 = !DISubprogram(name: "tmpfile", scope: !19, file: !19, line: 652, type: !178, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!178 = !DISubroutineType(types: !179)
!179 = !{!34}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !181, file: !21, line: 159)
!181 = !DISubprogram(name: "tmpnam", scope: !19, file: !19, line: 653, type: !182, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!182 = !DISubroutineType(types: !183)
!183 = !{!43, !43}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !185, file: !21, line: 161)
!185 = !DISubprogram(name: "getchar", scope: !19, file: !19, line: 599, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!186 = !DISubroutineType(types: !187)
!187 = !{!33}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !189, file: !21, line: 165)
!189 = !DISubprogram(name: "scanf", scope: !19, file: !19, line: 436, type: !190, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!190 = !DISubroutineType(types: !191)
!191 = !{!33, !52, null}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !193, file: !21, line: 166)
!193 = !DISubprogram(name: "vscanf", scope: !19, file: !19, line: 453, type: !194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!194 = !DISubroutineType(types: !195)
!195 = !{!33, !53, !75}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !197, file: !21, line: 168)
!197 = !DISubprogram(name: "printf", scope: !19, file: !19, line: 420, type: !190, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !199, file: !21, line: 169)
!199 = !DISubprogram(name: "putchar", scope: !19, file: !19, line: 617, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!200 = !DISubroutineType(types: !201)
!201 = !{!33, !33}
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !203, file: !21, line: 170)
!203 = !DISubprogram(name: "puts", scope: !19, file: !19, line: 618, type: !170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !205, file: !21, line: 171)
!205 = !DISubprogram(name: "vprintf", scope: !19, file: !19, line: 427, type: !206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!206 = !DISubroutineType(types: !207)
!207 = !{!33, !52, !72}
!208 = !{i32 7, !"Dwarf Version", i32 4}
!209 = !{i32 2, !"Debug Info Version", i32 3}
!210 = !{i32 1, !"wchar_size", i32 2}
!211 = !{i32 8, !"PIC Level", i32 2}
!212 = !{i32 7, !"uwtable", i32 2}
!213 = !{i32 1, !"MaxTLSAlign", i32 65536}
!214 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!215 = !{!"clang version 18.1.8"}
!216 = distinct !DISubprogram(name: "~A", linkageName: "_ZN1AD2Ev", scope: !217, file: !1, line: 5, type: !224, scopeLine: 5, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !227, retainedNodes: !228)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "A", file: !218, line: 12, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !219, vtableHolder: !217)
!218 = !DIFile(filename: "./Simple.hpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Simple")
!219 = !{!220, !223, !227}
!220 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$A", scope: !218, file: !218, baseType: !221, size: 64, flags: DIFlagArtificial)
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !186, size: 64)
!223 = !DISubprogram(name: "A", scope: !217, file: !218, line: 13, type: !224, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!224 = !DISubroutineType(types: !225)
!225 = !{null, !226}
!226 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!227 = !DISubprogram(name: "~A", scope: !217, file: !218, line: 14, type: !224, scopeLine: 14, containingType: !217, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!228 = !{!229}
!229 = !DILocalVariable(name: "this", arg: 1, scope: !216, type: !230, flags: DIFlagArtificial | DIFlagObjectPointer)
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!231 = !DILocation(line: 0, scope: !216)
!232 = !DILocation(line: 5, column: 18, scope: !216)
!233 = !{!234, !234, i64 0}
!234 = !{!"vtable pointer", !235, i64 0}
!235 = !{!"Simple C++ TBAA"}
!236 = !DILocation(line: 6, column: 2, scope: !237)
!237 = distinct !DILexicalBlock(scope: !216, file: !1, line: 5, column: 18)
!238 = !DILocation(line: 7, column: 3, scope: !237)
!239 = !DILocation(line: 8, column: 2, scope: !237)
!240 = !DILocation(line: 9, column: 1, scope: !216)
!241 = !DISubprogram(name: "__debase_mark_begin", scope: !242, file: !242, line: 31, type: !243, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!242 = !DIFile(filename: "../../runtime/debase/Hint.hpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Simple")
!243 = !DISubroutineType(cc: DW_CC_LLVM_PreserveMost, types: !244)
!244 = !{null}
!245 = distinct !DISubprogram(name: "~A", linkageName: "_ZN1AD0Ev", scope: !217, file: !1, line: 5, type: !224, scopeLine: 5, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !227, retainedNodes: !246)
!246 = !{!247}
!247 = !DILocalVariable(name: "this", arg: 1, scope: !245, type: !230, flags: DIFlagArtificial | DIFlagObjectPointer)
!248 = !DILocation(line: 0, scope: !245)
!249 = !DILocation(line: 5, column: 18, scope: !245)
!250 = !DILocation(line: 9, column: 1, scope: !245)
!251 = distinct !DISubprogram(name: "~B", linkageName: "_ZN1BD2Ev", scope: !252, file: !1, line: 11, type: !256, scopeLine: 11, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !259, retainedNodes: !260)
!252 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "B", file: !218, line: 17, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !253, vtableHolder: !217)
!253 = !{!254, !255, !259}
!254 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !252, baseType: !217, extraData: i32 0)
!255 = !DISubprogram(name: "B", scope: !252, file: !218, line: 18, type: !256, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!256 = !DISubroutineType(types: !257)
!257 = !{null, !258}
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!259 = !DISubprogram(name: "~B", scope: !252, file: !218, line: 19, type: !256, scopeLine: 19, containingType: !252, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!260 = !{!261}
!261 = !DILocalVariable(name: "this", arg: 1, scope: !251, type: !262, flags: DIFlagArtificial | DIFlagObjectPointer)
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64)
!263 = !DILocation(line: 0, scope: !251)
!264 = !DILocation(line: 11, column: 18, scope: !251)
!265 = !DILocation(line: 12, column: 3, scope: !266)
!266 = distinct !DILexicalBlock(scope: !251, file: !1, line: 11, column: 18)
!267 = !DILocation(line: 13, column: 2, scope: !266)
!268 = !DILocation(line: 14, column: 1, scope: !266)
!269 = !DILocation(line: 14, column: 1, scope: !251)
!270 = !DISubprogram(name: "dtor_end", linkageName: "__debase_mark_end", scope: !271, file: !242, line: 73, type: !243, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!271 = !DINamespace(name: "debase", scope: null)
!272 = distinct !DISubprogram(name: "~B", linkageName: "_ZN1BD0Ev", scope: !252, file: !1, line: 11, type: !256, scopeLine: 11, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !259, retainedNodes: !273)
!273 = !{!274}
!274 = !DILocalVariable(name: "this", arg: 1, scope: !272, type: !262, flags: DIFlagArtificial | DIFlagObjectPointer)
!275 = !DILocation(line: 0, scope: !272)
!276 = !DILocation(line: 11, column: 18, scope: !272)
!277 = !DILocation(line: 14, column: 1, scope: !272)
!278 = distinct !DISubprogram(name: "~C", linkageName: "_ZN1CD2Ev", scope: !279, file: !1, line: 16, type: !283, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !286, retainedNodes: !287)
!279 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "C", file: !218, line: 22, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !280, vtableHolder: !217)
!280 = !{!281, !282, !286}
!281 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !279, baseType: !252, extraData: i32 0)
!282 = !DISubprogram(name: "C", scope: !279, file: !218, line: 23, type: !283, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!283 = !DISubroutineType(types: !284)
!284 = !{null, !285}
!285 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!286 = !DISubprogram(name: "~C", scope: !279, file: !218, line: 24, type: !283, scopeLine: 24, containingType: !279, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!287 = !{!288}
!288 = !DILocalVariable(name: "this", arg: 1, scope: !278, type: !289, flags: DIFlagArtificial | DIFlagObjectPointer)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64)
!290 = !DILocation(line: 0, scope: !278)
!291 = !DILocation(line: 16, column: 18, scope: !278)
!292 = !DILocation(line: 17, column: 3, scope: !293)
!293 = distinct !DILexicalBlock(scope: !278, file: !1, line: 16, column: 18)
!294 = !DILocation(line: 18, column: 1, scope: !293)
!295 = !DILocation(line: 18, column: 1, scope: !278)
!296 = distinct !DISubprogram(name: "~C", linkageName: "_ZN1CD0Ev", scope: !279, file: !1, line: 16, type: !283, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !286, retainedNodes: !297)
!297 = !{!298}
!298 = !DILocalVariable(name: "this", arg: 1, scope: !296, type: !289, flags: DIFlagArtificial | DIFlagObjectPointer)
!299 = !DILocation(line: 0, scope: !296)
!300 = !DILocation(line: 16, column: 18, scope: !296)
!301 = !DILocation(line: 18, column: 1, scope: !296)
