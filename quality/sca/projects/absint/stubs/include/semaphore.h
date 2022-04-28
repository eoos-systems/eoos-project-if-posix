/**
 * @file      semaphore.h
 * @author    Sergey Baigudin, sergey@baigudin.software
 * @copyright 2022, Sergey Baigudin, Baigudin Software
 */
#ifndef POSIX_SEMAPHORE_H_
#define POSIX_SEMAPHORE_H_

#include "sys/types.h"

# define __SIZEOF_SEM_T	32

#define SEM_FAILED ((sem_t *) 0)

typedef union
{
  char __size[__SIZEOF_SEM_T];
  long int __align;
} sem_t;

extern int sem_init(sem_t*, int, unsigned int);
extern int sem_destroy(sem_t*);
extern int sem_wait(sem_t*);
extern int sem_post(sem_t*);

#endif // POSIX_SEMAPHORE_H_