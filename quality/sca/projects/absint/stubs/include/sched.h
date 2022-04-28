/**
 * @file      sched.h
 * @author    Sergey Baigudin, sergey@baigudin.software
 * @copyright 2022, Sergey Baigudin, Baigudin Software
 */
#ifndef POSIX_SCHED_H_
#define POSIX_SCHED_H_

#include "sys/types.h"

#define SCHED_OTHER         0
#define SCHED_FIFO          1
#define SCHED_RR            2
# define SCHED_BATCH        3
#define SCHED_ISO           4
#define SCHED_IDLE          5
#define SCHED_DEADLINE      6
#define SCHED_RESET_ON_FORK 0x40000000

extern int sched_yield(void);
extern int sched_getscheduler(pid_t);

#endif // POSIX_SCHED_H_

