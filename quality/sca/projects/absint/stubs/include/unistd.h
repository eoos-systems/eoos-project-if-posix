/**
 * @file      unistd.h
 * @author    Sergey Baigudin, sergey@baigudin.software
 * @copyright 2022, Sergey Baigudin, Baigudin Software
 */
#ifndef POSIX_UNISTD_H_
#define POSIX_UNISTD_H_

#include "sys/types.h"

typedef unsigned int  useconds_t;

extern unsigned int sleep(unsigned int seconds);
extern int usleep(useconds_t);

#endif // POSIX_UNISTD_H_

