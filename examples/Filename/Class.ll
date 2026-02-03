; ModuleID = 'Class.cpp'
; CommandLine = 'clang++ -I../../runtime -O0 -g -S -emit-llvm -Xclang -disable-llvm-passes Class.cpp -o Class.ll'
source_filename = "Class.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

$_ZN6IClassC2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZTS6IClass = comdat any

$_ZTI6IClass = comdat any

$_ZTS5Class = comdat any

$_ZTI5Class = comdat any

$_ZTS6ClassX = comdat any

$_ZTI6ClassX = comdat any

$_ZTSN1x5ClassE = comdat any

$_ZTIN1x5ClassE = comdat any

@_ZTV5Class = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI5Class, ptr @_ZN5ClassD1Ev, ptr @_ZN5ClassD0Ev] }, align 8
@.str = private unnamed_addr constant [8 x i8] c"Class!\0A\00", align 1, !dbg !0
@_ZTV6ClassX = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI6ClassX, ptr @_ZN6ClassXD1Ev, ptr @_ZN6ClassXD0Ev] }, align 8
@.str.1 = private unnamed_addr constant [9 x i8] c"ClassX!\0A\00", align 1, !dbg !8
@_ZTVN1x5ClassE = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTIN1x5ClassE, ptr @_ZN1x5ClassD1Ev, ptr @_ZN1x5ClassD0Ev] }, align 8
@.str.2 = private unnamed_addr constant [11 x i8] c"x::Class!\0A\00", align 1, !dbg !13
@_ZTV6IClass = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI6IClass, ptr @_ZN6IClassD1Ev, ptr @_ZN6IClassD0Ev] }, align 8
@.str.3 = private unnamed_addr constant [10 x i8] c"~IClass!\0A\00", align 1, !dbg !18
@.str.4 = private unnamed_addr constant [9 x i8] c"~Class!\0A\00", align 1, !dbg !23
@.str.5 = private unnamed_addr constant [10 x i8] c"~ClassX!\0A\00", align 1, !dbg !25
@.str.6 = private unnamed_addr constant [12 x i8] c"~x::Class!\0A\00", align 1, !dbg !27
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTS6IClass = linkonce_odr dso_local constant [8 x i8] c"6IClass\00", comdat, align 1
@_ZTI6IClass = linkonce_odr dso_local constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTS6IClass }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTS5Class = linkonce_odr dso_local constant [7 x i8] c"5Class\00", comdat, align 1
@_ZTI5Class = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5Class, ptr @_ZTI6IClass }, comdat, align 8
@_ZTS6ClassX = linkonce_odr dso_local constant [8 x i8] c"6ClassX\00", comdat, align 1
@_ZTI6ClassX = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS6ClassX, ptr @_ZTI5Class }, comdat, align 8
@_ZTSN1x5ClassE = linkonce_odr dso_local constant [11 x i8] c"N1x5ClassE\00", comdat, align 1
@_ZTIN1x5ClassE = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSN1x5ClassE, ptr @_ZTI6IClass }, comdat, align 8

@_ZN5ClassC1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN5ClassC2Ev
@_ZN6ClassXC1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN6ClassXC2Ev
@_ZN1x5ClassC1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1x5ClassC2Ev
@_ZN6IClassD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN6IClassD2Ev
@_ZN5ClassD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN5ClassD2Ev
@_ZN6ClassXD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN6ClassXD2Ev
@_ZN1x5ClassD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1x5ClassD2Ev

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN5ClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !235 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !256, metadata !DIExpression()), !dbg !258
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 0, !dbg !259
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 8, i1 false), !dbg !259
  call void @_ZN6IClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #8, !dbg !259
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV5Class, i32 0, inrange i32 0, i32 2), ptr %5, align 8, !dbg !260
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !261
  %7 = invoke i32 (ptr, ...) @printf(ptr noundef @.str)
          to label %8 unwind label %9, !dbg !263

8:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !264
  ret void, !dbg !265

9:                                                ; preds = %1
  %10 = landingpad { ptr, i32 }
          cleanup, !dbg !266
  %11 = extractvalue { ptr, i32 } %10, 0, !dbg !266
  store ptr %11, ptr %3, align 8, !dbg !266
  %12 = extractvalue { ptr, i32 } %10, 1, !dbg !266
  store i32 %12, ptr %4, align 4, !dbg !266
  call void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #8, !dbg !266
  br label %13, !dbg !266

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8, !dbg !266
  %15 = load i32, ptr %4, align 4, !dbg !266
  %16 = insertvalue { ptr, i32 } poison, ptr %14, 0, !dbg !266
  %17 = insertvalue { ptr, i32 } %16, i32 %15, 1, !dbg !266
  resume { ptr, i32 } %17, !dbg !266
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN6IClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 comdat align 2 !dbg !267 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !268, metadata !DIExpression()), !dbg !270
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV6IClass, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !271
  ret void, !dbg !271
}

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_begin() #4

declare dso_local i32 @printf(ptr noundef, ...) #5

declare dso_local i32 @__gxx_personality_seh0(...)

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_end() #4

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !272 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !273, metadata !DIExpression()), !dbg !274
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV6IClass, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !275
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.3)
          to label %5 unwind label %6, !dbg !276

5:                                                ; preds = %1
  ret void, !dbg !278

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !276
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !276
  call void @__clang_call_terminate(ptr %8) #9, !dbg !276
  unreachable, !dbg !276
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN6ClassXC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !279 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !288, metadata !DIExpression()), !dbg !290
  %5 = load ptr, ptr %2, align 8
  call void @_ZN5ClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !291
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV6ClassX, i32 0, inrange i32 0, i32 2), ptr %5, align 8, !dbg !292
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !293
  %6 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.1)
          to label %7 unwind label %8, !dbg !295

7:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !296
  ret void, !dbg !297

8:                                                ; preds = %1
  %9 = landingpad { ptr, i32 }
          cleanup, !dbg !298
  %10 = extractvalue { ptr, i32 } %9, 0, !dbg !298
  store ptr %10, ptr %3, align 8, !dbg !298
  %11 = extractvalue { ptr, i32 } %9, 1, !dbg !298
  store i32 %11, ptr %4, align 4, !dbg !298
  call void @_ZN5ClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #8, !dbg !298
  br label %12, !dbg !298

12:                                               ; preds = %8
  %13 = load ptr, ptr %3, align 8, !dbg !298
  %14 = load i32, ptr %4, align 4, !dbg !298
  %15 = insertvalue { ptr, i32 } poison, ptr %13, 0, !dbg !298
  %16 = insertvalue { ptr, i32 } %15, i32 %14, 1, !dbg !298
  resume { ptr, i32 } %16, !dbg !298
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN5ClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !299 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !300, metadata !DIExpression()), !dbg !301
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV5Class, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !302
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !303
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.4)
          to label %5 unwind label %6, !dbg !305

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !306
  call void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !307
  ret void, !dbg !308

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !305
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !305
  call void @__clang_call_terminate(ptr %8) #9, !dbg !305
  unreachable, !dbg !305
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN1x5ClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !309 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !319, metadata !DIExpression()), !dbg !321
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 0, !dbg !322
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 8, i1 false), !dbg !322
  call void @_ZN6IClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #8, !dbg !322
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTVN1x5ClassE, i32 0, inrange i32 0, i32 2), ptr %5, align 8, !dbg !323
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !324
  %7 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.2)
          to label %8 unwind label %9, !dbg !326

8:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !327
  ret void, !dbg !328

9:                                                ; preds = %1
  %10 = landingpad { ptr, i32 }
          cleanup, !dbg !329
  %11 = extractvalue { ptr, i32 } %10, 0, !dbg !329
  store ptr %11, ptr %3, align 8, !dbg !329
  %12 = extractvalue { ptr, i32 } %10, 1, !dbg !329
  store i32 %12, ptr %4, align 4, !dbg !329
  call void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #8, !dbg !329
  br label %13, !dbg !329

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8, !dbg !329
  %15 = load i32, ptr %4, align 4, !dbg !329
  %16 = insertvalue { ptr, i32 } poison, ptr %14, 0, !dbg !329
  %17 = insertvalue { ptr, i32 } %16, i32 %15, 1, !dbg !329
  resume { ptr, i32 } %17, !dbg !329
}

; Function Attrs: noinline noreturn nounwind uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #6 comdat {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #8
  call void @_ZSt9terminatev() #9
  unreachable
}

declare dso_local ptr @__cxa_begin_catch(ptr)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN6IClassD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !330 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !331, metadata !DIExpression()), !dbg !332
  %3 = load ptr, ptr %2, align 8
  call void @_ZN6IClassD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !333
  call void @_ZdlPv(ptr noundef %3) #10, !dbg !333
  ret void, !dbg !334
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(ptr noundef) #7

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN5ClassD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !335 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !336, metadata !DIExpression()), !dbg !337
  %3 = load ptr, ptr %2, align 8
  call void @_ZN5ClassD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !338
  call void @_ZdlPv(ptr noundef %3) #10, !dbg !338
  ret void, !dbg !339
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN6ClassXD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !340 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !341, metadata !DIExpression()), !dbg !342
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV6ClassX, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !343
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !344
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.5)
          to label %5 unwind label %6, !dbg !346

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !347
  call void @_ZN5ClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !348
  ret void, !dbg !349

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !346
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !346
  call void @__clang_call_terminate(ptr %8) #9, !dbg !346
  unreachable, !dbg !346
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN6ClassXD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !350 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !351, metadata !DIExpression()), !dbg !352
  %3 = load ptr, ptr %2, align 8
  call void @_ZN6ClassXD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !353
  call void @_ZdlPv(ptr noundef %3) #10, !dbg !353
  ret void, !dbg !354
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1x5ClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !355 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !356, metadata !DIExpression()), !dbg !357
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTVN1x5ClassE, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !358
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !359
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.6)
          to label %5 unwind label %6, !dbg !361

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !362
  call void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !363
  ret void, !dbg !364

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !361
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !361
  call void @__clang_call_terminate(ptr %8) #9, !dbg !361
  unreachable, !dbg !361
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1x5ClassD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !365 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !366, metadata !DIExpression()), !dbg !367
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1x5ClassD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !368
  call void @_ZdlPv(ptr noundef %3) #10, !dbg !368
  ret void, !dbg !369
}

attributes #0 = { mustprogress noinline optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { mustprogress noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noinline noreturn nounwind uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { builtin nounwind }

!llvm.dbg.cu = !{!32}
!llvm.module.flags = !{!228, !229, !230, !231, !232, !233}
!llvm.ident = !{!234}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "Class.cpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Filename")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 8)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 20, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 9)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 26, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 11)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(scope: null, file: !2, line: 37, type: !20, isLocal: true, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(scope: null, file: !2, line: 42, type: !10, isLocal: true, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(scope: null, file: !2, line: 48, type: !20, isLocal: true, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !2, line: 54, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 12)
!32 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "clang version 18.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !33, imports: !34, splitDebugInlining: false, nameTableKind: None)
!33 = !{!0, !8, !13, !18, !23, !25, !27}
!34 = !{!35, !42, !45, !49, !55, !57, !64, !68, !74, !76, !80, !84, !88, !96, !100, !104, !108, !112, !114, !118, !122, !126, !128, !130, !132, !138, !145, !151, !156, !162, !166, !170, !172, !174, !176, !180, !184, !188, !192, !196, !200, !204, !208, !212, !216, !218, !222, !224}
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !38, file: !41, line: 117)
!36 = !DINamespace(name: "__1", scope: !37, exportSymbols: true)
!37 = !DINamespace(name: "std", scope: null)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !39, line: 47, baseType: !40)
!39 = !DIFile(filename: "C:/msys64/clang64/include/stdio.h", directory: "")
!40 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !39, line: 33, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS6_iobuf")
!41 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cstdio", directory: "")
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !43, file: !41, line: 118)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !39, line: 112, baseType: !44)
!44 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !46, file: !41, line: 119)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 35, baseType: !48)
!47 = !DIFile(filename: "C:/msys64/clang64/include/corecrt.h", directory: "")
!48 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !50, file: !41, line: 121)
!50 = !DISubprogram(name: "fclose", scope: !39, file: !39, line: 525, type: !51, flags: DIFlagPrototyped, spFlags: 0)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !56, file: !41, line: 122)
!56 = !DISubprogram(name: "fflush", scope: !39, file: !39, line: 534, type: !51, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !58, file: !41, line: 123)
!58 = !DISubprogram(name: "setbuf", scope: !39, file: !39, line: 631, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !61, !62}
!61 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !54)
!62 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !65, file: !41, line: 124)
!65 = !DISubprogram(name: "setvbuf", scope: !39, file: !39, line: 635, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!66 = !DISubroutineType(types: !67)
!67 = !{!53, !61, !62, !53, !46}
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !69, file: !41, line: 125)
!69 = !DISubprogram(name: "fprintf", scope: !39, file: !39, line: 418, type: !70, flags: DIFlagPrototyped, spFlags: 0)
!70 = !DISubroutineType(types: !71)
!71 = !{!53, !61, !72, null}
!72 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !73)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !75, file: !41, line: 126)
!75 = !DISubprogram(name: "fscanf", scope: !39, file: !39, line: 433, type: !70, flags: DIFlagPrototyped, spFlags: 0)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !77, file: !41, line: 127)
!77 = !DISubprogram(name: "snprintf", scope: !39, file: !39, line: 719, type: !78, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DISubroutineType(types: !79)
!79 = !{!53, !62, !46, !72, null}
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !81, file: !41, line: 128)
!81 = !DISubprogram(name: "sprintf", scope: !39, file: !39, line: 422, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!82 = !DISubroutineType(types: !83)
!83 = !{!53, !62, !72, null}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !85, file: !41, line: 129)
!85 = !DISubprogram(name: "sscanf", scope: !39, file: !39, line: 439, type: !86, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DISubroutineType(types: !87)
!87 = !{!53, !72, !72, null}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !89, file: !41, line: 130)
!89 = !DISubprogram(name: "vfprintf", scope: !39, file: !39, line: 425, type: !90, flags: DIFlagPrototyped, spFlags: 0)
!90 = !DISubroutineType(types: !91)
!91 = !{!53, !61, !72, !92}
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !93, line: 31, baseType: !94)
!93 = !DIFile(filename: "C:/msys64/clang64/include/vadefs.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !93, line: 24, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2, baseType: !63)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !97, file: !41, line: 131)
!97 = !DISubprogram(name: "vfscanf", scope: !39, file: !39, line: 448, type: !98, flags: DIFlagPrototyped, spFlags: 0)
!98 = !DISubroutineType(types: !99)
!99 = !{!53, !54, !73, !95}
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !101, file: !41, line: 132)
!101 = !DISubprogram(name: "vsscanf", scope: !39, file: !39, line: 451, type: !102, flags: DIFlagPrototyped, spFlags: 0)
!102 = !DISubroutineType(types: !103)
!103 = !{!53, !72, !72, !95}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !105, file: !41, line: 133)
!105 = !DISubprogram(name: "vsnprintf", scope: !39, file: !39, line: 716, type: !106, flags: DIFlagPrototyped, spFlags: 0)
!106 = !DISubroutineType(types: !107)
!107 = !{!53, !62, !46, !72, !92}
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !109, file: !41, line: 134)
!109 = !DISubprogram(name: "vsprintf", scope: !39, file: !39, line: 429, type: !110, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DISubroutineType(types: !111)
!111 = !{!53, !62, !72, !92}
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !113, file: !41, line: 135)
!113 = !DISubprogram(name: "fgetc", scope: !39, file: !39, line: 535, type: !51, flags: DIFlagPrototyped, spFlags: 0)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !115, file: !41, line: 136)
!115 = !DISubprogram(name: "fgets", scope: !39, file: !39, line: 539, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DISubroutineType(types: !117)
!117 = !{!63, !62, !53, !61}
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !119, file: !41, line: 137)
!119 = !DISubprogram(name: "fputc", scope: !39, file: !39, line: 548, type: !120, flags: DIFlagPrototyped, spFlags: 0)
!120 = !DISubroutineType(types: !121)
!121 = !{!53, !53, !54}
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !123, file: !41, line: 138)
!123 = !DISubprogram(name: "fputs", scope: !39, file: !39, line: 550, type: !124, flags: DIFlagPrototyped, spFlags: 0)
!124 = !DISubroutineType(types: !125)
!125 = !{!53, !72, !61}
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !127, file: !41, line: 139)
!127 = !DISubprogram(name: "getc", scope: !39, file: !39, line: 598, type: !51, flags: DIFlagPrototyped, spFlags: 0)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !129, file: !41, line: 140)
!129 = !DISubprogram(name: "putc", scope: !39, file: !39, line: 616, type: !120, flags: DIFlagPrototyped, spFlags: 0)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !131, file: !41, line: 141)
!131 = !DISubprogram(name: "ungetc", scope: !39, file: !39, line: 654, type: !120, flags: DIFlagPrototyped, spFlags: 0)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !133, file: !41, line: 142)
!133 = !DISubprogram(name: "fread", scope: !39, file: !39, line: 551, type: !134, flags: DIFlagPrototyped, spFlags: 0)
!134 = !DISubroutineType(types: !135)
!135 = !{!46, !136, !46, !46, !61}
!136 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !137)
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !139, file: !41, line: 143)
!139 = !DISubprogram(name: "fwrite", scope: !39, file: !39, line: 597, type: !140, flags: DIFlagPrototyped, spFlags: 0)
!140 = !DISubroutineType(types: !141)
!141 = !{!46, !142, !46, !46, !61}
!142 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !143)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !146, file: !41, line: 144)
!146 = !DISubprogram(name: "fgetpos", scope: !39, file: !39, line: 537, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!147 = !DISubroutineType(types: !148)
!148 = !{!53, !61, !149}
!149 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !150)
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !152, file: !41, line: 145)
!152 = !DISubprogram(name: "fseek", scope: !39, file: !39, line: 555, type: !153, flags: DIFlagPrototyped, spFlags: 0)
!153 = !DISubroutineType(types: !154)
!154 = !{!53, !54, !155, !53}
!155 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !157, file: !41, line: 146)
!157 = !DISubprogram(name: "fsetpos", scope: !39, file: !39, line: 553, type: !158, flags: DIFlagPrototyped, spFlags: 0)
!158 = !DISubroutineType(types: !159)
!159 = !{!53, !54, !160}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!161 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !43)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !163, file: !41, line: 147)
!163 = !DISubprogram(name: "ftell", scope: !39, file: !39, line: 556, type: !164, flags: DIFlagPrototyped, spFlags: 0)
!164 = !DISubroutineType(types: !165)
!165 = !{!155, !54}
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !167, file: !41, line: 148)
!167 = !DISubprogram(name: "rewind", scope: !39, file: !39, line: 629, type: !168, flags: DIFlagPrototyped, spFlags: 0)
!168 = !DISubroutineType(types: !169)
!169 = !{null, !54}
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !171, file: !41, line: 149)
!171 = !DISubprogram(name: "clearerr", scope: !39, file: !39, line: 524, type: !168, flags: DIFlagPrototyped, spFlags: 0)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !173, file: !41, line: 150)
!173 = !DISubprogram(name: "feof", scope: !39, file: !39, line: 532, type: !51, flags: DIFlagPrototyped, spFlags: 0)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !175, file: !41, line: 151)
!175 = !DISubprogram(name: "ferror", scope: !39, file: !39, line: 533, type: !51, flags: DIFlagPrototyped, spFlags: 0)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !177, file: !41, line: 152)
!177 = !DISubprogram(name: "perror", scope: !39, file: !39, line: 606, type: !178, flags: DIFlagPrototyped, spFlags: 0)
!178 = !DISubroutineType(types: !179)
!179 = !{null, !73}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !181, file: !41, line: 154)
!181 = !DISubprogram(name: "fopen", scope: !39, file: !39, line: 546, type: !182, flags: DIFlagPrototyped, spFlags: 0)
!182 = !DISubroutineType(types: !183)
!183 = !{!54, !72, !72}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !185, file: !41, line: 155)
!185 = !DISubprogram(name: "freopen", scope: !39, file: !39, line: 552, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!186 = !DISubroutineType(types: !187)
!187 = !{!54, !72, !72, !61}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !189, file: !41, line: 156)
!189 = !DISubprogram(name: "remove", scope: !39, file: !39, line: 622, type: !190, flags: DIFlagPrototyped, spFlags: 0)
!190 = !DISubroutineType(types: !191)
!191 = !{!53, !73}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !193, file: !41, line: 157)
!193 = !DISubprogram(name: "rename", scope: !39, file: !39, line: 623, type: !194, flags: DIFlagPrototyped, spFlags: 0)
!194 = !DISubroutineType(types: !195)
!195 = !{!53, !73, !73}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !197, file: !41, line: 158)
!197 = !DISubprogram(name: "tmpfile", scope: !39, file: !39, line: 652, type: !198, flags: DIFlagPrototyped, spFlags: 0)
!198 = !DISubroutineType(types: !199)
!199 = !{!54}
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !201, file: !41, line: 159)
!201 = !DISubprogram(name: "tmpnam", scope: !39, file: !39, line: 653, type: !202, flags: DIFlagPrototyped, spFlags: 0)
!202 = !DISubroutineType(types: !203)
!203 = !{!63, !63}
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !205, file: !41, line: 161)
!205 = !DISubprogram(name: "getchar", scope: !39, file: !39, line: 599, type: !206, flags: DIFlagPrototyped, spFlags: 0)
!206 = !DISubroutineType(types: !207)
!207 = !{!53}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !209, file: !41, line: 165)
!209 = !DISubprogram(name: "scanf", scope: !39, file: !39, line: 436, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!210 = !DISubroutineType(types: !211)
!211 = !{!53, !72, null}
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !213, file: !41, line: 166)
!213 = !DISubprogram(name: "vscanf", scope: !39, file: !39, line: 453, type: !214, flags: DIFlagPrototyped, spFlags: 0)
!214 = !DISubroutineType(types: !215)
!215 = !{!53, !73, !95}
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !217, file: !41, line: 168)
!217 = !DISubprogram(name: "printf", scope: !39, file: !39, line: 420, type: !210, flags: DIFlagPrototyped, spFlags: 0)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !219, file: !41, line: 169)
!219 = !DISubprogram(name: "putchar", scope: !39, file: !39, line: 617, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DISubroutineType(types: !221)
!221 = !{!53, !53}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !223, file: !41, line: 170)
!223 = !DISubprogram(name: "puts", scope: !39, file: !39, line: 618, type: !190, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !225, file: !41, line: 171)
!225 = !DISubprogram(name: "vprintf", scope: !39, file: !39, line: 427, type: !226, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DISubroutineType(types: !227)
!227 = !{!53, !72, !92}
!228 = !{i32 7, !"Dwarf Version", i32 4}
!229 = !{i32 2, !"Debug Info Version", i32 3}
!230 = !{i32 1, !"wchar_size", i32 2}
!231 = !{i32 8, !"PIC Level", i32 2}
!232 = !{i32 7, !"uwtable", i32 2}
!233 = !{i32 1, !"MaxTLSAlign", i32 65536}
!234 = !{!"clang version 18.1.8"}
!235 = distinct !DISubprogram(name: "Class", linkageName: "_ZN5ClassC2Ev", scope: !236, file: !2, line: 12, type: !251, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !250, retainedNodes: !255)
!236 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Class", file: !237, line: 8, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !238, vtableHolder: !240)
!237 = !DIFile(filename: "./Class.hpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Filename")
!238 = !{!239, !250, !254}
!239 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !236, baseType: !240, extraData: i32 0)
!240 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "IClass", file: !237, line: 3, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !241, vtableHolder: !240)
!241 = !{!242, !245, !249}
!242 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$IClass", scope: !237, file: !237, baseType: !243, size: 64, flags: DIFlagArtificial)
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !206, size: 64)
!245 = !DISubprogram(name: "IClass", scope: !240, file: !237, line: 4, type: !246, scopeLine: 4, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DISubroutineType(types: !247)
!247 = !{null, !248}
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!249 = !DISubprogram(name: "~IClass", scope: !240, file: !237, line: 5, type: !246, scopeLine: 5, containingType: !240, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!250 = !DISubprogram(name: "Class", scope: !236, file: !237, line: 9, type: !251, scopeLine: 9, flags: DIFlagPrototyped, spFlags: 0)
!251 = !DISubroutineType(types: !252)
!252 = !{null, !253}
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!254 = !DISubprogram(name: "~Class", scope: !236, file: !237, line: 10, type: !251, scopeLine: 10, containingType: !236, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!255 = !{}
!256 = !DILocalVariable(name: "this", arg: 1, scope: !235, type: !257, flags: DIFlagArtificial | DIFlagObjectPointer)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!258 = !DILocation(line: 0, scope: !235)
!259 = !DILocation(line: 12, column: 18, scope: !235)
!260 = !DILocation(line: 12, column: 27, scope: !235)
!261 = !DILocation(line: 13, column: 3, scope: !262)
!262 = distinct !DILexicalBlock(scope: !235, file: !2, line: 12, column: 27)
!263 = !DILocation(line: 14, column: 3, scope: !262)
!264 = !DILocation(line: 15, column: 3, scope: !262)
!265 = !DILocation(line: 16, column: 1, scope: !235)
!266 = !DILocation(line: 16, column: 1, scope: !262)
!267 = distinct !DISubprogram(name: "IClass", linkageName: "_ZN6IClassC2Ev", scope: !240, file: !237, line: 4, type: !246, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !245, retainedNodes: !255)
!268 = !DILocalVariable(name: "this", arg: 1, scope: !267, type: !269, flags: DIFlagArtificial | DIFlagObjectPointer)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!270 = !DILocation(line: 0, scope: !267)
!271 = !DILocation(line: 4, column: 20, scope: !267)
!272 = distinct !DISubprogram(name: "~IClass", linkageName: "_ZN6IClassD2Ev", scope: !240, file: !2, line: 36, type: !246, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !249, retainedNodes: !255)
!273 = !DILocalVariable(name: "this", arg: 1, scope: !272, type: !269, flags: DIFlagArtificial | DIFlagObjectPointer)
!274 = !DILocation(line: 0, scope: !272)
!275 = !DILocation(line: 36, column: 19, scope: !272)
!276 = !DILocation(line: 37, column: 3, scope: !277)
!277 = distinct !DILexicalBlock(scope: !272, file: !2, line: 36, column: 19)
!278 = !DILocation(line: 38, column: 1, scope: !272)
!279 = distinct !DISubprogram(name: "ClassX", linkageName: "_ZN6ClassXC2Ev", scope: !280, file: !2, line: 18, type: !284, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !283, retainedNodes: !255)
!280 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ClassX", file: !237, line: 13, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !281, vtableHolder: !240)
!281 = !{!282, !283, !287}
!282 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !280, baseType: !236, extraData: i32 0)
!283 = !DISubprogram(name: "ClassX", scope: !280, file: !237, line: 14, type: !284, scopeLine: 14, flags: DIFlagPrototyped, spFlags: 0)
!284 = !DISubroutineType(types: !285)
!285 = !{null, !286}
!286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!287 = !DISubprogram(name: "~ClassX", scope: !280, file: !237, line: 15, type: !284, scopeLine: 15, containingType: !280, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!288 = !DILocalVariable(name: "this", arg: 1, scope: !279, type: !289, flags: DIFlagArtificial | DIFlagObjectPointer)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64)
!290 = !DILocation(line: 0, scope: !279)
!291 = !DILocation(line: 18, column: 20, scope: !279)
!292 = !DILocation(line: 18, column: 28, scope: !279)
!293 = !DILocation(line: 19, column: 3, scope: !294)
!294 = distinct !DILexicalBlock(scope: !279, file: !2, line: 18, column: 28)
!295 = !DILocation(line: 20, column: 3, scope: !294)
!296 = !DILocation(line: 21, column: 3, scope: !294)
!297 = !DILocation(line: 22, column: 1, scope: !279)
!298 = !DILocation(line: 22, column: 1, scope: !294)
!299 = distinct !DISubprogram(name: "~Class", linkageName: "_ZN5ClassD2Ev", scope: !236, file: !2, line: 40, type: !251, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !254, retainedNodes: !255)
!300 = !DILocalVariable(name: "this", arg: 1, scope: !299, type: !257, flags: DIFlagArtificial | DIFlagObjectPointer)
!301 = !DILocation(line: 0, scope: !299)
!302 = !DILocation(line: 40, column: 17, scope: !299)
!303 = !DILocation(line: 41, column: 3, scope: !304)
!304 = distinct !DILexicalBlock(scope: !299, file: !2, line: 40, column: 17)
!305 = !DILocation(line: 42, column: 3, scope: !304)
!306 = !DILocation(line: 43, column: 3, scope: !304)
!307 = !DILocation(line: 44, column: 1, scope: !304)
!308 = !DILocation(line: 44, column: 1, scope: !299)
!309 = distinct !DISubprogram(name: "Class", linkageName: "_ZN1x5ClassC2Ev", scope: !310, file: !2, line: 24, type: !315, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !314, retainedNodes: !255)
!310 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Class", scope: !311, file: !237, line: 19, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !312, vtableHolder: !240)
!311 = !DINamespace(name: "x", scope: null)
!312 = !{!313, !314, !318}
!313 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !310, baseType: !240, extraData: i32 0)
!314 = !DISubprogram(name: "Class", scope: !310, file: !237, line: 20, type: !315, scopeLine: 20, flags: DIFlagPrototyped, spFlags: 0)
!315 = !DISubroutineType(types: !316)
!316 = !{null, !317}
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!318 = !DISubprogram(name: "~Class", scope: !310, file: !237, line: 21, type: !315, scopeLine: 21, containingType: !310, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!319 = !DILocalVariable(name: "this", arg: 1, scope: !309, type: !320, flags: DIFlagArtificial | DIFlagObjectPointer)
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!321 = !DILocation(line: 0, scope: !309)
!322 = !DILocation(line: 24, column: 21, scope: !309)
!323 = !DILocation(line: 24, column: 30, scope: !309)
!324 = !DILocation(line: 25, column: 3, scope: !325)
!325 = distinct !DILexicalBlock(scope: !309, file: !2, line: 24, column: 30)
!326 = !DILocation(line: 26, column: 3, scope: !325)
!327 = !DILocation(line: 27, column: 3, scope: !325)
!328 = !DILocation(line: 28, column: 1, scope: !309)
!329 = !DILocation(line: 28, column: 1, scope: !325)
!330 = distinct !DISubprogram(name: "~IClass", linkageName: "_ZN6IClassD0Ev", scope: !240, file: !2, line: 36, type: !246, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !249, retainedNodes: !255)
!331 = !DILocalVariable(name: "this", arg: 1, scope: !330, type: !269, flags: DIFlagArtificial | DIFlagObjectPointer)
!332 = !DILocation(line: 0, scope: !330)
!333 = !DILocation(line: 36, column: 19, scope: !330)
!334 = !DILocation(line: 38, column: 1, scope: !330)
!335 = distinct !DISubprogram(name: "~Class", linkageName: "_ZN5ClassD0Ev", scope: !236, file: !2, line: 40, type: !251, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !254, retainedNodes: !255)
!336 = !DILocalVariable(name: "this", arg: 1, scope: !335, type: !257, flags: DIFlagArtificial | DIFlagObjectPointer)
!337 = !DILocation(line: 0, scope: !335)
!338 = !DILocation(line: 40, column: 17, scope: !335)
!339 = !DILocation(line: 44, column: 1, scope: !335)
!340 = distinct !DISubprogram(name: "~ClassX", linkageName: "_ZN6ClassXD2Ev", scope: !280, file: !2, line: 46, type: !284, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !287, retainedNodes: !255)
!341 = !DILocalVariable(name: "this", arg: 1, scope: !340, type: !289, flags: DIFlagArtificial | DIFlagObjectPointer)
!342 = !DILocation(line: 0, scope: !340)
!343 = !DILocation(line: 46, column: 19, scope: !340)
!344 = !DILocation(line: 47, column: 3, scope: !345)
!345 = distinct !DILexicalBlock(scope: !340, file: !2, line: 46, column: 19)
!346 = !DILocation(line: 48, column: 3, scope: !345)
!347 = !DILocation(line: 49, column: 3, scope: !345)
!348 = !DILocation(line: 50, column: 1, scope: !345)
!349 = !DILocation(line: 50, column: 1, scope: !340)
!350 = distinct !DISubprogram(name: "~ClassX", linkageName: "_ZN6ClassXD0Ev", scope: !280, file: !2, line: 46, type: !284, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !287, retainedNodes: !255)
!351 = !DILocalVariable(name: "this", arg: 1, scope: !350, type: !289, flags: DIFlagArtificial | DIFlagObjectPointer)
!352 = !DILocation(line: 0, scope: !350)
!353 = !DILocation(line: 46, column: 19, scope: !350)
!354 = !DILocation(line: 50, column: 1, scope: !350)
!355 = distinct !DISubprogram(name: "~Class", linkageName: "_ZN1x5ClassD2Ev", scope: !310, file: !2, line: 52, type: !315, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !318, retainedNodes: !255)
!356 = !DILocalVariable(name: "this", arg: 1, scope: !355, type: !320, flags: DIFlagArtificial | DIFlagObjectPointer)
!357 = !DILocation(line: 0, scope: !355)
!358 = !DILocation(line: 52, column: 20, scope: !355)
!359 = !DILocation(line: 53, column: 3, scope: !360)
!360 = distinct !DILexicalBlock(scope: !355, file: !2, line: 52, column: 20)
!361 = !DILocation(line: 54, column: 3, scope: !360)
!362 = !DILocation(line: 55, column: 3, scope: !360)
!363 = !DILocation(line: 56, column: 1, scope: !360)
!364 = !DILocation(line: 56, column: 1, scope: !355)
!365 = distinct !DISubprogram(name: "~Class", linkageName: "_ZN1x5ClassD0Ev", scope: !310, file: !2, line: 52, type: !315, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, declaration: !318, retainedNodes: !255)
!366 = !DILocalVariable(name: "this", arg: 1, scope: !365, type: !320, flags: DIFlagArtificial | DIFlagObjectPointer)
!367 = !DILocation(line: 0, scope: !365)
!368 = !DILocation(line: 52, column: 20, scope: !365)
!369 = !DILocation(line: 56, column: 1, scope: !365)
