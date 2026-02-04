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

$_ZTSN1x2ns5ClassE = comdat any

$_ZTIN1x2ns5ClassE = comdat any

@_ZTV5Class = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI5Class, ptr @_ZN5ClassD1Ev, ptr @_ZN5ClassD0Ev] }, align 8
@.str = private unnamed_addr constant [8 x i8] c"Class!\0A\00", align 1, !dbg !0
@_ZTV6ClassX = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI6ClassX, ptr @_ZN6ClassXD1Ev, ptr @_ZN6ClassXD0Ev] }, align 8
@.str.1 = private unnamed_addr constant [9 x i8] c"ClassX!\0A\00", align 1, !dbg !8
@_ZTVN1x2ns5ClassE = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTIN1x2ns5ClassE, ptr @_ZN1x2ns5ClassD1Ev, ptr @_ZN1x2ns5ClassD0Ev] }, align 8
@.str.2 = private unnamed_addr constant [15 x i8] c"x::ns::Class!\0A\00", align 1, !dbg !13
@_ZTV6IClass = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI6IClass, ptr @_ZN6IClassD1Ev, ptr @_ZN6IClassD0Ev] }, align 8
@.str.3 = private unnamed_addr constant [10 x i8] c"~IClass!\0A\00", align 1, !dbg !18
@.str.4 = private unnamed_addr constant [9 x i8] c"~Class!\0A\00", align 1, !dbg !23
@.str.5 = private unnamed_addr constant [10 x i8] c"~ClassX!\0A\00", align 1, !dbg !25
@.str.6 = private unnamed_addr constant [16 x i8] c"~x::ns::Class!\0A\00", align 1, !dbg !27
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTS6IClass = linkonce_odr dso_local constant [8 x i8] c"6IClass\00", comdat, align 1
@_ZTI6IClass = linkonce_odr dso_local constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTS6IClass }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTS5Class = linkonce_odr dso_local constant [7 x i8] c"5Class\00", comdat, align 1
@_ZTI5Class = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS5Class, ptr @_ZTI6IClass }, comdat, align 8
@_ZTS6ClassX = linkonce_odr dso_local constant [8 x i8] c"6ClassX\00", comdat, align 1
@_ZTI6ClassX = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS6ClassX, ptr @_ZTI5Class }, comdat, align 8
@_ZTSN1x2ns5ClassE = linkonce_odr dso_local constant [14 x i8] c"N1x2ns5ClassE\00", comdat, align 1
@_ZTIN1x2ns5ClassE = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSN1x2ns5ClassE, ptr @_ZTI6IClass }, comdat, align 8
@_ZTVN12_GLOBAL__N_19ClassAnonE = internal unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTIN12_GLOBAL__N_19ClassAnonE, ptr @_ZN12_GLOBAL__N_19ClassAnonD2Ev, ptr @_ZN12_GLOBAL__N_19ClassAnonD0Ev] }, align 8
@.str.7 = private unnamed_addr constant [19 x i8] c"Class`anonymous`!\0A\00", align 1, !dbg !32
@_ZTSN12_GLOBAL__N_19ClassAnonE = internal constant [27 x i8] c"N12_GLOBAL__N_19ClassAnonE\00", align 1
@_ZTIN12_GLOBAL__N_19ClassAnonE = internal constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSN12_GLOBAL__N_19ClassAnonE, ptr @_ZTI6ClassX }, align 8
@.str.8 = private unnamed_addr constant [20 x i8] c"~Class`anonymous`!\0A\00", align 1, !dbg !37

@_ZN5ClassC1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN5ClassC2Ev
@_ZN6ClassXC1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN6ClassXC2Ev
@_ZN1x2ns5ClassC1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1x2ns5ClassC2Ev
@_ZN6IClassD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN6IClassD2Ev
@_ZN5ClassD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN5ClassD2Ev
@_ZN6ClassXD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN6ClassXD2Ev
@_ZN1x2ns5ClassD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1x2ns5ClassD2Ev

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN5ClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !245 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !266, metadata !DIExpression()), !dbg !268
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 0, !dbg !269
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 8, i1 false), !dbg !269
  call void @_ZN6IClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #9, !dbg !269
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV5Class, i32 0, inrange i32 0, i32 2), ptr %5, align 8, !dbg !270
  notail call preserve_mostcc void @__debase_mark_begin() #9, !dbg !271
  %7 = invoke i32 (ptr, ...) @printf(ptr noundef @.str)
          to label %8 unwind label %9, !dbg !273

8:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #9, !dbg !274
  ret void, !dbg !275

9:                                                ; preds = %1
  %10 = landingpad { ptr, i32 }
          cleanup, !dbg !276
  %11 = extractvalue { ptr, i32 } %10, 0, !dbg !276
  store ptr %11, ptr %3, align 8, !dbg !276
  %12 = extractvalue { ptr, i32 } %10, 1, !dbg !276
  store i32 %12, ptr %4, align 4, !dbg !276
  call void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #9, !dbg !276
  br label %13, !dbg !276

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8, !dbg !276
  %15 = load i32, ptr %4, align 4, !dbg !276
  %16 = insertvalue { ptr, i32 } poison, ptr %14, 0, !dbg !276
  %17 = insertvalue { ptr, i32 } %16, i32 %15, 1, !dbg !276
  resume { ptr, i32 } %17, !dbg !276
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN6IClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 comdat align 2 !dbg !277 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !278, metadata !DIExpression()), !dbg !280
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV6IClass, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !281
  ret void, !dbg !281
}

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_begin() #4

declare dso_local i32 @printf(ptr noundef, ...) #5

declare dso_local i32 @__gxx_personality_seh0(...)

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_end() #4

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !282 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !283, metadata !DIExpression()), !dbg !284
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV6IClass, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !285
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.3)
          to label %5 unwind label %6, !dbg !286

5:                                                ; preds = %1
  ret void, !dbg !288

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !286
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !286
  call void @__clang_call_terminate(ptr %8) #10, !dbg !286
  unreachable, !dbg !286
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN6ClassXC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !289 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !298, metadata !DIExpression()), !dbg !300
  %5 = load ptr, ptr %2, align 8
  call void @_ZN5ClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !301
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV6ClassX, i32 0, inrange i32 0, i32 2), ptr %5, align 8, !dbg !302
  notail call preserve_mostcc void @__debase_mark_begin() #9, !dbg !303
  %6 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.1)
          to label %7 unwind label %8, !dbg !305

7:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #9, !dbg !306
  ret void, !dbg !307

8:                                                ; preds = %1
  %9 = landingpad { ptr, i32 }
          cleanup, !dbg !308
  %10 = extractvalue { ptr, i32 } %9, 0, !dbg !308
  store ptr %10, ptr %3, align 8, !dbg !308
  %11 = extractvalue { ptr, i32 } %9, 1, !dbg !308
  store i32 %11, ptr %4, align 4, !dbg !308
  call void @_ZN5ClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #9, !dbg !308
  br label %12, !dbg !308

12:                                               ; preds = %8
  %13 = load ptr, ptr %3, align 8, !dbg !308
  %14 = load i32, ptr %4, align 4, !dbg !308
  %15 = insertvalue { ptr, i32 } poison, ptr %13, 0, !dbg !308
  %16 = insertvalue { ptr, i32 } %15, i32 %14, 1, !dbg !308
  resume { ptr, i32 } %16, !dbg !308
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN5ClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !309 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !310, metadata !DIExpression()), !dbg !311
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV5Class, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !312
  notail call preserve_mostcc void @__debase_mark_begin() #9, !dbg !313
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.4)
          to label %5 unwind label %6, !dbg !315

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #9, !dbg !316
  call void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !317
  ret void, !dbg !318

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !315
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !315
  call void @__clang_call_terminate(ptr %8) #10, !dbg !315
  unreachable, !dbg !315
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN1x2ns5ClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !319 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !330, metadata !DIExpression()), !dbg !332
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 0, !dbg !333
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 8, i1 false), !dbg !333
  call void @_ZN6IClassC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #9, !dbg !333
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTVN1x2ns5ClassE, i32 0, inrange i32 0, i32 2), ptr %5, align 8, !dbg !334
  notail call preserve_mostcc void @__debase_mark_begin() #9, !dbg !335
  %7 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.2)
          to label %8 unwind label %9, !dbg !337

8:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #9, !dbg !338
  ret void, !dbg !339

9:                                                ; preds = %1
  %10 = landingpad { ptr, i32 }
          cleanup, !dbg !340
  %11 = extractvalue { ptr, i32 } %10, 0, !dbg !340
  store ptr %11, ptr %3, align 8, !dbg !340
  %12 = extractvalue { ptr, i32 } %10, 1, !dbg !340
  store i32 %12, ptr %4, align 4, !dbg !340
  call void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #9, !dbg !340
  br label %13, !dbg !340

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8, !dbg !340
  %15 = load i32, ptr %4, align 4, !dbg !340
  %16 = insertvalue { ptr, i32 } poison, ptr %14, 0, !dbg !340
  %17 = insertvalue { ptr, i32 } %16, i32 %15, 1, !dbg !340
  resume { ptr, i32 } %17, !dbg !340
}

; Function Attrs: noinline noreturn nounwind uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #6 comdat {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #9
  call void @_ZSt9terminatev() #10
  unreachable
}

declare dso_local ptr @__cxa_begin_catch(ptr)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN6IClassD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !341 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !342, metadata !DIExpression()), !dbg !343
  %3 = load ptr, ptr %2, align 8
  call void @_ZN6IClassD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !344
  call void @_ZdlPv(ptr noundef %3) #11, !dbg !344
  ret void, !dbg !345
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(ptr noundef) #7

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN5ClassD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !346 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !347, metadata !DIExpression()), !dbg !348
  %3 = load ptr, ptr %2, align 8
  call void @_ZN5ClassD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !349
  call void @_ZdlPv(ptr noundef %3) #11, !dbg !349
  ret void, !dbg !350
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN6ClassXD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !351 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !352, metadata !DIExpression()), !dbg !353
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV6ClassX, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !354
  notail call preserve_mostcc void @__debase_mark_begin() #9, !dbg !355
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.5)
          to label %5 unwind label %6, !dbg !357

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #9, !dbg !358
  call void @_ZN5ClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !359
  ret void, !dbg !360

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !357
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !357
  call void @__clang_call_terminate(ptr %8) #10, !dbg !357
  unreachable, !dbg !357
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN6ClassXD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !361 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !362, metadata !DIExpression()), !dbg !363
  %3 = load ptr, ptr %2, align 8
  call void @_ZN6ClassXD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !364
  call void @_ZdlPv(ptr noundef %3) #11, !dbg !364
  ret void, !dbg !365
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1x2ns5ClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !366 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !367, metadata !DIExpression()), !dbg !368
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTVN1x2ns5ClassE, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !369
  notail call preserve_mostcc void @__debase_mark_begin() #9, !dbg !370
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.6)
          to label %5 unwind label %6, !dbg !372

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #9, !dbg !373
  call void @_ZN6IClassD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !374
  ret void, !dbg !375

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !372
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !372
  call void @__clang_call_terminate(ptr %8) #10, !dbg !372
  unreachable, !dbg !372
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1x2ns5ClassD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !376 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !377, metadata !DIExpression()), !dbg !378
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1x2ns5ClassD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !379
  call void @_ZdlPv(ptr noundef %3) #11, !dbg !379
  ret void, !dbg !380
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef ptr @_Z8getClassv() #0 personality ptr @__gxx_personality_seh0 !dbg !381 {
  %1 = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = call noalias noundef nonnull ptr @_Znwy(i64 noundef 8) #12, !dbg !384, !heapallocsite !385
  invoke void @_ZN12_GLOBAL__N_19ClassAnonC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3)
          to label %4 unwind label %5, !dbg !394

4:                                                ; preds = %0
  ret ptr %3, !dbg !395

5:                                                ; preds = %0
  %6 = landingpad { ptr, i32 }
          cleanup, !dbg !396
  %7 = extractvalue { ptr, i32 } %6, 0, !dbg !396
  store ptr %7, ptr %1, align 8, !dbg !396
  %8 = extractvalue { ptr, i32 } %6, 1, !dbg !396
  store i32 %8, ptr %2, align 4, !dbg !396
  call void @_ZdlPv(ptr noundef %3) #11, !dbg !384
  br label %9, !dbg !384

9:                                                ; preds = %5
  %10 = load ptr, ptr %1, align 8, !dbg !384
  %11 = load i32, ptr %2, align 4, !dbg !384
  %12 = insertvalue { ptr, i32 } poison, ptr %10, 0, !dbg !384
  %13 = insertvalue { ptr, i32 } %12, i32 %11, 1, !dbg !384
  resume { ptr, i32 } %13, !dbg !384
}

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull ptr @_Znwy(i64 noundef) #8

; Function Attrs: mustprogress noinline optnone uwtable
define internal void @_ZN12_GLOBAL__N_19ClassAnonC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !397 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !398, metadata !DIExpression()), !dbg !400
  %5 = load ptr, ptr %2, align 8
  call void @_ZN6ClassXC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !401
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTVN12_GLOBAL__N_19ClassAnonE, i32 0, inrange i32 0, i32 2), ptr %5, align 8, !dbg !402
  notail call preserve_mostcc void @__debase_mark_begin() #9, !dbg !403
  %6 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.7)
          to label %7 unwind label %8, !dbg !405

7:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #9, !dbg !406
  ret void, !dbg !407

8:                                                ; preds = %1
  %9 = landingpad { ptr, i32 }
          cleanup, !dbg !408
  %10 = extractvalue { ptr, i32 } %9, 0, !dbg !408
  store ptr %10, ptr %3, align 8, !dbg !408
  %11 = extractvalue { ptr, i32 } %9, 1, !dbg !408
  store i32 %11, ptr %4, align 4, !dbg !408
  call void @_ZN6ClassXD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #9, !dbg !408
  br label %12, !dbg !408

12:                                               ; preds = %8
  %13 = load ptr, ptr %3, align 8, !dbg !408
  %14 = load i32, ptr %4, align 4, !dbg !408
  %15 = insertvalue { ptr, i32 } poison, ptr %13, 0, !dbg !408
  %16 = insertvalue { ptr, i32 } %15, i32 %14, 1, !dbg !408
  resume { ptr, i32 } %16, !dbg !408
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_Z11deleteClassRP6IClass(ptr noundef nonnull align 8 dereferenceable(8) %0) #3 !dbg !409 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !413, metadata !DIExpression()), !dbg !414
  %3 = load ptr, ptr %2, align 8, !dbg !415
  %4 = load ptr, ptr %3, align 8, !dbg !415
  %5 = icmp eq ptr %4, null, !dbg !416
  br i1 %5, label %10, label %6, !dbg !416

6:                                                ; preds = %1
  %7 = load ptr, ptr %4, align 8, !dbg !416
  %8 = getelementptr inbounds ptr, ptr %7, i64 1, !dbg !416
  %9 = load ptr, ptr %8, align 8, !dbg !416
  call void %9(ptr noundef nonnull align 8 dereferenceable(8) %4) #9, !dbg !416
  br label %10, !dbg !416

10:                                               ; preds = %6, %1
  %11 = load ptr, ptr %2, align 8, !dbg !417
  store ptr null, ptr %11, align 8, !dbg !418
  ret void, !dbg !419
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal void @_ZN12_GLOBAL__N_19ClassAnonD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_seh0 !dbg !420 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !421, metadata !DIExpression()), !dbg !422
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTVN12_GLOBAL__N_19ClassAnonE, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !423
  notail call preserve_mostcc void @__debase_mark_begin() #9, !dbg !424
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.8)
          to label %5 unwind label %6, !dbg !426

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #9, !dbg !427
  call void @_ZN6ClassXD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !428
  ret void, !dbg !429

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !426
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !426
  call void @__clang_call_terminate(ptr %8) #10, !dbg !426
  unreachable, !dbg !426
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal void @_ZN12_GLOBAL__N_19ClassAnonD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #3 align 2 !dbg !430 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !431, metadata !DIExpression()), !dbg !432
  %3 = load ptr, ptr %2, align 8
  call void @_ZN12_GLOBAL__N_19ClassAnonD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #9, !dbg !433
  call void @_ZdlPv(ptr noundef %3) #11, !dbg !433
  ret void, !dbg !434
}

attributes #0 = { mustprogress noinline optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { mustprogress noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noinline noreturn nounwind uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { builtin nounwind }
attributes #12 = { builtin allocsize(0) }

!llvm.dbg.cu = !{!42}
!llvm.module.flags = !{!238, !239, !240, !241, !242, !243}
!llvm.ident = !{!244}

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
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 15)
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
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 16)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !34, isLocal: true, isDefinition: true)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 19)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(scope: null, file: !2, line: 60, type: !39, isLocal: true, isDefinition: true)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 20)
!42 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "clang version 18.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !43, imports: !44, splitDebugInlining: false, nameTableKind: None)
!43 = !{!0, !8, !13, !18, !23, !25, !27, !32, !37}
!44 = !{!45, !52, !55, !59, !65, !67, !74, !78, !84, !86, !90, !94, !98, !106, !110, !114, !118, !122, !124, !128, !132, !136, !138, !140, !142, !148, !155, !161, !166, !172, !176, !180, !182, !184, !186, !190, !194, !198, !202, !206, !210, !214, !218, !222, !226, !228, !232, !234}
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !48, file: !51, line: 117)
!46 = !DINamespace(name: "__1", scope: !47, exportSymbols: true)
!47 = !DINamespace(name: "std", scope: null)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !49, line: 47, baseType: !50)
!49 = !DIFile(filename: "C:/msys64/clang64/include/stdio.h", directory: "")
!50 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !49, line: 33, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS6_iobuf")
!51 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cstdio", directory: "")
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !53, file: !51, line: 118)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !49, line: 112, baseType: !54)
!54 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !56, file: !51, line: 119)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 35, baseType: !58)
!57 = !DIFile(filename: "C:/msys64/clang64/include/corecrt.h", directory: "")
!58 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !60, file: !51, line: 121)
!60 = !DISubprogram(name: "fclose", scope: !49, file: !49, line: 525, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !66, file: !51, line: 122)
!66 = !DISubprogram(name: "fflush", scope: !49, file: !49, line: 534, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !68, file: !51, line: 123)
!68 = !DISubprogram(name: "setbuf", scope: !49, file: !49, line: 631, type: !69, flags: DIFlagPrototyped, spFlags: 0)
!69 = !DISubroutineType(types: !70)
!70 = !{null, !71, !72}
!71 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !64)
!72 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !73)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !75, file: !51, line: 124)
!75 = !DISubprogram(name: "setvbuf", scope: !49, file: !49, line: 635, type: !76, flags: DIFlagPrototyped, spFlags: 0)
!76 = !DISubroutineType(types: !77)
!77 = !{!63, !71, !72, !63, !56}
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !79, file: !51, line: 125)
!79 = !DISubprogram(name: "fprintf", scope: !49, file: !49, line: 418, type: !80, flags: DIFlagPrototyped, spFlags: 0)
!80 = !DISubroutineType(types: !81)
!81 = !{!63, !71, !82, null}
!82 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !85, file: !51, line: 126)
!85 = !DISubprogram(name: "fscanf", scope: !49, file: !49, line: 433, type: !80, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !87, file: !51, line: 127)
!87 = !DISubprogram(name: "snprintf", scope: !49, file: !49, line: 719, type: !88, flags: DIFlagPrototyped, spFlags: 0)
!88 = !DISubroutineType(types: !89)
!89 = !{!63, !72, !56, !82, null}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !91, file: !51, line: 128)
!91 = !DISubprogram(name: "sprintf", scope: !49, file: !49, line: 422, type: !92, flags: DIFlagPrototyped, spFlags: 0)
!92 = !DISubroutineType(types: !93)
!93 = !{!63, !72, !82, null}
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !95, file: !51, line: 129)
!95 = !DISubprogram(name: "sscanf", scope: !49, file: !49, line: 439, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!96 = !DISubroutineType(types: !97)
!97 = !{!63, !82, !82, null}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !99, file: !51, line: 130)
!99 = !DISubprogram(name: "vfprintf", scope: !49, file: !49, line: 425, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!100 = !DISubroutineType(types: !101)
!101 = !{!63, !71, !82, !102}
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !103, line: 31, baseType: !104)
!103 = !DIFile(filename: "C:/msys64/clang64/include/vadefs.h", directory: "")
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !103, line: 24, baseType: !105)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2, baseType: !73)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !107, file: !51, line: 131)
!107 = !DISubprogram(name: "vfscanf", scope: !49, file: !49, line: 448, type: !108, flags: DIFlagPrototyped, spFlags: 0)
!108 = !DISubroutineType(types: !109)
!109 = !{!63, !64, !83, !105}
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !111, file: !51, line: 132)
!111 = !DISubprogram(name: "vsscanf", scope: !49, file: !49, line: 451, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DISubroutineType(types: !113)
!113 = !{!63, !82, !82, !105}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !115, file: !51, line: 133)
!115 = !DISubprogram(name: "vsnprintf", scope: !49, file: !49, line: 716, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DISubroutineType(types: !117)
!117 = !{!63, !72, !56, !82, !102}
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !119, file: !51, line: 134)
!119 = !DISubprogram(name: "vsprintf", scope: !49, file: !49, line: 429, type: !120, flags: DIFlagPrototyped, spFlags: 0)
!120 = !DISubroutineType(types: !121)
!121 = !{!63, !72, !82, !102}
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !123, file: !51, line: 135)
!123 = !DISubprogram(name: "fgetc", scope: !49, file: !49, line: 535, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !125, file: !51, line: 136)
!125 = !DISubprogram(name: "fgets", scope: !49, file: !49, line: 539, type: !126, flags: DIFlagPrototyped, spFlags: 0)
!126 = !DISubroutineType(types: !127)
!127 = !{!73, !72, !63, !71}
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !129, file: !51, line: 137)
!129 = !DISubprogram(name: "fputc", scope: !49, file: !49, line: 548, type: !130, flags: DIFlagPrototyped, spFlags: 0)
!130 = !DISubroutineType(types: !131)
!131 = !{!63, !63, !64}
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !133, file: !51, line: 138)
!133 = !DISubprogram(name: "fputs", scope: !49, file: !49, line: 550, type: !134, flags: DIFlagPrototyped, spFlags: 0)
!134 = !DISubroutineType(types: !135)
!135 = !{!63, !82, !71}
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !137, file: !51, line: 139)
!137 = !DISubprogram(name: "getc", scope: !49, file: !49, line: 598, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !139, file: !51, line: 140)
!139 = !DISubprogram(name: "putc", scope: !49, file: !49, line: 616, type: !130, flags: DIFlagPrototyped, spFlags: 0)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !141, file: !51, line: 141)
!141 = !DISubprogram(name: "ungetc", scope: !49, file: !49, line: 654, type: !130, flags: DIFlagPrototyped, spFlags: 0)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !143, file: !51, line: 142)
!143 = !DISubprogram(name: "fread", scope: !49, file: !49, line: 551, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!144 = !DISubroutineType(types: !145)
!145 = !{!56, !146, !56, !56, !71}
!146 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !147)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !149, file: !51, line: 143)
!149 = !DISubprogram(name: "fwrite", scope: !49, file: !49, line: 597, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!150 = !DISubroutineType(types: !151)
!151 = !{!56, !152, !56, !56, !71}
!152 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !153)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!154 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !156, file: !51, line: 144)
!156 = !DISubprogram(name: "fgetpos", scope: !49, file: !49, line: 537, type: !157, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DISubroutineType(types: !158)
!158 = !{!63, !71, !159}
!159 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !160)
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !162, file: !51, line: 145)
!162 = !DISubprogram(name: "fseek", scope: !49, file: !49, line: 555, type: !163, flags: DIFlagPrototyped, spFlags: 0)
!163 = !DISubroutineType(types: !164)
!164 = !{!63, !64, !165, !63}
!165 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !167, file: !51, line: 146)
!167 = !DISubprogram(name: "fsetpos", scope: !49, file: !49, line: 553, type: !168, flags: DIFlagPrototyped, spFlags: 0)
!168 = !DISubroutineType(types: !169)
!169 = !{!63, !64, !170}
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!171 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !53)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !173, file: !51, line: 147)
!173 = !DISubprogram(name: "ftell", scope: !49, file: !49, line: 556, type: !174, flags: DIFlagPrototyped, spFlags: 0)
!174 = !DISubroutineType(types: !175)
!175 = !{!165, !64}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !177, file: !51, line: 148)
!177 = !DISubprogram(name: "rewind", scope: !49, file: !49, line: 629, type: !178, flags: DIFlagPrototyped, spFlags: 0)
!178 = !DISubroutineType(types: !179)
!179 = !{null, !64}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !181, file: !51, line: 149)
!181 = !DISubprogram(name: "clearerr", scope: !49, file: !49, line: 524, type: !178, flags: DIFlagPrototyped, spFlags: 0)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !183, file: !51, line: 150)
!183 = !DISubprogram(name: "feof", scope: !49, file: !49, line: 532, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !185, file: !51, line: 151)
!185 = !DISubprogram(name: "ferror", scope: !49, file: !49, line: 533, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !187, file: !51, line: 152)
!187 = !DISubprogram(name: "perror", scope: !49, file: !49, line: 606, type: !188, flags: DIFlagPrototyped, spFlags: 0)
!188 = !DISubroutineType(types: !189)
!189 = !{null, !83}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !191, file: !51, line: 154)
!191 = !DISubprogram(name: "fopen", scope: !49, file: !49, line: 546, type: !192, flags: DIFlagPrototyped, spFlags: 0)
!192 = !DISubroutineType(types: !193)
!193 = !{!64, !82, !82}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !195, file: !51, line: 155)
!195 = !DISubprogram(name: "freopen", scope: !49, file: !49, line: 552, type: !196, flags: DIFlagPrototyped, spFlags: 0)
!196 = !DISubroutineType(types: !197)
!197 = !{!64, !82, !82, !71}
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !199, file: !51, line: 156)
!199 = !DISubprogram(name: "remove", scope: !49, file: !49, line: 622, type: !200, flags: DIFlagPrototyped, spFlags: 0)
!200 = !DISubroutineType(types: !201)
!201 = !{!63, !83}
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !203, file: !51, line: 157)
!203 = !DISubprogram(name: "rename", scope: !49, file: !49, line: 623, type: !204, flags: DIFlagPrototyped, spFlags: 0)
!204 = !DISubroutineType(types: !205)
!205 = !{!63, !83, !83}
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !207, file: !51, line: 158)
!207 = !DISubprogram(name: "tmpfile", scope: !49, file: !49, line: 652, type: !208, flags: DIFlagPrototyped, spFlags: 0)
!208 = !DISubroutineType(types: !209)
!209 = !{!64}
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !211, file: !51, line: 159)
!211 = !DISubprogram(name: "tmpnam", scope: !49, file: !49, line: 653, type: !212, flags: DIFlagPrototyped, spFlags: 0)
!212 = !DISubroutineType(types: !213)
!213 = !{!73, !73}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !215, file: !51, line: 161)
!215 = !DISubprogram(name: "getchar", scope: !49, file: !49, line: 599, type: !216, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DISubroutineType(types: !217)
!217 = !{!63}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !219, file: !51, line: 165)
!219 = !DISubprogram(name: "scanf", scope: !49, file: !49, line: 436, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DISubroutineType(types: !221)
!221 = !{!63, !82, null}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !223, file: !51, line: 166)
!223 = !DISubprogram(name: "vscanf", scope: !49, file: !49, line: 453, type: !224, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DISubroutineType(types: !225)
!225 = !{!63, !83, !105}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !227, file: !51, line: 168)
!227 = !DISubprogram(name: "printf", scope: !49, file: !49, line: 420, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !229, file: !51, line: 169)
!229 = !DISubprogram(name: "putchar", scope: !49, file: !49, line: 617, type: !230, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DISubroutineType(types: !231)
!231 = !{!63, !63}
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !233, file: !51, line: 170)
!233 = !DISubprogram(name: "puts", scope: !49, file: !49, line: 618, type: !200, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !46, entity: !235, file: !51, line: 171)
!235 = !DISubprogram(name: "vprintf", scope: !49, file: !49, line: 427, type: !236, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DISubroutineType(types: !237)
!237 = !{!63, !82, !102}
!238 = !{i32 7, !"Dwarf Version", i32 4}
!239 = !{i32 2, !"Debug Info Version", i32 3}
!240 = !{i32 1, !"wchar_size", i32 2}
!241 = !{i32 8, !"PIC Level", i32 2}
!242 = !{i32 7, !"uwtable", i32 2}
!243 = !{i32 1, !"MaxTLSAlign", i32 65536}
!244 = !{!"clang version 18.1.8"}
!245 = distinct !DISubprogram(name: "Class", linkageName: "_ZN5ClassC2Ev", scope: !246, file: !2, line: 12, type: !261, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !260, retainedNodes: !265)
!246 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Class", file: !247, line: 8, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !248, vtableHolder: !250)
!247 = !DIFile(filename: "./Class.hpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Filename")
!248 = !{!249, !260, !264}
!249 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !246, baseType: !250, extraData: i32 0)
!250 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "IClass", file: !247, line: 3, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !251, vtableHolder: !250)
!251 = !{!252, !255, !259}
!252 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$IClass", scope: !247, file: !247, baseType: !253, size: 64, flags: DIFlagArtificial)
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !216, size: 64)
!255 = !DISubprogram(name: "IClass", scope: !250, file: !247, line: 4, type: !256, scopeLine: 4, flags: DIFlagPrototyped, spFlags: 0)
!256 = !DISubroutineType(types: !257)
!257 = !{null, !258}
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !250, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!259 = !DISubprogram(name: "~IClass", scope: !250, file: !247, line: 5, type: !256, scopeLine: 5, containingType: !250, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!260 = !DISubprogram(name: "Class", scope: !246, file: !247, line: 9, type: !261, scopeLine: 9, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DISubroutineType(types: !262)
!262 = !{null, !263}
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!264 = !DISubprogram(name: "~Class", scope: !246, file: !247, line: 10, type: !261, scopeLine: 10, containingType: !246, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!265 = !{}
!266 = !DILocalVariable(name: "this", arg: 1, scope: !245, type: !267, flags: DIFlagArtificial | DIFlagObjectPointer)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64)
!268 = !DILocation(line: 0, scope: !245)
!269 = !DILocation(line: 12, column: 18, scope: !245)
!270 = !DILocation(line: 12, column: 27, scope: !245)
!271 = !DILocation(line: 13, column: 3, scope: !272)
!272 = distinct !DILexicalBlock(scope: !245, file: !2, line: 12, column: 27)
!273 = !DILocation(line: 14, column: 3, scope: !272)
!274 = !DILocation(line: 15, column: 3, scope: !272)
!275 = !DILocation(line: 16, column: 1, scope: !245)
!276 = !DILocation(line: 16, column: 1, scope: !272)
!277 = distinct !DISubprogram(name: "IClass", linkageName: "_ZN6IClassC2Ev", scope: !250, file: !247, line: 4, type: !256, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !255, retainedNodes: !265)
!278 = !DILocalVariable(name: "this", arg: 1, scope: !277, type: !279, flags: DIFlagArtificial | DIFlagObjectPointer)
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !250, size: 64)
!280 = !DILocation(line: 0, scope: !277)
!281 = !DILocation(line: 4, column: 20, scope: !277)
!282 = distinct !DISubprogram(name: "~IClass", linkageName: "_ZN6IClassD2Ev", scope: !250, file: !2, line: 36, type: !256, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !259, retainedNodes: !265)
!283 = !DILocalVariable(name: "this", arg: 1, scope: !282, type: !279, flags: DIFlagArtificial | DIFlagObjectPointer)
!284 = !DILocation(line: 0, scope: !282)
!285 = !DILocation(line: 36, column: 19, scope: !282)
!286 = !DILocation(line: 37, column: 3, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !2, line: 36, column: 19)
!288 = !DILocation(line: 38, column: 1, scope: !282)
!289 = distinct !DISubprogram(name: "ClassX", linkageName: "_ZN6ClassXC2Ev", scope: !290, file: !2, line: 18, type: !294, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !293, retainedNodes: !265)
!290 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ClassX", file: !247, line: 13, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !291, vtableHolder: !250)
!291 = !{!292, !293, !297}
!292 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !290, baseType: !246, extraData: i32 0)
!293 = !DISubprogram(name: "ClassX", scope: !290, file: !247, line: 14, type: !294, scopeLine: 14, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DISubroutineType(types: !295)
!295 = !{null, !296}
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!297 = !DISubprogram(name: "~ClassX", scope: !290, file: !247, line: 15, type: !294, scopeLine: 15, containingType: !290, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!298 = !DILocalVariable(name: "this", arg: 1, scope: !289, type: !299, flags: DIFlagArtificial | DIFlagObjectPointer)
!299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!300 = !DILocation(line: 0, scope: !289)
!301 = !DILocation(line: 18, column: 20, scope: !289)
!302 = !DILocation(line: 18, column: 28, scope: !289)
!303 = !DILocation(line: 19, column: 3, scope: !304)
!304 = distinct !DILexicalBlock(scope: !289, file: !2, line: 18, column: 28)
!305 = !DILocation(line: 20, column: 3, scope: !304)
!306 = !DILocation(line: 21, column: 3, scope: !304)
!307 = !DILocation(line: 22, column: 1, scope: !289)
!308 = !DILocation(line: 22, column: 1, scope: !304)
!309 = distinct !DISubprogram(name: "~Class", linkageName: "_ZN5ClassD2Ev", scope: !246, file: !2, line: 40, type: !261, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !264, retainedNodes: !265)
!310 = !DILocalVariable(name: "this", arg: 1, scope: !309, type: !267, flags: DIFlagArtificial | DIFlagObjectPointer)
!311 = !DILocation(line: 0, scope: !309)
!312 = !DILocation(line: 40, column: 17, scope: !309)
!313 = !DILocation(line: 41, column: 3, scope: !314)
!314 = distinct !DILexicalBlock(scope: !309, file: !2, line: 40, column: 17)
!315 = !DILocation(line: 42, column: 3, scope: !314)
!316 = !DILocation(line: 43, column: 3, scope: !314)
!317 = !DILocation(line: 44, column: 1, scope: !314)
!318 = !DILocation(line: 44, column: 1, scope: !309)
!319 = distinct !DISubprogram(name: "Class", linkageName: "_ZN1x2ns5ClassC2Ev", scope: !320, file: !2, line: 24, type: !326, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !325, retainedNodes: !265)
!320 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Class", scope: !321, file: !247, line: 19, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !323, vtableHolder: !250)
!321 = !DINamespace(name: "ns", scope: !322)
!322 = !DINamespace(name: "x", scope: null)
!323 = !{!324, !325, !329}
!324 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !320, baseType: !250, extraData: i32 0)
!325 = !DISubprogram(name: "Class", scope: !320, file: !247, line: 20, type: !326, scopeLine: 20, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DISubroutineType(types: !327)
!327 = !{null, !328}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!329 = !DISubprogram(name: "~Class", scope: !320, file: !247, line: 21, type: !326, scopeLine: 21, containingType: !320, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!330 = !DILocalVariable(name: "this", arg: 1, scope: !319, type: !331, flags: DIFlagArtificial | DIFlagObjectPointer)
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!332 = !DILocation(line: 0, scope: !319)
!333 = !DILocation(line: 24, column: 25, scope: !319)
!334 = !DILocation(line: 24, column: 34, scope: !319)
!335 = !DILocation(line: 25, column: 3, scope: !336)
!336 = distinct !DILexicalBlock(scope: !319, file: !2, line: 24, column: 34)
!337 = !DILocation(line: 26, column: 3, scope: !336)
!338 = !DILocation(line: 27, column: 3, scope: !336)
!339 = !DILocation(line: 28, column: 1, scope: !319)
!340 = !DILocation(line: 28, column: 1, scope: !336)
!341 = distinct !DISubprogram(name: "~IClass", linkageName: "_ZN6IClassD0Ev", scope: !250, file: !2, line: 36, type: !256, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !259, retainedNodes: !265)
!342 = !DILocalVariable(name: "this", arg: 1, scope: !341, type: !279, flags: DIFlagArtificial | DIFlagObjectPointer)
!343 = !DILocation(line: 0, scope: !341)
!344 = !DILocation(line: 36, column: 19, scope: !341)
!345 = !DILocation(line: 38, column: 1, scope: !341)
!346 = distinct !DISubprogram(name: "~Class", linkageName: "_ZN5ClassD0Ev", scope: !246, file: !2, line: 40, type: !261, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !264, retainedNodes: !265)
!347 = !DILocalVariable(name: "this", arg: 1, scope: !346, type: !267, flags: DIFlagArtificial | DIFlagObjectPointer)
!348 = !DILocation(line: 0, scope: !346)
!349 = !DILocation(line: 40, column: 17, scope: !346)
!350 = !DILocation(line: 44, column: 1, scope: !346)
!351 = distinct !DISubprogram(name: "~ClassX", linkageName: "_ZN6ClassXD2Ev", scope: !290, file: !2, line: 46, type: !294, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !297, retainedNodes: !265)
!352 = !DILocalVariable(name: "this", arg: 1, scope: !351, type: !299, flags: DIFlagArtificial | DIFlagObjectPointer)
!353 = !DILocation(line: 0, scope: !351)
!354 = !DILocation(line: 46, column: 19, scope: !351)
!355 = !DILocation(line: 47, column: 3, scope: !356)
!356 = distinct !DILexicalBlock(scope: !351, file: !2, line: 46, column: 19)
!357 = !DILocation(line: 48, column: 3, scope: !356)
!358 = !DILocation(line: 49, column: 3, scope: !356)
!359 = !DILocation(line: 50, column: 1, scope: !356)
!360 = !DILocation(line: 50, column: 1, scope: !351)
!361 = distinct !DISubprogram(name: "~ClassX", linkageName: "_ZN6ClassXD0Ev", scope: !290, file: !2, line: 46, type: !294, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !297, retainedNodes: !265)
!362 = !DILocalVariable(name: "this", arg: 1, scope: !361, type: !299, flags: DIFlagArtificial | DIFlagObjectPointer)
!363 = !DILocation(line: 0, scope: !361)
!364 = !DILocation(line: 46, column: 19, scope: !361)
!365 = !DILocation(line: 50, column: 1, scope: !361)
!366 = distinct !DISubprogram(name: "~Class", linkageName: "_ZN1x2ns5ClassD2Ev", scope: !320, file: !2, line: 52, type: !326, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !329, retainedNodes: !265)
!367 = !DILocalVariable(name: "this", arg: 1, scope: !366, type: !331, flags: DIFlagArtificial | DIFlagObjectPointer)
!368 = !DILocation(line: 0, scope: !366)
!369 = !DILocation(line: 52, column: 24, scope: !366)
!370 = !DILocation(line: 53, column: 3, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !2, line: 52, column: 24)
!372 = !DILocation(line: 54, column: 3, scope: !371)
!373 = !DILocation(line: 55, column: 3, scope: !371)
!374 = !DILocation(line: 56, column: 1, scope: !371)
!375 = !DILocation(line: 56, column: 1, scope: !366)
!376 = distinct !DISubprogram(name: "~Class", linkageName: "_ZN1x2ns5ClassD0Ev", scope: !320, file: !2, line: 52, type: !326, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, declaration: !329, retainedNodes: !265)
!377 = !DILocalVariable(name: "this", arg: 1, scope: !376, type: !331, flags: DIFlagArtificial | DIFlagObjectPointer)
!378 = !DILocation(line: 0, scope: !376)
!379 = !DILocation(line: 52, column: 24, scope: !376)
!380 = !DILocation(line: 56, column: 1, scope: !376)
!381 = distinct !DISubprogram(name: "getClass", linkageName: "_Z8getClassv", scope: !2, file: !2, line: 64, type: !382, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42)
!382 = !DISubroutineType(types: !383)
!383 = !{!279}
!384 = !DILocation(line: 65, column: 10, scope: !381)
!385 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ClassAnon", scope: !386, file: !2, line: 6, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !387, vtableHolder: !250)
!386 = !DINamespace(scope: null)
!387 = !{!388, !389, !393}
!388 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !385, baseType: !290, extraData: i32 0)
!389 = !DISubprogram(name: "ClassAnon", scope: !385, file: !2, line: 7, type: !390, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!390 = !DISubroutineType(types: !391)
!391 = !{null, !392}
!392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!393 = !DISubprogram(name: "~ClassAnon", scope: !385, file: !2, line: 8, type: !390, scopeLine: 8, containingType: !385, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagLocalToUnit)
!394 = !DILocation(line: 65, column: 14, scope: !381)
!395 = !DILocation(line: 65, column: 3, scope: !381)
!396 = !DILocation(line: 66, column: 1, scope: !381)
!397 = distinct !DISubprogram(name: "ClassAnon", linkageName: "_ZN12_GLOBAL__N_19ClassAnonC2Ev", scope: !385, file: !2, line: 30, type: !390, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !42, declaration: !389, retainedNodes: !265)
!398 = !DILocalVariable(name: "this", arg: 1, scope: !397, type: !399, flags: DIFlagArtificial | DIFlagObjectPointer)
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64)
!400 = !DILocation(line: 0, scope: !397)
!401 = !DILocation(line: 30, column: 26, scope: !397)
!402 = !DILocation(line: 30, column: 35, scope: !397)
!403 = !DILocation(line: 31, column: 3, scope: !404)
!404 = distinct !DILexicalBlock(scope: !397, file: !2, line: 30, column: 35)
!405 = !DILocation(line: 32, column: 3, scope: !404)
!406 = !DILocation(line: 33, column: 3, scope: !404)
!407 = !DILocation(line: 34, column: 1, scope: !397)
!408 = !DILocation(line: 34, column: 1, scope: !404)
!409 = distinct !DISubprogram(name: "deleteClass", linkageName: "_Z11deleteClassRP6IClass", scope: !2, file: !2, line: 68, type: !410, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !42, retainedNodes: !265)
!410 = !DISubroutineType(types: !411)
!411 = !{null, !412}
!412 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !279, size: 64)
!413 = !DILocalVariable(name: "clazz", arg: 1, scope: !409, file: !2, line: 68, type: !412)
!414 = !DILocation(line: 68, column: 34, scope: !409)
!415 = !DILocation(line: 69, column: 10, scope: !409)
!416 = !DILocation(line: 69, column: 3, scope: !409)
!417 = !DILocation(line: 70, column: 3, scope: !409)
!418 = !DILocation(line: 70, column: 9, scope: !409)
!419 = !DILocation(line: 71, column: 1, scope: !409)
!420 = distinct !DISubprogram(name: "~ClassAnon", linkageName: "_ZN12_GLOBAL__N_19ClassAnonD2Ev", scope: !385, file: !2, line: 58, type: !390, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !42, declaration: !393, retainedNodes: !265)
!421 = !DILocalVariable(name: "this", arg: 1, scope: !420, type: !399, flags: DIFlagArtificial | DIFlagObjectPointer)
!422 = !DILocation(line: 0, scope: !420)
!423 = !DILocation(line: 58, column: 25, scope: !420)
!424 = !DILocation(line: 59, column: 3, scope: !425)
!425 = distinct !DILexicalBlock(scope: !420, file: !2, line: 58, column: 25)
!426 = !DILocation(line: 60, column: 3, scope: !425)
!427 = !DILocation(line: 61, column: 3, scope: !425)
!428 = !DILocation(line: 62, column: 1, scope: !425)
!429 = !DILocation(line: 62, column: 1, scope: !420)
!430 = distinct !DISubprogram(name: "~ClassAnon", linkageName: "_ZN12_GLOBAL__N_19ClassAnonD0Ev", scope: !385, file: !2, line: 58, type: !390, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !42, declaration: !393, retainedNodes: !265)
!431 = !DILocalVariable(name: "this", arg: 1, scope: !430, type: !399, flags: DIFlagArtificial | DIFlagObjectPointer)
!432 = !DILocation(line: 0, scope: !430)
!433 = !DILocation(line: 58, column: 25, scope: !430)
!434 = !DILocation(line: 62, column: 1, scope: !430)
