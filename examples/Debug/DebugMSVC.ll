; ModuleID = 'Debug.cpp'
source_filename = "Debug.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.34.31935"

%rtti.CompleteObjectLocator = type { i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor12 = type { ptr, ptr, [13 x i8] }
%rtti.ClassHierarchyDescriptor = type { i32, i32, i32, i32 }
%rtti.BaseClassDescriptor = type { i32, i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor11 = type { ptr, ptr, [12 x i8] }

$__debase_mark_begin = comdat any

$printf = comdat any

$__debase_mark_end = comdat any

$"??_GIDebug@@UEAAPEAXI@Z" = comdat any

$"??_GDebug@@UEAAPEAXI@Z" = comdat any

$_vfprintf_l = comdat any

$__local_stdio_printf_options = comdat any

$"??_7IDebug@@6B@" = comdat largest

$"??_C@_09ODACPCKC@?$HOIDebug?$CB?6?$AA@" = comdat any

$"??_7Debug@@6B@" = comdat largest

$"??_C@_08EEFBJGEK@?$HODebug?$CB?6?$AA@" = comdat any

$"??_R4IDebug@@6B@" = comdat any

$"??_R0?AVIDebug@@@8" = comdat any

$"??_R3IDebug@@8" = comdat any

$"??_R2IDebug@@8" = comdat any

$"??_R1A@?0A@EA@IDebug@@8" = comdat any

$"??_R4Debug@@6B@" = comdat any

$"??_R0?AVDebug@@@8" = comdat any

$"??_R3Debug@@8" = comdat any

$"??_R2Debug@@8" = comdat any

$"??_R1A@?0A@EA@Debug@@8" = comdat any

$"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" = comdat any

@0 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4IDebug@@6B@", ptr @"??_GIDebug@@UEAAPEAXI@Z", ptr @"?foo@IDebug@@UEAAXXZ"] }, comdat($"??_7IDebug@@6B@")
@"??_C@_09ODACPCKC@?$HOIDebug?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [10 x i8] c"~IDebug!\0A\00", comdat, align 1, !dbg !0
@1 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4Debug@@6B@", ptr @"??_GDebug@@UEAAPEAXI@Z", ptr @"?foo@Debug@@UEAAXXZ"] }, comdat($"??_7Debug@@6B@")
@"??_C@_08EEFBJGEK@?$HODebug?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [9 x i8] c"~Debug!\0A\00", comdat, align 1, !dbg !8
@"??_R4IDebug@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVIDebug@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3IDebug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4IDebug@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_7type_info@@6B@" = external constant ptr
@"??_R0?AVIDebug@@@8" = linkonce_odr global %rtti.TypeDescriptor12 { ptr @"??_7type_info@@6B@", ptr null, [13 x i8] c".?AVIDebug@@\00" }, comdat
@__ImageBase = external dso_local constant i8
@"??_R3IDebug@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 1, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2IDebug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2IDebug@@8" = linkonce_odr constant [2 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@IDebug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@IDebug@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVIDebug@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3IDebug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R4Debug@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVDebug@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3Debug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4Debug@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R0?AVDebug@@@8" = linkonce_odr global %rtti.TypeDescriptor11 { ptr @"??_7type_info@@6B@", ptr null, [12 x i8] c".?AVDebug@@\00" }, comdat
@"??_R3Debug@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2Debug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2Debug@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@Debug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@IDebug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@Debug@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVDebug@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3Debug@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" = linkonce_odr dso_local global i64 0, comdat, align 8, !dbg !13

@"??_7IDebug@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @0, i32 0, i32 0, i32 1)
@"??_7Debug@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @1, i32 0, i32 0, i32 1)

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef ptr @"??0IDebug@@QEAA@XZ"(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !221 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !234, !DIExpression(), !236)
  %3 = load ptr, ptr %2, align 8
  store ptr @"??_7IDebug@@6B@", ptr %3, align 8, !dbg !237
  ret ptr %3, !dbg !237
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @"??1IDebug@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__CxxFrameHandler3 !dbg !238 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !239, !DIExpression(), !240)
  %3 = load ptr, ptr %2, align 8
  store ptr @"??_7IDebug@@6B@", ptr %3, align 8, !dbg !241
  notail call preserve_mostcc void @__debase_mark_begin() #5, !dbg !242
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_09ODACPCKC@?$HOIDebug?$CB?6?$AA@")
          to label %5 unwind label %6, !dbg !244

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #5, !dbg !245
  ret void, !dbg !246

6:                                                ; preds = %1
  %7 = cleanuppad within none [], !dbg !244
  call void @__std_terminate() #6 [ "funclet"(token %7) ], !dbg !244
  unreachable, !dbg !244
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local preserve_mostcc void @__debase_mark_begin() #0 comdat !dbg !247 {
  ret void, !dbg !251
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i32 @printf(ptr noundef %0, ...) #1 comdat !dbg !137 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !252, !DIExpression(), !253)
    #dbg_declare(ptr %3, !254, !DIExpression(), !255)
    #dbg_declare(ptr %4, !256, !DIExpression(), !257)
  call void @llvm.va_start.p0(ptr %4), !dbg !258
  %5 = load ptr, ptr %4, align 8, !dbg !259
  %6 = load ptr, ptr %2, align 8, !dbg !259
  %7 = call ptr @__acrt_iob_func(i32 noundef 1), !dbg !259
  %8 = call i32 @_vfprintf_l(ptr noundef %7, ptr noundef %6, ptr noundef null, ptr noundef %5), !dbg !259
  store i32 %8, ptr %3, align 4, !dbg !259
  call void @llvm.va_end.p0(ptr %4), !dbg !260
  %9 = load i32, ptr %3, align 4, !dbg !261
  ret i32 %9, !dbg !261
}

declare dso_local i32 @__CxxFrameHandler3(...)

declare dso_local void @__std_terminate()

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local preserve_mostcc void @__debase_mark_end() #0 comdat !dbg !262 {
  ret void, !dbg !263
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @"?foo@IDebug@@UEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !264 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !265, !DIExpression(), !266)
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !267
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef ptr @"??0Debug@@QEAA@XZ"(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !268 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !278, !DIExpression(), !280)
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @"??0IDebug@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %3), !dbg !281
  store ptr @"??_7Debug@@6B@", ptr %3, align 8, !dbg !281
  notail call preserve_mostcc void @__debase_mark_begin() #5, !dbg !282
  notail call preserve_mostcc void @__debase_mark_end() #5, !dbg !284
  ret ptr %3, !dbg !285
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @"??1Debug@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__CxxFrameHandler3 !dbg !286 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !287, !DIExpression(), !288)
  %3 = load ptr, ptr %2, align 8
  store ptr @"??_7Debug@@6B@", ptr %3, align 8, !dbg !289
  notail call preserve_mostcc void @__debase_mark_begin() #5, !dbg !290
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_08EEFBJGEK@?$HODebug?$CB?6?$AA@")
          to label %5 unwind label %6, !dbg !292

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #5, !dbg !293
  call void @"??1IDebug@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %3) #5, !dbg !294
  ret void, !dbg !295

6:                                                ; preds = %1
  %7 = cleanuppad within none [], !dbg !292
  call void @__std_terminate() #6 [ "funclet"(token %7) ], !dbg !292
  unreachable, !dbg !292
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @"?foo@Debug@@UEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 !dbg !296 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !297, !DIExpression(), !298)
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !299
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_GIDebug@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, i32 noundef %1) unnamed_addr #0 comdat align 2 !dbg !300 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !301, !DIExpression(), !302)
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !303, !DIExpression(), !302)
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1IDebug@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %6) #5, !dbg !304
  %8 = icmp eq i32 %7, 0, !dbg !304
  br i1 %8, label %10, label %9, !dbg !304

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 8) #7, !dbg !304
  br label %10, !dbg !304

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !306
  ret ptr %11, !dbg !306
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_GDebug@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, i32 noundef %1) unnamed_addr #0 comdat align 2 !dbg !307 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !308, !DIExpression(), !309)
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !310, !DIExpression(), !309)
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1Debug@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %6) #5, !dbg !311
  %8 = icmp eq i32 %7, 0, !dbg !311
  br i1 %8, label %10, label %9, !dbg !311

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 8) #7, !dbg !311
  br label %10, !dbg !311

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !313
  ret ptr %11, !dbg !313
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #2

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i32 @_vfprintf_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #1 comdat !dbg !314 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
    #dbg_declare(ptr %5, !322, !DIExpression(), !323)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !324, !DIExpression(), !325)
  store ptr %1, ptr %7, align 8
    #dbg_declare(ptr %7, !326, !DIExpression(), !327)
  store ptr %0, ptr %8, align 8
    #dbg_declare(ptr %8, !328, !DIExpression(), !329)
  %9 = load ptr, ptr %5, align 8, !dbg !330
  %10 = load ptr, ptr %6, align 8, !dbg !330
  %11 = load ptr, ptr %7, align 8, !dbg !330
  %12 = load ptr, ptr %8, align 8, !dbg !330
  %13 = call ptr @__local_stdio_printf_options(), !dbg !330
  %14 = load i64, ptr %13, align 8, !dbg !330
  %15 = call i32 @__stdio_common_vfprintf(i64 noundef %14, ptr noundef %12, ptr noundef %11, ptr noundef %10, ptr noundef %9), !dbg !330
  ret i32 %15, !dbg !330
}

declare dso_local ptr @__acrt_iob_func(i32 noundef) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #2

declare dso_local i32 @__stdio_common_vfprintf(i64 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local ptr @__local_stdio_printf_options() #0 comdat !dbg !15 {
  ret ptr @"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA", !dbg !331
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @"??3@YAXPEAX_K@Z"(ptr noundef, i64 noundef) #4

attributes #0 = { mustprogress noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { builtin nounwind }

!llvm.dbg.cu = !{!21}
!llvm.linker.options = !{!213}
!llvm.module.flags = !{!214, !215, !216, !217, !218, !219}
!llvm.ident = !{!220}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 8, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "Debug.cpp", directory: "C:\\Users\\alex\\Documents\\GitHub\\debase\\examples\\Debug", checksumkind: CSK_MD5, checksum: "44144f8efc92ff2e9ad0336270b47f48")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 10)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 20, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 9)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "_OptionsStorage", scope: !15, file: !16, line: 91, type: !20, isLocal: false, isDefinition: true)
!15 = distinct !DISubprogram(name: "__local_stdio_printf_options", scope: !16, file: !16, line: 89, type: !17, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21)
!16 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_stdio_config.h", directory: "", checksumkind: CSK_MD5, checksum: "dacf907bda504afb0b64f53a242bdae6")
!17 = !DISubroutineType(types: !18)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!21 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "clang version 19.1.0 (D:/a/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !22, imports: !23, splitDebugInlining: false, nameTableKind: None)
!22 = !{!0, !8, !13}
!23 = !{!24, !30, !33, !37, !41, !46, !51, !53, !55, !57, !59, !64, !69, !74, !80, !84, !88, !93, !97, !99, !104, !110, !114, !120, !122, !126, !130, !132, !136, !141, !145, !147, !151, !153, !155, !159, !163, !167, !171, !175, !179, !181, !187, !191, !195, !201, !205, !207, !209}
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !26, file: !29, line: 37)
!25 = !DINamespace(name: "std", scope: null)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mbstatet", file: !27, line: 629, baseType: !28)
!27 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt.h", directory: "", checksumkind: CSK_MD5, checksum: "4ce81db8e96f94c79f8dce86dd46b97f")
!28 = !DICompositeType(tag: DW_TAG_structure_type, name: "_Mbstatet", file: !27, line: 625, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_Mbstatet@@")
!29 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\cstdio", directory: "", checksumkind: CSK_MD5, checksum: "3cbd22e78b41fc5ebf64ee900b20f236")
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !31, file: !29, line: 39)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 193, baseType: !20)
!32 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\vcruntime.h", directory: "", checksumkind: CSK_MD5, checksum: "39da3a8c8438e40538f3964bd55ef6b8")
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !34, file: !29, line: 40)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !35, line: 73, baseType: !36)
!35 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c1a1fbc43e7d45f0ea4ae539ddcffb19")
!36 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !38, file: !29, line: 41)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !39, line: 31, baseType: !40)
!39 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_wstdio.h", directory: "", checksumkind: CSK_MD5, checksum: "bf50373b435d0afd0235dd3e05c4a277")
!40 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !39, line: 28, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_iobuf@@")
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !42, file: !29, line: 42)
!42 = !DISubprogram(name: "clearerr", scope: !35, file: !35, line: 146, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!43 = !DISubroutineType(types: !44)
!44 = !{null, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !47, file: !29, line: 43)
!47 = !DISubprogram(name: "fclose", scope: !35, file: !35, line: 152, type: !48, flags: DIFlagPrototyped, spFlags: 0)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !45}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !52, file: !29, line: 44)
!52 = !DISubprogram(name: "feof", scope: !35, file: !35, line: 166, type: !48, flags: DIFlagPrototyped, spFlags: 0)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !54, file: !29, line: 45)
!54 = !DISubprogram(name: "ferror", scope: !35, file: !35, line: 171, type: !48, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !56, file: !29, line: 46)
!56 = !DISubprogram(name: "fflush", scope: !35, file: !35, line: 176, type: !48, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !58, file: !29, line: 47)
!58 = !DISubprogram(name: "fgetc", scope: !35, file: !35, line: 182, type: !48, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !60, file: !29, line: 48)
!60 = !DISubprogram(name: "fgetpos", scope: !35, file: !35, line: 191, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!61 = !DISubroutineType(types: !62)
!62 = !{!50, !45, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !65, file: !29, line: 49)
!65 = !DISubprogram(name: "fgets", scope: !35, file: !35, line: 198, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !50, !45}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !70, file: !29, line: 50)
!70 = !DISubprogram(name: "fopen", scope: !35, file: !35, line: 213, type: !71, flags: DIFlagPrototyped, spFlags: 0)
!71 = !DISubroutineType(types: !72)
!72 = !{!45, !73, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !75, file: !29, line: 51)
!75 = !DISubprogram(name: "fprintf", scope: !35, file: !35, line: 830, type: !76, flags: DIFlagPrototyped, spFlags: 0)
!76 = !DISubroutineType(types: !77)
!77 = !{!50, !78, !79, null}
!78 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!79 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !73)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !81, file: !29, line: 52)
!81 = !DISubprogram(name: "fputc", scope: !35, file: !35, line: 221, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!82 = !DISubroutineType(types: !83)
!83 = !{!50, !50, !45}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !85, file: !29, line: 53)
!85 = !DISubprogram(name: "fputs", scope: !35, file: !35, line: 233, type: !86, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DISubroutineType(types: !87)
!87 = !{!50, !73, !45}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !89, file: !29, line: 54)
!89 = !DISubprogram(name: "fread", scope: !35, file: !35, line: 239, type: !90, flags: DIFlagPrototyped, spFlags: 0)
!90 = !DISubroutineType(types: !91)
!91 = !{!31, !92, !31, !31, !45}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !94, file: !29, line: 55)
!94 = !DISubprogram(name: "freopen", scope: !35, file: !35, line: 248, type: !95, flags: DIFlagPrototyped, spFlags: 0)
!95 = !DISubroutineType(types: !96)
!96 = !{!45, !73, !73, !45}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !98, file: !29, line: 56)
!98 = !DISubprogram(name: "fscanf", scope: !35, file: !35, line: 1199, type: !76, flags: DIFlagPrototyped, spFlags: 0)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !100, file: !29, line: 57)
!100 = !DISubprogram(name: "fseek", scope: !35, file: !35, line: 270, type: !101, flags: DIFlagPrototyped, spFlags: 0)
!101 = !DISubroutineType(types: !102)
!102 = !{!50, !45, !103, !50}
!103 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !105, file: !29, line: 58)
!105 = !DISubprogram(name: "fsetpos", scope: !35, file: !35, line: 263, type: !106, flags: DIFlagPrototyped, spFlags: 0)
!106 = !DISubroutineType(types: !107)
!107 = !{!50, !45, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !111, file: !29, line: 59)
!111 = !DISubprogram(name: "ftell", scope: !35, file: !35, line: 286, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DISubroutineType(types: !113)
!113 = !{!103, !45}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !115, file: !29, line: 60)
!115 = !DISubprogram(name: "fwrite", scope: !35, file: !35, line: 297, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DISubroutineType(types: !117)
!117 = !{!31, !118, !31, !31, !45}
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !121, file: !29, line: 61)
!121 = !DISubprogram(name: "getc", scope: !35, file: !35, line: 306, type: !48, flags: DIFlagPrototyped, spFlags: 0)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !123, file: !29, line: 62)
!123 = !DISubprogram(name: "getchar", scope: !35, file: !35, line: 311, type: !124, flags: DIFlagPrototyped, spFlags: 0)
!124 = !DISubroutineType(types: !125)
!125 = !{!50}
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !127, file: !29, line: 63)
!127 = !DISubprogram(name: "perror", scope: !35, file: !35, line: 325, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!128 = !DISubroutineType(types: !129)
!129 = !{null, !73}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !131, file: !29, line: 64)
!131 = !DISubprogram(name: "putc", scope: !35, file: !35, line: 347, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !133, file: !29, line: 65)
!133 = !DISubprogram(name: "putchar", scope: !35, file: !35, line: 353, type: !134, flags: DIFlagPrototyped, spFlags: 0)
!134 = !DISubroutineType(types: !135)
!135 = !{!50, !50}
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !137, file: !29, line: 66)
!137 = distinct !DISubprogram(name: "printf", scope: !35, file: !35, line: 950, type: !138, scopeLine: 956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !140)
!138 = !DISubroutineType(types: !139)
!139 = !{!50, !79, null}
!140 = !{}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !142, file: !29, line: 67)
!142 = !DISubprogram(name: "puts", scope: !35, file: !35, line: 358, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!143 = !DISubroutineType(types: !144)
!144 = !{!50, !73}
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !146, file: !29, line: 68)
!146 = !DISubprogram(name: "remove", scope: !35, file: !35, line: 369, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !148, file: !29, line: 69)
!148 = !DISubprogram(name: "rename", scope: !35, file: !35, line: 374, type: !149, flags: DIFlagPrototyped, spFlags: 0)
!149 = !DISubroutineType(types: !150)
!150 = !{!50, !73, !73}
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !152, file: !29, line: 70)
!152 = !DISubprogram(name: "rewind", scope: !35, file: !35, line: 392, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !154, file: !29, line: 71)
!154 = !DISubprogram(name: "scanf", scope: !35, file: !35, line: 1276, type: !138, flags: DIFlagPrototyped, spFlags: 0)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !156, file: !29, line: 72)
!156 = !DISubprogram(name: "setbuf", scope: !35, file: !35, line: 400, type: !157, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DISubroutineType(types: !158)
!158 = !{null, !45, !68}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !160, file: !29, line: 73)
!160 = !DISubprogram(name: "setvbuf", scope: !35, file: !35, line: 412, type: !161, flags: DIFlagPrototyped, spFlags: 0)
!161 = !DISubroutineType(types: !162)
!162 = !{!50, !45, !68, !50, !31}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !164, file: !29, line: 74)
!164 = !DISubprogram(name: "sprintf", scope: !35, file: !35, line: 1783, type: !165, flags: DIFlagPrototyped, spFlags: 0)
!165 = !DISubroutineType(types: !166)
!166 = !{!50, !68, !73, null}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !168, file: !29, line: 75)
!168 = !DISubprogram(name: "sscanf", scope: !35, file: !35, line: 2240, type: !169, flags: DIFlagPrototyped, spFlags: 0)
!169 = !DISubroutineType(types: !170)
!170 = !{!50, !79, !79, null}
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !172, file: !29, line: 76)
!172 = !DISubprogram(name: "tmpfile", scope: !35, file: !35, line: 435, type: !173, flags: DIFlagPrototyped, spFlags: 0)
!173 = !DISubroutineType(types: !174)
!174 = !{!45}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !176, file: !29, line: 77)
!176 = !DISubprogram(name: "tmpnam", scope: !35, file: !35, line: 443, type: !177, flags: DIFlagPrototyped, spFlags: 0)
!177 = !DISubroutineType(types: !178)
!178 = !{!68, !68}
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !180, file: !29, line: 78)
!180 = !DISubprogram(name: "ungetc", scope: !35, file: !35, line: 451, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !182, file: !29, line: 79)
!182 = !DISubprogram(name: "vfprintf", scope: !35, file: !35, line: 650, type: !183, flags: DIFlagPrototyped, spFlags: 0)
!183 = !DISubroutineType(types: !184)
!184 = !{!50, !78, !79, !185}
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !186, line: 72, baseType: !68)
!186 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\vadefs.h", directory: "", checksumkind: CSK_MD5, checksum: "a4b8f96637d0704c82f39ecb6bde2ab4")
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !188, file: !29, line: 80)
!188 = !DISubprogram(name: "vprintf", scope: !35, file: !35, line: 740, type: !189, flags: DIFlagPrototyped, spFlags: 0)
!189 = !DISubroutineType(types: !190)
!190 = !{!50, !79, !185}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !192, file: !29, line: 81)
!192 = !DISubprogram(name: "vsprintf", scope: !35, file: !35, line: 1783, type: !193, flags: DIFlagPrototyped, spFlags: 0)
!193 = !DISubroutineType(types: !194)
!194 = !{!50, !68, !73, !185}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !196, file: !29, line: 83)
!196 = !DISubprogram(name: "snprintf", scope: !35, file: !35, line: 1919, type: !197, flags: DIFlagPrototyped, spFlags: 0)
!197 = !DISubroutineType(types: !198)
!198 = !{!50, !199, !200, !79, null}
!199 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !68)
!200 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !202, file: !29, line: 84)
!202 = !DISubprogram(name: "vsnprintf", scope: !35, file: !35, line: 1429, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!203 = !DISubroutineType(types: !204)
!204 = !{!50, !199, !200, !79, !185}
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !206, file: !29, line: 85)
!206 = !DISubprogram(name: "vfscanf", scope: !35, file: !35, line: 1072, type: !183, flags: DIFlagPrototyped, spFlags: 0)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !208, file: !29, line: 86)
!208 = !DISubprogram(name: "vscanf", scope: !35, file: !35, line: 1136, type: !189, flags: DIFlagPrototyped, spFlags: 0)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !25, entity: !210, file: !29, line: 87)
!210 = !DISubprogram(name: "vsscanf", scope: !35, file: !35, line: 2160, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!211 = !DISubroutineType(types: !212)
!212 = !{!50, !79, !79, !185}
!213 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!214 = !{i32 2, !"CodeView", i32 1}
!215 = !{i32 2, !"Debug Info Version", i32 3}
!216 = !{i32 1, !"wchar_size", i32 2}
!217 = !{i32 8, !"PIC Level", i32 2}
!218 = !{i32 7, !"uwtable", i32 2}
!219 = !{i32 1, !"MaxTLSAlign", i32 65536}
!220 = !{!"clang version 19.1.0 (D:/a/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"}
!221 = distinct !DISubprogram(name: "IDebug", linkageName: "??0IDebug@@QEAA@XZ", scope: !222, file: !2, line: 5, type: !229, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, declaration: !228, retainedNodes: !140)
!222 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "IDebug", file: !223, line: 3, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !224, vtableHolder: !222, identifier: ".?AVIDebug@@")
!223 = !DIFile(filename: ".\\Debug.hpp", directory: "C:\\Users\\alex\\Documents\\GitHub\\debase\\examples\\Debug", checksumkind: CSK_MD5, checksum: "210acdcd0a52fb32a915eba7efbfa22d")
!224 = !{!225, !226, !228, !232, !233}
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: null, size: 128)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$IDebug", scope: !223, file: !223, baseType: !227, size: 64, flags: DIFlagArtificial)
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!228 = !DISubprogram(name: "IDebug", scope: !222, file: !223, line: 5, type: !229, scopeLine: 5, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!229 = !DISubroutineType(types: !230)
!230 = !{null, !231}
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!232 = !DISubprogram(name: "~IDebug", scope: !222, file: !223, line: 6, type: !229, scopeLine: 6, containingType: !222, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual)
!233 = !DISubprogram(name: "foo", linkageName: "?foo@IDebug@@UEAAXXZ", scope: !222, file: !223, line: 7, type: !229, scopeLine: 7, containingType: !222, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual)
!234 = !DILocalVariable(name: "this", arg: 1, scope: !221, type: !235, flags: DIFlagArtificial | DIFlagObjectPointer)
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!236 = !DILocation(line: 0, scope: !221)
!237 = !DILocation(line: 5, scope: !221)
!238 = distinct !DISubprogram(name: "~IDebug", linkageName: "??1IDebug@@UEAA@XZ", scope: !222, file: !2, line: 6, type: !229, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, declaration: !232, retainedNodes: !140)
!239 = !DILocalVariable(name: "this", arg: 1, scope: !238, type: !235, flags: DIFlagArtificial | DIFlagObjectPointer)
!240 = !DILocation(line: 0, scope: !238)
!241 = !DILocation(line: 6, scope: !238)
!242 = !DILocation(line: 7, scope: !243)
!243 = distinct !DILexicalBlock(scope: !238, file: !2, line: 6)
!244 = !DILocation(line: 8, scope: !243)
!245 = !DILocation(line: 9, scope: !243)
!246 = !DILocation(line: 10, scope: !238)
!247 = distinct !DISubprogram(name: "__debase_mark_begin", scope: !248, file: !248, line: 31, type: !249, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21)
!248 = !DIFile(filename: "../../runtime\\debase/Annotations.hpp", directory: "C:\\Users\\alex\\Documents\\GitHub\\debase\\examples\\Debug", checksumkind: CSK_MD5, checksum: "36b3100a39ce917682769fff5b3d4fed")
!249 = !DISubroutineType(cc: DW_CC_LLVM_PreserveMost, types: !250)
!250 = !{null}
!251 = !DILocation(line: 31, scope: !247)
!252 = !DILocalVariable(name: "_Format", arg: 1, scope: !137, file: !35, line: 951, type: !79)
!253 = !DILocation(line: 951, scope: !137)
!254 = !DILocalVariable(name: "_Result", scope: !137, file: !35, line: 957, type: !50)
!255 = !DILocation(line: 957, scope: !137)
!256 = !DILocalVariable(name: "_ArgList", scope: !137, file: !35, line: 958, type: !185)
!257 = !DILocation(line: 958, scope: !137)
!258 = !DILocation(line: 959, scope: !137)
!259 = !DILocation(line: 960, scope: !137)
!260 = !DILocation(line: 961, scope: !137)
!261 = !DILocation(line: 962, scope: !137)
!262 = distinct !DISubprogram(name: "__debase_mark_end", scope: !248, file: !248, line: 33, type: !249, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21)
!263 = !DILocation(line: 33, scope: !262)
!264 = distinct !DISubprogram(name: "foo", linkageName: "?foo@IDebug@@UEAAXXZ", scope: !222, file: !2, line: 11, type: !229, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, declaration: !233, retainedNodes: !140)
!265 = !DILocalVariable(name: "this", arg: 1, scope: !264, type: !235, flags: DIFlagArtificial | DIFlagObjectPointer)
!266 = !DILocation(line: 0, scope: !264)
!267 = !DILocation(line: 11, scope: !264)
!268 = distinct !DISubprogram(name: "Debug", linkageName: "??0Debug@@QEAA@XZ", scope: !269, file: !2, line: 13, type: !273, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, declaration: !272, retainedNodes: !140)
!269 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Debug", file: !223, line: 10, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !270, vtableHolder: !222, identifier: ".?AVDebug@@")
!270 = !{!271, !225, !272, !276, !277}
!271 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !269, baseType: !222, flags: DIFlagPublic, extraData: i32 0)
!272 = !DISubprogram(name: "Debug", scope: !269, file: !223, line: 12, type: !273, scopeLine: 12, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!273 = !DISubroutineType(types: !274)
!274 = !{null, !275}
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!276 = !DISubprogram(name: "~Debug", scope: !269, file: !223, line: 13, type: !273, scopeLine: 13, containingType: !269, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagVirtual)
!277 = !DISubprogram(name: "foo", linkageName: "?foo@Debug@@UEAAXXZ", scope: !269, file: !223, line: 14, type: !273, scopeLine: 14, containingType: !269, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagVirtual)
!278 = !DILocalVariable(name: "this", arg: 1, scope: !268, type: !279, flags: DIFlagArtificial | DIFlagObjectPointer)
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!280 = !DILocation(line: 0, scope: !268)
!281 = !DILocation(line: 13, scope: !268)
!282 = !DILocation(line: 14, scope: !283)
!283 = distinct !DILexicalBlock(scope: !268, file: !2, line: 13)
!284 = !DILocation(line: 16, scope: !283)
!285 = !DILocation(line: 17, scope: !268)
!286 = distinct !DISubprogram(name: "~Debug", linkageName: "??1Debug@@UEAA@XZ", scope: !269, file: !2, line: 18, type: !273, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, declaration: !276, retainedNodes: !140)
!287 = !DILocalVariable(name: "this", arg: 1, scope: !286, type: !279, flags: DIFlagArtificial | DIFlagObjectPointer)
!288 = !DILocation(line: 0, scope: !286)
!289 = !DILocation(line: 18, scope: !286)
!290 = !DILocation(line: 19, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !2, line: 18)
!292 = !DILocation(line: 20, scope: !291)
!293 = !DILocation(line: 21, scope: !291)
!294 = !DILocation(line: 22, scope: !291)
!295 = !DILocation(line: 22, scope: !286)
!296 = distinct !DISubprogram(name: "foo", linkageName: "?foo@Debug@@UEAAXXZ", scope: !269, file: !2, line: 23, type: !273, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, declaration: !277, retainedNodes: !140)
!297 = !DILocalVariable(name: "this", arg: 1, scope: !296, type: !279, flags: DIFlagArtificial | DIFlagObjectPointer)
!298 = !DILocation(line: 0, scope: !296)
!299 = !DILocation(line: 23, scope: !296)
!300 = distinct !DISubprogram(name: "~IDebug", linkageName: "??_GIDebug@@UEAAPEAXI@Z", scope: !222, file: !223, line: 6, type: !229, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, declaration: !232, retainedNodes: !140)
!301 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !300, type: !50, flags: DIFlagArtificial)
!302 = !DILocation(line: 0, scope: !300)
!303 = !DILocalVariable(name: "this", arg: 1, scope: !300, type: !235, flags: DIFlagArtificial | DIFlagObjectPointer)
!304 = !DILocation(line: 6, scope: !305)
!305 = !DILexicalBlockFile(scope: !300, file: !2, discriminator: 0)
!306 = !DILocation(line: 10, scope: !305)
!307 = distinct !DISubprogram(name: "~Debug", linkageName: "??_GDebug@@UEAAPEAXI@Z", scope: !269, file: !223, line: 13, type: !273, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, declaration: !276, retainedNodes: !140)
!308 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !307, type: !50, flags: DIFlagArtificial)
!309 = !DILocation(line: 0, scope: !307)
!310 = !DILocalVariable(name: "this", arg: 1, scope: !307, type: !279, flags: DIFlagArtificial | DIFlagObjectPointer)
!311 = !DILocation(line: 18, scope: !312)
!312 = !DILexicalBlockFile(scope: !307, file: !2, discriminator: 0)
!313 = !DILocation(line: 22, scope: !312)
!314 = distinct !DISubprogram(name: "_vfprintf_l", scope: !35, file: !35, line: 635, type: !315, scopeLine: 644, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !21, retainedNodes: !140)
!315 = !DISubroutineType(types: !316)
!316 = !{!50, !78, !79, !317, !185}
!317 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !318)
!318 = !DIDerivedType(tag: DW_TAG_typedef, name: "_locale_t", file: !27, line: 623, baseType: !319)
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_typedef, name: "__crt_locale_pointers", file: !27, line: 621, baseType: !321)
!321 = !DICompositeType(tag: DW_TAG_structure_type, name: "__crt_locale_pointers", file: !27, line: 617, size: 128, flags: DIFlagFwdDecl, identifier: ".?AU__crt_locale_pointers@@")
!322 = !DILocalVariable(name: "_ArgList", arg: 4, scope: !314, file: !35, line: 639, type: !185)
!323 = !DILocation(line: 639, scope: !314)
!324 = !DILocalVariable(name: "_Locale", arg: 3, scope: !314, file: !35, line: 638, type: !317)
!325 = !DILocation(line: 638, scope: !314)
!326 = !DILocalVariable(name: "_Format", arg: 2, scope: !314, file: !35, line: 637, type: !79)
!327 = !DILocation(line: 637, scope: !314)
!328 = !DILocalVariable(name: "_Stream", arg: 1, scope: !314, file: !35, line: 636, type: !78)
!329 = !DILocation(line: 636, scope: !314)
!330 = !DILocation(line: 645, scope: !314)
!331 = !DILocation(line: 92, scope: !15)
