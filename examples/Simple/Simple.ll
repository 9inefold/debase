; ModuleID = 'Simple.cpp'
; CommandLine = 'clang++ -I../../runtime -O0 -g -S -emit-llvm -Xclang -disable-llvm-passes Simple.cpp -o Simple.ll'
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

@_ZTV1A = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1A, ptr @_ZN1AD1Ev, ptr @_ZN1AD0Ev] }, align 8
@.str = private unnamed_addr constant [4 x i8] c"A!\0A\00", align 1, !dbg !0
@_ZTV1B = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1B, ptr @_ZN1BD1Ev, ptr @_ZN1BD0Ev] }, align 8
@.str.1 = private unnamed_addr constant [4 x i8] c"B!\0A\00", align 1, !dbg !8
@_ZTV1C = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1C, ptr @_ZN1CD1Ev, ptr @_ZN1CD0Ev] }, align 8
@.str.2 = private unnamed_addr constant [4 x i8] c"C!\0A\00", align 1, !dbg !10
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTS1A = linkonce_odr dso_local constant [3 x i8] c"1A\00", comdat, align 1
@_ZTI1A = linkonce_odr dso_local constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTS1A }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTS1B = linkonce_odr dso_local constant [3 x i8] c"1B\00", comdat, align 1
@_ZTI1B = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1B, ptr @_ZTI1A }, comdat, align 8
@_ZTS1C = linkonce_odr dso_local constant [3 x i8] c"1C\00", comdat, align 1
@_ZTI1C = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1C, ptr @_ZTI1B }, comdat, align 8

@_ZN1AD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1AD2Ev
@_ZN1BD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1BD2Ev
@_ZN1CD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1CD2Ev

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !215 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !228, metadata !DIExpression()), !dbg !230
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1A, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !231
  notail call preserve_mostcc void @__debase_mark_begin() #6, !dbg !232
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str)
          to label %5 unwind label %6, !dbg !234

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_begin() #6, !dbg !235
  ret void, !dbg !236

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !234
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !234
  call void @__clang_call_terminate(ptr %8) #7, !dbg !234
  unreachable, !dbg !234
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_begin() #2

declare dso_local i32 @printf(ptr noundef, ...) #3

declare dso_local i32 @__gxx_personality_seh0(...)

; Function Attrs: noinline noreturn nounwind uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #4 comdat {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #6
  call void @_ZSt9terminatev() #7
  unreachable
}

declare dso_local ptr @__cxa_begin_catch(ptr)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1AD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !237 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !238, metadata !DIExpression()), !dbg !239
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1AD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #6, !dbg !240
  call void @_ZdlPv(ptr noundef %3) #8, !dbg !240
  ret void, !dbg !241
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(ptr noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1BD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !242 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !251, metadata !DIExpression()), !dbg !253
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1B, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !254
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.1)
          to label %5 unwind label %6, !dbg !255

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_begin() #6, !dbg !257
  call void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #6, !dbg !258
  ret void, !dbg !259

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !255
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !255
  call void @__clang_call_terminate(ptr %8) #7, !dbg !255
  unreachable, !dbg !255
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1BD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !260 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !261, metadata !DIExpression()), !dbg !262
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1BD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #6, !dbg !263
  call void @_ZdlPv(ptr noundef %3) #8, !dbg !263
  ret void, !dbg !264
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1CD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !265 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !274, metadata !DIExpression()), !dbg !276
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1C, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !277
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.2)
          to label %5 unwind label %6, !dbg !278

5:                                                ; preds = %1
  call void @_ZN1BD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #6, !dbg !280
  ret void, !dbg !281

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !278
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !278
  call void @__clang_call_terminate(ptr %8) #7, !dbg !278
  unreachable, !dbg !278
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1CD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !282 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !283, metadata !DIExpression()), !dbg !284
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1CD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #6, !dbg !285
  call void @_ZdlPv(ptr noundef %3) #8, !dbg !285
  ret void, !dbg !286
}

attributes #0 = { mustprogress noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline noreturn nounwind uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { builtin nounwind }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!208, !209, !210, !211, !212, !213}
!llvm.ident = !{!214}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 7, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "Simple.cpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Simple")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 4)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 12, type: !3, isLocal: true, isDefinition: true)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(scope: null, file: !2, line: 17, type: !3, isLocal: true, isDefinition: true)
!12 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "clang version 18.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !13, imports: !14, splitDebugInlining: false, nameTableKind: None)
!13 = !{!0, !8, !10}
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
!30 = !DISubprogram(name: "fclose", scope: !19, file: !19, line: 525, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !34}
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !36, file: !21, line: 122)
!36 = !DISubprogram(name: "fflush", scope: !19, file: !19, line: 534, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !38, file: !21, line: 123)
!38 = !DISubprogram(name: "setbuf", scope: !19, file: !19, line: 631, type: !39, flags: DIFlagPrototyped, spFlags: 0)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !41, !42}
!41 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !34)
!42 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !45, file: !21, line: 124)
!45 = !DISubprogram(name: "setvbuf", scope: !19, file: !19, line: 635, type: !46, flags: DIFlagPrototyped, spFlags: 0)
!46 = !DISubroutineType(types: !47)
!47 = !{!33, !41, !42, !33, !26}
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !49, file: !21, line: 125)
!49 = !DISubprogram(name: "fprintf", scope: !19, file: !19, line: 418, type: !50, flags: DIFlagPrototyped, spFlags: 0)
!50 = !DISubroutineType(types: !51)
!51 = !{!33, !41, !52, null}
!52 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !55, file: !21, line: 126)
!55 = !DISubprogram(name: "fscanf", scope: !19, file: !19, line: 433, type: !50, flags: DIFlagPrototyped, spFlags: 0)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !57, file: !21, line: 127)
!57 = !DISubprogram(name: "snprintf", scope: !19, file: !19, line: 719, type: !58, flags: DIFlagPrototyped, spFlags: 0)
!58 = !DISubroutineType(types: !59)
!59 = !{!33, !42, !26, !52, null}
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !61, file: !21, line: 128)
!61 = !DISubprogram(name: "sprintf", scope: !19, file: !19, line: 422, type: !62, flags: DIFlagPrototyped, spFlags: 0)
!62 = !DISubroutineType(types: !63)
!63 = !{!33, !42, !52, null}
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !65, file: !21, line: 129)
!65 = !DISubprogram(name: "sscanf", scope: !19, file: !19, line: 439, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!66 = !DISubroutineType(types: !67)
!67 = !{!33, !52, !52, null}
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !69, file: !21, line: 130)
!69 = !DISubprogram(name: "vfprintf", scope: !19, file: !19, line: 425, type: !70, flags: DIFlagPrototyped, spFlags: 0)
!70 = !DISubroutineType(types: !71)
!71 = !{!33, !41, !52, !72}
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !73, line: 31, baseType: !74)
!73 = !DIFile(filename: "C:/msys64/clang64/include/vadefs.h", directory: "")
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !73, line: 24, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2, baseType: !43)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !77, file: !21, line: 131)
!77 = !DISubprogram(name: "vfscanf", scope: !19, file: !19, line: 448, type: !78, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DISubroutineType(types: !79)
!79 = !{!33, !34, !53, !75}
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !81, file: !21, line: 132)
!81 = !DISubprogram(name: "vsscanf", scope: !19, file: !19, line: 451, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!82 = !DISubroutineType(types: !83)
!83 = !{!33, !52, !52, !75}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !85, file: !21, line: 133)
!85 = !DISubprogram(name: "vsnprintf", scope: !19, file: !19, line: 716, type: !86, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DISubroutineType(types: !87)
!87 = !{!33, !42, !26, !52, !72}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !89, file: !21, line: 134)
!89 = !DISubprogram(name: "vsprintf", scope: !19, file: !19, line: 429, type: !90, flags: DIFlagPrototyped, spFlags: 0)
!90 = !DISubroutineType(types: !91)
!91 = !{!33, !42, !52, !72}
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !93, file: !21, line: 135)
!93 = !DISubprogram(name: "fgetc", scope: !19, file: !19, line: 535, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !95, file: !21, line: 136)
!95 = !DISubprogram(name: "fgets", scope: !19, file: !19, line: 539, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!96 = !DISubroutineType(types: !97)
!97 = !{!43, !42, !33, !41}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !99, file: !21, line: 137)
!99 = !DISubprogram(name: "fputc", scope: !19, file: !19, line: 548, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!100 = !DISubroutineType(types: !101)
!101 = !{!33, !33, !34}
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !103, file: !21, line: 138)
!103 = !DISubprogram(name: "fputs", scope: !19, file: !19, line: 550, type: !104, flags: DIFlagPrototyped, spFlags: 0)
!104 = !DISubroutineType(types: !105)
!105 = !{!33, !52, !41}
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !107, file: !21, line: 139)
!107 = !DISubprogram(name: "getc", scope: !19, file: !19, line: 598, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !109, file: !21, line: 140)
!109 = !DISubprogram(name: "putc", scope: !19, file: !19, line: 616, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !111, file: !21, line: 141)
!111 = !DISubprogram(name: "ungetc", scope: !19, file: !19, line: 654, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !113, file: !21, line: 142)
!113 = !DISubprogram(name: "fread", scope: !19, file: !19, line: 551, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!114 = !DISubroutineType(types: !115)
!115 = !{!26, !116, !26, !26, !41}
!116 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !117)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !119, file: !21, line: 143)
!119 = !DISubprogram(name: "fwrite", scope: !19, file: !19, line: 597, type: !120, flags: DIFlagPrototyped, spFlags: 0)
!120 = !DISubroutineType(types: !121)
!121 = !{!26, !122, !26, !26, !41}
!122 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !123)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !126, file: !21, line: 144)
!126 = !DISubprogram(name: "fgetpos", scope: !19, file: !19, line: 537, type: !127, flags: DIFlagPrototyped, spFlags: 0)
!127 = !DISubroutineType(types: !128)
!128 = !{!33, !41, !129}
!129 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !130)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !132, file: !21, line: 145)
!132 = !DISubprogram(name: "fseek", scope: !19, file: !19, line: 555, type: !133, flags: DIFlagPrototyped, spFlags: 0)
!133 = !DISubroutineType(types: !134)
!134 = !{!33, !34, !135, !33}
!135 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !137, file: !21, line: 146)
!137 = !DISubprogram(name: "fsetpos", scope: !19, file: !19, line: 553, type: !138, flags: DIFlagPrototyped, spFlags: 0)
!138 = !DISubroutineType(types: !139)
!139 = !{!33, !34, !140}
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !143, file: !21, line: 147)
!143 = !DISubprogram(name: "ftell", scope: !19, file: !19, line: 556, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!144 = !DISubroutineType(types: !145)
!145 = !{!135, !34}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !147, file: !21, line: 148)
!147 = !DISubprogram(name: "rewind", scope: !19, file: !19, line: 629, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!148 = !DISubroutineType(types: !149)
!149 = !{null, !34}
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !151, file: !21, line: 149)
!151 = !DISubprogram(name: "clearerr", scope: !19, file: !19, line: 524, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !153, file: !21, line: 150)
!153 = !DISubprogram(name: "feof", scope: !19, file: !19, line: 532, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !155, file: !21, line: 151)
!155 = !DISubprogram(name: "ferror", scope: !19, file: !19, line: 533, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !157, file: !21, line: 152)
!157 = !DISubprogram(name: "perror", scope: !19, file: !19, line: 606, type: !158, flags: DIFlagPrototyped, spFlags: 0)
!158 = !DISubroutineType(types: !159)
!159 = !{null, !53}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !161, file: !21, line: 154)
!161 = !DISubprogram(name: "fopen", scope: !19, file: !19, line: 546, type: !162, flags: DIFlagPrototyped, spFlags: 0)
!162 = !DISubroutineType(types: !163)
!163 = !{!34, !52, !52}
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !165, file: !21, line: 155)
!165 = !DISubprogram(name: "freopen", scope: !19, file: !19, line: 552, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!166 = !DISubroutineType(types: !167)
!167 = !{!34, !52, !52, !41}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !169, file: !21, line: 156)
!169 = !DISubprogram(name: "remove", scope: !19, file: !19, line: 622, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!170 = !DISubroutineType(types: !171)
!171 = !{!33, !53}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !173, file: !21, line: 157)
!173 = !DISubprogram(name: "rename", scope: !19, file: !19, line: 623, type: !174, flags: DIFlagPrototyped, spFlags: 0)
!174 = !DISubroutineType(types: !175)
!175 = !{!33, !53, !53}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !177, file: !21, line: 158)
!177 = !DISubprogram(name: "tmpfile", scope: !19, file: !19, line: 652, type: !178, flags: DIFlagPrototyped, spFlags: 0)
!178 = !DISubroutineType(types: !179)
!179 = !{!34}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !181, file: !21, line: 159)
!181 = !DISubprogram(name: "tmpnam", scope: !19, file: !19, line: 653, type: !182, flags: DIFlagPrototyped, spFlags: 0)
!182 = !DISubroutineType(types: !183)
!183 = !{!43, !43}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !185, file: !21, line: 161)
!185 = !DISubprogram(name: "getchar", scope: !19, file: !19, line: 599, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!186 = !DISubroutineType(types: !187)
!187 = !{!33}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !189, file: !21, line: 165)
!189 = !DISubprogram(name: "scanf", scope: !19, file: !19, line: 436, type: !190, flags: DIFlagPrototyped, spFlags: 0)
!190 = !DISubroutineType(types: !191)
!191 = !{!33, !52, null}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !193, file: !21, line: 166)
!193 = !DISubprogram(name: "vscanf", scope: !19, file: !19, line: 453, type: !194, flags: DIFlagPrototyped, spFlags: 0)
!194 = !DISubroutineType(types: !195)
!195 = !{!33, !53, !75}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !197, file: !21, line: 168)
!197 = !DISubprogram(name: "printf", scope: !19, file: !19, line: 420, type: !190, flags: DIFlagPrototyped, spFlags: 0)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !199, file: !21, line: 169)
!199 = !DISubprogram(name: "putchar", scope: !19, file: !19, line: 617, type: !200, flags: DIFlagPrototyped, spFlags: 0)
!200 = !DISubroutineType(types: !201)
!201 = !{!33, !33}
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !203, file: !21, line: 170)
!203 = !DISubprogram(name: "puts", scope: !19, file: !19, line: 618, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !16, entity: !205, file: !21, line: 171)
!205 = !DISubprogram(name: "vprintf", scope: !19, file: !19, line: 427, type: !206, flags: DIFlagPrototyped, spFlags: 0)
!206 = !DISubroutineType(types: !207)
!207 = !{!33, !52, !72}
!208 = !{i32 7, !"Dwarf Version", i32 4}
!209 = !{i32 2, !"Debug Info Version", i32 3}
!210 = !{i32 1, !"wchar_size", i32 2}
!211 = !{i32 8, !"PIC Level", i32 2}
!212 = !{i32 7, !"uwtable", i32 2}
!213 = !{i32 1, !"MaxTLSAlign", i32 65536}
!214 = !{!"clang version 18.1.8"}
!215 = distinct !DISubprogram(name: "~A", linkageName: "_ZN1AD2Ev", scope: !216, file: !2, line: 5, type: !223, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !226, retainedNodes: !227)
!216 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "A", file: !217, line: 9, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !218, vtableHolder: !216)
!217 = !DIFile(filename: "./Simple.hpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Simple")
!218 = !{!219, !222, !226}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$A", scope: !217, file: !217, baseType: !220, size: 64, flags: DIFlagArtificial)
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !221, size: 64)
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !186, size: 64)
!222 = !DISubprogram(name: "A", scope: !216, file: !217, line: 10, type: !223, scopeLine: 10, flags: DIFlagPrototyped, spFlags: 0)
!223 = !DISubroutineType(types: !224)
!224 = !{null, !225}
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!226 = !DISubprogram(name: "~A", scope: !216, file: !217, line: 11, type: !223, scopeLine: 11, containingType: !216, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!227 = !{}
!228 = !DILocalVariable(name: "this", arg: 1, scope: !215, type: !229, flags: DIFlagArtificial | DIFlagObjectPointer)
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!230 = !DILocation(line: 0, scope: !215)
!231 = !DILocation(line: 5, column: 9, scope: !215)
!232 = !DILocation(line: 6, column: 3, scope: !233)
!233 = distinct !DILexicalBlock(scope: !215, file: !2, line: 5, column: 9)
!234 = !DILocation(line: 7, column: 3, scope: !233)
!235 = !DILocation(line: 8, column: 3, scope: !233)
!236 = !DILocation(line: 9, column: 1, scope: !215)
!237 = distinct !DISubprogram(name: "~A", linkageName: "_ZN1AD0Ev", scope: !216, file: !2, line: 5, type: !223, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !226, retainedNodes: !227)
!238 = !DILocalVariable(name: "this", arg: 1, scope: !237, type: !229, flags: DIFlagArtificial | DIFlagObjectPointer)
!239 = !DILocation(line: 0, scope: !237)
!240 = !DILocation(line: 5, column: 9, scope: !237)
!241 = !DILocation(line: 9, column: 1, scope: !237)
!242 = distinct !DISubprogram(name: "~B", linkageName: "_ZN1BD2Ev", scope: !243, file: !2, line: 11, type: !247, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !250, retainedNodes: !227)
!243 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "B", file: !217, line: 14, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !244, vtableHolder: !216)
!244 = !{!245, !246, !250}
!245 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !243, baseType: !216, extraData: i32 0)
!246 = !DISubprogram(name: "B", scope: !243, file: !217, line: 15, type: !247, scopeLine: 15, flags: DIFlagPrototyped, spFlags: 0)
!247 = !DISubroutineType(types: !248)
!248 = !{null, !249}
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!250 = !DISubprogram(name: "~B", scope: !243, file: !217, line: 16, type: !247, scopeLine: 16, containingType: !243, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!251 = !DILocalVariable(name: "this", arg: 1, scope: !242, type: !252, flags: DIFlagArtificial | DIFlagObjectPointer)
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64)
!253 = !DILocation(line: 0, scope: !242)
!254 = !DILocation(line: 11, column: 9, scope: !242)
!255 = !DILocation(line: 12, column: 3, scope: !256)
!256 = distinct !DILexicalBlock(scope: !242, file: !2, line: 11, column: 9)
!257 = !DILocation(line: 13, column: 3, scope: !256)
!258 = !DILocation(line: 14, column: 1, scope: !256)
!259 = !DILocation(line: 14, column: 1, scope: !242)
!260 = distinct !DISubprogram(name: "~B", linkageName: "_ZN1BD0Ev", scope: !243, file: !2, line: 11, type: !247, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !250, retainedNodes: !227)
!261 = !DILocalVariable(name: "this", arg: 1, scope: !260, type: !252, flags: DIFlagArtificial | DIFlagObjectPointer)
!262 = !DILocation(line: 0, scope: !260)
!263 = !DILocation(line: 11, column: 9, scope: !260)
!264 = !DILocation(line: 14, column: 1, scope: !260)
!265 = distinct !DISubprogram(name: "~C", linkageName: "_ZN1CD2Ev", scope: !266, file: !2, line: 16, type: !270, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !273, retainedNodes: !227)
!266 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "C", file: !217, line: 19, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !267, vtableHolder: !216)
!267 = !{!268, !269, !273}
!268 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !266, baseType: !243, extraData: i32 0)
!269 = !DISubprogram(name: "C", scope: !266, file: !217, line: 20, type: !270, scopeLine: 20, flags: DIFlagPrototyped, spFlags: 0)
!270 = !DISubroutineType(types: !271)
!271 = !{null, !272}
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!273 = !DISubprogram(name: "~C", scope: !266, file: !217, line: 21, type: !270, scopeLine: 21, containingType: !266, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!274 = !DILocalVariable(name: "this", arg: 1, scope: !265, type: !275, flags: DIFlagArtificial | DIFlagObjectPointer)
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64)
!276 = !DILocation(line: 0, scope: !265)
!277 = !DILocation(line: 16, column: 18, scope: !265)
!278 = !DILocation(line: 17, column: 3, scope: !279)
!279 = distinct !DILexicalBlock(scope: !265, file: !2, line: 16, column: 18)
!280 = !DILocation(line: 18, column: 1, scope: !279)
!281 = !DILocation(line: 18, column: 1, scope: !265)
!282 = distinct !DISubprogram(name: "~C", linkageName: "_ZN1CD0Ev", scope: !266, file: !2, line: 16, type: !270, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !273, retainedNodes: !227)
!283 = !DILocalVariable(name: "this", arg: 1, scope: !282, type: !275, flags: DIFlagArtificial | DIFlagObjectPointer)
!284 = !DILocation(line: 0, scope: !282)
!285 = !DILocation(line: 16, column: 18, scope: !282)
!286 = !DILocation(line: 18, column: 1, scope: !282)
