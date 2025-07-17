//===- debase/Features.hpp ------------------------------------------------===//
//
// Copyright (C) 2025 Eightfold
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
/// This file tests for features.
///
//===----------------------------------------------------------------------===//

#pragma once

#ifndef __clang__
# error Debase requires llvmir output, and therefore can only be used on clang!
#endif

#ifndef __has_attribute
# error __has_attribute(x) is required!
#endif
#if !defined(__has_cpp_attribute) && defined(__cplusplus)
# error __has_cpp_attribute(x) is required!
#endif

#ifdef __cplusplus
# define DEBASE_BEGIN_EXTERN_C extern "C" {
# define DEBASE_END_EXTERN_C }
#else
# define DEBASE_BEGIN_EXTERN_C
# define DEBASE_END_EXTERN_C
#endif

#if __has_attribute(always_inline)
# define DEBASE_ALWAYS_INLINE __attribute__((always_inline)) inline
#else
# define DEBASE_ALWAYS_INLINE inline
#endif

#if __has_attribute(noinline)
# define DEBASE_NEVER_INLINE __attribute__((noinline))
#else
# define DEBASE_NEVER_INLINE
#endif

#if __has_attribute(not_tail_called)
# define DEBASE_NO_TAIL __attribute__((not_tail_called))
#else
# define DEBASE_NO_TAIL
#endif

#if __has_attribute(preserve_most)
# define DEBASE_PRESERVE_MOST __attribute__((preserve_most))
#else
# define DEBASE_PRESERVE_MOST
#endif

/// Makes annotations as unintrusive as possible.
#define DEBASE_ANNOTATION_CC																									\
	DEBASE_NEVER_INLINE																													\
	DEBASE_NO_TAIL																															\
	DEBASE_PRESERVE_MOST
