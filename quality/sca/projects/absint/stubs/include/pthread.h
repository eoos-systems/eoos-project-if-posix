/**
 * @file      pthread.h
 * @author    Sergey Baigudin, sergey@baigudin.software
 * @copyright 2022, Sergey Baigudin, Baigudin Software
 */
#ifndef POSIX_PTHREAD_H_
#define POSIX_PTHREAD_H_

#include "sys/types.h"

#define __SIZEOF_PTHREAD_ATTR_T       56
#define __SIZEOF_PTHREAD_MUTEX_T      40 
#define __SIZEOF_PTHREAD_MUTEXATTR_T  4 

typedef unsigned long int pthread_t;

union pthread_attr_t
{
  char __size[__SIZEOF_PTHREAD_ATTR_T];
  long int __align;
};

enum
{
  PTHREAD_CANCEL_ENABLE,
  PTHREAD_CANCEL_DISABLE
};

enum
{
  PTHREAD_CANCEL_DEFERRED,
  PTHREAD_CANCEL_ASYNCHRONOUS
};

typedef union
{
  char __size[__SIZEOF_PTHREAD_MUTEX_T];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[__SIZEOF_PTHREAD_MUTEXATTR_T];
  int __align;
} pthread_mutexattr_t;

extern int pthread_detach(pthread_t);
extern int pthread_attr_setstacksize(pthread_attr_t*, size_t);
extern int pthread_create(pthread_t*, const pthread_attr_t*, void* (*)(void*), void*);
extern int pthread_join(pthread_t, void**);	
extern int pthread_setcancelstate(int, int*);
extern int pthread_setcanceltype(int, int*);
extern int pthread_attr_init(pthread_attr_t*);
extern int pthread_attr_destroy(pthread_attr_t*);

extern int pthread_mutex_init(pthread_mutex_t*, const pthread_mutexattr_t*);
extern int pthread_mutex_destroy(pthread_mutex_t*);
extern int pthread_mutex_lock(pthread_mutex_t*);
extern int pthread_mutex_trylock(pthread_mutex_t*);
extern int pthread_mutex_unlock(pthread_mutex_t*);
	
#endif // POSIX_PTHREAD_H_
