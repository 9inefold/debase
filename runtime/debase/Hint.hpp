//===- debase/Hint.hpp ----------------------------------------------------===//
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
/// This file implements user-provided hints for the debaser.
///
//===----------------------------------------------------------------------===//

#pragma once

#include <debase/Features.hpp>

DEBASE_BEGIN_EXTERN_C

/// Marks the start of a function body.
DEBASE_ANNOTATION_CC void __debase_mark_begin(void);

/// Marks the end of a function body.
DEBASE_ANNOTATION_CC void __debase_mark_end(void);

/// Marks the start of a constructor body.
#define __debase_ctor_begin() __debase_mark_begin()

/// Marks the end of a constructor body.
#define __debase_ctor_end() __debase_mark_begin()

/// Marks the start of a destructor body.
#define __debase_dtor_begin() __debase_mark_begin()

/// Marks the end of a destructor body. Rarely needed.
#define __debase_dtor_end() __debase_mark_begin()

DEBASE_END_EXTERN_C

////////////////////////////////////////////////////////////////////////////////

#ifdef __cplusplus
namespace debase {

/// Marks the start of a function body.
DEBASE_ANNOTATION_CC void mark_begin(void)
	__asm__("__debase_mark_begin");

/// Marks the end of a function body.
DEBASE_ANNOTATION_CC void mark_end(void)
	__asm__("__debase_mark_end");

/// Marks the start of a constructor body.
DEBASE_ANNOTATION_CC void ctor_begin(void)
	__asm__("__debase_mark_begin");

/// Marks the end of a constructor body.
DEBASE_ANNOTATION_CC void ctor_end(void)
	__asm__("__debase_mark_end");

/// Marks the start of a destructor body. Rarely needed.
DEBASE_ANNOTATION_CC void dtor_begin(void)
	__asm__("__debase_mark_begin");

/// Marks the end of a destructor body.
DEBASE_ANNOTATION_CC void dtor_end(void)
	__asm__("__debase_mark_end");

} // namespace debase
#endif
