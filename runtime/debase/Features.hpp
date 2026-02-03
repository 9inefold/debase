//===- debase/Features.hpp ------------------------------------------------===//
//
// Copyright (C) 2025-2026 Ninefold
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
#if defined(_MSC_VER) || defined(_MSVC_LANG)
# define DEBASE_MSVC 1
#endif

#ifndef __has_attribute
# error __has_attribute(x) is required!
#endif
#if !defined(__has_cpp_attribute) && defined(__cplusplus)
# error __has_cpp_attribute(x) is required!
#endif

#define DEBASE_XSTRINGIFY(...) #__VA_ARGS__
#define DEBASE_STRINGIFY(...) DEBASE_XSTRINGIFY(__VA_ARGS__)

#define DEBASE_EXPAND(...) __VA_ARGS__
#define DEBASE_EXPAND2(PARENS) DEBASE_EXPAND PARENS

#ifdef __cplusplus
# define DEBASE_BEGIN_EXTERN_C extern "C" {
# define DEBASE_END_EXTERN_C }
# define DEBASE_NOEXCEPT noexcept
#else
# define DEBASE_BEGIN_EXTERN_C
# define DEBASE_END_EXTERN_C
# define DEBASE_NOEXCEPT
#endif

#if DEBASE_MSVC
# define DEBASE_ALWAYS_INLINE __forceinline
#elif __has_attribute(always_inline)
# define DEBASE_ALWAYS_INLINE __attribute__((always_inline)) inline
#else
# define DEBASE_ALWAYS_INLINE inline
#endif

#if DEBASE_MSVC
# define DEBASE_NEVER_INLINE __declspec(noinline)
#elif __has_attribute(noinline)
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

//============================================================================//
// Annotations
//============================================================================//

/// Makes annotations as unintrusive as possible.
#define DEBASE_ANNOTATION_CC                                                  \
  DEBASE_NEVER_INLINE                                                         \
  DEBASE_NO_TAIL                                                              \
  DEBASE_PRESERVE_MOST

/// Generates an annotation in the form `RET NAME(ARGS...)`.
#define DEBASE_ANNOTATION_DEFINE(NAME, RET, ARGS)                             \
DEBASE_ANNOTATION_CC RET NAME(DEBASE_EXPAND2(ARGS)) DEBASE_NOEXCEPT;

/// Generates alias for `NAME -> __debase_NAME`.
#define DEBASE_ANNOTATION_ALIAS(NAME)                                         \
DEBASE_ANNOTATION_CC decltype(__debase_##NAME) NAME                           \
  __asm__(DEBASE_STRINGIFY(__debase_##NAME));
