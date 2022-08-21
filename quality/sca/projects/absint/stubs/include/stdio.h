/**
 * @file      stdio.h
 * @author    Sergey Baigudin, sergey@baigudin.software
 * @copyright 2022, Sergey Baigudin, Baigudin Software
 */
#ifndef POSIX_STDIO_H_
#define POSIX_STDIO_H_

#include "sys/types.h"

struct _IO_FILE;
typedef struct _IO_FILE FILE;

extern FILE* stdin;
extern FILE* stdout;
extern FILE* stderr;

int fputs(const char*, FILE*);
int fflush(FILE*);

#endif // POSIX_STDIO_H_
