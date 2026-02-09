; ModuleID = 'Simple.cpp'
; CommandLine = 'clang++ -I../../runtime -O0 -g -S -emit-llvm -Xclang -disable-llvm-passes Simple.cpp -o SimpleMSVC.ll'
source_filename = "Simple.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.34.31935"

%rtti.CompleteObjectLocator = type { i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor7 = type { ptr, ptr, [8 x i8] }
%rtti.ClassHierarchyDescriptor = type { i32, i32, i32, i32 }
%rtti.BaseClassDescriptor = type { i32, i32, i32, i32, i32, i32, i32 }
%"struct.std::_Fake_allocator" = type { i8 }
%rtti.TypeDescriptor30 = type { ptr, ptr, [31 x i8] }
%eh.CatchableType = type { i32, i32, i32, i32, i32, i32, i32 }
%rtti.TypeDescriptor19 = type { ptr, ptr, [20 x i8] }
%eh.CatchableTypeArray.3 = type { i32, [3 x i32] }
%eh.ThrowInfo = type { i32, i32, i32, i32 }
%struct.B = type { %struct.A, i32 }
%struct.A = type { ptr }
%struct.C = type { %struct.B, %struct.E, %"class.std::basic_string" }
%struct.E = type { %struct.A, %struct.B }
%"class.std::basic_string" = type { %"class.std::_Compressed_pair" }
%"class.std::_Compressed_pair" = type { %"class.std::_String_val" }
%"class.std::_String_val" = type { %"union.std::_String_val<std::_Simple_types<char>>::_Bxty", i64, i64 }
%"union.std::_String_val<std::_Simple_types<char>>::_Bxty" = type { ptr, [8 x i8] }
%"struct.std::_Zero_then_variadic_args_t" = type { i8 }
%"struct.std::_Fake_proxy_ptr_impl" = type { i8 }
%"class.std::bad_array_new_length" = type { %"class.std::bad_alloc" }
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { ptr, %struct.__std_exception_data }
%struct.__std_exception_data = type { ptr, i8 }

$printf = comdat any

$"??0E@@QEAA@XZ" = comdat any

$"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@_KD@Z" = comdat any

$"?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ" = comdat any

$"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ" = comdat any

$"??_GA@@UEAAPEAXI@Z" = comdat any

$"??_GB@@UEAAPEAXI@Z" = comdat any

$"??_GC@@UEAAPEAXI@Z" = comdat any

$"??_EC@@WBA@EAAPEAXI@Z" = comdat any

$"??_GE@@UEAAPEAXI@Z" = comdat any

$_vfprintf_l = comdat any

$__local_stdio_printf_options = comdat any

$"??0A@@QEAA@XZ" = comdat any

$"??0B@@QEAA@XZ" = comdat any

$"?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ" = comdat any

$"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ" = comdat any

$"?_Orphan_all@_Container_base0@std@@QEAAXXZ" = comdat any

$"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ" = comdat any

$"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ" = comdat any

$"??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z" = comdat any

$"?_Activate_SSO_buffer@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAXXZ" = comdat any

$"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z" = comdat any

$"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z" = comdat any

$"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ" = comdat any

$"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z" = comdat any

$"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z" = comdat any

$"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ" = comdat any

$"??$_Unfancy@D@std@@YAPEADPEAD@Z" = comdat any

$"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z" = comdat any

$"??$_Construct@$0A@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXD_K@Z" = comdat any

$"??0?$allocator@D@std@@QEAA@XZ" = comdat any

$"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ" = comdat any

$"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ" = comdat any

$"?_Xlen_string@std@@YAXXZ" = comdat any

$"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z" = comdat any

$"?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z" = comdat any

$"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ" = comdat any

$"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z" = comdat any

$"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z" = comdat any

$"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z" = comdat any

$"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z" = comdat any

$"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ" = comdat any

$"??$max@_K@std@@YAAEB_KAEB_K0@Z" = comdat any

$"??$min@_K@std@@YAAEB_KAEB_K0@Z" = comdat any

$"?max@?$numeric_limits@_J@std@@SA_JXZ" = comdat any

$"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ" = comdat any

$"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z" = comdat any

$"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z" = comdat any

$"??$_Get_size_of_n@$00@std@@YA_K_K@Z" = comdat any

$"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z" = comdat any

$"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z" = comdat any

$"?_Throw_bad_array_new_length@std@@YAXXZ" = comdat any

$"??0bad_array_new_length@std@@QEAA@XZ" = comdat any

$"??0bad_array_new_length@std@@QEAA@AEBV01@@Z" = comdat any

$"??0bad_alloc@std@@QEAA@AEBV01@@Z" = comdat any

$"??0exception@std@@QEAA@AEBV01@@Z" = comdat any

$"??1bad_array_new_length@std@@UEAA@XZ" = comdat any

$"??0bad_alloc@std@@AEAA@QEBD@Z" = comdat any

$"??_Gbad_array_new_length@std@@UEAAPEAXI@Z" = comdat any

$"?what@exception@std@@UEBAPEBDXZ" = comdat any

$"??0exception@std@@QEAA@QEBDH@Z" = comdat any

$"??_Gbad_alloc@std@@UEAAPEAXI@Z" = comdat any

$"??_Gexception@std@@UEAAPEAXI@Z" = comdat any

$"??1exception@std@@UEAA@XZ" = comdat any

$"??1bad_alloc@std@@UEAA@XZ" = comdat any

$"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z" = comdat any

$"??_7A@@6B@" = comdat largest

$"??_C@_03DOHDNLOG@A?$CB?6?$AA@" = comdat any

$"??_7B@@6B@" = comdat largest

$"??_C@_03CMMGHEAI@B?$CB?6?$AA@" = comdat any

$"??_7C@@6BB@@@" = comdat largest

$"??_7C@@6BE@@@" = comdat largest

$"??_C@_07DGNELIBA@C?$CI?$CFs?$CJ?$CB?6?$AA@" = comdat any

$"??_7E@@6B@" = comdat largest

$"??_C@_07NKOLDOLE@E?$CI?$CFi?$CJ?$CB?6?$AA@" = comdat any

$"??_C@_04JPPHKNEJ@?$HOA?$CB?6?$AA@" = comdat any

$"??_C@_04INECACKH@?$HOB?$CB?6?$AA@" = comdat any

$"??_C@_04DFPOGFMC@?$HOC?$CB?6?$AA@" = comdat any

$"??_C@_04BAJFDKBO@?$HOE?$CB?6?$AA@" = comdat any

$"??_R4A@@6B@" = comdat any

$"??_R0?AUA@@@8" = comdat any

$"??_R3A@@8" = comdat any

$"??_R2A@@8" = comdat any

$"??_R1A@?0A@EA@A@@8" = comdat any

$"??_R4B@@6B@" = comdat any

$"??_R0?AUB@@@8" = comdat any

$"??_R3B@@8" = comdat any

$"??_R2B@@8" = comdat any

$"??_R1A@?0A@EA@B@@8" = comdat any

$"??_R4C@@6BB@@@" = comdat any

$"??_R0?AUC@@@8" = comdat any

$"??_R3C@@8" = comdat any

$"??_R2C@@8" = comdat any

$"??_R1A@?0A@EA@C@@8" = comdat any

$"??_R1A@?0A@EC@A@@8" = comdat any

$"??_R1BA@?0A@EA@E@@8" = comdat any

$"??_R0?AUE@@@8" = comdat any

$"??_R3E@@8" = comdat any

$"??_R2E@@8" = comdat any

$"??_R1A@?0A@EA@E@@8" = comdat any

$"??_R1BA@?0A@EC@A@@8" = comdat any

$"??_R4C@@6BE@@@" = comdat any

$"??_R4E@@6B@" = comdat any

$"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" = comdat any

$"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@" = comdat any

$"??_R0?AVbad_array_new_length@std@@@8" = comdat any

$"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" = comdat any

$"??_R0?AVbad_alloc@std@@@8" = comdat any

$"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" = comdat any

$"??_R0?AVexception@std@@@8" = comdat any

$"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" = comdat any

$"_CTA3?AVbad_array_new_length@std@@" = comdat any

$"_TI3?AVbad_array_new_length@std@@" = comdat any

$"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@" = comdat any

$"??_7bad_array_new_length@std@@6B@" = comdat largest

$"??_R4bad_array_new_length@std@@6B@" = comdat any

$"??_R3bad_array_new_length@std@@8" = comdat any

$"??_R2bad_array_new_length@std@@8" = comdat any

$"??_R1A@?0A@EA@bad_array_new_length@std@@8" = comdat any

$"??_R1A@?0A@EA@bad_alloc@std@@8" = comdat any

$"??_R3bad_alloc@std@@8" = comdat any

$"??_R2bad_alloc@std@@8" = comdat any

$"??_R1A@?0A@EA@exception@std@@8" = comdat any

$"??_R3exception@std@@8" = comdat any

$"??_R2exception@std@@8" = comdat any

$"??_7bad_alloc@std@@6B@" = comdat largest

$"??_R4bad_alloc@std@@6B@" = comdat any

$"??_7exception@std@@6B@" = comdat largest

$"??_R4exception@std@@6B@" = comdat any

$"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@" = comdat any

@0 = private unnamed_addr constant { [2 x ptr] } { [2 x ptr] [ptr @"??_R4A@@6B@", ptr @"??_GA@@UEAAPEAXI@Z"] }, comdat($"??_7A@@6B@")
@"??_C@_03DOHDNLOG@A?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"A!\0A\00", comdat, align 1, !dbg !0
@1 = private unnamed_addr constant { [2 x ptr] } { [2 x ptr] [ptr @"??_R4B@@6B@", ptr @"??_GB@@UEAAPEAXI@Z"] }, comdat($"??_7B@@6B@")
@"??_C@_03CMMGHEAI@B?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [4 x i8] c"B!\0A\00", comdat, align 1, !dbg !8
@2 = private unnamed_addr constant { [2 x ptr] } { [2 x ptr] [ptr @"??_R4C@@6BB@@@", ptr @"??_GC@@UEAAPEAXI@Z"] }, comdat($"??_7C@@6BB@@@")
@3 = private unnamed_addr constant { [2 x ptr] } { [2 x ptr] [ptr @"??_R4C@@6BE@@@", ptr @"??_EC@@WBA@EAAPEAXI@Z"] }, comdat($"??_7C@@6BE@@@")
@"??_C@_07DGNELIBA@C?$CI?$CFs?$CJ?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"C(%s)!\0A\00", comdat, align 1, !dbg !10
@4 = private unnamed_addr constant { [2 x ptr] } { [2 x ptr] [ptr @"??_R4E@@6B@", ptr @"??_GE@@UEAAPEAXI@Z"] }, comdat($"??_7E@@6B@")
@"??_C@_07NKOLDOLE@E?$CI?$CFi?$CJ?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"E(%i)!\0A\00", comdat, align 1, !dbg !15
@"??_C@_04JPPHKNEJ@?$HOA?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"~A!\0A\00", comdat, align 1, !dbg !17
@"??_C@_04INECACKH@?$HOB?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"~B!\0A\00", comdat, align 1, !dbg !22
@"??_C@_04DFPOGFMC@?$HOC?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"~C!\0A\00", comdat, align 1, !dbg !24
@"??_C@_04BAJFDKBO@?$HOE?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"~E!\0A\00", comdat, align 1, !dbg !26
@"??_R4A@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUA@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4A@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_7type_info@@6B@" = external constant ptr
@"??_R0?AUA@@@8" = linkonce_odr global %rtti.TypeDescriptor7 { ptr @"??_7type_info@@6B@", ptr null, [8 x i8] c".?AUA@@\00" }, comdat
@__ImageBase = external dso_local constant i8
@"??_R3A@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 1, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2A@@8" = linkonce_odr constant [2 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@A@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUA@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R4B@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUB@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3B@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4B@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R0?AUB@@@8" = linkonce_odr global %rtti.TypeDescriptor7 { ptr @"??_7type_info@@6B@", ptr null, [8 x i8] c".?AUB@@\00" }, comdat
@"??_R3B@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2B@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2B@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@B@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@B@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUB@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3B@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R4C@@6BB@@@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUC@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3C@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4C@@6BB@@@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R0?AUC@@@8" = linkonce_odr global %rtti.TypeDescriptor7 { ptr @"??_7type_info@@6B@", ptr null, [8 x i8] c".?AUC@@\00" }, comdat
@"??_R3C@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 5, i32 5, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2C@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2C@@8" = linkonce_odr constant [6 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@C@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@B@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EC@A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1BA@?0A@EA@E@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1BA@?0A@EC@A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@C@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUC@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 4, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3C@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R1A@?0A@EC@A@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUA@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 0, i32 -1, i32 0, i32 66, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R1BA@?0A@EA@E@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUE@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 1, i32 16, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3E@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R0?AUE@@@8" = linkonce_odr global %rtti.TypeDescriptor7 { ptr @"??_7type_info@@6B@", ptr null, [8 x i8] c".?AUE@@\00" }, comdat
@"??_R3E@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2E@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2E@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@E@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@E@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUE@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3E@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R1BA@?0A@EC@A@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUA@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 16, i32 -1, i32 0, i32 66, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3A@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R4C@@6BE@@@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 16, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUC@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3C@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4C@@6BE@@@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R4E@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AUE@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3E@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4E@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" = linkonce_odr dso_local global i64 0, comdat, align 8, !dbg !28
@"?_Fake_alloc@std@@3U_Fake_allocator@1@B" = internal constant %"struct.std::_Fake_allocator" undef, align 1, !dbg !868
@"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@" = linkonce_odr dso_local unnamed_addr constant [16 x i8] c"string too long\00", comdat, align 1, !dbg !865
@"??_R0?AVbad_array_new_length@std@@@8" = linkonce_odr global %rtti.TypeDescriptor30 { ptr @"??_7type_info@@6B@", ptr null, [31 x i8] c".?AVbad_array_new_length@std@@\00" }, comdat
@"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AVbad_alloc@std@@@8" = linkonce_odr global %rtti.TypeDescriptor19 { ptr @"??_7type_info@@6B@", ptr null, [20 x i8] c".?AVbad_alloc@std@@\00" }, comdat
@"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 16, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0bad_alloc@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_R0?AVexception@std@@@8" = linkonce_odr global %rtti.TypeDescriptor19 { ptr @"??_7type_info@@6B@", ptr null, [20 x i8] c".?AVexception@std@@\00" }, comdat
@"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" = linkonce_odr unnamed_addr constant %eh.CatchableType { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 -1, i32 0, i32 24, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??0exception@std@@QEAA@AEBV01@@Z" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"_CTA3?AVbad_array_new_length@std@@" = linkonce_odr unnamed_addr constant %eh.CatchableTypeArray.3 { i32 3, [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVbad_array_new_length@std@@@8??0bad_array_new_length@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVbad_alloc@std@@@8??0bad_alloc@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CT??_R0?AVexception@std@@@8??0exception@std@@QEAA@AEBV01@@Z24" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32)] }, section ".xdata", comdat
@"_TI3?AVbad_array_new_length@std@@" = linkonce_odr unnamed_addr constant %eh.ThrowInfo { i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??1bad_array_new_length@std@@UEAA@XZ" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"_CTA3?AVbad_array_new_length@std@@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, section ".xdata", comdat
@"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@" = linkonce_odr dso_local unnamed_addr constant [21 x i8] c"bad array new length\00", comdat, align 1, !dbg !872
@5 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4bad_array_new_length@std@@6B@", ptr @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7bad_array_new_length@std@@6B@")
@"??_R4bad_array_new_length@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3bad_array_new_length@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4bad_array_new_length@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3bad_array_new_length@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 3, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2bad_array_new_length@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2bad_array_new_length@std@@8" = linkonce_odr constant [4 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@bad_array_new_length@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@bad_array_new_length@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_array_new_length@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 2, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3bad_array_new_length@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R1A@?0A@EA@bad_alloc@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3bad_alloc@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2bad_alloc@std@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@exception@std@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R3exception@std@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 1, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R2exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_R2exception@std@@8" = linkonce_odr constant [2 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R1A@?0A@EA@exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 0], comdat
@6 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4bad_alloc@std@@6B@", ptr @"??_Gbad_alloc@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7bad_alloc@std@@6B@")
@"??_R4bad_alloc@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVbad_alloc@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3bad_alloc@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4bad_alloc@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@7 = private unnamed_addr constant { [3 x ptr] } { [3 x ptr] [ptr @"??_R4exception@std@@6B@", ptr @"??_Gexception@std@@UEAAPEAXI@Z", ptr @"?what@exception@std@@UEBAPEBDXZ"] }, comdat($"??_7exception@std@@6B@")
@"??_R4exception@std@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R0?AVexception@std@@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R3exception@std@@8" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (ptr @"??_R4exception@std@@6B@" to i64), i64 ptrtoint (ptr @__ImageBase to i64)) to i32) }, comdat
@"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Unknown exception\00", comdat, align 1, !dbg !878

@"??_7A@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [2 x ptr] }, ptr @0, i32 0, i32 0, i32 1)
@"??_7B@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [2 x ptr] }, ptr @1, i32 0, i32 0, i32 1)
@"??_7C@@6BB@@@" = unnamed_addr alias ptr, getelementptr inbounds ({ [2 x ptr] }, ptr @2, i32 0, i32 0, i32 1)
@"??_7C@@6BE@@@" = unnamed_addr alias ptr, getelementptr inbounds ({ [2 x ptr] }, ptr @3, i32 0, i32 0, i32 1)
@"??_7E@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [2 x ptr] }, ptr @4, i32 0, i32 0, i32 1)
@"??_7bad_array_new_length@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @5, i32 0, i32 0, i32 1)
@"??_7bad_alloc@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @6, i32 0, i32 0, i32 1)
@"??_7exception@std@@6B@" = unnamed_addr alias ptr, getelementptr inbounds ({ [3 x ptr] }, ptr @7, i32 0, i32 0, i32 1)

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef ptr @"??0A@@QEAA@H@Z"(ptr noundef nonnull returned align 8 dereferenceable(8) %0, i32 noundef %1) unnamed_addr #0 align 2 !dbg !1687 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %1, ptr %3, align 4
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  store ptr @"??_7A@@6B@", ptr %5, align 8, !dbg !1703
  notail call preserve_mostcc void @__debase_mark_begin() #11, !dbg !1707
  %6 = call i32 (ptr, ...) @printf(ptr noundef @"??_C@_03DOHDNLOG@A?$CB?6?$AA@"), !dbg !1709
  notail call preserve_mostcc void @__debase_mark_end() #11, !dbg !1710
  ret ptr %5, !dbg !1711
}

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_begin() #1

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i32 @printf(ptr noundef %0, ...) #0 comdat !dbg !985 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
              call void @llvm.va_start.p0(ptr %4), !dbg !1718
  %5 = load ptr, ptr %4, align 8, !dbg !1719
  %6 = load ptr, ptr %2, align 8, !dbg !1719
  %7 = call ptr @__acrt_iob_func(i32 noundef 1), !dbg !1719
  %8 = call i32 @_vfprintf_l(ptr noundef %7, ptr noundef %6, ptr noundef null, ptr noundef %5), !dbg !1719
  store i32 %8, ptr %3, align 4, !dbg !1719
  call void @llvm.va_end.p0(ptr %4), !dbg !1720
  %9 = load i32, ptr %3, align 4, !dbg !1721
  ret i32 %9, !dbg !1721
}

; Function Attrs: nounwind
declare dso_local preserve_mostcc void @__debase_mark_end() #1

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef ptr @"??0B@@QEAA@H@Z"(ptr noundef nonnull returned align 8 dereferenceable(16) %0, i32 noundef %1) unnamed_addr #0 align 2 personality ptr @__CxxFrameHandler3 !dbg !1722 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %1, ptr %3, align 4
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  %6 = load i32, ptr %3, align 4, !dbg !1736
  %7 = call noundef ptr @"??0A@@QEAA@H@Z"(ptr noundef nonnull align 8 dereferenceable(8) %5, i32 noundef %6), !dbg !1736
  store ptr @"??_7B@@6B@", ptr %5, align 8, !dbg !1736
  %8 = getelementptr inbounds %struct.B, ptr %5, i32 0, i32 1, !dbg !1736
  %9 = load i32, ptr %3, align 4, !dbg !1736
  store i32 %9, ptr %8, align 8, !dbg !1736
  notail call preserve_mostcc void @__debase_mark_begin() #11, !dbg !1740
  %10 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_03CMMGHEAI@B?$CB?6?$AA@")
          to label %11 unwind label %12, !dbg !1742

11:                                               ; preds = %2
  notail call preserve_mostcc void @__debase_mark_end() #11, !dbg !1743
  ret ptr %5, !dbg !1744

12:                                               ; preds = %2
  %13 = cleanuppad within none [], !dbg !1745
  call void @"??1A@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %5) #11 [ "funclet"(token %13) ], !dbg !1745
  cleanupret from %13 unwind to caller, !dbg !1745
}

declare dso_local i32 @__CxxFrameHandler3(...)

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @"??1A@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #2 align 2 personality ptr @__CxxFrameHandler3 !dbg !1746 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  store ptr @"??_7A@@6B@", ptr %3, align 8, !dbg !1749
  notail call preserve_mostcc void @__debase_mark_begin() #11, !dbg !1750
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_04JPPHKNEJ@?$HOA?$CB?6?$AA@")
          to label %5 unwind label %6, !dbg !1752

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #11, !dbg !1753
  ret void, !dbg !1754

6:                                                ; preds = %1
  %7 = cleanuppad within none [], !dbg !1752
  call void @__std_terminate() #12 [ "funclet"(token %7) ], !dbg !1752
  unreachable, !dbg !1752
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef ptr @"??0C@@QEAA@H@Z"(ptr noundef nonnull returned align 8 dereferenceable(72) %0, i32 noundef %1) unnamed_addr #0 align 2 personality ptr @__CxxFrameHandler3 !dbg !1755 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %1, ptr %3, align 4
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  %6 = load i32, ptr %3, align 4, !dbg !1783
  %7 = call noundef ptr @"??0B@@QEAA@H@Z"(ptr noundef nonnull align 8 dereferenceable(16) %5, i32 noundef %6), !dbg !1783
  %8 = getelementptr inbounds i8, ptr %5, i64 16, !dbg !1783
  %9 = call noundef ptr @"??0E@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %8) #11, !dbg !1783
  store ptr @"??_7C@@6BB@@@", ptr %5, align 8, !dbg !1783
  %10 = getelementptr inbounds i8, ptr %5, i64 16, !dbg !1783
  store ptr @"??_7C@@6BE@@@", ptr %10, align 8, !dbg !1783
  %11 = getelementptr inbounds %struct.C, ptr %5, i32 0, i32 2, !dbg !1783
  %12 = load i32, ptr %3, align 4, !dbg !1783
  %13 = sext i32 %12 to i64, !dbg !1783
  %14 = invoke noundef ptr @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@_KD@Z"(ptr noundef nonnull align 8 dereferenceable(32) %11, i64 noundef %13, i8 noundef 120)
          to label %15 unwind label %22, !dbg !1783

15:                                               ; preds = %2
  notail call preserve_mostcc void @__debase_mark_begin() #11, !dbg !1787
  %16 = getelementptr inbounds %struct.C, ptr %5, i32 0, i32 2, !dbg !1789
  %17 = call noundef ptr @"?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ"(ptr noundef nonnull align 8 dereferenceable(32) %16) #11, !dbg !1789
  %18 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_07DGNELIBA@C?$CI?$CFs?$CJ?$CB?6?$AA@", ptr noundef %17)
          to label %19 unwind label %20, !dbg !1789

19:                                               ; preds = %15
  notail call preserve_mostcc void @__debase_mark_end() #11, !dbg !1790
  ret ptr %5, !dbg !1791

20:                                               ; preds = %15
  %21 = cleanuppad within none [], !dbg !1792
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %11) #11 [ "funclet"(token %21) ], !dbg !1792
  cleanupret from %21 unwind label %22, !dbg !1792

22:                                               ; preds = %20, %2
  %23 = cleanuppad within none [], !dbg !1792
  %24 = getelementptr inbounds i8, ptr %5, i64 16, !dbg !1792
  call void @"??1E@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %24) #11 [ "funclet"(token %23) ], !dbg !1792
  cleanupret from %23 unwind label %25, !dbg !1792

25:                                               ; preds = %22
  %26 = cleanuppad within none [], !dbg !1792
  call void @"??1B@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %5) #11 [ "funclet"(token %26) ], !dbg !1792
  cleanupret from %26 unwind to caller, !dbg !1792
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0E@@QEAA@XZ"(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 comdat align 2 !dbg !1793 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @"??0A@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %3) #11, !dbg !1797
  store ptr @"??_7E@@6B@", ptr %3, align 8, !dbg !1797
  %5 = getelementptr inbounds %struct.E, ptr %3, i32 0, i32 1, !dbg !1797
  %6 = call noundef ptr @"??0B@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %5) #11, !dbg !1797
  ret ptr %3, !dbg !1797
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@_KD@Z"(ptr noundef nonnull returned align 8 dereferenceable(32) %0, i64 noundef %1, i8 noundef %2) unnamed_addr #0 comdat align 2 personality ptr @__CxxFrameHandler3 !dbg !1798 {
  %4 = alloca i8, align 1
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"struct.std::_Zero_then_variadic_args_t", align 1
  store i8 %2, ptr %4, align 1
      store i64 %1, ptr %5, align 8
      store ptr %0, ptr %6, align 8
      %8 = load ptr, ptr %6, align 8
  %9 = getelementptr inbounds %"class.std::basic_string", ptr %8, i32 0, i32 0, !dbg !1805
  %10 = getelementptr inbounds %"struct.std::_Zero_then_variadic_args_t", ptr %7, i32 0, i32 0, !dbg !1805
  %11 = load i8, ptr %10, align 1, !dbg !1805
  %12 = call noundef ptr @"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z"(ptr noundef nonnull align 8 dereferenceable(32) %9, i8 %11) #11, !dbg !1805
  %13 = load i64, ptr %5, align 8, !dbg !1806
  %14 = load i8, ptr %4, align 1, !dbg !1806
  invoke void @"??$_Construct@$0A@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXD_K@Z"(ptr noundef nonnull align 8 dereferenceable(32) %8, i8 noundef %14, i64 noundef %13)
          to label %15 unwind label %16, !dbg !1806

15:                                               ; preds = %3
  ret ptr %8, !dbg !1808

16:                                               ; preds = %3
  %17 = cleanuppad within none [], !dbg !1809
  call void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %9) #11 [ "funclet"(token %17) ], !dbg !1809
  cleanupret from %17 unwind to caller, !dbg !1809
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !1810 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", ptr %3, i32 0, i32 0, !dbg !1814
  %5 = getelementptr inbounds %"class.std::_Compressed_pair", ptr %4, i32 0, i32 0, !dbg !1814
  %6 = call noundef ptr @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ"(ptr noundef nonnull align 8 dereferenceable(32) %5) #11, !dbg !1814
  ret ptr %6, !dbg !1814
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) unnamed_addr #2 comdat align 2 !dbg !1815 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  call void @"?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(32) %3) #11, !dbg !1818
  %4 = getelementptr inbounds %"class.std::basic_string", ptr %3, i32 0, i32 0, !dbg !1820
  call void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %4) #11, !dbg !1820
  ret void, !dbg !1821
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @"??1E@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 personality ptr @__CxxFrameHandler3 !dbg !1822 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  store ptr @"??_7E@@6B@", ptr %3, align 8, !dbg !1825
  notail call preserve_mostcc void @__debase_mark_begin() #11, !dbg !1826
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_04BAJFDKBO@?$HOE?$CB?6?$AA@")
          to label %5 unwind label %7, !dbg !1828

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #11, !dbg !1829
  %6 = getelementptr inbounds %struct.E, ptr %3, i32 0, i32 1, !dbg !1830
  call void @"??1B@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %6) #11, !dbg !1830
  call void @"??1A@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %3) #11, !dbg !1830
  ret void, !dbg !1831

7:                                                ; preds = %1
  %8 = cleanuppad within none [], !dbg !1828
  call void @__std_terminate() #12 [ "funclet"(token %8) ], !dbg !1828
  unreachable, !dbg !1828
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @"??1B@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 personality ptr @__CxxFrameHandler3 !dbg !1832 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  store ptr @"??_7B@@6B@", ptr %3, align 8, !dbg !1835
  notail call preserve_mostcc void @__debase_mark_begin() #11, !dbg !1836
  %4 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_04INECACKH@?$HOB?$CB?6?$AA@")
          to label %5 unwind label %6, !dbg !1838

5:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #11, !dbg !1839
  call void @"??1A@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %3) #11, !dbg !1840
  ret void, !dbg !1841

6:                                                ; preds = %1
  %7 = cleanuppad within none [], !dbg !1838
  call void @__std_terminate() #12 [ "funclet"(token %7) ], !dbg !1838
  unreachable, !dbg !1838
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef ptr @"??0E@@QEAA@H@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #0 align 2 personality ptr @__CxxFrameHandler3 !dbg !1842 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %1, ptr %3, align 4
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  %6 = load i32, ptr %3, align 4, !dbg !1844
  %7 = add nsw i32 %6, 1, !dbg !1844
  %8 = call noundef ptr @"??0A@@QEAA@H@Z"(ptr noundef nonnull align 8 dereferenceable(8) %5, i32 noundef %7), !dbg !1844
  store ptr @"??_7E@@6B@", ptr %5, align 8, !dbg !1844
  %9 = getelementptr inbounds %struct.E, ptr %5, i32 0, i32 1, !dbg !1844
  %10 = load i32, ptr %3, align 4, !dbg !1844
  %11 = invoke noundef ptr @"??0B@@QEAA@H@Z"(ptr noundef nonnull align 8 dereferenceable(16) %9, i32 noundef %10)
          to label %12 unwind label %18, !dbg !1844

12:                                               ; preds = %2
  notail call preserve_mostcc void @__debase_mark_begin() #11, !dbg !1847
  %13 = load i32, ptr %3, align 4, !dbg !1849
  %14 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_07NKOLDOLE@E?$CI?$CFi?$CJ?$CB?6?$AA@", i32 noundef %13)
          to label %15 unwind label %16, !dbg !1849

15:                                               ; preds = %12
  notail call preserve_mostcc void @__debase_mark_end() #11, !dbg !1850
  ret ptr %5, !dbg !1851

16:                                               ; preds = %12
  %17 = cleanuppad within none [], !dbg !1852
  call void @"??1B@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %9) #11 [ "funclet"(token %17) ], !dbg !1852
  cleanupret from %17 unwind label %18, !dbg !1852

18:                                               ; preds = %16, %2
  %19 = cleanuppad within none [], !dbg !1852
  call void @"??1A@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %5) #11 [ "funclet"(token %19) ], !dbg !1852
  cleanupret from %19 unwind to caller, !dbg !1852
}

declare dso_local void @__std_terminate()

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @"??1C@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(72) %0) unnamed_addr #2 align 2 personality ptr @__CxxFrameHandler3 !dbg !1853 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  store ptr @"??_7C@@6BB@@@", ptr %3, align 8, !dbg !1856
  %4 = getelementptr inbounds i8, ptr %3, i64 16, !dbg !1856
  store ptr @"??_7C@@6BE@@@", ptr %4, align 8, !dbg !1856
  %5 = invoke i32 (ptr, ...) @printf(ptr noundef @"??_C@_04DFPOGFMC@?$HOC?$CB?6?$AA@")
          to label %6 unwind label %9, !dbg !1857

6:                                                ; preds = %1
  notail call preserve_mostcc void @__debase_mark_end() #11, !dbg !1859
  %7 = getelementptr inbounds %struct.C, ptr %3, i32 0, i32 2, !dbg !1860
  call void @"??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %7) #11, !dbg !1860
  %8 = getelementptr inbounds i8, ptr %3, i64 16, !dbg !1860
  call void @"??1E@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %8) #11, !dbg !1860
  call void @"??1B@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %3) #11, !dbg !1860
  ret void, !dbg !1861

9:                                                ; preds = %1
  %10 = cleanuppad within none [], !dbg !1857
  call void @__std_terminate() #12 [ "funclet"(token %10) ], !dbg !1857
  unreachable, !dbg !1857
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_GA@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, i32 noundef %1) unnamed_addr #2 comdat align 2 !dbg !1862 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
      store ptr %0, ptr %5, align 8
      %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1A@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %6) #11, !dbg !1866
  %8 = icmp eq i32 %7, 0, !dbg !1866
  br i1 %8, label %10, label %9, !dbg !1866

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 8) #13, !dbg !1866
  br label %10, !dbg !1866

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !1868
  ret ptr %11, !dbg !1868
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_GB@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(16) %0, i32 noundef %1) unnamed_addr #2 comdat align 2 !dbg !1869 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
      store ptr %0, ptr %5, align 8
      %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1B@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %6) #11, !dbg !1873
  %8 = icmp eq i32 %7, 0, !dbg !1873
  br i1 %8, label %10, label %9, !dbg !1873

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 16) #13, !dbg !1873
  br label %10, !dbg !1873

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !1875
  ret ptr %11, !dbg !1875
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_GC@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(72) %0, i32 noundef %1) unnamed_addr #2 comdat align 2 !dbg !1876 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
      store ptr %0, ptr %5, align 8
      %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1C@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(72) %6) #11, !dbg !1880
  %8 = icmp eq i32 %7, 0, !dbg !1880
  br i1 %8, label %10, label %9, !dbg !1880

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 72) #13, !dbg !1880
  br label %10, !dbg !1880

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !1882
  ret ptr %11, !dbg !1882
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_EC@@WBA@EAAPEAXI@Z"(ptr noundef %0, i32 noundef %1) unnamed_addr #3 comdat align 2 !dbg !1883 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
  store ptr %0, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8, !dbg !1885
  store ptr %6, ptr %3, align 8, !dbg !1885
  %7 = load i32, ptr %4, align 4, !dbg !1885
  %8 = getelementptr i8, ptr %6, i32 -16, !dbg !1885
  %9 = tail call noundef ptr @"??_GC@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(72) %8, i32 noundef %7) #11, !dbg !1885
  ret ptr %9, !dbg !1885
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_GE@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #2 comdat align 2 !dbg !1886 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
      store ptr %0, ptr %5, align 8
      %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1E@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %6) #11, !dbg !1890
  %8 = icmp eq i32 %7, 0, !dbg !1890
  br i1 %8, label %10, label %9, !dbg !1890

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 24) #13, !dbg !1890
  br label %10, !dbg !1890

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !1892
  ret ptr %11, !dbg !1892
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #4

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i32 @_vfprintf_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat !dbg !1893 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
      store ptr %2, ptr %6, align 8
      store ptr %1, ptr %7, align 8
      store ptr %0, ptr %8, align 8
      %9 = load ptr, ptr %5, align 8, !dbg !1916
  %10 = load ptr, ptr %6, align 8, !dbg !1916
  %11 = load ptr, ptr %7, align 8, !dbg !1916
  %12 = load ptr, ptr %8, align 8, !dbg !1916
  %13 = call ptr @__local_stdio_printf_options(), !dbg !1916
  %14 = load i64, ptr %13, align 8, !dbg !1916
  %15 = call i32 @__stdio_common_vfprintf(i64 noundef %14, ptr noundef %12, ptr noundef %11, ptr noundef %10, ptr noundef %9), !dbg !1916
  ret i32 %15, !dbg !1916
}

declare dso_local ptr @__acrt_iob_func(i32 noundef) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #4

declare dso_local i32 @__stdio_common_vfprintf(i64 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local ptr @__local_stdio_printf_options() #2 comdat !dbg !30 {
  ret ptr @"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA", !dbg !1917
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0A@@QEAA@XZ"(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #2 comdat align 2 !dbg !1918 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  store ptr @"??_7A@@6B@", ptr %3, align 8, !dbg !1921
  ret ptr %3, !dbg !1921
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0B@@QEAA@XZ"(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 comdat align 2 !dbg !1922 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @"??0A@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(8) %3) #11, !dbg !1925
  store ptr @"??_7B@@6B@", ptr %3, align 8, !dbg !1925
  %5 = getelementptr inbounds %struct.B, ptr %3, i32 0, i32 1, !dbg !1925
  store i32 0, ptr %5, align 8, !dbg !1925
  ret ptr %3, !dbg !1925
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 personality ptr @__CxxFrameHandler3 !dbg !1926 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  store ptr %0, ptr %2, align 8
      %7 = load ptr, ptr %2, align 8
      %8 = getelementptr inbounds %"class.std::basic_string", ptr %7, i32 0, i32 0, !dbg !1931
  %9 = getelementptr inbounds %"class.std::_Compressed_pair", ptr %8, i32 0, i32 0, !dbg !1931
  store ptr %9, ptr %3, align 8, !dbg !1931
  %10 = load ptr, ptr %3, align 8, !dbg !1932
  call void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(ptr noundef nonnull align 1 dereferenceable(1) %10) #11, !dbg !1932
  %11 = load ptr, ptr %3, align 8, !dbg !1933
  %12 = call noundef zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(ptr noundef nonnull align 8 dereferenceable(32) %11) #11, !dbg !1933
  br i1 %12, label %13, label %28, !dbg !1933

13:                                               ; preds = %1
      %14 = load ptr, ptr %3, align 8, !dbg !1938
  %15 = getelementptr inbounds %"class.std::_String_val", ptr %14, i32 0, i32 0, !dbg !1938
  %16 = load ptr, ptr %15, align 8, !dbg !1938
  store ptr %16, ptr %4, align 8, !dbg !1938
      %17 = call noundef nonnull align 1 dereferenceable(1) ptr @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %7) #11, !dbg !1940
  store ptr %17, ptr %5, align 8, !dbg !1940
  %18 = load ptr, ptr %3, align 8, !dbg !1941
  %19 = getelementptr inbounds %"class.std::_String_val", ptr %18, i32 0, i32 0, !dbg !1941
  call void @"??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z"(ptr noundef nonnull align 8 dereferenceable(8) %19) #11, !dbg !1941
  %20 = load ptr, ptr %3, align 8, !dbg !1942
  call void @"?_Activate_SSO_buffer@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(32) %20) #11, !dbg !1942
  %21 = load ptr, ptr %5, align 8, !dbg !1943
  %22 = load ptr, ptr %3, align 8, !dbg !1943
  %23 = getelementptr inbounds %"class.std::_String_val", ptr %22, i32 0, i32 2, !dbg !1943
  %24 = load i64, ptr %23, align 8, !dbg !1943
  %25 = add i64 %24, 1, !dbg !1943
  %26 = load ptr, ptr %4, align 8, !dbg !1943
  invoke void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(ptr noundef nonnull align 1 dereferenceable(1) %21, ptr noundef %26, i64 noundef %25)
          to label %27 unwind label %36, !dbg !1943

27:                                               ; preds = %13
  br label %28, !dbg !1944

28:                                               ; preds = %27, %1
  %29 = load ptr, ptr %3, align 8, !dbg !1945
  %30 = getelementptr inbounds %"class.std::_String_val", ptr %29, i32 0, i32 1, !dbg !1945
  store i64 0, ptr %30, align 8, !dbg !1945
  %31 = load ptr, ptr %3, align 8, !dbg !1946
  %32 = getelementptr inbounds %"class.std::_String_val", ptr %31, i32 0, i32 2, !dbg !1946
  store i64 15, ptr %32, align 8, !dbg !1946
  store i8 0, ptr %6, align 1, !dbg !1947
  %33 = load ptr, ptr %3, align 8, !dbg !1947
  %34 = getelementptr inbounds %"class.std::_String_val", ptr %33, i32 0, i32 0, !dbg !1947
  %35 = getelementptr inbounds [16 x i8], ptr %34, i64 0, i64 0, !dbg !1947
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(ptr noundef nonnull align 1 dereferenceable(1) %35, ptr noundef nonnull align 1 dereferenceable(1) %6) #11, !dbg !1947
  ret void, !dbg !1948

36:                                               ; preds = %13
  %37 = cleanuppad within none [], !dbg !1943
  call void @__std_terminate() #12 [ "funclet"(token %37) ], !dbg !1943
  unreachable, !dbg !1943
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) unnamed_addr #2 comdat align 2 !dbg !1949 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::_Compressed_pair", ptr %3, i32 0, i32 0, !dbg !1956
  call void @"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %4) #11, !dbg !1956
  ret void, !dbg !1958
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"?_Orphan_all@_Container_base0@std@@QEAAXXZ"(ptr noundef nonnull align 1 dereferenceable(1) %0) #2 comdat align 2 !dbg !1959 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  ret void, !dbg !1962
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !1963 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", ptr %3, i32 0, i32 2, !dbg !1967
  %5 = load i64, ptr %4, align 8, !dbg !1967
  %6 = icmp ule i64 16, %5, !dbg !1967
  ret i1 %6, !dbg !1967
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !1968 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", ptr %3, i32 0, i32 0, !dbg !1971
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %4) #11, !dbg !1971
  ret ptr %5, !dbg !1971
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0) #2 comdat !dbg !1972 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8, !dbg !1980
  ret void, !dbg !1983
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"?_Activate_SSO_buffer@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAXXZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !1984 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  ret void, !dbg !1988
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z"(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #2 comdat align 2 !dbg !1989 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i64 %2, ptr %4, align 8
      store ptr %1, ptr %5, align 8
      store ptr %0, ptr %6, align 8
      %7 = load ptr, ptr %6, align 8
  %8 = load i64, ptr %4, align 8, !dbg !1996
  %9 = mul i64 1, %8, !dbg !1996
  %10 = load ptr, ptr %5, align 8, !dbg !1996
  call void @"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z"(ptr noundef %10, i64 noundef %9) #11, !dbg !1996
  ret void, !dbg !1997
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) #2 comdat align 2 !dbg !1998 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %3, align 8, !dbg !2002
  %6 = load i8, ptr %5, align 1, !dbg !2002
  %7 = load ptr, ptr %4, align 8, !dbg !2002
  store i8 %6, ptr %7, align 1, !dbg !2002
  ret void, !dbg !2003
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !2004 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  ret ptr %3, !dbg !2007
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z"(ptr noundef %0, i64 noundef %1) #2 comdat personality ptr @__CxxFrameHandler3 !dbg !2008 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store i64 %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load i64, ptr %3, align 8, !dbg !2017
  %6 = icmp uge i64 %5, 4096, !dbg !2017
  br i1 %6, label %7, label %9, !dbg !2017

7:                                                ; preds = %2
  invoke void @"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z"(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(8) %3)
          to label %8 unwind label %12, !dbg !2019

8:                                                ; preds = %7
  br label %9, !dbg !2022

9:                                                ; preds = %8, %2
  %10 = load i64, ptr %3, align 8, !dbg !2023
  %11 = load ptr, ptr %4, align 8, !dbg !2023
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %11, i64 noundef %10) #11, !dbg !2023
  ret void, !dbg !2024

12:                                               ; preds = %7
  %13 = cleanuppad within none [], !dbg !2019
  call void @__std_terminate() #12 [ "funclet"(token %13) ], !dbg !2019
  unreachable, !dbg !2019
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @"?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #0 comdat !dbg !2025 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %9 = load ptr, ptr %3, align 8, !dbg !2033
  %10 = load i64, ptr %9, align 8, !dbg !2033
  %11 = add i64 %10, 39, !dbg !2033
  store i64 %11, ptr %9, align 8, !dbg !2033
      %12 = load ptr, ptr %4, align 8, !dbg !2038
  %13 = load ptr, ptr %12, align 8, !dbg !2038
  store ptr %13, ptr %5, align 8, !dbg !2038
      %14 = load ptr, ptr %5, align 8, !dbg !2040
  %15 = getelementptr inbounds i64, ptr %14, i64 -1, !dbg !2040
  %16 = load i64, ptr %15, align 8, !dbg !2040
  store i64 %16, ptr %6, align 8, !dbg !2040
      store i64 8, ptr %7, align 8, !dbg !2042
      %17 = load ptr, ptr %4, align 8, !dbg !2044
  %18 = load ptr, ptr %17, align 8, !dbg !2044
  %19 = ptrtoint ptr %18 to i64, !dbg !2044
  %20 = load i64, ptr %6, align 8, !dbg !2044
  %21 = sub i64 %19, %20, !dbg !2044
  store i64 %21, ptr %8, align 8, !dbg !2044
  br label %22, !dbg !2045

22:                                               ; preds = %2
  %23 = load i64, ptr %8, align 8, !dbg !2046
  %24 = icmp uge i64 %23, 8, !dbg !2046
  br i1 %24, label %25, label %29, !dbg !2046

25:                                               ; preds = %22
  %26 = load i64, ptr %8, align 8, !dbg !2046
  %27 = icmp ule i64 %26, 39, !dbg !2046
  br i1 %27, label %28, label %29, !dbg !2046

28:                                               ; preds = %25
  br label %32, !dbg !2048

29:                                               ; preds = %25, %22
  br label %30, !dbg !2051

30:                                               ; preds = %29
  call void @_invalid_parameter_noinfo_noreturn() #14, !dbg !2053
  unreachable, !dbg !2053

31:                                               ; No predecessors!
  br label %32, !dbg !2051

32:                                               ; preds = %31, %28
  br label %33, !dbg !2046

33:                                               ; preds = %32
  %34 = load i64, ptr %6, align 8, !dbg !2055
  %35 = inttoptr i64 %34 to ptr, !dbg !2055
  %36 = load ptr, ptr %4, align 8, !dbg !2055
  store ptr %35, ptr %36, align 8, !dbg !2055
  ret void, !dbg !2056
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @"??3@YAXPEAX_K@Z"(ptr noundef, i64 noundef) #6

; Function Attrs: noreturn
declare dso_local void @_invalid_parameter_noinfo_noreturn() #7

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) unnamed_addr #2 comdat align 2 !dbg !2057 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", ptr %3, i32 0, i32 0, !dbg !2061
  call void @"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %4) #11, !dbg !2061
  ret void, !dbg !2063
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #2 comdat align 2 !dbg !2064 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  ret void, !dbg !2068
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !2069 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %4 = load ptr, ptr %2, align 8
      %5 = getelementptr inbounds %"class.std::_String_val", ptr %4, i32 0, i32 0, !dbg !2073
  %6 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0, !dbg !2073
  store ptr %6, ptr %3, align 8, !dbg !2073
  %7 = call noundef zeroext i1 @"?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ"(ptr noundef nonnull align 8 dereferenceable(32) %4) #11, !dbg !2074
  br i1 %7, label %8, label %12, !dbg !2074

8:                                                ; preds = %1
  %9 = getelementptr inbounds %"class.std::_String_val", ptr %4, i32 0, i32 0, !dbg !2075
  %10 = load ptr, ptr %9, align 8, !dbg !2075
  %11 = call noundef ptr @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(ptr noundef %10) #11, !dbg !2075
  store ptr %11, ptr %3, align 8, !dbg !2075
  br label %12, !dbg !2078

12:                                               ; preds = %8, %1
  %13 = load ptr, ptr %3, align 8, !dbg !2079
  ret ptr %13, !dbg !2079
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(ptr noundef %0) #2 comdat !dbg !2080 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8, !dbg !2084
  ret ptr %3, !dbg !2084
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z"(ptr noundef nonnull returned align 8 dereferenceable(32) %0, i8 %1) unnamed_addr #2 comdat align 2 !dbg !2085 {
  %3 = alloca %"struct.std::_Zero_then_variadic_args_t", align 1
  %4 = alloca ptr, align 8
  %5 = getelementptr inbounds %"struct.std::_Zero_then_variadic_args_t", ptr %3, i32 0, i32 0
  store i8 %1, ptr %5, align 1
      store ptr %0, ptr %4, align 8
      %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @"??0?$allocator@D@std@@QEAA@XZ"(ptr noundef nonnull align 1 dereferenceable(1) %6) #11, !dbg !2095
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", ptr %6, i32 0, i32 0, !dbg !2095
  %9 = call noundef ptr @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %8) #11, !dbg !2095
  ret ptr %6, !dbg !2095
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @"??$_Construct@$0A@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXD_K@Z"(ptr noundef nonnull align 8 dereferenceable(32) %0, i8 noundef %1, i64 noundef %2) #0 comdat align 2 !dbg !2096 {
  %4 = alloca i64, align 8
  %5 = alloca i8, align 1
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %"struct.std::_Fake_proxy_ptr_impl", align 1
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  store i64 %2, ptr %4, align 8
      store i8 %1, ptr %5, align 1
      store ptr %0, ptr %6, align 8
      %14 = load ptr, ptr %6, align 8
      %15 = getelementptr inbounds %"class.std::basic_string", ptr %14, i32 0, i32 0, !dbg !2109
  %16 = getelementptr inbounds %"class.std::_Compressed_pair", ptr %15, i32 0, i32 0, !dbg !2109
  store ptr %16, ptr %7, align 8, !dbg !2109
  %17 = load i64, ptr %4, align 8, !dbg !2110
  %18 = call noundef i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(ptr noundef nonnull align 8 dereferenceable(32) %14) #11, !dbg !2110
  %19 = icmp ugt i64 %17, %18, !dbg !2110
  br i1 %19, label %20, label %21, !dbg !2110

20:                                               ; preds = %3
  call void @"?_Xlen_string@std@@YAXXZ"() #14, !dbg !2111
  unreachable, !dbg !2111

21:                                               ; preds = %3
      %22 = call noundef nonnull align 1 dereferenceable(1) ptr @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %14) #11, !dbg !2115
  store ptr %22, ptr %8, align 8, !dbg !2115
      store ptr @"?_Fake_alloc@std@@3U_Fake_allocator@1@B", ptr %9, align 8, !dbg !2117
      %23 = load ptr, ptr %7, align 8, !dbg !2120
  %24 = call noundef ptr @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(ptr noundef nonnull align 1 dereferenceable(1) %10, ptr noundef nonnull align 1 dereferenceable(1) @"?_Fake_alloc@std@@3U_Fake_allocator@1@B", ptr noundef nonnull align 1 dereferenceable(1) %23) #11, !dbg !2120
  %25 = load i64, ptr %4, align 8, !dbg !2121
  %26 = icmp ult i64 %25, 16, !dbg !2121
  br i1 %26, label %27, label %39, !dbg !2121

27:                                               ; preds = %21
  %28 = load i64, ptr %4, align 8, !dbg !2122
  %29 = load ptr, ptr %7, align 8, !dbg !2122
  %30 = getelementptr inbounds %"class.std::_String_val", ptr %29, i32 0, i32 1, !dbg !2122
  store i64 %28, ptr %30, align 8, !dbg !2122
  %31 = load ptr, ptr %7, align 8, !dbg !2125
  %32 = getelementptr inbounds %"class.std::_String_val", ptr %31, i32 0, i32 2, !dbg !2125
  store i64 15, ptr %32, align 8, !dbg !2125
  %33 = load i8, ptr %5, align 1, !dbg !2126
  %34 = load i64, ptr %4, align 8, !dbg !2126
  %35 = load ptr, ptr %7, align 8, !dbg !2126
  %36 = getelementptr inbounds %"class.std::_String_val", ptr %35, i32 0, i32 0, !dbg !2126
  %37 = getelementptr inbounds [16 x i8], ptr %36, i64 0, i64 0, !dbg !2126
  %38 = call noundef ptr @"?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z"(ptr noundef %37, i64 noundef %34, i8 noundef %33) #11, !dbg !2126
  call void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(ptr noundef nonnull align 1 dereferenceable(1) %10) #11, !dbg !2129
  br label %65, !dbg !2130

39:                                               ; preds = %21
  %40 = load ptr, ptr %7, align 8, !dbg !2131
  %41 = getelementptr inbounds %"class.std::_String_val", ptr %40, i32 0, i32 2, !dbg !2131
  store i64 15, ptr %41, align 8, !dbg !2131
      %42 = load i64, ptr %4, align 8, !dbg !2133
  %43 = call noundef i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z"(ptr noundef nonnull align 8 dereferenceable(32) %14, i64 noundef %42) #11, !dbg !2133
  store i64 %43, ptr %11, align 8, !dbg !2133
      %44 = load ptr, ptr %8, align 8, !dbg !2135
  %45 = load i64, ptr %11, align 8, !dbg !2135
  %46 = add i64 %45, 1, !dbg !2135
  %47 = call noundef ptr @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(ptr noundef nonnull align 1 dereferenceable(1) %44, i64 noundef %46), !dbg !2135, !heapallocsite !5
  store ptr %47, ptr %12, align 8, !dbg !2135
  %48 = load ptr, ptr %7, align 8, !dbg !2136
  %49 = getelementptr inbounds %"class.std::_String_val", ptr %48, i32 0, i32 0, !dbg !2136
  call void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(ptr noundef nonnull align 8 dereferenceable(8) %49, ptr noundef nonnull align 8 dereferenceable(8) %12) #11, !dbg !2136
  %50 = load i64, ptr %4, align 8, !dbg !2137
  %51 = load ptr, ptr %7, align 8, !dbg !2137
  %52 = getelementptr inbounds %"class.std::_String_val", ptr %51, i32 0, i32 1, !dbg !2137
  store i64 %50, ptr %52, align 8, !dbg !2137
  %53 = load i64, ptr %11, align 8, !dbg !2138
  %54 = load ptr, ptr %7, align 8, !dbg !2138
  %55 = getelementptr inbounds %"class.std::_String_val", ptr %54, i32 0, i32 2, !dbg !2138
  store i64 %53, ptr %55, align 8, !dbg !2138
  %56 = load i8, ptr %5, align 1, !dbg !2139
  %57 = load i64, ptr %4, align 8, !dbg !2139
  %58 = load ptr, ptr %12, align 8, !dbg !2139
  %59 = call noundef ptr @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(ptr noundef %58) #11, !dbg !2139
  %60 = call noundef ptr @"?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z"(ptr noundef %59, i64 noundef %57, i8 noundef %56) #11, !dbg !2139
  store i8 0, ptr %13, align 1, !dbg !2142
  %61 = load ptr, ptr %12, align 8, !dbg !2142
  %62 = call noundef ptr @"??$_Unfancy@D@std@@YAPEADPEAD@Z"(ptr noundef %61) #11, !dbg !2142
  %63 = load i64, ptr %4, align 8, !dbg !2142
  %64 = getelementptr inbounds i8, ptr %62, i64 %63, !dbg !2142
  call void @"?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z"(ptr noundef nonnull align 1 dereferenceable(1) %64, ptr noundef nonnull align 1 dereferenceable(1) %13) #11, !dbg !2142
  call void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(ptr noundef nonnull align 1 dereferenceable(1) %10) #11, !dbg !2143
  br label %65, !dbg !2144

65:                                               ; preds = %39, %27
  ret void, !dbg !2144
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0?$allocator@D@std@@QEAA@XZ"(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 comdat align 2 !dbg !2145 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  ret ptr %3, !dbg !2148
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull returned align 8 dereferenceable(32) %0) unnamed_addr #2 comdat align 2 !dbg !2149 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::_String_val", ptr %3, i32 0, i32 0, !dbg !2152
  %5 = call noundef ptr @"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(16) %4) #11, !dbg !2152
  %6 = getelementptr inbounds %"class.std::_String_val", ptr %3, i32 0, i32 1, !dbg !2152
  store i64 0, ptr %6, align 8, !dbg !2152
  %7 = getelementptr inbounds %"class.std::_String_val", ptr %3, i32 0, i32 2, !dbg !2152
  store i64 0, ptr %7, align 8, !dbg !2152
  ret ptr %3, !dbg !2152
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ"(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 comdat align 2 !dbg !2153 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %3, i8 0, i64 16, i1 false), !dbg !2156
  ret ptr %3, !dbg !2156
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #8

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !2157 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
      %8 = load ptr, ptr %2, align 8
      %9 = call noundef nonnull align 1 dereferenceable(1) ptr @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %8) #11, !dbg !2161
  %10 = call noundef i64 @"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z"(ptr noundef nonnull align 1 dereferenceable(1) %9) #11, !dbg !2161
  store i64 %10, ptr %3, align 8, !dbg !2161
      store i64 16, ptr %5, align 8, !dbg !2163
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %5) #11, !dbg !2163
  %12 = load i64, ptr %11, align 8, !dbg !2163
  store i64 %12, ptr %4, align 8, !dbg !2163
  %13 = load i64, ptr %4, align 8, !dbg !2164
  %14 = sub i64 %13, 1, !dbg !2164
  store i64 %14, ptr %6, align 8, !dbg !2164
  %15 = call noundef i64 @"?max@?$numeric_limits@_J@std@@SA_JXZ"() #11, !dbg !2164
  store i64 %15, ptr %7, align 8, !dbg !2164
  %16 = call noundef nonnull align 8 dereferenceable(8) ptr @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull align 8 dereferenceable(8) %6) #11, !dbg !2164
  %17 = load i64, ptr %16, align 8, !dbg !2164
  ret i64 %17, !dbg !2164
}

; Function Attrs: mustprogress noinline noreturn optnone uwtable
define linkonce_odr dso_local void @"?_Xlen_string@std@@YAXXZ"() #9 comdat !dbg !2165 {
  call void @"?_Xlength_error@std@@YAXPEBD@Z"(ptr noundef @"??_C@_0BA@JFNIOLAK@string?5too?5long?$AA@") #14, !dbg !2166
  unreachable, !dbg !2166
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z"(ptr noundef nonnull returned align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #2 comdat align 2 !dbg !2167 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
      store ptr %1, ptr %5, align 8
      store ptr %0, ptr %6, align 8
      %7 = load ptr, ptr %6, align 8
  ret ptr %7, !dbg !2169
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z"(ptr noundef %0, i64 noundef %1, i8 noundef %2) #2 comdat align 2 !dbg !2174 {
  %4 = alloca i8, align 1
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store i8 %2, ptr %4, align 1
      store i64 %1, ptr %5, align 8
      store ptr %0, ptr %6, align 8
      %7 = load ptr, ptr %6, align 8, !dbg !2179
  %8 = load i8, ptr %4, align 1, !dbg !2179
  %9 = sext i8 %8 to i32, !dbg !2179
  %10 = trunc i32 %9 to i8, !dbg !2179
  %11 = load i64, ptr %5, align 8, !dbg !2179
  call void @llvm.memset.p0.i64(ptr align 1 %7, i8 %10, i64 %11, i1 false), !dbg !2179
  ret ptr %7, !dbg !2179
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ"(ptr noundef nonnull align 1 dereferenceable(1) %0) #2 comdat align 2 !dbg !2180 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  ret void, !dbg !2183
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z"(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %1) #2 comdat align 2 !dbg !2184 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store i64 %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  %6 = call noundef i64 @"?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ"(ptr noundef nonnull align 8 dereferenceable(32) %5) #11, !dbg !2189
  %7 = getelementptr inbounds %"class.std::basic_string", ptr %5, i32 0, i32 0, !dbg !2189
  %8 = getelementptr inbounds %"class.std::_Compressed_pair", ptr %7, i32 0, i32 0, !dbg !2189
  %9 = getelementptr inbounds %"class.std::_String_val", ptr %8, i32 0, i32 2, !dbg !2189
  %10 = load i64, ptr %9, align 8, !dbg !2189
  %11 = load i64, ptr %3, align 8, !dbg !2189
  %12 = call noundef i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z"(i64 noundef %11, i64 noundef %10, i64 noundef %6) #11, !dbg !2189
  ret i64 %12, !dbg !2189
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef ptr @"?allocate@?$allocator@D@std@@QEAAPEAD_K@Z"(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) #0 comdat align 2 !dbg !2190 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store i64 %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  %6 = load i64, ptr %3, align 8, !dbg !2195
  %7 = call noundef i64 @"??$_Get_size_of_n@$00@std@@YA_K_K@Z"(i64 noundef %6), !dbg !2195
  %8 = call noundef ptr @"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z"(i64 noundef %7), !dbg !2195, !heapallocsite !5
  ret ptr %8, !dbg !2195
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 comdat !dbg !2196 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8, !dbg !2207
  %6 = call noundef ptr @"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z"(ptr noundef %5) #11, !dbg !2207
  %7 = load ptr, ptr %3, align 8, !dbg !2207
  %8 = load ptr, ptr %7, align 8, !dbg !2207
  store ptr %8, ptr %6, align 8, !dbg !2207
  ret void, !dbg !2209
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @"?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z"(ptr noundef nonnull align 1 dereferenceable(1) %0) #2 comdat align 2 !dbg !2210 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      ret i64 -1, !dbg !2213
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @"?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !2214 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::basic_string", ptr %3, i32 0, i32 0, !dbg !2217
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %4) #11, !dbg !2217
  ret ptr %5, !dbg !2217
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 comdat !dbg !2218 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8, !dbg !2229
  %6 = load i64, ptr %5, align 8, !dbg !2229
  %7 = load ptr, ptr %3, align 8, !dbg !2229
  %8 = load i64, ptr %7, align 8, !dbg !2229
  %9 = icmp ult i64 %6, %8, !dbg !2229
  br i1 %9, label %10, label %12, !dbg !2229

10:                                               ; preds = %2
  %11 = load ptr, ptr %3, align 8, !dbg !2229
  br label %14, !dbg !2229

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8, !dbg !2229
  br label %14, !dbg !2229

14:                                               ; preds = %12, %10
  %15 = phi ptr [ %11, %10 ], [ %13, %12 ], !dbg !2229
  ret ptr %15, !dbg !2229
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @"??$min@_K@std@@YAAEB_KAEB_K0@Z"(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 comdat !dbg !2230 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %3, align 8, !dbg !2234
  %6 = load i64, ptr %5, align 8, !dbg !2234
  %7 = load ptr, ptr %4, align 8, !dbg !2234
  %8 = load i64, ptr %7, align 8, !dbg !2234
  %9 = icmp ult i64 %6, %8, !dbg !2234
  br i1 %9, label %10, label %12, !dbg !2234

10:                                               ; preds = %2
  %11 = load ptr, ptr %3, align 8, !dbg !2234
  br label %14, !dbg !2234

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8, !dbg !2234
  br label %14, !dbg !2234

14:                                               ; preds = %12, %10
  %15 = phi ptr [ %11, %10 ], [ %13, %12 ], !dbg !2234
  ret ptr %15, !dbg !2234
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @"?max@?$numeric_limits@_J@std@@SA_JXZ"() #2 comdat align 2 !dbg !2235 {
  ret i64 9223372036854775807, !dbg !2290
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @"?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ"(ptr noundef nonnull align 8 dereferenceable(32) %0) #2 comdat align 2 !dbg !2291 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  ret ptr %3, !dbg !2295
}

; Function Attrs: noreturn
declare dso_local void @"?_Xlength_error@std@@YAXPEBD@Z"(ptr noundef) #7

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @"?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z"(i64 noundef %0, i64 noundef %1, i64 noundef %2) #2 comdat align 2 !dbg !2296 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store i64 %2, ptr %5, align 8
      store i64 %1, ptr %6, align 8
      store i64 %0, ptr %7, align 8
          %10 = load i64, ptr %7, align 8, !dbg !2302
  %11 = or i64 %10, 15, !dbg !2302
  store i64 %11, ptr %8, align 8, !dbg !2302
  %12 = load i64, ptr %8, align 8, !dbg !2303
  %13 = load i64, ptr %5, align 8, !dbg !2303
  %14 = icmp ugt i64 %12, %13, !dbg !2303
  br i1 %14, label %15, label %17, !dbg !2303

15:                                               ; preds = %3
  %16 = load i64, ptr %5, align 8, !dbg !2304
  store i64 %16, ptr %4, align 8, !dbg !2304
  br label %33, !dbg !2304

17:                                               ; preds = %3
  %18 = load i64, ptr %6, align 8, !dbg !2307
  %19 = load i64, ptr %5, align 8, !dbg !2307
  %20 = load i64, ptr %6, align 8, !dbg !2307
  %21 = udiv i64 %20, 2, !dbg !2307
  %22 = sub i64 %19, %21, !dbg !2307
  %23 = icmp ugt i64 %18, %22, !dbg !2307
  br i1 %23, label %24, label %26, !dbg !2307

24:                                               ; preds = %17
  %25 = load i64, ptr %5, align 8, !dbg !2308
  store i64 %25, ptr %4, align 8, !dbg !2308
  br label %33, !dbg !2308

26:                                               ; preds = %17
  %27 = load i64, ptr %6, align 8, !dbg !2311
  %28 = load i64, ptr %6, align 8, !dbg !2311
  %29 = udiv i64 %28, 2, !dbg !2311
  %30 = add i64 %27, %29, !dbg !2311
  store i64 %30, ptr %9, align 8, !dbg !2311
  %31 = call noundef nonnull align 8 dereferenceable(8) ptr @"??$max@_K@std@@YAAEB_KAEB_K0@Z"(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %9) #11, !dbg !2311
  %32 = load i64, ptr %31, align 8, !dbg !2311
  store i64 %32, ptr %4, align 8, !dbg !2311
  br label %33, !dbg !2311

33:                                               ; preds = %26, %24, %15
  %34 = load i64, ptr %4, align 8, !dbg !2312
  ret i64 %34, !dbg !2312
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef ptr @"??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z"(i64 noundef %0) #0 comdat !dbg !2313 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
      %4 = load i64, ptr %3, align 8, !dbg !2323
  %5 = icmp uge i64 %4, 4096, !dbg !2323
  br i1 %5, label %6, label %9, !dbg !2323

6:                                                ; preds = %1
  %7 = load i64, ptr %3, align 8, !dbg !2325
  %8 = call noundef ptr @"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z"(i64 noundef %7), !dbg !2325, !heapallocsite !215
  store ptr %8, ptr %2, align 8, !dbg !2325
  br label %16, !dbg !2325

9:                                                ; preds = %1
  %10 = load i64, ptr %3, align 8, !dbg !2328
  %11 = icmp ne i64 %10, 0, !dbg !2328
  br i1 %11, label %12, label %15, !dbg !2328

12:                                               ; preds = %9
  %13 = load i64, ptr %3, align 8, !dbg !2329
  %14 = call noundef ptr @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 noundef %13), !dbg !2329, !heapallocsite !215
  store ptr %14, ptr %2, align 8, !dbg !2329
  br label %16, !dbg !2329

15:                                               ; preds = %9
  store ptr null, ptr %2, align 8, !dbg !2332
  br label %16, !dbg !2332

16:                                               ; preds = %15, %12, %6
  %17 = load ptr, ptr %2, align 8, !dbg !2333
  ret ptr %17, !dbg !2333
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @"??$_Get_size_of_n@$00@std@@YA_K_K@Z"(i64 noundef %0) #2 comdat !dbg !2334 {
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  store i64 %0, ptr %2, align 8
          store i8 0, ptr %3, align 1, !dbg !2342
  %4 = load i64, ptr %2, align 8, !dbg !2343
  %5 = mul i64 %4, 1, !dbg !2343
  ret i64 %5, !dbg !2343
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef ptr @"??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z"(i64 noundef %0) #0 comdat !dbg !2344 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store i64 %0, ptr %2, align 8
          %6 = load i64, ptr %2, align 8, !dbg !2349
  %7 = add i64 39, %6, !dbg !2349
  store i64 %7, ptr %3, align 8, !dbg !2349
  %8 = load i64, ptr %3, align 8, !dbg !2350
  %9 = load i64, ptr %2, align 8, !dbg !2350
  %10 = icmp ule i64 %8, %9, !dbg !2350
  br i1 %10, label %11, label %12, !dbg !2350

11:                                               ; preds = %1
  call void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #14, !dbg !2351
  unreachable, !dbg !2351

12:                                               ; preds = %1
      %13 = load i64, ptr %3, align 8, !dbg !2355
  %14 = call noundef ptr @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 noundef %13), !dbg !2355, !heapallocsite !215
  %15 = ptrtoint ptr %14 to i64, !dbg !2355
  store i64 %15, ptr %4, align 8, !dbg !2355
  br label %16, !dbg !2356

16:                                               ; preds = %12
  %17 = load i64, ptr %4, align 8, !dbg !2357
  %18 = icmp ne i64 %17, 0, !dbg !2357
  br i1 %18, label %19, label %20, !dbg !2357

19:                                               ; preds = %16
  br label %23, !dbg !2359

20:                                               ; preds = %16
  br label %21, !dbg !2362

21:                                               ; preds = %20
  call void @_invalid_parameter_noinfo_noreturn() #14, !dbg !2364
  unreachable, !dbg !2364

22:                                               ; No predecessors!
  br label %23, !dbg !2362

23:                                               ; preds = %22, %19
  br label %24, !dbg !2357

24:                                               ; preds = %23
      %25 = load i64, ptr %4, align 8, !dbg !2368
  %26 = add i64 %25, 39, !dbg !2368
  %27 = and i64 %26, -32, !dbg !2368
  %28 = inttoptr i64 %27 to ptr, !dbg !2368
  store ptr %28, ptr %5, align 8, !dbg !2368
  %29 = load i64, ptr %4, align 8, !dbg !2369
  %30 = load ptr, ptr %5, align 8, !dbg !2369
  %31 = getelementptr inbounds i64, ptr %30, i64 -1, !dbg !2369
  store i64 %29, ptr %31, align 8, !dbg !2369
  %32 = load ptr, ptr %5, align 8, !dbg !2370
  ret ptr %32, !dbg !2370
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef ptr @"?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z"(i64 noundef %0) #0 comdat align 2 !dbg !2371 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
      %3 = load i64, ptr %2, align 8, !dbg !2374
  %4 = call noalias noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef %3) #15, !dbg !2374, !heapallocsite !215
  ret ptr %4, !dbg !2374
}

; Function Attrs: mustprogress noinline noreturn optnone uwtable
define linkonce_odr dso_local void @"?_Throw_bad_array_new_length@std@@YAXXZ"() #9 comdat !dbg !2375 {
  %1 = alloca %"class.std::bad_array_new_length", align 8
  %2 = call noundef ptr @"??0bad_array_new_length@std@@QEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %1) #11, !dbg !2376
  call void @_CxxThrowException(ptr %1, ptr @"_TI3?AVbad_array_new_length@std@@") #14, !dbg !2376
  unreachable, !dbg !2376
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0bad_array_new_length@std@@QEAA@XZ"(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 comdat align 2 !dbg !2377 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @"??0bad_alloc@std@@AEAA@QEBD@Z"(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef @"??_C@_0BF@KINCDENJ@bad?5array?5new?5length?$AA@") #11, !dbg !2432
  store ptr @"??_7bad_array_new_length@std@@6B@", ptr %3, align 8, !dbg !2432
  ret ptr %3, !dbg !2433
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0bad_array_new_length@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 comdat align 2 !dbg !2434 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8, !dbg !2443
  %7 = call noundef ptr @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull align 8 dereferenceable(24) %6) #11, !dbg !2443
  store ptr @"??_7bad_array_new_length@std@@6B@", ptr %5, align 8, !dbg !2443
  ret ptr %5, !dbg !2443
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0bad_alloc@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 comdat align 2 !dbg !2444 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8, !dbg !2454
  %7 = call noundef ptr @"??0exception@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull align 8 dereferenceable(24) %6) #11, !dbg !2454
  store ptr @"??_7bad_alloc@std@@6B@", ptr %5, align 8, !dbg !2454
  ret ptr %5, !dbg !2454
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0exception@std@@QEAA@AEBV01@@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 comdat align 2 personality ptr @__CxxFrameHandler3 !dbg !2455 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  store ptr @"??_7exception@std@@6B@", ptr %5, align 8, !dbg !2461
  %6 = getelementptr inbounds %"class.std::exception", ptr %5, i32 0, i32 1, !dbg !2461
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 16, i1 false), !dbg !2461
  %7 = getelementptr inbounds %"class.std::exception", ptr %5, i32 0, i32 1, !dbg !2462
  %8 = load ptr, ptr %3, align 8, !dbg !2462
  %9 = getelementptr inbounds %"class.std::exception", ptr %8, i32 0, i32 1, !dbg !2462
  invoke void @__std_exception_copy(ptr noundef %9, ptr noundef %7)
          to label %10 unwind label %11, !dbg !2462

10:                                               ; preds = %2
  ret ptr %5, !dbg !2464

11:                                               ; preds = %2
  %12 = cleanuppad within none [], !dbg !2462
  call void @__std_terminate() #12 [ "funclet"(token %12) ], !dbg !2462
  unreachable, !dbg !2462
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??1bad_array_new_length@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #2 comdat align 2 !dbg !2465 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  call void @"??1bad_alloc@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %3) #11, !dbg !2469
  ret void, !dbg !2471
}

declare dso_local void @_CxxThrowException(ptr, ptr)

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0bad_alloc@std@@AEAA@QEBD@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1) unnamed_addr #2 comdat align 2 !dbg !2472 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
      store ptr %0, ptr %4, align 8
      %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8, !dbg !2477
  %7 = call noundef ptr @"??0exception@std@@QEAA@QEBDH@Z"(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef %6, i32 noundef 1) #11, !dbg !2477
  store ptr @"??_7bad_alloc@std@@6B@", ptr %5, align 8, !dbg !2477
  ret ptr %5, !dbg !2478
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_Gbad_array_new_length@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #2 comdat align 2 !dbg !2479 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
      store ptr %0, ptr %5, align 8
      %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1bad_array_new_length@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %6) #11, !dbg !2483
  %8 = icmp eq i32 %7, 0, !dbg !2483
  br i1 %8, label %10, label %9, !dbg !2483

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 24) #13, !dbg !2483
  br label %10, !dbg !2483

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !2483
  ret ptr %11, !dbg !2483
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"?what@exception@std@@UEBAPEBDXZ"(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #2 comdat align 2 !dbg !2484 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::exception", ptr %3, i32 0, i32 1, !dbg !2488
  %5 = getelementptr inbounds %struct.__std_exception_data, ptr %4, i32 0, i32 0, !dbg !2488
  %6 = load ptr, ptr %5, align 8, !dbg !2488
  %7 = icmp ne ptr %6, null, !dbg !2488
  br i1 %7, label %8, label %12, !dbg !2488

8:                                                ; preds = %1
  %9 = getelementptr inbounds %"class.std::exception", ptr %3, i32 0, i32 1, !dbg !2488
  %10 = getelementptr inbounds %struct.__std_exception_data, ptr %9, i32 0, i32 0, !dbg !2488
  %11 = load ptr, ptr %10, align 8, !dbg !2488
  br label %13, !dbg !2488

12:                                               ; preds = %1
  br label %13, !dbg !2488

13:                                               ; preds = %12, %8
  %14 = phi ptr [ %11, %8 ], [ @"??_C@_0BC@EOODALEL@Unknown?5exception?$AA@", %12 ], !dbg !2488
  ret ptr %14, !dbg !2488
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??0exception@std@@QEAA@QEBDH@Z"(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1, i32 noundef %2) unnamed_addr #2 comdat align 2 !dbg !2489 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %2, ptr %4, align 4
      store ptr %1, ptr %5, align 8
      store ptr %0, ptr %6, align 8
      %7 = load ptr, ptr %6, align 8
  store ptr @"??_7exception@std@@6B@", ptr %7, align 8, !dbg !2495
  %8 = getelementptr inbounds %"class.std::exception", ptr %7, i32 0, i32 1, !dbg !2495
  call void @llvm.memset.p0.i64(ptr align 8 %8, i8 0, i64 16, i1 false), !dbg !2495
  %9 = load ptr, ptr %5, align 8, !dbg !2496
  %10 = getelementptr inbounds %"class.std::exception", ptr %7, i32 0, i32 1, !dbg !2496
  %11 = getelementptr inbounds %struct.__std_exception_data, ptr %10, i32 0, i32 0, !dbg !2496
  store ptr %9, ptr %11, align 8, !dbg !2496
  ret ptr %7, !dbg !2498
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_Gbad_alloc@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #2 comdat align 2 !dbg !2499 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
      store ptr %0, ptr %5, align 8
      %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1bad_alloc@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %6) #11, !dbg !2504
  %8 = icmp eq i32 %7, 0, !dbg !2504
  br i1 %8, label %10, label %9, !dbg !2504

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 24) #13, !dbg !2504
  br label %10, !dbg !2504

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !2504
  ret ptr %11, !dbg !2504
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??_Gexception@std@@UEAAPEAXI@Z"(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #2 comdat align 2 !dbg !2505 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %1, ptr %4, align 4
      store ptr %0, ptr %5, align 8
      %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  call void @"??1exception@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %6) #11, !dbg !2509
  %8 = icmp eq i32 %7, 0, !dbg !2509
  br i1 %8, label %10, label %9, !dbg !2509

9:                                                ; preds = %2
  call void @"??3@YAXPEAX_K@Z"(ptr noundef %6, i64 noundef 24) #13, !dbg !2509
  br label %10, !dbg !2509

10:                                               ; preds = %9, %2
  %11 = load ptr, ptr %3, align 8, !dbg !2510
  ret ptr %11, !dbg !2510
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??1exception@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #2 comdat align 2 personality ptr @__CxxFrameHandler3 !dbg !2511 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  store ptr @"??_7exception@std@@6B@", ptr %3, align 8, !dbg !2514
  %4 = getelementptr inbounds %"class.std::exception", ptr %3, i32 0, i32 1, !dbg !2515
  invoke void @__std_exception_destroy(ptr noundef %4)
          to label %5 unwind label %6, !dbg !2515

5:                                                ; preds = %1
  ret void, !dbg !2517

6:                                                ; preds = %1
  %7 = cleanuppad within none [], !dbg !2515
  call void @__std_terminate() #12 [ "funclet"(token %7) ], !dbg !2515
  unreachable, !dbg !2515
}

declare dso_local void @__std_exception_destroy(ptr noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @"??1bad_alloc@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #2 comdat align 2 !dbg !2518 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8
  call void @"??1exception@std@@UEAA@XZ"(ptr noundef nonnull align 8 dereferenceable(24) %3) #11, !dbg !2521
  ret void, !dbg !2523
}

declare dso_local void @__std_exception_copy(ptr noundef, ptr noundef) #5

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull ptr @"??2@YAPEAX_K@Z"(i64 noundef) #10

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef ptr @"??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z"(ptr noundef %0) #2 comdat !dbg !2524 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
      %3 = load ptr, ptr %2, align 8, !dbg !2531
  ret ptr %3, !dbg !2531
}

attributes #0 = { mustprogress noinline optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind willreturn }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #9 = { mustprogress noinline noreturn optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nounwind }
attributes #12 = { noreturn nounwind }
attributes #13 = { builtin nounwind }
attributes #14 = { noreturn }
attributes #15 = { allocsize(0) }

!llvm.dbg.cu = !{!36}
!llvm.linker.options = !{!1674, !1675, !1676, !1677, !1678, !1679}
!llvm.module.flags = !{!1680, !1681, !1682, !1683, !1684, !1685}
!llvm.ident = !{!1686}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 7, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "Simple.cpp", directory: "C:\\Users\\alex\\Documents\\GitHub\\debase\\examples\\Simple", checksumkind: CSK_MD5, checksum: "5fa4ef65a2eab532cb028d3d18d10719")
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
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "_OptionsStorage", scope: !30, file: !31, line: 91, type: !35, isLocal: false, isDefinition: true)
!30 = distinct !DISubprogram(name: "__local_stdio_printf_options", scope: !31, file: !31, line: 89, type: !32, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36)
!31 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_stdio_config.h", directory: "", checksumkind: CSK_MD5, checksum: "dacf907bda504afb0b64f53a242bdae6")
!32 = !DISubroutineType(types: !33)
!33 = !{!34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!36 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "clang version 19.1.0 (D:/a/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !37, retainedTypes: !814, globals: !860, imports: !883, splitDebugInlining: false, nameTableKind: None)
!37 = !{!38, !801, !807}
!38 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Construct_strategy", scope: !40, file: !39, line: 2726, baseType: !794, size: 8, flags: DIFlagEnumClass, elements: !797, identifier: ".?AW4_Construct_strategy@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@")
!39 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\xstring", directory: "", checksumkind: CSK_MD5, checksum: "9428a862a6afce3980ddb98f42229f76")
!40 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char,std::char_traits<char>,std::allocator<char> >", scope: !41, file: !39, line: 2444, size: 256, align: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !42, templateParams: !791, identifier: ".?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@")
!41 = !DINamespace(name: "std", scope: null)
!42 = !{!43, !181, !194, !291, !404, !405, !406, !407, !408, !409, !410, !412, !415, !417, !419, !422, !424, !425, !426, !427, !428, !38, !429, !431, !450, !454, !457, !462, !465, !468, !471, !474, !477, !480, !483, !486, !489, !493, !496, !500, !504, !507, !508, !509, !512, !517, !520, !521, !522, !523, !528, !531, !532, !533, !536, !539, !542, !543, !544, !547, !548, !551, !554, !555, !558, !559, !560, !561, !562, !563, !566, !569, !572, !575, !578, !581, !584, !587, !590, !593, !596, !599, !600, !603, !606, !609, !612, !615, !618, !621, !624, !627, !630, !634, !635, !636, !639, !642, !643, !644, !647, !650, !651, !652, !653, !654, !655, !656, !657, !660, !663, !664, !665, !668, !669, !672, !675, !676, !677, !678, !679, !682, !683, !684, !685, !686, !689, !692, !695, !698, !702, !703, !704, !707, !710, !713, !716, !717, !718, !719, !720, !721, !722, !723, !724, !727, !728, !729, !730, !731, !732, !735, !736, !737, !738, !739, !740, !743, !746, !749, !752, !755, !758, !761, !764, !767, !770, !773, !776, !777, !778, !779, !780, !781, !782, !786}
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Alty", scope: !40, file: !39, line: 2449, baseType: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Rebind_alloc_t<std::allocator<char>,char>", scope: !41, file: !45, line: 727, baseType: !46)
!45 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\xmemory", directory: "", checksumkind: CSK_MD5, checksum: "a2c01f1c298a5127ca813ac5b8505e9e")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "template rebind_alloc<char>", scope: !47, file: !45, line: 626, baseType: !50)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Default_allocator_traits<std::allocator<char> >", scope: !41, file: !45, line: 608, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !48, templateParams: !179, identifier: ".?AU?$_Default_allocator_traits@V?$allocator@D@std@@@std@@")
!48 = !{!49, !130, !131, !133, !136, !138, !139, !140, !141, !157, !158, !159, !160, !165, !169, !173, !176}
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !47, file: !45, line: 609, baseType: !50)
!50 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char>", scope: !41, file: !45, line: 781, size: 8, align: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !51, templateParams: !128, identifier: ".?AV?$allocator@D@std@@")
!51 = !{!52, !53, !54, !56, !58, !60, !62, !65, !69, !89, !90, !92, !97, !100, !104, !108, !109, !113, !117, !120, !125}
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "_From_primary", scope: !50, file: !45, line: 786, baseType: !50, flags: DIFlagPublic)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !50, file: !45, line: 788, baseType: !5, flags: DIFlagPublic)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !50, file: !45, line: 791, baseType: !55, flags: DIFlagPublic)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !50, file: !45, line: 792, baseType: !57, flags: DIFlagPublic)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !50, file: !45, line: 794, baseType: !59, flags: DIFlagPublic)
!59 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !50, file: !45, line: 795, baseType: !61, flags: DIFlagPublic)
!61 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !50, file: !45, line: 798, baseType: !63, flags: DIFlagPublic)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !64, line: 18, baseType: !35)
!64 = !DIFile(filename: "C:\\llvm-mingw\\LLVM-19.1.0-Windows-X64\\lib\\clang\\19\\include\\__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "da20c4f7e8be13d4f253d3be74052f5f")
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !50, file: !45, line: 799, baseType: !66, flags: DIFlagPublic)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !67, line: 18, baseType: !68)
!67 = !DIFile(filename: "C:\\llvm-mingw\\LLVM-19.1.0-Windows-X64\\lib\\clang\\19\\include\\__stddef_ptrdiff_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2ed34789383ea7e3a1d5880f0fc69771")
!68 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_move_assignment", scope: !50, file: !45, line: 801, baseType: !70, flags: DIFlagPublic)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !41, file: !71, line: 39, baseType: !72)
!71 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\xtr1common", directory: "", checksumkind: CSK_MD5, checksum: "6bfcc9a711b63189c5f614fae63be0b1")
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<true>", scope: !41, file: !71, line: 37, baseType: !73)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,1>", scope: !41, file: !71, line: 21, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !74, templateParams: !86, identifier: ".?AU?$integral_constant@_N$00@std@@")
!74 = !{!75, !78, !79, !80, !85}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !73, file: !71, line: 22, baseType: !76, flags: DIFlagStaticMember)
!76 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !77)
!77 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !73, file: !71, line: 24, baseType: !77)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !73, file: !71, line: 25, baseType: !73)
!80 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !73, file: !71, line: 27, type: !81, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DISubroutineType(types: !82)
!82 = !{!78, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!84 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !73)
!85 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$00@std@@QEBA_NXZ", scope: !73, file: !71, line: 31, type: !81, scopeLine: 31, flags: DIFlagPrototyped, spFlags: 0)
!86 = !{!87, !88}
!87 = !DITemplateTypeParameter(name: "_Ty", type: !77)
!88 = !DITemplateValueParameter(name: "_Val", type: !77, value: i8 1)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "is_always_equal", scope: !50, file: !45, line: 802, baseType: !70, flags: DIFlagPublic)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_Minimum_allocation_alignment", scope: !50, file: !45, line: 866, baseType: !91, flags: DIFlagPublic | DIFlagStaticMember)
!91 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!92 = !DISubprogram(name: "address", linkageName: "?address@?$allocator@D@std@@QEBAPEADAEAD@Z", scope: !50, file: !45, line: 810, type: !93, scopeLine: 810, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!93 = !DISubroutineType(types: !94)
!94 = !{!55, !95, !59}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!96 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !50)
!97 = !DISubprogram(name: "address", linkageName: "?address@?$allocator@D@std@@QEBAPEBDAEBD@Z", scope: !50, file: !45, line: 814, type: !98, scopeLine: 814, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!98 = !DISubroutineType(types: !99)
!99 = !{!57, !95, !61}
!100 = !DISubprogram(name: "allocator", scope: !50, file: !45, line: 819, type: !101, scopeLine: 819, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!101 = !DISubroutineType(types: !102)
!102 = !{null, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!104 = !DISubprogram(name: "allocator", scope: !50, file: !45, line: 821, type: !105, scopeLine: 821, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!105 = !DISubroutineType(types: !106)
!106 = !{null, !103, !107}
!107 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !96, size: 64)
!108 = !DISubprogram(name: "~allocator", scope: !50, file: !45, line: 824, type: !101, scopeLine: 824, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!109 = !DISubprogram(name: "operator=", linkageName: "??4?$allocator@D@std@@QEAAAEAV01@AEBV01@@Z", scope: !50, file: !45, line: 825, type: !110, scopeLine: 825, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!110 = !DISubroutineType(types: !111)
!111 = !{!112, !103, !107}
!112 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !50, size: 64)
!113 = !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z", scope: !50, file: !45, line: 827, type: !114, scopeLine: 827, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!114 = !DISubroutineType(types: !115)
!115 = !{null, !103, !116, !91}
!116 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !55)
!117 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_K@Z", scope: !50, file: !45, line: 833, type: !118, scopeLine: 833, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!118 = !DISubroutineType(types: !119)
!119 = !{!55, !103, !91}
!120 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_KPEBX@Z", scope: !50, file: !45, line: 846, type: !121, scopeLine: 846, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!121 = !DISubroutineType(types: !122)
!122 = !{!55, !103, !91, !123}
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!125 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$allocator@D@std@@QEBA_KXZ", scope: !50, file: !45, line: 861, type: !126, scopeLine: 861, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!126 = !DISubroutineType(types: !127)
!127 = !{!63, !95}
!128 = !{!129}
!129 = !DITemplateTypeParameter(name: "_Ty", type: !5)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !47, file: !45, line: 610, baseType: !53)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !47, file: !45, line: 612, baseType: !132)
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !47, file: !45, line: 613, baseType: !134)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !130)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "void_pointer", scope: !47, file: !45, line: 614, baseType: !137)
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", scope: !47, file: !45, line: 615, baseType: !123)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !47, file: !45, line: 617, baseType: !63)
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !47, file: !45, line: 618, baseType: !66)
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_copy_assignment", scope: !47, file: !45, line: 620, baseType: !142)
!142 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !41, file: !71, line: 40, baseType: !143)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool_constant<false>", scope: !41, file: !71, line: 37, baseType: !144)
!144 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool,0>", scope: !41, file: !71, line: 21, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !145, templateParams: !155, identifier: ".?AU?$integral_constant@_N$0A@@std@@")
!145 = !{!146, !147, !148, !149, !154}
!146 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !144, file: !71, line: 22, baseType: !76, flags: DIFlagStaticMember)
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !144, file: !71, line: 24, baseType: !77)
!148 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !144, file: !71, line: 25, baseType: !144)
!149 = !DISubprogram(name: "operator bool", linkageName: "??B?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !144, file: !71, line: 27, type: !150, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!150 = !DISubroutineType(types: !151)
!151 = !{!147, !152}
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!153 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !144)
!154 = !DISubprogram(name: "operator()", linkageName: "??R?$integral_constant@_N$0A@@std@@QEBA_NXZ", scope: !144, file: !71, line: 31, type: !150, scopeLine: 31, flags: DIFlagPrototyped, spFlags: 0)
!155 = !{!87, !156}
!156 = !DITemplateValueParameter(name: "_Val", type: !77, value: i8 0)
!157 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_move_assignment", scope: !47, file: !45, line: 621, baseType: !70)
!158 = !DIDerivedType(tag: DW_TAG_typedef, name: "propagate_on_container_swap", scope: !47, file: !45, line: 622, baseType: !142)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "is_always_equal", scope: !47, file: !45, line: 623, baseType: !70)
!160 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAPEADAEAV?$allocator@D@2@_K@Z", scope: !47, file: !45, line: 632, type: !161, scopeLine: 632, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!161 = !DISubroutineType(types: !162)
!162 = !{!131, !112, !163}
!163 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !164)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !45, line: 617, baseType: !63)
!165 = !DISubprogram(name: "allocate", linkageName: "?allocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAPEADAEAV?$allocator@D@2@_KPEBX@Z", scope: !47, file: !45, line: 646, type: !166, scopeLine: 646, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!166 = !DISubroutineType(types: !167)
!167 = !{!131, !112, !163, !168}
!168 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", file: !45, line: 615, baseType: !123)
!169 = !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SAXAEAV?$allocator@D@2@QEAD_K@Z", scope: !47, file: !45, line: 659, type: !170, scopeLine: 659, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!170 = !DISubroutineType(types: !171)
!171 = !{null, !112, !172, !163}
!172 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !131)
!173 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z", scope: !47, file: !45, line: 693, type: !174, scopeLine: 693, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!174 = !DISubroutineType(types: !175)
!175 = !{!139, !107}
!176 = !DISubprogram(name: "select_on_container_copy_construction", linkageName: "?select_on_container_copy_construction@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA?AV?$allocator@D@2@AEBV32@@Z", scope: !47, file: !45, line: 697, type: !177, scopeLine: 697, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!177 = !DISubroutineType(types: !178)
!178 = !{!50, !107}
!179 = !{!180}
!180 = !DITemplateTypeParameter(name: "_Alloc", type: !50)
!181 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Alty_traits", scope: !40, file: !39, line: 2450, baseType: !182)
!182 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::allocator<char> >", scope: !41, file: !45, line: 703, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !183, templateParams: !179, identifier: ".?AU?$allocator_traits@V?$allocator@D@std@@@std@@")
!183 = !{!184}
!184 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !182, baseType: !185, extraData: i32 0)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "conditional_t<_Is_default_allocator<allocator<char> >::value,_Default_allocator_traits<allocator<char> >,_Normal_allocator_traits<allocator<char> > >", scope: !41, file: !71, line: 64, baseType: !186)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !187, file: !71, line: 55, baseType: !47)
!187 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<1,std::_Default_allocator_traits<std::allocator<char> >,std::_Normal_allocator_traits<std::allocator<char> > >", scope: !41, file: !71, line: 54, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !188, templateParams: !189, identifier: ".?AU?$conditional@$00U?$_Default_allocator_traits@V?$allocator@D@std@@@std@@U?$_Normal_allocator_traits@V?$allocator@D@std@@@2@@std@@")
!188 = !{!186}
!189 = !{!190, !191, !192}
!190 = !DITemplateValueParameter(name: "_Test", type: !77, value: i8 1)
!191 = !DITemplateTypeParameter(name: "_Ty1", type: !47)
!192 = !DITemplateTypeParameter(name: "_Ty2", type: !193)
!193 = !DICompositeType(tag: DW_TAG_structure_type, name: "_Normal_allocator_traits<std::allocator<char> >", scope: !41, file: !45, line: 522, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AU?$_Normal_allocator_traits@V?$allocator@D@std@@@std@@")
!194 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Scary_val", scope: !40, file: !39, line: 2452, baseType: !195)
!195 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "_String_val<std::_Simple_types<char> >", scope: !41, file: !39, line: 2261, size: 256, align: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !196, templateParams: !289, identifier: ".?AV?$_String_val@U?$_Simple_types@D@std@@@std@@")
!196 = !{!197, !219, !232, !233, !234, !235, !236, !238, !241, !243, !244, !258, !259, !260, !261, !265, !269, !275, !278, !279, !282, !283, !286}
!197 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !195, baseType: !198, flags: DIFlagPublic, extraData: i32 0)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Container_base", scope: !41, file: !45, line: 1280, baseType: !199)
!199 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Container_base0", scope: !41, file: !45, line: 1028, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !200, identifier: ".?AU_Container_base0@std@@")
!200 = !{!201, !205, !209, !216}
!201 = !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@_Container_base0@std@@QEAAXXZ", scope: !199, file: !45, line: 1029, type: !202, scopeLine: 1029, flags: DIFlagPrototyped, spFlags: 0)
!202 = !DISubroutineType(types: !203)
!203 = !{null, !204}
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!205 = !DISubprogram(name: "_Swap_proxy_and_iterators", linkageName: "?_Swap_proxy_and_iterators@_Container_base0@std@@QEAAXAEAU12@@Z", scope: !199, file: !45, line: 1030, type: !206, scopeLine: 1030, flags: DIFlagPrototyped, spFlags: 0)
!206 = !DISubroutineType(types: !207)
!207 = !{null, !204, !208}
!208 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !199, size: 64)
!209 = !DISubprogram(name: "_Alloc_proxy", linkageName: "?_Alloc_proxy@_Container_base0@std@@QEAAXAEBU_Fake_allocator@2@@Z", scope: !199, file: !45, line: 1031, type: !210, scopeLine: 1031, flags: DIFlagPrototyped, spFlags: 0)
!210 = !DISubroutineType(types: !211)
!211 = !{null, !204, !212}
!212 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !213, size: 64)
!213 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !214)
!214 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Fake_allocator", scope: !41, file: !45, line: 1026, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !215, identifier: ".?AU_Fake_allocator@std@@")
!215 = !{}
!216 = !DISubprogram(name: "_Reload_proxy", linkageName: "?_Reload_proxy@_Container_base0@std@@QEAAXAEBU_Fake_allocator@2@0@Z", scope: !199, file: !45, line: 1032, type: !217, scopeLine: 1032, flags: DIFlagPrototyped, spFlags: 0)
!217 = !DISubroutineType(types: !218)
!218 = !{null, !204, !212, !212}
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !195, file: !39, line: 2263, baseType: !220, flags: DIFlagPublic)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !221, file: !45, line: 745, baseType: !5)
!221 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Simple_types<char>", scope: !41, file: !45, line: 743, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !222, templateParams: !230, identifier: ".?AU?$_Simple_types@D@std@@")
!222 = !{!220, !223, !224, !225, !227}
!223 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !221, file: !45, line: 746, baseType: !63)
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !221, file: !45, line: 747, baseType: !66)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !221, file: !45, line: 748, baseType: !226)
!226 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 64)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !221, file: !45, line: 749, baseType: !228)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!229 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !220)
!230 = !{!231}
!231 = !DITemplateTypeParameter(name: "_Value_type", type: !5)
!232 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !195, file: !39, line: 2264, baseType: !223, flags: DIFlagPublic)
!233 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !195, file: !39, line: 2265, baseType: !224, flags: DIFlagPublic)
!234 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !195, file: !39, line: 2266, baseType: !225, flags: DIFlagPublic)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !195, file: !39, line: 2267, baseType: !227, flags: DIFlagPublic)
!236 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !195, file: !39, line: 2268, baseType: !237, flags: DIFlagPublic)
!237 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !219, size: 64)
!238 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !195, file: !39, line: 2269, baseType: !239, flags: DIFlagPublic)
!239 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !240, size: 64)
!240 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !219)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "_BUF_SIZE", scope: !195, file: !39, line: 2274, baseType: !242, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 16)
!242 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !232)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "_ALLOC_MASK", scope: !195, file: !39, line: 2276, baseType: !242, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 15)
!244 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "_Bxty", scope: !195, file: !39, line: 2338, size: 128, align: 64, flags: DIFlagPublic | DIFlagTypePassByReference | DIFlagNonTrivial, elements: !245, identifier: ".?AT_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@")
!245 = !{!246, !250, !251, !253, !257}
!246 = !DIDerivedType(tag: DW_TAG_member, name: "_Buf", scope: !244, file: !39, line: 2343, baseType: !247, size: 128)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !219, size: 128, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 16)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "_Ptr", scope: !244, file: !39, line: 2344, baseType: !234, size: 64)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "_Alias", scope: !244, file: !39, line: 2345, baseType: !252, size: 128)
!252 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, elements: !248)
!253 = !DISubprogram(name: "_Bxty", scope: !244, file: !39, line: 2339, type: !254, scopeLine: 2339, flags: DIFlagPrototyped, spFlags: 0)
!254 = !DISubroutineType(types: !255)
!255 = !{null, !256}
!256 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!257 = !DISubprogram(name: "~_Bxty", scope: !244, file: !39, line: 2341, type: !254, scopeLine: 2341, flags: DIFlagPrototyped, spFlags: 0)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "_Bx", scope: !195, file: !39, line: 2346, baseType: !244, size: 128, align: 64, flags: DIFlagPublic)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "_Mysize", scope: !195, file: !39, line: 2348, baseType: !232, size: 64, offset: 128, flags: DIFlagPublic)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "_Myres", scope: !195, file: !39, line: 2349, baseType: !232, size: 64, offset: 192, flags: DIFlagPublic)
!261 = !DISubprogram(name: "_String_val", scope: !195, file: !39, line: 2271, type: !262, scopeLine: 2271, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!262 = !DISubroutineType(types: !263)
!263 = !{null, !264}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!265 = !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAPEADXZ", scope: !195, file: !39, line: 2282, type: !266, scopeLine: 2282, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!266 = !DISubroutineType(types: !267)
!267 = !{!268, !264}
!268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!269 = !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ", scope: !195, file: !39, line: 2291, type: !270, scopeLine: 2291, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!270 = !DISubroutineType(types: !271)
!271 = !{!272, !273}
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!273 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !274, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!274 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !195)
!275 = !DISubprogram(name: "_Large_string_engaged", linkageName: "?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ", scope: !195, file: !39, line: 2300, type: !276, scopeLine: 2300, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!276 = !DISubroutineType(types: !277)
!277 = !{!77, !273}
!278 = !DISubprogram(name: "_Activate_SSO_buffer", linkageName: "?_Activate_SSO_buffer@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAXXZ", scope: !195, file: !39, line: 2304, type: !262, scopeLine: 2304, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!279 = !DISubprogram(name: "_Check_offset", linkageName: "?_Check_offset@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAX_K@Z", scope: !195, file: !39, line: 2315, type: !280, scopeLine: 2315, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!280 = !DISubroutineType(types: !281)
!281 = !{null, !273, !242}
!282 = !DISubprogram(name: "_Check_offset_exclusive", linkageName: "?_Check_offset_exclusive@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAX_K@Z", scope: !195, file: !39, line: 2322, type: !280, scopeLine: 2322, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!283 = !DISubprogram(name: "_Xran", linkageName: "?_Xran@?$_String_val@U?$_Simple_types@D@std@@@std@@SAXXZ", scope: !195, file: !39, line: 2329, type: !284, scopeLine: 2329, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!284 = !DISubroutineType(types: !285)
!285 = !{null}
!286 = !DISubprogram(name: "_Clamp_suffix_size", linkageName: "?_Clamp_suffix_size@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_K_K0@Z", scope: !195, file: !39, line: 2333, type: !287, scopeLine: 2333, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!287 = !DISubroutineType(types: !288)
!288 = !{!232, !273, !242, !242}
!289 = !{!290}
!290 = !DITemplateTypeParameter(name: "_Val_types", type: !221)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "traits_type", scope: !40, file: !39, line: 2468, baseType: !292, flags: DIFlagPublic)
!292 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !41, file: !39, line: 497, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !293, templateParams: !403, identifier: ".?AU?$char_traits@D@std@@")
!293 = !{!294}
!294 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !292, baseType: !295, extraData: i32 0)
!295 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Narrow_char_traits<char,int>", scope: !41, file: !39, line: 356, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !296, templateParams: !363, identifier: ".?AU?$_Narrow_char_traits@DH@std@@")
!296 = !{!297, !366, !367, !368, !369, !370, !371, !373, !376, !379, !382, !383, !384, !385, !386, !391, !394, !397, !400}
!297 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !295, baseType: !298, flags: DIFlagPrivate, extraData: i32 0)
!298 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Char_traits<char,int>", scope: !41, file: !39, line: 35, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !299, templateParams: !363, identifier: ".?AU?$_Char_traits@DH@std@@")
!299 = !{!300, !301, !303, !307, !309, !319, !323, !326, !327, !330, !333, !336, !339, !342, !345, !346, !351, !354, !357, !360}
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !298, file: !39, line: 36, baseType: !5)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !298, file: !39, line: 37, baseType: !302)
!302 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!303 = !DIDerivedType(tag: DW_TAG_typedef, name: "pos_type", scope: !298, file: !39, line: 38, baseType: !304)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "streampos", scope: !41, file: !305, line: 137, baseType: !306)
!305 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\iosfwd", directory: "", checksumkind: CSK_MD5, checksum: "e1383f6edacc71b7865cc73efebf48b7")
!306 = !DICompositeType(tag: DW_TAG_class_type, name: "fpos<_Mbstatet>", scope: !41, file: !305, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$fpos@U_Mbstatet@@@std@@")
!307 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_type", scope: !298, file: !39, line: 39, baseType: !308)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamoff", scope: !41, file: !305, line: 47, baseType: !68)
!309 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_type", scope: !298, file: !39, line: 40, baseType: !310)
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mbstatet", file: !311, line: 629, baseType: !312)
!311 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt.h", directory: "", checksumkind: CSK_MD5, checksum: "4ce81db8e96f94c79f8dce86dd46b97f")
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Mbstatet", file: !311, line: 625, size: 64, align: 32, flags: DIFlagTypePassByValue, elements: !313, identifier: ".?AU_Mbstatet@@")
!313 = !{!314, !316, !318}
!314 = !DIDerivedType(tag: DW_TAG_member, name: "_Wchar", scope: !312, file: !311, line: 627, baseType: !315, size: 32)
!315 = !DIBasicType(name: "unsigned long", size: 32, encoding: DW_ATE_unsigned)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "_Byte", scope: !312, file: !311, line: 628, baseType: !317, size: 16, offset: 32)
!317 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "_State", scope: !312, file: !311, line: 628, baseType: !317, size: 16, offset: 48)
!319 = !DISubprogram(name: "copy", linkageName: "?copy@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !298, file: !39, line: 47, type: !320, scopeLine: 47, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!320 = !DISubroutineType(types: !321)
!321 = !{!55, !116, !322, !91}
!322 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !57)
!323 = !DISubprogram(name: "_Copy_s", linkageName: "?_Copy_s@?$_Char_traits@DH@std@@SAPEADQEAD_KQEBD1@Z", scope: !298, file: !39, line: 70, type: !324, scopeLine: 70, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!324 = !DISubroutineType(types: !325)
!325 = !{!55, !116, !91, !322, !91}
!326 = !DISubprogram(name: "move", linkageName: "?move@?$_Char_traits@DH@std@@SAPEADQEADQEBD_K@Z", scope: !298, file: !39, line: 78, type: !320, scopeLine: 78, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!327 = !DISubprogram(name: "compare", linkageName: "?compare@?$_Char_traits@DH@std@@SAHPEBD0_K@Z", scope: !298, file: !39, line: 126, type: !328, scopeLine: 126, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!328 = !DISubroutineType(types: !329)
!329 = !{!302, !57, !57, !63}
!330 = !DISubprogram(name: "length", linkageName: "?length@?$_Char_traits@DH@std@@SA_KPEBD@Z", scope: !298, file: !39, line: 138, type: !331, scopeLine: 138, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!331 = !DISubroutineType(types: !332)
!332 = !{!63, !57}
!333 = !DISubprogram(name: "find", linkageName: "?find@?$_Char_traits@DH@std@@SAPEBDPEBD_KAEBD@Z", scope: !298, file: !39, line: 149, type: !334, scopeLine: 149, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!334 = !DISubroutineType(types: !335)
!335 = !{!57, !57, !63, !61}
!336 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !298, file: !39, line: 161, type: !337, scopeLine: 161, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!337 = !DISubroutineType(types: !338)
!338 = !{!55, !116, !63, !4}
!339 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Char_traits@DH@std@@SAXAEADAEBD@Z", scope: !298, file: !39, line: 180, type: !340, scopeLine: 180, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!340 = !DISubroutineType(types: !341)
!341 = !{null, !59, !61}
!342 = !DISubprogram(name: "eq", linkageName: "?eq@?$_Char_traits@DH@std@@SA_NAEBD0@Z", scope: !298, file: !39, line: 191, type: !343, scopeLine: 191, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!343 = !DISubroutineType(types: !344)
!344 = !{!77, !61, !61}
!345 = !DISubprogram(name: "lt", linkageName: "?lt@?$_Char_traits@DH@std@@SA_NAEBD0@Z", scope: !298, file: !39, line: 195, type: !343, scopeLine: 195, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!346 = !DISubprogram(name: "to_char_type", linkageName: "?to_char_type@?$_Char_traits@DH@std@@SADAEBH@Z", scope: !298, file: !39, line: 199, type: !347, scopeLine: 199, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!347 = !DISubroutineType(types: !348)
!348 = !{!5, !349}
!349 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !350, size: 64)
!350 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !301)
!351 = !DISubprogram(name: "to_int_type", linkageName: "?to_int_type@?$_Char_traits@DH@std@@SAHAEBD@Z", scope: !298, file: !39, line: 203, type: !352, scopeLine: 203, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!352 = !DISubroutineType(types: !353)
!353 = !{!301, !61}
!354 = !DISubprogram(name: "eq_int_type", linkageName: "?eq_int_type@?$_Char_traits@DH@std@@SA_NAEBH0@Z", scope: !298, file: !39, line: 207, type: !355, scopeLine: 207, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!355 = !DISubroutineType(types: !356)
!356 = !{!77, !349, !349}
!357 = !DISubprogram(name: "not_eof", linkageName: "?not_eof@?$_Char_traits@DH@std@@SAHAEBH@Z", scope: !298, file: !39, line: 211, type: !358, scopeLine: 211, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!358 = !DISubroutineType(types: !359)
!359 = !{!301, !349}
!360 = !DISubprogram(name: "eof", linkageName: "?eof@?$_Char_traits@DH@std@@SAHXZ", scope: !298, file: !39, line: 215, type: !361, scopeLine: 215, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!361 = !DISubroutineType(types: !362)
!362 = !{!301}
!363 = !{!364, !365}
!364 = !DITemplateTypeParameter(name: "_Elem", type: !5)
!365 = !DITemplateTypeParameter(name: "_Int_type", type: !302)
!366 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Primary_char_traits", scope: !295, file: !39, line: 359, baseType: !298, flags: DIFlagPrivate)
!367 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !295, file: !39, line: 362, baseType: !5)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !295, file: !39, line: 363, baseType: !302)
!369 = !DIDerivedType(tag: DW_TAG_typedef, name: "pos_type", scope: !295, file: !39, line: 364, baseType: !304)
!370 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_type", scope: !295, file: !39, line: 365, baseType: !308)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "state_type", scope: !295, file: !39, line: 366, baseType: !372)
!372 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !311, line: 631, baseType: !310)
!373 = !DISubprogram(name: "compare", linkageName: "?compare@?$_Narrow_char_traits@DH@std@@SAHQEBD0_K@Z", scope: !295, file: !39, line: 375, type: !374, scopeLine: 375, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!374 = !DISubroutineType(types: !375)
!375 = !{!302, !322, !322, !91}
!376 = !DISubprogram(name: "length", linkageName: "?length@?$_Narrow_char_traits@DH@std@@SA_KQEBD@Z", scope: !295, file: !39, line: 402, type: !377, scopeLine: 402, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!377 = !DISubroutineType(types: !378)
!378 = !{!63, !322}
!379 = !DISubprogram(name: "find", linkageName: "?find@?$_Narrow_char_traits@DH@std@@SAPEBDQEBD_KAEBD@Z", scope: !295, file: !39, line: 422, type: !380, scopeLine: 422, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!380 = !DISubroutineType(types: !381)
!381 = !{!57, !322, !91, !61}
!382 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !295, file: !39, line: 443, type: !337, scopeLine: 443, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!383 = !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z", scope: !295, file: !39, line: 455, type: !340, scopeLine: 455, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!384 = !DISubprogram(name: "eq", linkageName: "?eq@?$_Narrow_char_traits@DH@std@@SA_NAEBD0@Z", scope: !295, file: !39, line: 464, type: !343, scopeLine: 464, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!385 = !DISubprogram(name: "lt", linkageName: "?lt@?$_Narrow_char_traits@DH@std@@SA_NAEBD0@Z", scope: !295, file: !39, line: 468, type: !343, scopeLine: 468, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!386 = !DISubprogram(name: "to_char_type", linkageName: "?to_char_type@?$_Narrow_char_traits@DH@std@@SADAEBH@Z", scope: !295, file: !39, line: 472, type: !387, scopeLine: 472, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!387 = !DISubroutineType(types: !388)
!388 = !{!5, !389}
!389 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !390, size: 64)
!390 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !368)
!391 = !DISubprogram(name: "to_int_type", linkageName: "?to_int_type@?$_Narrow_char_traits@DH@std@@SAHAEBD@Z", scope: !295, file: !39, line: 476, type: !392, scopeLine: 476, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!392 = !DISubroutineType(types: !393)
!393 = !{!368, !61}
!394 = !DISubprogram(name: "eq_int_type", linkageName: "?eq_int_type@?$_Narrow_char_traits@DH@std@@SA_NAEBH0@Z", scope: !295, file: !39, line: 480, type: !395, scopeLine: 480, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!395 = !DISubroutineType(types: !396)
!396 = !{!77, !389, !389}
!397 = !DISubprogram(name: "not_eof", linkageName: "?not_eof@?$_Narrow_char_traits@DH@std@@SAHAEBH@Z", scope: !295, file: !39, line: 484, type: !398, scopeLine: 484, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!398 = !DISubroutineType(types: !399)
!399 = !{!368, !389}
!400 = !DISubprogram(name: "eof", linkageName: "?eof@?$_Narrow_char_traits@DH@std@@SAHXZ", scope: !295, file: !39, line: 488, type: !401, scopeLine: 488, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!401 = !DISubroutineType(types: !402)
!402 = !{!368}
!403 = !{!364}
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !40, file: !39, line: 2469, baseType: !50, flags: DIFlagPublic)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !40, file: !39, line: 2471, baseType: !5, flags: DIFlagPublic)
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !40, file: !39, line: 2472, baseType: !139, flags: DIFlagPublic)
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !40, file: !39, line: 2473, baseType: !140, flags: DIFlagPublic)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !40, file: !39, line: 2474, baseType: !131, flags: DIFlagPublic)
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !40, file: !39, line: 2475, baseType: !133, flags: DIFlagPublic)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !40, file: !39, line: 2476, baseType: !411, flags: DIFlagPublic)
!411 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !405, size: 64)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !40, file: !39, line: 2477, baseType: !413, flags: DIFlagPublic)
!413 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !414, size: 64)
!414 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !405)
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !40, file: !39, line: 2479, baseType: !416, flags: DIFlagPublic)
!416 = !DICompositeType(tag: DW_TAG_class_type, name: "_String_iterator<std::_String_val<std::_Simple_types<char> > >", scope: !41, file: !39, line: 2133, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@")
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !40, file: !39, line: 2480, baseType: !418, flags: DIFlagPublic)
!418 = !DICompositeType(tag: DW_TAG_class_type, name: "_String_const_iterator<std::_String_val<std::_Simple_types<char> > >", scope: !41, file: !39, line: 1896, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@")
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !40, file: !39, line: 2482, baseType: !420, flags: DIFlagPublic)
!420 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::_String_iterator<std::_String_val<std::_Simple_types<char> > > >", scope: !41, file: !421, line: 1210, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@std@@")
!421 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\xutility", directory: "", checksumkind: CSK_MD5, checksum: "1a7559f199ec1b272319af13bfe4815a")
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !40, file: !39, line: 2483, baseType: !423, flags: DIFlagPublic)
!423 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::_String_const_iterator<std::_String_val<std::_Simple_types<char> > > >", scope: !41, file: !421, line: 1210, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@std@@")
!424 = !DIDerivedType(tag: DW_TAG_member, name: "_BUF_SIZE", scope: !40, file: !39, line: 2486, baseType: !242, flags: DIFlagStaticMember, extraData: i64 16)
!425 = !DIDerivedType(tag: DW_TAG_member, name: "_ALLOC_MASK", scope: !40, file: !39, line: 2487, baseType: !242, flags: DIFlagStaticMember, extraData: i64 15)
!426 = !DIDerivedType(tag: DW_TAG_member, name: "_Can_memcpy_val", scope: !40, file: !39, line: 2499, baseType: !76, flags: DIFlagStaticMember, extraData: i1 true)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "_Memcpy_val_offset", scope: !40, file: !39, line: 2501, baseType: !91, flags: DIFlagStaticMember, extraData: i64 0)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "_Memcpy_val_size", scope: !40, file: !39, line: 2502, baseType: !91, flags: DIFlagStaticMember, extraData: i64 32)
!429 = !DIDerivedType(tag: DW_TAG_member, name: "npos", scope: !40, file: !39, line: 3277, baseType: !430, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 -1)
!430 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !406)
!431 = !DIDerivedType(tag: DW_TAG_member, name: "_Mypair", scope: !40, file: !39, line: 5040, baseType: !432, size: 256, align: 64)
!432 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "_Compressed_pair<std::allocator<char>,std::_String_val<std::_Simple_types<char> >,1>", scope: !41, file: !45, line: 1367, size: 256, align: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !433, templateParams: !446, identifier: ".?AV?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@")
!433 = !{!434, !435, !436, !437, !441}
!434 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !432, baseType: !50, extraData: i32 0)
!435 = !DIDerivedType(tag: DW_TAG_member, name: "_Myval2", scope: !432, file: !45, line: 1369, baseType: !195, size: 256, align: 64, flags: DIFlagPublic)
!436 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Mybase", scope: !432, file: !45, line: 1371, baseType: !50, flags: DIFlagPublic)
!437 = !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ", scope: !432, file: !45, line: 1383, type: !438, scopeLine: 1383, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!438 = !DISubroutineType(types: !439)
!439 = !{!112, !440}
!440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !432, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!441 = !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ", scope: !432, file: !45, line: 1387, type: !442, scopeLine: 1387, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!442 = !DISubroutineType(types: !443)
!443 = !{!107, !444}
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !445, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!445 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !432)
!446 = !{!447, !448, !449}
!447 = !DITemplateTypeParameter(name: "_Ty1", type: !50)
!448 = !DITemplateTypeParameter(name: "_Ty2", type: !195)
!449 = !DITemplateValueParameter(type: !77, defaulted: true, value: i8 1)
!450 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2613, type: !451, scopeLine: 2613, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!451 = !DISubroutineType(types: !452)
!452 = !{null, !453}
!453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!454 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2619, type: !455, scopeLine: 2619, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!455 = !DISubroutineType(types: !456)
!456 = !{null, !453, !107}
!457 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2624, type: !458, scopeLine: 2624, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!458 = !DISubroutineType(types: !459)
!459 = !{null, !453, !460}
!460 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !461, size: 64)
!461 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !40)
!462 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2629, type: !463, scopeLine: 2629, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!463 = !DISubroutineType(types: !464)
!464 = !{null, !453, !460, !107}
!465 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2634, type: !466, scopeLine: 2634, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!466 = !DISubroutineType(types: !467)
!467 = !{null, !453, !460, !430, !107}
!468 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2641, type: !469, scopeLine: 2641, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{null, !453, !460, !430, !430, !107}
!471 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2662, type: !472, scopeLine: 2662, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!472 = !DISubroutineType(types: !473)
!473 = !{null, !453, !322, !430}
!474 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2667, type: !475, scopeLine: 2667, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!475 = !DISubroutineType(types: !476)
!476 = !{null, !453, !322, !430, !107}
!477 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2673, type: !478, scopeLine: 2673, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!478 = !DISubroutineType(types: !479)
!479 = !{null, !453, !322}
!480 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2684, type: !481, scopeLine: 2684, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!481 = !DISubroutineType(types: !482)
!482 = !{null, !453, !322, !107}
!483 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2689, type: !484, scopeLine: 2689, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!484 = !DISubroutineType(types: !485)
!485 = !{null, !453, !430, !4}
!486 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2697, type: !487, scopeLine: 2697, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!487 = !DISubroutineType(types: !488)
!488 = !{null, !453, !430, !4, !107}
!489 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2887, type: !490, scopeLine: 2887, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!490 = !DISubroutineType(types: !491)
!491 = !{null, !453, !492}
!492 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !40, size: 64)
!493 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2893, type: !494, scopeLine: 2893, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!494 = !DISubroutineType(types: !495)
!495 = !{null, !453, !492, !107}
!496 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2908, type: !497, scopeLine: 2908, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!497 = !DISubroutineType(types: !498)
!498 = !{null, !453, !499, !460, !322, !430, !322, !430}
!499 = !DICompositeType(tag: DW_TAG_structure_type, name: "_String_constructor_concat_tag", scope: !41, file: !39, line: 2356, size: 8, flags: DIFlagFwdDecl, identifier: ".?AU_String_constructor_concat_tag@std@@")
!500 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 2945, type: !501, scopeLine: 2945, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!501 = !DISubroutineType(types: !502)
!502 = !{null, !453, !499, !503, !503}
!503 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !40, size: 64)
!504 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@$$QEAV01@@Z", scope: !40, file: !39, line: 3097, type: !505, scopeLine: 3097, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!505 = !DISubroutineType(types: !506)
!506 = !{!503, !453, !492}
!507 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@$$QEAV12@@Z", scope: !40, file: !39, line: 3125, type: !505, scopeLine: 3125, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!508 = !DISubprogram(name: "_Memcpy_val_from", linkageName: "?_Memcpy_val_from@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !40, file: !39, line: 3131, type: !458, scopeLine: 3131, flags: DIFlagPrototyped, spFlags: 0)
!509 = !DISubprogram(name: "_Take_contents", linkageName: "?_Take_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@@Z", scope: !40, file: !39, line: 3140, type: !510, scopeLine: 3140, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DISubroutineType(types: !511)
!511 = !{null, !453, !503}
!512 = !DISubprogram(name: "basic_string", scope: !40, file: !39, line: 3221, type: !513, scopeLine: 3221, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!513 = !DISubroutineType(types: !514)
!514 = !{null, !453, !515, !107}
!515 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char>", scope: !41, file: !516, line: 22, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AV?$initializer_list@D@std@@")
!516 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\initializer_list", directory: "", checksumkind: CSK_MD5, checksum: "a82d88d6485cf51fbfb88cdc5da77b27")
!517 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z", scope: !40, file: !39, line: 3230, type: !518, scopeLine: 3230, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!518 = !DISubroutineType(types: !519)
!519 = !{!503, !453, !515}
!520 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z", scope: !40, file: !39, line: 3234, type: !518, scopeLine: 3234, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!521 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z", scope: !40, file: !39, line: 3238, type: !518, scopeLine: 3238, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!522 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z", scope: !40, file: !39, line: 3242, type: !518, scopeLine: 3242, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!523 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$initializer_list@D@2@@Z", scope: !40, file: !39, line: 3246, type: !524, scopeLine: 3246, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!524 = !DISubroutineType(types: !525)
!525 = !{!415, !453, !526, !527}
!526 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !417)
!527 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !515)
!528 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0V?$initializer_list@D@2@@Z", scope: !40, file: !39, line: 3255, type: !529, scopeLine: 3255, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!529 = !DISubroutineType(types: !530)
!530 = !{!503, !453, !526, !526, !527}
!531 = !DISubprogram(name: "~basic_string", scope: !40, file: !39, line: 3267, type: !451, scopeLine: 3267, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!532 = !DISubprogram(name: "_Copy_assign_val_from_small", linkageName: "?_Copy_assign_val_from_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z", scope: !40, file: !39, line: 3280, type: !458, scopeLine: 3280, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z", scope: !40, file: !39, line: 3302, type: !534, scopeLine: 3302, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!534 = !DISubroutineType(types: !535)
!535 = !{!503, !453, !460}
!536 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !40, file: !39, line: 3354, type: !537, scopeLine: 3354, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!537 = !DISubroutineType(types: !538)
!538 = !{!503, !453, !322}
!539 = !DISubprogram(name: "operator=", linkageName: "??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z", scope: !40, file: !39, line: 3362, type: !540, scopeLine: 3362, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!540 = !DISubroutineType(types: !541)
!541 = !{!503, !453, !4}
!542 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z", scope: !40, file: !39, line: 3371, type: !534, scopeLine: 3371, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!543 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z", scope: !40, file: !39, line: 3382, type: !537, scopeLine: 3382, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!544 = !DISubprogram(name: "operator+=", linkageName: "??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z", scope: !40, file: !39, line: 3386, type: !545, scopeLine: 3386, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!545 = !DISubroutineType(types: !546)
!546 = !{!503, !453, !5}
!547 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z", scope: !40, file: !39, line: 3391, type: !534, scopeLine: 3391, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!548 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z", scope: !40, file: !39, line: 3395, type: !549, scopeLine: 3395, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!549 = !DISubroutineType(types: !550)
!550 = !{!503, !453, !460, !430, !406}
!551 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !40, file: !39, line: 3418, type: !552, scopeLine: 3418, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!552 = !DISubroutineType(types: !553)
!553 = !{!503, !453, !322, !430}
!554 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !40, file: !39, line: 3442, type: !537, scopeLine: 3442, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!555 = !DISubprogram(name: "append", linkageName: "?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z", scope: !40, file: !39, line: 3446, type: !556, scopeLine: 3446, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!556 = !DISubroutineType(types: !557)
!557 = !{!503, !453, !430, !4}
!558 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z", scope: !40, file: !39, line: 3496, type: !534, scopeLine: 3496, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!559 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z", scope: !40, file: !39, line: 3501, type: !549, scopeLine: 3501, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!560 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z", scope: !40, file: !39, line: 3524, type: !552, scopeLine: 3524, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!561 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z", scope: !40, file: !39, line: 3545, type: !537, scopeLine: 3545, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!562 = !DISubprogram(name: "assign", linkageName: "?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z", scope: !40, file: !39, line: 3549, type: !556, scopeLine: 3549, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!563 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@@Z", scope: !40, file: !39, line: 3607, type: !564, scopeLine: 3607, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!564 = !DISubroutineType(types: !565)
!565 = !{!503, !453, !430, !460}
!566 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@0_K@Z", scope: !40, file: !39, line: 3612, type: !567, scopeLine: 3612, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!567 = !DISubroutineType(types: !568)
!568 = !{!503, !453, !430, !460, !430, !406}
!569 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD0@Z", scope: !40, file: !39, line: 3637, type: !570, scopeLine: 3637, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!570 = !DISubroutineType(types: !571)
!571 = !{!503, !453, !430, !322, !430}
!572 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD@Z", scope: !40, file: !39, line: 3686, type: !573, scopeLine: 3686, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!573 = !DISubroutineType(types: !574)
!574 = !{!503, !453, !430, !322}
!575 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0D@Z", scope: !40, file: !39, line: 3691, type: !576, scopeLine: 3691, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!576 = !DISubroutineType(types: !577)
!577 = !{!503, !453, !430, !430, !4}
!578 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@D@Z", scope: !40, file: !39, line: 3717, type: !579, scopeLine: 3717, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!579 = !DISubroutineType(types: !580)
!580 = !{!415, !453, !526, !4}
!581 = !DISubprogram(name: "insert", linkageName: "?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@_KD@Z", scope: !40, file: !39, line: 3726, type: !582, scopeLine: 3726, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!582 = !DISubroutineType(types: !583)
!583 = !{!415, !453, !526, !430, !4}
!584 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K@Z", scope: !40, file: !39, line: 3777, type: !585, scopeLine: 3777, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!585 = !DISubroutineType(types: !586)
!586 = !{!503, !453, !430}
!587 = !DISubprogram(name: "_Erase_noexcept", linkageName: "?_Erase_noexcept@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV12@_K_K@Z", scope: !40, file: !39, line: 3784, type: !588, scopeLine: 3784, flags: DIFlagPrototyped, spFlags: 0)
!588 = !DISubroutineType(types: !589)
!589 = !{!503, !453, !430, !406}
!590 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0@Z", scope: !40, file: !39, line: 3797, type: !591, scopeLine: 3797, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!591 = !DISubroutineType(types: !592)
!592 = !{!503, !453, !430, !430}
!593 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@@Z", scope: !40, file: !39, line: 3803, type: !594, scopeLine: 3803, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!594 = !DISubroutineType(types: !595)
!595 = !{!415, !453, !526}
!596 = !DISubprogram(name: "erase", linkageName: "?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0@Z", scope: !40, file: !39, line: 3812, type: !597, scopeLine: 3812, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!597 = !DISubroutineType(types: !598)
!598 = !{!415, !453, !526, !526}
!599 = !DISubprogram(name: "clear", linkageName: "?clear@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !40, file: !39, line: 3823, type: !451, scopeLine: 3823, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!600 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0AEBV12@@Z", scope: !40, file: !39, line: 3827, type: !601, scopeLine: 3827, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!601 = !DISubroutineType(types: !602)
!602 = !{!503, !453, !430, !430, !460}
!603 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KAEBV12@01@Z", scope: !40, file: !39, line: 3832, type: !604, scopeLine: 3832, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!604 = !DISubroutineType(types: !605)
!605 = !{!503, !453, !430, !406, !460, !430, !406}
!606 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KQEBD0@Z", scope: !40, file: !39, line: 3857, type: !607, scopeLine: 3857, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!607 = !DISubroutineType(types: !608)
!608 = !{!503, !453, !430, !406, !322, !430}
!609 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0QEBD@Z", scope: !40, file: !39, line: 3925, type: !610, scopeLine: 3925, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!610 = !DISubroutineType(types: !611)
!611 = !{!503, !453, !430, !430, !322}
!612 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_K0D@Z", scope: !40, file: !39, line: 3930, type: !613, scopeLine: 3930, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!503, !453, !430, !406, !430, !4}
!615 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0AEBV12@@Z", scope: !40, file: !39, line: 3962, type: !616, scopeLine: 3962, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!616 = !DISubroutineType(types: !617)
!617 = !{!503, !453, !526, !526, !460}
!618 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD_K@Z", scope: !40, file: !39, line: 3987, type: !619, scopeLine: 3987, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!619 = !DISubroutineType(types: !620)
!620 = !{!503, !453, !526, !526, !322, !430}
!621 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD@Z", scope: !40, file: !39, line: 3998, type: !622, scopeLine: 3998, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!622 = !DISubroutineType(types: !623)
!623 = !{!503, !453, !526, !526, !322}
!624 = !DISubprogram(name: "replace", linkageName: "?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0_KD@Z", scope: !40, file: !39, line: 4009, type: !625, scopeLine: 4009, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!625 = !DISubroutineType(types: !626)
!626 = !{!503, !453, !526, !526, !430, !4}
!627 = !DISubprogram(name: "begin", linkageName: "?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4061, type: !628, scopeLine: 4061, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!628 = !DISubroutineType(types: !629)
!629 = !{!415, !453}
!630 = !DISubprogram(name: "begin", linkageName: "?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4065, type: !631, scopeLine: 4065, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!631 = !DISubroutineType(types: !632)
!632 = !{!417, !633}
!633 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !461, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!634 = !DISubprogram(name: "end", linkageName: "?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4069, type: !628, scopeLine: 4069, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!635 = !DISubprogram(name: "end", linkageName: "?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4075, type: !631, scopeLine: 4075, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!636 = !DISubprogram(name: "_Unchecked_begin", linkageName: "?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ", scope: !40, file: !39, line: 4081, type: !637, scopeLine: 4081, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!637 = !DISubroutineType(types: !638)
!638 = !{!55, !453}
!639 = !DISubprogram(name: "_Unchecked_begin", linkageName: "?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !40, file: !39, line: 4085, type: !640, scopeLine: 4085, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!640 = !DISubroutineType(types: !641)
!641 = !{!57, !633}
!642 = !DISubprogram(name: "_Unchecked_end", linkageName: "?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ", scope: !40, file: !39, line: 4089, type: !637, scopeLine: 4089, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!643 = !DISubprogram(name: "_Unchecked_end", linkageName: "?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !40, file: !39, line: 4093, type: !640, scopeLine: 4093, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!644 = !DISubprogram(name: "rbegin", linkageName: "?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4097, type: !645, scopeLine: 4097, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!645 = !DISubroutineType(types: !646)
!646 = !{!419, !453}
!647 = !DISubprogram(name: "rbegin", linkageName: "?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4101, type: !648, scopeLine: 4101, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!648 = !DISubroutineType(types: !649)
!649 = !{!422, !633}
!650 = !DISubprogram(name: "rend", linkageName: "?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4105, type: !645, scopeLine: 4105, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!651 = !DISubprogram(name: "rend", linkageName: "?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4109, type: !648, scopeLine: 4109, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!652 = !DISubprogram(name: "cbegin", linkageName: "?cbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4113, type: !631, scopeLine: 4113, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!653 = !DISubprogram(name: "cend", linkageName: "?cend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4117, type: !631, scopeLine: 4117, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!654 = !DISubprogram(name: "crbegin", linkageName: "?crbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4121, type: !648, scopeLine: 4121, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!655 = !DISubprogram(name: "crend", linkageName: "?crend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ", scope: !40, file: !39, line: 4125, type: !648, scopeLine: 4125, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!656 = !DISubprogram(name: "shrink_to_fit", linkageName: "?shrink_to_fit@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !40, file: !39, line: 4129, type: !451, scopeLine: 4129, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!657 = !DISubprogram(name: "at", linkageName: "?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z", scope: !40, file: !39, line: 4162, type: !658, scopeLine: 4162, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!658 = !DISubroutineType(types: !659)
!659 = !{!410, !453, !430}
!660 = !DISubprogram(name: "at", linkageName: "?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z", scope: !40, file: !39, line: 4167, type: !661, scopeLine: 4167, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!661 = !DISubroutineType(types: !662)
!662 = !{!412, !633, !430}
!663 = !DISubprogram(name: "operator[]", linkageName: "??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z", scope: !40, file: !39, line: 4172, type: !658, scopeLine: 4172, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!664 = !DISubprogram(name: "operator[]", linkageName: "??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z", scope: !40, file: !39, line: 4179, type: !661, scopeLine: 4179, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!665 = !DISubprogram(name: "push_back", linkageName: "?push_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXD@Z", scope: !40, file: !39, line: 4194, type: !666, scopeLine: 4194, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!666 = !DISubroutineType(types: !667)
!667 = !{null, !453, !4}
!668 = !DISubprogram(name: "pop_back", linkageName: "?pop_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !40, file: !39, line: 4215, type: !451, scopeLine: 4215, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!669 = !DISubprogram(name: "front", linkageName: "?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ", scope: !40, file: !39, line: 4223, type: !670, scopeLine: 4223, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!670 = !DISubroutineType(types: !671)
!671 = !{!410, !453}
!672 = !DISubprogram(name: "front", linkageName: "?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ", scope: !40, file: !39, line: 4231, type: !673, scopeLine: 4231, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!673 = !DISubroutineType(types: !674)
!674 = !{!412, !633}
!675 = !DISubprogram(name: "back", linkageName: "?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ", scope: !40, file: !39, line: 4239, type: !670, scopeLine: 4239, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!676 = !DISubprogram(name: "back", linkageName: "?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ", scope: !40, file: !39, line: 4247, type: !673, scopeLine: 4247, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!677 = !DISubprogram(name: "c_str", linkageName: "?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !40, file: !39, line: 4255, type: !640, scopeLine: 4255, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!678 = !DISubprogram(name: "data", linkageName: "?data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !40, file: !39, line: 4259, type: !640, scopeLine: 4259, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!679 = !DISubprogram(name: "length", linkageName: "?length@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !40, file: !39, line: 4269, type: !680, scopeLine: 4269, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!680 = !DISubroutineType(types: !681)
!681 = !{!406, !633}
!682 = !DISubprogram(name: "size", linkageName: "?size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !40, file: !39, line: 4273, type: !680, scopeLine: 4273, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!683 = !DISubprogram(name: "max_size", linkageName: "?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !40, file: !39, line: 4277, type: !680, scopeLine: 4277, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!684 = !DISubprogram(name: "resize", linkageName: "?resize@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_KD@Z", scope: !40, file: !39, line: 4286, type: !484, scopeLine: 4286, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!685 = !DISubprogram(name: "capacity", linkageName: "?capacity@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !40, file: !39, line: 4316, type: !680, scopeLine: 4316, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!686 = !DISubprogram(name: "reserve", linkageName: "?reserve@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_K@Z", scope: !40, file: !39, line: 4342, type: !687, scopeLine: 4342, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!687 = !DISubroutineType(types: !688)
!688 = !{null, !453, !430}
!689 = !DISubprogram(name: "empty", linkageName: "?empty@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NXZ", scope: !40, file: !39, line: 4372, type: !690, scopeLine: 4372, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!690 = !DISubroutineType(types: !691)
!691 = !{!77, !633}
!692 = !DISubprogram(name: "copy", linkageName: "?copy@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K@Z", scope: !40, file: !39, line: 4376, type: !693, scopeLine: 4376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!693 = !DISubroutineType(types: !694)
!694 = !{!406, !633, !116, !406, !430}
!695 = !DISubprogram(name: "_Copy_s", linkageName: "?_Copy_s@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K1@Z", scope: !40, file: !39, line: 4386, type: !696, scopeLine: 4386, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!696 = !DISubroutineType(types: !697)
!697 = !{!406, !633, !116, !430, !406, !430}
!698 = !DISubprogram(name: "_Swap_bx_large_with_small", linkageName: "?_Swap_bx_large_with_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@SAXAEAV?$_String_val@U?$_Simple_types@D@std@@@2@0@Z", scope: !40, file: !39, line: 4395, type: !699, scopeLine: 4395, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!699 = !DISubroutineType(types: !700)
!700 = !{null, !701, !701}
!701 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !194, size: 64)
!702 = !DISubprogram(name: "_Swap_data", linkageName: "?_Swap_data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@@Z", scope: !40, file: !39, line: 4404, type: !510, scopeLine: 4404, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!703 = !DISubprogram(name: "swap", linkageName: "?swap@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@@Z", scope: !40, file: !39, line: 4475, type: !510, scopeLine: 4475, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!704 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !40, file: !39, line: 4509, type: !705, scopeLine: 4509, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!705 = !DISubroutineType(types: !706)
!706 = !{!406, !633, !460, !430}
!707 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !40, file: !39, line: 4515, type: !708, scopeLine: 4515, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!708 = !DISubroutineType(types: !709)
!709 = !{!406, !633, !322, !430, !430}
!710 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !40, file: !39, line: 4522, type: !711, scopeLine: 4522, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!711 = !DISubroutineType(types: !712)
!712 = !{!406, !633, !322, !430}
!713 = !DISubprogram(name: "find", linkageName: "?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !40, file: !39, line: 4529, type: !714, scopeLine: 4529, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!714 = !DISubroutineType(types: !715)
!715 = !{!406, !633, !4, !430}
!716 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !40, file: !39, line: 4546, type: !705, scopeLine: 4546, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!717 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !40, file: !39, line: 4552, type: !708, scopeLine: 4552, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!718 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !40, file: !39, line: 4559, type: !711, scopeLine: 4559, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!719 = !DISubprogram(name: "rfind", linkageName: "?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !40, file: !39, line: 4566, type: !714, scopeLine: 4566, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!720 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !40, file: !39, line: 4583, type: !705, scopeLine: 4583, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!721 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !40, file: !39, line: 4590, type: !708, scopeLine: 4590, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!722 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !40, file: !39, line: 4597, type: !711, scopeLine: 4597, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!723 = !DISubprogram(name: "find_first_of", linkageName: "?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !40, file: !39, line: 4604, type: !714, scopeLine: 4604, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!724 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !40, file: !39, line: 4621, type: !725, scopeLine: 4621, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!725 = !DISubroutineType(types: !726)
!726 = !{!406, !633, !460, !406}
!727 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !40, file: !39, line: 4627, type: !708, scopeLine: 4627, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!728 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !40, file: !39, line: 4634, type: !711, scopeLine: 4634, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!729 = !DISubprogram(name: "find_last_of", linkageName: "?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !40, file: !39, line: 4641, type: !714, scopeLine: 4641, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!730 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !40, file: !39, line: 4658, type: !705, scopeLine: 4658, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!731 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !40, file: !39, line: 4665, type: !708, scopeLine: 4665, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!732 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !40, file: !39, line: 4672, type: !733, scopeLine: 4672, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!733 = !DISubroutineType(types: !734)
!734 = !{!406, !633, !322, !406}
!735 = !DISubprogram(name: "find_first_not_of", linkageName: "?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !40, file: !39, line: 4679, type: !714, scopeLine: 4679, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!736 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z", scope: !40, file: !39, line: 4696, type: !705, scopeLine: 4696, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!737 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z", scope: !40, file: !39, line: 4703, type: !708, scopeLine: 4703, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!738 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z", scope: !40, file: !39, line: 4710, type: !711, scopeLine: 4710, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!739 = !DISubprogram(name: "find_last_not_of", linkageName: "?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z", scope: !40, file: !39, line: 4717, type: !714, scopeLine: 4717, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!740 = !DISubprogram(name: "substr", linkageName: "?substr@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV12@_K0@Z", scope: !40, file: !39, line: 4730, type: !741, scopeLine: 4730, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!741 = !DISubroutineType(types: !742)
!742 = !{!40, !633, !430, !430}
!743 = !DISubprogram(name: "_Equal", linkageName: "?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NAEBV12@@Z", scope: !40, file: !39, line: 4748, type: !744, scopeLine: 4748, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!744 = !DISubroutineType(types: !745)
!745 = !{!77, !633, !460}
!746 = !DISubprogram(name: "_Equal", linkageName: "?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NQEBD@Z", scope: !40, file: !39, line: 4754, type: !747, scopeLine: 4754, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!747 = !DISubroutineType(types: !748)
!748 = !{!77, !633, !322}
!749 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHAEBV12@@Z", scope: !40, file: !39, line: 4790, type: !750, scopeLine: 4790, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!750 = !DISubroutineType(types: !751)
!751 = !{!302, !633, !460}
!752 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@@Z", scope: !40, file: !39, line: 4796, type: !753, scopeLine: 4796, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!753 = !DISubroutineType(types: !754)
!754 = !{!302, !633, !406, !406, !460}
!755 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@00@Z", scope: !40, file: !39, line: 4803, type: !756, scopeLine: 4803, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!756 = !DISubroutineType(types: !757)
!757 = !{!302, !633, !430, !430, !460, !430, !430}
!758 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHQEBD@Z", scope: !40, file: !39, line: 4812, type: !759, scopeLine: 4812, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!759 = !DISubroutineType(types: !760)
!760 = !{!302, !633, !322}
!761 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD@Z", scope: !40, file: !39, line: 4817, type: !762, scopeLine: 4817, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!762 = !DISubroutineType(types: !763)
!763 = !{!302, !633, !430, !430, !322}
!764 = !DISubprogram(name: "compare", linkageName: "?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD0@Z", scope: !40, file: !39, line: 4825, type: !765, scopeLine: 4825, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!765 = !DISubroutineType(types: !766)
!766 = !{!302, !633, !430, !430, !322, !430}
!767 = !DISubprogram(name: "get_allocator", linkageName: "?get_allocator@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$allocator@D@2@XZ", scope: !40, file: !39, line: 4873, type: !768, scopeLine: 4873, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!768 = !DISubroutineType(types: !769)
!769 = !{!404, !633}
!770 = !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z", scope: !40, file: !39, line: 4878, type: !771, scopeLine: 4878, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!771 = !DISubroutineType(types: !772)
!772 = !{!406, !430, !430, !430}
!773 = !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z", scope: !40, file: !39, line: 4892, type: !774, scopeLine: 4892, flags: DIFlagPrototyped, spFlags: 0)
!774 = !DISubroutineType(types: !775)
!775 = !{!406, !633, !430}
!776 = !DISubprogram(name: "_Become_small", linkageName: "?_Become_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !40, file: !39, line: 4970, type: !451, scopeLine: 4970, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DISubprogram(name: "_Eos", linkageName: "?_Eos@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAX_K@Z", scope: !40, file: !39, line: 4988, type: !687, scopeLine: 4988, flags: DIFlagPrototyped, spFlags: 0)
!778 = !DISubprogram(name: "_Tidy_init", linkageName: "?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !40, file: !39, line: 4993, type: !451, scopeLine: 4993, flags: DIFlagPrototyped, spFlags: 0)
!779 = !DISubprogram(name: "_Tidy_deallocate", linkageName: "?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !40, file: !39, line: 5004, type: !451, scopeLine: 5004, flags: DIFlagPrototyped, spFlags: 0)
!780 = !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ", scope: !40, file: !39, line: 5023, type: !451, scopeLine: 5023, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!781 = !DISubprogram(name: "_Swap_proxy_and_iterators", linkageName: "?_Swap_proxy_and_iterators@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@@Z", scope: !40, file: !39, line: 5028, type: !510, scopeLine: 5028, flags: DIFlagPrototyped, spFlags: 0)
!782 = !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ", scope: !40, file: !39, line: 5032, type: !783, scopeLine: 5032, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DISubroutineType(types: !784)
!784 = !{!785, !453}
!785 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !43, size: 64)
!786 = !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ", scope: !40, file: !39, line: 5036, type: !787, scopeLine: 5036, flags: DIFlagPrototyped, spFlags: 0)
!787 = !DISubroutineType(types: !788)
!788 = !{!789, !633}
!789 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !790, size: 64)
!790 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !43)
!791 = !{!364, !792, !793}
!792 = !DITemplateTypeParameter(name: "_Traits", type: !292, defaulted: true)
!793 = !DITemplateTypeParameter(name: "_Alloc", type: !50, defaulted: true)
!794 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !795, line: 22, baseType: !796)
!795 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "56e2956fe219a08d408dc2fb7a857cfc")
!796 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!797 = !{!798, !799, !800}
!798 = !DIEnumerator(name: "_From_char", value: 0, isUnsigned: true)
!799 = !DIEnumerator(name: "_From_ptr", value: 1, isUnsigned: true)
!800 = !DIEnumerator(name: "_From_string", value: 2, isUnsigned: true)
!801 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "float_denorm_style", scope: !41, file: !802, line: 38, baseType: !302, size: 32, elements: !803, identifier: ".?AW4float_denorm_style@std@@")
!802 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\limits", directory: "", checksumkind: CSK_MD5, checksum: "c20bc37b86bf3e08e4dbd470ea23115b")
!803 = !{!804, !805, !806}
!804 = !DIEnumerator(name: "denorm_indeterminate", value: -1)
!805 = !DIEnumerator(name: "denorm_absent", value: 0)
!806 = !DIEnumerator(name: "denorm_present", value: 1)
!807 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "float_round_style", scope: !41, file: !802, line: 44, baseType: !302, size: 32, elements: !808, identifier: ".?AW4float_round_style@std@@")
!808 = !{!809, !810, !811, !812, !813}
!809 = !DIEnumerator(name: "round_indeterminate", value: -1)
!810 = !DIEnumerator(name: "round_toward_zero", value: 0)
!811 = !DIEnumerator(name: "round_to_nearest", value: 1)
!812 = !DIEnumerator(name: "round_toward_infinity", value: 2)
!813 = !DIEnumerator(name: "round_toward_neg_infinity", value: 3)
!814 = !{!815, !816, !137, !63, !55, !818, !50, !40, !195, !821, !432, !244, !827, !842}
!815 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !816, size: 64)
!816 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !817, line: 61, baseType: !35)
!817 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\vadefs.h", directory: "", checksumkind: CSK_MD5, checksum: "a4b8f96637d0704c82f39ecb6bde2ab4")
!818 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !819, size: 64)
!819 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !820)
!820 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: null)
!821 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Zero_then_variadic_args_t", scope: !41, file: !45, line: 1358, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !822, identifier: ".?AU_Zero_then_variadic_args_t@std@@")
!822 = !{!823}
!823 = !DISubprogram(name: "_Zero_then_variadic_args_t", scope: !821, file: !45, line: 1359, type: !824, scopeLine: 1359, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!824 = !DISubroutineType(types: !825)
!825 = !{null, !826}
!826 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !821, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!827 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Fake_proxy_ptr_impl", scope: !41, file: !45, line: 1291, size: 8, align: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !828, identifier: ".?AU_Fake_proxy_ptr_impl@std@@")
!828 = !{!829, !835, !839, !848, !853, !857}
!829 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !827, file: !45, line: 1292, type: !830, scopeLine: 1292, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!830 = !DISubroutineType(types: !831)
!831 = !{null, !832, !833}
!832 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !827, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!833 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !834, size: 64)
!834 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !827)
!835 = !DISubprogram(name: "operator=", linkageName: "??4_Fake_proxy_ptr_impl@std@@QEAAAEAU01@AEBU01@@Z", scope: !827, file: !45, line: 1293, type: !836, scopeLine: 1293, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!836 = !DISubroutineType(types: !837)
!837 = !{!838, !832, !833}
!838 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !827, size: 64)
!839 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !827, file: !45, line: 1294, type: !840, scopeLine: 1294, flags: DIFlagPrototyped, spFlags: 0)
!840 = !DISubroutineType(types: !841)
!841 = !{null, !832, !212, !842}
!842 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Leave_proxy_unbound", scope: !41, file: !45, line: 1287, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !843, identifier: ".?AU_Leave_proxy_unbound@std@@")
!843 = !{!844}
!844 = !DISubprogram(name: "_Leave_proxy_unbound", scope: !842, file: !45, line: 1288, type: !845, scopeLine: 1288, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!845 = !DISubroutineType(types: !846)
!846 = !{null, !847}
!847 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !842, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!848 = !DISubprogram(name: "_Fake_proxy_ptr_impl", scope: !827, file: !45, line: 1295, type: !849, scopeLine: 1295, flags: DIFlagPrototyped, spFlags: 0)
!849 = !DISubroutineType(types: !850)
!850 = !{null, !832, !212, !851}
!851 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !852, size: 64)
!852 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !199)
!853 = !DISubprogram(name: "_Bind", linkageName: "?_Bind@_Fake_proxy_ptr_impl@std@@QEAAXAEBU_Fake_allocator@2@PEAU_Container_base0@2@@Z", scope: !827, file: !45, line: 1297, type: !854, scopeLine: 1297, flags: DIFlagPrototyped, spFlags: 0)
!854 = !DISubroutineType(types: !855)
!855 = !{null, !832, !212, !856}
!856 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!857 = !DISubprogram(name: "_Release", linkageName: "?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ", scope: !827, file: !45, line: 1298, type: !858, scopeLine: 1298, flags: DIFlagPrototyped, spFlags: 0)
!858 = !DISubroutineType(types: !859)
!859 = !{null, !832}
!860 = !{!0, !8, !10, !15, !17, !22, !24, !26, !28, !861, !863, !865, !868, !870, !872, !878}
!861 = !DIGlobalVariableExpression(var: !862, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!862 = distinct !DIGlobalVariable(name: "_Big_allocation_threshold", scope: !41, file: !45, line: 105, type: !91, isLocal: true, isDefinition: true)
!863 = !DIGlobalVariableExpression(var: !864, expr: !DIExpression(DW_OP_constu, 39, DW_OP_stack_value))
!864 = distinct !DIGlobalVariable(name: "_Non_user_size", scope: !41, file: !45, line: 117, type: !91, isLocal: true, isDefinition: true)
!865 = !DIGlobalVariableExpression(var: !866, expr: !DIExpression())
!866 = distinct !DIGlobalVariable(scope: null, file: !39, line: 2367, type: !867, isLocal: true, isDefinition: true)
!867 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !248)
!868 = !DIGlobalVariableExpression(var: !869, expr: !DIExpression())
!869 = distinct !DIGlobalVariable(name: "_Fake_alloc", linkageName: "?_Fake_alloc@std@@3U_Fake_allocator@1@B", scope: !41, file: !45, line: 1348, type: !213, isLocal: true, isDefinition: true)
!870 = !DIGlobalVariableExpression(var: !871, expr: !DIExpression(DW_OP_constu, 32, DW_OP_stack_value))
!871 = distinct !DIGlobalVariable(name: "_Big_allocation_alignment", scope: !41, file: !45, line: 106, type: !91, isLocal: true, isDefinition: true)
!872 = !DIGlobalVariableExpression(var: !873, expr: !DIExpression())
!873 = distinct !DIGlobalVariable(scope: null, file: !874, line: 140, type: !875, isLocal: true, isDefinition: true)
!874 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\vcruntime_exception.h", directory: "", checksumkind: CSK_MD5, checksum: "aa62b99a88eea7594b2d8954526d3841")
!875 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !876)
!876 = !{!877}
!877 = !DISubrange(count: 21)
!878 = !DIGlobalVariableExpression(var: !879, expr: !DIExpression())
!879 = distinct !DIGlobalVariable(scope: null, file: !874, line: 95, type: !880, isLocal: true, isDefinition: true)
!880 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !881)
!881 = !{!882}
!882 = !DISubrange(count: 18)
!883 = !{!884, !886, !889, !892, !896, !901, !905, !907, !909, !911, !913, !918, !922, !926, !931, !935, !939, !943, !947, !949, !954, !960, !964, !968, !970, !974, !978, !980, !984, !988, !992, !994, !998, !1000, !1002, !1006, !1010, !1014, !1018, !1022, !1026, !1028, !1033, !1037, !1041, !1046, !1050, !1052, !1054, !1058, !1060, !1065, !1070, !1074, !1076, !1078, !1083, !1088, !1090, !1092, !1094, !1098, !1102, !1106, !1110, !1114, !1116, !1120, !1122, !1124, !1126, !1128, !1132, !1134, !1135, !1136, !1139, !1141, !1146, !1150, !1156, !1160, !1166, !1170, !1175, !1177, !1179, !1183, !1188, !1192, !1197, !1203, !1205, !1209, !1214, !1218, !1222, !1226, !1230, !1234, !1238, !1242, !1244, !1249, !1255, !1260, !1264, !1268, !1270, !1272, !1276, !1280, !1284, !1288, !1290, !1292, !1294, !1296, !1301, !1305, !1307, !1309, !1313, !1317, !1321, !1323, !1325, !1327, !1329, !1335, !1337, !1341, !1343, !1348, !1353, !1357, !1361, !1365, !1367, !1368, !1370, !1372, !1376, !1382, !1384, !1388, !1393, !1397, !1399, !1403, !1412, !1417, !1427, !1431, !1435, !1439, !1443, !1447, !1451, !1455, !1459, !1463, !1465, !1469, !1474, !1479, !1483, !1487, !1491, !1495, !1496, !1500, !1502, !1506, !1510, !1514, !1518, !1522, !1526, !1530, !1532, !1534, !1536, !1540, !1543, !1545, !1547, !1548, !1550, !1552, !1554, !1556, !1558, !1560, !1562, !1564, !1566, !1568, !1570, !1572, !1574, !1576, !1578, !1580, !1582, !1584, !1586, !1588, !1590, !1592, !1593, !1595, !1596, !1597, !1598, !1599, !1600, !1601, !1602, !1603, !1604, !1605, !1606, !1607, !1608, !1609, !1610, !1611, !1612, !1613, !1614, !1615, !1616, !1617, !1618, !1619, !1620, !1621, !1622, !1624, !1625, !1629, !1634, !1635, !1638, !1643, !1644, !1648, !1650, !1652, !1654, !1656, !1658, !1660, !1662, !1664, !1666, !1668, !1670, !1672}
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !310, file: !885, line: 37)
!885 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\cstdio", directory: "", checksumkind: CSK_MD5, checksum: "3cbd22e78b41fc5ebf64ee900b20f236")
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !887, file: !885, line: 39)
!887 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !888, line: 193, baseType: !35)
!888 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\vcruntime.h", directory: "", checksumkind: CSK_MD5, checksum: "39da3a8c8438e40538f3964bd55ef6b8")
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !890, file: !885, line: 40)
!890 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !891, line: 73, baseType: !68)
!891 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c1a1fbc43e7d45f0ea4ae539ddcffb19")
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !893, file: !885, line: 41)
!893 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !894, line: 31, baseType: !895)
!894 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_wstdio.h", directory: "", checksumkind: CSK_MD5, checksum: "bf50373b435d0afd0235dd3e05c4a277")
!895 = !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !894, line: 28, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_iobuf@@")
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !897, file: !885, line: 42)
!897 = !DISubprogram(name: "clearerr", scope: !891, file: !891, line: 146, type: !898, flags: DIFlagPrototyped, spFlags: 0)
!898 = !DISubroutineType(types: !899)
!899 = !{null, !900}
!900 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !893, size: 64)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !902, file: !885, line: 43)
!902 = !DISubprogram(name: "fclose", scope: !891, file: !891, line: 152, type: !903, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DISubroutineType(types: !904)
!904 = !{!302, !900}
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !906, file: !885, line: 44)
!906 = !DISubprogram(name: "feof", scope: !891, file: !891, line: 166, type: !903, flags: DIFlagPrototyped, spFlags: 0)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !908, file: !885, line: 45)
!908 = !DISubprogram(name: "ferror", scope: !891, file: !891, line: 171, type: !903, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !910, file: !885, line: 46)
!910 = !DISubprogram(name: "fflush", scope: !891, file: !891, line: 176, type: !903, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !912, file: !885, line: 47)
!912 = !DISubprogram(name: "fgetc", scope: !891, file: !891, line: 182, type: !903, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !914, file: !885, line: 48)
!914 = !DISubprogram(name: "fgetpos", scope: !891, file: !891, line: 191, type: !915, flags: DIFlagPrototyped, spFlags: 0)
!915 = !DISubroutineType(types: !916)
!916 = !{!302, !900, !917}
!917 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !890, size: 64)
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !919, file: !885, line: 49)
!919 = !DISubprogram(name: "fgets", scope: !891, file: !891, line: 198, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!920 = !DISubroutineType(types: !921)
!921 = !{!55, !55, !302, !900}
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !923, file: !885, line: 50)
!923 = !DISubprogram(name: "fopen", scope: !891, file: !891, line: 213, type: !924, flags: DIFlagPrototyped, spFlags: 0)
!924 = !DISubroutineType(types: !925)
!925 = !{!900, !57, !57}
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !927, file: !885, line: 51)
!927 = !DISubprogram(name: "fprintf", scope: !891, file: !891, line: 830, type: !928, flags: DIFlagPrototyped, spFlags: 0)
!928 = !DISubroutineType(types: !929)
!929 = !{!302, !930, !322, null}
!930 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !900)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !932, file: !885, line: 52)
!932 = !DISubprogram(name: "fputc", scope: !891, file: !891, line: 221, type: !933, flags: DIFlagPrototyped, spFlags: 0)
!933 = !DISubroutineType(types: !934)
!934 = !{!302, !302, !900}
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !936, file: !885, line: 53)
!936 = !DISubprogram(name: "fputs", scope: !891, file: !891, line: 233, type: !937, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DISubroutineType(types: !938)
!938 = !{!302, !57, !900}
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !940, file: !885, line: 54)
!940 = !DISubprogram(name: "fread", scope: !891, file: !891, line: 239, type: !941, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DISubroutineType(types: !942)
!942 = !{!887, !137, !887, !887, !900}
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !944, file: !885, line: 55)
!944 = !DISubprogram(name: "freopen", scope: !891, file: !891, line: 248, type: !945, flags: DIFlagPrototyped, spFlags: 0)
!945 = !DISubroutineType(types: !946)
!946 = !{!900, !57, !57, !900}
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !948, file: !885, line: 56)
!948 = !DISubprogram(name: "fscanf", scope: !891, file: !891, line: 1199, type: !928, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !950, file: !885, line: 57)
!950 = !DISubprogram(name: "fseek", scope: !891, file: !891, line: 270, type: !951, flags: DIFlagPrototyped, spFlags: 0)
!951 = !DISubroutineType(types: !952)
!952 = !{!302, !900, !953, !302}
!953 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !955, file: !885, line: 58)
!955 = !DISubprogram(name: "fsetpos", scope: !891, file: !891, line: 263, type: !956, flags: DIFlagPrototyped, spFlags: 0)
!956 = !DISubroutineType(types: !957)
!957 = !{!302, !900, !958}
!958 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !959, size: 64)
!959 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !890)
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !961, file: !885, line: 59)
!961 = !DISubprogram(name: "ftell", scope: !891, file: !891, line: 286, type: !962, flags: DIFlagPrototyped, spFlags: 0)
!962 = !DISubroutineType(types: !963)
!963 = !{!953, !900}
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !965, file: !885, line: 60)
!965 = !DISubprogram(name: "fwrite", scope: !891, file: !891, line: 297, type: !966, flags: DIFlagPrototyped, spFlags: 0)
!966 = !DISubroutineType(types: !967)
!967 = !{!887, !123, !887, !887, !900}
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !969, file: !885, line: 61)
!969 = !DISubprogram(name: "getc", scope: !891, file: !891, line: 306, type: !903, flags: DIFlagPrototyped, spFlags: 0)
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !971, file: !885, line: 62)
!971 = !DISubprogram(name: "getchar", scope: !891, file: !891, line: 311, type: !972, flags: DIFlagPrototyped, spFlags: 0)
!972 = !DISubroutineType(types: !973)
!973 = !{!302}
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !975, file: !885, line: 63)
!975 = !DISubprogram(name: "perror", scope: !891, file: !891, line: 325, type: !976, flags: DIFlagPrototyped, spFlags: 0)
!976 = !DISubroutineType(types: !977)
!977 = !{null, !57}
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !979, file: !885, line: 64)
!979 = !DISubprogram(name: "putc", scope: !891, file: !891, line: 347, type: !933, flags: DIFlagPrototyped, spFlags: 0)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !981, file: !885, line: 65)
!981 = !DISubprogram(name: "putchar", scope: !891, file: !891, line: 353, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!982 = !DISubroutineType(types: !983)
!983 = !{!302, !302}
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !985, file: !885, line: 66)
!985 = distinct !DISubprogram(name: "printf", scope: !891, file: !891, line: 950, type: !986, scopeLine: 956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, retainedNodes: !215)
!986 = !DISubroutineType(types: !987)
!987 = !{!302, !322, null}
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !989, file: !885, line: 67)
!989 = !DISubprogram(name: "puts", scope: !891, file: !891, line: 358, type: !990, flags: DIFlagPrototyped, spFlags: 0)
!990 = !DISubroutineType(types: !991)
!991 = !{!302, !57}
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !993, file: !885, line: 68)
!993 = !DISubprogram(name: "remove", scope: !891, file: !891, line: 369, type: !990, flags: DIFlagPrototyped, spFlags: 0)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !995, file: !885, line: 69)
!995 = !DISubprogram(name: "rename", scope: !891, file: !891, line: 374, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!996 = !DISubroutineType(types: !997)
!997 = !{!302, !57, !57}
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !999, file: !885, line: 70)
!999 = !DISubprogram(name: "rewind", scope: !891, file: !891, line: 392, type: !898, flags: DIFlagPrototyped, spFlags: 0)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1001, file: !885, line: 71)
!1001 = !DISubprogram(name: "scanf", scope: !891, file: !891, line: 1276, type: !986, flags: DIFlagPrototyped, spFlags: 0)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1003, file: !885, line: 72)
!1003 = !DISubprogram(name: "setbuf", scope: !891, file: !891, line: 400, type: !1004, flags: DIFlagPrototyped, spFlags: 0)
!1004 = !DISubroutineType(types: !1005)
!1005 = !{null, !900, !55}
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1007, file: !885, line: 73)
!1007 = !DISubprogram(name: "setvbuf", scope: !891, file: !891, line: 412, type: !1008, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!302, !900, !55, !302, !887}
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1011, file: !885, line: 74)
!1011 = !DISubprogram(name: "sprintf", scope: !891, file: !891, line: 1783, type: !1012, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!302, !55, !57, null}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1015, file: !885, line: 75)
!1015 = !DISubprogram(name: "sscanf", scope: !891, file: !891, line: 2240, type: !1016, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!302, !322, !322, null}
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1019, file: !885, line: 76)
!1019 = !DISubprogram(name: "tmpfile", scope: !891, file: !891, line: 435, type: !1020, flags: DIFlagPrototyped, spFlags: 0)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!900}
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1023, file: !885, line: 77)
!1023 = !DISubprogram(name: "tmpnam", scope: !891, file: !891, line: 443, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!55, !55}
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1027, file: !885, line: 78)
!1027 = !DISubprogram(name: "ungetc", scope: !891, file: !891, line: 451, type: !933, flags: DIFlagPrototyped, spFlags: 0)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1029, file: !885, line: 79)
!1029 = !DISubprogram(name: "vfprintf", scope: !891, file: !891, line: 650, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!302, !930, !322, !1032}
!1032 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !817, line: 72, baseType: !55)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1034, file: !885, line: 80)
!1034 = !DISubprogram(name: "vprintf", scope: !891, file: !891, line: 740, type: !1035, flags: DIFlagPrototyped, spFlags: 0)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!302, !322, !1032}
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1038, file: !885, line: 81)
!1038 = !DISubprogram(name: "vsprintf", scope: !891, file: !891, line: 1783, type: !1039, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{!302, !55, !57, !1032}
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1042, file: !885, line: 83)
!1042 = !DISubprogram(name: "snprintf", scope: !891, file: !891, line: 1919, type: !1043, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!302, !116, !1045, !322, null}
!1045 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !887)
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1047, file: !885, line: 84)
!1047 = !DISubprogram(name: "vsnprintf", scope: !891, file: !891, line: 1429, type: !1048, flags: DIFlagPrototyped, spFlags: 0)
!1048 = !DISubroutineType(types: !1049)
!1049 = !{!302, !116, !1045, !322, !1032}
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1051, file: !885, line: 85)
!1051 = !DISubprogram(name: "vfscanf", scope: !891, file: !891, line: 1072, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1053, file: !885, line: 86)
!1053 = !DISubprogram(name: "vscanf", scope: !891, file: !891, line: 1136, type: !1035, flags: DIFlagPrototyped, spFlags: 0)
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1055, file: !885, line: 87)
!1055 = !DISubprogram(name: "vsscanf", scope: !891, file: !891, line: 2160, type: !1056, flags: DIFlagPrototyped, spFlags: 0)
!1056 = !DISubroutineType(types: !1057)
!1057 = !{!302, !322, !322, !1032}
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !887, file: !1059, line: 25)
!1059 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\cstring", directory: "", checksumkind: CSK_MD5, checksum: "8836d22258dd0dcd58ea9d9763256c9c")
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1061, file: !1059, line: 26)
!1061 = !DISubprogram(name: "memchr", linkageName: "?memchr@@YAPEAXPEAXH_K@Z", scope: !1062, file: !1062, line: 104, type: !1063, flags: DIFlagPrototyped, spFlags: 0)
!1062 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_memory.h", directory: "", checksumkind: CSK_MD5, checksum: "0b971aeac8757ee8ec347a03047c3b4a")
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!137, !137, !302, !887}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1066, file: !1059, line: 27)
!1066 = !DISubprogram(name: "memcmp", scope: !1067, file: !1067, line: 29, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1067 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\vcruntime_string.h", directory: "", checksumkind: CSK_MD5, checksum: "a54b085ffcc86a11803fd825bf8abeaa")
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!302, !123, !123, !887}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1071, file: !1059, line: 28)
!1071 = !DISubprogram(name: "memcpy", scope: !1067, file: !1067, line: 43, type: !1072, flags: DIFlagPrototyped, spFlags: 0)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!137, !137, !123, !887}
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1075, file: !1059, line: 29)
!1075 = !DISubprogram(name: "memmove", scope: !1067, file: !1067, line: 50, type: !1072, flags: DIFlagPrototyped, spFlags: 0)
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1077, file: !1059, line: 30)
!1077 = !DISubprogram(name: "memset", scope: !1067, file: !1067, line: 63, type: !1063, flags: DIFlagPrototyped, spFlags: 0)
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1079, file: !1059, line: 31)
!1079 = !DISubprogram(name: "strcat", scope: !1080, file: !1080, line: 91, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\string.h", directory: "", checksumkind: CSK_MD5, checksum: "9f780e8d323a4f33b8c61853c3c9471c")
!1081 = !DISubroutineType(types: !1082)
!1082 = !{!55, !55, !57}
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1084, file: !1059, line: 32)
!1084 = !DISubprogram(name: "strchr", linkageName: "?strchr@@YAPEADQEADH@Z", scope: !1080, file: !1080, line: 500, type: !1085, flags: DIFlagPrototyped, spFlags: 0)
!1085 = !DISubroutineType(types: !1086)
!1086 = !{!55, !116, !1087}
!1087 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !302)
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1089, file: !1059, line: 33)
!1089 = !DISubprogram(name: "strcmp", scope: !1080, file: !1080, line: 100, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1091, file: !1059, line: 34)
!1091 = !DISubprogram(name: "strcoll", scope: !1080, file: !1080, line: 112, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1093, file: !1059, line: 35)
!1093 = !DISubprogram(name: "strcpy", scope: !1080, file: !1080, line: 130, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1095, file: !1059, line: 36)
!1095 = !DISubprogram(name: "strcspn", scope: !1080, file: !1080, line: 137, type: !1096, flags: DIFlagPrototyped, spFlags: 0)
!1096 = !DISubroutineType(types: !1097)
!1097 = !{!887, !57, !57}
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1099, file: !1059, line: 37)
!1099 = !DISubprogram(name: "strerror", scope: !1080, file: !1080, line: 178, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!55, !302}
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1103, file: !1059, line: 38)
!1103 = !DISubprogram(name: "strlen", scope: !1080, file: !1080, line: 215, type: !1104, flags: DIFlagPrototyped, spFlags: 0)
!1104 = !DISubroutineType(types: !1105)
!1105 = !{!887, !57}
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1107, file: !1059, line: 39)
!1107 = !DISubprogram(name: "strncat", scope: !1080, file: !1080, line: 262, type: !1108, flags: DIFlagPrototyped, spFlags: 0)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{!55, !55, !57, !887}
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1111, file: !1059, line: 40)
!1111 = !DISubprogram(name: "strncmp", scope: !1080, file: !1080, line: 271, type: !1112, flags: DIFlagPrototyped, spFlags: 0)
!1112 = !DISubroutineType(types: !1113)
!1113 = !{!302, !57, !57, !887}
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1115, file: !1059, line: 41)
!1115 = !DISubprogram(name: "strncpy", scope: !1080, file: !1080, line: 334, type: !1108, flags: DIFlagPrototyped, spFlags: 0)
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1117, file: !1059, line: 42)
!1117 = !DISubprogram(name: "strpbrk", linkageName: "?strpbrk@@YAPEADQEADQEBD@Z", scope: !1080, file: !1080, line: 506, type: !1118, flags: DIFlagPrototyped, spFlags: 0)
!1118 = !DISubroutineType(types: !1119)
!1119 = !{!55, !116, !322}
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1121, file: !1059, line: 43)
!1121 = !DISubprogram(name: "strrchr", linkageName: "?strrchr@@YAPEADQEADH@Z", scope: !1080, file: !1080, line: 512, type: !1085, flags: DIFlagPrototyped, spFlags: 0)
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1123, file: !1059, line: 44)
!1123 = !DISubprogram(name: "strspn", scope: !1080, file: !1080, line: 430, type: !1096, flags: DIFlagPrototyped, spFlags: 0)
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1125, file: !1059, line: 45)
!1125 = !DISubprogram(name: "strstr", linkageName: "?strstr@@YAPEADQEADQEBD@Z", scope: !1080, file: !1080, line: 518, type: !1118, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1127, file: !1059, line: 46)
!1127 = !DISubprogram(name: "strtok", scope: !1080, file: !1080, line: 436, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1129, file: !1059, line: 47)
!1129 = !DISubprogram(name: "strxfrm", scope: !1080, file: !1080, line: 479, type: !1130, flags: DIFlagPrototyped, spFlags: 0)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!887, !55, !57, !887}
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !310, file: !1133, line: 28)
!1133 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\cwchar", directory: "", checksumkind: CSK_MD5, checksum: "de41ecfa6d57874e2c7d1a30e0e4ad43")
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !372, file: !1133, line: 30)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !887, file: !1133, line: 31)
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1137, file: !1133, line: 32)
!1137 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1138, line: 26, size: 288, flags: DIFlagFwdDecl, identifier: ".?AUtm@@")
!1138 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_wtime.h", directory: "", checksumkind: CSK_MD5, checksum: "2492ba0e16e5eeaa8a93d311a7316d6b")
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1140, file: !1133, line: 33)
!1140 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !311, line: 605, baseType: !317)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1142, file: !1133, line: 35)
!1142 = !DISubprogram(name: "btowc", scope: !1143, file: !1143, line: 62, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "50992c87c826ae29a05757af3914e0dd")
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!1140, !302}
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1147, file: !1133, line: 36)
!1147 = !DISubprogram(name: "fgetwc", scope: !894, file: !894, line: 51, type: !1148, flags: DIFlagPrototyped, spFlags: 0)
!1148 = !DISubroutineType(types: !1149)
!1149 = !{!1140, !900}
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1151, file: !1133, line: 37)
!1151 = !DISubprogram(name: "fgetws", scope: !894, file: !894, line: 79, type: !1152, flags: DIFlagPrototyped, spFlags: 0)
!1152 = !DISubroutineType(types: !1153)
!1153 = !{!1154, !1154, !302, !900}
!1154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1155, size: 64)
!1155 = !DIBasicType(name: "wchar_t", size: 16, encoding: DW_ATE_unsigned)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1157, file: !1133, line: 38)
!1157 = !DISubprogram(name: "fputwc", scope: !894, file: !894, line: 59, type: !1158, flags: DIFlagPrototyped, spFlags: 0)
!1158 = !DISubroutineType(types: !1159)
!1159 = !{!1140, !1155, !900}
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1161, file: !1133, line: 39)
!1161 = !DISubprogram(name: "fputws", scope: !894, file: !894, line: 86, type: !1162, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!302, !1164, !900}
!1164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1165, size: 64)
!1165 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1155)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1167, file: !1133, line: 40)
!1167 = !DISubprogram(name: "fwide", scope: !1143, file: !1143, line: 184, type: !1168, flags: DIFlagPrototyped, spFlags: 0)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!302, !900, !302}
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1171, file: !1133, line: 41)
!1171 = !DISubprogram(name: "fwprintf", scope: !894, file: !894, line: 494, type: !1172, flags: DIFlagPrototyped, spFlags: 0)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!302, !930, !1174, null}
!1174 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1164)
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1176, file: !1133, line: 42)
!1176 = !DISubprogram(name: "fwscanf", scope: !894, file: !894, line: 856, type: !1172, flags: DIFlagPrototyped, spFlags: 0)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1178, file: !1133, line: 43)
!1178 = !DISubprogram(name: "getwc", scope: !894, file: !894, line: 69, type: !1148, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1180, file: !1133, line: 44)
!1180 = !DISubprogram(name: "getwchar", scope: !894, file: !894, line: 74, type: !1181, flags: DIFlagPrototyped, spFlags: 0)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{!1140}
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1184, file: !1133, line: 45)
!1184 = !DISubprogram(name: "mbrlen", scope: !1143, file: !1143, line: 66, type: !1185, flags: DIFlagPrototyped, spFlags: 0)
!1185 = !DISubroutineType(types: !1186)
!1186 = !{!887, !57, !887, !1187}
!1187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !372, size: 64)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1189, file: !1133, line: 46)
!1189 = !DISubprogram(name: "mbrtowc", scope: !1143, file: !1143, line: 72, type: !1190, flags: DIFlagPrototyped, spFlags: 0)
!1190 = !DISubroutineType(types: !1191)
!1191 = !{!887, !1154, !57, !887, !1187}
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1193, file: !1133, line: 47)
!1193 = !DISubprogram(name: "mbsrtowcs", scope: !1143, file: !1143, line: 99, type: !1194, flags: DIFlagPrototyped, spFlags: 0)
!1194 = !DISubroutineType(types: !1195)
!1195 = !{!887, !1154, !1196, !887, !1187}
!1196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1198, file: !1133, line: 48)
!1198 = !DISubprogram(name: "mbsinit", scope: !1143, file: !1143, line: 193, type: !1199, flags: DIFlagPrototyped, spFlags: 0)
!1199 = !DISubroutineType(types: !1200)
!1200 = !{!302, !1201}
!1201 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1202, size: 64)
!1202 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !372)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1204, file: !1133, line: 49)
!1204 = !DISubprogram(name: "putwc", scope: !894, file: !894, line: 105, type: !1158, flags: DIFlagPrototyped, spFlags: 0)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1206, file: !1133, line: 50)
!1206 = !DISubprogram(name: "putwchar", scope: !894, file: !894, line: 111, type: !1207, flags: DIFlagPrototyped, spFlags: 0)
!1207 = !DISubroutineType(types: !1208)
!1208 = !{!1140, !1155}
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1210, file: !1133, line: 51)
!1210 = !DISubprogram(name: "swprintf", linkageName: "?swprintf@@YAHQEA_WQEB_WZZ", scope: !894, file: !894, line: 1803, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DISubroutineType(types: !1212)
!1212 = !{!302, !1213, !1174, null}
!1213 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1154)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1215, file: !1133, line: 52)
!1215 = !DISubprogram(name: "swscanf", scope: !894, file: !894, line: 2018, type: !1216, flags: DIFlagPrototyped, spFlags: 0)
!1216 = !DISubroutineType(types: !1217)
!1217 = !{!302, !1174, !1174, null}
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1219, file: !1133, line: 53)
!1219 = !DISubprogram(name: "ungetwc", scope: !894, file: !894, line: 121, type: !1220, flags: DIFlagPrototyped, spFlags: 0)
!1220 = !DISubroutineType(types: !1221)
!1221 = !{!1140, !1140, !900}
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1223, file: !1133, line: 54)
!1223 = !DISubprogram(name: "vfwprintf", scope: !894, file: !894, line: 314, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DISubroutineType(types: !1225)
!1225 = !{!302, !930, !1174, !1032}
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1227, file: !1133, line: 55)
!1227 = !DISubprogram(name: "vswprintf", linkageName: "?vswprintf@@YAHQEA_WQEB_WPEAD@Z", scope: !894, file: !894, line: 1817, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!302, !1213, !1174, !1032}
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1231, file: !1133, line: 56)
!1231 = !DISubprogram(name: "vwprintf", scope: !894, file: !894, line: 404, type: !1232, flags: DIFlagPrototyped, spFlags: 0)
!1232 = !DISubroutineType(types: !1233)
!1233 = !{!302, !1174, !1032}
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1235, file: !1133, line: 57)
!1235 = !DISubprogram(name: "wcrtomb", scope: !1143, file: !1143, line: 125, type: !1236, flags: DIFlagPrototyped, spFlags: 0)
!1236 = !DISubroutineType(types: !1237)
!1237 = !{!887, !55, !1155, !1187}
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1239, file: !1133, line: 58)
!1239 = !DISubprogram(name: "wprintf", scope: !894, file: !894, line: 608, type: !1240, flags: DIFlagPrototyped, spFlags: 0)
!1240 = !DISubroutineType(types: !1241)
!1241 = !{!302, !1174, null}
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1243, file: !1133, line: 59)
!1243 = !DISubprogram(name: "wscanf", scope: !894, file: !894, line: 933, type: !1240, flags: DIFlagPrototyped, spFlags: 0)
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1245, file: !1133, line: 60)
!1245 = !DISubprogram(name: "wcsrtombs", scope: !1143, file: !1143, line: 152, type: !1246, flags: DIFlagPrototyped, spFlags: 0)
!1246 = !DISubroutineType(types: !1247)
!1247 = !{!887, !55, !1248, !887, !1187}
!1248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1164, size: 64)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1250, file: !1133, line: 61)
!1250 = !DISubprogram(name: "wcstol", scope: !1251, file: !1251, line: 134, type: !1252, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_wstdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "5b96d4421a65eb4a3e16dd6dc0574ba7")
!1252 = !DISubroutineType(types: !1253)
!1253 = !{!953, !1164, !1254, !302}
!1254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1154, size: 64)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1256, file: !1133, line: 62)
!1256 = !DISubprogram(name: "wcscat", scope: !1257, file: !1257, line: 100, type: !1258, flags: DIFlagPrototyped, spFlags: 0)
!1257 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_wstring.h", directory: "", checksumkind: CSK_MD5, checksum: "1e9764c381f45184fd3c47aaada60bf9")
!1258 = !DISubroutineType(types: !1259)
!1259 = !{!1154, !1154, !1164}
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1261, file: !1133, line: 63)
!1261 = !DISubprogram(name: "wcschr", linkageName: "?wcschr@@YAPEA_WPEA_W_W@Z", scope: !1257, file: !1257, line: 529, type: !1262, flags: DIFlagPrototyped, spFlags: 0)
!1262 = !DISubroutineType(types: !1263)
!1263 = !{!1154, !1154, !1155}
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1265, file: !1133, line: 64)
!1265 = !DISubprogram(name: "wcscmp", scope: !1257, file: !1257, line: 108, type: !1266, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DISubroutineType(types: !1267)
!1267 = !{!302, !1164, !1164}
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1269, file: !1133, line: 65)
!1269 = !DISubprogram(name: "wcscoll", scope: !1257, file: !1257, line: 462, type: !1266, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1271, file: !1133, line: 66)
!1271 = !DISubprogram(name: "wcscpy", scope: !1257, file: !1257, line: 119, type: !1258, flags: DIFlagPrototyped, spFlags: 0)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1273, file: !1133, line: 67)
!1273 = !DISubprogram(name: "wcscspn", scope: !1257, file: !1257, line: 126, type: !1274, flags: DIFlagPrototyped, spFlags: 0)
!1274 = !DISubroutineType(types: !1275)
!1275 = !{!887, !1164, !1164}
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1277, file: !1133, line: 68)
!1277 = !DISubprogram(name: "wcslen", scope: !1257, file: !1257, line: 132, type: !1278, flags: DIFlagPrototyped, spFlags: 0)
!1278 = !DISubroutineType(types: !1279)
!1279 = !{!887, !1164}
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1281, file: !1133, line: 69)
!1281 = !DISubprogram(name: "wcsncat", scope: !1257, file: !1257, line: 178, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{!1154, !1154, !1164, !887}
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1285, file: !1133, line: 70)
!1285 = !DISubprogram(name: "wcsncmp", scope: !1257, file: !1257, line: 187, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!302, !1164, !1164, !887}
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1289, file: !1133, line: 71)
!1289 = !DISubprogram(name: "wcsncpy", scope: !1257, file: !1257, line: 200, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1291, file: !1133, line: 72)
!1291 = !DISubprogram(name: "wcspbrk", linkageName: "?wcspbrk@@YAPEA_WPEA_WPEB_W@Z", scope: !1257, file: !1257, line: 535, type: !1258, flags: DIFlagPrototyped, spFlags: 0)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1293, file: !1133, line: 73)
!1293 = !DISubprogram(name: "wcsrchr", linkageName: "?wcsrchr@@YAPEA_WPEA_W_W@Z", scope: !1257, file: !1257, line: 541, type: !1262, flags: DIFlagPrototyped, spFlags: 0)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1295, file: !1133, line: 74)
!1295 = !DISubprogram(name: "wcsspn", scope: !1257, file: !1257, line: 215, type: !1274, flags: DIFlagPrototyped, spFlags: 0)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1297, file: !1133, line: 75)
!1297 = !DISubprogram(name: "wcstod", scope: !1251, file: !1251, line: 121, type: !1298, flags: DIFlagPrototyped, spFlags: 0)
!1298 = !DISubroutineType(types: !1299)
!1299 = !{!1300, !1164, !1254}
!1300 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1302, file: !1133, line: 76)
!1302 = !DISubprogram(name: "wcstoul", scope: !1251, file: !1251, line: 164, type: !1303, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!315, !1164, !1254, !302}
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1306, file: !1133, line: 77)
!1306 = !DISubprogram(name: "wcsstr", linkageName: "?wcsstr@@YAPEA_WPEA_WPEB_W@Z", scope: !1257, file: !1257, line: 548, type: !1258, flags: DIFlagPrototyped, spFlags: 0)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1308, file: !1133, line: 78)
!1308 = !DISubprogram(name: "wcstok", linkageName: "?wcstok@@YAPEA_WPEA_WPEB_W@Z", scope: !1257, file: !1257, line: 253, type: !1258, flags: DIFlagPrototyped, spFlags: 0)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1310, file: !1133, line: 79)
!1310 = !DISubprogram(name: "wcsxfrm", scope: !1257, file: !1257, line: 446, type: !1311, flags: DIFlagPrototyped, spFlags: 0)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{!887, !1154, !1164, !887}
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1314, file: !1133, line: 80)
!1314 = !DISubprogram(name: "wctob", scope: !1143, file: !1143, line: 160, type: !1315, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DISubroutineType(types: !1316)
!1316 = !{!302, !1140}
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1318, file: !1133, line: 81)
!1318 = !DISubprogram(name: "wmemchr", linkageName: "?wmemchr@@YAPEA_WPEA_W_W_K@Z", scope: !1143, file: !1143, line: 268, type: !1319, flags: DIFlagPrototyped, spFlags: 0)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!1154, !1154, !1155, !887}
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1322, file: !1133, line: 82)
!1322 = !DISubprogram(name: "wmemcmp", scope: !1143, file: !1143, line: 213, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1324, file: !1133, line: 83)
!1324 = !DISubprogram(name: "wmemcpy", scope: !1143, file: !1143, line: 229, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1326, file: !1133, line: 84)
!1326 = !DISubprogram(name: "wmemmove", scope: !1143, file: !1143, line: 240, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1328, file: !1133, line: 85)
!1328 = !DISubprogram(name: "wmemset", scope: !1143, file: !1143, line: 252, type: !1319, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1330, file: !1133, line: 86)
!1330 = !DISubprogram(name: "wcsftime", scope: !1138, file: !1138, line: 69, type: !1331, flags: DIFlagPrototyped, spFlags: 0)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{!887, !1154, !887, !1164, !1333}
!1333 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1334, size: 64)
!1334 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1137)
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1336, file: !1133, line: 88)
!1336 = !DISubprogram(name: "vfwscanf", scope: !894, file: !894, line: 731, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1338, file: !1133, line: 89)
!1338 = !DISubprogram(name: "vswscanf", scope: !894, file: !894, line: 1900, type: !1339, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DISubroutineType(types: !1340)
!1340 = !{!302, !1164, !1164, !1032}
!1341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1342, file: !1133, line: 90)
!1342 = !DISubprogram(name: "vwscanf", scope: !894, file: !894, line: 793, type: !1232, flags: DIFlagPrototyped, spFlags: 0)
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1344, file: !1133, line: 91)
!1344 = !DISubprogram(name: "wcstof", scope: !1251, file: !1251, line: 207, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!1347, !1164, !1254}
!1347 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1349, file: !1133, line: 92)
!1349 = !DISubprogram(name: "wcstold", scope: !1251, file: !1251, line: 194, type: !1350, flags: DIFlagPrototyped, spFlags: 0)
!1350 = !DISubroutineType(types: !1351)
!1351 = !{!1352, !1164, !1254}
!1352 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1354, file: !1133, line: 93)
!1354 = !DISubprogram(name: "wcstoll", scope: !1251, file: !1251, line: 149, type: !1355, flags: DIFlagPrototyped, spFlags: 0)
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!68, !1164, !1254, !302}
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1358, file: !1133, line: 94)
!1358 = !DISubprogram(name: "wcstoull", scope: !1251, file: !1251, line: 179, type: !1359, flags: DIFlagPrototyped, spFlags: 0)
!1359 = !DISubroutineType(types: !1360)
!1360 = !{!35, !1164, !1254, !302}
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1362, file: !1363, line: 23)
!1362 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !41, file: !1363, line: 21, baseType: !1364)
!1363 = !DIFile(filename: "C:\\llvm-mingw\\LLVM-19.1.0-Windows-X64\\lib\\clang\\19\\include\\__stddef_nullptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "68b56e88f94af0043c4e1c844be29723")
!1364 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !66, file: !1366, line: 23)
!1366 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\cstddef", directory: "", checksumkind: CSK_MD5, checksum: "c25d6fc7719a5bd75b71713d2496f21a")
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !63, file: !1366, line: 24)
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1369, file: !1366, line: 95)
!1369 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", scope: !41, file: !1366, line: 25, baseType: !1300)
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !63, file: !1371, line: 36)
!1371 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\cstdlib", directory: "", checksumkind: CSK_MD5, checksum: "9ffb64ca71745223c1022d4168969c7e")
!1372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1373, file: !1371, line: 37)
!1373 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1374, line: 279, baseType: !1375)
!1374 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f957baaaf7f972e5b8d08c2855b49589")
!1375 = !DICompositeType(tag: DW_TAG_structure_type, name: "_div_t", file: !1374, line: 275, size: 64, flags: DIFlagFwdDecl, identifier: ".?AU_div_t@@")
!1376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1377, file: !1371, line: 38)
!1377 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1374, line: 285, baseType: !1378)
!1378 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_ldiv_t", file: !1374, line: 281, size: 64, align: 32, flags: DIFlagTypePassByValue, elements: !1379, identifier: ".?AU_ldiv_t@@")
!1379 = !{!1380, !1381}
!1380 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1378, file: !1374, line: 283, baseType: !953, size: 32)
!1381 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1378, file: !1374, line: 284, baseType: !953, size: 32, offset: 32)
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1383, file: !1371, line: 39)
!1383 = !DISubprogram(name: "abort", scope: !1374, file: !1374, line: 60, type: !284, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1385, file: !1371, line: 40)
!1385 = !DISubprogram(name: "abs", linkageName: "?abs@@YAOO@Z", scope: !1371, file: !1371, line: 31, type: !1386, flags: DIFlagPrototyped, spFlags: 0)
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!1352, !1352}
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1389, file: !1371, line: 41)
!1389 = !DISubprogram(name: "atexit", scope: !1374, file: !1374, line: 144, type: !1390, flags: DIFlagPrototyped, spFlags: 0)
!1390 = !DISubroutineType(types: !1391)
!1391 = !{!302, !1392}
!1392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !284, size: 64)
!1393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1394, file: !1371, line: 42)
!1394 = !DISubprogram(name: "atof", scope: !1374, file: !1374, line: 450, type: !1395, flags: DIFlagPrototyped, spFlags: 0)
!1395 = !DISubroutineType(types: !1396)
!1396 = !{!1300, !57}
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1398, file: !1371, line: 43)
!1398 = !DISubprogram(name: "atoi", scope: !1374, file: !1374, line: 451, type: !990, flags: DIFlagPrototyped, spFlags: 0)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1400, file: !1371, line: 44)
!1400 = !DISubprogram(name: "atol", scope: !1374, file: !1374, line: 452, type: !1401, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!953, !57}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1404, file: !1371, line: 45)
!1404 = !DISubprogram(name: "bsearch", scope: !1405, file: !1405, line: 52, type: !1406, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_search.h", directory: "", checksumkind: CSK_MD5, checksum: "2a0a917cdb5d977c5fc7f09a83507d29")
!1406 = !DISubroutineType(types: !1407)
!1407 = !{!137, !123, !123, !63, !63, !1408}
!1408 = !DIDerivedType(tag: DW_TAG_typedef, name: "_CoreCrtNonSecureSearchSortCompareFunction", file: !1405, line: 24, baseType: !1409)
!1409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1410, size: 64)
!1410 = !DISubroutineType(types: !1411)
!1411 = !{!302, !123, !123}
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1413, file: !1371, line: 46)
!1413 = !DISubprogram(name: "calloc", scope: !1414, file: !1414, line: 66, type: !1415, flags: DIFlagPrototyped, spFlags: 0)
!1414 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "4b84debb05a5901124e6b98feedf354a")
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!137, !63, !63}
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1418, file: !1371, line: 47)
!1418 = !DISubprogram(name: "div", linkageName: "?div@@YA?AU_lldiv_t@@_J0@Z", scope: !1374, file: !1374, line: 378, type: !1419, flags: DIFlagPrototyped, spFlags: 0)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!1421, !1426, !1426}
!1421 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1374, line: 291, baseType: !1422)
!1422 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_lldiv_t", file: !1374, line: 287, size: 128, align: 64, flags: DIFlagTypePassByValue, elements: !1423, identifier: ".?AU_lldiv_t@@")
!1423 = !{!1424, !1425}
!1424 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1422, file: !1374, line: 289, baseType: !68, size: 64)
!1425 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1422, file: !1374, line: 290, baseType: !68, size: 64, offset: 64)
!1426 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !68)
!1427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1428, file: !1371, line: 48)
!1428 = !DISubprogram(name: "exit", scope: !1374, file: !1374, line: 56, type: !1429, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1429 = !DISubroutineType(types: !1430)
!1430 = !{null, !302}
!1431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1432, file: !1371, line: 49)
!1432 = !DISubprogram(name: "free", scope: !1414, file: !1414, line: 89, type: !1433, flags: DIFlagPrototyped, spFlags: 0)
!1433 = !DISubroutineType(types: !1434)
!1434 = !{null, !137}
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1436, file: !1371, line: 50)
!1436 = !DISubprogram(name: "labs", scope: !1374, file: !1374, line: 294, type: !1437, flags: DIFlagPrototyped, spFlags: 0)
!1437 = !DISubroutineType(types: !1438)
!1438 = !{!953, !953}
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1440, file: !1371, line: 51)
!1440 = !DISubprogram(name: "ldiv", scope: !1374, file: !1374, line: 303, type: !1441, flags: DIFlagPrototyped, spFlags: 0)
!1441 = !DISubroutineType(types: !1442)
!1442 = !{!1377, !953, !953}
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1444, file: !1371, line: 52)
!1444 = !DISubprogram(name: "malloc", scope: !1414, file: !1414, line: 101, type: !1445, flags: DIFlagPrototyped, spFlags: 0)
!1445 = !DISubroutineType(types: !1446)
!1446 = !{!137, !63}
!1447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1448, file: !1371, line: 53)
!1448 = !DISubprogram(name: "mblen", scope: !1374, file: !1374, line: 852, type: !1449, flags: DIFlagPrototyped, spFlags: 0)
!1449 = !DISubroutineType(types: !1450)
!1450 = !{!302, !57, !63}
!1451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1452, file: !1371, line: 54)
!1452 = !DISubprogram(name: "mbstowcs", scope: !1374, file: !1374, line: 924, type: !1453, flags: DIFlagPrototyped, spFlags: 0)
!1453 = !DISubroutineType(types: !1454)
!1454 = !{!63, !1154, !57, !63}
!1455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1456, file: !1371, line: 55)
!1456 = !DISubprogram(name: "mbtowc", scope: !1374, file: !1374, line: 893, type: !1457, flags: DIFlagPrototyped, spFlags: 0)
!1457 = !DISubroutineType(types: !1458)
!1458 = !{!302, !1154, !57, !63}
!1459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1460, file: !1371, line: 56)
!1460 = !DISubprogram(name: "qsort", scope: !1405, file: !1405, line: 60, type: !1461, flags: DIFlagPrototyped, spFlags: 0)
!1461 = !DISubroutineType(types: !1462)
!1462 = !{null, !137, !63, !63, !1408}
!1463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1464, file: !1371, line: 57)
!1464 = !DISubprogram(name: "rand", scope: !1374, file: !1374, line: 352, type: !972, flags: DIFlagPrototyped, spFlags: 0)
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1466, file: !1371, line: 58)
!1466 = !DISubprogram(name: "realloc", scope: !1414, file: !1414, line: 126, type: !1467, flags: DIFlagPrototyped, spFlags: 0)
!1467 = !DISubroutineType(types: !1468)
!1468 = !{!137, !137, !63}
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1470, file: !1371, line: 59)
!1470 = !DISubprogram(name: "srand", scope: !1374, file: !1374, line: 350, type: !1471, flags: DIFlagPrototyped, spFlags: 0)
!1471 = !DISubroutineType(types: !1472)
!1472 = !{null, !1473}
!1473 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1475, file: !1371, line: 60)
!1475 = !DISubprogram(name: "strtod", scope: !1374, file: !1374, line: 502, type: !1476, flags: DIFlagPrototyped, spFlags: 0)
!1476 = !DISubroutineType(types: !1477)
!1477 = !{!1300, !57, !1478}
!1478 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!1479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1480, file: !1371, line: 61)
!1480 = !DISubprogram(name: "strtol", scope: !1374, file: !1374, line: 528, type: !1481, flags: DIFlagPrototyped, spFlags: 0)
!1481 = !DISubroutineType(types: !1482)
!1482 = !{!953, !57, !1478, !302}
!1483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1484, file: !1371, line: 62)
!1484 = !DISubprogram(name: "strtoul", scope: !1374, file: !1374, line: 558, type: !1485, flags: DIFlagPrototyped, spFlags: 0)
!1485 = !DISubroutineType(types: !1486)
!1486 = !{!315, !57, !1478, !302}
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1488, file: !1371, line: 63)
!1488 = !DISubprogram(name: "wcstombs", scope: !1374, file: !1374, line: 1012, type: !1489, flags: DIFlagPrototyped, spFlags: 0)
!1489 = !DISubroutineType(types: !1490)
!1490 = !{!63, !55, !1164, !63}
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1492, file: !1371, line: 64)
!1492 = !DISubprogram(name: "wctomb", scope: !1374, file: !1374, line: 963, type: !1493, flags: DIFlagPrototyped, spFlags: 0)
!1493 = !DISubroutineType(types: !1494)
!1494 = !{!302, !55, !1155}
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1421, file: !1371, line: 66)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1497, file: !1371, line: 68)
!1497 = !DISubprogram(name: "getenv", scope: !1374, file: !1374, line: 1184, type: !1498, flags: DIFlagPrototyped, spFlags: 0)
!1498 = !DISubroutineType(types: !1499)
!1499 = !{!55, !57}
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1501, file: !1371, line: 69)
!1501 = !DISubprogram(name: "system", scope: !1374, file: !1374, line: 1211, type: !990, flags: DIFlagPrototyped, spFlags: 0)
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1503, file: !1371, line: 71)
!1503 = !DISubprogram(name: "atoll", scope: !1374, file: !1374, line: 453, type: !1504, flags: DIFlagPrototyped, spFlags: 0)
!1504 = !DISubroutineType(types: !1505)
!1505 = !{!68, !57}
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1507, file: !1371, line: 72)
!1507 = !DISubprogram(name: "llabs", scope: !1374, file: !1374, line: 295, type: !1508, flags: DIFlagPrototyped, spFlags: 0)
!1508 = !DISubroutineType(types: !1509)
!1509 = !{!68, !68}
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1511, file: !1371, line: 73)
!1511 = !DISubprogram(name: "lldiv", scope: !1374, file: !1374, line: 304, type: !1512, flags: DIFlagPrototyped, spFlags: 0)
!1512 = !DISubroutineType(types: !1513)
!1513 = !{!1421, !68, !68}
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1515, file: !1371, line: 74)
!1515 = !DISubprogram(name: "strtof", scope: !1374, file: !1374, line: 489, type: !1516, flags: DIFlagPrototyped, spFlags: 0)
!1516 = !DISubroutineType(types: !1517)
!1517 = !{!1347, !57, !1478}
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1519, file: !1371, line: 75)
!1519 = !DISubprogram(name: "strtold", scope: !1374, file: !1374, line: 515, type: !1520, flags: DIFlagPrototyped, spFlags: 0)
!1520 = !DISubroutineType(types: !1521)
!1521 = !{!1352, !57, !1478}
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1523, file: !1371, line: 76)
!1523 = !DISubprogram(name: "strtoll", scope: !1374, file: !1374, line: 543, type: !1524, flags: DIFlagPrototyped, spFlags: 0)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!68, !57, !1478, !302}
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1527, file: !1371, line: 77)
!1527 = !DISubprogram(name: "strtoull", scope: !1374, file: !1374, line: 573, type: !1528, flags: DIFlagPrototyped, spFlags: 0)
!1528 = !DISubroutineType(types: !1529)
!1529 = !{!35, !57, !1478, !302}
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1531, file: !1371, line: 79)
!1531 = !DISubprogram(name: "_Exit", scope: !1374, file: !1374, line: 58, type: !1429, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1533, file: !1371, line: 80)
!1533 = !DISubprogram(name: "at_quick_exit", scope: !1374, file: !1374, line: 148, type: !1390, flags: DIFlagPrototyped, spFlags: 0)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1535, file: !1371, line: 81)
!1535 = !DISubprogram(name: "quick_exit", scope: !1374, file: !1374, line: 59, type: !1429, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1537, file: !1539, line: 22)
!1537 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !795, line: 18, baseType: !1538)
!1538 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1539 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\cstdint", directory: "", checksumkind: CSK_MD5, checksum: "a82d27cf0f774e165b06000e45047591")
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1541, file: !1539, line: 23)
!1541 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !795, line: 19, baseType: !1542)
!1542 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1544, file: !1539, line: 24)
!1544 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !795, line: 20, baseType: !302)
!1545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1546, file: !1539, line: 25)
!1546 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !795, line: 21, baseType: !68)
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !794, file: !1539, line: 26)
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1549, file: !1539, line: 27)
!1549 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !795, line: 23, baseType: !317)
!1550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1551, file: !1539, line: 28)
!1551 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !795, line: 24, baseType: !1473)
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1553, file: !1539, line: 29)
!1553 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !795, line: 25, baseType: !35)
!1554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1555, file: !1539, line: 31)
!1555 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !795, line: 27, baseType: !1538)
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1557, file: !1539, line: 32)
!1557 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !795, line: 28, baseType: !1542)
!1558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1559, file: !1539, line: 33)
!1559 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !795, line: 29, baseType: !302)
!1560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1561, file: !1539, line: 34)
!1561 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !795, line: 30, baseType: !68)
!1562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1563, file: !1539, line: 35)
!1563 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !795, line: 31, baseType: !796)
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1565, file: !1539, line: 36)
!1565 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !795, line: 32, baseType: !317)
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1567, file: !1539, line: 37)
!1567 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !795, line: 33, baseType: !1473)
!1568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1569, file: !1539, line: 38)
!1569 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !795, line: 34, baseType: !35)
!1570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1571, file: !1539, line: 40)
!1571 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !795, line: 36, baseType: !1538)
!1572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1573, file: !1539, line: 41)
!1573 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !795, line: 37, baseType: !302)
!1574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1575, file: !1539, line: 42)
!1575 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !795, line: 38, baseType: !302)
!1576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1577, file: !1539, line: 43)
!1577 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !795, line: 39, baseType: !68)
!1578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1579, file: !1539, line: 44)
!1579 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !795, line: 40, baseType: !796)
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1581, file: !1539, line: 45)
!1581 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !795, line: 41, baseType: !1473)
!1582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1583, file: !1539, line: 46)
!1583 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !795, line: 42, baseType: !1473)
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1585, file: !1539, line: 47)
!1585 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !795, line: 43, baseType: !35)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1587, file: !1539, line: 49)
!1587 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !795, line: 45, baseType: !68)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1589, file: !1539, line: 50)
!1589 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !888, line: 195, baseType: !68)
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1591, file: !1539, line: 51)
!1591 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !795, line: 46, baseType: !35)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !816, file: !1539, line: 52)
!1593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1537, file: !1539, line: 56)
!1594 = !DINamespace(name: "tr1", scope: !41)
!1595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1541, file: !1539, line: 57)
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1544, file: !1539, line: 58)
!1597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1546, file: !1539, line: 59)
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !794, file: !1539, line: 60)
!1599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1549, file: !1539, line: 61)
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1551, file: !1539, line: 62)
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1553, file: !1539, line: 63)
!1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1555, file: !1539, line: 65)
!1603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1557, file: !1539, line: 66)
!1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1559, file: !1539, line: 67)
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1561, file: !1539, line: 68)
!1606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1563, file: !1539, line: 69)
!1607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1565, file: !1539, line: 70)
!1608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1567, file: !1539, line: 71)
!1609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1569, file: !1539, line: 72)
!1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1571, file: !1539, line: 74)
!1611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1573, file: !1539, line: 75)
!1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1575, file: !1539, line: 76)
!1613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1577, file: !1539, line: 77)
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1579, file: !1539, line: 78)
!1615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1581, file: !1539, line: 79)
!1616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1583, file: !1539, line: 80)
!1617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1585, file: !1539, line: 81)
!1618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1587, file: !1539, line: 83)
!1619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1589, file: !1539, line: 84)
!1620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !1591, file: !1539, line: 85)
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !816, file: !1539, line: 86)
!1622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !142, file: !1623, line: 2294)
!1623 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\type_traits", directory: "", checksumkind: CSK_MD5, checksum: "8cfe8c97c8150b65822a930eb6b9cc24")
!1624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1594, entity: !70, file: !1623, line: 2336)
!1625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1626, file: !1628, line: 37)
!1626 = !DISubprogram(name: "terminate", scope: !1627, file: !1627, line: 33, type: !284, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1627 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_terminate.h", directory: "", checksumkind: CSK_MD5, checksum: "2a539d6fe462a6cd4820acb34d25230b")
!1628 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\exception", directory: "", checksumkind: CSK_MD5, checksum: "58010e690457ca1dd5adef09100a70fe")
!1629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1630, file: !1628, line: 40)
!1630 = !DISubprogram(name: "set_terminate", scope: !1627, file: !1627, line: 37, type: !1631, flags: DIFlagPrototyped, spFlags: 0)
!1631 = !DISubroutineType(types: !1632)
!1632 = !{!1633, !1633}
!1633 = !DIDerivedType(tag: DW_TAG_typedef, name: "terminate_handler", file: !1627, line: 22, baseType: !1392)
!1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1633, file: !1628, line: 41)
!1635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1636, file: !1628, line: 50)
!1636 = !DISubprogram(name: "unexpected", scope: !1637, file: !1637, line: 33, type: !284, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1637 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\eh.h", directory: "", checksumkind: CSK_MD5, checksum: "936c3a8ac6c7ca08893821c3f45e9a9c")
!1638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1639, file: !1628, line: 53)
!1639 = !DISubprogram(name: "set_unexpected", scope: !1637, file: !1637, line: 36, type: !1640, flags: DIFlagPrototyped, spFlags: 0)
!1640 = !DISubroutineType(types: !1641)
!1641 = !{!1642, !1642}
!1642 = !DIDerivedType(tag: DW_TAG_typedef, name: "unexpected_handler", file: !1637, line: 24, baseType: !1392)
!1643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1642, file: !1628, line: 54)
!1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1645, file: !1647, line: 22)
!1645 = !DISubprogram(name: "isalnum", scope: !1646, file: !1646, line: 53, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1646 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "e0d7a583516e9232370f22e26e9558ff")
!1647 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\cctype", directory: "", checksumkind: CSK_MD5, checksum: "430d511e00d370da191bebd353199ac3")
!1648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1649, file: !1647, line: 23)
!1649 = !DISubprogram(name: "isalpha", scope: !1646, file: !1646, line: 31, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1651, file: !1647, line: 24)
!1651 = !DISubprogram(name: "iscntrl", scope: !1646, file: !1646, line: 59, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1653, file: !1647, line: 25)
!1653 = !DISubprogram(name: "isdigit", scope: !1646, file: !1646, line: 39, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1655, file: !1647, line: 26)
!1655 = !DISubprogram(name: "isgraph", scope: !1646, file: !1646, line: 57, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1657, file: !1647, line: 27)
!1657 = !DISubprogram(name: "islower", scope: !1646, file: !1646, line: 35, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1659, file: !1647, line: 28)
!1659 = !DISubprogram(name: "isprint", scope: !1646, file: !1646, line: 55, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1661, file: !1647, line: 29)
!1661 = !DISubprogram(name: "ispunct", scope: !1646, file: !1646, line: 49, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1663, file: !1647, line: 30)
!1663 = !DISubprogram(name: "isspace", scope: !1646, file: !1646, line: 46, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1665, file: !1647, line: 31)
!1665 = !DISubprogram(name: "isupper", scope: !1646, file: !1646, line: 33, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1667, file: !1647, line: 32)
!1667 = !DISubprogram(name: "isxdigit", scope: !1646, file: !1646, line: 42, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1669, file: !1647, line: 33)
!1669 = !DISubprogram(name: "tolower", scope: !1646, file: !1646, line: 66, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1671, file: !1647, line: 34)
!1671 = !DISubprogram(name: "toupper", scope: !1646, file: !1646, line: 63, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !41, entity: !1673, file: !1647, line: 36)
!1673 = !DISubprogram(name: "isblank", scope: !1646, file: !1646, line: 51, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!1674 = !{!"/FAILIFMISMATCH:\22_MSC_VER=1900\22"}
!1675 = !{!"/FAILIFMISMATCH:\22_ITERATOR_DEBUG_LEVEL=0\22"}
!1676 = !{!"/FAILIFMISMATCH:\22RuntimeLibrary=MT_StaticRelease\22"}
!1677 = !{!"/DEFAULTLIB:libcpmt.lib"}
!1678 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!1679 = !{!"/FAILIFMISMATCH:\22annotate_string=0\22"}
!1680 = !{i32 2, !"CodeView", i32 1}
!1681 = !{i32 2, !"Debug Info Version", i32 3}
!1682 = !{i32 1, !"wchar_size", i32 2}
!1683 = !{i32 8, !"PIC Level", i32 2}
!1684 = !{i32 7, !"uwtable", i32 2}
!1685 = !{i32 1, !"MaxTLSAlign", i32 65536}
!1686 = !{!"clang version 19.1.0 (D:/a/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"}
!1687 = distinct !DISubprogram(name: "A", linkageName: "??0A@@QEAA@H@Z", scope: !1688, file: !2, line: 5, type: !1699, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1698, retainedNodes: !215)
!1688 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "A", file: !1689, line: 11, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1690, vtableHolder: !1688, identifier: ".?AUA@@")
!1689 = !DIFile(filename: ".\\Simple.hpp", directory: "C:\\Users\\alex\\Documents\\GitHub\\debase\\examples\\Simple", checksumkind: CSK_MD5, checksum: "e6c35930e5f0e9d072cab373dc667927")
!1690 = !{!1691, !1692, !1694, !1698, !1701}
!1691 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: null, size: 64)
!1692 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$A", scope: !1689, file: !1689, baseType: !1693, size: 64, flags: DIFlagArtificial)
!1693 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1691, size: 64)
!1694 = !DISubprogram(name: "A", scope: !1688, file: !1689, line: 12, type: !1695, scopeLine: 12, flags: DIFlagPrototyped, spFlags: 0)
!1695 = !DISubroutineType(types: !1696)
!1696 = !{null, !1697}
!1697 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1688, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1698 = !DISubprogram(name: "A", scope: !1688, file: !1689, line: 13, type: !1699, scopeLine: 13, flags: DIFlagPrototyped, spFlags: 0)
!1699 = !DISubroutineType(types: !1700)
!1700 = !{null, !1697, !302}
!1701 = !DISubprogram(name: "~A", scope: !1688, file: !1689, line: 14, type: !1695, scopeLine: 14, containingType: !1688, virtualIndex: 0, flags: DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual)
!1702 = !DILocalVariable(name: "V", arg: 2, scope: !1687, file: !2, line: 5, type: !302)
!1703 = !DILocation(line: 5, scope: !1687)
!1704 = !DILocalVariable(name: "this", arg: 1, scope: !1687, type: !1705, flags: DIFlagArtificial | DIFlagObjectPointer)
!1705 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1688, size: 64)
!1706 = !DILocation(line: 0, scope: !1687)
!1707 = !DILocation(line: 6, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1687, file: !2, line: 5)
!1709 = !DILocation(line: 7, scope: !1708)
!1710 = !DILocation(line: 8, scope: !1708)
!1711 = !DILocation(line: 9, scope: !1687)
!1712 = !DILocalVariable(name: "_Format", arg: 1, scope: !985, file: !891, line: 951, type: !322)
!1713 = !DILocation(line: 951, scope: !985)
!1714 = !DILocalVariable(name: "_Result", scope: !985, file: !891, line: 957, type: !302)
!1715 = !DILocation(line: 957, scope: !985)
!1716 = !DILocalVariable(name: "_ArgList", scope: !985, file: !891, line: 958, type: !1032)
!1717 = !DILocation(line: 958, scope: !985)
!1718 = !DILocation(line: 959, scope: !985)
!1719 = !DILocation(line: 960, scope: !985)
!1720 = !DILocation(line: 961, scope: !985)
!1721 = !DILocation(line: 962, scope: !985)
!1722 = distinct !DISubprogram(name: "B", linkageName: "??0B@@QEAA@H@Z", scope: !1723, file: !2, line: 11, type: !1732, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1731, retainedNodes: !215)
!1723 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "B", file: !1689, line: 17, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1724, vtableHolder: !1688, identifier: ".?AUB@@")
!1724 = !{!1725, !1691, !1726, !1727, !1731, !1734}
!1725 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1723, baseType: !1688, extraData: i32 0)
!1726 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1723, file: !1689, line: 18, baseType: !302, size: 32, offset: 64)
!1727 = !DISubprogram(name: "B", scope: !1723, file: !1689, line: 19, type: !1728, scopeLine: 19, flags: DIFlagPrototyped, spFlags: 0)
!1728 = !DISubroutineType(types: !1729)
!1729 = !{null, !1730}
!1730 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1723, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1731 = !DISubprogram(name: "B", scope: !1723, file: !1689, line: 20, type: !1732, scopeLine: 20, flags: DIFlagPrototyped, spFlags: 0)
!1732 = !DISubroutineType(types: !1733)
!1733 = !{null, !1730, !302}
!1734 = !DISubprogram(name: "~B", scope: !1723, file: !1689, line: 21, type: !1728, scopeLine: 21, containingType: !1723, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!1735 = !DILocalVariable(name: "V", arg: 2, scope: !1722, file: !2, line: 11, type: !302)
!1736 = !DILocation(line: 11, scope: !1722)
!1737 = !DILocalVariable(name: "this", arg: 1, scope: !1722, type: !1738, flags: DIFlagArtificial | DIFlagObjectPointer)
!1738 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1723, size: 64)
!1739 = !DILocation(line: 0, scope: !1722)
!1740 = !DILocation(line: 12, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1722, file: !2, line: 11)
!1742 = !DILocation(line: 13, scope: !1741)
!1743 = !DILocation(line: 14, scope: !1741)
!1744 = !DILocation(line: 15, scope: !1722)
!1745 = !DILocation(line: 15, scope: !1741)
!1746 = distinct !DISubprogram(name: "~A", linkageName: "??1A@@UEAA@XZ", scope: !1688, file: !2, line: 29, type: !1695, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1701, retainedNodes: !215)
!1747 = !DILocalVariable(name: "this", arg: 1, scope: !1746, type: !1705, flags: DIFlagArtificial | DIFlagObjectPointer)
!1748 = !DILocation(line: 0, scope: !1746)
!1749 = !DILocation(line: 29, scope: !1746)
!1750 = !DILocation(line: 30, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1746, file: !2, line: 29)
!1752 = !DILocation(line: 31, scope: !1751)
!1753 = !DILocation(line: 32, scope: !1751)
!1754 = !DILocation(line: 33, scope: !1746)
!1755 = distinct !DISubprogram(name: "C", linkageName: "??0C@@QEAA@H@Z", scope: !1756, file: !2, line: 17, type: !1779, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1778, retainedNodes: !215)
!1756 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "C", file: !1689, line: 31, size: 576, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1757, vtableHolder: !1688, identifier: ".?AUC@@")
!1757 = !{!1758, !1759, !1691, !1772, !1774, !1778, !1781}
!1758 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1756, baseType: !1723, extraData: i32 0)
!1759 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1756, baseType: !1760, offset: 128, extraData: i32 0)
!1760 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "E", file: !1689, line: 24, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1761, vtableHolder: !1688, identifier: ".?AUE@@")
!1761 = !{!1762, !1691, !1763, !1764, !1768, !1771}
!1762 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1760, baseType: !1688, extraData: i32 0)
!1763 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !1760, file: !1689, line: 25, baseType: !1723, size: 128, offset: 64)
!1764 = !DISubprogram(name: "E", scope: !1760, file: !1689, line: 26, type: !1765, scopeLine: 26, flags: DIFlagPrototyped, spFlags: 0)
!1765 = !DISubroutineType(types: !1766)
!1766 = !{null, !1767}
!1767 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1760, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1768 = !DISubprogram(name: "E", scope: !1760, file: !1689, line: 27, type: !1769, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!1769 = !DISubroutineType(types: !1770)
!1770 = !{null, !1767, !302}
!1771 = !DISubprogram(name: "~E", scope: !1760, file: !1689, line: 28, type: !1765, scopeLine: 28, containingType: !1760, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!1772 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1756, file: !1689, line: 32, baseType: !1773, size: 256, align: 64, offset: 320)
!1773 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !41, file: !39, line: 5294, baseType: !40)
!1774 = !DISubprogram(name: "C", scope: !1756, file: !1689, line: 33, type: !1775, scopeLine: 33, flags: DIFlagPrototyped, spFlags: 0)
!1775 = !DISubroutineType(types: !1776)
!1776 = !{null, !1777}
!1777 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1756, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1778 = !DISubprogram(name: "C", scope: !1756, file: !1689, line: 34, type: !1779, scopeLine: 34, flags: DIFlagPrototyped, spFlags: 0)
!1779 = !DISubroutineType(types: !1780)
!1780 = !{null, !1777, !302}
!1781 = !DISubprogram(name: "~C", scope: !1756, file: !1689, line: 35, type: !1775, scopeLine: 35, containingType: !1756, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!1782 = !DILocalVariable(name: "V", arg: 2, scope: !1755, file: !2, line: 17, type: !302)
!1783 = !DILocation(line: 17, scope: !1755)
!1784 = !DILocalVariable(name: "this", arg: 1, scope: !1755, type: !1785, flags: DIFlagArtificial | DIFlagObjectPointer)
!1785 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1756, size: 64)
!1786 = !DILocation(line: 0, scope: !1755)
!1787 = !DILocation(line: 18, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !1755, file: !2, line: 17)
!1789 = !DILocation(line: 19, scope: !1788)
!1790 = !DILocation(line: 20, scope: !1788)
!1791 = !DILocation(line: 21, scope: !1755)
!1792 = !DILocation(line: 21, scope: !1788)
!1793 = distinct !DISubprogram(name: "E", linkageName: "??0E@@QEAA@XZ", scope: !1760, file: !1689, line: 26, type: !1765, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1764, retainedNodes: !215)
!1794 = !DILocalVariable(name: "this", arg: 1, scope: !1793, type: !1795, flags: DIFlagArtificial | DIFlagObjectPointer)
!1795 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1760, size: 64)
!1796 = !DILocation(line: 0, scope: !1793)
!1797 = !DILocation(line: 26, scope: !1793)
!1798 = distinct !DISubprogram(name: "basic_string", linkageName: "??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@_KD@Z", scope: !40, file: !39, line: 2689, type: !484, scopeLine: 2690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !483, retainedNodes: !215)
!1799 = !DILocalVariable(name: "_Ch", arg: 3, scope: !1798, file: !39, line: 2689, type: !4)
!1800 = !DILocation(line: 2689, scope: !1798)
!1801 = !DILocalVariable(name: "_Count", arg: 2, scope: !1798, file: !39, line: 2689, type: !430)
!1802 = !DILocalVariable(name: "this", arg: 1, scope: !1798, type: !1803, flags: DIFlagArtificial | DIFlagObjectPointer)
!1803 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!1804 = !DILocation(line: 0, scope: !1798)
!1805 = !DILocation(line: 2690, scope: !1798)
!1806 = !DILocation(line: 2691, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1798, file: !39, line: 2690)
!1808 = !DILocation(line: 2692, scope: !1798)
!1809 = !DILocation(line: 2692, scope: !1807)
!1810 = distinct !DISubprogram(name: "c_str", linkageName: "?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ", scope: !40, file: !39, line: 4255, type: !640, scopeLine: 4255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !677, retainedNodes: !215)
!1811 = !DILocalVariable(name: "this", arg: 1, scope: !1810, type: !1812, flags: DIFlagArtificial | DIFlagObjectPointer)
!1812 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !461, size: 64)
!1813 = !DILocation(line: 0, scope: !1810)
!1814 = !DILocation(line: 4256, scope: !1810)
!1815 = distinct !DISubprogram(name: "~basic_string", linkageName: "??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ", scope: !40, file: !39, line: 3267, type: !451, scopeLine: 3267, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !531, retainedNodes: !215)
!1816 = !DILocalVariable(name: "this", arg: 1, scope: !1815, type: !1803, flags: DIFlagArtificial | DIFlagObjectPointer)
!1817 = !DILocation(line: 0, scope: !1815)
!1818 = !DILocation(line: 3268, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1815, file: !39, line: 3267)
!1820 = !DILocation(line: 3275, scope: !1819)
!1821 = !DILocation(line: 3275, scope: !1815)
!1822 = distinct !DISubprogram(name: "~E", linkageName: "??1E@@UEAA@XZ", scope: !1760, file: !2, line: 46, type: !1765, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1771, retainedNodes: !215)
!1823 = !DILocalVariable(name: "this", arg: 1, scope: !1822, type: !1795, flags: DIFlagArtificial | DIFlagObjectPointer)
!1824 = !DILocation(line: 0, scope: !1822)
!1825 = !DILocation(line: 46, scope: !1822)
!1826 = !DILocation(line: 47, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1822, file: !2, line: 46)
!1828 = !DILocation(line: 48, scope: !1827)
!1829 = !DILocation(line: 49, scope: !1827)
!1830 = !DILocation(line: 50, scope: !1827)
!1831 = !DILocation(line: 50, scope: !1822)
!1832 = distinct !DISubprogram(name: "~B", linkageName: "??1B@@UEAA@XZ", scope: !1723, file: !2, line: 35, type: !1728, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1734, retainedNodes: !215)
!1833 = !DILocalVariable(name: "this", arg: 1, scope: !1832, type: !1738, flags: DIFlagArtificial | DIFlagObjectPointer)
!1834 = !DILocation(line: 0, scope: !1832)
!1835 = !DILocation(line: 35, scope: !1832)
!1836 = !DILocation(line: 36, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1832, file: !2, line: 35)
!1838 = !DILocation(line: 37, scope: !1837)
!1839 = !DILocation(line: 38, scope: !1837)
!1840 = !DILocation(line: 39, scope: !1837)
!1841 = !DILocation(line: 39, scope: !1832)
!1842 = distinct !DISubprogram(name: "E", linkageName: "??0E@@QEAA@H@Z", scope: !1760, file: !2, line: 23, type: !1769, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1768, retainedNodes: !215)
!1843 = !DILocalVariable(name: "V", arg: 2, scope: !1842, file: !2, line: 23, type: !302)
!1844 = !DILocation(line: 23, scope: !1842)
!1845 = !DILocalVariable(name: "this", arg: 1, scope: !1842, type: !1795, flags: DIFlagArtificial | DIFlagObjectPointer)
!1846 = !DILocation(line: 0, scope: !1842)
!1847 = !DILocation(line: 24, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1842, file: !2, line: 23)
!1849 = !DILocation(line: 25, scope: !1848)
!1850 = !DILocation(line: 26, scope: !1848)
!1851 = !DILocation(line: 27, scope: !1842)
!1852 = !DILocation(line: 27, scope: !1848)
!1853 = distinct !DISubprogram(name: "~C", linkageName: "??1C@@UEAA@XZ", scope: !1756, file: !2, line: 41, type: !1775, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1781, retainedNodes: !215)
!1854 = !DILocalVariable(name: "this", arg: 1, scope: !1853, type: !1785, flags: DIFlagArtificial | DIFlagObjectPointer)
!1855 = !DILocation(line: 0, scope: !1853)
!1856 = !DILocation(line: 41, scope: !1853)
!1857 = !DILocation(line: 42, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1853, file: !2, line: 41)
!1859 = !DILocation(line: 43, scope: !1858)
!1860 = !DILocation(line: 44, scope: !1858)
!1861 = !DILocation(line: 44, scope: !1853)
!1862 = distinct !DISubprogram(name: "~A", linkageName: "??_GA@@UEAAPEAXI@Z", scope: !1688, file: !1689, line: 14, type: !1695, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1701, retainedNodes: !215)
!1863 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !1862, type: !302, flags: DIFlagArtificial)
!1864 = !DILocation(line: 0, scope: !1862)
!1865 = !DILocalVariable(name: "this", arg: 1, scope: !1862, type: !1705, flags: DIFlagArtificial | DIFlagObjectPointer)
!1866 = !DILocation(line: 29, scope: !1867)
!1867 = !DILexicalBlockFile(scope: !1862, file: !2, discriminator: 0)
!1868 = !DILocation(line: 33, scope: !1867)
!1869 = distinct !DISubprogram(name: "~B", linkageName: "??_GB@@UEAAPEAXI@Z", scope: !1723, file: !1689, line: 21, type: !1728, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1734, retainedNodes: !215)
!1870 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !1869, type: !302, flags: DIFlagArtificial)
!1871 = !DILocation(line: 0, scope: !1869)
!1872 = !DILocalVariable(name: "this", arg: 1, scope: !1869, type: !1738, flags: DIFlagArtificial | DIFlagObjectPointer)
!1873 = !DILocation(line: 35, scope: !1874)
!1874 = !DILexicalBlockFile(scope: !1869, file: !2, discriminator: 0)
!1875 = !DILocation(line: 39, scope: !1874)
!1876 = distinct !DISubprogram(name: "~C", linkageName: "??_GC@@UEAAPEAXI@Z", scope: !1756, file: !1689, line: 35, type: !1775, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1781, retainedNodes: !215)
!1877 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !1876, type: !302, flags: DIFlagArtificial)
!1878 = !DILocation(line: 0, scope: !1876)
!1879 = !DILocalVariable(name: "this", arg: 1, scope: !1876, type: !1785, flags: DIFlagArtificial | DIFlagObjectPointer)
!1880 = !DILocation(line: 41, scope: !1881)
!1881 = !DILexicalBlockFile(scope: !1876, file: !2, discriminator: 0)
!1882 = !DILocation(line: 44, scope: !1881)
!1883 = distinct !DISubprogram(linkageName: "??_EC@@WBA@EAAPEAXI@Z", scope: !1689, file: !1689, line: 35, type: !1884, flags: DIFlagArtificial | DIFlagThunk, spFlags: DISPFlagDefinition, unit: !36)
!1884 = !DISubroutineType(types: !215)
!1885 = !DILocation(line: 0, scope: !1883)
!1886 = distinct !DISubprogram(name: "~E", linkageName: "??_GE@@UEAAPEAXI@Z", scope: !1760, file: !1689, line: 28, type: !1765, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1771, retainedNodes: !215)
!1887 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !1886, type: !302, flags: DIFlagArtificial)
!1888 = !DILocation(line: 0, scope: !1886)
!1889 = !DILocalVariable(name: "this", arg: 1, scope: !1886, type: !1795, flags: DIFlagArtificial | DIFlagObjectPointer)
!1890 = !DILocation(line: 46, scope: !1891)
!1891 = !DILexicalBlockFile(scope: !1886, file: !2, discriminator: 0)
!1892 = !DILocation(line: 50, scope: !1891)
!1893 = distinct !DISubprogram(name: "_vfprintf_l", scope: !891, file: !891, line: 635, type: !1894, scopeLine: 644, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, retainedNodes: !215)
!1894 = !DISubroutineType(types: !1895)
!1895 = !{!302, !930, !322, !1896, !1032}
!1896 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1897)
!1897 = !DIDerivedType(tag: DW_TAG_typedef, name: "_locale_t", file: !311, line: 623, baseType: !1898)
!1898 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1899, size: 64)
!1899 = !DIDerivedType(tag: DW_TAG_typedef, name: "__crt_locale_pointers", file: !311, line: 621, baseType: !1900)
!1900 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__crt_locale_pointers", file: !311, line: 617, size: 128, align: 64, flags: DIFlagTypePassByValue, elements: !1901, identifier: ".?AU__crt_locale_pointers@@")
!1901 = !{!1902, !1905}
!1902 = !DIDerivedType(tag: DW_TAG_member, name: "locinfo", scope: !1900, file: !311, line: 619, baseType: !1903, size: 64)
!1903 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1904, size: 64)
!1904 = !DICompositeType(tag: DW_TAG_structure_type, name: "__crt_locale_data", file: !311, line: 619, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AU__crt_locale_data@@")
!1905 = !DIDerivedType(tag: DW_TAG_member, name: "mbcinfo", scope: !1900, file: !311, line: 620, baseType: !1906, size: 64, offset: 64)
!1906 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1907, size: 64)
!1907 = !DICompositeType(tag: DW_TAG_structure_type, name: "__crt_multibyte_data", file: !311, line: 620, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: ".?AU__crt_multibyte_data@@")
!1908 = !DILocalVariable(name: "_ArgList", arg: 4, scope: !1893, file: !891, line: 639, type: !1032)
!1909 = !DILocation(line: 639, scope: !1893)
!1910 = !DILocalVariable(name: "_Locale", arg: 3, scope: !1893, file: !891, line: 638, type: !1896)
!1911 = !DILocation(line: 638, scope: !1893)
!1912 = !DILocalVariable(name: "_Format", arg: 2, scope: !1893, file: !891, line: 637, type: !322)
!1913 = !DILocation(line: 637, scope: !1893)
!1914 = !DILocalVariable(name: "_Stream", arg: 1, scope: !1893, file: !891, line: 636, type: !930)
!1915 = !DILocation(line: 636, scope: !1893)
!1916 = !DILocation(line: 645, scope: !1893)
!1917 = !DILocation(line: 92, scope: !30)
!1918 = distinct !DISubprogram(name: "A", linkageName: "??0A@@QEAA@XZ", scope: !1688, file: !1689, line: 12, type: !1695, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1694, retainedNodes: !215)
!1919 = !DILocalVariable(name: "this", arg: 1, scope: !1918, type: !1705, flags: DIFlagArtificial | DIFlagObjectPointer)
!1920 = !DILocation(line: 0, scope: !1918)
!1921 = !DILocation(line: 12, scope: !1918)
!1922 = distinct !DISubprogram(name: "B", linkageName: "??0B@@QEAA@XZ", scope: !1723, file: !1689, line: 19, type: !1728, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1727, retainedNodes: !215)
!1923 = !DILocalVariable(name: "this", arg: 1, scope: !1922, type: !1738, flags: DIFlagArtificial | DIFlagObjectPointer)
!1924 = !DILocation(line: 0, scope: !1922)
!1925 = !DILocation(line: 19, scope: !1922)
!1926 = distinct !DISubprogram(name: "_Tidy_deallocate", linkageName: "?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ", scope: !40, file: !39, line: 5004, type: !451, scopeLine: 5004, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !779, retainedNodes: !215)
!1927 = !DILocalVariable(name: "this", arg: 1, scope: !1926, type: !1803, flags: DIFlagArtificial | DIFlagObjectPointer)
!1928 = !DILocation(line: 0, scope: !1926)
!1929 = !DILocalVariable(name: "_My_data", scope: !1926, file: !39, line: 5005, type: !1930)
!1930 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !195, size: 64)
!1931 = !DILocation(line: 5005, scope: !1926)
!1932 = !DILocation(line: 5006, scope: !1926)
!1933 = !DILocation(line: 5008, scope: !1926)
!1934 = !DILocalVariable(name: "_Ptr", scope: !1935, file: !39, line: 5009, type: !1937)
!1935 = distinct !DILexicalBlock(scope: !1936, file: !39, line: 5008)
!1936 = distinct !DILexicalBlock(scope: !1926, file: !39, line: 5008)
!1937 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !408)
!1938 = !DILocation(line: 5009, scope: !1935)
!1939 = !DILocalVariable(name: "_Al", scope: !1935, file: !39, line: 5010, type: !785)
!1940 = !DILocation(line: 5010, scope: !1935)
!1941 = !DILocation(line: 5011, scope: !1935)
!1942 = !DILocation(line: 5012, scope: !1935)
!1943 = !DILocation(line: 5013, scope: !1935)
!1944 = !DILocation(line: 5014, scope: !1935)
!1945 = !DILocation(line: 5016, scope: !1926)
!1946 = !DILocation(line: 5017, scope: !1926)
!1947 = !DILocation(line: 5019, scope: !1926)
!1948 = !DILocation(line: 5020, scope: !1926)
!1949 = distinct !DISubprogram(name: "~_Compressed_pair", linkageName: "??1?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@XZ", scope: !432, file: !45, line: 1367, type: !1950, scopeLine: 1367, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !1952, retainedNodes: !215)
!1950 = !DISubroutineType(types: !1951)
!1951 = !{null, !440}
!1952 = !DISubprogram(name: "~_Compressed_pair", scope: !432, type: !1950, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: 0)
!1953 = !DILocalVariable(name: "this", arg: 1, scope: !1949, type: !1954, flags: DIFlagArtificial | DIFlagObjectPointer)
!1954 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !432, size: 64)
!1955 = !DILocation(line: 0, scope: !1949)
!1956 = !DILocation(line: 1367, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1949, file: !45, line: 1367)
!1958 = !DILocation(line: 1367, scope: !1949)
!1959 = distinct !DISubprogram(name: "_Orphan_all", linkageName: "?_Orphan_all@_Container_base0@std@@QEAAXXZ", scope: !199, file: !45, line: 1029, type: !202, scopeLine: 1029, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !201, retainedNodes: !215)
!1960 = !DILocalVariable(name: "this", arg: 1, scope: !1959, type: !856, flags: DIFlagArtificial | DIFlagObjectPointer)
!1961 = !DILocation(line: 0, scope: !1959)
!1962 = !DILocation(line: 1029, scope: !1959)
!1963 = distinct !DISubprogram(name: "_Large_string_engaged", linkageName: "?_Large_string_engaged@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBA_NXZ", scope: !195, file: !39, line: 2300, type: !276, scopeLine: 2300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !275, retainedNodes: !215)
!1964 = !DILocalVariable(name: "this", arg: 1, scope: !1963, type: !1965, flags: DIFlagArtificial | DIFlagObjectPointer)
!1965 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !274, size: 64)
!1966 = !DILocation(line: 0, scope: !1963)
!1967 = !DILocation(line: 2301, scope: !1963)
!1968 = distinct !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ", scope: !40, file: !39, line: 5032, type: !783, scopeLine: 5032, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !782, retainedNodes: !215)
!1969 = !DILocalVariable(name: "this", arg: 1, scope: !1968, type: !1803, flags: DIFlagArtificial | DIFlagObjectPointer)
!1970 = !DILocation(line: 0, scope: !1968)
!1971 = !DILocation(line: 5033, scope: !1968)
!1972 = distinct !DISubprogram(name: "_Destroy_in_place<char *>", linkageName: "??$_Destroy_in_place@PEAD@std@@YAXAEAPEAD@Z", scope: !41, file: !45, line: 294, type: !1973, scopeLine: 294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !1976, retainedNodes: !215)
!1973 = !DISubroutineType(types: !1974)
!1974 = !{null, !1975}
!1975 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !55, size: 64)
!1976 = !{!1977}
!1977 = !DITemplateTypeParameter(name: "_Ty", type: !55)
!1978 = !DILocalVariable(name: "_Obj", arg: 1, scope: !1972, file: !45, line: 294, type: !1975)
!1979 = !DILocation(line: 294, scope: !1972)
!1980 = !DILocation(line: 298, scope: !1981)
!1981 = distinct !DILexicalBlock(scope: !1982, file: !45, line: 297)
!1982 = distinct !DILexicalBlock(scope: !1972, file: !45, line: 295)
!1983 = !DILocation(line: 300, scope: !1972)
!1984 = distinct !DISubprogram(name: "_Activate_SSO_buffer", linkageName: "?_Activate_SSO_buffer@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAAXXZ", scope: !195, file: !39, line: 2304, type: !262, scopeLine: 2304, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !278, retainedNodes: !215)
!1985 = !DILocalVariable(name: "this", arg: 1, scope: !1984, type: !1986, flags: DIFlagArtificial | DIFlagObjectPointer)
!1986 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64)
!1987 = !DILocation(line: 0, scope: !1984)
!1988 = !DILocation(line: 2313, scope: !1984)
!1989 = distinct !DISubprogram(name: "deallocate", linkageName: "?deallocate@?$allocator@D@std@@QEAAXQEAD_K@Z", scope: !50, file: !45, line: 827, type: !114, scopeLine: 827, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !113, retainedNodes: !215)
!1990 = !DILocalVariable(name: "_Count", arg: 3, scope: !1989, file: !45, line: 827, type: !91)
!1991 = !DILocation(line: 827, scope: !1989)
!1992 = !DILocalVariable(name: "_Ptr", arg: 2, scope: !1989, file: !45, line: 827, type: !116)
!1993 = !DILocalVariable(name: "this", arg: 1, scope: !1989, type: !1994, flags: DIFlagArtificial | DIFlagObjectPointer)
!1994 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!1995 = !DILocation(line: 0, scope: !1989)
!1996 = !DILocation(line: 830, scope: !1989)
!1997 = !DILocation(line: 831, scope: !1989)
!1998 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAXAEADAEBD@Z", scope: !295, file: !39, line: 455, type: !340, scopeLine: 455, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !383, retainedNodes: !215)
!1999 = !DILocalVariable(name: "_Right", arg: 2, scope: !1998, file: !39, line: 455, type: !61)
!2000 = !DILocation(line: 455, scope: !1998)
!2001 = !DILocalVariable(name: "_Left", arg: 1, scope: !1998, file: !39, line: 455, type: !59)
!2002 = !DILocation(line: 461, scope: !1998)
!2003 = !DILocation(line: 462, scope: !1998)
!2004 = distinct !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAAAEAV?$allocator@D@2@XZ", scope: !432, file: !45, line: 1383, type: !438, scopeLine: 1383, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !437, retainedNodes: !215)
!2005 = !DILocalVariable(name: "this", arg: 1, scope: !2004, type: !1954, flags: DIFlagArtificial | DIFlagObjectPointer)
!2006 = !DILocation(line: 0, scope: !2004)
!2007 = !DILocation(line: 1384, scope: !2004)
!2008 = distinct !DISubprogram(name: "_Deallocate<16,0>", linkageName: "??$_Deallocate@$0BA@$0A@@std@@YAXPEAX_K@Z", scope: !41, file: !45, line: 242, type: !2009, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2011, retainedNodes: !215)
!2009 = !DISubroutineType(types: !2010)
!2010 = !{null, !137, !63}
!2011 = !{!2012, !2013}
!2012 = !DITemplateValueParameter(name: "_Align", type: !35, value: i64 16)
!2013 = !DITemplateValueParameter(type: !302, value: i32 0)
!2014 = !DILocalVariable(name: "_Bytes", arg: 2, scope: !2008, file: !45, line: 242, type: !63)
!2015 = !DILocation(line: 242, scope: !2008)
!2016 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2008, file: !45, line: 242, type: !137)
!2017 = !DILocation(line: 251, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2008, file: !45, line: 249)
!2019 = !DILocation(line: 252, scope: !2020)
!2020 = distinct !DILexicalBlock(scope: !2021, file: !45, line: 251)
!2021 = distinct !DILexicalBlock(scope: !2018, file: !45, line: 251)
!2022 = !DILocation(line: 253, scope: !2020)
!2023 = !DILocation(line: 255, scope: !2018)
!2024 = !DILocation(line: 257, scope: !2008)
!2025 = distinct !DISubprogram(name: "_Adjust_manually_vector_aligned", linkageName: "?_Adjust_manually_vector_aligned@std@@YAXAEAPEAXAEA_K@Z", scope: !41, file: !45, line: 145, type: !2026, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, retainedNodes: !215)
!2026 = !DISubroutineType(types: !2027)
!2027 = !{null, !2028, !2029}
!2028 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !137, size: 64)
!2029 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !63, size: 64)
!2030 = !DILocalVariable(name: "_Bytes", arg: 2, scope: !2025, file: !45, line: 145, type: !2029)
!2031 = !DILocation(line: 145, scope: !2025)
!2032 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2025, file: !45, line: 145, type: !2028)
!2033 = !DILocation(line: 147, scope: !2025)
!2034 = !DILocalVariable(name: "_Ptr_user", scope: !2025, file: !45, line: 149, type: !2035)
!2035 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2036)
!2036 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2037, size: 64)
!2037 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !816)
!2038 = !DILocation(line: 149, scope: !2025)
!2039 = !DILocalVariable(name: "_Ptr_container", scope: !2025, file: !45, line: 150, type: !2037)
!2040 = !DILocation(line: 150, scope: !2025)
!2041 = !DILocalVariable(name: "_Min_back_shift", scope: !2025, file: !45, line: 161, type: !2037)
!2042 = !DILocation(line: 161, scope: !2025)
!2043 = !DILocalVariable(name: "_Back_shift", scope: !2025, file: !45, line: 163, type: !2037)
!2044 = !DILocation(line: 163, scope: !2025)
!2045 = !DILocation(line: 164, scope: !2025)
!2046 = !DILocation(line: 164, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2025, file: !45, line: 164)
!2048 = !DILocation(line: 164, scope: !2049)
!2049 = distinct !DILexicalBlock(scope: !2050, file: !45, line: 164)
!2050 = distinct !DILexicalBlock(scope: !2047, file: !45, line: 164)
!2051 = !DILocation(line: 164, scope: !2052)
!2052 = distinct !DILexicalBlock(scope: !2050, file: !45, line: 164)
!2053 = !DILocation(line: 164, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2052, file: !45, line: 164)
!2055 = !DILocation(line: 165, scope: !2025)
!2056 = !DILocation(line: 166, scope: !2025)
!2057 = distinct !DISubprogram(name: "~_String_val", linkageName: "??1?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !195, file: !39, line: 2261, type: !262, scopeLine: 2261, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2058, retainedNodes: !215)
!2058 = !DISubprogram(name: "~_String_val", scope: !195, type: !262, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: 0)
!2059 = !DILocalVariable(name: "this", arg: 1, scope: !2057, type: !1986, flags: DIFlagArtificial | DIFlagObjectPointer)
!2060 = !DILocation(line: 0, scope: !2057)
!2061 = !DILocation(line: 2261, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2057, file: !39, line: 2261)
!2063 = !DILocation(line: 2261, scope: !2057)
!2064 = distinct !DISubprogram(name: "~_Bxty", linkageName: "??1_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !244, file: !39, line: 2341, type: !254, scopeLine: 2341, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !257, retainedNodes: !215)
!2065 = !DILocalVariable(name: "this", arg: 1, scope: !2064, type: !2066, flags: DIFlagArtificial | DIFlagObjectPointer)
!2066 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!2067 = !DILocation(line: 0, scope: !2064)
!2068 = !DILocation(line: 2341, scope: !2064)
!2069 = distinct !DISubprogram(name: "_Myptr", linkageName: "?_Myptr@?$_String_val@U?$_Simple_types@D@std@@@std@@QEBAPEBDXZ", scope: !195, file: !39, line: 2291, type: !270, scopeLine: 2291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !269, retainedNodes: !215)
!2070 = !DILocalVariable(name: "this", arg: 1, scope: !2069, type: !1965, flags: DIFlagArtificial | DIFlagObjectPointer)
!2071 = !DILocation(line: 0, scope: !2069)
!2072 = !DILocalVariable(name: "_Result", scope: !2069, file: !39, line: 2292, type: !272)
!2073 = !DILocation(line: 2292, scope: !2069)
!2074 = !DILocation(line: 2293, scope: !2069)
!2075 = !DILocation(line: 2294, scope: !2076)
!2076 = distinct !DILexicalBlock(scope: !2077, file: !39, line: 2293)
!2077 = distinct !DILexicalBlock(scope: !2069, file: !39, line: 2293)
!2078 = !DILocation(line: 2295, scope: !2076)
!2079 = !DILocation(line: 2297, scope: !2069)
!2080 = distinct !DISubprogram(name: "_Unfancy<char>", linkageName: "??$_Unfancy@D@std@@YAPEADPEAD@Z", scope: !41, file: !2081, line: 293, type: !1024, scopeLine: 293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !128, retainedNodes: !215)
!2081 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\xstddef", directory: "", checksumkind: CSK_MD5, checksum: "a7da0066dbdf951ec5d071dc60e3a40a")
!2082 = !DILocalVariable(name: "_Ptr", arg: 1, scope: !2080, file: !2081, line: 293, type: !55)
!2083 = !DILocation(line: 293, scope: !2080)
!2084 = !DILocation(line: 294, scope: !2080)
!2085 = distinct !DISubprogram(name: "_Compressed_pair<>", linkageName: "??$?0$$V@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEAA@U_Zero_then_variadic_args_t@1@@Z", scope: !432, file: !45, line: 1374, type: !2086, scopeLine: 1376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2089, declaration: !2088, retainedNodes: !215)
!2086 = !DISubroutineType(types: !2087)
!2087 = !{null, !440, !821}
!2088 = !DISubprogram(name: "_Compressed_pair<>", scope: !432, file: !45, line: 1374, type: !2086, scopeLine: 1374, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !2089)
!2089 = !{!2090}
!2090 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Other2", value: !215)
!2091 = !DILocalVariable(arg: 2, scope: !2085, file: !45, line: 1374, type: !821)
!2092 = !DILocation(line: 1374, scope: !2085)
!2093 = !DILocalVariable(name: "this", arg: 1, scope: !2085, type: !1954, flags: DIFlagArtificial | DIFlagObjectPointer)
!2094 = !DILocation(line: 0, scope: !2085)
!2095 = !DILocation(line: 1376, scope: !2085)
!2096 = distinct !DISubprogram(name: "_Construct<0,char>", linkageName: "??$_Construct@$0A@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXD_K@Z", scope: !40, file: !39, line: 2728, type: !2097, scopeLine: 2728, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2100, declaration: !2099, retainedNodes: !215)
!2097 = !DISubroutineType(types: !2098)
!2098 = !{null, !453, !4, !430}
!2099 = !DISubprogram(name: "_Construct<0,char>", linkageName: "??$_Construct@$0A@D@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXD_K@Z", scope: !40, file: !39, line: 2728, type: !2097, scopeLine: 2728, flags: DIFlagPrototyped, spFlags: 0, templateParams: !2100)
!2100 = !{!2101, !2102}
!2101 = !DITemplateValueParameter(name: "_Strat", type: !38, value: i8 0)
!2102 = !DITemplateTypeParameter(name: "_Char_or_ptr", type: !5)
!2103 = !DILocalVariable(name: "_Count", arg: 3, scope: !2096, file: !39, line: 2728, type: !430)
!2104 = !DILocation(line: 2728, scope: !2096)
!2105 = !DILocalVariable(name: "_Arg", arg: 2, scope: !2096, file: !39, line: 2728, type: !4)
!2106 = !DILocalVariable(name: "this", arg: 1, scope: !2096, type: !1803, flags: DIFlagArtificial | DIFlagObjectPointer)
!2107 = !DILocation(line: 0, scope: !2096)
!2108 = !DILocalVariable(name: "_My_data", scope: !2096, file: !39, line: 2729, type: !1930)
!2109 = !DILocation(line: 2729, scope: !2096)
!2110 = !DILocation(line: 2739, scope: !2096)
!2111 = !DILocation(line: 2740, scope: !2112)
!2112 = distinct !DILexicalBlock(scope: !2113, file: !39, line: 2739)
!2113 = distinct !DILexicalBlock(scope: !2096, file: !39, line: 2739)
!2114 = !DILocalVariable(name: "_Al", scope: !2096, file: !39, line: 2743, type: !785)
!2115 = !DILocation(line: 2743, scope: !2096)
!2116 = !DILocalVariable(name: "_Alproxy", scope: !2096, file: !39, line: 2744, type: !212)
!2117 = !DILocation(line: 2744, scope: !2096)
!2118 = !DILocalVariable(name: "_Proxy", scope: !2096, file: !39, line: 2745, type: !2119)
!2119 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Container_proxy_ptr<_Alty>", scope: !41, file: !45, line: 1351, baseType: !827)
!2120 = !DILocation(line: 2745, scope: !2096)
!2121 = !DILocation(line: 2747, scope: !2096)
!2122 = !DILocation(line: 2748, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2124, file: !39, line: 2747)
!2124 = distinct !DILexicalBlock(scope: !2096, file: !39, line: 2747)
!2125 = !DILocation(line: 2749, scope: !2123)
!2126 = !DILocation(line: 2751, scope: !2127)
!2127 = distinct !DILexicalBlock(scope: !2128, file: !39, line: 2750)
!2128 = distinct !DILexicalBlock(scope: !2123, file: !39, line: 2750)
!2129 = !DILocation(line: 2763, scope: !2123)
!2130 = !DILocation(line: 2764, scope: !2123)
!2131 = !DILocation(line: 2767, scope: !2096)
!2132 = !DILocalVariable(name: "_New_capacity", scope: !2096, file: !39, line: 2768, type: !430)
!2133 = !DILocation(line: 2768, scope: !2096)
!2134 = !DILocalVariable(name: "_New_ptr", scope: !2096, file: !39, line: 2769, type: !1937)
!2135 = !DILocation(line: 2769, scope: !2096)
!2136 = !DILocation(line: 2770, scope: !2096)
!2137 = !DILocation(line: 2778, scope: !2096)
!2138 = !DILocation(line: 2779, scope: !2096)
!2139 = !DILocation(line: 2781, scope: !2140)
!2140 = distinct !DILexicalBlock(scope: !2141, file: !39, line: 2780)
!2141 = distinct !DILexicalBlock(scope: !2096, file: !39, line: 2780)
!2142 = !DILocation(line: 2782, scope: !2140)
!2143 = !DILocation(line: 2791, scope: !2096)
!2144 = !DILocation(line: 2792, scope: !2096)
!2145 = distinct !DISubprogram(name: "allocator", linkageName: "??0?$allocator@D@std@@QEAA@XZ", scope: !50, file: !45, line: 819, type: !101, scopeLine: 819, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !100, retainedNodes: !215)
!2146 = !DILocalVariable(name: "this", arg: 1, scope: !2145, type: !1994, flags: DIFlagArtificial | DIFlagObjectPointer)
!2147 = !DILocation(line: 0, scope: !2145)
!2148 = !DILocation(line: 819, scope: !2145)
!2149 = distinct !DISubprogram(name: "_String_val", linkageName: "??0?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !195, file: !39, line: 2271, type: !262, scopeLine: 2271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !261, retainedNodes: !215)
!2150 = !DILocalVariable(name: "this", arg: 1, scope: !2149, type: !1986, flags: DIFlagArtificial | DIFlagObjectPointer)
!2151 = !DILocation(line: 0, scope: !2149)
!2152 = !DILocation(line: 2271, scope: !2149)
!2153 = distinct !DISubprogram(name: "_Bxty", linkageName: "??0_Bxty@?$_String_val@U?$_Simple_types@D@std@@@std@@QEAA@XZ", scope: !244, file: !39, line: 2339, type: !254, scopeLine: 2339, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !253, retainedNodes: !215)
!2154 = !DILocalVariable(name: "this", arg: 1, scope: !2153, type: !2066, flags: DIFlagArtificial | DIFlagObjectPointer)
!2155 = !DILocation(line: 0, scope: !2153)
!2156 = !DILocation(line: 2339, scope: !2153)
!2157 = distinct !DISubprogram(name: "max_size", linkageName: "?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ", scope: !40, file: !39, line: 4277, type: !680, scopeLine: 4277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !683, retainedNodes: !215)
!2158 = !DILocalVariable(name: "this", arg: 1, scope: !2157, type: !1812, flags: DIFlagArtificial | DIFlagObjectPointer)
!2159 = !DILocation(line: 0, scope: !2157)
!2160 = !DILocalVariable(name: "_Alloc_max", scope: !2157, file: !39, line: 4278, type: !430)
!2161 = !DILocation(line: 4278, scope: !2157)
!2162 = !DILocalVariable(name: "_Storage_max", scope: !2157, file: !39, line: 4279, type: !430)
!2163 = !DILocation(line: 4279, scope: !2157)
!2164 = !DILocation(line: 4281, scope: !2157)
!2165 = distinct !DISubprogram(name: "_Xlen_string", linkageName: "?_Xlen_string@std@@YAXXZ", scope: !41, file: !39, line: 2366, type: !284, scopeLine: 2366, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !36)
!2166 = !DILocation(line: 2367, scope: !2165)
!2167 = distinct !DISubprogram(name: "_Fake_proxy_ptr_impl", linkageName: "??0_Fake_proxy_ptr_impl@std@@QEAA@AEBU_Fake_allocator@1@AEBU_Container_base0@1@@Z", scope: !827, file: !45, line: 1295, type: !849, scopeLine: 1295, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !848, retainedNodes: !215)
!2168 = !DILocalVariable(arg: 3, scope: !2167, file: !45, line: 1295, type: !851)
!2169 = !DILocation(line: 1295, scope: !2167)
!2170 = !DILocalVariable(arg: 2, scope: !2167, file: !45, line: 1295, type: !212)
!2171 = !DILocalVariable(name: "this", arg: 1, scope: !2167, type: !2172, flags: DIFlagArtificial | DIFlagObjectPointer)
!2172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !827, size: 64)
!2173 = !DILocation(line: 0, scope: !2167)
!2174 = distinct !DISubprogram(name: "assign", linkageName: "?assign@?$_Narrow_char_traits@DH@std@@SAPEADQEAD_KD@Z", scope: !295, file: !39, line: 443, type: !337, scopeLine: 444, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !382, retainedNodes: !215)
!2175 = !DILocalVariable(name: "_Ch", arg: 3, scope: !2174, file: !39, line: 444, type: !4)
!2176 = !DILocation(line: 444, scope: !2174)
!2177 = !DILocalVariable(name: "_Count", arg: 2, scope: !2174, file: !39, line: 444, type: !63)
!2178 = !DILocalVariable(name: "_First", arg: 1, scope: !2174, file: !39, line: 444, type: !116)
!2179 = !DILocation(line: 452, scope: !2174)
!2180 = distinct !DISubprogram(name: "_Release", linkageName: "?_Release@_Fake_proxy_ptr_impl@std@@QEAAXXZ", scope: !827, file: !45, line: 1298, type: !858, scopeLine: 1298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !857, retainedNodes: !215)
!2181 = !DILocalVariable(name: "this", arg: 1, scope: !2180, type: !2172, flags: DIFlagArtificial | DIFlagObjectPointer)
!2182 = !DILocation(line: 0, scope: !2180)
!2183 = !DILocation(line: 1298, scope: !2180)
!2184 = distinct !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z", scope: !40, file: !39, line: 4892, type: !774, scopeLine: 4892, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !773, retainedNodes: !215)
!2185 = !DILocalVariable(name: "_Requested", arg: 2, scope: !2184, file: !39, line: 4892, type: !430)
!2186 = !DILocation(line: 4892, scope: !2184)
!2187 = !DILocalVariable(name: "this", arg: 1, scope: !2184, type: !1812, flags: DIFlagArtificial | DIFlagObjectPointer)
!2188 = !DILocation(line: 0, scope: !2184)
!2189 = !DILocation(line: 4893, scope: !2184)
!2190 = distinct !DISubprogram(name: "allocate", linkageName: "?allocate@?$allocator@D@std@@QEAAPEAD_K@Z", scope: !50, file: !45, line: 833, type: !118, scopeLine: 833, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !117, retainedNodes: !215)
!2191 = !DILocalVariable(name: "_Count", arg: 2, scope: !2190, file: !45, line: 833, type: !91)
!2192 = !DILocation(line: 833, scope: !2190)
!2193 = !DILocalVariable(name: "this", arg: 1, scope: !2190, type: !1994, flags: DIFlagArtificial | DIFlagObjectPointer)
!2194 = !DILocation(line: 0, scope: !2190)
!2195 = !DILocation(line: 835, scope: !2190)
!2196 = distinct !DISubprogram(name: "_Construct_in_place<char *,char *const &>", linkageName: "??$_Construct_in_place@PEADAEBQEAD@std@@YAXAEAPEADAEBQEAD@Z", scope: !41, file: !421, line: 223, type: !2197, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2200, retainedNodes: !215)
!2197 = !DISubroutineType(types: !2198)
!2198 = !{null, !1975, !2199}
!2199 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !116, size: 64)
!2200 = !{!1977, !2201}
!2201 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Types", value: !2202)
!2202 = !{!2203}
!2203 = !DITemplateTypeParameter(type: !2199)
!2204 = !DILocalVariable(name: "_Args", arg: 2, scope: !2196, file: !421, line: 223, type: !2199)
!2205 = !DILocation(line: 223, scope: !2196)
!2206 = !DILocalVariable(name: "_Obj", arg: 1, scope: !2196, file: !421, line: 223, type: !1975)
!2207 = !DILocation(line: 231, scope: !2208)
!2208 = distinct !DILexicalBlock(scope: !2196, file: !421, line: 230)
!2209 = !DILocation(line: 233, scope: !2196)
!2210 = distinct !DISubprogram(name: "max_size", linkageName: "?max_size@?$_Default_allocator_traits@V?$allocator@D@std@@@std@@SA_KAEBV?$allocator@D@2@@Z", scope: !47, file: !45, line: 693, type: !174, scopeLine: 693, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !173, retainedNodes: !215)
!2211 = !DILocalVariable(arg: 1, scope: !2210, file: !45, line: 693, type: !107)
!2212 = !DILocation(line: 693, scope: !2210)
!2213 = !DILocation(line: 694, scope: !2210)
!2214 = distinct !DISubprogram(name: "_Getal", linkageName: "?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ", scope: !40, file: !39, line: 5036, type: !787, scopeLine: 5036, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !786, retainedNodes: !215)
!2215 = !DILocalVariable(name: "this", arg: 1, scope: !2214, type: !1812, flags: DIFlagArtificial | DIFlagObjectPointer)
!2216 = !DILocation(line: 0, scope: !2214)
!2217 = !DILocation(line: 5037, scope: !2214)
!2218 = distinct !DISubprogram(name: "max<unsigned long long>", linkageName: "??$max@_K@std@@YAAEB_KAEB_K0@Z", scope: !41, file: !2219, line: 41, type: !2220, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2224, retainedNodes: !215)
!2219 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.34.31933\\include\\utility", directory: "", checksumkind: CSK_MD5, checksum: "b6bcc043a84015d7afbd500cbe38ff8e")
!2220 = !DISubroutineType(types: !2221)
!2221 = !{!2222, !2222, !2222}
!2222 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2223, size: 64)
!2223 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!2224 = !{!2225}
!2225 = !DITemplateTypeParameter(name: "_Ty", type: !35)
!2226 = !DILocalVariable(name: "_Right", arg: 2, scope: !2218, file: !2219, line: 41, type: !2222)
!2227 = !DILocation(line: 41, scope: !2218)
!2228 = !DILocalVariable(name: "_Left", arg: 1, scope: !2218, file: !2219, line: 41, type: !2222)
!2229 = !DILocation(line: 43, scope: !2218)
!2230 = distinct !DISubprogram(name: "min<unsigned long long>", linkageName: "??$min@_K@std@@YAAEB_KAEB_K0@Z", scope: !41, file: !2219, line: 64, type: !2220, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2224, retainedNodes: !215)
!2231 = !DILocalVariable(name: "_Right", arg: 2, scope: !2230, file: !2219, line: 64, type: !2222)
!2232 = !DILocation(line: 64, scope: !2230)
!2233 = !DILocalVariable(name: "_Left", arg: 1, scope: !2230, file: !2219, line: 64, type: !2222)
!2234 = !DILocation(line: 66, scope: !2230)
!2235 = distinct !DISubprogram(name: "max", linkageName: "?max@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 641, type: !2278, scopeLine: 641, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2280)
!2236 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "numeric_limits<long long>", scope: !41, file: !802, line: 635, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !2237, templateParams: !2288, identifier: ".?AV?$numeric_limits@_J@std@@")
!2237 = !{!2238, !2274, !2275, !2276, !2277, !2280, !2281, !2282, !2283, !2284, !2285, !2286, !2287}
!2238 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2236, baseType: !2239, flags: DIFlagPublic, extraData: i32 0)
!2239 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Num_int_base", scope: !41, file: !802, line: 127, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !2240, identifier: ".?AU_Num_int_base@std@@")
!2240 = !{!2241, !2269, !2270, !2271, !2272, !2273}
!2241 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2239, baseType: !2242, extraData: i32 0)
!2242 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Num_base", scope: !41, file: !802, line: 52, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !2243, identifier: ".?AU_Num_base@std@@")
!2243 = !{!2244, !2246, !2247, !2248, !2249, !2250, !2251, !2252, !2253, !2254, !2255, !2256, !2257, !2258, !2259, !2261, !2262, !2263, !2264, !2265, !2266, !2267, !2268}
!2244 = !DIDerivedType(tag: DW_TAG_member, name: "has_denorm", scope: !2242, file: !802, line: 53, baseType: !2245, flags: DIFlagStaticMember, extraData: i32 0)
!2245 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !801)
!2246 = !DIDerivedType(tag: DW_TAG_member, name: "has_denorm_loss", scope: !2242, file: !802, line: 54, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2247 = !DIDerivedType(tag: DW_TAG_member, name: "has_infinity", scope: !2242, file: !802, line: 55, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2248 = !DIDerivedType(tag: DW_TAG_member, name: "has_quiet_NaN", scope: !2242, file: !802, line: 56, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2249 = !DIDerivedType(tag: DW_TAG_member, name: "has_signaling_NaN", scope: !2242, file: !802, line: 57, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2250 = !DIDerivedType(tag: DW_TAG_member, name: "is_bounded", scope: !2242, file: !802, line: 58, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2251 = !DIDerivedType(tag: DW_TAG_member, name: "is_exact", scope: !2242, file: !802, line: 59, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2252 = !DIDerivedType(tag: DW_TAG_member, name: "is_iec559", scope: !2242, file: !802, line: 60, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2253 = !DIDerivedType(tag: DW_TAG_member, name: "is_integer", scope: !2242, file: !802, line: 61, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2254 = !DIDerivedType(tag: DW_TAG_member, name: "is_modulo", scope: !2242, file: !802, line: 62, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2255 = !DIDerivedType(tag: DW_TAG_member, name: "is_signed", scope: !2242, file: !802, line: 63, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2256 = !DIDerivedType(tag: DW_TAG_member, name: "is_specialized", scope: !2242, file: !802, line: 64, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2257 = !DIDerivedType(tag: DW_TAG_member, name: "tinyness_before", scope: !2242, file: !802, line: 65, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2258 = !DIDerivedType(tag: DW_TAG_member, name: "traps", scope: !2242, file: !802, line: 66, baseType: !76, flags: DIFlagStaticMember, extraData: i1 false)
!2259 = !DIDerivedType(tag: DW_TAG_member, name: "round_style", scope: !2242, file: !802, line: 67, baseType: !2260, flags: DIFlagStaticMember, extraData: i32 0)
!2260 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !807)
!2261 = !DIDerivedType(tag: DW_TAG_member, name: "digits", scope: !2242, file: !802, line: 68, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 0)
!2262 = !DIDerivedType(tag: DW_TAG_member, name: "digits10", scope: !2242, file: !802, line: 69, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 0)
!2263 = !DIDerivedType(tag: DW_TAG_member, name: "max_digits10", scope: !2242, file: !802, line: 70, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 0)
!2264 = !DIDerivedType(tag: DW_TAG_member, name: "max_exponent", scope: !2242, file: !802, line: 71, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 0)
!2265 = !DIDerivedType(tag: DW_TAG_member, name: "max_exponent10", scope: !2242, file: !802, line: 72, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 0)
!2266 = !DIDerivedType(tag: DW_TAG_member, name: "min_exponent", scope: !2242, file: !802, line: 73, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 0)
!2267 = !DIDerivedType(tag: DW_TAG_member, name: "min_exponent10", scope: !2242, file: !802, line: 74, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 0)
!2268 = !DIDerivedType(tag: DW_TAG_member, name: "radix", scope: !2242, file: !802, line: 75, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 0)
!2269 = !DIDerivedType(tag: DW_TAG_member, name: "is_bounded", scope: !2239, file: !802, line: 128, baseType: !76, flags: DIFlagStaticMember, extraData: i1 true)
!2270 = !DIDerivedType(tag: DW_TAG_member, name: "is_exact", scope: !2239, file: !802, line: 129, baseType: !76, flags: DIFlagStaticMember, extraData: i1 true)
!2271 = !DIDerivedType(tag: DW_TAG_member, name: "is_integer", scope: !2239, file: !802, line: 130, baseType: !76, flags: DIFlagStaticMember, extraData: i1 true)
!2272 = !DIDerivedType(tag: DW_TAG_member, name: "is_specialized", scope: !2239, file: !802, line: 131, baseType: !76, flags: DIFlagStaticMember, extraData: i1 true)
!2273 = !DIDerivedType(tag: DW_TAG_member, name: "radix", scope: !2239, file: !802, line: 132, baseType: !1087, flags: DIFlagStaticMember, extraData: i32 2)
!2274 = !DIDerivedType(tag: DW_TAG_member, name: "is_signed", scope: !2236, file: !802, line: 673, baseType: !76, flags: DIFlagPublic | DIFlagStaticMember, extraData: i1 true)
!2275 = !DIDerivedType(tag: DW_TAG_member, name: "digits", scope: !2236, file: !802, line: 674, baseType: !1087, flags: DIFlagPublic | DIFlagStaticMember, extraData: i32 63)
!2276 = !DIDerivedType(tag: DW_TAG_member, name: "digits10", scope: !2236, file: !802, line: 675, baseType: !1087, flags: DIFlagPublic | DIFlagStaticMember, extraData: i32 18)
!2277 = !DISubprogram(name: "min", linkageName: "?min@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 637, type: !2278, scopeLine: 637, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2278 = !DISubroutineType(types: !2279)
!2279 = !{!68}
!2280 = !DISubprogram(name: "max", linkageName: "?max@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 641, type: !2278, scopeLine: 641, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2281 = !DISubprogram(name: "lowest", linkageName: "?lowest@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 645, type: !2278, scopeLine: 645, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2282 = !DISubprogram(name: "epsilon", linkageName: "?epsilon@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 649, type: !2278, scopeLine: 649, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2283 = !DISubprogram(name: "round_error", linkageName: "?round_error@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 653, type: !2278, scopeLine: 653, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2284 = !DISubprogram(name: "denorm_min", linkageName: "?denorm_min@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 657, type: !2278, scopeLine: 657, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2285 = !DISubprogram(name: "infinity", linkageName: "?infinity@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 661, type: !2278, scopeLine: 661, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2286 = !DISubprogram(name: "quiet_NaN", linkageName: "?quiet_NaN@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 665, type: !2278, scopeLine: 665, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2287 = !DISubprogram(name: "signaling_NaN", linkageName: "?signaling_NaN@?$numeric_limits@_J@std@@SA_JXZ", scope: !2236, file: !802, line: 669, type: !2278, scopeLine: 669, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2288 = !{!2289}
!2289 = !DITemplateTypeParameter(name: "_Ty", type: !68)
!2290 = !DILocation(line: 642, scope: !2235)
!2291 = distinct !DISubprogram(name: "_Get_first", linkageName: "?_Get_first@?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00@std@@QEBAAEBV?$allocator@D@2@XZ", scope: !432, file: !45, line: 1387, type: !442, scopeLine: 1387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !441, retainedNodes: !215)
!2292 = !DILocalVariable(name: "this", arg: 1, scope: !2291, type: !2293, flags: DIFlagArtificial | DIFlagObjectPointer)
!2293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !445, size: 64)
!2294 = !DILocation(line: 0, scope: !2291)
!2295 = !DILocation(line: 1388, scope: !2291)
!2296 = distinct !DISubprogram(name: "_Calculate_growth", linkageName: "?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z", scope: !40, file: !39, line: 4878, type: !771, scopeLine: 4879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !770, retainedNodes: !215)
!2297 = !DILocalVariable(name: "_Max", arg: 3, scope: !2296, file: !39, line: 4879, type: !430)
!2298 = !DILocation(line: 4879, scope: !2296)
!2299 = !DILocalVariable(name: "_Old", arg: 2, scope: !2296, file: !39, line: 4879, type: !430)
!2300 = !DILocalVariable(name: "_Requested", arg: 1, scope: !2296, file: !39, line: 4879, type: !430)
!2301 = !DILocalVariable(name: "_Masked", scope: !2296, file: !39, line: 4880, type: !430)
!2302 = !DILocation(line: 4880, scope: !2296)
!2303 = !DILocation(line: 4881, scope: !2296)
!2304 = !DILocation(line: 4882, scope: !2305)
!2305 = distinct !DILexicalBlock(scope: !2306, file: !39, line: 4881)
!2306 = distinct !DILexicalBlock(scope: !2296, file: !39, line: 4881)
!2307 = !DILocation(line: 4885, scope: !2296)
!2308 = !DILocation(line: 4886, scope: !2309)
!2309 = distinct !DILexicalBlock(scope: !2310, file: !39, line: 4885)
!2310 = distinct !DILexicalBlock(scope: !2296, file: !39, line: 4885)
!2311 = !DILocation(line: 4889, scope: !2296)
!2312 = !DILocation(line: 4890, scope: !2296)
!2313 = distinct !DISubprogram(name: "_Allocate<16,std::_Default_allocate_traits,0>", linkageName: "??$_Allocate@$0BA@U_Default_allocate_traits@std@@$0A@@std@@YAPEAX_K@Z", scope: !41, file: !45, line: 221, type: !2314, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2316, retainedNodes: !215)
!2314 = !DISubroutineType(types: !2315)
!2315 = !{!137, !91}
!2316 = !{!2012, !2317, !2013}
!2317 = !DITemplateTypeParameter(name: "_Traits", type: !2318)
!2318 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Default_allocate_traits", scope: !41, file: !45, line: 71, size: 8, align: 8, flags: DIFlagTypePassByValue, elements: !2319, identifier: ".?AU_Default_allocate_traits@std@@")
!2319 = !{!2320}
!2320 = !DISubprogram(name: "_Allocate", linkageName: "?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z", scope: !2318, file: !45, line: 76, type: !2314, scopeLine: 76, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2321 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2313, file: !45, line: 221, type: !91)
!2322 = !DILocation(line: 221, scope: !2313)
!2323 = !DILocation(line: 228, scope: !2324)
!2324 = distinct !DILexicalBlock(scope: !2313, file: !45, line: 227)
!2325 = !DILocation(line: 229, scope: !2326)
!2326 = distinct !DILexicalBlock(scope: !2327, file: !45, line: 228)
!2327 = distinct !DILexicalBlock(scope: !2324, file: !45, line: 228)
!2328 = !DILocation(line: 234, scope: !2313)
!2329 = !DILocation(line: 235, scope: !2330)
!2330 = distinct !DILexicalBlock(scope: !2331, file: !45, line: 234)
!2331 = distinct !DILexicalBlock(scope: !2313, file: !45, line: 234)
!2332 = !DILocation(line: 238, scope: !2313)
!2333 = !DILocation(line: 239, scope: !2313)
!2334 = distinct !DISubprogram(name: "_Get_size_of_n<1>", linkageName: "??$_Get_size_of_n@$00@std@@YA_K_K@Z", scope: !41, file: !45, line: 55, type: !2335, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2337, retainedNodes: !215)
!2335 = !DISubroutineType(types: !2336)
!2336 = !{!63, !91}
!2337 = !{!2338}
!2338 = !DITemplateValueParameter(name: "_Ty_size", type: !35, value: i64 1)
!2339 = !DILocalVariable(name: "_Count", arg: 1, scope: !2334, file: !45, line: 55, type: !91)
!2340 = !DILocation(line: 55, scope: !2334)
!2341 = !DILocalVariable(name: "_Overflow_is_possible", scope: !2334, file: !45, line: 56, type: !76)
!2342 = !DILocation(line: 56, scope: !2334)
!2343 = !DILocation(line: 65, scope: !2334)
!2344 = distinct !DISubprogram(name: "_Allocate_manually_vector_aligned<std::_Default_allocate_traits>", linkageName: "??$_Allocate_manually_vector_aligned@U_Default_allocate_traits@std@@@std@@YAPEAX_K@Z", scope: !41, file: !45, line: 127, type: !2314, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2345, retainedNodes: !215)
!2345 = !{!2317}
!2346 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2344, file: !45, line: 127, type: !91)
!2347 = !DILocation(line: 127, scope: !2344)
!2348 = !DILocalVariable(name: "_Block_size", scope: !2344, file: !45, line: 129, type: !91)
!2349 = !DILocation(line: 129, scope: !2344)
!2350 = !DILocation(line: 130, scope: !2344)
!2351 = !DILocation(line: 131, scope: !2352)
!2352 = distinct !DILexicalBlock(scope: !2353, file: !45, line: 130)
!2353 = distinct !DILexicalBlock(scope: !2344, file: !45, line: 130)
!2354 = !DILocalVariable(name: "_Ptr_container", scope: !2344, file: !45, line: 134, type: !2037)
!2355 = !DILocation(line: 134, scope: !2344)
!2356 = !DILocation(line: 135, scope: !2344)
!2357 = !DILocation(line: 135, scope: !2358)
!2358 = distinct !DILexicalBlock(scope: !2344, file: !45, line: 135)
!2359 = !DILocation(line: 135, scope: !2360)
!2360 = distinct !DILexicalBlock(scope: !2361, file: !45, line: 135)
!2361 = distinct !DILexicalBlock(scope: !2358, file: !45, line: 135)
!2362 = !DILocation(line: 135, scope: !2363)
!2363 = distinct !DILexicalBlock(scope: !2361, file: !45, line: 135)
!2364 = !DILocation(line: 135, scope: !2365)
!2365 = distinct !DILexicalBlock(scope: !2363, file: !45, line: 135)
!2366 = !DILocalVariable(name: "_Ptr", scope: !2344, file: !45, line: 136, type: !2367)
!2367 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !137)
!2368 = !DILocation(line: 136, scope: !2344)
!2369 = !DILocation(line: 137, scope: !2344)
!2370 = !DILocation(line: 142, scope: !2344)
!2371 = distinct !DISubprogram(name: "_Allocate", linkageName: "?_Allocate@_Default_allocate_traits@std@@SAPEAX_K@Z", scope: !2318, file: !45, line: 76, type: !2314, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2320, retainedNodes: !215)
!2372 = !DILocalVariable(name: "_Bytes", arg: 1, scope: !2371, file: !45, line: 76, type: !91)
!2373 = !DILocation(line: 76, scope: !2371)
!2374 = !DILocation(line: 77, scope: !2371)
!2375 = distinct !DISubprogram(name: "_Throw_bad_array_new_length", linkageName: "?_Throw_bad_array_new_length@std@@YAXXZ", scope: !41, file: !1628, line: 323, type: !284, scopeLine: 323, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !36)
!2376 = !DILocation(line: 324, scope: !2375)
!2377 = distinct !DISubprogram(name: "bad_array_new_length", linkageName: "??0bad_array_new_length@std@@QEAA@XZ", scope: !2378, file: !874, line: 139, type: !2426, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2425, retainedNodes: !215)
!2378 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "bad_array_new_length", scope: !41, file: !874, line: 134, size: 192, align: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2379, vtableHolder: !2384, identifier: ".?AVbad_array_new_length@std@@")
!2379 = !{!2380, !2386, !2425}
!2380 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2378, baseType: !2381, flags: DIFlagPublic, extraData: i32 0)
!2381 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "bad_alloc", scope: !41, file: !874, line: 114, size: 192, align: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2382, vtableHolder: !2384, identifier: ".?AVbad_alloc@std@@")
!2382 = !{!2383, !2386, !2418, !2422}
!2383 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2381, baseType: !2384, flags: DIFlagPublic, extraData: i32 0)
!2384 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception", scope: !41, file: !874, line: 48, size: 192, align: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2385, vtableHolder: !2384, identifier: ".?AVexception@std@@")
!2385 = !{!2386, !2387, !2389, !2394, !2398, !2401, !2404, !2409, !2413, !2414}
!2386 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: null, size: 128)
!2387 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$exception", scope: !874, file: !874, baseType: !2388, size: 64, flags: DIFlagArtificial)
!2388 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2386, size: 64)
!2389 = !DIDerivedType(tag: DW_TAG_member, name: "_Data", scope: !2384, file: !874, line: 100, baseType: !2390, size: 128, align: 64, offset: 64)
!2390 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__std_exception_data", file: !874, line: 25, size: 128, align: 64, flags: DIFlagTypePassByValue, elements: !2391, identifier: ".?AU__std_exception_data@@")
!2391 = !{!2392, !2393}
!2392 = !DIDerivedType(tag: DW_TAG_member, name: "_What", scope: !2390, file: !874, line: 27, baseType: !57, size: 64)
!2393 = !DIDerivedType(tag: DW_TAG_member, name: "_DoFree", scope: !2390, file: !874, line: 28, baseType: !77, size: 8, offset: 64)
!2394 = !DISubprogram(name: "exception", scope: !2384, file: !874, line: 52, type: !2395, scopeLine: 52, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2395 = !DISubroutineType(types: !2396)
!2396 = !{null, !2397}
!2397 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2384, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2398 = !DISubprogram(name: "exception", scope: !2384, file: !874, line: 57, type: !2399, scopeLine: 57, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!2399 = !DISubroutineType(types: !2400)
!2400 = !{null, !2397, !322}
!2401 = !DISubprogram(name: "exception", scope: !2384, file: !874, line: 64, type: !2402, scopeLine: 64, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2402 = !DISubroutineType(types: !2403)
!2403 = !{null, !2397, !322, !302}
!2404 = !DISubprogram(name: "exception", scope: !2384, file: !874, line: 70, type: !2405, scopeLine: 70, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2405 = !DISubroutineType(types: !2406)
!2406 = !{null, !2397, !2407}
!2407 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2408, size: 64)
!2408 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2384)
!2409 = !DISubprogram(name: "operator=", linkageName: "??4exception@std@@QEAAAEAV01@AEBV01@@Z", scope: !2384, file: !874, line: 76, type: !2410, scopeLine: 76, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2410 = !DISubroutineType(types: !2411)
!2411 = !{!2412, !2397, !2407}
!2412 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2384, size: 64)
!2413 = !DISubprogram(name: "~exception", scope: !2384, file: !874, line: 88, type: !2395, scopeLine: 88, containingType: !2384, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual)
!2414 = !DISubprogram(name: "what", linkageName: "?what@exception@std@@UEBAPEBDXZ", scope: !2384, file: !874, line: 93, type: !2415, scopeLine: 93, containingType: !2384, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped | DIFlagIntroducedVirtual, spFlags: DISPFlagVirtual)
!2415 = !DISubroutineType(types: !2416)
!2416 = !{!57, !2417}
!2417 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2408, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2418 = !DISubprogram(name: "bad_alloc", scope: !2381, file: !874, line: 119, type: !2419, scopeLine: 119, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2419 = !DISubroutineType(types: !2420)
!2420 = !{null, !2421}
!2421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2381, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2422 = !DISubprogram(name: "bad_alloc", scope: !2381, file: !874, line: 128, type: !2423, scopeLine: 128, flags: DIFlagPrototyped, spFlags: 0)
!2423 = !DISubroutineType(types: !2424)
!2424 = !{null, !2421, !322}
!2425 = !DISubprogram(name: "bad_array_new_length", scope: !2378, file: !874, line: 139, type: !2426, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2426 = !DISubroutineType(types: !2427)
!2427 = !{null, !2428}
!2428 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2378, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2429 = !DILocalVariable(name: "this", arg: 1, scope: !2377, type: !2430, flags: DIFlagArtificial | DIFlagObjectPointer)
!2430 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2378, size: 64)
!2431 = !DILocation(line: 0, scope: !2377)
!2432 = !DILocation(line: 141, scope: !2377)
!2433 = !DILocation(line: 142, scope: !2377)
!2434 = distinct !DISubprogram(name: "bad_array_new_length", linkageName: "??0bad_array_new_length@std@@QEAA@AEBV01@@Z", scope: !2378, file: !874, line: 134, type: !2435, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2439, retainedNodes: !215)
!2435 = !DISubroutineType(types: !2436)
!2436 = !{null, !2428, !2437}
!2437 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2438, size: 64)
!2438 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2378)
!2439 = !DISubprogram(name: "bad_array_new_length", scope: !2378, type: !2435, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: 0)
!2440 = !DILocalVariable(arg: 2, scope: !2434, type: !2437)
!2441 = !DILocation(line: 0, scope: !2434)
!2442 = !DILocalVariable(name: "this", arg: 1, scope: !2434, type: !2430, flags: DIFlagArtificial | DIFlagObjectPointer)
!2443 = !DILocation(line: 134, scope: !2434)
!2444 = distinct !DISubprogram(name: "bad_alloc", linkageName: "??0bad_alloc@std@@QEAA@AEBV01@@Z", scope: !2381, file: !874, line: 114, type: !2445, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2449, retainedNodes: !215)
!2445 = !DISubroutineType(types: !2446)
!2446 = !{null, !2421, !2447}
!2447 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2448, size: 64)
!2448 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2381)
!2449 = !DISubprogram(name: "bad_alloc", scope: !2381, type: !2445, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: 0)
!2450 = !DILocalVariable(arg: 2, scope: !2444, type: !2447)
!2451 = !DILocation(line: 0, scope: !2444)
!2452 = !DILocalVariable(name: "this", arg: 1, scope: !2444, type: !2453, flags: DIFlagArtificial | DIFlagObjectPointer)
!2453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2381, size: 64)
!2454 = !DILocation(line: 114, scope: !2444)
!2455 = distinct !DISubprogram(name: "exception", linkageName: "??0exception@std@@QEAA@AEBV01@@Z", scope: !2384, file: !874, line: 70, type: !2405, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2404, retainedNodes: !215)
!2456 = !DILocalVariable(name: "_Other", arg: 2, scope: !2455, file: !874, line: 70, type: !2407)
!2457 = !DILocation(line: 70, scope: !2455)
!2458 = !DILocalVariable(name: "this", arg: 1, scope: !2455, type: !2459, flags: DIFlagArtificial | DIFlagObjectPointer)
!2459 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2384, size: 64)
!2460 = !DILocation(line: 0, scope: !2455)
!2461 = !DILocation(line: 72, scope: !2455)
!2462 = !DILocation(line: 73, scope: !2463)
!2463 = distinct !DILexicalBlock(scope: !2455, file: !874, line: 72)
!2464 = !DILocation(line: 74, scope: !2455)
!2465 = distinct !DISubprogram(name: "~bad_array_new_length", linkageName: "??1bad_array_new_length@std@@UEAA@XZ", scope: !2378, file: !874, line: 134, type: !2426, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2466, retainedNodes: !215)
!2466 = !DISubprogram(name: "~bad_array_new_length", scope: !2378, type: !2426, containingType: !2378, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual)
!2467 = !DILocalVariable(name: "this", arg: 1, scope: !2465, type: !2430, flags: DIFlagArtificial | DIFlagObjectPointer)
!2468 = !DILocation(line: 0, scope: !2465)
!2469 = !DILocation(line: 134, scope: !2470)
!2470 = distinct !DILexicalBlock(scope: !2465, file: !874, line: 134)
!2471 = !DILocation(line: 134, scope: !2465)
!2472 = distinct !DISubprogram(name: "bad_alloc", linkageName: "??0bad_alloc@std@@AEAA@QEBD@Z", scope: !2381, file: !874, line: 128, type: !2423, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2422, retainedNodes: !215)
!2473 = !DILocalVariable(name: "_Message", arg: 2, scope: !2472, file: !874, line: 128, type: !322)
!2474 = !DILocation(line: 128, scope: !2472)
!2475 = !DILocalVariable(name: "this", arg: 1, scope: !2472, type: !2453, flags: DIFlagArtificial | DIFlagObjectPointer)
!2476 = !DILocation(line: 0, scope: !2472)
!2477 = !DILocation(line: 130, scope: !2472)
!2478 = !DILocation(line: 131, scope: !2472)
!2479 = distinct !DISubprogram(name: "~bad_array_new_length", linkageName: "??_Gbad_array_new_length@std@@UEAAPEAXI@Z", scope: !2378, file: !874, line: 134, type: !2426, scopeLine: 134, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2466, retainedNodes: !215)
!2480 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2479, type: !302, flags: DIFlagArtificial)
!2481 = !DILocation(line: 0, scope: !2479)
!2482 = !DILocalVariable(name: "this", arg: 1, scope: !2479, type: !2430, flags: DIFlagArtificial | DIFlagObjectPointer)
!2483 = !DILocation(line: 134, scope: !2479)
!2484 = distinct !DISubprogram(name: "what", linkageName: "?what@exception@std@@UEBAPEBDXZ", scope: !2384, file: !874, line: 93, type: !2415, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2414, retainedNodes: !215)
!2485 = !DILocalVariable(name: "this", arg: 1, scope: !2484, type: !2486, flags: DIFlagArtificial | DIFlagObjectPointer)
!2486 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2408, size: 64)
!2487 = !DILocation(line: 0, scope: !2484)
!2488 = !DILocation(line: 95, scope: !2484)
!2489 = distinct !DISubprogram(name: "exception", linkageName: "??0exception@std@@QEAA@QEBDH@Z", scope: !2384, file: !874, line: 64, type: !2402, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2401, retainedNodes: !215)
!2490 = !DILocalVariable(arg: 3, scope: !2489, file: !874, line: 64, type: !302)
!2491 = !DILocation(line: 64, scope: !2489)
!2492 = !DILocalVariable(name: "_Message", arg: 2, scope: !2489, file: !874, line: 64, type: !322)
!2493 = !DILocalVariable(name: "this", arg: 1, scope: !2489, type: !2459, flags: DIFlagArtificial | DIFlagObjectPointer)
!2494 = !DILocation(line: 0, scope: !2489)
!2495 = !DILocation(line: 66, scope: !2489)
!2496 = !DILocation(line: 67, scope: !2497)
!2497 = distinct !DILexicalBlock(scope: !2489, file: !874, line: 66)
!2498 = !DILocation(line: 68, scope: !2489)
!2499 = distinct !DISubprogram(name: "~bad_alloc", linkageName: "??_Gbad_alloc@std@@UEAAPEAXI@Z", scope: !2381, file: !874, line: 114, type: !2419, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2500, retainedNodes: !215)
!2500 = !DISubprogram(name: "~bad_alloc", scope: !2381, type: !2419, containingType: !2381, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual)
!2501 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2499, type: !302, flags: DIFlagArtificial)
!2502 = !DILocation(line: 0, scope: !2499)
!2503 = !DILocalVariable(name: "this", arg: 1, scope: !2499, type: !2453, flags: DIFlagArtificial | DIFlagObjectPointer)
!2504 = !DILocation(line: 114, scope: !2499)
!2505 = distinct !DISubprogram(name: "~exception", linkageName: "??_Gexception@std@@UEAAPEAXI@Z", scope: !2384, file: !874, line: 88, type: !2395, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2413, retainedNodes: !215)
!2506 = !DILocalVariable(name: "should_call_delete", arg: 2, scope: !2505, type: !302, flags: DIFlagArtificial)
!2507 = !DILocation(line: 0, scope: !2505)
!2508 = !DILocalVariable(name: "this", arg: 1, scope: !2505, type: !2459, flags: DIFlagArtificial | DIFlagObjectPointer)
!2509 = !DILocation(line: 89, scope: !2505)
!2510 = !DILocation(line: 91, scope: !2505)
!2511 = distinct !DISubprogram(name: "~exception", linkageName: "??1exception@std@@UEAA@XZ", scope: !2384, file: !874, line: 88, type: !2395, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2413, retainedNodes: !215)
!2512 = !DILocalVariable(name: "this", arg: 1, scope: !2511, type: !2459, flags: DIFlagArtificial | DIFlagObjectPointer)
!2513 = !DILocation(line: 0, scope: !2511)
!2514 = !DILocation(line: 89, scope: !2511)
!2515 = !DILocation(line: 90, scope: !2516)
!2516 = distinct !DILexicalBlock(scope: !2511, file: !874, line: 89)
!2517 = !DILocation(line: 91, scope: !2511)
!2518 = distinct !DISubprogram(name: "~bad_alloc", linkageName: "??1bad_alloc@std@@UEAA@XZ", scope: !2381, file: !874, line: 114, type: !2419, scopeLine: 114, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, declaration: !2500, retainedNodes: !215)
!2519 = !DILocalVariable(name: "this", arg: 1, scope: !2518, type: !2453, flags: DIFlagArtificial | DIFlagObjectPointer)
!2520 = !DILocation(line: 0, scope: !2518)
!2521 = !DILocation(line: 114, scope: !2522)
!2522 = distinct !DILexicalBlock(scope: !2518, file: !874, line: 114)
!2523 = !DILocation(line: 114, scope: !2518)
!2524 = distinct !DISubprogram(name: "_Voidify_iter<char **>", linkageName: "??$_Voidify_iter@PEAPEAD@std@@YAPEAXPEAPEAD@Z", scope: !41, file: !421, line: 200, type: !2525, scopeLine: 200, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, templateParams: !2527, retainedNodes: !215)
!2525 = !DISubroutineType(types: !2526)
!2526 = !{!137, !1478}
!2527 = !{!2528}
!2528 = !DITemplateTypeParameter(name: "_Iter", type: !1478)
!2529 = !DILocalVariable(name: "_It", arg: 1, scope: !2524, file: !421, line: 200, type: !1478)
!2530 = !DILocation(line: 200, scope: !2524)
!2531 = !DILocation(line: 202, scope: !2532)
!2532 = distinct !DILexicalBlock(scope: !2533, file: !421, line: 201)
!2533 = distinct !DILexicalBlock(scope: !2524, file: !421, line: 201)
