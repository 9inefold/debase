; ModuleID = 'Simple.cpp'
; CommandLine = 'clang++ -I../../runtime -O0 -g -S -emit-llvm -Xclang -disable-llvm-passes Simple.cpp -o Simple.ll'
source_filename = "Simple.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

%struct.B = type <{ %struct.A, i32, [4 x i8] }>
%struct.A = type { ptr }
%struct.C = type { %struct.B.base, %struct.E, %"class.std::__1::basic_string" }
%struct.B.base = type <{ %struct.A, i32 }>
%struct.E = type { %struct.A }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char>::__rep" }
%"struct.std::__1::basic_string<char>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { %struct.anon.0, i64, ptr }
%struct.anon.0 = type { i64 }
%"struct.std::__1::__default_init_tag" = type { i8 }
%"struct.std::__1::basic_string<char>::__short" = type { %struct.anon, [0 x i8], [23 x i8] }
%struct.anon = type { i8 }

$_ZN1EC2Ev = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne180100Eyc = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne180100Ev = comdat any

$__clang_call_terminate = comdat any

$_ZN1AC2Ev = comdat any

$_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B8ne180100INS_18__default_init_tagESA_EEOT_OT0_ = comdat any

$_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B8ne180100ENS_18__default_init_tagE = comdat any

$_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B8ne180100ENS_18__default_init_tagE = comdat any

$_ZNSt3__19allocatorIcEC2B8ne180100Ev = comdat any

$_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne180100Ev = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne180100Ev = comdat any

$_ZNSt3__112__to_addressB8ne180100IKcEEPT_S3_ = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne180100Ev = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne180100Ev = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne180100Ev = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne180100Ev = comdat any

$_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne180100Ev = comdat any

$_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne180100Ev = comdat any

$_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne180100ERS1_ = comdat any

$_ZTS1A = comdat any

$_ZTI1A = comdat any

$_ZTS1B = comdat any

$_ZTI1B = comdat any

$_ZTS1E = comdat any

$_ZTI1E = comdat any

$_ZTS1C = comdat any

$_ZTI1C = comdat any

@_ZTV1A = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1A, ptr @_ZN1AD1Ev, ptr @_ZN1AD0Ev] }, align 8
@.str = private unnamed_addr constant [4 x i8] c"A!\0A\00", align 1, !dbg !0
@_ZTV1B = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1B, ptr @_ZN1BD1Ev, ptr @_ZN1BD0Ev] }, align 8
@.str.1 = private unnamed_addr constant [4 x i8] c"B!\0A\00", align 1, !dbg !8
@_ZTV1C = dso_local unnamed_addr constant { [4 x ptr], [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1C, ptr @_ZN1CD1Ev, ptr @_ZN1CD0Ev], [4 x ptr] [ptr inttoptr (i64 -16 to ptr), ptr @_ZTI1C, ptr @_ZThn16_N1CD1Ev, ptr @_ZThn16_N1CD0Ev] }, align 8
@.str.2 = private unnamed_addr constant [8 x i8] c"C(%s)!\0A\00", align 1, !dbg !10
@_ZTV1E = dso_local unnamed_addr constant { [4 x ptr] } { [4 x ptr] [ptr null, ptr @_ZTI1E, ptr @_ZN1ED1Ev, ptr @_ZN1ED0Ev] }, align 8
@.str.3 = private unnamed_addr constant [8 x i8] c"E(%i)!\0A\00", align 1, !dbg !15
@.str.4 = private unnamed_addr constant [5 x i8] c"~A!\0A\00", align 1, !dbg !17
@.str.5 = private unnamed_addr constant [5 x i8] c"~B!\0A\00", align 1, !dbg !22
@.str.6 = private unnamed_addr constant [5 x i8] c"~C!\0A\00", align 1, !dbg !24
@.str.7 = private unnamed_addr constant [5 x i8] c"~E!\0A\00", align 1, !dbg !26
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTS1A = linkonce_odr dso_local constant [3 x i8] c"1A\00", comdat, align 1
@_ZTI1A = linkonce_odr dso_local constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTS1A }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTS1B = linkonce_odr dso_local constant [3 x i8] c"1B\00", comdat, align 1
@_ZTI1B = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1B, ptr @_ZTI1A }, comdat, align 8
@_ZTS1E = linkonce_odr dso_local constant [3 x i8] c"1E\00", comdat, align 1
@_ZTI1E = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTS1E, ptr @_ZTI1A }, comdat, align 8
@_ZTVN10__cxxabiv121__vmi_class_type_infoE = external global [0 x ptr]
@_ZTS1C = linkonce_odr dso_local constant [3 x i8] c"1C\00", comdat, align 1
@_ZTI1C = linkonce_odr dso_local constant { ptr, ptr, i32, i32, ptr, i64, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr @_ZTS1C, i32 1, i32 2, ptr @_ZTI1B, i64 2, ptr @_ZTI1E, i64 4098 }, comdat, align 8

@_ZN1AC1Ei = dso_local unnamed_addr alias void (ptr, i32), ptr @_ZN1AC2Ei
@_ZN1BC1Ei = dso_local unnamed_addr alias void (ptr, i32), ptr @_ZN1BC2Ei
@_ZN1CC1Ei = dso_local unnamed_addr alias void (ptr, i32), ptr @_ZN1CC2Ei
@_ZN1EC1Ei = dso_local unnamed_addr alias void (ptr, i32), ptr @_ZN1EC2Ei
@_ZN1AD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1AD2Ev
@_ZN1BD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1BD2Ev
@_ZN1CD1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1CD2Ev
@_ZN1ED1Ev = dso_local unnamed_addr alias void (ptr), ptr @_ZN1ED2Ev

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN1AC2Ei(ptr noundef nonnull align 8 dereferenceable(8) %0, i32 noundef %1) unnamed_addr #0 align 2 !dbg !2085 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2100, metadata !DIExpression()), !dbg !2102
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2103, metadata !DIExpression()), !dbg !2104
  %5 = load ptr, ptr %3, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1A, i32 0, inrange i32 0, i32 2), ptr %5, align 8, !dbg !2105
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !2106
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !2108
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !2109
  ret void, !dbg !2110
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_begin() #2

declare dso_local i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_end() #2

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN1BC2Ei(ptr noundef nonnull align 8 dereferenceable(12) %0, i32 noundef %1) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !2111 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2124, metadata !DIExpression()), !dbg !2126
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2127, metadata !DIExpression()), !dbg !2128
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4, !dbg !2129
  call void @_ZN1AC2Ei(ptr noundef nonnull align 8 dereferenceable(8) %7, i32 noundef %8), !dbg !2130
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1B, i32 0, inrange i32 0, i32 2), ptr %7, align 8, !dbg !2131
  %9 = getelementptr inbounds %struct.B, ptr %7, i32 0, i32 1, !dbg !2132
  %10 = load i32, ptr %4, align 4, !dbg !2133
  store i32 %10, ptr %9, align 8, !dbg !2132
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !2134
  %11 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.1)
          to label %12 unwind label %13, !dbg !2136

12:                                               ; preds = %2
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !2137
  ret void, !dbg !2138

13:                                               ; preds = %2
  %14 = landingpad { ptr, i32 }
          cleanup, !dbg !2139
  %15 = extractvalue { ptr, i32 } %14, 0, !dbg !2139
  store ptr %15, ptr %5, align 8, !dbg !2139
  %16 = extractvalue { ptr, i32 } %14, 1, !dbg !2139
  store i32 %16, ptr %6, align 4, !dbg !2139
  call void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %7) #8, !dbg !2139
  br label %17, !dbg !2139

17:                                               ; preds = %13
  %18 = load ptr, ptr %5, align 8, !dbg !2139
  %19 = load i32, ptr %6, align 4, !dbg !2139
  %20 = insertvalue { ptr, i32 } poison, ptr %18, 0, !dbg !2139
  %21 = insertvalue { ptr, i32 } %20, i32 %19, 1, !dbg !2139
  resume { ptr, i32 } %21, !dbg !2139
}

declare dso_local i32 @__gxx_personality_seh0(...)

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 align 2 personality ptr @__gxx_personality_seh0 !dbg !2140 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2141, metadata !DIExpression()), !dbg !2142
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1A, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !2143
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !2144
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.4)
          to label %5 unwind label %6, !dbg !2146

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !2147
  ret void, !dbg !2148

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2146
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !2146
  call void @__clang_call_terminate(ptr %8) #9, !dbg !2146
  unreachable, !dbg !2146
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN1CC2Ei(ptr noundef nonnull align 8 dereferenceable(48) %0, i32 noundef %1) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !2149 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2176, metadata !DIExpression()), !dbg !2178
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2179, metadata !DIExpression()), !dbg !2180
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4, !dbg !2181
  call void @_ZN1BC2Ei(ptr noundef nonnull align 8 dereferenceable(12) %7, i32 noundef %8), !dbg !2182
  %9 = getelementptr inbounds i8, ptr %7, i64 16, !dbg !2183
  call void @_ZN1EC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %9) #8, !dbg !2184
  store ptr getelementptr inbounds ({ [4 x ptr], [4 x ptr] }, ptr @_ZTV1C, i32 0, inrange i32 0, i32 2), ptr %7, align 8, !dbg !2183
  %10 = getelementptr inbounds i8, ptr %7, i64 16, !dbg !2183
  store ptr getelementptr inbounds ({ [4 x ptr], [4 x ptr] }, ptr @_ZTV1C, i32 0, inrange i32 1, i32 2), ptr %10, align 8, !dbg !2183
  %11 = getelementptr inbounds %struct.C, ptr %7, i32 0, i32 2, !dbg !2185
  %12 = load i32, ptr %4, align 4, !dbg !2186
  %13 = sext i32 %12 to i64, !dbg !2186
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne180100Eyc(ptr noundef nonnull align 8 dereferenceable(24) %11, i64 noundef %13, i8 noundef 120)
          to label %14 unwind label %19, !dbg !2185

14:                                               ; preds = %2
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !2187
  %15 = getelementptr inbounds %struct.C, ptr %7, i32 0, i32 2, !dbg !2189
  %16 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %15) #8, !dbg !2190
  %17 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %16)
          to label %18 unwind label %23, !dbg !2191

18:                                               ; preds = %14
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !2192
  ret void, !dbg !2193

19:                                               ; preds = %2
  %20 = landingpad { ptr, i32 }
          cleanup, !dbg !2193
  %21 = extractvalue { ptr, i32 } %20, 0, !dbg !2193
  store ptr %21, ptr %5, align 8, !dbg !2193
  %22 = extractvalue { ptr, i32 } %20, 1, !dbg !2193
  store i32 %22, ptr %6, align 4, !dbg !2193
  br label %27, !dbg !2193

23:                                               ; preds = %14
  %24 = landingpad { ptr, i32 }
          cleanup, !dbg !2194
  %25 = extractvalue { ptr, i32 } %24, 0, !dbg !2194
  store ptr %25, ptr %5, align 8, !dbg !2194
  %26 = extractvalue { ptr, i32 } %24, 1, !dbg !2194
  store i32 %26, ptr %6, align 4, !dbg !2194
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %11) #8, !dbg !2194
  br label %27, !dbg !2194

27:                                               ; preds = %23, %19
  %28 = getelementptr inbounds i8, ptr %7, i64 16, !dbg !2194
  call void @_ZN1ED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %28) #8, !dbg !2194
  call void @_ZN1BD2Ev(ptr noundef nonnull align 8 dereferenceable(12) %7) #8, !dbg !2194
  br label %29, !dbg !2194

29:                                               ; preds = %27
  %30 = load ptr, ptr %5, align 8, !dbg !2194
  %31 = load i32, ptr %6, align 4, !dbg !2194
  %32 = insertvalue { ptr, i32 } poison, ptr %30, 0, !dbg !2194
  %33 = insertvalue { ptr, i32 } %32, i32 %31, 1, !dbg !2194
  resume { ptr, i32 } %33, !dbg !2194
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN1EC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 comdat align 2 !dbg !2195 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2196, metadata !DIExpression()), !dbg !2198
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1AC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !2199
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1E, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !2200
  ret void, !dbg !2200
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne180100Eyc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef %2) unnamed_addr #0 comdat align 2 !dbg !2201 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  %7 = alloca %"struct.std::__1::__default_init_tag", align 1
  %8 = alloca %"struct.std::__1::__default_init_tag", align 1
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2202, metadata !DIExpression()), !dbg !2204
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2205, metadata !DIExpression()), !dbg !2206
  store i8 %2, ptr %6, align 1
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2207, metadata !DIExpression()), !dbg !2208
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %"class.std::__1::basic_string", ptr %9, i32 0, i32 0, !dbg !2209
  call void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B8ne180100INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 1 dereferenceable(1) %7, ptr noundef nonnull align 1 dereferenceable(1) %8), !dbg !2209
  %11 = load i64, ptr %5, align 8, !dbg !2210
  %12 = load i8, ptr %6, align 1, !dbg !2212
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEyc(ptr noundef nonnull align 8 dereferenceable(24) %9, i64 noundef %11, i8 noundef %12), !dbg !2213
  ret void, !dbg !2214
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 comdat align 2 !dbg !2215 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2216, metadata !DIExpression()), !dbg !2218
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #8, !dbg !2219
  ret ptr %4, !dbg !2220
}

; Function Attrs: nounwind
declare dso_local void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #2

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1ED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 align 2 personality ptr @__gxx_personality_seh0 !dbg !2221 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2222, metadata !DIExpression()), !dbg !2223
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1E, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !2224
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !2225
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.7)
          to label %5 unwind label %6, !dbg !2227

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !2228
  call void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !2229
  ret void, !dbg !2230

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2227
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !2227
  call void @__clang_call_terminate(ptr %8) #9, !dbg !2227
  unreachable, !dbg !2227
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1BD2Ev(ptr noundef nonnull align 8 dereferenceable(12) %0) unnamed_addr #4 align 2 personality ptr @__gxx_personality_seh0 !dbg !2231 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2232, metadata !DIExpression()), !dbg !2233
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1B, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !2234
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !2235
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.5)
          to label %5 unwind label %6, !dbg !2237

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !2238
  call void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !2239
  ret void, !dbg !2240

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2237
  %8 = extractvalue { ptr, i32 } %7, 0, !dbg !2237
  call void @__clang_call_terminate(ptr %8) #9, !dbg !2237
  unreachable, !dbg !2237
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_ZN1EC2Ei(ptr noundef nonnull align 8 dereferenceable(8) %0, i32 noundef %1) unnamed_addr #0 align 2 personality ptr @__gxx_personality_seh0 !dbg !2241 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2242, metadata !DIExpression()), !dbg !2243
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2244, metadata !DIExpression()), !dbg !2245
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4, !dbg !2246
  %9 = add nsw i32 %8, 1, !dbg !2247
  call void @_ZN1AC2Ei(ptr noundef nonnull align 8 dereferenceable(8) %7, i32 noundef %9), !dbg !2248
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1E, i32 0, inrange i32 0, i32 2), ptr %7, align 8, !dbg !2249
  notail call preserve_mostcc void @__debase_mark_begin() #8, !dbg !2250
  %10 = load i32, ptr %4, align 4, !dbg !2252
  %11 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %10)
          to label %12 unwind label %13, !dbg !2253

12:                                               ; preds = %2
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !2254
  ret void, !dbg !2255

13:                                               ; preds = %2
  %14 = landingpad { ptr, i32 }
          cleanup, !dbg !2256
  %15 = extractvalue { ptr, i32 } %14, 0, !dbg !2256
  store ptr %15, ptr %5, align 8, !dbg !2256
  %16 = extractvalue { ptr, i32 } %14, 1, !dbg !2256
  store i32 %16, ptr %6, align 4, !dbg !2256
  call void @_ZN1AD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %7) #8, !dbg !2256
  br label %17, !dbg !2256

17:                                               ; preds = %13
  %18 = load ptr, ptr %5, align 8, !dbg !2256
  %19 = load i32, ptr %6, align 4, !dbg !2256
  %20 = insertvalue { ptr, i32 } poison, ptr %18, 0, !dbg !2256
  %21 = insertvalue { ptr, i32 } %20, i32 %19, 1, !dbg !2256
  resume { ptr, i32 } %21, !dbg !2256
}

; Function Attrs: noinline noreturn nounwind uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #5 comdat {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #8
  call void @_ZSt9terminatev() #9
  unreachable
}

declare dso_local ptr @__cxa_begin_catch(ptr)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1AD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 align 2 !dbg !2257 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2258, metadata !DIExpression()), !dbg !2259
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1AD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !2260
  call void @_ZdlPv(ptr noundef %3) #10, !dbg !2260
  ret void, !dbg !2261
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(ptr noundef) #6

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1BD0Ev(ptr noundef nonnull align 8 dereferenceable(12) %0) unnamed_addr #4 align 2 !dbg !2262 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2263, metadata !DIExpression()), !dbg !2264
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1BD1Ev(ptr noundef nonnull align 8 dereferenceable(12) %3) #8, !dbg !2265
  call void @_ZdlPv(ptr noundef %3) #10, !dbg !2265
  ret void, !dbg !2266
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1CD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %0) unnamed_addr #4 align 2 personality ptr @__gxx_personality_seh0 !dbg !2267 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2268, metadata !DIExpression()), !dbg !2269
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr], [4 x ptr] }, ptr @_ZTV1C, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !2270
  %4 = getelementptr inbounds i8, ptr %3, i64 16, !dbg !2270
  store ptr getelementptr inbounds ({ [4 x ptr], [4 x ptr] }, ptr @_ZTV1C, i32 0, inrange i32 1, i32 2), ptr %4, align 8, !dbg !2270
  %5 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.6)
          to label %6 unwind label %9, !dbg !2271

6:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #8, !dbg !2273
  %7 = getelementptr inbounds %struct.C, ptr %3, i32 0, i32 2, !dbg !2274
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #8, !dbg !2274
  %8 = getelementptr inbounds i8, ptr %3, i64 16, !dbg !2274
  call void @_ZN1ED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #8, !dbg !2274
  call void @_ZN1BD2Ev(ptr noundef nonnull align 8 dereferenceable(12) %3) #8, !dbg !2274
  ret void, !dbg !2275

9:                                                ; preds = %1
  %10 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2271
  %11 = extractvalue { ptr, i32 } %10, 0, !dbg !2271
  call void @__clang_call_terminate(ptr %11) #9, !dbg !2271
  unreachable, !dbg !2271
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_ZThn16_N1CD1Ev(ptr noundef %0) unnamed_addr #7 align 2 !dbg !2276 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8, !dbg !2278
  %4 = getelementptr inbounds i8, ptr %3, i64 -16, !dbg !2278
  tail call void @_ZN1CD1Ev(ptr noundef nonnull align 8 dereferenceable(48) %4) #8, !dbg !2278
  ret void, !dbg !2278
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1CD0Ev(ptr noundef nonnull align 8 dereferenceable(48) %0) unnamed_addr #4 align 2 !dbg !2279 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2280, metadata !DIExpression()), !dbg !2281
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1CD1Ev(ptr noundef nonnull align 8 dereferenceable(48) %3) #8, !dbg !2282
  call void @_ZdlPv(ptr noundef %3) #10, !dbg !2282
  ret void, !dbg !2283
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_ZThn16_N1CD0Ev(ptr noundef %0) unnamed_addr #7 align 2 !dbg !2284 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8, !dbg !2285
  %4 = getelementptr inbounds i8, ptr %3, i64 -16, !dbg !2285
  tail call void @_ZN1CD0Ev(ptr noundef nonnull align 8 dereferenceable(48) %4) #8, !dbg !2285
  ret void, !dbg !2285
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN1ED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 align 2 !dbg !2286 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2287, metadata !DIExpression()), !dbg !2288
  %3 = load ptr, ptr %2, align 8
  call void @_ZN1ED1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #8, !dbg !2289
  call void @_ZdlPv(ptr noundef %3) #10, !dbg !2289
  ret void, !dbg !2290
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN1AC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 comdat align 2 !dbg !2291 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2292, metadata !DIExpression()), !dbg !2293
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTV1A, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !2294
  ret void, !dbg !2294
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B8ne180100INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 comdat align 2 !dbg !2295 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"struct.std::__1::__default_init_tag", align 1
  %8 = alloca %"struct.std::__1::__default_init_tag", align 1
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2303, metadata !DIExpression()), !dbg !2304
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2305, metadata !DIExpression()), !dbg !2306
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2307, metadata !DIExpression()), !dbg !2308
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %5, align 8, !dbg !2309
  %11 = getelementptr inbounds %"struct.std::__1::__default_init_tag", ptr %7, i32 0, i32 0, !dbg !2310
  %12 = load i8, ptr %11, align 1, !dbg !2310
  call void @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B8ne180100ENS_18__default_init_tagE(ptr noundef nonnull align 8 dereferenceable(24) %9, i8 %12), !dbg !2310
  %13 = load ptr, ptr %6, align 8, !dbg !2311
  %14 = getelementptr inbounds %"struct.std::__1::__default_init_tag", ptr %8, i32 0, i32 0, !dbg !2312
  %15 = load i8, ptr %14, align 1, !dbg !2312
  call void @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B8ne180100ENS_18__default_init_tagE(ptr noundef nonnull align 1 dereferenceable(1) %9, i8 %15), !dbg !2312
  ret void, !dbg !2313
}

declare dso_local void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEyc(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, i8 noundef) #3

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B8ne180100ENS_18__default_init_tagE(ptr noundef nonnull align 8 dereferenceable(24) %0, i8 %1) unnamed_addr #4 comdat align 2 !dbg !2314 {
  %3 = alloca %"struct.std::__1::__default_init_tag", align 1
  %4 = alloca ptr, align 8
  %5 = getelementptr inbounds %"struct.std::__1::__default_init_tag", ptr %3, i32 0, i32 0
  store i8 %1, ptr %5, align 1
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2315, metadata !DIExpression()), !dbg !2316
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2317, metadata !DIExpression()), !dbg !2318
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", ptr %6, i32 0, i32 0, !dbg !2319
  ret void, !dbg !2320
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B8ne180100ENS_18__default_init_tagE(ptr noundef nonnull align 1 dereferenceable(1) %0, i8 %1) unnamed_addr #4 comdat align 2 !dbg !2321 {
  %3 = alloca %"struct.std::__1::__default_init_tag", align 1
  %4 = alloca ptr, align 8
  %5 = getelementptr inbounds %"struct.std::__1::__default_init_tag", ptr %3, i32 0, i32 0
  store i8 %1, ptr %5, align 1
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2322, metadata !DIExpression()), !dbg !2323
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2324, metadata !DIExpression()), !dbg !2325
  %6 = load ptr, ptr %4, align 8
  call void @_ZNSt3__19allocatorIcEC2B8ne180100Ev(ptr noundef nonnull align 1 dereferenceable(1) %6) #8, !dbg !2326
  ret void, !dbg !2327
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3__19allocatorIcEC2B8ne180100Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #4 comdat align 2 !dbg !2328 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2329, metadata !DIExpression()), !dbg !2331
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne180100Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #8, !dbg !2332
  ret void, !dbg !2333
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne180100Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #4 comdat align 2 !dbg !2334 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2335, metadata !DIExpression()), !dbg !2337
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !2338
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 comdat align 2 !dbg !2339 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2340, metadata !DIExpression()), !dbg !2341
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #8, !dbg !2342
  %5 = call noundef ptr @_ZNSt3__112__to_addressB8ne180100IKcEEPT_S3_(ptr noundef %4) #8, !dbg !2343
  ret ptr %5, !dbg !2344
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt3__112__to_addressB8ne180100IKcEEPT_S3_(ptr noundef %0) #4 comdat !dbg !2345 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2351, metadata !DIExpression()), !dbg !2352
  %3 = load ptr, ptr %2, align 8, !dbg !2353
  ret ptr %3, !dbg !2354
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 comdat align 2 !dbg !2355 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2356, metadata !DIExpression()), !dbg !2357
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #8, !dbg !2358
  br i1 %4, label %5, label %7, !dbg !2358

5:                                                ; preds = %1
  %6 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #8, !dbg !2359
  br label %9, !dbg !2358

7:                                                ; preds = %1
  %8 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #8, !dbg !2360
  br label %9, !dbg !2358

9:                                                ; preds = %7, %5
  %10 = phi ptr [ %6, %5 ], [ %8, %7 ], !dbg !2358
  ret ptr %10, !dbg !2361
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 comdat align 2 !dbg !2362 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2363, metadata !DIExpression()), !dbg !2364
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0, !dbg !2365
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #8, !dbg !2366
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", ptr %5, i32 0, i32 0, !dbg !2367
  %7 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %6, i32 0, i32 0, !dbg !2368
  %8 = load i8, ptr %7, align 8, !dbg !2368
  %9 = and i8 %8, 1, !dbg !2368
  %10 = icmp ne i8 %9, 0, !dbg !2365
  ret i1 %10, !dbg !2369
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 comdat align 2 !dbg !2370 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2371, metadata !DIExpression()), !dbg !2372
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0, !dbg !2373
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #8, !dbg !2374
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", ptr %5, i32 0, i32 0, !dbg !2375
  %7 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %6, i32 0, i32 2, !dbg !2376
  %8 = load ptr, ptr %7, align 8, !dbg !2376
  ret ptr %8, !dbg !2377
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 comdat align 2 !dbg !2378 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2379, metadata !DIExpression()), !dbg !2380
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0, !dbg !2381
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #8, !dbg !2382
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", ptr %5, i32 0, i32 0, !dbg !2383
  %7 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %6, i32 0, i32 2, !dbg !2384
  %8 = getelementptr inbounds [23 x i8], ptr %7, i64 0, i64 0, !dbg !2381
  %9 = call noundef ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne180100ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %8) #8, !dbg !2385
  ret ptr %9, !dbg !2386
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 comdat align 2 !dbg !2387 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2388, metadata !DIExpression()), !dbg !2390
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #8, !dbg !2391
  ret ptr %4, !dbg !2392
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne180100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 comdat align 2 !dbg !2393 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2394, metadata !DIExpression()), !dbg !2396
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", ptr %3, i32 0, i32 0, !dbg !2397
  ret ptr %4, !dbg !2398
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne180100ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %0) #4 comdat align 2 !dbg !2399 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2408, metadata !DIExpression()), !dbg !2409
  %3 = load ptr, ptr %2, align 8, !dbg !2410
  ret ptr %3, !dbg !2411
}

attributes #0 = { mustprogress noinline optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline noreturn nounwind uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { builtin nounwind }

!llvm.dbg.cu = !{!28}
!llvm.module.flags = !{!2078, !2079, !2080, !2081, !2082, !2083}
!llvm.ident = !{!2084}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 7, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "Simple.cpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Simple")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 4)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 13, type: !3, isLocal: true, isDefinition: true)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(scope: null, file: !2, line: 19, type: !12, isLocal: true, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 8)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(scope: null, file: !2, line: 25, type: !12, isLocal: true, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 5)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !2, line: 37, type: !19, isLocal: true, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 42, type: !19, isLocal: true, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !2, line: 48, type: !19, isLocal: true, isDefinition: true)
!28 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "clang version 18.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !29, globals: !874, imports: !875, splitDebugInlining: false, nameTableKind: None)
!29 = !{!30, !43, !89, !121, !95, !263, !117}
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__non_trivial_if<true, std::__1::allocator<char> >", scope: !32, file: !31, line: 92, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !34, templateParams: !39, identifier: "_ZTSNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEE")
!31 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__memory/allocator.h", directory: "")
!32 = !DINamespace(name: "__1", scope: !33, exportSymbols: true)
!33 = !DINamespace(name: "std", scope: null)
!34 = !{!35}
!35 = !DISubprogram(name: "__non_trivial_if", scope: !30, file: !31, line: 93, type: !36, scopeLine: 93, flags: DIFlagPrototyped, spFlags: 0)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!39 = !{!40, !42}
!40 = !DITemplateValueParameter(name: "_Cond", type: !41, value: i1 true)
!41 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!42 = !DITemplateTypeParameter(name: "_Unique", type: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char>", scope: !32, file: !31, line: 102, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !44, templateParams: !87, identifier: "_ZTSNSt3__19allocatorIcEE")
!44 = !{!45, !46, !50, !57, !60, !68, !75, !80, !84}
!45 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !43, baseType: !30, extraData: i32 0)
!46 = !DISubprogram(name: "allocator", scope: !43, file: !31, line: 114, type: !47, scopeLine: 114, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!50 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIcE8allocateB8ne180100Ey", scope: !43, file: !31, line: 119, type: !51, scopeLine: 119, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !49, !54}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 35, baseType: !56)
!55 = !DIFile(filename: "C:/msys64/clang64/include/corecrt.h", directory: "")
!56 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!57 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__19allocatorIcE10deallocateB8ne180100EPcy", scope: !43, file: !31, line: 135, type: !58, scopeLine: 135, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !49, !53, !54}
!60 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIcE7addressB8ne180100ERc", scope: !43, file: !31, line: 155, type: !61, scopeLine: 155, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !64, !66}
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !43, file: !31, line: 145, baseType: !53, flags: DIFlagPublic)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!65 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !43)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !43, file: !31, line: 147, baseType: !67, flags: DIFlagPublic)
!67 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5, size: 64)
!68 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIcE7addressB8ne180100ERKc", scope: !43, file: !31, line: 158, type: !69, scopeLine: 158, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !64, !73}
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !43, file: !31, line: 146, baseType: !72, flags: DIFlagPublic)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !43, file: !31, line: 148, baseType: !74, flags: DIFlagPublic)
!74 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4, size: 64)
!75 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIcE8allocateB8ne180100EyPKv", scope: !43, file: !31, line: 163, type: !76, scopeLine: 163, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!76 = !DISubroutineType(types: !77)
!77 = !{!53, !49, !54, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!80 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__19allocatorIcE8max_sizeB8ne180100Ev", scope: !43, file: !31, line: 167, type: !81, scopeLine: 167, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !64}
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !31, line: 106, baseType: !54, flags: DIFlagPublic)
!84 = !DISubprogram(name: "destroy", linkageName: "_ZNSt3__19allocatorIcE7destroyB8ne180100EPc", scope: !43, file: !31, line: 176, type: !85, scopeLine: 176, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!85 = !DISubroutineType(types: !86)
!86 = !{null, !49, !63}
!87 = !{!88}
!88 = !DITemplateTypeParameter(name: "_Tp", type: !5)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__compressed_pair_elem<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__rep, 0, false>", scope: !32, file: !90, line: 44, size: 192, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !91, templateParams: !870, identifier: "_ZTSNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEE")
!90 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__memory/compressed_pair.h", directory: "")
!91 = !{!92, !855, !859, !862, !865}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "__value_", scope: !89, file: !90, line: 67, baseType: !93, size: 192, flags: DIFlagPrivate)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__rep", scope: !95, file: !94, line: 832, size: 192, flags: DIFlagTypePassByValue, elements: !817, identifier: "_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repE")
!94 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/string", directory: "")
!95 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >", scope: !32, file: !94, line: 709, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !96, templateParams: !815, identifier: "_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE")
!96 = !{!97, !116, !190, !191, !199, !206, !215, !218, !221, !225, !228, !232, !235, !238, !241, !244, !247, !250, !255, !258, !259, !447, !451, !454, !457, !463, !466, !469, !472, !473, !474, !479, !484, !485, !486, !487, !488, !489, !490, !493, !494, !495, !496, !499, !502, !503, !504, !505, !506, !507, !510, !515, !520, !521, !522, !523, !524, !525, !526, !527, !530, !533, !534, !537, !538, !539, !542, !543, !546, !549, !550, !551, !552, !553, !554, !555, !556, !557, !558, !561, !564, !567, !570, !573, !576, !579, !582, !585, !588, !591, !594, !597, !600, !603, !606, !609, !612, !615, !618, !621, !625, !628, !631, !634, !635, !638, !641, !644, !647, !650, !653, !654, !655, !656, !657, !658, !659, !660, !661, !662, !663, !664, !665, !666, !667, !668, !669, !670, !671, !672, !673, !676, !679, !682, !685, !688, !691, !692, !693, !694, !695, !698, !701, !705, !708, !709, !710, !711, !712, !713, !714, !715, !718, !721, !724, !725, !726, !727, !728, !731, !732, !735, !738, !739, !740, !743, !746, !749, !750, !751, !754, !755, !758, !759, !762, !763, !782, !798, !801, !804, !805, !806, !807, !808, !809, !810, !813, !814}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "__endian_factor", scope: !95, file: !94, line: 790, baseType: !98, flags: DIFlagStaticMember, extraData: i64 2)
!98 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !95, file: !94, line: 720, baseType: !100, flags: DIFlagPublic)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !102, file: !101, line: 243, baseType: !115)
!101 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__memory/allocator_traits.h", directory: "")
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::__1::allocator<char> >", scope: !32, file: !101, line: 235, size: 8, flags: DIFlagTypePassByValue, elements: !103, templateParams: !113, identifier: "_ZTSNSt3__116allocator_traitsINS_9allocatorIcEEEE")
!103 = !{!104, !110}
!104 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB8ne180100ERS2_y", scope: !102, file: !101, line: 268, type: !105, scopeLine: 268, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!105 = !DISubroutineType(types: !106)
!106 = !{!107, !108, !100}
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !102, file: !101, line: 238, baseType: !63)
!108 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !102, file: !101, line: 236, baseType: !43)
!110 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIcEEE10deallocateB8ne180100ERS2_Pcy", scope: !102, file: !101, line: 288, type: !111, scopeLine: 288, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!111 = !DISubroutineType(types: !112)
!112 = !{null, !108, !107, !100}
!113 = !{!114}
!114 = !DITemplateTypeParameter(name: "_Alloc", type: !43)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !43, file: !31, line: 106, baseType: !54, flags: DIFlagPublic)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "__r_", scope: !95, file: !94, line: 840, baseType: !117, size: 192)
!117 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__rep, std::__1::allocator<char> >", scope: !32, file: !90, line: 97, size: 192, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !118, templateParams: !187, identifier: "_ZTSNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EE")
!118 = !{!119, !120, !154, !160, !168, !171, !174, !179, !183}
!119 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !117, baseType: !89, extraData: i32 0)
!120 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !117, baseType: !121, extraData: i32 0)
!121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__compressed_pair_elem<std::__1::allocator<char>, 1, true>", scope: !32, file: !90, line: 71, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !122, templateParams: !149, identifier: "_ZTSNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEE")
!122 = !{!123, !124, !128, !133, !137, !142}
!123 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !121, baseType: !43, flags: DIFlagPrivate, extraData: i32 0)
!124 = !DISubprogram(name: "__compressed_pair_elem", scope: !121, file: !90, line: 77, type: !125, scopeLine: 77, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!125 = !DISubroutineType(types: !126)
!126 = !{null, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!128 = !DISubprogram(name: "__compressed_pair_elem", scope: !121, file: !90, line: 78, type: !129, scopeLine: 78, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!129 = !DISubroutineType(types: !130)
!130 = !{null, !127, !131}
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__default_init_tag", scope: !32, file: !90, line: 40, size: 8, flags: DIFlagTypePassByValue, elements: !132, identifier: "_ZTSNSt3__118__default_init_tagE")
!132 = !{}
!133 = !DISubprogram(name: "__compressed_pair_elem", scope: !121, file: !90, line: 79, type: !134, scopeLine: 79, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!134 = !DISubroutineType(types: !135)
!135 = !{null, !127, !136}
!136 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__value_init_tag", scope: !32, file: !90, line: 41, size: 8, flags: DIFlagTypePassByValue, elements: !132, identifier: "_ZTSNSt3__116__value_init_tagE")
!137 = !DISubprogram(name: "__get", linkageName: "_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB8ne180100Ev", scope: !121, file: !90, line: 92, type: !138, scopeLine: 92, flags: DIFlagPrototyped, spFlags: 0)
!138 = !DISubroutineType(types: !139)
!139 = !{!140, !127}
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !121, file: !90, line: 73, baseType: !141)
!141 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !43, size: 64)
!142 = !DISubprogram(name: "__get", linkageName: "_ZNKSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB8ne180100Ev", scope: !121, file: !90, line: 93, type: !143, scopeLine: 93, flags: DIFlagPrototyped, spFlags: 0)
!143 = !DISubroutineType(types: !144)
!144 = !{!145, !147}
!145 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !121, file: !90, line: 74, baseType: !146)
!146 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !65, size: 64)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!148 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !121)
!149 = !{!150, !151, !153}
!150 = !DITemplateTypeParameter(name: "_Tp", type: !43)
!151 = !DITemplateValueParameter(name: "_Idx", type: !152, value: i32 1)
!152 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!153 = !DITemplateValueParameter(name: "_CanBeEmptyBase", type: !41, defaulted: true, value: i1 true)
!154 = !DISubprogram(name: "first", linkageName: "_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne180100Ev", scope: !117, file: !90, line: 129, type: !155, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!155 = !DISubroutineType(types: !156)
!156 = !{!157, !159}
!157 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !89, file: !90, line: 46, baseType: !158)
!158 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !93, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!160 = !DISubprogram(name: "first", linkageName: "_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne180100Ev", scope: !117, file: !90, line: 133, type: !161, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!161 = !DISubroutineType(types: !162)
!162 = !{!163, !166}
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !89, file: !90, line: 47, baseType: !164)
!164 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !93)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!167 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !117)
!168 = !DISubprogram(name: "second", linkageName: "_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB8ne180100Ev", scope: !117, file: !90, line: 137, type: !169, scopeLine: 137, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!169 = !DISubroutineType(types: !170)
!170 = !{!140, !159}
!171 = !DISubprogram(name: "second", linkageName: "_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB8ne180100Ev", scope: !117, file: !90, line: 141, type: !172, scopeLine: 141, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!172 = !DISubroutineType(types: !173)
!173 = !{!145, !166}
!174 = !DISubprogram(name: "__get_first_base", linkageName: "_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E16__get_first_baseB8ne180100EPS8_", scope: !117, file: !90, line: 145, type: !175, scopeLine: 145, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!175 = !DISubroutineType(types: !176)
!176 = !{!177, !178}
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!179 = !DISubprogram(name: "__get_second_base", linkageName: "_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E17__get_second_baseB8ne180100EPS8_", scope: !117, file: !90, line: 148, type: !180, scopeLine: 148, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!180 = !DISubroutineType(types: !181)
!181 = !{!182, !178}
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!183 = !DISubprogram(name: "swap", linkageName: "_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E4swapB8ne180100ERS8_", scope: !117, file: !90, line: 152, type: !184, scopeLine: 152, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!184 = !DISubroutineType(types: !185)
!185 = !{null, !159, !186}
!186 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !117, size: 64)
!187 = !{!188, !189}
!188 = !DITemplateTypeParameter(name: "_T1", type: !93)
!189 = !DITemplateTypeParameter(name: "_T2", type: !43)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "npos", scope: !95, file: !94, line: 878, baseType: !98, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 -1)
!191 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 845, type: !192, scopeLine: 845, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!192 = !DISubroutineType(types: !193)
!193 = !{null, !194, !195, !99, !196}
!194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!195 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uninitialized_size_tag", scope: !32, file: !94, line: 705, size: 8, flags: DIFlagTypePassByValue, elements: !132, identifier: "_ZTSNSt3__124__uninitialized_size_tagE")
!196 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !197, size: 64)
!197 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !198)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !95, file: !94, line: 718, baseType: !43, flags: DIFlagPublic)
!199 = !DISubprogram(name: "__make_iterator", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__make_iteratorB8ne180100EPc", scope: !95, file: !94, line: 871, type: !200, scopeLine: 871, flags: DIFlagPrototyped, spFlags: 0)
!200 = !DISubroutineType(types: !201)
!201 = !{!202, !194, !205}
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !95, file: !94, line: 740, baseType: !203, flags: DIFlagPublic)
!203 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char *>", scope: !32, file: !204, line: 28, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPcEE")
!204 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__iterator/wrap_iter.h", directory: "")
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !95, file: !94, line: 724, baseType: !107, flags: DIFlagPublic)
!206 = !DISubprogram(name: "__make_const_iterator", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE21__make_const_iteratorB8ne180100EPKc", scope: !95, file: !94, line: 873, type: !207, scopeLine: 873, flags: DIFlagPrototyped, spFlags: 0)
!207 = !DISubroutineType(types: !208)
!208 = !{!209, !211, !213}
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !95, file: !94, line: 741, baseType: !210, flags: DIFlagPublic)
!210 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<const char *>", scope: !32, file: !204, line: 28, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPKcEE")
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!212 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !95)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !95, file: !94, line: 725, baseType: !214, flags: DIFlagPublic)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !102, file: !101, line: 239, baseType: !71)
!215 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 880, type: !216, scopeLine: 880, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!216 = !DISubroutineType(types: !217)
!217 = !{null, !194}
!218 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 886, type: !219, scopeLine: 886, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!219 = !DISubroutineType(types: !220)
!220 = !{null, !194, !196}
!221 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 896, type: !222, scopeLine: 896, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!222 = !DISubroutineType(types: !223)
!223 = !{null, !194, !224}
!224 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !212, size: 64)
!225 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 906, type: !226, scopeLine: 906, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!226 = !DISubroutineType(types: !227)
!227 = !{null, !194, !224, !196}
!228 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 916, type: !229, scopeLine: 916, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!229 = !DISubroutineType(types: !230)
!230 = !{null, !194, !231}
!231 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !95, size: 64)
!232 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 932, type: !233, scopeLine: 932, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!233 = !DISubroutineType(types: !234)
!234 = !{null, !194, !231, !196}
!235 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 968, type: !236, scopeLine: 968, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!236 = !DISubroutineType(types: !237)
!237 = !{null, !194, !72, !99}
!238 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 975, type: !239, scopeLine: 975, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!239 = !DISubroutineType(types: !240)
!240 = !{null, !194, !72, !99, !146}
!241 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 981, type: !242, scopeLine: 981, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!242 = !DISubroutineType(types: !243)
!243 = !{null, !194, !99, !5}
!244 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 1014, type: !245, scopeLine: 1014, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!245 = !DISubroutineType(types: !246)
!246 = !{null, !194, !224, !99, !99, !146}
!247 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 1023, type: !248, scopeLine: 1023, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!248 = !DISubroutineType(types: !249)
!249 = !{null, !194, !224, !99, !146}
!250 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 1091, type: !251, scopeLine: 1091, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!251 = !DISubroutineType(types: !252)
!252 = !{null, !194, !253}
!253 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char>", scope: !33, file: !254, line: 59, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16initializer_listIcE")
!254 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/initializer_list", directory: "")
!255 = !DISubprogram(name: "basic_string", scope: !95, file: !94, line: 1096, type: !256, scopeLine: 1096, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!256 = !DISubroutineType(types: !257)
!257 = !{null, !194, !253, !146}
!258 = !DISubprogram(name: "~basic_string", scope: !95, file: !94, line: 1102, type: !216, scopeLine: 1102, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!259 = !DISubprogram(name: "operator basic_string_view", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEcvNS_17basic_string_viewIcS2_EEB8ne180100Ev", scope: !95, file: !94, line: 1108, type: !260, scopeLine: 1108, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!260 = !DISubroutineType(types: !261)
!261 = !{!262, !211}
!262 = !DIDerivedType(tag: DW_TAG_typedef, name: "__self_view", scope: !95, file: !94, line: 715, baseType: !263, flags: DIFlagPublic)
!263 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "basic_string_view<char, std::__1::char_traits<char> >", scope: !32, file: !264, line: 272, size: 128, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !265, templateParams: !395, identifier: "_ZTSNSt3__117basic_string_viewIcNS_11char_traitsIcEEEE")
!264 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/string_view", directory: "")
!265 = !{!266, !269, !273, !274, !278, !283, !287, !290, !293, !299, !300, !301, !302, !308, !309, !310, !311, !314, !315, !316, !319, !323, !324, !327, !328, !331, !334, !335, !338, !342, !345, !348, !351, !354, !357, !360, !363, !366, !369, !372, !375, !376, !377, !378, !379, !380, !381, !382, !383, !384, !385, !386, !387, !388, !389, !390, !391, !392, !393, !394}
!266 = !DIDerivedType(tag: DW_TAG_member, name: "npos", scope: !263, file: !264, line: 291, baseType: !267, flags: DIFlagPublic | DIFlagStaticMember)
!267 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !268)
!268 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !264, line: 289, baseType: !54, flags: DIFlagPublic)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "__data_", scope: !263, file: !264, line: 674, baseType: !270, size: 64)
!270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!271 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !272)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !263, file: !264, line: 276, baseType: !5, flags: DIFlagPublic)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "__size_", scope: !263, file: !264, line: 675, baseType: !268, size: 64, offset: 64)
!274 = !DISubprogram(name: "basic_string_view", scope: !263, file: !264, line: 300, type: !275, scopeLine: 300, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!275 = !DISubroutineType(types: !276)
!276 = !{null, !277}
!277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !263, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!278 = !DISubprogram(name: "basic_string_view", scope: !263, file: !264, line: 302, type: !279, scopeLine: 302, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!279 = !DISubroutineType(types: !280)
!280 = !{null, !277, !281}
!281 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !282, size: 64)
!282 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !263)
!283 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEaSB8ne180100ERKS3_", scope: !263, file: !264, line: 304, type: !284, scopeLine: 304, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!284 = !DISubroutineType(types: !285)
!285 = !{!286, !277, !281}
!286 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !263, size: 64)
!287 = !DISubprogram(name: "basic_string_view", scope: !263, file: !264, line: 306, type: !288, scopeLine: 306, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!288 = !DISubroutineType(types: !289)
!289 = !{null, !277, !72, !268}
!290 = !DISubprogram(name: "basic_string_view", scope: !263, file: !264, line: 340, type: !291, scopeLine: 340, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!291 = !DISubroutineType(types: !292)
!292 = !{null, !277, !72}
!293 = !DISubprogram(name: "begin", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE5beginB8ne180100Ev", scope: !263, file: !264, line: 348, type: !294, scopeLine: 348, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!294 = !DISubroutineType(types: !295)
!295 = !{!296, !298}
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !263, file: !264, line: 284, baseType: !297, flags: DIFlagPublic)
!297 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !263, file: !264, line: 278, baseType: !72, flags: DIFlagPublic)
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !282, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!299 = !DISubprogram(name: "end", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE3endB8ne180100Ev", scope: !263, file: !264, line: 350, type: !294, scopeLine: 350, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!300 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE6cbeginB8ne180100Ev", scope: !263, file: !264, line: 352, type: !294, scopeLine: 352, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!301 = !DISubprogram(name: "cend", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4cendB8ne180100Ev", scope: !263, file: !264, line: 360, type: !294, scopeLine: 360, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!302 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE6rbeginB8ne180100Ev", scope: !263, file: !264, line: 368, type: !303, scopeLine: 368, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!303 = !DISubroutineType(types: !304)
!304 = !{!305, !298}
!305 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !263, file: !264, line: 287, baseType: !306, flags: DIFlagPublic)
!306 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<const char *>", scope: !32, file: !307, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorIPKcEE")
!307 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__iterator/reverse_iterator.h", directory: "")
!308 = !DISubprogram(name: "rend", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4rendB8ne180100Ev", scope: !263, file: !264, line: 372, type: !303, scopeLine: 372, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!309 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE7crbeginB8ne180100Ev", scope: !263, file: !264, line: 376, type: !303, scopeLine: 376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!310 = !DISubprogram(name: "crend", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE5crendB8ne180100Ev", scope: !263, file: !264, line: 380, type: !303, scopeLine: 380, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!311 = !DISubprogram(name: "size", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4sizeB8ne180100Ev", scope: !263, file: !264, line: 385, type: !312, scopeLine: 385, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!312 = !DISubroutineType(types: !313)
!313 = !{!268, !298}
!314 = !DISubprogram(name: "length", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE6lengthB8ne180100Ev", scope: !263, file: !264, line: 387, type: !312, scopeLine: 387, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!315 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE8max_sizeB8ne180100Ev", scope: !263, file: !264, line: 389, type: !312, scopeLine: 389, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!316 = !DISubprogram(name: "empty", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE5emptyB8ne180100Ev", scope: !263, file: !264, line: 393, type: !317, scopeLine: 393, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!317 = !DISubroutineType(types: !318)
!318 = !{!41, !298}
!319 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEEixB8ne180100Ey", scope: !263, file: !264, line: 398, type: !320, scopeLine: 398, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!320 = !DISubroutineType(types: !321)
!321 = !{!322, !298, !268}
!322 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !263, file: !264, line: 280, baseType: !74, flags: DIFlagPublic)
!323 = !DISubprogram(name: "at", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE2atB8ne180100Ey", scope: !263, file: !264, line: 402, type: !320, scopeLine: 402, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!324 = !DISubprogram(name: "front", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE5frontB8ne180100Ev", scope: !263, file: !264, line: 406, type: !325, scopeLine: 406, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!325 = !DISubroutineType(types: !326)
!326 = !{!322, !298}
!327 = !DISubprogram(name: "back", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4backB8ne180100Ev", scope: !263, file: !264, line: 410, type: !325, scopeLine: 410, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!328 = !DISubprogram(name: "data", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4dataB8ne180100Ev", scope: !263, file: !264, line: 414, type: !329, scopeLine: 414, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!329 = !DISubroutineType(types: !330)
!330 = !{!297, !298}
!331 = !DISubprogram(name: "remove_prefix", linkageName: "_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEE13remove_prefixB8ne180100Ey", scope: !263, file: !264, line: 417, type: !332, scopeLine: 417, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!332 = !DISubroutineType(types: !333)
!333 = !{null, !277, !268}
!334 = !DISubprogram(name: "remove_suffix", linkageName: "_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEE13remove_suffixB8ne180100Ey", scope: !263, file: !264, line: 423, type: !332, scopeLine: 423, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!335 = !DISubprogram(name: "swap", linkageName: "_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEE4swapB8ne180100ERS3_", scope: !263, file: !264, line: 428, type: !336, scopeLine: 428, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!336 = !DISubroutineType(types: !337)
!337 = !{null, !277, !286}
!338 = !DISubprogram(name: "copy", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4copyB8ne180100EPcyy", scope: !263, file: !264, line: 439, type: !339, scopeLine: 439, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!339 = !DISubroutineType(types: !340)
!340 = !{!341, !298, !53, !268, !268}
!341 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !263, file: !264, line: 289, baseType: !54, flags: DIFlagPublic)
!342 = !DISubprogram(name: "substr", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE6substrB8ne180100Eyy", scope: !263, file: !264, line: 447, type: !343, scopeLine: 447, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!343 = !DISubroutineType(types: !344)
!344 = !{!263, !298, !268, !268}
!345 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE7compareES3_", scope: !263, file: !264, line: 452, type: !346, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!346 = !DISubroutineType(types: !347)
!347 = !{!152, !298, !263}
!348 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE7compareB8ne180100EyyS3_", scope: !263, file: !264, line: 461, type: !349, scopeLine: 461, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!349 = !DISubroutineType(types: !350)
!350 = !{!152, !298, !268, !268, !263}
!351 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE7compareB8ne180100EyyS3_yy", scope: !263, file: !264, line: 466, type: !352, scopeLine: 466, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!352 = !DISubroutineType(types: !353)
!353 = !{!152, !298, !268, !268, !263, !268, !268}
!354 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE7compareB8ne180100EPKc", scope: !263, file: !264, line: 470, type: !355, scopeLine: 470, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!355 = !DISubroutineType(types: !356)
!356 = !{!152, !298, !72}
!357 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE7compareB8ne180100EyyPKc", scope: !263, file: !264, line: 475, type: !358, scopeLine: 475, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!358 = !DISubroutineType(types: !359)
!359 = !{!152, !298, !268, !268, !72}
!360 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE7compareB8ne180100EyyPKcy", scope: !263, file: !264, line: 480, type: !361, scopeLine: 480, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!361 = !DISubroutineType(types: !362)
!362 = !{!152, !298, !268, !268, !72, !268}
!363 = !DISubprogram(name: "find", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4findB8ne180100ES3_y", scope: !263, file: !264, line: 486, type: !364, scopeLine: 486, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!364 = !DISubroutineType(types: !365)
!365 = !{!341, !298, !263, !268}
!366 = !DISubprogram(name: "find", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4findB8ne180100Ecy", scope: !263, file: !264, line: 491, type: !367, scopeLine: 491, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!367 = !DISubroutineType(types: !368)
!368 = !{!341, !298, !5, !268}
!369 = !DISubprogram(name: "find", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4findB8ne180100EPKcyy", scope: !263, file: !264, line: 496, type: !370, scopeLine: 496, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!370 = !DISubroutineType(types: !371)
!371 = !{!341, !298, !72, !268, !268}
!372 = !DISubprogram(name: "find", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4findB8ne180100EPKcy", scope: !263, file: !264, line: 502, type: !373, scopeLine: 502, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!373 = !DISubroutineType(types: !374)
!374 = !{!341, !298, !72, !268}
!375 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE5rfindB8ne180100ES3_y", scope: !263, file: !264, line: 510, type: !364, scopeLine: 510, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!376 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE5rfindB8ne180100Ecy", scope: !263, file: !264, line: 516, type: !367, scopeLine: 516, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!377 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE5rfindB8ne180100EPKcyy", scope: !263, file: !264, line: 521, type: !370, scopeLine: 521, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!378 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE5rfindB8ne180100EPKcy", scope: !263, file: !264, line: 527, type: !373, scopeLine: 527, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!379 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE13find_first_ofB8ne180100ES3_y", scope: !263, file: !264, line: 535, type: !364, scopeLine: 535, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!380 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE13find_first_ofB8ne180100Ecy", scope: !263, file: !264, line: 542, type: !367, scopeLine: 542, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!381 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE13find_first_ofB8ne180100EPKcyy", scope: !263, file: !264, line: 547, type: !370, scopeLine: 547, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!382 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE13find_first_ofB8ne180100EPKcy", scope: !263, file: !264, line: 553, type: !373, scopeLine: 553, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!383 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE12find_last_ofB8ne180100ES3_y", scope: !263, file: !264, line: 561, type: !364, scopeLine: 561, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!384 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE12find_last_ofB8ne180100Ecy", scope: !263, file: !264, line: 568, type: !367, scopeLine: 568, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!385 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE12find_last_ofB8ne180100EPKcyy", scope: !263, file: !264, line: 573, type: !370, scopeLine: 573, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!386 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE12find_last_ofB8ne180100EPKcy", scope: !263, file: !264, line: 579, type: !373, scopeLine: 579, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!387 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE17find_first_not_ofB8ne180100ES3_y", scope: !263, file: !264, line: 587, type: !364, scopeLine: 587, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!388 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE17find_first_not_ofB8ne180100Ecy", scope: !263, file: !264, line: 595, type: !367, scopeLine: 595, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!389 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE17find_first_not_ofB8ne180100EPKcyy", scope: !263, file: !264, line: 600, type: !370, scopeLine: 600, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!390 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE17find_first_not_ofB8ne180100EPKcy", scope: !263, file: !264, line: 606, type: !373, scopeLine: 606, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!391 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE16find_last_not_ofB8ne180100ES3_y", scope: !263, file: !264, line: 614, type: !364, scopeLine: 614, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!392 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE16find_last_not_ofB8ne180100Ecy", scope: !263, file: !264, line: 622, type: !367, scopeLine: 622, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!393 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE16find_last_not_ofB8ne180100EPKcyy", scope: !263, file: !264, line: 627, type: !370, scopeLine: 627, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!394 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE16find_last_not_ofB8ne180100EPKcy", scope: !263, file: !264, line: 633, type: !373, scopeLine: 633, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!395 = !{!396, !397}
!396 = !DITemplateTypeParameter(name: "_CharT", type: !5)
!397 = !DITemplateTypeParameter(name: "_Traits", type: !398, defaulted: true)
!398 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !32, file: !399, line: 178, size: 8, flags: DIFlagTypePassByValue, elements: !400, templateParams: !446, identifier: "_ZTSNSt3__111char_traitsIcEE")
!399 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__string/char_traits.h", directory: "")
!400 = !{!401, !408, !411, !412, !416, !419, !422, !426, !427, !430, !434, !437, !440, !443}
!401 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__111char_traitsIcE6assignB8ne180100ERcRKc", scope: !398, file: !399, line: 189, type: !402, scopeLine: 189, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!402 = !DISubroutineType(types: !403)
!403 = !{null, !404, !406}
!404 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !405, size: 64)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !398, file: !399, line: 179, baseType: !5)
!406 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !407, size: 64)
!407 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !405)
!408 = !DISubprogram(name: "eq", linkageName: "_ZNSt3__111char_traitsIcE2eqEcc", scope: !398, file: !399, line: 194, type: !409, scopeLine: 194, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!409 = !DISubroutineType(types: !410)
!410 = !{!41, !405, !405}
!411 = !DISubprogram(name: "lt", linkageName: "_ZNSt3__111char_traitsIcE2ltB8ne180100Ecc", scope: !398, file: !399, line: 197, type: !409, scopeLine: 197, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!412 = !DISubprogram(name: "compare", linkageName: "_ZNSt3__111char_traitsIcE7compareB8ne180100EPKcS3_y", scope: !398, file: !399, line: 204, type: !413, scopeLine: 204, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!413 = !DISubroutineType(types: !414)
!414 = !{!152, !415, !415, !54}
!415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64)
!416 = !DISubprogram(name: "length", linkageName: "_ZNSt3__111char_traitsIcE6lengthB8ne180100EPKc", scope: !398, file: !399, line: 226, type: !417, scopeLine: 226, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!417 = !DISubroutineType(types: !418)
!418 = !{!54, !415}
!419 = !DISubprogram(name: "find", linkageName: "_ZNSt3__111char_traitsIcE4findB8ne180100EPKcyRS2_", scope: !398, file: !399, line: 231, type: !420, scopeLine: 231, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!420 = !DISubroutineType(types: !421)
!421 = !{!415, !415, !54, !406}
!422 = !DISubprogram(name: "move", linkageName: "_ZNSt3__111char_traitsIcE4moveB8ne180100EPcPKcy", scope: !398, file: !399, line: 238, type: !423, scopeLine: 238, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{!425, !425, !415, !54}
!425 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !405, size: 64)
!426 = !DISubprogram(name: "copy", linkageName: "_ZNSt3__111char_traitsIcE4copyB8ne180100EPcPKcy", scope: !398, file: !399, line: 243, type: !423, scopeLine: 243, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!427 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__111char_traitsIcE6assignB8ne180100EPcyc", scope: !398, file: !399, line: 251, type: !428, scopeLine: 251, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!428 = !DISubroutineType(types: !429)
!429 = !{!425, !425, !54, !405}
!430 = !DISubprogram(name: "not_eof", linkageName: "_ZNSt3__111char_traitsIcE7not_eofB8ne180100Ei", scope: !398, file: !399, line: 256, type: !431, scopeLine: 256, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{!433, !433}
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !398, file: !399, line: 180, baseType: !152)
!434 = !DISubprogram(name: "to_char_type", linkageName: "_ZNSt3__111char_traitsIcE12to_char_typeB8ne180100Ei", scope: !398, file: !399, line: 259, type: !435, scopeLine: 259, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!435 = !DISubroutineType(types: !436)
!436 = !{!405, !433}
!437 = !DISubprogram(name: "to_int_type", linkageName: "_ZNSt3__111char_traitsIcE11to_int_typeB8ne180100Ec", scope: !398, file: !399, line: 262, type: !438, scopeLine: 262, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!438 = !DISubroutineType(types: !439)
!439 = !{!433, !405}
!440 = !DISubprogram(name: "eq_int_type", linkageName: "_ZNSt3__111char_traitsIcE11eq_int_typeB8ne180100Eii", scope: !398, file: !399, line: 265, type: !441, scopeLine: 265, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!441 = !DISubroutineType(types: !442)
!442 = !{!41, !433, !433}
!443 = !DISubprogram(name: "eof", linkageName: "_ZNSt3__111char_traitsIcE3eofB8ne180100Ev", scope: !398, file: !399, line: 268, type: !444, scopeLine: 268, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!444 = !DISubroutineType(types: !445)
!445 = !{!433}
!446 = !{!396}
!447 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_", scope: !95, file: !94, line: 1113, type: !448, scopeLine: 1113, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!448 = !DISubroutineType(types: !449)
!449 = !{!450, !194, !224}
!450 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !95, size: 64)
!451 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSB8ne180100EOS5_", scope: !95, file: !94, line: 1125, type: !452, scopeLine: 1125, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!452 = !DISubroutineType(types: !453)
!453 = !{!450, !194, !231}
!454 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSB8ne180100ESt16initializer_listIcE", scope: !95, file: !94, line: 1131, type: !455, scopeLine: 1131, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!455 = !DISubroutineType(types: !456)
!456 = !{!450, !194, !253}
!457 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSB8ne180100EPKc", scope: !95, file: !94, line: 1135, type: !458, scopeLine: 1135, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!458 = !DISubroutineType(types: !459)
!459 = !{!450, !194, !460}
!460 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !461, size: 64)
!461 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !462)
!462 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !95, file: !94, line: 717, baseType: !5, flags: DIFlagPublic)
!463 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSEc", scope: !95, file: !94, line: 1141, type: !464, scopeLine: 1141, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!464 = !DISubroutineType(types: !465)
!465 = !{!450, !194, !462}
!466 = !DISubprogram(name: "begin", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5beginB8ne180100Ev", scope: !95, file: !94, line: 1143, type: !467, scopeLine: 1143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!467 = !DISubroutineType(types: !468)
!468 = !{!202, !194}
!469 = !DISubprogram(name: "begin", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5beginB8ne180100Ev", scope: !95, file: !94, line: 1146, type: !470, scopeLine: 1146, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!470 = !DISubroutineType(types: !471)
!471 = !{!209, !211}
!472 = !DISubprogram(name: "end", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE3endB8ne180100Ev", scope: !95, file: !94, line: 1149, type: !467, scopeLine: 1149, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!473 = !DISubprogram(name: "end", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE3endB8ne180100Ev", scope: !95, file: !94, line: 1152, type: !470, scopeLine: 1152, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!474 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6rbeginB8ne180100Ev", scope: !95, file: !94, line: 1156, type: !475, scopeLine: 1156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!475 = !DISubroutineType(types: !476)
!476 = !{!477, !194}
!477 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !95, file: !94, line: 742, baseType: !478, flags: DIFlagPublic)
!478 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char *> >", scope: !32, file: !307, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPcEEEE")
!479 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6rbeginB8ne180100Ev", scope: !95, file: !94, line: 1159, type: !480, scopeLine: 1159, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!480 = !DISubroutineType(types: !481)
!481 = !{!482, !211}
!482 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !95, file: !94, line: 743, baseType: !483, flags: DIFlagPublic)
!483 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<const char *> >", scope: !32, file: !307, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPKcEEEE")
!484 = !DISubprogram(name: "rend", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4rendB8ne180100Ev", scope: !95, file: !94, line: 1162, type: !475, scopeLine: 1162, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!485 = !DISubprogram(name: "rend", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4rendB8ne180100Ev", scope: !95, file: !94, line: 1165, type: !480, scopeLine: 1165, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!486 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6cbeginB8ne180100Ev", scope: !95, file: !94, line: 1169, type: !470, scopeLine: 1169, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!487 = !DISubprogram(name: "cend", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4cendB8ne180100Ev", scope: !95, file: !94, line: 1170, type: !470, scopeLine: 1170, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!488 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7crbeginB8ne180100Ev", scope: !95, file: !94, line: 1171, type: !480, scopeLine: 1171, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!489 = !DISubprogram(name: "crend", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5crendB8ne180100Ev", scope: !95, file: !94, line: 1174, type: !480, scopeLine: 1174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!490 = !DISubprogram(name: "size", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne180100Ev", scope: !95, file: !94, line: 1176, type: !491, scopeLine: 1176, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!491 = !DISubroutineType(types: !492)
!492 = !{!99, !211}
!493 = !DISubprogram(name: "length", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB8ne180100Ev", scope: !95, file: !94, line: 1179, type: !491, scopeLine: 1179, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!494 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8max_sizeB8ne180100Ev", scope: !95, file: !94, line: 1181, type: !491, scopeLine: 1181, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!495 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8capacityB8ne180100Ev", scope: !95, file: !94, line: 1191, type: !491, scopeLine: 1191, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!496 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeEyc", scope: !95, file: !94, line: 1195, type: !497, scopeLine: 1195, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!497 = !DISubroutineType(types: !498)
!498 = !{null, !194, !99, !462}
!499 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeB8ne180100Ey", scope: !95, file: !94, line: 1196, type: !500, scopeLine: 1196, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!500 = !DISubroutineType(types: !501)
!501 = !{null, !194, !99}
!502 = !DISubprogram(name: "reserve", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveEy", scope: !95, file: !94, line: 1198, type: !500, scopeLine: 1198, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!503 = !DISubprogram(name: "__resize_default_init", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE21__resize_default_initB8ne180100Ey", scope: !95, file: !94, line: 1208, type: !500, scopeLine: 1208, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!504 = !DISubprogram(name: "reserve", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveB8ne180100Ev", scope: !95, file: !94, line: 1211, type: !216, scopeLine: 1211, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!505 = !DISubprogram(name: "shrink_to_fit", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13shrink_to_fitB8ne180100Ev", scope: !95, file: !94, line: 1213, type: !216, scopeLine: 1213, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!506 = !DISubprogram(name: "clear", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5clearB8ne180100Ev", scope: !95, file: !94, line: 1214, type: !216, scopeLine: 1214, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!507 = !DISubprogram(name: "empty", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5emptyB8ne180100Ev", scope: !95, file: !94, line: 1216, type: !508, scopeLine: 1216, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!508 = !DISubroutineType(types: !509)
!509 = !{!41, !211}
!510 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEixB8ne180100Ey", scope: !95, file: !94, line: 1220, type: !511, scopeLine: 1220, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!511 = !DISubroutineType(types: !512)
!512 = !{!513, !211, !99}
!513 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !95, file: !94, line: 723, baseType: !514, flags: DIFlagPublic)
!514 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !461, size: 64)
!515 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEixB8ne180100Ey", scope: !95, file: !94, line: 1228, type: !516, scopeLine: 1228, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!516 = !DISubroutineType(types: !517)
!517 = !{!518, !194, !99}
!518 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !95, file: !94, line: 722, baseType: !519, flags: DIFlagPublic)
!519 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !462, size: 64)
!520 = !DISubprogram(name: "at", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE2atEy", scope: !95, file: !94, line: 1236, type: !511, scopeLine: 1236, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!521 = !DISubprogram(name: "at", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE2atEy", scope: !95, file: !94, line: 1237, type: !516, scopeLine: 1237, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!522 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB8ne180100ERKS5_", scope: !95, file: !94, line: 1239, type: !448, scopeLine: 1239, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!523 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB8ne180100EPKc", scope: !95, file: !94, line: 1253, type: !458, scopeLine: 1253, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!524 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB8ne180100Ec", scope: !95, file: !94, line: 1257, type: !464, scopeLine: 1257, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!525 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB8ne180100ESt16initializer_listIcE", scope: !95, file: !94, line: 1263, type: !455, scopeLine: 1263, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!526 = !DISubprogram(name: "append", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendB8ne180100ERKS5_", scope: !95, file: !94, line: 1268, type: !448, scopeLine: 1268, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!527 = !DISubprogram(name: "append", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendERKS5_yy", scope: !95, file: !94, line: 1282, type: !528, scopeLine: 1282, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!528 = !DISubroutineType(types: !529)
!529 = !{!450, !194, !224, !99, !99}
!530 = !DISubprogram(name: "append", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcy", scope: !95, file: !94, line: 1293, type: !531, scopeLine: 1293, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!531 = !DISubroutineType(types: !532)
!532 = !{!450, !194, !460, !99}
!533 = !DISubprogram(name: "append", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc", scope: !95, file: !94, line: 1294, type: !458, scopeLine: 1294, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!534 = !DISubprogram(name: "append", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEyc", scope: !95, file: !94, line: 1295, type: !535, scopeLine: 1295, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!535 = !DISubroutineType(types: !536)
!536 = !{!450, !194, !99, !462}
!537 = !DISubprogram(name: "__append_default_init", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE21__append_default_initB8ne180100Ey", scope: !95, file: !94, line: 1297, type: !500, scopeLine: 1297, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!538 = !DISubprogram(name: "append", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendB8ne180100ESt16initializer_listIcE", scope: !95, file: !94, line: 1320, type: !455, scopeLine: 1320, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!539 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc", scope: !95, file: !94, line: 1325, type: !540, scopeLine: 1325, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!540 = !DISubroutineType(types: !541)
!541 = !{null, !194, !462}
!542 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8pop_backB8ne180100Ev", scope: !95, file: !94, line: 1326, type: !216, scopeLine: 1326, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!543 = !DISubprogram(name: "front", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5frontB8ne180100Ev", scope: !95, file: !94, line: 1328, type: !544, scopeLine: 1328, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!544 = !DISubroutineType(types: !545)
!545 = !{!518, !194}
!546 = !DISubprogram(name: "front", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5frontB8ne180100Ev", scope: !95, file: !94, line: 1333, type: !547, scopeLine: 1333, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!547 = !DISubroutineType(types: !548)
!548 = !{!513, !211}
!549 = !DISubprogram(name: "back", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4backB8ne180100Ev", scope: !95, file: !94, line: 1338, type: !544, scopeLine: 1338, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!550 = !DISubprogram(name: "back", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4backB8ne180100Ev", scope: !95, file: !94, line: 1343, type: !547, scopeLine: 1343, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!551 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignB8ne180100ERKS5_", scope: !95, file: !94, line: 1378, type: !448, scopeLine: 1378, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!552 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignB8ne180100EOS5_", scope: !95, file: !94, line: 1382, type: !452, scopeLine: 1382, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!553 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignERKS5_yy", scope: !95, file: !94, line: 1388, type: !528, scopeLine: 1388, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!554 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKcy", scope: !95, file: !94, line: 1397, type: !531, scopeLine: 1397, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!555 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc", scope: !95, file: !94, line: 1398, type: !458, scopeLine: 1398, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!556 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEyc", scope: !95, file: !94, line: 1399, type: !535, scopeLine: 1399, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!557 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignB8ne180100ESt16initializer_listIcE", scope: !95, file: !94, line: 1425, type: !455, scopeLine: 1425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!558 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertB8ne180100EyRKS5_", scope: !95, file: !94, line: 1431, type: !559, scopeLine: 1431, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!559 = !DISubroutineType(types: !560)
!560 = !{!450, !194, !99, !224}
!561 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEyRKS5_yy", scope: !95, file: !94, line: 1450, type: !562, scopeLine: 1450, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!562 = !DISubroutineType(types: !563)
!563 = !{!450, !194, !99, !224, !99, !99}
!564 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEyPKcy", scope: !95, file: !94, line: 1451, type: !565, scopeLine: 1451, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!565 = !DISubroutineType(types: !566)
!566 = !{!450, !194, !99, !460, !99}
!567 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEyPKc", scope: !95, file: !94, line: 1452, type: !568, scopeLine: 1452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!568 = !DISubroutineType(types: !569)
!569 = !{!450, !194, !99, !460}
!570 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEyyc", scope: !95, file: !94, line: 1453, type: !571, scopeLine: 1453, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!571 = !DISubroutineType(types: !572)
!572 = !{!450, !194, !99, !99, !462}
!573 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertENS_11__wrap_iterIPKcEEc", scope: !95, file: !94, line: 1454, type: !574, scopeLine: 1454, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!574 = !DISubroutineType(types: !575)
!575 = !{!202, !194, !209, !462}
!576 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertB8ne180100ENS_11__wrap_iterIPKcEEyc", scope: !95, file: !94, line: 1471, type: !577, scopeLine: 1471, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!577 = !DISubroutineType(types: !578)
!578 = !{!202, !194, !209, !99, !462}
!579 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertB8ne180100ENS_11__wrap_iterIPKcEESt16initializer_listIcE", scope: !95, file: !94, line: 1487, type: !580, scopeLine: 1487, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!580 = !DISubroutineType(types: !581)
!581 = !{!202, !194, !209, !253}
!582 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5eraseEyy", scope: !95, file: !94, line: 1492, type: !583, scopeLine: 1492, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!583 = !DISubroutineType(types: !584)
!584 = !{!450, !194, !99, !99}
!585 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5eraseB8ne180100ENS_11__wrap_iterIPKcEE", scope: !95, file: !94, line: 1493, type: !586, scopeLine: 1493, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!586 = !DISubroutineType(types: !587)
!587 = !{!202, !194, !209}
!588 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5eraseB8ne180100ENS_11__wrap_iterIPKcEES9_", scope: !95, file: !94, line: 1494, type: !589, scopeLine: 1494, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!589 = !DISubroutineType(types: !590)
!590 = !{!202, !194, !209, !209}
!591 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceB8ne180100EyyRKS5_", scope: !95, file: !94, line: 1497, type: !592, scopeLine: 1497, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!592 = !DISubroutineType(types: !593)
!593 = !{!450, !194, !99, !99, !224}
!594 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEyyRKS5_yy", scope: !95, file: !94, line: 1509, type: !595, scopeLine: 1509, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!595 = !DISubroutineType(types: !596)
!596 = !{!450, !194, !99, !99, !224, !99, !99}
!597 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEyyPKcy", scope: !95, file: !94, line: 1519, type: !598, scopeLine: 1519, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!598 = !DISubroutineType(types: !599)
!599 = !{!450, !194, !99, !99, !460, !99}
!600 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEyyPKc", scope: !95, file: !94, line: 1520, type: !601, scopeLine: 1520, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!601 = !DISubroutineType(types: !602)
!602 = !{!450, !194, !99, !99, !460}
!603 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEyyyc", scope: !95, file: !94, line: 1521, type: !604, scopeLine: 1521, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!604 = !DISubroutineType(types: !605)
!605 = !{!450, !194, !99, !99, !99, !462}
!606 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceB8ne180100ENS_11__wrap_iterIPKcEES9_RKS5_", scope: !95, file: !94, line: 1524, type: !607, scopeLine: 1524, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!607 = !DISubroutineType(types: !608)
!608 = !{!450, !194, !209, !209, !224}
!609 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceB8ne180100ENS_11__wrap_iterIPKcEES9_S8_y", scope: !95, file: !94, line: 1537, type: !610, scopeLine: 1537, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!610 = !DISubroutineType(types: !611)
!611 = !{!450, !194, !209, !209, !460, !99}
!612 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceB8ne180100ENS_11__wrap_iterIPKcEES9_S8_", scope: !95, file: !94, line: 1542, type: !613, scopeLine: 1542, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!450, !194, !209, !209, !460}
!615 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceB8ne180100ENS_11__wrap_iterIPKcEES9_yc", scope: !95, file: !94, line: 1547, type: !616, scopeLine: 1547, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!616 = !DISubroutineType(types: !617)
!617 = !{!450, !194, !209, !209, !99, !462}
!618 = !DISubprogram(name: "replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceB8ne180100ENS_11__wrap_iterIPKcEES9_St16initializer_listIcE", scope: !95, file: !94, line: 1566, type: !619, scopeLine: 1566, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!619 = !DISubroutineType(types: !620)
!620 = !{!450, !194, !209, !209, !253}
!621 = !DISubprogram(name: "copy", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4copyEPcyy", scope: !95, file: !94, line: 1571, type: !622, scopeLine: 1571, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!622 = !DISubroutineType(types: !623)
!623 = !{!99, !211, !624, !99, !99}
!624 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !462, size: 64)
!625 = !DISubprogram(name: "substr", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6substrB8ne180100Eyy", scope: !95, file: !94, line: 1575, type: !626, scopeLine: 1575, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!626 = !DISubroutineType(types: !627)
!627 = !{!95, !211, !99, !99}
!628 = !DISubprogram(name: "swap", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4swapB8ne180100ERS5_", scope: !95, file: !94, line: 1588, type: !629, scopeLine: 1588, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!629 = !DISubroutineType(types: !630)
!630 = !{null, !194, !450}
!631 = !DISubprogram(name: "c_str", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne180100Ev", scope: !95, file: !94, line: 1595, type: !632, scopeLine: 1595, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!632 = !DISubroutineType(types: !633)
!633 = !{!460, !211}
!634 = !DISubprogram(name: "data", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne180100Ev", scope: !95, file: !94, line: 1596, type: !632, scopeLine: 1596, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!635 = !DISubprogram(name: "data", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne180100Ev", scope: !95, file: !94, line: 1600, type: !636, scopeLine: 1600, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!636 = !DISubroutineType(types: !637)
!637 = !{!624, !194}
!638 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13get_allocatorB8ne180100Ev", scope: !95, file: !94, line: 1605, type: !639, scopeLine: 1605, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!639 = !DISubroutineType(types: !640)
!640 = !{!198, !211}
!641 = !DISubprogram(name: "find", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findB8ne180100ERKS5_y", scope: !95, file: !94, line: 1610, type: !642, scopeLine: 1610, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!642 = !DISubroutineType(types: !643)
!643 = !{!99, !211, !224, !99}
!644 = !DISubprogram(name: "find", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findEPKcyy", scope: !95, file: !94, line: 1616, type: !645, scopeLine: 1616, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!645 = !DISubroutineType(types: !646)
!646 = !{!99, !211, !460, !99, !99}
!647 = !DISubprogram(name: "find", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findB8ne180100EPKcy", scope: !95, file: !94, line: 1618, type: !648, scopeLine: 1618, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!648 = !DISubroutineType(types: !649)
!649 = !{!99, !211, !460, !99}
!650 = !DISubprogram(name: "find", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findEcy", scope: !95, file: !94, line: 1619, type: !651, scopeLine: 1619, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!651 = !DISubroutineType(types: !652)
!652 = !{!99, !211, !462, !99}
!653 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5rfindB8ne180100ERKS5_y", scope: !95, file: !94, line: 1622, type: !642, scopeLine: 1622, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!654 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5rfindEPKcyy", scope: !95, file: !94, line: 1628, type: !645, scopeLine: 1628, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!655 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5rfindB8ne180100EPKcy", scope: !95, file: !94, line: 1630, type: !648, scopeLine: 1630, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!656 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5rfindEcy", scope: !95, file: !94, line: 1631, type: !651, scopeLine: 1631, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!657 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13find_first_ofB8ne180100ERKS5_y", scope: !95, file: !94, line: 1634, type: !642, scopeLine: 1634, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!658 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13find_first_ofEPKcyy", scope: !95, file: !94, line: 1641, type: !645, scopeLine: 1641, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!659 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13find_first_ofB8ne180100EPKcy", scope: !95, file: !94, line: 1643, type: !648, scopeLine: 1643, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!660 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13find_first_ofB8ne180100Ecy", scope: !95, file: !94, line: 1645, type: !651, scopeLine: 1645, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!661 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE12find_last_ofB8ne180100ERKS5_y", scope: !95, file: !94, line: 1648, type: !642, scopeLine: 1648, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!662 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE12find_last_ofEPKcyy", scope: !95, file: !94, line: 1655, type: !645, scopeLine: 1655, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!663 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE12find_last_ofB8ne180100EPKcy", scope: !95, file: !94, line: 1657, type: !648, scopeLine: 1657, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!664 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE12find_last_ofB8ne180100Ecy", scope: !95, file: !94, line: 1659, type: !651, scopeLine: 1659, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!665 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17find_first_not_ofB8ne180100ERKS5_y", scope: !95, file: !94, line: 1662, type: !642, scopeLine: 1662, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!666 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17find_first_not_ofEPKcyy", scope: !95, file: !94, line: 1669, type: !645, scopeLine: 1669, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!667 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17find_first_not_ofB8ne180100EPKcy", scope: !95, file: !94, line: 1671, type: !648, scopeLine: 1671, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!668 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17find_first_not_ofB8ne180100Ecy", scope: !95, file: !94, line: 1673, type: !651, scopeLine: 1673, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!669 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16find_last_not_ofB8ne180100ERKS5_y", scope: !95, file: !94, line: 1676, type: !642, scopeLine: 1676, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!670 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16find_last_not_ofEPKcyy", scope: !95, file: !94, line: 1683, type: !645, scopeLine: 1683, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!671 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16find_last_not_ofB8ne180100EPKcy", scope: !95, file: !94, line: 1685, type: !648, scopeLine: 1685, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!672 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16find_last_not_ofB8ne180100Ecy", scope: !95, file: !94, line: 1687, type: !651, scopeLine: 1687, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!673 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareB8ne180100ERKS5_", scope: !95, file: !94, line: 1689, type: !674, scopeLine: 1689, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!674 = !DISubroutineType(types: !675)
!675 = !{!152, !211, !224}
!676 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareB8ne180100EyyRKS5_", scope: !95, file: !94, line: 1700, type: !677, scopeLine: 1700, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!677 = !DISubroutineType(types: !678)
!678 = !{!152, !211, !99, !99, !224}
!679 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEyyRKS5_yy", scope: !95, file: !94, line: 1702, type: !680, scopeLine: 1702, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!680 = !DISubroutineType(types: !681)
!681 = !{!152, !211, !99, !99, !224, !99, !99}
!682 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEPKc", scope: !95, file: !94, line: 1711, type: !683, scopeLine: 1711, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!683 = !DISubroutineType(types: !684)
!684 = !{!152, !211, !460}
!685 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEyyPKc", scope: !95, file: !94, line: 1712, type: !686, scopeLine: 1712, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!686 = !DISubroutineType(types: !687)
!687 = !{!152, !211, !99, !99, !460}
!688 = !DISubprogram(name: "compare", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEyyPKcy", scope: !95, file: !94, line: 1714, type: !689, scopeLine: 1714, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!689 = !DISubroutineType(types: !690)
!690 = !{!152, !211, !99, !99, !460, !99}
!691 = !DISubprogram(name: "__invariants", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE12__invariantsB8ne180100Ev", scope: !95, file: !94, line: 1756, type: !508, scopeLine: 1756, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!692 = !DISubprogram(name: "__clear_and_shrink", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__clear_and_shrinkB8ne180100Ev", scope: !95, file: !94, line: 1758, type: !216, scopeLine: 1758, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!693 = !DISubprogram(name: "__shrink_or_extend", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__shrink_or_extendB8ne180100Ey", scope: !95, file: !94, line: 1766, type: !500, scopeLine: 1766, flags: DIFlagPrototyped, spFlags: 0)
!694 = !DISubprogram(name: "__is_long", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne180100Ev", scope: !95, file: !94, line: 1769, type: !508, scopeLine: 1769, flags: DIFlagPrototyped, spFlags: 0)
!695 = !DISubprogram(name: "__begin_lifetime", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB8ne180100EPcy", scope: !95, file: !94, line: 1776, type: !696, scopeLine: 1776, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!696 = !DISubroutineType(types: !697)
!697 = !{null, !205, !99}
!698 = !DISubprogram(name: "__fits_in_sso", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne180100Ey", scope: !95, file: !94, line: 1788, type: !699, scopeLine: 1788, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!699 = !DISubroutineType(types: !700)
!700 = !{!41, !99}
!701 = !DISubprogram(name: "__alloc", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB8ne180100Ev", scope: !95, file: !94, line: 1826, type: !702, scopeLine: 1826, flags: DIFlagPrototyped, spFlags: 0)
!702 = !DISubroutineType(types: !703)
!703 = !{!704, !194}
!704 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !198, size: 64)
!705 = !DISubprogram(name: "__alloc", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB8ne180100Ev", scope: !95, file: !94, line: 1827, type: !706, scopeLine: 1827, flags: DIFlagPrototyped, spFlags: 0)
!706 = !DISubroutineType(types: !707)
!707 = !{!196, !211}
!708 = !DISubprogram(name: "__set_short_size", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__set_short_sizeB8ne180100Ey", scope: !95, file: !94, line: 1830, type: !500, scopeLine: 1830, flags: DIFlagPrototyped, spFlags: 0)
!709 = !DISubprogram(name: "__get_short_size", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne180100Ev", scope: !95, file: !94, line: 1837, type: !491, scopeLine: 1837, flags: DIFlagPrototyped, spFlags: 0)
!710 = !DISubprogram(name: "__set_long_size", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB8ne180100Ey", scope: !95, file: !94, line: 1842, type: !500, scopeLine: 1842, flags: DIFlagPrototyped, spFlags: 0)
!711 = !DISubprogram(name: "__get_long_size", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne180100Ev", scope: !95, file: !94, line: 1845, type: !491, scopeLine: 1845, flags: DIFlagPrototyped, spFlags: 0)
!712 = !DISubprogram(name: "__set_size", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__set_sizeB8ne180100Ey", scope: !95, file: !94, line: 1848, type: !500, scopeLine: 1848, flags: DIFlagPrototyped, spFlags: 0)
!713 = !DISubprogram(name: "__set_long_cap", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB8ne180100Ey", scope: !95, file: !94, line: 1855, type: !500, scopeLine: 1855, flags: DIFlagPrototyped, spFlags: 0)
!714 = !DISubprogram(name: "__get_long_cap", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__get_long_capB8ne180100Ev", scope: !95, file: !94, line: 1860, type: !491, scopeLine: 1860, flags: DIFlagPrototyped, spFlags: 0)
!715 = !DISubprogram(name: "__set_long_pointer", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB8ne180100EPc", scope: !95, file: !94, line: 1864, type: !716, scopeLine: 1864, flags: DIFlagPrototyped, spFlags: 0)
!716 = !DISubroutineType(types: !717)
!717 = !{null, !194, !205}
!718 = !DISubprogram(name: "__get_long_pointer", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne180100Ev", scope: !95, file: !94, line: 1867, type: !719, scopeLine: 1867, flags: DIFlagPrototyped, spFlags: 0)
!719 = !DISubroutineType(types: !720)
!720 = !{!205, !194}
!721 = !DISubprogram(name: "__get_long_pointer", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne180100Ev", scope: !95, file: !94, line: 1870, type: !722, scopeLine: 1870, flags: DIFlagPrototyped, spFlags: 0)
!722 = !DISubroutineType(types: !723)
!723 = !{!213, !211}
!724 = !DISubprogram(name: "__get_short_pointer", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne180100Ev", scope: !95, file: !94, line: 1873, type: !719, scopeLine: 1873, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DISubprogram(name: "__get_short_pointer", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne180100Ev", scope: !95, file: !94, line: 1876, type: !722, scopeLine: 1876, flags: DIFlagPrototyped, spFlags: 0)
!726 = !DISubprogram(name: "__get_pointer", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne180100Ev", scope: !95, file: !94, line: 1879, type: !719, scopeLine: 1879, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DISubprogram(name: "__get_pointer", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne180100Ev", scope: !95, file: !94, line: 1882, type: !722, scopeLine: 1882, flags: DIFlagPrototyped, spFlags: 0)
!728 = !DISubprogram(name: "__annotate_contiguous_container", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE31__annotate_contiguous_containerB8ne180100EPKvS7_", scope: !95, file: !94, line: 1888, type: !729, scopeLine: 1888, flags: DIFlagPrototyped, spFlags: 0)
!729 = !DISubroutineType(types: !730)
!730 = !{null, !211, !78, !78}
!731 = !DISubprogram(name: "__asan_short_string_is_annotated", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE32__asan_short_string_is_annotatedB8ne180100Ev", scope: !95, file: !94, line: 1900, type: !508, scopeLine: 1900, flags: DIFlagPrototyped, spFlags: 0)
!732 = !DISubprogram(name: "__annotate_new", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__annotate_newB8ne180100Ey", scope: !95, file: !94, line: 1904, type: !733, scopeLine: 1904, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DISubroutineType(types: !734)
!734 = !{null, !211, !99}
!735 = !DISubprogram(name: "__annotate_delete", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__annotate_deleteB8ne180100Ev", scope: !95, file: !94, line: 1912, type: !736, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: 0)
!736 = !DISubroutineType(types: !737)
!737 = !{null, !211}
!738 = !DISubprogram(name: "__annotate_increase", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__annotate_increaseB8ne180100Ey", scope: !95, file: !94, line: 1919, type: !733, scopeLine: 1919, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DISubprogram(name: "__annotate_shrink", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__annotate_shrinkB8ne180100Ey", scope: !95, file: !94, line: 1927, type: !733, scopeLine: 1927, flags: DIFlagPrototyped, spFlags: 0)
!740 = !DISubprogram(name: "__recommend", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB8ne180100Ey", scope: !95, file: !94, line: 1942, type: !741, scopeLine: 1942, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!741 = !DISubroutineType(types: !742)
!742 = !{!99, !99}
!743 = !DISubprogram(name: "__init", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcyy", scope: !95, file: !94, line: 1953, type: !744, scopeLine: 1953, flags: DIFlagPrototyped, spFlags: 0)
!744 = !DISubroutineType(types: !745)
!745 = !{null, !194, !460, !99, !99}
!746 = !DISubprogram(name: "__init", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcy", scope: !95, file: !94, line: 2202, type: !747, scopeLine: 2202, flags: DIFlagPrototyped, spFlags: 0)
!747 = !DISubroutineType(types: !748)
!748 = !{null, !194, !460, !99}
!749 = !DISubprogram(name: "__init", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEyc", scope: !95, file: !94, line: 2249, type: !497, scopeLine: 2249, flags: DIFlagPrototyped, spFlags: 0)
!750 = !DISubprogram(name: "__init_copy_ctor_external", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcy", scope: !95, file: !94, line: 1965, type: !747, scopeLine: 1965, flags: DIFlagPrototyped, spFlags: 0)
!751 = !DISubprogram(name: "__grow_by", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__grow_byEyyyyyy", scope: !95, file: !94, line: 1984, type: !752, scopeLine: 1984, flags: DIFlagPrototyped, spFlags: 0)
!752 = !DISubroutineType(types: !753)
!753 = !{null, !194, !99, !99, !99, !99, !99, !99}
!754 = !DISubprogram(name: "__grow_by_without_replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__grow_by_without_replaceB8ne180100Eyyyyyy", scope: !95, file: !94, line: 1991, type: !752, scopeLine: 1991, flags: DIFlagPrototyped, spFlags: 0)
!755 = !DISubprogram(name: "__grow_by_and_replace", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE21__grow_by_and_replaceEyyyyyyPKc", scope: !95, file: !94, line: 1998, type: !756, scopeLine: 1998, flags: DIFlagPrototyped, spFlags: 0)
!756 = !DISubroutineType(types: !757)
!757 = !{null, !194, !99, !99, !99, !99, !99, !99, !460}
!758 = !DISubprogram(name: "__erase_to_end", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__erase_to_endB8ne180100Ey", scope: !95, file: !94, line: 2013, type: !500, scopeLine: 2013, flags: DIFlagPrototyped, spFlags: 0)
!759 = !DISubprogram(name: "__erase_external_with_move", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE26__erase_external_with_moveEyy", scope: !95, file: !94, line: 2019, type: !760, scopeLine: 2019, flags: DIFlagPrototyped, spFlags: 0)
!760 = !DISubroutineType(types: !761)
!761 = !{null, !194, !99, !99}
!762 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__copy_assign_allocB8ne180100ERKS5_", scope: !95, file: !94, line: 2021, type: !222, scopeLine: 2021, flags: DIFlagPrototyped, spFlags: 0)
!763 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__copy_assign_allocB8ne180100ERKS5_NS_17integral_constantIbLb1EEE", scope: !95, file: !94, line: 2026, type: !764, scopeLine: 2026, flags: DIFlagPrototyped, spFlags: 0)
!764 = !DISubroutineType(types: !765)
!765 = !{null, !194, !224, !766}
!766 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !32, file: !767, line: 34, baseType: !768)
!767 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__type_traits/integral_constant.h", directory: "")
!768 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, true>", scope: !32, file: !767, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !769, templateParams: !779, identifier: "_ZTSNSt3__117integral_constantIbLb1EEE")
!769 = !{!770, !772, !778}
!770 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !768, file: !767, line: 22, baseType: !771, flags: DIFlagStaticMember, extraData: i1 true)
!771 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !41)
!772 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb1EEcvbB8ne180100Ev", scope: !768, file: !767, line: 25, type: !773, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DISubroutineType(types: !774)
!774 = !{!775, !776}
!775 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !768, file: !767, line: 23, baseType: !41)
!776 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !777, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!777 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !768)
!778 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb1EEclB8ne180100Ev", scope: !768, file: !767, line: 27, type: !773, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!779 = !{!780, !781}
!780 = !DITemplateTypeParameter(name: "_Tp", type: !41)
!781 = !DITemplateValueParameter(name: "__v", type: !41, value: i1 true)
!782 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__copy_assign_allocB8ne180100ERKS5_NS_17integral_constantIbLb0EEE", scope: !95, file: !94, line: 2050, type: !783, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DISubroutineType(types: !784)
!784 = !{null, !194, !224, !785}
!785 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !32, file: !767, line: 35, baseType: !786)
!786 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, false>", scope: !32, file: !767, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !787, templateParams: !796, identifier: "_ZTSNSt3__117integral_constantIbLb0EEE")
!787 = !{!788, !789, !795}
!788 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !786, file: !767, line: 22, baseType: !771, flags: DIFlagStaticMember, extraData: i1 false)
!789 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb0EEcvbB8ne180100Ev", scope: !786, file: !767, line: 25, type: !790, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!790 = !DISubroutineType(types: !791)
!791 = !{!792, !793}
!792 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !786, file: !767, line: 23, baseType: !41)
!793 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !794, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!794 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !786)
!795 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb0EEclB8ne180100Ev", scope: !786, file: !767, line: 27, type: !790, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!796 = !{!780, !797}
!797 = !DITemplateValueParameter(name: "__v", type: !41, value: i1 false)
!798 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__move_assignB8ne180100ERS5_NS_17integral_constantIbLb0EEE", scope: !95, file: !94, line: 2053, type: !799, scopeLine: 2053, flags: DIFlagPrototyped, spFlags: 0)
!799 = !DISubroutineType(types: !800)
!800 = !{null, !194, !450, !785}
!801 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__move_assignB8ne180100ERS5_NS_17integral_constantIbLb1EEE", scope: !95, file: !94, line: 2056, type: !802, scopeLine: 2056, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DISubroutineType(types: !803)
!803 = !{null, !194, !450, !766}
!804 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__move_assign_allocB8ne180100ERS5_", scope: !95, file: !94, line: 2064, type: !629, scopeLine: 2064, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__move_assign_allocB8ne180100ERS5_NS_17integral_constantIbLb1EEE", scope: !95, file: !94, line: 2071, type: !802, scopeLine: 2071, flags: DIFlagPrototyped, spFlags: 0)
!806 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__move_assign_allocB8ne180100ERS5_NS_17integral_constantIbLb0EEE", scope: !95, file: !94, line: 2076, type: !799, scopeLine: 2076, flags: DIFlagPrototyped, spFlags: 0)
!807 = !DISubprogram(name: "__assign_external", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__assign_externalEPKc", scope: !95, file: !94, line: 2078, type: !458, scopeLine: 2078, flags: DIFlagPrototyped, spFlags: 0)
!808 = !DISubprogram(name: "__assign_external", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__assign_externalEPKcy", scope: !95, file: !94, line: 2079, type: !531, scopeLine: 2079, flags: DIFlagPrototyped, spFlags: 0)
!809 = !DISubprogram(name: "__assign_short", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__assign_shortEPKcy", scope: !95, file: !94, line: 2082, type: !531, scopeLine: 2082, flags: DIFlagPrototyped, spFlags: 0)
!810 = !DISubprogram(name: "__null_terminate_at", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__null_terminate_atB8ne180100EPcy", scope: !95, file: !94, line: 2096, type: !811, scopeLine: 2096, flags: DIFlagPrototyped, spFlags: 0)
!811 = !DISubroutineType(types: !812)
!812 = !{!450, !194, !624, !99}
!813 = !DISubprogram(name: "__throw_length_error", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne180100Ev", scope: !95, file: !94, line: 2112, type: !736, scopeLine: 2112, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!814 = !DISubprogram(name: "__throw_out_of_range", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_out_of_rangeB8ne180100Ev", scope: !95, file: !94, line: 2116, type: !736, scopeLine: 2116, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!815 = !{!396, !397, !816}
!816 = !DITemplateTypeParameter(name: "_Allocator", type: !43, defaulted: true)
!817 = !{!818}
!818 = !DIDerivedType(tag: DW_TAG_member, scope: !93, file: !94, line: 833, baseType: !819, size: 192)
!819 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !93, file: !94, line: 833, size: 192, flags: DIFlagExportSymbols | DIFlagTypePassByValue, elements: !820, identifier: "_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repUt_E")
!820 = !{!821, !838, !848}
!821 = !DIDerivedType(tag: DW_TAG_member, name: "__s", scope: !819, file: !94, line: 834, baseType: !822, size: 192)
!822 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__short", scope: !95, file: !94, line: 808, size: 192, flags: DIFlagTypePassByValue, elements: !823, identifier: "_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__shortE")
!823 = !{!824, !830, !834}
!824 = !DIDerivedType(tag: DW_TAG_member, scope: !822, file: !94, line: 809, baseType: !825, size: 8)
!825 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !822, file: !94, line: 809, size: 8, flags: DIFlagExportSymbols | DIFlagTypePassByValue, elements: !826, identifier: "_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__shortUt_E")
!826 = !{!827, !829}
!827 = !DIDerivedType(tag: DW_TAG_member, name: "__is_long_", scope: !825, file: !94, line: 810, baseType: !828, size: 1, flags: DIFlagBitField, extraData: i64 0)
!828 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!829 = !DIDerivedType(tag: DW_TAG_member, name: "__size_", scope: !825, file: !94, line: 811, baseType: !828, size: 7, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!830 = !DIDerivedType(tag: DW_TAG_member, name: "__padding_", scope: !822, file: !94, line: 813, baseType: !831, offset: 8)
!831 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, elements: !832)
!832 = !{!833}
!833 = !DISubrange(count: 0)
!834 = !DIDerivedType(tag: DW_TAG_member, name: "__data_", scope: !822, file: !94, line: 814, baseType: !835, size: 184, offset: 8)
!835 = !DICompositeType(tag: DW_TAG_array_type, baseType: !462, size: 184, elements: !836)
!836 = !{!837}
!837 = !DISubrange(count: 23)
!838 = !DIDerivedType(tag: DW_TAG_member, name: "__l", scope: !819, file: !94, line: 835, baseType: !839, size: 192)
!839 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__long", scope: !95, file: !94, line: 797, size: 192, flags: DIFlagTypePassByValue, elements: !840, identifier: "_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__longE")
!840 = !{!841, !846, !847}
!841 = !DIDerivedType(tag: DW_TAG_member, scope: !839, file: !94, line: 798, baseType: !842, size: 64)
!842 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !839, file: !94, line: 798, size: 64, flags: DIFlagExportSymbols | DIFlagTypePassByValue, elements: !843, identifier: "_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__longUt_E")
!843 = !{!844, !845}
!844 = !DIDerivedType(tag: DW_TAG_member, name: "__is_long_", scope: !842, file: !94, line: 799, baseType: !99, size: 1, flags: DIFlagBitField, extraData: i64 0)
!845 = !DIDerivedType(tag: DW_TAG_member, name: "__cap_", scope: !842, file: !94, line: 800, baseType: !99, size: 63, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!846 = !DIDerivedType(tag: DW_TAG_member, name: "__size_", scope: !839, file: !94, line: 802, baseType: !99, size: 64, offset: 64)
!847 = !DIDerivedType(tag: DW_TAG_member, name: "__data_", scope: !839, file: !94, line: 803, baseType: !205, size: 64, offset: 128)
!848 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !819, file: !94, line: 836, baseType: !849, size: 192)
!849 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__raw", scope: !95, file: !94, line: 828, size: 192, flags: DIFlagTypePassByValue, elements: !850, identifier: "_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__rawE")
!850 = !{!851}
!851 = !DIDerivedType(tag: DW_TAG_member, name: "__words", scope: !849, file: !94, line: 829, baseType: !852, size: 192)
!852 = !DICompositeType(tag: DW_TAG_array_type, baseType: !99, size: 192, elements: !853)
!853 = !{!854}
!854 = !DISubrange(count: 3)
!855 = !DISubprogram(name: "__compressed_pair_elem", scope: !89, file: !90, line: 49, type: !856, scopeLine: 49, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!856 = !DISubroutineType(types: !857)
!857 = !{null, !858, !131}
!858 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!859 = !DISubprogram(name: "__compressed_pair_elem", scope: !89, file: !90, line: 50, type: !860, scopeLine: 50, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!860 = !DISubroutineType(types: !861)
!861 = !{null, !858, !136}
!862 = !DISubprogram(name: "__get", linkageName: "_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne180100Ev", scope: !89, file: !90, line: 63, type: !863, scopeLine: 63, flags: DIFlagPrototyped, spFlags: 0)
!863 = !DISubroutineType(types: !864)
!864 = !{!157, !858}
!865 = !DISubprogram(name: "__get", linkageName: "_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne180100Ev", scope: !89, file: !90, line: 64, type: !866, scopeLine: 64, flags: DIFlagPrototyped, spFlags: 0)
!866 = !DISubroutineType(types: !867)
!867 = !{!163, !868}
!868 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !869, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!869 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !89)
!870 = !{!871, !872, !873}
!871 = !DITemplateTypeParameter(name: "_Tp", type: !93)
!872 = !DITemplateValueParameter(name: "_Idx", type: !152, value: i32 0)
!873 = !DITemplateValueParameter(name: "_CanBeEmptyBase", type: !41, defaulted: true, value: i1 false)
!874 = !{!0, !8, !10, !15, !17, !22, !24, !26}
!875 = !{!876, !881, !885, !888, !896, !901, !904, !906, !908, !910, !913, !916, !918, !920, !922, !924, !926, !928, !930, !932, !934, !936, !938, !940, !942, !944, !946, !948, !950, !952, !954, !956, !958, !960, !964, !971, !977, !982, !986, !990, !994, !1001, !1006, !1010, !1014, !1018, !1023, !1027, !1031, !1035, !1040, !1044, !1048, !1052, !1056, !1061, !1065, !1067, !1071, !1073, !1080, !1084, !1089, !1093, !1097, !1101, !1105, !1107, !1111, !1118, !1122, !1126, !1134, !1136, !1138, !1144, !1146, !1148, !1150, !1152, !1154, !1156, !1158, !1160, !1162, !1164, !1166, !1168, !1170, !1173, !1176, !1178, !1182, !1184, !1186, !1188, !1190, !1192, !1194, !1196, !1198, !1200, !1202, !1204, !1208, !1212, !1216, !1218, !1222, !1226, !1236, !1237, !1239, !1240, !1243, !1249, !1251, !1256, !1264, !1268, !1272, !1276, !1280, !1284, !1288, !1292, !1296, !1300, !1302, !1304, !1308, !1314, !1318, !1322, !1326, !1330, !1334, !1338, !1342, !1346, !1348, !1350, !1354, !1356, !1360, !1364, !1369, !1373, !1375, !1377, !1381, !1385, !1389, !1391, !1395, !1397, !1399, !1403, !1405, !1412, !1416, !1418, !1424, !1430, !1434, !1438, !1444, !1450, !1454, !1458, !1462, !1466, !1470, !1472, !1474, !1481, !1485, !1489, !1493, !1495, !1497, !1501, !1505, !1509, !1511, !1515, !1520, !1524, !1528, !1532, !1534, !1536, !1538, !1540, !1542, !1546, !1550, !1557, !1559, !1565, !1567, !1568, !1571, !1573, !1574, !1578, !1580, !1582, !1586, !1588, !1590, !1592, !1594, !1596, !1598, !1600, !1605, !1609, !1611, !1613, !1614, !1619, !1621, !1623, !1625, !1627, !1629, !1631, !1633, !1635, !1637, !1639, !1641, !1643, !1645, !1647, !1649, !1651, !1655, !1657, !1659, !1661, !1665, !1667, !1671, !1673, !1675, !1677, !1679, !1683, !1685, !1687, !1691, !1693, !1695, !1699, !1701, !1705, !1707, !1709, !1713, !1715, !1717, !1719, !1721, !1723, !1725, !1729, !1731, !1733, !1735, !1737, !1739, !1741, !1743, !1747, !1751, !1753, !1755, !1757, !1759, !1761, !1763, !1765, !1767, !1769, !1771, !1773, !1775, !1777, !1779, !1781, !1783, !1785, !1787, !1789, !1793, !1795, !1797, !1799, !1803, !1805, !1809, !1811, !1813, !1815, !1817, !1821, !1823, !1827, !1829, !1831, !1833, !1835, !1839, !1841, !1843, !1847, !1849, !1851, !1853, !1855, !1857, !1860, !1861, !1865, !1867, !1871, !1875, !1879, !1881, !1885, !1889, !1893, !1897, !1901, !1905, !1909, !1913, !1915, !1919, !1923, !1927, !1929, !1931, !1933, !1937, !1941, !1947, !1951, !1957, !1961, !1965, !1967, !1969, !1971, !1975, !1979, !1983, !1985, !1987, !1991, !1995, !1997, !2001, !2005, !2007, !2009, !2011, !2015, !2020, !2024, !2025, !2028, !2029, !2035, !2039, !2043, !2048, !2053, !2057, !2063, !2067, !2069, !2073}
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !877, file: !880, line: 59)
!877 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", file: !878, line: 41, baseType: !879)
!878 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/stddef.h", directory: "")
!879 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!880 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cstddef", directory: "")
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !882, file: !880, line: 60)
!882 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !883, line: 18, baseType: !884)
!883 = !DIFile(filename: "C:/msys64/clang64/lib/clang/18/include/__stddef_ptrdiff_t.h", directory: "")
!884 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !886, file: !880, line: 61)
!886 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !887, line: 18, baseType: !56)
!887 = !DIFile(filename: "C:/msys64/clang64/lib/clang/18/include/__stddef_size_t.h", directory: "")
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !889, file: !880, line: 64)
!889 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !890, line: 24, baseType: !891)
!890 = !DIFile(filename: "C:/msys64/clang64/lib/clang/18/include/__stddef_max_align_t.h", directory: "")
!891 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !890, line: 19, size: 256, flags: DIFlagTypePassByValue, elements: !892, identifier: "_ZTS11max_align_t")
!892 = !{!893, !894}
!893 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce1", scope: !891, file: !890, line: 20, baseType: !884, size: 64, align: 64)
!894 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce2", scope: !891, file: !890, line: 22, baseType: !895, size: 128, align: 128, offset: 128)
!895 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !897, file: !900, line: 162)
!897 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !898, line: 35, baseType: !899)
!898 = !DIFile(filename: "C:/msys64/clang64/include/stdint.h", directory: "")
!899 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!900 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cstdint", directory: "")
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !902, file: !900, line: 163)
!902 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !898, line: 37, baseType: !903)
!903 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !905, file: !900, line: 164)
!905 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !898, line: 39, baseType: !152)
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !907, file: !900, line: 165)
!907 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !898, line: 41, baseType: !884)
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !909, file: !900, line: 167)
!909 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !898, line: 36, baseType: !828)
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !911, file: !900, line: 168)
!911 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !898, line: 38, baseType: !912)
!912 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !914, file: !900, line: 169)
!914 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !898, line: 40, baseType: !915)
!915 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !917, file: !900, line: 170)
!917 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !898, line: 42, baseType: !56)
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !919, file: !900, line: 172)
!919 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !898, line: 45, baseType: !899)
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !921, file: !900, line: 173)
!921 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !898, line: 47, baseType: !903)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !923, file: !900, line: 174)
!923 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !898, line: 49, baseType: !152)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !925, file: !900, line: 175)
!925 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !898, line: 51, baseType: !884)
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !927, file: !900, line: 177)
!927 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !898, line: 46, baseType: !828)
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !929, file: !900, line: 178)
!929 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !898, line: 48, baseType: !912)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !931, file: !900, line: 179)
!931 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !898, line: 50, baseType: !915)
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !933, file: !900, line: 180)
!933 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !898, line: 52, baseType: !56)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !935, file: !900, line: 182)
!935 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !898, line: 58, baseType: !899)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !937, file: !900, line: 183)
!937 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !898, line: 60, baseType: !903)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !939, file: !900, line: 184)
!939 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !898, line: 62, baseType: !152)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !941, file: !900, line: 185)
!941 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !898, line: 64, baseType: !884)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !943, file: !900, line: 187)
!943 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !898, line: 59, baseType: !828)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !945, file: !900, line: 188)
!945 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !898, line: 61, baseType: !912)
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !947, file: !900, line: 189)
!947 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !898, line: 63, baseType: !915)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !949, file: !900, line: 190)
!949 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !898, line: 65, baseType: !56)
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !951, file: !900, line: 192)
!951 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !55, line: 62, baseType: !884)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !953, file: !900, line: 193)
!953 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !55, line: 75, baseType: !56)
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !955, file: !900, line: 195)
!955 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !898, line: 68, baseType: !884)
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !957, file: !900, line: 196)
!957 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !898, line: 69, baseType: !56)
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !54, file: !959, line: 103)
!959 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cstdlib", directory: "")
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !961, file: !959, line: 104)
!961 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !962, line: 63, baseType: !963)
!962 = !DIFile(filename: "C:/msys64/clang64/include/stdlib.h", directory: "")
!963 = !DICompositeType(tag: DW_TAG_structure_type, name: "_div_t", file: !962, line: 60, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS6_div_t")
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !965, file: !959, line: 105)
!965 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !962, line: 68, baseType: !966)
!966 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_ldiv_t", file: !962, line: 65, size: 64, flags: DIFlagTypePassByValue, elements: !967, identifier: "_ZTS7_ldiv_t")
!967 = !{!968, !970}
!968 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !966, file: !962, line: 66, baseType: !969, size: 32)
!969 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !966, file: !962, line: 67, baseType: !969, size: 32, offset: 32)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !972, file: !959, line: 106)
!972 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !962, line: 615, baseType: !973)
!973 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !962, line: 615, size: 128, flags: DIFlagTypePassByValue, elements: !974, identifier: "_ZTS7lldiv_t")
!974 = !{!975, !976}
!975 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !973, file: !962, line: 615, baseType: !884, size: 64)
!976 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !973, file: !962, line: 615, baseType: !884, size: 64, offset: 64)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !978, file: !959, line: 107)
!978 = !DISubprogram(name: "atof", scope: !962, file: !962, line: 317, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!979 = !DISubroutineType(types: !980)
!980 = !{!981, !72}
!981 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !983, file: !959, line: 108)
!983 = !DISubprogram(name: "atoi", scope: !962, file: !962, line: 320, type: !984, flags: DIFlagPrototyped, spFlags: 0)
!984 = !DISubroutineType(types: !985)
!985 = !{!152, !72}
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !987, file: !959, line: 109)
!987 = !DISubprogram(name: "atol", scope: !962, file: !962, line: 322, type: !988, flags: DIFlagPrototyped, spFlags: 0)
!988 = !DISubroutineType(types: !989)
!989 = !{!969, !72}
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !991, file: !959, line: 110)
!991 = !DISubprogram(name: "atoll", scope: !962, file: !962, line: 628, type: !992, flags: DIFlagPrototyped, spFlags: 0)
!992 = !DISubroutineType(types: !993)
!993 = !{!884, !72}
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !995, file: !959, line: 111)
!995 = !DISubprogram(name: "strtod", scope: !962, file: !962, line: 385, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!996 = !DISubroutineType(types: !997)
!997 = !{!981, !998, !999}
!998 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !72)
!999 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1000)
!1000 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1002, file: !959, line: 112)
!1002 = !DISubprogram(name: "strtof", scope: !962, file: !962, line: 386, type: !1003, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DISubroutineType(types: !1004)
!1004 = !{!1005, !998, !999}
!1005 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1007, file: !959, line: 113)
!1007 = !DISubprogram(name: "strtold", scope: !962, file: !962, line: 388, type: !1008, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!895, !998, !999}
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1011, file: !959, line: 114)
!1011 = !DISubprogram(name: "strtol", scope: !962, file: !962, line: 406, type: !1012, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!969, !998, !999, !152}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1015, file: !959, line: 115)
!1015 = !DISubprogram(name: "strtoll", scope: !962, file: !962, line: 624, type: !1016, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!884, !998, !999, !152}
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1019, file: !959, line: 116)
!1019 = !DISubprogram(name: "strtoul", scope: !962, file: !962, line: 408, type: !1020, flags: DIFlagPrototyped, spFlags: 0)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!1022, !998, !999, !152}
!1022 = !DIBasicType(name: "unsigned long", size: 32, encoding: DW_ATE_unsigned)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1024, file: !959, line: 117)
!1024 = !DISubprogram(name: "strtoull", scope: !962, file: !962, line: 625, type: !1025, flags: DIFlagPrototyped, spFlags: 0)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!56, !998, !999, !152}
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1028, file: !959, line: 118)
!1028 = !DISubprogram(name: "rand", scope: !962, file: !962, line: 356, type: !1029, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DISubroutineType(types: !1030)
!1030 = !{!152}
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1032, file: !959, line: 119)
!1032 = !DISubprogram(name: "srand", scope: !962, file: !962, line: 358, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{null, !915}
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1036, file: !959, line: 120)
!1036 = !DISubprogram(name: "calloc", scope: !962, file: !962, line: 422, type: !1037, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!1039, !54, !54}
!1039 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1041, file: !959, line: 121)
!1041 = !DISubprogram(name: "free", scope: !962, file: !962, line: 423, type: !1042, flags: DIFlagPrototyped, spFlags: 0)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{null, !1039}
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1045, file: !959, line: 122)
!1045 = !DISubprogram(name: "malloc", scope: !962, file: !962, line: 424, type: !1046, flags: DIFlagPrototyped, spFlags: 0)
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!1039, !54}
!1048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1049, file: !959, line: 123)
!1049 = !DISubprogram(name: "realloc", scope: !962, file: !962, line: 425, type: !1050, flags: DIFlagPrototyped, spFlags: 0)
!1050 = !DISubroutineType(types: !1051)
!1051 = !{!1039, !1039, !54}
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1053, file: !959, line: 124)
!1053 = !DISubprogram(name: "abort", scope: !962, file: !962, line: 291, type: !1054, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1054 = !DISubroutineType(types: !1055)
!1055 = !{null}
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1057, file: !959, line: 125)
!1057 = !DISubprogram(name: "atexit", scope: !962, file: !962, line: 311, type: !1058, flags: DIFlagPrototyped, spFlags: 0)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!152, !1060}
!1060 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1054, size: 64)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1062, file: !959, line: 126)
!1062 = !DISubprogram(name: "exit", scope: !962, file: !962, line: 274, type: !1063, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{null, !152}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1066, file: !959, line: 127)
!1066 = !DISubprogram(name: "_Exit", scope: !962, file: !962, line: 282, type: !1063, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1068, file: !959, line: 128)
!1068 = !DISubprogram(name: "getenv", scope: !962, file: !962, line: 333, type: !1069, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!53, !72}
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1072, file: !959, line: 129)
!1072 = !DISubprogram(name: "system", scope: !962, file: !962, line: 412, type: !984, flags: DIFlagPrototyped, spFlags: 0)
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1074, file: !959, line: 130)
!1074 = !DISubprogram(name: "bsearch", scope: !962, file: !962, line: 326, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!1039, !78, !78, !54, !54, !1077}
!1077 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1078, size: 64)
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!152, !78, !78}
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1081, file: !959, line: 131)
!1081 = !DISubprogram(name: "qsort", scope: !962, file: !962, line: 327, type: !1082, flags: DIFlagPrototyped, spFlags: 0)
!1082 = !DISubroutineType(types: !1083)
!1083 = !{null, !1039, !54, !54, !1077}
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1085, file: !959, line: 132)
!1085 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne180100e", scope: !1086, file: !1086, line: 127, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1086 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/stdlib.h", directory: "")
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!895, !895}
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1090, file: !959, line: 133)
!1090 = !DISubprogram(name: "labs", scope: !962, file: !962, line: 301, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!969, !969}
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1094, file: !959, line: 134)
!1094 = !DISubprogram(name: "llabs", scope: !962, file: !962, line: 619, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DISubroutineType(types: !1096)
!1096 = !{!884, !884}
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1098, file: !959, line: 135)
!1098 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne180100xx", scope: !1086, file: !1086, line: 147, type: !1099, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{!972, !884, !884}
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1102, file: !959, line: 136)
!1102 = !DISubprogram(name: "ldiv", scope: !962, file: !962, line: 343, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!965, !969, !969}
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1106, file: !959, line: 137)
!1106 = !DISubprogram(name: "lldiv", scope: !962, file: !962, line: 617, type: !1099, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1108, file: !959, line: 138)
!1108 = !DISubprogram(name: "mblen", scope: !962, file: !962, line: 345, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!152, !72, !54}
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1112, file: !959, line: 140)
!1112 = !DISubprogram(name: "mbtowc", scope: !962, file: !962, line: 351, type: !1113, flags: DIFlagPrototyped, spFlags: 0)
!1113 = !DISubroutineType(types: !1114)
!1114 = !{!152, !1115, !998, !54}
!1115 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1116)
!1116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1117, size: 64)
!1117 = !DIBasicType(name: "wchar_t", size: 16, encoding: DW_ATE_unsigned)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1119, file: !959, line: 141)
!1119 = !DISubprogram(name: "wctomb", scope: !962, file: !962, line: 415, type: !1120, flags: DIFlagPrototyped, spFlags: 0)
!1120 = !DISubroutineType(types: !1121)
!1121 = !{!152, !53, !1117}
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1123, file: !959, line: 142)
!1123 = !DISubprogram(name: "mbstowcs", scope: !962, file: !962, line: 353, type: !1124, flags: DIFlagPrototyped, spFlags: 0)
!1124 = !DISubroutineType(types: !1125)
!1125 = !{!54, !1115, !998, !54}
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1127, file: !959, line: 143)
!1127 = !DISubprogram(name: "wcstombs", scope: !962, file: !962, line: 417, type: !1128, flags: DIFlagPrototyped, spFlags: 0)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!54, !1130, !1131, !54}
!1130 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !53)
!1131 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1132)
!1132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1133, size: 64)
!1133 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1117)
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1135, file: !959, line: 146)
!1135 = !DISubprogram(name: "at_quick_exit", scope: !962, file: !962, line: 313, type: !1058, flags: DIFlagPrototyped, spFlags: 0)
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1137, file: !959, line: 147)
!1137 = !DISubprogram(name: "quick_exit", scope: !962, file: !962, line: 277, type: !1063, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1139, file: !1143, line: 111)
!1139 = !DISubprogram(name: "isalnum", scope: !1140, file: !1140, line: 96, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1140 = !DIFile(filename: "C:/msys64/clang64/include/ctype.h", directory: "")
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!152, !152}
!1143 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cctype", directory: "")
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1145, file: !1143, line: 112)
!1145 = !DISubprogram(name: "isalpha", scope: !1140, file: !1140, line: 82, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1147, file: !1143, line: 113)
!1147 = !DISubprogram(name: "isblank", scope: !1140, file: !1140, line: 116, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1149, file: !1143, line: 114)
!1149 = !DISubprogram(name: "iscntrl", scope: !1140, file: !1140, line: 102, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1151, file: !1143, line: 115)
!1151 = !DISubprogram(name: "isdigit", scope: !1140, file: !1140, line: 88, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1153, file: !1143, line: 116)
!1153 = !DISubprogram(name: "isgraph", scope: !1140, file: !1140, line: 100, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1155, file: !1143, line: 117)
!1155 = !DISubprogram(name: "islower", scope: !1140, file: !1140, line: 86, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1157, file: !1143, line: 118)
!1157 = !DISubprogram(name: "isprint", scope: !1140, file: !1140, line: 98, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1159, file: !1143, line: 119)
!1159 = !DISubprogram(name: "ispunct", scope: !1140, file: !1140, line: 94, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1161, file: !1143, line: 120)
!1161 = !DISubprogram(name: "isspace", scope: !1140, file: !1140, line: 92, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1163, file: !1143, line: 121)
!1163 = !DISubprogram(name: "isupper", scope: !1140, file: !1140, line: 84, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1165, file: !1143, line: 122)
!1165 = !DISubprogram(name: "isxdigit", scope: !1140, file: !1140, line: 90, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1167, file: !1143, line: 123)
!1167 = !DISubprogram(name: "tolower", scope: !1140, file: !1140, line: 105, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1169, file: !1143, line: 124)
!1169 = !DISubprogram(name: "toupper", scope: !1140, file: !1140, line: 104, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1171, file: !1172, line: 73)
!1171 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !55, line: 106, baseType: !912)
!1172 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cwctype", directory: "")
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1174, file: !1172, line: 74)
!1174 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1175, line: 150, baseType: !1117)
!1175 = !DIFile(filename: "C:/msys64/clang64/include/wctype.h", directory: "")
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1177, file: !1172, line: 75)
!1177 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !55, line: 107, baseType: !912)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1179, file: !1172, line: 76)
!1179 = !DISubprogram(name: "iswalnum", scope: !1140, file: !1140, line: 130, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1180 = !DISubroutineType(types: !1181)
!1181 = !{!152, !1171}
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1183, file: !1172, line: 77)
!1183 = !DISubprogram(name: "iswalpha", scope: !1140, file: !1140, line: 123, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1185, file: !1172, line: 78)
!1185 = !DISubprogram(name: "iswblank", scope: !1140, file: !1140, line: 173, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1187, file: !1172, line: 79)
!1187 = !DISubprogram(name: "iswcntrl", scope: !1140, file: !1140, line: 133, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1189, file: !1172, line: 80)
!1189 = !DISubprogram(name: "iswdigit", scope: !1140, file: !1140, line: 126, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1191, file: !1172, line: 81)
!1191 = !DISubprogram(name: "iswgraph", scope: !1140, file: !1140, line: 132, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1193, file: !1172, line: 82)
!1193 = !DISubprogram(name: "iswlower", scope: !1140, file: !1140, line: 125, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1195, file: !1172, line: 83)
!1195 = !DISubprogram(name: "iswprint", scope: !1140, file: !1140, line: 131, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1197, file: !1172, line: 84)
!1197 = !DISubprogram(name: "iswpunct", scope: !1140, file: !1140, line: 129, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1199, file: !1172, line: 85)
!1199 = !DISubprogram(name: "iswspace", scope: !1140, file: !1140, line: 128, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1201, file: !1172, line: 86)
!1201 = !DISubprogram(name: "iswupper", scope: !1140, file: !1140, line: 124, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1203, file: !1172, line: 87)
!1203 = !DISubprogram(name: "iswxdigit", scope: !1140, file: !1140, line: 127, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1205, file: !1172, line: 88)
!1205 = !DISubprogram(name: "iswctype", scope: !1140, file: !1140, line: 140, type: !1206, flags: DIFlagPrototyped, spFlags: 0)
!1206 = !DISubroutineType(types: !1207)
!1207 = !{!152, !1171, !1177}
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1209, file: !1172, line: 89)
!1209 = !DISubprogram(name: "wctype", scope: !1175, file: !1175, line: 153, type: !1210, flags: DIFlagPrototyped, spFlags: 0)
!1210 = !DISubroutineType(types: !1211)
!1211 = !{!1177, !72}
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1213, file: !1172, line: 90)
!1213 = !DISubprogram(name: "towlower", scope: !1140, file: !1140, line: 139, type: !1214, flags: DIFlagPrototyped, spFlags: 0)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!1171, !1171}
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1217, file: !1172, line: 91)
!1217 = !DISubprogram(name: "towupper", scope: !1140, file: !1140, line: 138, type: !1214, flags: DIFlagPrototyped, spFlags: 0)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1219, file: !1172, line: 92)
!1219 = !DISubprogram(name: "towctrans", scope: !1175, file: !1175, line: 151, type: !1220, flags: DIFlagPrototyped, spFlags: 0)
!1220 = !DISubroutineType(types: !1221)
!1221 = !{!1171, !1171, !1174}
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1223, file: !1172, line: 93)
!1223 = !DISubprogram(name: "wctrans", scope: !1175, file: !1175, line: 152, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DISubroutineType(types: !1225)
!1225 = !{!1174, !72}
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1227, file: !1235, line: 130)
!1227 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !1228, line: 1322, baseType: !1229)
!1228 = !DIFile(filename: "C:/msys64/clang64/include/wchar.h", directory: "")
!1229 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mbstatet", file: !1228, line: 1321, baseType: !1230)
!1230 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Mbstatet", file: !1228, line: 1318, size: 64, flags: DIFlagTypePassByValue, elements: !1231, identifier: "_ZTS9_Mbstatet")
!1231 = !{!1232, !1233, !1234}
!1232 = !DIDerivedType(tag: DW_TAG_member, name: "_Wchar", scope: !1230, file: !1228, line: 1319, baseType: !1022, size: 32)
!1233 = !DIDerivedType(tag: DW_TAG_member, name: "_Byte", scope: !1230, file: !1228, line: 1320, baseType: !912, size: 16, offset: 32)
!1234 = !DIDerivedType(tag: DW_TAG_member, name: "_State", scope: !1230, file: !1228, line: 1320, baseType: !912, size: 16, offset: 48)
!1235 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cwchar", directory: "")
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !54, file: !1235, line: 131)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1238, file: !1235, line: 132)
!1238 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1228, line: 1262, size: 288, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1171, file: !1235, line: 133)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1241, file: !1235, line: 134)
!1241 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1228, line: 52, baseType: !1242)
!1242 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !1228, line: 42, size: 384, flags: DIFlagFwdDecl, identifier: "_ZTS6_iobuf")
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1244, file: !1235, line: 135)
!1244 = !DISubprogram(name: "fwprintf", scope: !1228, file: !1228, line: 598, type: !1245, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!152, !1247, !1131, null}
!1247 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1248)
!1248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1241, size: 64)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1250, file: !1235, line: 136)
!1250 = !DISubprogram(name: "fwscanf", scope: !1228, file: !1228, line: 549, type: !1245, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1252, file: !1235, line: 137)
!1252 = !DISubprogram(name: "swprintf", linkageName: "_Z8swprintfPwPKwz", scope: !1253, file: !1253, line: 49, type: !1254, flags: DIFlagPrototyped, spFlags: 0)
!1253 = !DIFile(filename: "C:/msys64/clang64/include/swprintf.inl", directory: "")
!1254 = !DISubroutineType(types: !1255)
!1255 = !{!152, !1116, !1132, null}
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1257, file: !1235, line: 138)
!1257 = !DISubprogram(name: "vfwprintf", scope: !1228, file: !1228, line: 610, type: !1258, flags: DIFlagPrototyped, spFlags: 0)
!1258 = !DISubroutineType(types: !1259)
!1259 = !{!152, !1247, !1131, !1260}
!1260 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1261, line: 31, baseType: !1262)
!1261 = !DIFile(filename: "C:/msys64/clang64/include/vadefs.h", directory: "")
!1262 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1261, line: 24, baseType: !1263)
!1263 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2, baseType: !53)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1265, file: !1235, line: 139)
!1265 = !DISubprogram(name: "vswprintf", linkageName: "_Z9vswprintfPwPKwPc", scope: !1253, file: !1253, line: 38, type: !1266, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DISubroutineType(types: !1267)
!1267 = !{!152, !1116, !1132, !1263}
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1269, file: !1235, line: 140)
!1269 = !DISubprogram(name: "swscanf", scope: !1228, file: !1228, line: 559, type: !1270, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DISubroutineType(types: !1271)
!1271 = !{!152, !1131, !1131, null}
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1273, file: !1235, line: 141)
!1273 = !DISubprogram(name: "vfwscanf", scope: !1228, file: !1228, line: 580, type: !1274, flags: DIFlagPrototyped, spFlags: 0)
!1274 = !DISubroutineType(types: !1275)
!1275 = !{!152, !1248, !1132, !1260}
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1277, file: !1235, line: 142)
!1277 = !DISubprogram(name: "vswscanf", scope: !1228, file: !1228, line: 587, type: !1278, flags: DIFlagPrototyped, spFlags: 0)
!1278 = !DISubroutineType(types: !1279)
!1279 = !{!152, !1131, !1131, !1260}
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1281, file: !1235, line: 143)
!1281 = !DISubprogram(name: "fgetwc", scope: !1228, file: !1228, line: 669, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{!1171, !1248}
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1285, file: !1235, line: 144)
!1285 = !DISubprogram(name: "fgetws", scope: !1228, file: !1228, line: 678, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!1116, !1115, !152, !1247}
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1289, file: !1235, line: 145)
!1289 = !DISubprogram(name: "fputwc", scope: !1228, file: !1228, line: 671, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!1171, !1117, !1248}
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1293, file: !1235, line: 146)
!1293 = !DISubprogram(name: "fputws", scope: !1228, file: !1228, line: 679, type: !1294, flags: DIFlagPrototyped, spFlags: 0)
!1294 = !DISubroutineType(types: !1295)
!1295 = !{!152, !1131, !1247}
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1297, file: !1235, line: 147)
!1297 = !DISubprogram(name: "fwide", scope: !1228, file: !1228, line: 1343, type: !1298, flags: DIFlagPrototyped, spFlags: 0)
!1298 = !DISubroutineType(types: !1299)
!1299 = !{!152, !1248, !152}
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1301, file: !1235, line: 148)
!1301 = !DISubprogram(name: "getwc", scope: !1228, file: !1228, line: 673, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1303, file: !1235, line: 149)
!1303 = !DISubprogram(name: "putwc", scope: !1228, file: !1228, line: 675, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1305, file: !1235, line: 150)
!1305 = !DISubprogram(name: "ungetwc", scope: !1228, file: !1228, line: 677, type: !1306, flags: DIFlagPrototyped, spFlags: 0)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!1171, !1171, !1248}
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1309, file: !1235, line: 151)
!1309 = !DISubprogram(name: "wcstod", scope: !962, file: !962, line: 461, type: !1310, flags: DIFlagPrototyped, spFlags: 0)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!981, !1131, !1312}
!1312 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1313)
!1313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1116, size: 64)
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1315, file: !1235, line: 152)
!1315 = !DISubprogram(name: "wcstof", scope: !962, file: !962, line: 462, type: !1316, flags: DIFlagPrototyped, spFlags: 0)
!1316 = !DISubroutineType(types: !1317)
!1317 = !{!1005, !1131, !1312}
!1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1319, file: !1235, line: 153)
!1319 = !DISubprogram(name: "wcstold", scope: !962, file: !962, line: 465, type: !1320, flags: DIFlagPrototyped, spFlags: 0)
!1320 = !DISubroutineType(types: !1321)
!1321 = !{!895, !1131, !1312}
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1323, file: !1235, line: 154)
!1323 = !DISubprogram(name: "wcstol", scope: !962, file: !962, line: 469, type: !1324, flags: DIFlagPrototyped, spFlags: 0)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{!969, !1131, !1312, !152}
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1327, file: !1235, line: 155)
!1327 = !DISubprogram(name: "wcstoll", scope: !1228, file: !1228, line: 1350, type: !1328, flags: DIFlagPrototyped, spFlags: 0)
!1328 = !DISubroutineType(types: !1329)
!1329 = !{!884, !1131, !1312, !152}
!1330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1331, file: !1235, line: 156)
!1331 = !DISubprogram(name: "wcstoul", scope: !962, file: !962, line: 471, type: !1332, flags: DIFlagPrototyped, spFlags: 0)
!1332 = !DISubroutineType(types: !1333)
!1333 = !{!1022, !1131, !1312, !152}
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1335, file: !1235, line: 157)
!1335 = !DISubprogram(name: "wcstoull", scope: !1228, file: !1228, line: 1351, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!56, !1131, !1312, !152}
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1339, file: !1235, line: 158)
!1339 = !DISubprogram(name: "wcscpy", scope: !1228, file: !1228, line: 1205, type: !1340, flags: DIFlagPrototyped, spFlags: 0)
!1340 = !DISubroutineType(types: !1341)
!1341 = !{!1116, !1115, !1131}
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1343, file: !1235, line: 159)
!1343 = !DISubprogram(name: "wcsncpy", scope: !1228, file: !1228, line: 1211, type: !1344, flags: DIFlagPrototyped, spFlags: 0)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!1116, !1115, !1131, !54}
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1347, file: !1235, line: 160)
!1347 = !DISubprogram(name: "wcscat", scope: !1228, file: !1228, line: 1202, type: !1340, flags: DIFlagPrototyped, spFlags: 0)
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1349, file: !1235, line: 161)
!1349 = !DISubprogram(name: "wcsncat", scope: !1228, file: !1228, line: 1209, type: !1344, flags: DIFlagPrototyped, spFlags: 0)
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1351, file: !1235, line: 162)
!1351 = !DISubprogram(name: "wcscmp", scope: !1228, file: !1228, line: 1204, type: !1352, flags: DIFlagPrototyped, spFlags: 0)
!1352 = !DISubroutineType(types: !1353)
!1353 = !{!152, !1132, !1132}
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1355, file: !1235, line: 163)
!1355 = !DISubprogram(name: "wcscoll", scope: !1228, file: !1228, line: 1237, type: !1352, flags: DIFlagPrototyped, spFlags: 0)
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1357, file: !1235, line: 164)
!1357 = !DISubprogram(name: "wcsncmp", scope: !1228, file: !1228, line: 1210, type: !1358, flags: DIFlagPrototyped, spFlags: 0)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!152, !1132, !1132, !54}
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1361, file: !1235, line: 165)
!1361 = !DISubprogram(name: "wcsxfrm", scope: !1228, file: !1228, line: 1235, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1362 = !DISubroutineType(types: !1363)
!1363 = !{!54, !1115, !1131, !54}
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1365, file: !1235, line: 166)
!1365 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne180100Ua9enable_ifILb1EEPww", scope: !1366, file: !1366, line: 153, type: !1367, flags: DIFlagPrototyped, spFlags: 0)
!1366 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/wchar.h", directory: "")
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!1116, !1116, !1117}
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1370, file: !1235, line: 167)
!1370 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne180100Ua9enable_ifILb1EEPwPKw", scope: !1366, file: !1366, line: 164, type: !1371, flags: DIFlagPrototyped, spFlags: 0)
!1371 = !DISubroutineType(types: !1372)
!1372 = !{!1116, !1116, !1132}
!1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1374, file: !1235, line: 168)
!1374 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne180100Ua9enable_ifILb1EEPww", scope: !1366, file: !1366, line: 174, type: !1367, flags: DIFlagPrototyped, spFlags: 0)
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1376, file: !1235, line: 169)
!1376 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne180100Ua9enable_ifILb1EEPwPKw", scope: !1366, file: !1366, line: 185, type: !1371, flags: DIFlagPrototyped, spFlags: 0)
!1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1378, file: !1235, line: 170)
!1378 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne180100Ua9enable_ifILb1EEPwwy", scope: !1366, file: !1366, line: 196, type: !1379, flags: DIFlagPrototyped, spFlags: 0)
!1379 = !DISubroutineType(types: !1380)
!1380 = !{!1116, !1116, !1117, !54}
!1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1382, file: !1235, line: 171)
!1382 = !DISubprogram(name: "wcscspn", scope: !1228, file: !1228, line: 1206, type: !1383, flags: DIFlagPrototyped, spFlags: 0)
!1383 = !DISubroutineType(types: !1384)
!1384 = !{!54, !1132, !1132}
!1385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1386, file: !1235, line: 172)
!1386 = !DISubprogram(name: "wcslen", scope: !1228, file: !1228, line: 1207, type: !1387, flags: DIFlagPrototyped, spFlags: 0)
!1387 = !DISubroutineType(types: !1388)
!1388 = !{!54, !1132}
!1389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1390, file: !1235, line: 173)
!1390 = !DISubprogram(name: "wcsspn", scope: !1228, file: !1228, line: 1215, type: !1383, flags: DIFlagPrototyped, spFlags: 0)
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1392, file: !1235, line: 174)
!1392 = !DISubprogram(name: "wcstok", scope: !1228, file: !1228, line: 1218, type: !1393, flags: DIFlagPrototyped, spFlags: 0)
!1393 = !DISubroutineType(types: !1394)
!1394 = !{!1116, !1115, !1131, !1313}
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1396, file: !1235, line: 175)
!1396 = !DISubprogram(name: "wmemcmp", scope: !1228, file: !1228, line: 1339, type: !1358, flags: DIFlagPrototyped, spFlags: 0)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1398, file: !1235, line: 176)
!1398 = !DISubprogram(name: "wmemcpy", scope: !1228, file: !1228, line: 1340, type: !1344, flags: DIFlagPrototyped, spFlags: 0)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1400, file: !1235, line: 177)
!1400 = !DISubprogram(name: "wmemmove", scope: !1228, file: !1228, line: 1342, type: !1401, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!1116, !1116, !1132, !54}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1404, file: !1235, line: 178)
!1404 = !DISubprogram(name: "wmemset", scope: !1228, file: !1228, line: 1337, type: !1379, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1406, file: !1235, line: 179)
!1406 = !DISubprogram(name: "wcsftime", scope: !1228, file: !1228, line: 1282, type: !1407, flags: DIFlagPrototyped, spFlags: 0)
!1407 = !DISubroutineType(types: !1408)
!1408 = !{!54, !1115, !54, !1131, !1409}
!1409 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1410)
!1410 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1411, size: 64)
!1411 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1238)
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1413, file: !1235, line: 180)
!1413 = !DISubprogram(name: "btowc", scope: !1228, file: !1228, line: 1328, type: !1414, flags: DIFlagPrototyped, spFlags: 0)
!1414 = !DISubroutineType(types: !1415)
!1415 = !{!1171, !152}
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1417, file: !1235, line: 181)
!1417 = !DISubprogram(name: "wctob", scope: !1228, file: !1228, line: 1334, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1419, file: !1235, line: 182)
!1419 = !DISubprogram(name: "mbsinit", scope: !1228, file: !1228, line: 1346, type: !1420, flags: DIFlagPrototyped, spFlags: 0)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{!152, !1422}
!1422 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1423, size: 64)
!1423 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1227)
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1425, file: !1235, line: 183)
!1425 = !DISubprogram(name: "mbrlen", scope: !1228, file: !1228, line: 1329, type: !1426, flags: DIFlagPrototyped, spFlags: 0)
!1426 = !DISubroutineType(types: !1427)
!1427 = !{!54, !998, !54, !1428}
!1428 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1429)
!1429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1227, size: 64)
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1431, file: !1235, line: 184)
!1431 = !DISubprogram(name: "mbrtowc", scope: !1228, file: !1228, line: 1330, type: !1432, flags: DIFlagPrototyped, spFlags: 0)
!1432 = !DISubroutineType(types: !1433)
!1433 = !{!54, !1115, !998, !54, !1428}
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1435, file: !1235, line: 185)
!1435 = !DISubprogram(name: "wcrtomb", scope: !1228, file: !1228, line: 1332, type: !1436, flags: DIFlagPrototyped, spFlags: 0)
!1436 = !DISubroutineType(types: !1437)
!1437 = !{!54, !1130, !1117, !1428}
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1439, file: !1235, line: 186)
!1439 = !DISubprogram(name: "mbsrtowcs", scope: !1228, file: !1228, line: 1331, type: !1440, flags: DIFlagPrototyped, spFlags: 0)
!1440 = !DISubroutineType(types: !1441)
!1441 = !{!54, !1115, !1442, !54, !1428}
!1442 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1443)
!1443 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!1444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1445, file: !1235, line: 187)
!1445 = !DISubprogram(name: "wcsrtombs", scope: !1228, file: !1228, line: 1333, type: !1446, flags: DIFlagPrototyped, spFlags: 0)
!1446 = !DISubroutineType(types: !1447)
!1447 = !{!54, !1130, !1448, !54, !1428}
!1448 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1449)
!1449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1132, size: 64)
!1450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1451, file: !1235, line: 189)
!1451 = !DISubprogram(name: "getwchar", scope: !1228, file: !1228, line: 674, type: !1452, flags: DIFlagPrototyped, spFlags: 0)
!1452 = !DISubroutineType(types: !1453)
!1453 = !{!1171}
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1455, file: !1235, line: 190)
!1455 = !DISubprogram(name: "vwscanf", scope: !1228, file: !1228, line: 593, type: !1456, flags: DIFlagPrototyped, spFlags: 0)
!1456 = !DISubroutineType(types: !1457)
!1457 = !{!152, !1132, !1260}
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1459, file: !1235, line: 191)
!1459 = !DISubprogram(name: "wscanf", scope: !1228, file: !1228, line: 569, type: !1460, flags: DIFlagPrototyped, spFlags: 0)
!1460 = !DISubroutineType(types: !1461)
!1461 = !{!152, !1131, null}
!1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1463, file: !1235, line: 193)
!1463 = !DISubprogram(name: "putwchar", scope: !1228, file: !1228, line: 676, type: !1464, flags: DIFlagPrototyped, spFlags: 0)
!1464 = !DISubroutineType(types: !1465)
!1465 = !{!1171, !1117}
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1467, file: !1235, line: 194)
!1467 = !DISubprogram(name: "vwprintf", scope: !1228, file: !1228, line: 615, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!152, !1131, !1260}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1471, file: !1235, line: 195)
!1471 = !DISubprogram(name: "wprintf", scope: !1228, file: !1228, line: 600, type: !1460, flags: DIFlagPrototyped, spFlags: 0)
!1472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !54, file: !1473, line: 79)
!1473 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cstring", directory: "")
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1475, file: !1473, line: 80)
!1475 = !DISubprogram(name: "memcpy", scope: !1476, file: !1476, line: 50, type: !1477, flags: DIFlagPrototyped, spFlags: 0)
!1476 = !DIFile(filename: "C:/msys64/clang64/include/string.h", directory: "")
!1477 = !DISubroutineType(types: !1478)
!1478 = !{!1039, !1479, !1480, !54}
!1479 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1039)
!1480 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !78)
!1481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1482, file: !1473, line: 81)
!1482 = !DISubprogram(name: "memmove", scope: !1476, file: !1476, line: 66, type: !1483, flags: DIFlagPrototyped, spFlags: 0)
!1483 = !DISubroutineType(types: !1484)
!1484 = !{!1039, !1039, !78, !54}
!1485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1486, file: !1473, line: 82)
!1486 = !DISubprogram(name: "strcpy", scope: !1476, file: !1476, line: 61, type: !1487, flags: DIFlagPrototyped, spFlags: 0)
!1487 = !DISubroutineType(types: !1488)
!1488 = !{!53, !1130, !998}
!1489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1490, file: !1473, line: 83)
!1490 = !DISubprogram(name: "strncpy", scope: !1476, file: !1476, line: 89, type: !1491, flags: DIFlagPrototyped, spFlags: 0)
!1491 = !DISubroutineType(types: !1492)
!1492 = !{!53, !1130, !998, !54}
!1493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1494, file: !1473, line: 84)
!1494 = !DISubprogram(name: "strcat", scope: !1476, file: !1476, line: 62, type: !1487, flags: DIFlagPrototyped, spFlags: 0)
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1496, file: !1473, line: 85)
!1496 = !DISubprogram(name: "strncat", scope: !1476, file: !1476, line: 85, type: !1491, flags: DIFlagPrototyped, spFlags: 0)
!1497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1498, file: !1473, line: 86)
!1498 = !DISubprogram(name: "memcmp", scope: !1476, file: !1476, line: 49, type: !1499, flags: DIFlagPrototyped, spFlags: 0)
!1499 = !DISubroutineType(types: !1500)
!1500 = !{!152, !78, !78, !54}
!1501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1502, file: !1473, line: 87)
!1502 = !DISubprogram(name: "strcmp", scope: !1476, file: !1476, line: 63, type: !1503, flags: DIFlagPrototyped, spFlags: 0)
!1503 = !DISubroutineType(types: !1504)
!1504 = !{!152, !72, !72}
!1505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1506, file: !1473, line: 88)
!1506 = !DISubprogram(name: "strncmp", scope: !1476, file: !1476, line: 86, type: !1507, flags: DIFlagPrototyped, spFlags: 0)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{!152, !72, !72, !54}
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1510, file: !1473, line: 89)
!1510 = !DISubprogram(name: "strcoll", scope: !1476, file: !1476, line: 72, type: !1503, flags: DIFlagPrototyped, spFlags: 0)
!1511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1512, file: !1473, line: 90)
!1512 = !DISubprogram(name: "strxfrm", scope: !1476, file: !1476, line: 104, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1513 = !DISubroutineType(types: !1514)
!1514 = !{!54, !1130, !998, !54}
!1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1516, file: !1473, line: 91)
!1516 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne180100Ua9enable_ifILb1EEPviy", scope: !1517, file: !1517, line: 97, type: !1518, flags: DIFlagPrototyped, spFlags: 0)
!1517 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/string.h", directory: "")
!1518 = !DISubroutineType(types: !1519)
!1519 = !{!1039, !1039, !152, !54}
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1521, file: !1473, line: 92)
!1521 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne180100Ua9enable_ifILb1EEPci", scope: !1517, file: !1517, line: 76, type: !1522, flags: DIFlagPrototyped, spFlags: 0)
!1522 = !DISubroutineType(types: !1523)
!1523 = !{!53, !53, !152}
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1525, file: !1473, line: 93)
!1525 = !DISubprogram(name: "strcspn", scope: !1476, file: !1476, line: 80, type: !1526, flags: DIFlagPrototyped, spFlags: 0)
!1526 = !DISubroutineType(types: !1527)
!1527 = !{!54, !72, !72}
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1529, file: !1473, line: 94)
!1529 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne180100Ua9enable_ifILb1EEPcPKc", scope: !1517, file: !1517, line: 83, type: !1530, flags: DIFlagPrototyped, spFlags: 0)
!1530 = !DISubroutineType(types: !1531)
!1531 = !{!53, !53, !72}
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1533, file: !1473, line: 95)
!1533 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne180100Ua9enable_ifILb1EEPci", scope: !1517, file: !1517, line: 90, type: !1522, flags: DIFlagPrototyped, spFlags: 0)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1535, file: !1473, line: 96)
!1535 = !DISubprogram(name: "strspn", scope: !1476, file: !1476, line: 95, type: !1526, flags: DIFlagPrototyped, spFlags: 0)
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1537, file: !1473, line: 97)
!1537 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne180100Ua9enable_ifILb1EEPcPKc", scope: !1517, file: !1517, line: 104, type: !1530, flags: DIFlagPrototyped, spFlags: 0)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1539, file: !1473, line: 98)
!1539 = !DISubprogram(name: "strtok", scope: !1476, file: !1476, line: 97, type: !1487, flags: DIFlagPrototyped, spFlags: 0)
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1541, file: !1473, line: 99)
!1541 = !DISubprogram(name: "memset", scope: !1476, file: !1476, line: 53, type: !1518, flags: DIFlagPrototyped, spFlags: 0)
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1543, file: !1473, line: 100)
!1543 = !DISubprogram(name: "strerror", scope: !1476, file: !1476, line: 82, type: !1544, flags: DIFlagPrototyped, spFlags: 0)
!1544 = !DISubroutineType(types: !1545)
!1545 = !{!53, !152}
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1547, file: !1473, line: 101)
!1547 = !DISubprogram(name: "strlen", scope: !1476, file: !1476, line: 64, type: !1548, flags: DIFlagPrototyped, spFlags: 0)
!1548 = !DISubroutineType(types: !1549)
!1549 = !{!54, !72}
!1550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !1551, file: !1556, line: 422)
!1551 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne180100Ee", scope: !1553, file: !1552, line: 80, type: !1554, flags: DIFlagPrototyped, spFlags: 0)
!1552 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__math/traits.h", directory: "")
!1553 = !DINamespace(name: "__math", scope: !32)
!1554 = !DISubroutineType(types: !1555)
!1555 = !{!41, !895}
!1556 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/math.h", directory: "")
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !1558, file: !1556, line: 426)
!1558 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne180100Ee", scope: !1553, file: !1552, line: 107, type: !1554, flags: DIFlagPrototyped, spFlags: 0)
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !1560, file: !1556, line: 482)
!1560 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne180100EePe", scope: !1553, file: !1561, line: 55, type: !1562, flags: DIFlagPrototyped, spFlags: 0)
!1561 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__math/modulo.h", directory: "")
!1562 = !DISubroutineType(types: !1563)
!1563 = !{!895, !895, !1564}
!1564 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !895, size: 64)
!1565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1551, file: !1566, line: 341)
!1566 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cmath", directory: "")
!1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1558, file: !1566, line: 342)
!1568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1569, file: !1566, line: 352)
!1569 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !1570, line: 359, baseType: !1005)
!1570 = !DIFile(filename: "C:/msys64/clang64/include/math.h", directory: "")
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1572, file: !1566, line: 353)
!1572 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !1570, line: 360, baseType: !981)
!1573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1085, file: !1566, line: 355)
!1574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1575, file: !1566, line: 358)
!1575 = !DISubprogram(name: "acosf", scope: !1570, file: !1570, line: 662, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1576 = !DISubroutineType(types: !1577)
!1577 = !{!1005, !1005}
!1578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1579, file: !1566, line: 360)
!1579 = !DISubprogram(name: "asinf", scope: !1570, file: !1570, line: 659, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1581, file: !1566, line: 362)
!1581 = !DISubprogram(name: "atanf", scope: !1570, file: !1570, line: 665, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1583, file: !1566, line: 364)
!1583 = !DISubprogram(name: "atan2f", scope: !1570, file: !1570, line: 668, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1584 = !DISubroutineType(types: !1585)
!1585 = !{!1005, !1005, !1005}
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1587, file: !1566, line: 366)
!1587 = !DISubprogram(name: "ceilf", scope: !1570, file: !1570, line: 914, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1589, file: !1566, line: 368)
!1589 = !DISubprogram(name: "cosf", scope: !1570, file: !1570, line: 654, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1591, file: !1566, line: 370)
!1591 = !DISubprogram(name: "coshf", scope: !1570, file: !1570, line: 678, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1593, file: !1566, line: 373)
!1593 = !DISubprogram(name: "expf", scope: !1570, file: !1570, line: 708, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1595, file: !1566, line: 376)
!1595 = !DISubprogram(name: "fabsf", scope: !1570, file: !1570, line: 190, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1597, file: !1566, line: 378)
!1597 = !DISubprogram(name: "floorf", scope: !1570, file: !1570, line: 918, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1599, file: !1566, line: 381)
!1599 = !DISubprogram(name: "fmodf", scope: !1570, file: !1570, line: 1040, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1601, file: !1566, line: 384)
!1601 = !DISubprogram(name: "frexpf", scope: !1570, file: !1570, line: 726, type: !1602, flags: DIFlagPrototyped, spFlags: 0)
!1602 = !DISubroutineType(types: !1603)
!1603 = !{!1005, !1005, !1604}
!1604 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1606, file: !1566, line: 386)
!1606 = !DISubprogram(name: "ldexpf", scope: !1570, file: !1570, line: 740, type: !1607, flags: DIFlagPrototyped, spFlags: 0)
!1607 = !DISubroutineType(types: !1608)
!1608 = !{!1005, !1005, !152}
!1609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1610, file: !1566, line: 389)
!1610 = !DISubprogram(name: "logf", scope: !1570, file: !1570, line: 747, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1612, file: !1566, line: 392)
!1612 = !DISubprogram(name: "log10f", scope: !1570, file: !1570, line: 751, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1560, file: !1566, line: 393)
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1615, file: !1566, line: 394)
!1615 = !DISubprogram(name: "modff", scope: !1570, file: !1570, line: 854, type: !1616, flags: DIFlagPrototyped, spFlags: 0)
!1616 = !DISubroutineType(types: !1617)
!1617 = !{!1005, !1005, !1618}
!1618 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1005, size: 64)
!1619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1620, file: !1566, line: 397)
!1620 = !DISubprogram(name: "powf", scope: !1570, file: !1570, line: 881, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1622, file: !1566, line: 400)
!1622 = !DISubprogram(name: "sinf", scope: !1570, file: !1570, line: 651, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1624, file: !1566, line: 402)
!1624 = !DISubprogram(name: "sinhf", scope: !1570, file: !1570, line: 672, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1626, file: !1566, line: 405)
!1626 = !DISubprogram(name: "sqrtf", scope: !1570, file: !1570, line: 888, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1628, file: !1566, line: 407)
!1628 = !DISubprogram(name: "tanf", scope: !1570, file: !1570, line: 657, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1630, file: !1566, line: 410)
!1630 = !DISubprogram(name: "tanhf", scope: !1570, file: !1570, line: 684, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1632, file: !1566, line: 413)
!1632 = !DISubprogram(name: "acoshf", scope: !1570, file: !1570, line: 693, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1634, file: !1566, line: 415)
!1634 = !DISubprogram(name: "asinhf", scope: !1570, file: !1570, line: 698, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1636, file: !1566, line: 417)
!1636 = !DISubprogram(name: "atanhf", scope: !1570, file: !1570, line: 703, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1638, file: !1566, line: 419)
!1638 = !DISubprogram(name: "cbrtf", scope: !1570, file: !1570, line: 869, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1640, file: !1566, line: 422)
!1640 = !DISubprogram(name: "copysignf", scope: !1570, file: !1570, line: 1055, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1642, file: !1566, line: 425)
!1642 = !DISubprogram(name: "erff", scope: !1570, file: !1570, line: 893, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1644, file: !1566, line: 427)
!1644 = !DISubprogram(name: "erfcf", scope: !1570, file: !1570, line: 898, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1646, file: !1566, line: 429)
!1646 = !DISubprogram(name: "exp2f", scope: !1570, file: !1570, line: 716, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1648, file: !1566, line: 431)
!1648 = !DISubprogram(name: "expm1f", scope: !1570, file: !1570, line: 722, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1650, file: !1566, line: 433)
!1650 = !DISubprogram(name: "fdimf", scope: !1570, file: !1570, line: 1101, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1652, file: !1566, line: 434)
!1652 = !DISubprogram(name: "fmaf", scope: !1570, file: !1570, line: 1122, type: !1653, flags: DIFlagPrototyped, spFlags: 0)
!1653 = !DISubroutineType(types: !1654)
!1654 = !{!1005, !1005, !1005, !1005}
!1655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1656, file: !1566, line: 437)
!1656 = !DISubprogram(name: "fmaxf", scope: !1570, file: !1570, line: 1111, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1658, file: !1566, line: 439)
!1658 = !DISubprogram(name: "fminf", scope: !1570, file: !1570, line: 1116, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1660, file: !1566, line: 441)
!1660 = !DISubprogram(name: "hypotf", scope: !1570, file: !1570, line: 874, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1662, file: !1566, line: 443)
!1662 = !DISubprogram(name: "ilogbf", scope: !1570, file: !1570, line: 736, type: !1663, flags: DIFlagPrototyped, spFlags: 0)
!1663 = !DISubroutineType(types: !1664)
!1664 = !{!152, !1005}
!1665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1666, file: !1566, line: 445)
!1666 = !DISubprogram(name: "lgammaf", scope: !1570, file: !1570, line: 903, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1668, file: !1566, line: 447)
!1668 = !DISubprogram(name: "llrintf", scope: !1570, file: !1570, line: 938, type: !1669, flags: DIFlagPrototyped, spFlags: 0)
!1669 = !DISubroutineType(types: !1670)
!1670 = !{!884, !1005}
!1671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1672, file: !1566, line: 449)
!1672 = !DISubprogram(name: "llroundf", scope: !1570, file: !1570, line: 1030, type: !1669, flags: DIFlagPrototyped, spFlags: 0)
!1673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1674, file: !1566, line: 451)
!1674 = !DISubprogram(name: "log1pf", scope: !1570, file: !1570, line: 756, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1676, file: !1566, line: 453)
!1676 = !DISubprogram(name: "log2f", scope: !1570, file: !1570, line: 761, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1678, file: !1566, line: 455)
!1678 = !DISubprogram(name: "logbf", scope: !1570, file: !1570, line: 766, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1680, file: !1566, line: 457)
!1680 = !DISubprogram(name: "lrintf", scope: !1570, file: !1570, line: 934, type: !1681, flags: DIFlagPrototyped, spFlags: 0)
!1681 = !DISubroutineType(types: !1682)
!1682 = !{!969, !1005}
!1683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1684, file: !1566, line: 459)
!1684 = !DISubprogram(name: "lroundf", scope: !1570, file: !1570, line: 1027, type: !1681, flags: DIFlagPrototyped, spFlags: 0)
!1685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1686, file: !1566, line: 461)
!1686 = !DISubprogram(name: "nan", scope: !1570, file: !1570, line: 1078, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1688, file: !1566, line: 462)
!1688 = !DISubprogram(name: "nanf", scope: !1570, file: !1570, line: 1079, type: !1689, flags: DIFlagPrototyped, spFlags: 0)
!1689 = !DISubroutineType(types: !1690)
!1690 = !{!1005, !72}
!1691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1692, file: !1566, line: 465)
!1692 = !DISubprogram(name: "nearbyintf", scope: !1570, file: !1570, line: 923, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1694, file: !1566, line: 467)
!1694 = !DISubprogram(name: "nextafterf", scope: !1570, file: !1570, line: 1090, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1696, file: !1566, line: 469)
!1696 = !DISubprogram(name: "nexttowardf", scope: !1570, file: !1570, line: 1095, type: !1697, flags: DIFlagPrototyped, spFlags: 0)
!1697 = !DISubroutineType(types: !1698)
!1698 = !{!1005, !1005, !895}
!1699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1700, file: !1566, line: 471)
!1700 = !DISubprogram(name: "remainderf", scope: !1570, file: !1570, line: 1045, type: !1584, flags: DIFlagPrototyped, spFlags: 0)
!1701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1702, file: !1566, line: 473)
!1702 = !DISubprogram(name: "remquof", scope: !1570, file: !1570, line: 1050, type: !1703, flags: DIFlagPrototyped, spFlags: 0)
!1703 = !DISubroutineType(types: !1704)
!1704 = !{!1005, !1005, !1005, !1604}
!1705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1706, file: !1566, line: 475)
!1706 = !DISubprogram(name: "rintf", scope: !1570, file: !1570, line: 929, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1708, file: !1566, line: 477)
!1708 = !DISubprogram(name: "roundf", scope: !1570, file: !1570, line: 1022, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1710, file: !1566, line: 479)
!1710 = !DISubprogram(name: "scalblnf", scope: !1570, file: !1570, line: 863, type: !1711, flags: DIFlagPrototyped, spFlags: 0)
!1711 = !DISubroutineType(types: !1712)
!1712 = !{!1005, !1005, !969}
!1713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1714, file: !1566, line: 481)
!1714 = !DISubprogram(name: "scalbnf", scope: !1570, file: !1570, line: 859, type: !1607, flags: DIFlagPrototyped, spFlags: 0)
!1715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1716, file: !1566, line: 483)
!1716 = !DISubprogram(name: "tgammaf", scope: !1570, file: !1570, line: 910, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1718, file: !1566, line: 485)
!1718 = !DISubprogram(name: "truncf", scope: !1570, file: !1570, line: 1036, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1720, file: !1566, line: 487)
!1720 = !DISubprogram(name: "acosl", scope: !1570, file: !1570, line: 663, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1722, file: !1566, line: 488)
!1722 = !DISubprogram(name: "asinl", scope: !1570, file: !1570, line: 660, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1724, file: !1566, line: 489)
!1724 = !DISubprogram(name: "atanl", scope: !1570, file: !1570, line: 666, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1726, file: !1566, line: 490)
!1726 = !DISubprogram(name: "atan2l", scope: !1570, file: !1570, line: 669, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1727 = !DISubroutineType(types: !1728)
!1728 = !{!895, !895, !895}
!1729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1730, file: !1566, line: 491)
!1730 = !DISubprogram(name: "ceill", scope: !1570, file: !1570, line: 915, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1732, file: !1566, line: 492)
!1732 = !DISubprogram(name: "cosl", scope: !1570, file: !1570, line: 655, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1734, file: !1566, line: 493)
!1734 = !DISubprogram(name: "coshl", scope: !1570, file: !1570, line: 682, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1736, file: !1566, line: 494)
!1736 = !DISubprogram(name: "expl", scope: !1570, file: !1570, line: 712, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1738, file: !1566, line: 495)
!1738 = !DISubprogram(name: "fabsl", scope: !1570, file: !1570, line: 191, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1740, file: !1566, line: 496)
!1740 = !DISubprogram(name: "floorl", scope: !1570, file: !1570, line: 919, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1742, file: !1566, line: 497)
!1742 = !DISubprogram(name: "fmodl", scope: !1570, file: !1570, line: 1041, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1744, file: !1566, line: 498)
!1744 = !DISubprogram(name: "frexpl", scope: !1570, file: !1570, line: 730, type: !1745, flags: DIFlagPrototyped, spFlags: 0)
!1745 = !DISubroutineType(types: !1746)
!1746 = !{!895, !895, !1604}
!1747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1748, file: !1566, line: 499)
!1748 = !DISubprogram(name: "ldexpl", scope: !1570, file: !1570, line: 744, type: !1749, flags: DIFlagPrototyped, spFlags: 0)
!1749 = !DISubroutineType(types: !1750)
!1750 = !{!895, !895, !152}
!1751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1752, file: !1566, line: 500)
!1752 = !DISubprogram(name: "logl", scope: !1570, file: !1570, line: 748, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1754, file: !1566, line: 501)
!1754 = !DISubprogram(name: "log10l", scope: !1570, file: !1570, line: 752, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1756, file: !1566, line: 502)
!1756 = !DISubprogram(name: "modfl", scope: !1570, file: !1570, line: 855, type: !1562, flags: DIFlagPrototyped, spFlags: 0)
!1757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1758, file: !1566, line: 503)
!1758 = !DISubprogram(name: "powl", scope: !1570, file: !1570, line: 885, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1760, file: !1566, line: 504)
!1760 = !DISubprogram(name: "sinl", scope: !1570, file: !1570, line: 652, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1762, file: !1566, line: 505)
!1762 = !DISubprogram(name: "sinhl", scope: !1570, file: !1570, line: 676, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1764, file: !1566, line: 506)
!1764 = !DISubprogram(name: "sqrtl", scope: !1570, file: !1570, line: 889, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1766, file: !1566, line: 507)
!1766 = !DISubprogram(name: "tanl", scope: !1570, file: !1570, line: 658, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1768, file: !1566, line: 509)
!1768 = !DISubprogram(name: "tanhl", scope: !1570, file: !1570, line: 688, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1770, file: !1566, line: 510)
!1770 = !DISubprogram(name: "acoshl", scope: !1570, file: !1570, line: 694, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1772, file: !1566, line: 511)
!1772 = !DISubprogram(name: "asinhl", scope: !1570, file: !1570, line: 699, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1774, file: !1566, line: 512)
!1774 = !DISubprogram(name: "atanhl", scope: !1570, file: !1570, line: 704, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1776, file: !1566, line: 513)
!1776 = !DISubprogram(name: "cbrtl", scope: !1570, file: !1570, line: 870, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1778, file: !1566, line: 515)
!1778 = !DISubprogram(name: "copysignl", scope: !1570, file: !1570, line: 1056, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1780, file: !1566, line: 517)
!1780 = !DISubprogram(name: "erfl", scope: !1570, file: !1570, line: 894, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1782, file: !1566, line: 518)
!1782 = !DISubprogram(name: "erfcl", scope: !1570, file: !1570, line: 899, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1784, file: !1566, line: 519)
!1784 = !DISubprogram(name: "exp2l", scope: !1570, file: !1570, line: 717, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1786, file: !1566, line: 520)
!1786 = !DISubprogram(name: "expm1l", scope: !1570, file: !1570, line: 723, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1788, file: !1566, line: 521)
!1788 = !DISubprogram(name: "fdiml", scope: !1570, file: !1570, line: 1102, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1790, file: !1566, line: 522)
!1790 = !DISubprogram(name: "fmal", scope: !1570, file: !1570, line: 1123, type: !1791, flags: DIFlagPrototyped, spFlags: 0)
!1791 = !DISubroutineType(types: !1792)
!1792 = !{!895, !895, !895, !895}
!1793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1794, file: !1566, line: 523)
!1794 = !DISubprogram(name: "fmaxl", scope: !1570, file: !1570, line: 1112, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1796, file: !1566, line: 524)
!1796 = !DISubprogram(name: "fminl", scope: !1570, file: !1570, line: 1117, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1798, file: !1566, line: 525)
!1798 = !DISubprogram(name: "hypotl", scope: !1570, file: !1570, line: 878, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1800, file: !1566, line: 526)
!1800 = !DISubprogram(name: "ilogbl", scope: !1570, file: !1570, line: 737, type: !1801, flags: DIFlagPrototyped, spFlags: 0)
!1801 = !DISubroutineType(types: !1802)
!1802 = !{!152, !895}
!1803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1804, file: !1566, line: 527)
!1804 = !DISubprogram(name: "lgammal", scope: !1570, file: !1570, line: 904, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1806, file: !1566, line: 528)
!1806 = !DISubprogram(name: "llrintl", scope: !1570, file: !1570, line: 939, type: !1807, flags: DIFlagPrototyped, spFlags: 0)
!1807 = !DISubroutineType(types: !1808)
!1808 = !{!884, !895}
!1809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1810, file: !1566, line: 529)
!1810 = !DISubprogram(name: "llroundl", scope: !1570, file: !1570, line: 1031, type: !1807, flags: DIFlagPrototyped, spFlags: 0)
!1811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1812, file: !1566, line: 530)
!1812 = !DISubprogram(name: "log1pl", scope: !1570, file: !1570, line: 757, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1814, file: !1566, line: 531)
!1814 = !DISubprogram(name: "log2l", scope: !1570, file: !1570, line: 762, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1816, file: !1566, line: 532)
!1816 = !DISubprogram(name: "logbl", scope: !1570, file: !1570, line: 767, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1818, file: !1566, line: 533)
!1818 = !DISubprogram(name: "lrintl", scope: !1570, file: !1570, line: 935, type: !1819, flags: DIFlagPrototyped, spFlags: 0)
!1819 = !DISubroutineType(types: !1820)
!1820 = !{!969, !895}
!1821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1822, file: !1566, line: 534)
!1822 = !DISubprogram(name: "lroundl", scope: !1570, file: !1570, line: 1028, type: !1819, flags: DIFlagPrototyped, spFlags: 0)
!1823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1824, file: !1566, line: 535)
!1824 = !DISubprogram(name: "nanl", scope: !1570, file: !1570, line: 1080, type: !1825, flags: DIFlagPrototyped, spFlags: 0)
!1825 = !DISubroutineType(types: !1826)
!1826 = !{!895, !72}
!1827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1828, file: !1566, line: 536)
!1828 = !DISubprogram(name: "nearbyintl", scope: !1570, file: !1570, line: 924, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1830, file: !1566, line: 537)
!1830 = !DISubprogram(name: "nextafterl", scope: !1570, file: !1570, line: 1091, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1832, file: !1566, line: 538)
!1832 = !DISubprogram(name: "nexttowardl", scope: !1570, file: !1570, line: 1096, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1834, file: !1566, line: 539)
!1834 = !DISubprogram(name: "remainderl", scope: !1570, file: !1570, line: 1046, type: !1727, flags: DIFlagPrototyped, spFlags: 0)
!1835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1836, file: !1566, line: 540)
!1836 = !DISubprogram(name: "remquol", scope: !1570, file: !1570, line: 1051, type: !1837, flags: DIFlagPrototyped, spFlags: 0)
!1837 = !DISubroutineType(types: !1838)
!1838 = !{!895, !895, !895, !1604}
!1839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1840, file: !1566, line: 541)
!1840 = !DISubprogram(name: "rintl", scope: !1570, file: !1570, line: 930, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1842, file: !1566, line: 542)
!1842 = !DISubprogram(name: "roundl", scope: !1570, file: !1570, line: 1023, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1844, file: !1566, line: 543)
!1844 = !DISubprogram(name: "scalblnl", scope: !1570, file: !1570, line: 864, type: !1845, flags: DIFlagPrototyped, spFlags: 0)
!1845 = !DISubroutineType(types: !1846)
!1846 = !{!895, !895, !969}
!1847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1848, file: !1566, line: 544)
!1848 = !DISubprogram(name: "scalbnl", scope: !1570, file: !1570, line: 860, type: !1749, flags: DIFlagPrototyped, spFlags: 0)
!1849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1850, file: !1566, line: 545)
!1850 = !DISubprogram(name: "tgammal", scope: !1570, file: !1570, line: 911, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1852, file: !1566, line: 546)
!1852 = !DISubprogram(name: "truncl", scope: !1570, file: !1570, line: 1037, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1227, file: !1854, line: 25)
!1854 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__std_mbstate_t.h", directory: "")
!1855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1241, file: !1856, line: 117)
!1856 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/cstdio", directory: "")
!1857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1858, file: !1856, line: 118)
!1858 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1859, line: 112, baseType: !884)
!1859 = !DIFile(filename: "C:/msys64/clang64/include/stdio.h", directory: "")
!1860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !54, file: !1856, line: 119)
!1861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1862, file: !1856, line: 121)
!1862 = !DISubprogram(name: "fclose", scope: !1859, file: !1859, line: 525, type: !1863, flags: DIFlagPrototyped, spFlags: 0)
!1863 = !DISubroutineType(types: !1864)
!1864 = !{!152, !1248}
!1865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1866, file: !1856, line: 122)
!1866 = !DISubprogram(name: "fflush", scope: !1859, file: !1859, line: 534, type: !1863, flags: DIFlagPrototyped, spFlags: 0)
!1867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1868, file: !1856, line: 123)
!1868 = !DISubprogram(name: "setbuf", scope: !1859, file: !1859, line: 631, type: !1869, flags: DIFlagPrototyped, spFlags: 0)
!1869 = !DISubroutineType(types: !1870)
!1870 = !{null, !1247, !1130}
!1871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1872, file: !1856, line: 124)
!1872 = !DISubprogram(name: "setvbuf", scope: !1859, file: !1859, line: 635, type: !1873, flags: DIFlagPrototyped, spFlags: 0)
!1873 = !DISubroutineType(types: !1874)
!1874 = !{!152, !1247, !1130, !152, !54}
!1875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1876, file: !1856, line: 125)
!1876 = !DISubprogram(name: "fprintf", scope: !1859, file: !1859, line: 418, type: !1877, flags: DIFlagPrototyped, spFlags: 0)
!1877 = !DISubroutineType(types: !1878)
!1878 = !{!152, !1247, !998, null}
!1879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1880, file: !1856, line: 126)
!1880 = !DISubprogram(name: "fscanf", scope: !1859, file: !1859, line: 433, type: !1877, flags: DIFlagPrototyped, spFlags: 0)
!1881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1882, file: !1856, line: 127)
!1882 = !DISubprogram(name: "snprintf", scope: !1859, file: !1859, line: 719, type: !1883, flags: DIFlagPrototyped, spFlags: 0)
!1883 = !DISubroutineType(types: !1884)
!1884 = !{!152, !1130, !54, !998, null}
!1885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1886, file: !1856, line: 128)
!1886 = !DISubprogram(name: "sprintf", scope: !1859, file: !1859, line: 422, type: !1887, flags: DIFlagPrototyped, spFlags: 0)
!1887 = !DISubroutineType(types: !1888)
!1888 = !{!152, !1130, !998, null}
!1889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1890, file: !1856, line: 129)
!1890 = !DISubprogram(name: "sscanf", scope: !1859, file: !1859, line: 439, type: !1891, flags: DIFlagPrototyped, spFlags: 0)
!1891 = !DISubroutineType(types: !1892)
!1892 = !{!152, !998, !998, null}
!1893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1894, file: !1856, line: 130)
!1894 = !DISubprogram(name: "vfprintf", scope: !1859, file: !1859, line: 425, type: !1895, flags: DIFlagPrototyped, spFlags: 0)
!1895 = !DISubroutineType(types: !1896)
!1896 = !{!152, !1247, !998, !1260}
!1897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1898, file: !1856, line: 131)
!1898 = !DISubprogram(name: "vfscanf", scope: !1859, file: !1859, line: 448, type: !1899, flags: DIFlagPrototyped, spFlags: 0)
!1899 = !DISubroutineType(types: !1900)
!1900 = !{!152, !1248, !72, !1263}
!1901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1902, file: !1856, line: 132)
!1902 = !DISubprogram(name: "vsscanf", scope: !1859, file: !1859, line: 451, type: !1903, flags: DIFlagPrototyped, spFlags: 0)
!1903 = !DISubroutineType(types: !1904)
!1904 = !{!152, !998, !998, !1263}
!1905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1906, file: !1856, line: 133)
!1906 = !DISubprogram(name: "vsnprintf", scope: !1859, file: !1859, line: 716, type: !1907, flags: DIFlagPrototyped, spFlags: 0)
!1907 = !DISubroutineType(types: !1908)
!1908 = !{!152, !1130, !54, !998, !1260}
!1909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1910, file: !1856, line: 134)
!1910 = !DISubprogram(name: "vsprintf", scope: !1859, file: !1859, line: 429, type: !1911, flags: DIFlagPrototyped, spFlags: 0)
!1911 = !DISubroutineType(types: !1912)
!1912 = !{!152, !1130, !998, !1260}
!1913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1914, file: !1856, line: 135)
!1914 = !DISubprogram(name: "fgetc", scope: !1859, file: !1859, line: 535, type: !1863, flags: DIFlagPrototyped, spFlags: 0)
!1915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1916, file: !1856, line: 136)
!1916 = !DISubprogram(name: "fgets", scope: !1859, file: !1859, line: 539, type: !1917, flags: DIFlagPrototyped, spFlags: 0)
!1917 = !DISubroutineType(types: !1918)
!1918 = !{!53, !1130, !152, !1247}
!1919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1920, file: !1856, line: 137)
!1920 = !DISubprogram(name: "fputc", scope: !1859, file: !1859, line: 548, type: !1921, flags: DIFlagPrototyped, spFlags: 0)
!1921 = !DISubroutineType(types: !1922)
!1922 = !{!152, !152, !1248}
!1923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1924, file: !1856, line: 138)
!1924 = !DISubprogram(name: "fputs", scope: !1859, file: !1859, line: 550, type: !1925, flags: DIFlagPrototyped, spFlags: 0)
!1925 = !DISubroutineType(types: !1926)
!1926 = !{!152, !998, !1247}
!1927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1928, file: !1856, line: 139)
!1928 = !DISubprogram(name: "getc", scope: !1859, file: !1859, line: 598, type: !1863, flags: DIFlagPrototyped, spFlags: 0)
!1929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1930, file: !1856, line: 140)
!1930 = !DISubprogram(name: "putc", scope: !1859, file: !1859, line: 616, type: !1921, flags: DIFlagPrototyped, spFlags: 0)
!1931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1932, file: !1856, line: 141)
!1932 = !DISubprogram(name: "ungetc", scope: !1859, file: !1859, line: 654, type: !1921, flags: DIFlagPrototyped, spFlags: 0)
!1933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1934, file: !1856, line: 142)
!1934 = !DISubprogram(name: "fread", scope: !1859, file: !1859, line: 551, type: !1935, flags: DIFlagPrototyped, spFlags: 0)
!1935 = !DISubroutineType(types: !1936)
!1936 = !{!54, !1479, !54, !54, !1247}
!1937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1938, file: !1856, line: 143)
!1938 = !DISubprogram(name: "fwrite", scope: !1859, file: !1859, line: 597, type: !1939, flags: DIFlagPrototyped, spFlags: 0)
!1939 = !DISubroutineType(types: !1940)
!1940 = !{!54, !1480, !54, !54, !1247}
!1941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1942, file: !1856, line: 144)
!1942 = !DISubprogram(name: "fgetpos", scope: !1859, file: !1859, line: 537, type: !1943, flags: DIFlagPrototyped, spFlags: 0)
!1943 = !DISubroutineType(types: !1944)
!1944 = !{!152, !1247, !1945}
!1945 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1946)
!1946 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1858, size: 64)
!1947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1948, file: !1856, line: 145)
!1948 = !DISubprogram(name: "fseek", scope: !1859, file: !1859, line: 555, type: !1949, flags: DIFlagPrototyped, spFlags: 0)
!1949 = !DISubroutineType(types: !1950)
!1950 = !{!152, !1248, !969, !152}
!1951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1952, file: !1856, line: 146)
!1952 = !DISubprogram(name: "fsetpos", scope: !1859, file: !1859, line: 553, type: !1953, flags: DIFlagPrototyped, spFlags: 0)
!1953 = !DISubroutineType(types: !1954)
!1954 = !{!152, !1248, !1955}
!1955 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1956, size: 64)
!1956 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1858)
!1957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1958, file: !1856, line: 147)
!1958 = !DISubprogram(name: "ftell", scope: !1859, file: !1859, line: 556, type: !1959, flags: DIFlagPrototyped, spFlags: 0)
!1959 = !DISubroutineType(types: !1960)
!1960 = !{!969, !1248}
!1961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1962, file: !1856, line: 148)
!1962 = !DISubprogram(name: "rewind", scope: !1859, file: !1859, line: 629, type: !1963, flags: DIFlagPrototyped, spFlags: 0)
!1963 = !DISubroutineType(types: !1964)
!1964 = !{null, !1248}
!1965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1966, file: !1856, line: 149)
!1966 = !DISubprogram(name: "clearerr", scope: !1859, file: !1859, line: 524, type: !1963, flags: DIFlagPrototyped, spFlags: 0)
!1967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1968, file: !1856, line: 150)
!1968 = !DISubprogram(name: "feof", scope: !1859, file: !1859, line: 532, type: !1863, flags: DIFlagPrototyped, spFlags: 0)
!1969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1970, file: !1856, line: 151)
!1970 = !DISubprogram(name: "ferror", scope: !1859, file: !1859, line: 533, type: !1863, flags: DIFlagPrototyped, spFlags: 0)
!1971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1972, file: !1856, line: 152)
!1972 = !DISubprogram(name: "perror", scope: !962, file: !962, line: 537, type: !1973, flags: DIFlagPrototyped, spFlags: 0)
!1973 = !DISubroutineType(types: !1974)
!1974 = !{null, !72}
!1975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1976, file: !1856, line: 154)
!1976 = !DISubprogram(name: "fopen", scope: !1859, file: !1859, line: 546, type: !1977, flags: DIFlagPrototyped, spFlags: 0)
!1977 = !DISubroutineType(types: !1978)
!1978 = !{!1248, !998, !998}
!1979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1980, file: !1856, line: 155)
!1980 = !DISubprogram(name: "freopen", scope: !1859, file: !1859, line: 552, type: !1981, flags: DIFlagPrototyped, spFlags: 0)
!1981 = !DISubroutineType(types: !1982)
!1982 = !{!1248, !998, !998, !1247}
!1983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1984, file: !1856, line: 156)
!1984 = !DISubprogram(name: "remove", scope: !1859, file: !1859, line: 622, type: !984, flags: DIFlagPrototyped, spFlags: 0)
!1985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1986, file: !1856, line: 157)
!1986 = !DISubprogram(name: "rename", scope: !1859, file: !1859, line: 623, type: !1503, flags: DIFlagPrototyped, spFlags: 0)
!1987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1988, file: !1856, line: 158)
!1988 = !DISubprogram(name: "tmpfile", scope: !1859, file: !1859, line: 652, type: !1989, flags: DIFlagPrototyped, spFlags: 0)
!1989 = !DISubroutineType(types: !1990)
!1990 = !{!1248}
!1991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1992, file: !1856, line: 159)
!1992 = !DISubprogram(name: "tmpnam", scope: !1859, file: !1859, line: 653, type: !1993, flags: DIFlagPrototyped, spFlags: 0)
!1993 = !DISubroutineType(types: !1994)
!1994 = !{!53, !53}
!1995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1996, file: !1856, line: 161)
!1996 = !DISubprogram(name: "getchar", scope: !1859, file: !1859, line: 599, type: !1029, flags: DIFlagPrototyped, spFlags: 0)
!1997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1998, file: !1856, line: 165)
!1998 = !DISubprogram(name: "scanf", scope: !1859, file: !1859, line: 436, type: !1999, flags: DIFlagPrototyped, spFlags: 0)
!1999 = !DISubroutineType(types: !2000)
!2000 = !{!152, !998, null}
!2001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2002, file: !1856, line: 166)
!2002 = !DISubprogram(name: "vscanf", scope: !1859, file: !1859, line: 453, type: !2003, flags: DIFlagPrototyped, spFlags: 0)
!2003 = !DISubroutineType(types: !2004)
!2004 = !{!152, !72, !1263}
!2005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2006, file: !1856, line: 168)
!2006 = !DISubprogram(name: "printf", scope: !1859, file: !1859, line: 420, type: !1999, flags: DIFlagPrototyped, spFlags: 0)
!2007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2008, file: !1856, line: 169)
!2008 = !DISubprogram(name: "putchar", scope: !1859, file: !1859, line: 617, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!2009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2010, file: !1856, line: 170)
!2010 = !DISubprogram(name: "puts", scope: !1859, file: !1859, line: 618, type: !984, flags: DIFlagPrototyped, spFlags: 0)
!2011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2012, file: !1856, line: 171)
!2012 = !DISubprogram(name: "vprintf", scope: !1859, file: !1859, line: 427, type: !2013, flags: DIFlagPrototyped, spFlags: 0)
!2013 = !DISubroutineType(types: !2014)
!2014 = !{!152, !998, !1260}
!2015 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2016, entity: !2017, file: !2019, line: 537)
!2016 = !DINamespace(name: "chrono", scope: !32)
!2017 = !DINamespace(name: "chrono_literals", scope: !2018, exportSymbols: true)
!2018 = !DINamespace(name: "literals", scope: !32, exportSymbols: true)
!2019 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__chrono/duration.h", directory: "")
!2020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2021, file: !2023, line: 65)
!2021 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !2022, line: 63, baseType: !969)
!2022 = !DIFile(filename: "C:/msys64/clang64/include/time.h", directory: "")
!2023 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/ctime", directory: "")
!2024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !54, file: !2023, line: 66)
!2025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2026, file: !2023, line: 67)
!2026 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !55, line: 138, baseType: !2027)
!2027 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time64_t", file: !55, line: 123, baseType: !884)
!2028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !1238, file: !2023, line: 68)
!2029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2030, file: !2023, line: 70)
!2030 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !2031, line: 101, size: 128, flags: DIFlagTypePassByValue, elements: !2032, identifier: "_ZTS8timespec")
!2031 = !DIFile(filename: "C:/msys64/clang64/include/sys/timeb.h", directory: "")
!2032 = !{!2033, !2034}
!2033 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2030, file: !2031, line: 102, baseType: !2026, size: 64)
!2034 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !2030, file: !2031, line: 103, baseType: !969, size: 32, offset: 64)
!2035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2036, file: !2023, line: 72)
!2036 = !DISubprogram(name: "clock", scope: !2022, file: !2022, line: 146, type: !2037, flags: DIFlagPrototyped, spFlags: 0)
!2037 = !DISubroutineType(types: !2038)
!2038 = !{!2021}
!2039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2040, file: !2023, line: 73)
!2040 = !DISubprogram(name: "difftime", linkageName: "_difftime64", scope: !2022, file: !2022, line: 249, type: !2041, flags: DIFlagPrototyped, spFlags: 0)
!2041 = !DISubroutineType(types: !2042)
!2042 = !{!981, !2026, !2026}
!2043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2044, file: !2023, line: 74)
!2044 = !DISubprogram(name: "mktime", linkageName: "_mktime64", scope: !2022, file: !2022, line: 256, type: !2045, flags: DIFlagPrototyped, spFlags: 0)
!2045 = !DISubroutineType(types: !2046)
!2046 = !{!2026, !2047}
!2047 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1238, size: 64)
!2048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2049, file: !2023, line: 75)
!2049 = !DISubprogram(name: "time", linkageName: "_time64", scope: !2022, file: !2022, line: 245, type: !2050, flags: DIFlagPrototyped, spFlags: 0)
!2050 = !DISubroutineType(types: !2051)
!2051 = !{!2026, !2052}
!2052 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2026, size: 64)
!2053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2054, file: !2023, line: 76)
!2054 = !DISubprogram(name: "asctime", scope: !2022, file: !2022, line: 142, type: !2055, flags: DIFlagPrototyped, spFlags: 0)
!2055 = !DISubroutineType(types: !2056)
!2056 = !{!53, !1410}
!2057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2058, file: !2023, line: 77)
!2058 = !DISubprogram(name: "ctime", linkageName: "_ctime64", scope: !2022, file: !2022, line: 254, type: !2059, flags: DIFlagPrototyped, spFlags: 0)
!2059 = !DISubroutineType(types: !2060)
!2060 = !{!53, !2061}
!2061 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2062, size: 64)
!2062 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2026)
!2063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2064, file: !2023, line: 78)
!2064 = !DISubprogram(name: "gmtime", linkageName: "_gmtime64", scope: !2022, file: !2022, line: 252, type: !2065, flags: DIFlagPrototyped, spFlags: 0)
!2065 = !DISubroutineType(types: !2066)
!2066 = !{!2047, !2061}
!2067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2068, file: !2023, line: 79)
!2068 = !DISubprogram(name: "localtime", linkageName: "_localtime64", scope: !2022, file: !2022, line: 250, type: !2065, flags: DIFlagPrototyped, spFlags: 0)
!2069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2070, file: !2023, line: 80)
!2070 = !DISubprogram(name: "strftime", scope: !2022, file: !2022, line: 152, type: !2071, flags: DIFlagPrototyped, spFlags: 0)
!2071 = !DISubroutineType(types: !2072)
!2072 = !{!54, !1130, !54, !998, !1409}
!2073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !2074, file: !2023, line: 82)
!2074 = !DISubprogram(name: "timespec_get", linkageName: "_timespec64_get", scope: !2022, file: !2022, line: 247, type: !2075, flags: DIFlagPrototyped, spFlags: 0)
!2075 = !DISubroutineType(types: !2076)
!2076 = !{!152, !2077, !152}
!2077 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2030, size: 64)
!2078 = !{i32 7, !"Dwarf Version", i32 4}
!2079 = !{i32 2, !"Debug Info Version", i32 3}
!2080 = !{i32 1, !"wchar_size", i32 2}
!2081 = !{i32 8, !"PIC Level", i32 2}
!2082 = !{i32 7, !"uwtable", i32 2}
!2083 = !{i32 1, !"MaxTLSAlign", i32 65536}
!2084 = !{!"clang version 18.1.8"}
!2085 = distinct !DISubprogram(name: "A", linkageName: "_ZN1AC2Ei", scope: !2086, file: !2, line: 5, type: !2097, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2096, retainedNodes: !132)
!2086 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "A", file: !2087, line: 11, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2088, vtableHolder: !2086)
!2087 = !DIFile(filename: "./Simple.hpp", directory: "C:/Users/alex/Documents/GitHub/debase/examples/Simple")
!2088 = !{!2089, !2092, !2096, !2099}
!2089 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$A", scope: !2087, file: !2087, baseType: !2090, size: 64, flags: DIFlagArtificial)
!2090 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2091, size: 64)
!2091 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !1029, size: 64)
!2092 = !DISubprogram(name: "A", scope: !2086, file: !2087, line: 12, type: !2093, scopeLine: 12, flags: DIFlagPrototyped, spFlags: 0)
!2093 = !DISubroutineType(types: !2094)
!2094 = !{null, !2095}
!2095 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2086, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2096 = !DISubprogram(name: "A", scope: !2086, file: !2087, line: 13, type: !2097, scopeLine: 13, flags: DIFlagPrototyped, spFlags: 0)
!2097 = !DISubroutineType(types: !2098)
!2098 = !{null, !2095, !152}
!2099 = !DISubprogram(name: "~A", scope: !2086, file: !2087, line: 14, type: !2093, scopeLine: 14, containingType: !2086, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!2100 = !DILocalVariable(name: "this", arg: 1, scope: !2085, type: !2101, flags: DIFlagArtificial | DIFlagObjectPointer)
!2101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2086, size: 64)
!2102 = !DILocation(line: 0, scope: !2085)
!2103 = !DILocalVariable(name: "V", arg: 2, scope: !2085, file: !2, line: 5, type: !152)
!2104 = !DILocation(line: 5, column: 19, scope: !2085)
!2105 = !DILocation(line: 5, column: 22, scope: !2085)
!2106 = !DILocation(line: 6, column: 2, scope: !2107)
!2107 = distinct !DILexicalBlock(scope: !2085, file: !2, line: 5, column: 22)
!2108 = !DILocation(line: 7, column: 3, scope: !2107)
!2109 = !DILocation(line: 8, column: 2, scope: !2107)
!2110 = !DILocation(line: 9, column: 1, scope: !2085)
!2111 = distinct !DISubprogram(name: "B", linkageName: "_ZN1BC2Ei", scope: !2112, file: !2, line: 11, type: !2121, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2120, retainedNodes: !132)
!2112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "B", file: !2087, line: 17, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2113, vtableHolder: !2086)
!2113 = !{!2114, !2115, !2116, !2120, !2123}
!2114 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2112, baseType: !2086, extraData: i32 0)
!2115 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !2112, file: !2087, line: 18, baseType: !152, size: 32, offset: 64)
!2116 = !DISubprogram(name: "B", scope: !2112, file: !2087, line: 19, type: !2117, scopeLine: 19, flags: DIFlagPrototyped, spFlags: 0)
!2117 = !DISubroutineType(types: !2118)
!2118 = !{null, !2119}
!2119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2112, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2120 = !DISubprogram(name: "B", scope: !2112, file: !2087, line: 20, type: !2121, scopeLine: 20, flags: DIFlagPrototyped, spFlags: 0)
!2121 = !DISubroutineType(types: !2122)
!2122 = !{null, !2119, !152}
!2123 = !DISubprogram(name: "~B", scope: !2112, file: !2087, line: 21, type: !2117, scopeLine: 21, containingType: !2112, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!2124 = !DILocalVariable(name: "this", arg: 1, scope: !2111, type: !2125, flags: DIFlagArtificial | DIFlagObjectPointer)
!2125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2112, size: 64)
!2126 = !DILocation(line: 0, scope: !2111)
!2127 = !DILocalVariable(name: "V", arg: 2, scope: !2111, file: !2, line: 11, type: !152)
!2128 = !DILocation(line: 11, column: 19, scope: !2111)
!2129 = !DILocation(line: 11, column: 26, scope: !2111)
!2130 = !DILocation(line: 11, column: 24, scope: !2111)
!2131 = !DILocation(line: 11, column: 35, scope: !2111)
!2132 = !DILocation(line: 11, column: 30, scope: !2111)
!2133 = !DILocation(line: 11, column: 32, scope: !2111)
!2134 = !DILocation(line: 12, column: 3, scope: !2135)
!2135 = distinct !DILexicalBlock(scope: !2111, file: !2, line: 11, column: 35)
!2136 = !DILocation(line: 13, column: 3, scope: !2135)
!2137 = !DILocation(line: 14, column: 2, scope: !2135)
!2138 = !DILocation(line: 15, column: 1, scope: !2111)
!2139 = !DILocation(line: 15, column: 1, scope: !2135)
!2140 = distinct !DISubprogram(name: "~A", linkageName: "_ZN1AD2Ev", scope: !2086, file: !2, line: 29, type: !2093, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2099, retainedNodes: !132)
!2141 = !DILocalVariable(name: "this", arg: 1, scope: !2140, type: !2101, flags: DIFlagArtificial | DIFlagObjectPointer)
!2142 = !DILocation(line: 0, scope: !2140)
!2143 = !DILocation(line: 29, column: 18, scope: !2140)
!2144 = !DILocation(line: 30, column: 2, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !2140, file: !2, line: 29, column: 18)
!2146 = !DILocation(line: 31, column: 3, scope: !2145)
!2147 = !DILocation(line: 32, column: 2, scope: !2145)
!2148 = !DILocation(line: 33, column: 1, scope: !2140)
!2149 = distinct !DISubprogram(name: "C", linkageName: "_ZN1CC2Ei", scope: !2150, file: !2, line: 17, type: !2173, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2172, retainedNodes: !132)
!2150 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "C", file: !2087, line: 30, size: 384, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2151, vtableHolder: !2086)
!2151 = !{!2152, !2153, !2165, !2168, !2172, !2175}
!2152 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2150, baseType: !2112, extraData: i32 0)
!2153 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2150, baseType: !2154, offset: 128, extraData: i32 0)
!2154 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "E", file: !2087, line: 24, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2155, vtableHolder: !2086)
!2155 = !{!2156, !2157, !2161, !2164}
!2156 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2154, baseType: !2086, extraData: i32 0)
!2157 = !DISubprogram(name: "E", scope: !2154, file: !2087, line: 25, type: !2158, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!2158 = !DISubroutineType(types: !2159)
!2159 = !{null, !2160}
!2160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2154, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2161 = !DISubprogram(name: "E", scope: !2154, file: !2087, line: 26, type: !2162, scopeLine: 26, flags: DIFlagPrototyped, spFlags: 0)
!2162 = !DISubroutineType(types: !2163)
!2163 = !{null, !2160, !152}
!2164 = !DISubprogram(name: "~E", scope: !2154, file: !2087, line: 27, type: !2158, scopeLine: 27, containingType: !2154, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!2165 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !2150, file: !2087, line: 31, baseType: !2166, size: 192, offset: 192)
!2166 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !32, file: !2167, line: 48, baseType: !95)
!2167 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__fwd/string.h", directory: "")
!2168 = !DISubprogram(name: "C", scope: !2150, file: !2087, line: 32, type: !2169, scopeLine: 32, flags: DIFlagPrototyped, spFlags: 0)
!2169 = !DISubroutineType(types: !2170)
!2170 = !{null, !2171}
!2171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2150, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2172 = !DISubprogram(name: "C", scope: !2150, file: !2087, line: 33, type: !2173, scopeLine: 33, flags: DIFlagPrototyped, spFlags: 0)
!2173 = !DISubroutineType(types: !2174)
!2174 = !{null, !2171, !152}
!2175 = !DISubprogram(name: "~C", scope: !2150, file: !2087, line: 34, type: !2169, scopeLine: 34, containingType: !2150, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!2176 = !DILocalVariable(name: "this", arg: 1, scope: !2149, type: !2177, flags: DIFlagArtificial | DIFlagObjectPointer)
!2177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2150, size: 64)
!2178 = !DILocation(line: 0, scope: !2149)
!2179 = !DILocalVariable(name: "V", arg: 2, scope: !2149, file: !2, line: 17, type: !152)
!2180 = !DILocation(line: 17, column: 19, scope: !2149)
!2181 = !DILocation(line: 17, column: 26, scope: !2149)
!2182 = !DILocation(line: 17, column: 24, scope: !2149)
!2183 = !DILocation(line: 17, column: 40, scope: !2149)
!2184 = !DILocation(line: 17, column: 13, scope: !2149)
!2185 = !DILocation(line: 17, column: 30, scope: !2149)
!2186 = !DILocation(line: 17, column: 32, scope: !2149)
!2187 = !DILocation(line: 18, column: 3, scope: !2188)
!2188 = distinct !DILexicalBlock(scope: !2149, file: !2, line: 17, column: 40)
!2189 = !DILocation(line: 19, column: 27, scope: !2188)
!2190 = !DILocation(line: 19, column: 29, scope: !2188)
!2191 = !DILocation(line: 19, column: 3, scope: !2188)
!2192 = !DILocation(line: 20, column: 2, scope: !2188)
!2193 = !DILocation(line: 21, column: 1, scope: !2149)
!2194 = !DILocation(line: 21, column: 1, scope: !2188)
!2195 = distinct !DISubprogram(name: "E", linkageName: "_ZN1EC2Ev", scope: !2154, file: !2087, line: 25, type: !2158, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2157, retainedNodes: !132)
!2196 = !DILocalVariable(name: "this", arg: 1, scope: !2195, type: !2197, flags: DIFlagArtificial | DIFlagObjectPointer)
!2197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2154, size: 64)
!2198 = !DILocation(line: 0, scope: !2195)
!2199 = !DILocation(line: 25, column: 3, scope: !2195)
!2200 = !DILocation(line: 25, column: 15, scope: !2195)
!2201 = distinct !DISubprogram(name: "basic_string", linkageName: "_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne180100Eyc", scope: !95, file: !94, line: 981, type: !242, scopeLine: 982, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !241, retainedNodes: !132)
!2202 = !DILocalVariable(name: "this", arg: 1, scope: !2201, type: !2203, flags: DIFlagArtificial | DIFlagObjectPointer)
!2203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!2204 = !DILocation(line: 0, scope: !2201)
!2205 = !DILocalVariable(name: "__n", arg: 2, scope: !2201, file: !94, line: 981, type: !99)
!2206 = !DILocation(line: 981, column: 78, scope: !2201)
!2207 = !DILocalVariable(name: "__c", arg: 3, scope: !2201, file: !94, line: 981, type: !5)
!2208 = !DILocation(line: 981, column: 90, scope: !2201)
!2209 = !DILocation(line: 982, column: 9, scope: !2201)
!2210 = !DILocation(line: 983, column: 12, scope: !2211)
!2211 = distinct !DILexicalBlock(scope: !2201, file: !94, line: 982, column: 58)
!2212 = !DILocation(line: 983, column: 17, scope: !2211)
!2213 = !DILocation(line: 983, column: 5, scope: !2211)
!2214 = !DILocation(line: 984, column: 3, scope: !2201)
!2215 = distinct !DISubprogram(name: "c_str", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne180100Ev", scope: !95, file: !94, line: 1595, type: !632, scopeLine: 1595, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !631, retainedNodes: !132)
!2216 = !DILocalVariable(name: "this", arg: 1, scope: !2215, type: !2217, flags: DIFlagArtificial | DIFlagObjectPointer)
!2217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!2218 = !DILocation(line: 0, scope: !2215)
!2219 = !DILocation(line: 1595, column: 106, scope: !2215)
!2220 = !DILocation(line: 1595, column: 99, scope: !2215)
!2221 = distinct !DISubprogram(name: "~E", linkageName: "_ZN1ED2Ev", scope: !2154, file: !2, line: 46, type: !2158, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2164, retainedNodes: !132)
!2222 = !DILocalVariable(name: "this", arg: 1, scope: !2221, type: !2197, flags: DIFlagArtificial | DIFlagObjectPointer)
!2223 = !DILocation(line: 0, scope: !2221)
!2224 = !DILocation(line: 46, column: 18, scope: !2221)
!2225 = !DILocation(line: 47, column: 3, scope: !2226)
!2226 = distinct !DILexicalBlock(scope: !2221, file: !2, line: 46, column: 18)
!2227 = !DILocation(line: 48, column: 3, scope: !2226)
!2228 = !DILocation(line: 49, column: 3, scope: !2226)
!2229 = !DILocation(line: 50, column: 1, scope: !2226)
!2230 = !DILocation(line: 50, column: 1, scope: !2221)
!2231 = distinct !DISubprogram(name: "~B", linkageName: "_ZN1BD2Ev", scope: !2112, file: !2, line: 35, type: !2117, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2123, retainedNodes: !132)
!2232 = !DILocalVariable(name: "this", arg: 1, scope: !2231, type: !2125, flags: DIFlagArtificial | DIFlagObjectPointer)
!2233 = !DILocation(line: 0, scope: !2231)
!2234 = !DILocation(line: 35, column: 18, scope: !2231)
!2235 = !DILocation(line: 36, column: 2, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2231, file: !2, line: 35, column: 18)
!2237 = !DILocation(line: 37, column: 3, scope: !2236)
!2238 = !DILocation(line: 38, column: 2, scope: !2236)
!2239 = !DILocation(line: 39, column: 1, scope: !2236)
!2240 = !DILocation(line: 39, column: 1, scope: !2231)
!2241 = distinct !DISubprogram(name: "E", linkageName: "_ZN1EC2Ei", scope: !2154, file: !2, line: 23, type: !2162, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2161, retainedNodes: !132)
!2242 = !DILocalVariable(name: "this", arg: 1, scope: !2241, type: !2197, flags: DIFlagArtificial | DIFlagObjectPointer)
!2243 = !DILocation(line: 0, scope: !2241)
!2244 = !DILocalVariable(name: "V", arg: 2, scope: !2241, file: !2, line: 23, type: !152)
!2245 = !DILocation(line: 23, column: 19, scope: !2241)
!2246 = !DILocation(line: 23, column: 26, scope: !2241)
!2247 = !DILocation(line: 23, column: 28, scope: !2241)
!2248 = !DILocation(line: 23, column: 24, scope: !2241)
!2249 = !DILocation(line: 23, column: 33, scope: !2241)
!2250 = !DILocation(line: 24, column: 3, scope: !2251)
!2251 = distinct !DILexicalBlock(scope: !2241, file: !2, line: 23, column: 33)
!2252 = !DILocation(line: 25, column: 27, scope: !2251)
!2253 = !DILocation(line: 25, column: 3, scope: !2251)
!2254 = !DILocation(line: 26, column: 2, scope: !2251)
!2255 = !DILocation(line: 27, column: 1, scope: !2241)
!2256 = !DILocation(line: 27, column: 1, scope: !2251)
!2257 = distinct !DISubprogram(name: "~A", linkageName: "_ZN1AD0Ev", scope: !2086, file: !2, line: 29, type: !2093, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2099, retainedNodes: !132)
!2258 = !DILocalVariable(name: "this", arg: 1, scope: !2257, type: !2101, flags: DIFlagArtificial | DIFlagObjectPointer)
!2259 = !DILocation(line: 0, scope: !2257)
!2260 = !DILocation(line: 29, column: 18, scope: !2257)
!2261 = !DILocation(line: 33, column: 1, scope: !2257)
!2262 = distinct !DISubprogram(name: "~B", linkageName: "_ZN1BD0Ev", scope: !2112, file: !2, line: 35, type: !2117, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2123, retainedNodes: !132)
!2263 = !DILocalVariable(name: "this", arg: 1, scope: !2262, type: !2125, flags: DIFlagArtificial | DIFlagObjectPointer)
!2264 = !DILocation(line: 0, scope: !2262)
!2265 = !DILocation(line: 35, column: 18, scope: !2262)
!2266 = !DILocation(line: 39, column: 1, scope: !2262)
!2267 = distinct !DISubprogram(name: "~C", linkageName: "_ZN1CD2Ev", scope: !2150, file: !2, line: 41, type: !2169, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2175, retainedNodes: !132)
!2268 = !DILocalVariable(name: "this", arg: 1, scope: !2267, type: !2177, flags: DIFlagArtificial | DIFlagObjectPointer)
!2269 = !DILocation(line: 0, scope: !2267)
!2270 = !DILocation(line: 41, column: 18, scope: !2267)
!2271 = !DILocation(line: 42, column: 3, scope: !2272)
!2272 = distinct !DILexicalBlock(scope: !2267, file: !2, line: 41, column: 18)
!2273 = !DILocation(line: 43, column: 3, scope: !2272)
!2274 = !DILocation(line: 44, column: 1, scope: !2272)
!2275 = !DILocation(line: 44, column: 1, scope: !2267)
!2276 = distinct !DISubprogram(linkageName: "_ZThn16_N1CD1Ev", scope: !2, file: !2, line: 41, type: !2277, flags: DIFlagArtificial | DIFlagThunk, spFlags: DISPFlagDefinition, unit: !28)
!2277 = !DISubroutineType(types: !132)
!2278 = !DILocation(line: 0, scope: !2276)
!2279 = distinct !DISubprogram(name: "~C", linkageName: "_ZN1CD0Ev", scope: !2150, file: !2, line: 41, type: !2169, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2175, retainedNodes: !132)
!2280 = !DILocalVariable(name: "this", arg: 1, scope: !2279, type: !2177, flags: DIFlagArtificial | DIFlagObjectPointer)
!2281 = !DILocation(line: 0, scope: !2279)
!2282 = !DILocation(line: 41, column: 18, scope: !2279)
!2283 = !DILocation(line: 44, column: 1, scope: !2279)
!2284 = distinct !DISubprogram(linkageName: "_ZThn16_N1CD0Ev", scope: !2, file: !2, line: 41, type: !2277, flags: DIFlagArtificial | DIFlagThunk, spFlags: DISPFlagDefinition, unit: !28)
!2285 = !DILocation(line: 0, scope: !2284)
!2286 = distinct !DISubprogram(name: "~E", linkageName: "_ZN1ED0Ev", scope: !2154, file: !2, line: 46, type: !2158, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2164, retainedNodes: !132)
!2287 = !DILocalVariable(name: "this", arg: 1, scope: !2286, type: !2197, flags: DIFlagArtificial | DIFlagObjectPointer)
!2288 = !DILocation(line: 0, scope: !2286)
!2289 = !DILocation(line: 46, column: 18, scope: !2286)
!2290 = !DILocation(line: 50, column: 1, scope: !2286)
!2291 = distinct !DISubprogram(name: "A", linkageName: "_ZN1AC2Ev", scope: !2086, file: !2087, line: 12, type: !2093, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2092, retainedNodes: !132)
!2292 = !DILocalVariable(name: "this", arg: 1, scope: !2291, type: !2101, flags: DIFlagArtificial | DIFlagObjectPointer)
!2293 = !DILocation(line: 0, scope: !2291)
!2294 = !DILocation(line: 12, column: 15, scope: !2291)
!2295 = distinct !DISubprogram(name: "__compressed_pair<std::__1::__default_init_tag, std::__1::__default_init_tag>", linkageName: "_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B8ne180100INS_18__default_init_tagESA_EEOT_OT0_", scope: !117, file: !90, line: 118, type: !2296, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, templateParams: !2300, declaration: !2299, retainedNodes: !132)
!2296 = !DISubroutineType(types: !2297)
!2297 = !{null, !159, !2298, !2298}
!2298 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !131, size: 64)
!2299 = !DISubprogram(name: "__compressed_pair<std::__1::__default_init_tag, std::__1::__default_init_tag>", scope: !117, file: !90, line: 118, type: !2296, scopeLine: 118, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !2300)
!2300 = !{!2301, !2302}
!2301 = !DITemplateTypeParameter(name: "_U1", type: !131)
!2302 = !DITemplateTypeParameter(name: "_U2", type: !131)
!2303 = !DILocalVariable(name: "this", arg: 1, scope: !2295, type: !178, flags: DIFlagArtificial | DIFlagObjectPointer)
!2304 = !DILocation(line: 0, scope: !2295)
!2305 = !DILocalVariable(name: "__t1", arg: 2, scope: !2295, file: !90, line: 118, type: !2298)
!2306 = !DILocation(line: 118, column: 76, scope: !2295)
!2307 = !DILocalVariable(name: "__t2", arg: 3, scope: !2295, file: !90, line: 118, type: !2298)
!2308 = !DILocation(line: 118, column: 88, scope: !2295)
!2309 = !DILocation(line: 119, column: 34, scope: !2295)
!2310 = !DILocation(line: 119, column: 9, scope: !2295)
!2311 = !DILocation(line: 119, column: 67, scope: !2295)
!2312 = !DILocation(line: 119, column: 42, scope: !2295)
!2313 = !DILocation(line: 119, column: 75, scope: !2295)
!2314 = distinct !DISubprogram(name: "__compressed_pair_elem", linkageName: "_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B8ne180100ENS_18__default_init_tagE", scope: !89, file: !90, line: 49, type: !856, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !855, retainedNodes: !132)
!2315 = !DILocalVariable(name: "this", arg: 1, scope: !2314, type: !177, flags: DIFlagArtificial | DIFlagObjectPointer)
!2316 = !DILocation(line: 0, scope: !2314)
!2317 = !DILocalVariable(arg: 2, scope: !2314, file: !90, line: 49, type: !131)
!2318 = !DILocation(line: 49, column: 93, scope: !2314)
!2319 = !DILocation(line: 49, column: 52, scope: !2314)
!2320 = !DILocation(line: 49, column: 96, scope: !2314)
!2321 = distinct !DISubprogram(name: "__compressed_pair_elem", linkageName: "_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B8ne180100ENS_18__default_init_tagE", scope: !121, file: !90, line: 78, type: !129, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !128, retainedNodes: !132)
!2322 = !DILocalVariable(name: "this", arg: 1, scope: !2321, type: !182, flags: DIFlagArtificial | DIFlagObjectPointer)
!2323 = !DILocation(line: 0, scope: !2321)
!2324 = !DILocalVariable(arg: 2, scope: !2321, file: !90, line: 78, type: !131)
!2325 = !DILocation(line: 78, column: 93, scope: !2321)
!2326 = !DILocation(line: 78, column: 52, scope: !2321)
!2327 = !DILocation(line: 78, column: 96, scope: !2321)
!2328 = distinct !DISubprogram(name: "allocator", linkageName: "_ZNSt3__19allocatorIcEC2B8ne180100Ev", scope: !43, file: !31, line: 114, type: !47, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !46, retainedNodes: !132)
!2329 = !DILocalVariable(name: "this", arg: 1, scope: !2328, type: !2330, flags: DIFlagArtificial | DIFlagObjectPointer)
!2330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!2331 = !DILocation(line: 0, scope: !2328)
!2332 = !DILocation(line: 114, column: 55, scope: !2328)
!2333 = !DILocation(line: 114, column: 85, scope: !2328)
!2334 = distinct !DISubprogram(name: "__non_trivial_if", linkageName: "_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne180100Ev", scope: !30, file: !31, line: 93, type: !36, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !35, retainedNodes: !132)
!2335 = !DILocalVariable(name: "this", arg: 1, scope: !2334, type: !2336, flags: DIFlagArtificial | DIFlagObjectPointer)
!2336 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!2337 = !DILocation(line: 0, scope: !2334)
!2338 = !DILocation(line: 93, column: 73, scope: !2334)
!2339 = distinct !DISubprogram(name: "data", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne180100Ev", scope: !95, file: !94, line: 1596, type: !632, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !634, retainedNodes: !132)
!2340 = !DILocalVariable(name: "this", arg: 1, scope: !2339, type: !2217, flags: DIFlagArtificial | DIFlagObjectPointer)
!2341 = !DILocation(line: 0, scope: !2339)
!2342 = !DILocation(line: 1597, column: 30, scope: !2339)
!2343 = !DILocation(line: 1597, column: 12, scope: !2339)
!2344 = !DILocation(line: 1597, column: 5, scope: !2339)
!2345 = distinct !DISubprogram(name: "__to_address<const char>", linkageName: "_ZNSt3__112__to_addressB8ne180100IKcEEPT_S3_", scope: !32, file: !2346, line: 180, type: !2347, scopeLine: 180, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, templateParams: !2349, retainedNodes: !132)
!2346 = !DIFile(filename: "C:/msys64/clang64/include/c++/v1/__memory/pointer_traits.h", directory: "")
!2347 = !DISubroutineType(types: !2348)
!2348 = !{!72, !72}
!2349 = !{!2350}
!2350 = !DITemplateTypeParameter(name: "_Tp", type: !4)
!2351 = !DILocalVariable(name: "__p", arg: 1, scope: !2345, file: !2346, line: 180, type: !72)
!2352 = !DILocation(line: 180, column: 64, scope: !2345)
!2353 = !DILocation(line: 182, column: 10, scope: !2345)
!2354 = !DILocation(line: 182, column: 3, scope: !2345)
!2355 = distinct !DISubprogram(name: "__get_pointer", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne180100Ev", scope: !95, file: !94, line: 1882, type: !722, scopeLine: 1882, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !727, retainedNodes: !132)
!2356 = !DILocalVariable(name: "this", arg: 1, scope: !2355, type: !2217, flags: DIFlagArtificial | DIFlagObjectPointer)
!2357 = !DILocation(line: 0, scope: !2355)
!2358 = !DILocation(line: 1883, column: 12, scope: !2355)
!2359 = !DILocation(line: 1883, column: 26, scope: !2355)
!2360 = !DILocation(line: 1883, column: 49, scope: !2355)
!2361 = !DILocation(line: 1883, column: 5, scope: !2355)
!2362 = distinct !DISubprogram(name: "__is_long", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne180100Ev", scope: !95, file: !94, line: 1769, type: !508, scopeLine: 1769, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !694, retainedNodes: !132)
!2363 = !DILocalVariable(name: "this", arg: 1, scope: !2362, type: !2217, flags: DIFlagArtificial | DIFlagObjectPointer)
!2364 = !DILocation(line: 0, scope: !2362)
!2365 = !DILocation(line: 1773, column: 12, scope: !2362)
!2366 = !DILocation(line: 1773, column: 17, scope: !2362)
!2367 = !DILocation(line: 1773, column: 25, scope: !2362)
!2368 = !DILocation(line: 1773, column: 29, scope: !2362)
!2369 = !DILocation(line: 1773, column: 5, scope: !2362)
!2370 = distinct !DISubprogram(name: "__get_long_pointer", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne180100Ev", scope: !95, file: !94, line: 1870, type: !722, scopeLine: 1870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !721, retainedNodes: !132)
!2371 = !DILocalVariable(name: "this", arg: 1, scope: !2370, type: !2217, flags: DIFlagArtificial | DIFlagObjectPointer)
!2372 = !DILocation(line: 0, scope: !2370)
!2373 = !DILocation(line: 1871, column: 12, scope: !2370)
!2374 = !DILocation(line: 1871, column: 17, scope: !2370)
!2375 = !DILocation(line: 1871, column: 25, scope: !2370)
!2376 = !DILocation(line: 1871, column: 29, scope: !2370)
!2377 = !DILocation(line: 1871, column: 5, scope: !2370)
!2378 = distinct !DISubprogram(name: "__get_short_pointer", linkageName: "_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne180100Ev", scope: !95, file: !94, line: 1876, type: !722, scopeLine: 1876, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !725, retainedNodes: !132)
!2379 = !DILocalVariable(name: "this", arg: 1, scope: !2378, type: !2217, flags: DIFlagArtificial | DIFlagObjectPointer)
!2380 = !DILocation(line: 0, scope: !2378)
!2381 = !DILocation(line: 1877, column: 54, scope: !2378)
!2382 = !DILocation(line: 1877, column: 59, scope: !2378)
!2383 = !DILocation(line: 1877, column: 67, scope: !2378)
!2384 = !DILocation(line: 1877, column: 71, scope: !2378)
!2385 = !DILocation(line: 1877, column: 12, scope: !2378)
!2386 = !DILocation(line: 1877, column: 5, scope: !2378)
!2387 = distinct !DISubprogram(name: "first", linkageName: "_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne180100Ev", scope: !117, file: !90, line: 133, type: !161, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !160, retainedNodes: !132)
!2388 = !DILocalVariable(name: "this", arg: 1, scope: !2387, type: !2389, flags: DIFlagArtificial | DIFlagObjectPointer)
!2389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!2390 = !DILocation(line: 0, scope: !2387)
!2391 = !DILocation(line: 134, column: 46, scope: !2387)
!2392 = !DILocation(line: 134, column: 5, scope: !2387)
!2393 = distinct !DISubprogram(name: "__get", linkageName: "_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne180100Ev", scope: !89, file: !90, line: 64, type: !866, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !865, retainedNodes: !132)
!2394 = !DILocalVariable(name: "this", arg: 1, scope: !2393, type: !2395, flags: DIFlagArtificial | DIFlagObjectPointer)
!2395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !869, size: 64)
!2396 = !DILocation(line: 0, scope: !2393)
!2397 = !DILocation(line: 64, column: 92, scope: !2393)
!2398 = !DILocation(line: 64, column: 85, scope: !2393)
!2399 = distinct !DISubprogram(name: "pointer_to", linkageName: "_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne180100ERS1_", scope: !2400, file: !2346, line: 161, type: !2403, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, declaration: !2402, retainedNodes: !132)
!2400 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pointer_traits<const char *>", scope: !32, file: !2346, line: 141, size: 8, flags: DIFlagTypePassByValue, elements: !2401, templateParams: !2406, identifier: "_ZTSNSt3__114pointer_traitsIPKcEE")
!2401 = !{!2402}
!2402 = !DISubprogram(name: "pointer_to", linkageName: "_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne180100ERS1_", scope: !2400, file: !2346, line: 161, type: !2403, scopeLine: 161, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2403 = !DISubroutineType(types: !2404)
!2404 = !{!2405, !74}
!2405 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !2400, file: !2346, line: 142, baseType: !72)
!2406 = !{!2407}
!2407 = !DITemplateTypeParameter(name: "_Ptr", type: !72)
!2408 = !DILocalVariable(name: "__r", arg: 1, scope: !2399, file: !2346, line: 161, type: !74)
!2409 = !DILocation(line: 161, column: 82, scope: !2399)
!2410 = !DILocation(line: 162, column: 27, scope: !2399)
!2411 = !DILocation(line: 162, column: 5, scope: !2399)
