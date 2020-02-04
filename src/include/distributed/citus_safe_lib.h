/*-------------------------------------------------------------------------
 *
 * safe_lib.h
 *
 * This file contains helper macros to make the _s suffix string and buffer
 * functions from safestringlib easier to use.
 *
 * Copyright (c) Citus Data, Inc.
 *
 *-------------------------------------------------------------------------
 */

#ifndef CITUS_safe_lib_H
#define CITUS_safe_lib_H

#include "safe_lib.h"

extern void ErrnoToEreport(char *functionName, errno_t err);

#define s_func_to_ereport(functionName, ...) \
	ErrnoToEreport(# functionName, (functionName) (__VA_ARGS__))

#define strncpy_ereport(...) s_func_to_ereport(strncpy_s, __VA_ARGS__)
#define strcpy_ereport(...) s_func_to_ereport(strcpy_s, __VA_ARGS__)
#define memcpy_ereport(...) s_func_to_ereport(memcpy_s, __VA_ARGS__)

#endif
