(PROGN
 (EVAL-WHEN (:COMPILE-TOPLEVEL :LOAD-TOPLEVEL :EXECUTE)
   (SETF AUTOWRAP::*FAILED-WRAPS* NIL)
   (SETF AUTOWRAP::*MUTE-REPORTING-P* NIL)
   (PROGN
    (SETF AUTOWRAP::*FOREIGN-RECORD-INDEX* (MAKE-HASH-TABLE))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__U_CHAR ':UNSIGNED-CHAR)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__U_SHORT ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__U_INT ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__U_LONG ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__INT8_T ':CHAR)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__UINT8_T ':UNSIGNED-CHAR)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__INT16_T ':SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__UINT16_T ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__INT32_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__UINT32_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__INT64_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__UINT64_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__QUAD_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__U_QUAD_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__DEV_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__UID_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__GID_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__INO_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__INO64_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__MODE_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__NLINK_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__OFF_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__OFF64_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__PID_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__FSID_T
                                   '(AUTOWRAP::STRUCT
                                     (NIL :ID 1 :BIT-SIZE 64 :BIT-ALIGNMENT 32)
                                     (:__VAL (:ARRAY :INT 2) :BIT-SIZE 64
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 32)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__CLOCK_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__RLIM_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__RLIM64_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__ID_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__TIME_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__USECONDS_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__SUSECONDS_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__DADDR_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KEY_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__CLOCKID_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__TIMER_T '(:POINTER :VOID))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__BLKSIZE_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__BLKCNT_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__BLKCNT64_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__FSBLKCNT_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__FSBLKCNT64_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__FSFILCNT_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__FSFILCNT64_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__FSWORD_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__SSIZE_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__SYSCALL_SLONG_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__SYSCALL_ULONG_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__LOFF_T '__OFF64_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__QADDR_T '(:POINTER __QUAD_T))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__CADDR_T '(:STRING))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__INTPTR_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__SOCKLEN_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-CHAR '__U_CHAR)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-SHORT '__U_SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-INT '__U_INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-LONG '__U_LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'QUAD-T '__QUAD_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-QUAD-T '__U_QUAD_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'FSID-T '__FSID_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'LOFF-T '__LOFF_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'INO-T '__INO_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'DEV-T '__DEV_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'GID-T '__GID_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'MODE-T '__MODE_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'NLINK-T '__NLINK_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'UID-T '__UID_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'OFF-T '__OFF_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PID-T '__PID_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'ID-T '__ID_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'SSIZE-T '__SSIZE_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'DADDR-T '__DADDR_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'CADDR-T '__CADDR_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'KEY-T '__KEY_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'CLOCK-T '__CLOCK_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'TIME-T '__TIME_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'CLOCKID-T '__CLOCKID_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'TIMER-T '__TIMER_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'ULONG ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'USHORT ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'UINT ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'INT8-T ':CHAR)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'INT16-T ':SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'INT32-T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'INT64-T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-INT8-T ':UNSIGNED-CHAR)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-INT16-T ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-INT32-T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'U-INT64-T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'REGISTER-T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__SIG_ATOMIC_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__SIGSET_T
                                   '(AUTOWRAP::STRUCT
                                     (NIL :ID 2 :BIT-SIZE 1024 :BIT-ALIGNMENT
                                      64)
                                     (:__VAL (:ARRAY :UNSIGNED-LONG 16)
                                      :BIT-SIZE 1024 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'SIGSET-T '__SIGSET_T)
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'TIMESPEC :STRUCT 128 64
                                    '((:TV-SEC __TIME_T :BIT-SIZE 64
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 64)
                                      (:TV-NSEC __SYSCALL_SLONG_T :BIT-SIZE 64
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'TIMEVAL :STRUCT 128 64
                                    '((:TV-SEC __TIME_T :BIT-SIZE 64
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 64)
                                      (:TV-USEC __SUSECONDS_T :BIT-SIZE 64
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'SUSECONDS-T '__SUSECONDS_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__FD_MASK ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'FD-SET
                                   '(AUTOWRAP::STRUCT
                                     (NIL :ID 3 :BIT-SIZE 1024 :BIT-ALIGNMENT
                                      64)
                                     (:__FDS_BITS (:ARRAY __FD_MASK 16)
                                      :BIT-SIZE 1024 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'FD-MASK '__FD_MASK)
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(SELECT "select") ':INT
                                      '((__NFDS :INT)
                                        (__READFDS (:POINTER FD-SET))
                                        (__WRITEFDS (:POINTER FD-SET))
                                        (__EXCEPTFDS (:POINTER FD-SET))
                                        (__TIMEOUT
                                         (:POINTER (:STRUCT (TIMEVAL))))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(PSELECT "pselect") ':INT
                                      '((__NFDS :INT)
                                        (__READFDS (:POINTER FD-SET))
                                        (__WRITEFDS (:POINTER FD-SET))
                                        (__EXCEPTFDS (:POINTER FD-SET))
                                        (__TIMEOUT
                                         (:POINTER (:STRUCT (TIMESPEC))))
                                        (__SIGMASK (:POINTER __SIGSET_T))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(GNU-DEV-MAJOR "gnu_dev_major")
                                      ':UNSIGNED-INT
                                      '((__DEV :UNSIGNED-LONG-LONG)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(GNU-DEV-MINOR "gnu_dev_minor")
                                      ':UNSIGNED-INT
                                      '((__DEV :UNSIGNED-LONG-LONG)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(GNU-DEV-MAKEDEV "gnu_dev_makedev")
                                      ':UNSIGNED-LONG-LONG
                                      '((__MAJOR :UNSIGNED-INT)
                                        (__MINOR :UNSIGNED-INT)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'BLKSIZE-T '__BLKSIZE_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'BLKCNT-T '__BLKCNT_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'FSBLKCNT-T '__FSBLKCNT_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'FSFILCNT-T '__FSFILCNT_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'PTHREAD-ATTR-T :UNION 448 64
                                    '((:__SIZE (:ARRAY :CHAR 56) :BIT-SIZE 448
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                      (:__ALIGN :LONG :BIT-SIZE 64 :BIT-OFFSET
                                       0 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-ATTR-T '(:UNION (PTHREAD-ATTR-T)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD '__PTHREAD_INTERNAL_LIST :STRUCT 128 64
                                    '((:__PREV
                                       (:POINTER
                                        (:STRUCT (__PTHREAD_INTERNAL_LIST)))
                                       :BIT-SIZE 64 :BIT-OFFSET 0
                                       :BIT-ALIGNMENT 64)
                                      (:__NEXT
                                       (:POINTER
                                        (:STRUCT (__PTHREAD_INTERNAL_LIST)))
                                       :BIT-SIZE 64 :BIT-OFFSET 64
                                       :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__PTHREAD_LIST_T
                                   '(:STRUCT (__PTHREAD_INTERNAL_LIST)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD '__PTHREAD_MUTEX_S :STRUCT 320 64
                                    '((:__LOCK :INT :BIT-SIZE 32 :BIT-OFFSET 0
                                       :BIT-ALIGNMENT 32)
                                      (:__COUNT :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 32)
                                      (:__OWNER :INT :BIT-SIZE 32 :BIT-OFFSET
                                       64 :BIT-ALIGNMENT 32)
                                      (:__NUSERS :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 96 :BIT-ALIGNMENT 32)
                                      (:__KIND :INT :BIT-SIZE 32 :BIT-OFFSET
                                       128 :BIT-ALIGNMENT 32)
                                      (:__SPINS :SHORT :BIT-SIZE 16 :BIT-OFFSET
                                       160 :BIT-ALIGNMENT 16)
                                      (:__ELISION :SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 176 :BIT-ALIGNMENT 16)
                                      (:__LIST __PTHREAD_LIST_T :BIT-SIZE 128
                                       :BIT-OFFSET 192 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-MUTEX-T
                                   '(UNION
                                     (NIL :ID 8 :BIT-SIZE 320 :BIT-ALIGNMENT
                                      64)
                                     (:__DATA (:STRUCT (__PTHREAD_MUTEX_S))
                                      :BIT-SIZE 320 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)
                                     (:__SIZE (:ARRAY :CHAR 40) :BIT-SIZE 320
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                     (:__ALIGN :LONG :BIT-SIZE 64 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-MUTEXATTR-T
                                   '(UNION
                                     (NIL :ID 10 :BIT-SIZE 32 :BIT-ALIGNMENT
                                      32)
                                     (:__SIZE (:ARRAY :CHAR 4) :BIT-SIZE 32
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                     (:__ALIGN :INT :BIT-SIZE 32 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 32)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-COND-T
                                   '(UNION
                                     (NIL :ID 11 :BIT-SIZE 384 :BIT-ALIGNMENT
                                      64)
                                     (:__DATA
                                      (AUTOWRAP::STRUCT
                                       (NIL :ID 12 :BIT-SIZE 384 :BIT-ALIGNMENT
                                        64)
                                       (:__LOCK :INT :BIT-SIZE 32 :BIT-OFFSET 0
                                        :BIT-ALIGNMENT 32)
                                       (:__FUTEX :UNSIGNED-INT :BIT-SIZE 32
                                        :BIT-OFFSET 32 :BIT-ALIGNMENT 32)
                                       (:__TOTAL_SEQ :UNSIGNED-LONG-LONG
                                        :BIT-SIZE 64 :BIT-OFFSET 64
                                        :BIT-ALIGNMENT 64)
                                       (:__WAKEUP_SEQ :UNSIGNED-LONG-LONG
                                        :BIT-SIZE 64 :BIT-OFFSET 128
                                        :BIT-ALIGNMENT 64)
                                       (:__WOKEN_SEQ :UNSIGNED-LONG-LONG
                                        :BIT-SIZE 64 :BIT-OFFSET 192
                                        :BIT-ALIGNMENT 64)
                                       (:__MUTEX (:POINTER :VOID) :BIT-SIZE 64
                                        :BIT-OFFSET 256 :BIT-ALIGNMENT 64)
                                       (:__NWAITERS :UNSIGNED-INT :BIT-SIZE 32
                                        :BIT-OFFSET 320 :BIT-ALIGNMENT 32)
                                       (:__BROADCAST_SEQ :UNSIGNED-INT
                                        :BIT-SIZE 32 :BIT-OFFSET 352
                                        :BIT-ALIGNMENT 32))
                                      :BIT-SIZE 384 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)
                                     (:__SIZE (:ARRAY :CHAR 48) :BIT-SIZE 384
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                     (:__ALIGN :LONG-LONG :BIT-SIZE 64
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-CONDATTR-T
                                   '(UNION
                                     (NIL :ID 13 :BIT-SIZE 32 :BIT-ALIGNMENT
                                      32)
                                     (:__SIZE (:ARRAY :CHAR 4) :BIT-SIZE 32
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                     (:__ALIGN :INT :BIT-SIZE 32 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 32)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-KEY-T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-ONCE-T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-RWLOCK-T
                                   '(UNION
                                     (NIL :ID 14 :BIT-SIZE 448 :BIT-ALIGNMENT
                                      64)
                                     (:__DATA
                                      (AUTOWRAP::STRUCT
                                       (NIL :ID 15 :BIT-SIZE 448 :BIT-ALIGNMENT
                                        64)
                                       (:__LOCK :INT :BIT-SIZE 32 :BIT-OFFSET 0
                                        :BIT-ALIGNMENT 32)
                                       (:__NR_READERS :UNSIGNED-INT :BIT-SIZE
                                        32 :BIT-OFFSET 32 :BIT-ALIGNMENT 32)
                                       (:__READERS_WAKEUP :UNSIGNED-INT
                                        :BIT-SIZE 32 :BIT-OFFSET 64
                                        :BIT-ALIGNMENT 32)
                                       (:__WRITER_WAKEUP :UNSIGNED-INT
                                        :BIT-SIZE 32 :BIT-OFFSET 96
                                        :BIT-ALIGNMENT 32)
                                       (:__NR_READERS_QUEUED :UNSIGNED-INT
                                        :BIT-SIZE 32 :BIT-OFFSET 128
                                        :BIT-ALIGNMENT 32)
                                       (:__NR_WRITERS_QUEUED :UNSIGNED-INT
                                        :BIT-SIZE 32 :BIT-OFFSET 160
                                        :BIT-ALIGNMENT 32)
                                       (:__WRITER :INT :BIT-SIZE 32 :BIT-OFFSET
                                        192 :BIT-ALIGNMENT 32)
                                       (:__SHARED :INT :BIT-SIZE 32 :BIT-OFFSET
                                        224 :BIT-ALIGNMENT 32)
                                       (:__RWELISION :CHAR :BIT-SIZE 8
                                        :BIT-OFFSET 256 :BIT-ALIGNMENT 8)
                                       (:__PAD1 (:ARRAY :UNSIGNED-CHAR 7)
                                        :BIT-SIZE 56 :BIT-OFFSET 264
                                        :BIT-ALIGNMENT 8)
                                       (:__PAD2 :UNSIGNED-LONG :BIT-SIZE 64
                                        :BIT-OFFSET 320 :BIT-ALIGNMENT 64)
                                       (:__FLAGS :UNSIGNED-INT :BIT-SIZE 32
                                        :BIT-OFFSET 384 :BIT-ALIGNMENT 32))
                                      :BIT-SIZE 448 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)
                                     (:__SIZE (:ARRAY :CHAR 56) :BIT-SIZE 448
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                     (:__ALIGN :LONG :BIT-SIZE 64 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-RWLOCKATTR-T
                                   '(UNION
                                     (NIL :ID 16 :BIT-SIZE 64 :BIT-ALIGNMENT
                                      64)
                                     (:__SIZE (:ARRAY :CHAR 8) :BIT-SIZE 64
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                     (:__ALIGN :LONG :BIT-SIZE 64 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-SPINLOCK-T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-BARRIER-T
                                   '(UNION
                                     (NIL :ID 17 :BIT-SIZE 256 :BIT-ALIGNMENT
                                      64)
                                     (:__SIZE (:ARRAY :CHAR 32) :BIT-SIZE 256
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                     (:__ALIGN :LONG :BIT-SIZE 64 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS 'PTHREAD-BARRIERATTR-T
                                   '(UNION
                                     (NIL :ID 18 :BIT-SIZE 32 :BIT-ALIGNMENT
                                      32)
                                     (:__SIZE (:ARRAY :CHAR 4) :BIT-SIZE 32
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                     (:__ALIGN :INT :BIT-SIZE 32 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 32)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'STAT :STRUCT 1152 64
                                    '((:ST-DEV __DEV_T :BIT-SIZE 64 :BIT-OFFSET
                                       0 :BIT-ALIGNMENT 64)
                                      (:ST-INO __INO_T :BIT-SIZE 64 :BIT-OFFSET
                                       64 :BIT-ALIGNMENT 64)
                                      (:ST-NLINK __NLINK_T :BIT-SIZE 64
                                       :BIT-OFFSET 128 :BIT-ALIGNMENT 64)
                                      (:ST-MODE __MODE_T :BIT-SIZE 32
                                       :BIT-OFFSET 192 :BIT-ALIGNMENT 32)
                                      (:ST-UID __UID_T :BIT-SIZE 32 :BIT-OFFSET
                                       224 :BIT-ALIGNMENT 32)
                                      (:ST-GID __GID_T :BIT-SIZE 32 :BIT-OFFSET
                                       256 :BIT-ALIGNMENT 32)
                                      (:__PAD0 :INT :BIT-SIZE 32 :BIT-OFFSET
                                       288 :BIT-ALIGNMENT 32)
                                      (:ST-RDEV __DEV_T :BIT-SIZE 64
                                       :BIT-OFFSET 320 :BIT-ALIGNMENT 64)
                                      (:ST-SIZE __OFF_T :BIT-SIZE 64
                                       :BIT-OFFSET 384 :BIT-ALIGNMENT 64)
                                      (:ST-BLKSIZE __BLKSIZE_T :BIT-SIZE 64
                                       :BIT-OFFSET 448 :BIT-ALIGNMENT 64)
                                      (:ST-BLOCKS __BLKCNT_T :BIT-SIZE 64
                                       :BIT-OFFSET 512 :BIT-ALIGNMENT 64)
                                      (:ST-ATIM (:STRUCT (TIMESPEC)) :BIT-SIZE
                                       128 :BIT-OFFSET 576 :BIT-ALIGNMENT 64)
                                      (:ST-MTIM (:STRUCT (TIMESPEC)) :BIT-SIZE
                                       128 :BIT-OFFSET 704 :BIT-ALIGNMENT 64)
                                      (:ST-CTIM (:STRUCT (TIMESPEC)) :BIT-SIZE
                                       128 :BIT-OFFSET 832 :BIT-ALIGNMENT 64)
                                      (:__GLIBC_RESERVED
                                       (:ARRAY __SYSCALL_SLONG_T 3) :BIT-SIZE
                                       192 :BIT-OFFSET 960 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(STAT "stat") ':INT
                                      '((__FILE (:STRING))
                                        (__BUF (:POINTER (:STRUCT (STAT))))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(FSTAT "fstat") ':INT
                                      '((__FD :INT)
                                        (__BUF (:POINTER (:STRUCT (STAT))))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(FSTATAT "fstatat") ':INT
                                      '((__FD :INT) (__FILE (:STRING))
                                        (__BUF (:POINTER (:STRUCT (STAT))))
                                        (__FLAG :INT)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(LSTAT "lstat") ':INT
                                      '((__FILE (:STRING))
                                        (__BUF (:POINTER (:STRUCT (STAT))))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(CHMOD "chmod") ':INT
                                      '((__FILE (:STRING)) (__MODE __MODE_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(LCHMOD "lchmod") ':INT
                                      '((__FILE (:STRING)) (__MODE __MODE_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(FCHMOD "fchmod") ':INT
                                      '((__FD :INT) (__MODE __MODE_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(FCHMODAT "fchmodat") ':INT
                                      '((__FD :INT) (__FILE (:STRING))
                                        (__MODE __MODE_T) (__FLAG :INT)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(UMASK "umask") '__MODE_T
                                      '((__MASK __MODE_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(MKDIR "mkdir") ':INT
                                      '((__PATH (:STRING)) (__MODE __MODE_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(MKDIRAT "mkdirat") ':INT
                                      '((__FD :INT) (__PATH (:STRING))
                                        (__MODE __MODE_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(MKNOD "mknod") ':INT
                                      '((__PATH (:STRING)) (__MODE __MODE_T)
                                        (__DEV __DEV_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(MKNODAT "mknodat") ':INT
                                      '((__FD :INT) (__PATH (:STRING))
                                        (__MODE __MODE_T) (__DEV __DEV_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(MKFIFO "mkfifo") ':INT
                                      '((__PATH (:STRING)) (__MODE __MODE_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(MKFIFOAT "mkfifoat") ':INT
                                      '((__FD :INT) (__PATH (:STRING))
                                        (__MODE __MODE_T)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(UTIMENSAT "utimensat") ':INT
                                      '((__FD :INT) (__PATH (:STRING))
                                        (__TIMES
                                         (:ARRAY (:STRUCT (TIMESPEC)) 2))
                                        (__FLAGS :INT)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(FUTIMENS "futimens") ':INT
                                      '((__FD :INT)
                                        (__TIMES
                                         (:ARRAY (:STRUCT (TIMESPEC)) 2))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(__FXSTAT "__fxstat") ':INT
                                      '((__VER :INT) (__FILDES :INT)
                                        (__STAT_BUF
                                         (:POINTER (:STRUCT (STAT))))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(__XSTAT "__xstat") ':INT
                                      '((__VER :INT) (__FILENAME (:STRING))
                                        (__STAT_BUF
                                         (:POINTER (:STRUCT (STAT))))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(__LXSTAT "__lxstat") ':INT
                                      '((__VER :INT) (__FILENAME (:STRING))
                                        (__STAT_BUF
                                         (:POINTER (:STRUCT (STAT))))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(__FXSTATAT "__fxstatat") ':INT
                                      '((__VER :INT) (__FILDES :INT)
                                        (__FILENAME (:STRING))
                                        (__STAT_BUF
                                         (:POINTER (:STRUCT (STAT))))
                                        (__FLAG :INT)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(__XMKNOD "__xmknod") ':INT
                                      '((__VER :INT) (__PATH (:STRING))
                                        (__MODE __MODE_T)
                                        (__DEV (:POINTER __DEV_T))))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(__XMKNODAT "__xmknodat") ':INT
                                      '((__VER :INT) (__FD :INT)
                                        (__PATH (:STRING)) (__MODE __MODE_T)
                                        (__DEV (:POINTER __DEV_T))))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'WINSIZE :STRUCT 64 16
                                    '((:WS-ROW :UNSIGNED-SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 16)
                                      (:WS-COL :UNSIGNED-SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 16 :BIT-ALIGNMENT 16)
                                      (:WS-XPIXEL :UNSIGNED-SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 16)
                                      (:WS-YPIXEL :UNSIGNED-SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 48 :BIT-ALIGNMENT 16)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'TERMIO :STRUCT 144 16
                                    '((:C-IFLAG :UNSIGNED-SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 16)
                                      (:C-OFLAG :UNSIGNED-SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 16 :BIT-ALIGNMENT 16)
                                      (:C-CFLAG :UNSIGNED-SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 16)
                                      (:C-LFLAG :UNSIGNED-SHORT :BIT-SIZE 16
                                       :BIT-OFFSET 48 :BIT-ALIGNMENT 16)
                                      (:C-LINE :UNSIGNED-CHAR :BIT-SIZE 8
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 8)
                                      (:C-CC (:ARRAY :UNSIGNED-CHAR 8)
                                       :BIT-SIZE 64 :BIT-OFFSET 72
                                       :BIT-ALIGNMENT 8)))
    (AUTOWRAP:DEFINE-FOREIGN-FUNCTION '(IOCTL "ioctl" :VARIADIC-P T) ':INT
                                      '((__FD :INT)
                                        (__REQUEST :UNSIGNED-LONG)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '|__S8| ':CHAR)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '|__U8| ':UNSIGNED-CHAR)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '|__S16| ':SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '|__U16| ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '|__S32| ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '|__U32| ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '|__S64| ':LONG-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '|__U64| ':UNSIGNED-LONG-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_FD_SET
                                   '(AUTOWRAP::STRUCT
                                     (NIL :ID 20 :BIT-SIZE 1024 :BIT-ALIGNMENT
                                      64)
                                     (:FDS-BITS (:ARRAY :UNSIGNED-LONG 16)
                                      :BIT-SIZE 1024 :BIT-OFFSET 0
                                      :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_SIGHANDLER_T '(:POINTER (:VOID)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_KEY_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_MQD_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_OLD_UID_T ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_OLD_GID_T ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_OLD_DEV_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_LONG_T ':LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_ULONG_T ':UNSIGNED-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_INO_T '__KERNEL_ULONG_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_MODE_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_PID_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_IPC_PID_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_UID_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_GID_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_SUSECONDS_T '__KERNEL_LONG_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_DADDR_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_UID32_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_GID32_T ':UNSIGNED-INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_SIZE_T '__KERNEL_ULONG_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_SSIZE_T '__KERNEL_LONG_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_PTRDIFF_T '__KERNEL_LONG_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_FSID_T
                                   '(AUTOWRAP::STRUCT
                                     (NIL :ID 21 :BIT-SIZE 64 :BIT-ALIGNMENT
                                      32)
                                     (:VAL (:ARRAY :INT 2) :BIT-SIZE 64
                                      :BIT-OFFSET 0 :BIT-ALIGNMENT 32)))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_OFF_T '__KERNEL_LONG_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_LOFF_T ':LONG-LONG)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_TIME_T '__KERNEL_LONG_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_CLOCK_T '__KERNEL_LONG_T)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_TIMER_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_CLOCKID_T ':INT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_CADDR_T '(:STRING))
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_UID16_T ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-ALIAS '__KERNEL_GID16_T ':UNSIGNED-SHORT)
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-CTRLTRANSFER :STRUCT 192 64
                                    '((:B-REQUEST-TYPE |__U8| :BIT-SIZE 8
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                      (:B-REQUEST |__U8| :BIT-SIZE 8
                                       :BIT-OFFSET 8 :BIT-ALIGNMENT 8)
                                      (:W-VALUE |__U16| :BIT-SIZE 16
                                       :BIT-OFFSET 16 :BIT-ALIGNMENT 16)
                                      (:W-INDEX |__U16| :BIT-SIZE 16
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 16)
                                      (:W-LENGTH |__U16| :BIT-SIZE 16
                                       :BIT-OFFSET 48 :BIT-ALIGNMENT 16)
                                      (:TIMEOUT |__U32| :BIT-SIZE 32
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 32)
                                      (:DATA (:POINTER :VOID) :BIT-SIZE 64
                                       :BIT-OFFSET 128 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-BULKTRANSFER :STRUCT 192 64
                                    '((:EP :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                      (:LEN :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 32)
                                      (:TIMEOUT :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 32)
                                      (:DATA (:POINTER :VOID) :BIT-SIZE 64
                                       :BIT-OFFSET 128 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-SETINTERFACE :STRUCT 64 32
                                    '((:INTERFACE :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                      (:ALTSETTING :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 32)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-DISCONNECTSIGNAL :STRUCT 128 64
                                    '((:SIGNR :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                      (:CONTEXT (:POINTER :VOID) :BIT-SIZE 64
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-GETDRIVER :STRUCT 2080 32
                                    '((:INTERFACE :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                      (:DRIVER (:ARRAY :CHAR 256) :BIT-SIZE
                                       2048 :BIT-OFFSET 32 :BIT-ALIGNMENT 8)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-CONNECTINFO :STRUCT 64 32
                                    '((:DEVNUM :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                      (:SLOW :UNSIGNED-CHAR :BIT-SIZE 8
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 8)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-ISO-PACKET-DESC :STRUCT 96 32
                                    '((:LENGTH :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                      (:ACTUAL-LENGTH :UNSIGNED-INT :BIT-SIZE
                                       32 :BIT-OFFSET 32 :BIT-ALIGNMENT 32)
                                      (:STATUS :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 32)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-URB :STRUCT 448 64
                                    '((:TYPE :UNSIGNED-CHAR :BIT-SIZE 8
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 8)
                                      (:ENDPOINT :UNSIGNED-CHAR :BIT-SIZE 8
                                       :BIT-OFFSET 8 :BIT-ALIGNMENT 8)
                                      (:STATUS :INT :BIT-SIZE 32 :BIT-OFFSET 32
                                       :BIT-ALIGNMENT 32)
                                      (:FLAGS :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 32)
                                      (:BUFFER (:POINTER :VOID) :BIT-SIZE 64
                                       :BIT-OFFSET 128 :BIT-ALIGNMENT 64)
                                      (:BUFFER-LENGTH :INT :BIT-SIZE 32
                                       :BIT-OFFSET 192 :BIT-ALIGNMENT 32)
                                      (:ACTUAL-LENGTH :INT :BIT-SIZE 32
                                       :BIT-OFFSET 224 :BIT-ALIGNMENT 32)
                                      (:START-FRAME :INT :BIT-SIZE 32
                                       :BIT-OFFSET 256 :BIT-ALIGNMENT 32)
                                      (#:FIELD-907
                                       (UNION
                                        (NIL :ID 22 :BIT-SIZE 32 :BIT-ALIGNMENT
                                         32)
                                        (:NUMBER-OF-PACKETS :INT :BIT-SIZE 32
                                         :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                        (:STREAM-ID :UNSIGNED-INT :BIT-SIZE 32
                                         :BIT-OFFSET 0 :BIT-ALIGNMENT 32))
                                       :BIT-SIZE 32 :BIT-OFFSET 288
                                       :BIT-ALIGNMENT 32)
                                      (:ERROR-COUNT :INT :BIT-SIZE 32
                                       :BIT-OFFSET 320 :BIT-ALIGNMENT 32)
                                      (:SIGNR :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 352 :BIT-ALIGNMENT 32)
                                      (:USERCONTEXT (:POINTER :VOID) :BIT-SIZE
                                       64 :BIT-OFFSET 384 :BIT-ALIGNMENT 64)
                                      (:ISO-FRAME-DESC
                                       (:ARRAY
                                        (:STRUCT (USBDEVFS-ISO-PACKET-DESC)) 0)
                                       :BIT-SIZE 0 :BIT-OFFSET 448
                                       :BIT-ALIGNMENT 32)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-IOCTL :STRUCT 128 64
                                    '((:IFNO :INT :BIT-SIZE 32 :BIT-OFFSET 0
                                       :BIT-ALIGNMENT 32)
                                      (:IOCTL-CODE :INT :BIT-SIZE 32
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 32)
                                      (:DATA (:POINTER :VOID) :BIT-SIZE 64
                                       :BIT-OFFSET 64 :BIT-ALIGNMENT 64)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-HUB-PORTINFO :STRUCT 1024 8
                                    '((:NPORTS :CHAR :BIT-SIZE 8 :BIT-OFFSET 0
                                       :BIT-ALIGNMENT 8)
                                      (:PORT (:ARRAY :CHAR 127) :BIT-SIZE 1016
                                       :BIT-OFFSET 8 :BIT-ALIGNMENT 8)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-DISCONNECT-CLAIM :STRUCT 2112 32
                                    '((:INTERFACE :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                      (:FLAGS :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 32)
                                      (:DRIVER (:ARRAY :CHAR 256) :BIT-SIZE
                                       2048 :BIT-OFFSET 64 :BIT-ALIGNMENT 8)))
    (AUTOWRAP:DEFINE-FOREIGN-RECORD 'USBDEVFS-STREAMS :STRUCT 64 32
                                    '((:NUM-STREAMS :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 0 :BIT-ALIGNMENT 32)
                                      (:NUM-EPS :UNSIGNED-INT :BIT-SIZE 32
                                       :BIT-OFFSET 32 :BIT-ALIGNMENT 32)
                                      (:EPS (:ARRAY :UNSIGNED-CHAR 0) :BIT-SIZE
                                       0 :BIT-OFFSET 64 :BIT-ALIGNMENT 8)))
    (DEFPARAMETER +_LINUX_USBDEVICE_FS_H+ NIL)
    (DEFPARAMETER +_ASM_X86_TYPES_H+ NIL)
    (DEFPARAMETER +_ASM_GENERIC_TYPES_H+ NIL)
    (DEFPARAMETER +_ASM_GENERIC_INT_LL64_H+ NIL)
    (DEFPARAMETER +__ASM_X86_BITSPERLONG_H+ NIL)
    (DEFPARAMETER +__BITS_PER_LONG+ 64)
    (DEFPARAMETER +__ASM_GENERIC_BITS_PER_LONG+ NIL)
    (DEFPARAMETER +__KERNEL_OLD_DEV_T+ NIL)
    (DEFPARAMETER +__ASM_GENERIC_POSIX_TYPES_H+ NIL)
    (DEFPARAMETER +__FD_SETSIZE+ 1024)
    (DEFPARAMETER +_LINUX_POSIX_TYPES_H+ NIL)
    (DEFPARAMETER +__KERNEL_OLD_UID_T+ NIL)
    (DEFPARAMETER +_ASM_X86_POSIX_TYPES_64_H+ NIL)
    (DEFPARAMETER +USBDEVFS-MAXDRIVERNAME+ 255)
    (DEFPARAMETER +USBDEVFS-FREE-STREAMS+ 2148029725)
    (DEFPARAMETER +USBDEVFS-CLAIMINTERFACE+ 2147767567)
    (DEFPARAMETER +USBDEVFS-DISCSIGNAL+ 2148553998)
    (DEFPARAMETER +USBDEVFS-DISCSIGNAL32+ NIL)
    (DEFPARAMETER +USBDEVFS-REAPURBNDELAY32+ 1074025741)
    (DEFPARAMETER +USBDEVFS-REAPURB32+ 1074025740)
    (DEFPARAMETER +USBDEVFS-REAPURBNDELAY+ 1074287885)
    (DEFPARAMETER +USBDEVFS-RESET+ 21780)
    (DEFPARAMETER +USBDEVFS-CLEAR-HALT+ 2147767573)
    (DEFPARAMETER +USBDEVFS-HUB-PORTINFO+ 2155894035)
    (DEFPARAMETER +USBDEVFS-IOCTL+ 3222295826)
    (DEFPARAMETER +USBDEVFS-IOCTL32+ NIL)
    (DEFPARAMETER +USBDEVFS-RELEASEINTERFACE+ 2147767568)
    (DEFPARAMETER +USBDEVFS-CONNECTINFO+ 1074287889)
    (DEFPARAMETER +USBDEVFS-DISCONNECT+ 21782)
    (DEFPARAMETER +USBDEVFS-URB-ISO-ASAP+ 2)
    (DEFPARAMETER +USBDEVFS-ALLOC-STREAMS+ 2148029724)
    (DEFPARAMETER +USBDEVFS-URB-BULK-CONTINUATION+ 4)
    (DEFPARAMETER +USBDEVFS-DISCONNECT-CLAIM+ 2164806939)
    (DEFPARAMETER +USBDEVFS-GET-CAPABILITIES+ 2147767578)
    (DEFPARAMETER +USBDEVFS-URB-NO-FSBR+ 32)
    (DEFPARAMETER +USBDEVFS-URB-ZERO-PACKET+ 64)
    (DEFPARAMETER +USBDEVFS-RELEASE-PORT+ 2147767577)
    (DEFPARAMETER +USBDEVFS-CLAIM-PORT+ 2147767576)
    (DEFPARAMETER +USBDEVFS-CONNECT+ 21783)
    (DEFPARAMETER +USBDEVFS-URB-SHORT-NOT-OK+ 1)
    (DEFPARAMETER +USBDEVFS-URB-TYPE-CONTROL+ 2)
    (DEFPARAMETER +USBDEVFS-URB-TYPE-BULK+ 3)
    (DEFPARAMETER +USBDEVFS-URB-NO-INTERRUPT+ 128)
    (DEFPARAMETER +USBDEVFS-URB-TYPE-ISO+ 0)
    (DEFPARAMETER +USBDEVFS-URB-TYPE-INTERRUPT+ 1)
    (DEFPARAMETER +USBDEVFS-CAP-BULK-SCATTER-GATHER+ 8)
    (DEFPARAMETER +USBDEVFS-CAP-NO-PACKET-SIZE-LIM+ 4)
    (DEFPARAMETER +USBDEVFS-CAP-REAP-AFTER-DISCONNECT+ 16)
    (DEFPARAMETER +USBDEVFS-CAP-BULK-CONTINUATION+ 2)
    (DEFPARAMETER +USBDEVFS-CAP-ZERO-PACKET+ 1)
    (DEFPARAMETER +USBDEVFS-CONTROL+ 3222820096)
    (DEFPARAMETER +USBDEVFS-DISCONNECT-CLAIM-EXCEPT-DRIVER+ 2)
    (DEFPARAMETER +USBDEVFS-DISCONNECT-CLAIM-IF-DRIVER+ 1)
    (DEFPARAMETER +USBDEVFS-RESETEP+ 2147767555)
    (DEFPARAMETER +USBDEVFS-SETINTERFACE+ 2148029700)
    (DEFPARAMETER +USBDEVFS-CONTROL32+ NIL)
    (DEFPARAMETER +USBDEVFS-BULK32+ NIL)
    (DEFPARAMETER +USBDEVFS-BULK+ 3222820098)
    (DEFPARAMETER +USBDEVFS-SUBMITURB32+ NIL)
    (DEFPARAMETER +USBDEVFS-REAPURB+ 1074287884)
    (DEFPARAMETER +USBDEVFS-DISCARDURB+ 21771)
    (DEFPARAMETER +USBDEVFS-GETDRIVER+ 1090802952)
    (DEFPARAMETER +USBDEVFS-SETCONFIGURATION+ 2147767557)
    (DEFPARAMETER +USBDEVFS-SUBMITURB+ 2151175434)
    (DEFPARAMETER +__ATTRIBUTE_WARN_UNUSED_RESULT__+ NIL)
    (DEFPARAMETER +__UWORD_TYPE+ NIL)
    (DEFPARAMETER +_LINUX_USBDEVICE_FS_H+ NIL)
    (DEFPARAMETER +__SLONG32_TYPE+ NIL)
    (DEFPARAMETER +__ULONG32_TYPE+ NIL)
    (DEFPARAMETER +__S64_TYPE+ NIL)
    (DEFPARAMETER +__SLONGWORD_TYPE+ NIL)
    (DEFPARAMETER +__ATTRIBUTE_ARTIFICIAL__+ NIL)
    (DEFPARAMETER +__ULONGWORD_TYPE+ NIL)
    (DEFPARAMETER +__WUR+ NIL)
    (DEFPARAMETER +__ALWAYS_INLINE+ NIL)
    (DEFPARAMETER +__SWORD_TYPE+ NIL)
    (DEFPARAMETER +__UQUAD_TYPE+ NIL)
    (DEFPARAMETER +__S16_TYPE+ NIL)
    (DEFPARAMETER +__U16_TYPE+ NIL)
    (DEFPARAMETER +__ATTRIBUTE_DEPRECATED__+ NIL)
    (DEFPARAMETER +__SQUAD_TYPE+ NIL)
    (DEFPARAMETER +__S32_TYPE+ NIL)
    (DEFPARAMETER +__U32_TYPE+ NIL)
    (DEFPARAMETER +__WORDSIZE+ 64)
    (DEFPARAMETER +__SIZEOF_PTHREAD_RWLOCK_T+ 56)
    (DEFPARAMETER +__SIZEOF_PTHREAD_CONDATTR_T+ 4)
    (DEFPARAMETER +__SIZEOF_PTHREAD_COND_T+ 48)
    (DEFPARAMETER +__SIZEOF_PTHREAD_MUTEXATTR_T+ 4)
    (DEFPARAMETER +__SIZEOF_PTHREAD_MUTEX_T+ 40)
    (DEFPARAMETER +__SIZEOF_PTHREAD_ATTR_T+ 56)
    (DEFPARAMETER +__WORDSIZE_TIME64_COMPAT32+ 1)
    (DEFPARAMETER +_BITS_PTHREADTYPES_H+ 1)
    (DEFPARAMETER +__SYSCALL_WORDSIZE+ 64)
    (DEFPARAMETER +__EXTERN_ALWAYS_INLINE+ NIL)
    (DEFPARAMETER +__FSFILCNT_T_DEFINED+ NIL)
    (DEFPARAMETER +__FORTIFY_FUNCTION+ NIL)
    (DEFPARAMETER +__EXTERN_INLINE+ NIL)
    (DEFPARAMETER +__FSBLKCNT_T_DEFINED+ NIL)
    (DEFPARAMETER +__BLKCNT_T_DEFINED+ NIL)
    (DEFPARAMETER +__RESTRICT_ARR+ NIL)
    (DEFPARAMETER +__STUB_CHFLAGS+ NIL)
    (DEFPARAMETER +__TIMER_T_TYPE+ NIL)
    (DEFPARAMETER +__STUB___COMPAT_BDFLUSH+ NIL)
    (DEFPARAMETER +__CLOCKID_T_TYPE+ NIL)
    (DEFPARAMETER +__FSID_T_TYPE+ NIL)
    (DEFPARAMETER +__BLKSIZE_T_TYPE+ NIL)
    (DEFPARAMETER +__SUSECONDS_T_TYPE+ NIL)
    (DEFPARAMETER +__STUB_GTTY+ NIL)
    (DEFPARAMETER +__USECONDS_T_TYPE+ NIL)
    (DEFPARAMETER +__STUB_GETMSG+ NIL)
    (DEFPARAMETER +__STUB_FCHFLAGS+ NIL)
    (DEFPARAMETER +__STUB_FDETACH+ NIL)
    (DEFPARAMETER +__KEY_T_TYPE+ NIL)
    (DEFPARAMETER +__STUB_FATTACH+ NIL)
    (DEFPARAMETER +__DADDR_T_TYPE+ NIL)
    (DEFPARAMETER +__FSFILCNT64_T_TYPE+ NIL)
    (DEFPARAMETER +__FSFILCNT_T_TYPE+ NIL)
    (DEFPARAMETER +__TIME_T_TYPE+ NIL)
    (DEFPARAMETER +__CLOCK_T_TYPE+ NIL)
    (DEFPARAMETER +__ID_T_TYPE+ NIL)
    (DEFPARAMETER +_BITS_BYTESWAP_H+ 1)
    (DEFPARAMETER +__BLKCNT64_T_TYPE+ NIL)
    (DEFPARAMETER +__BLKCNT_T_TYPE+ NIL)
    (DEFPARAMETER +__FSBLKCNT64_T_TYPE+ NIL)
    (DEFPARAMETER +__FSBLKCNT_T_TYPE+ NIL)
    (DEFPARAMETER +__PID_T_TYPE+ NIL)
    (DEFPARAMETER +__OFF64_T_TYPE+ NIL)
    (DEFPARAMETER +__RLIM64_T_TYPE+ NIL)
    (DEFPARAMETER +__RLIM_T_TYPE+ NIL)
    (DEFPARAMETER +LITTLE-ENDIAN+ 1234)
    (DEFPARAMETER +__MODE_T_TYPE+ NIL)
    (DEFPARAMETER +__INO64_T_TYPE+ NIL)
    (DEFPARAMETER +BIG-ENDIAN+ 4321)
    (DEFPARAMETER +PDP-ENDIAN+ 3412)
    (DEFPARAMETER +__OFF_T_TYPE+ NIL)
    (DEFPARAMETER +BYTE-ORDER+ 1234)
    (DEFPARAMETER +__NLINK_T_TYPE+ NIL)
    (DEFPARAMETER +__FSWORD_T_TYPE+ NIL)
    (DEFPARAMETER +__STUB_SETLOGIN+ NIL)
    (DEFPARAMETER +__UID_T_TYPE+ NIL)
    (DEFPARAMETER +__BIG_ENDIAN+ 4321)
    (DEFPARAMETER +__PDP_ENDIAN+ 3412)
    (DEFPARAMETER +__STUB_REVOKE+ NIL)
    (DEFPARAMETER +__DEV_T_TYPE+ NIL)
    (DEFPARAMETER +__INO_T_TYPE+ NIL)
    (DEFPARAMETER +__BYTE_ORDER+ 1234)
    (DEFPARAMETER +__STUB_PUTMSG+ NIL)
    (DEFPARAMETER +__STUB_LCHMOD+ NIL)
    (DEFPARAMETER +__FLOAT_WORD_ORDER+ 1234)
    (DEFPARAMETER +__GID_T_TYPE+ NIL)
    (DEFPARAMETER +_BITS_TYPESIZES_H+ 1)
    (DEFPARAMETER +__U64_TYPE+ NIL)
    (DEFPARAMETER +_BITS_TYPES_H+ 1)
    (DEFPARAMETER +__STD_TYPE+ NIL)
    (DEFPARAMETER +__BIT_TYPES_DEFINED__+ 1)
    (DEFPARAMETER +__STUB_STTY+ NIL)
    (DEFPARAMETER +__STUB_SSTK+ NIL)
    (DEFPARAMETER +__SYSCALL_ULONG_TYPE+ NIL)
    (DEFPARAMETER +_ENDIAN_H+ 1)
    (DEFPARAMETER +__STUB_SIGRETURN+ NIL)
    (DEFPARAMETER +__SYSCALL_SLONG_TYPE+ NIL)
    (DEFPARAMETER +__LITTLE_ENDIAN+ 1234)
    (DEFPARAMETER +TTYDEF-SPEED+ NIL)
    (DEFPARAMETER +CEOF+ 4)
    (DEFPARAMETER +CEOL+ 0)
    (DEFPARAMETER +CSTATUS+ 0)
    (DEFPARAMETER +CINTR+ 3)
    (DEFPARAMETER +CERASE+ 127)
    (DEFPARAMETER +CQUIT+ 28)
    (DEFPARAMETER +CKILL+ 21)
    (DEFPARAMETER +CTIME+ 0)
    (DEFPARAMETER +CSUSP+ 26)
    (DEFPARAMETER +CDSUSP+ 25)
    (DEFPARAMETER +_SYS_TTYDEFAULTS_H_+ NIL)
    (DEFPARAMETER +TTYDEF-IFLAG+ NIL)
    (DEFPARAMETER +CMIN+ 1)
    (DEFPARAMETER +TTYDEF-OFLAG+ NIL)
    (DEFPARAMETER +TTYDEF-LFLAG+ NIL)
    (DEFPARAMETER +__OFF_T_MATCHES_OFF64_T+ 1)
    (DEFPARAMETER +__INO_T_MATCHES_INO64_T+ 1)
    (DEFPARAMETER +__SSIZE_T_TYPE+ NIL)
    (DEFPARAMETER +TTYDEF-CFLAG+ NIL)
    (DEFPARAMETER +__CPU_MASK_TYPE+ NIL)
    (DEFPARAMETER +TIOCM-RNG+ 128)
    (DEFPARAMETER +TIOCM-DSR+ 256)
    (DEFPARAMETER +TIOCM-CD+ 64)
    (DEFPARAMETER +TIOCM-RI+ 128)
    (DEFPARAMETER +N-TTY+ 0)
    (DEFPARAMETER +N-MOUSE+ 2)
    (DEFPARAMETER +N-SLIP+ 1)
    (DEFPARAMETER +N-PPP+ 3)
    (DEFPARAMETER +N-STRIP+ 4)
    (DEFPARAMETER +N-X25+ 6)
    (DEFPARAMETER +N-AX25+ 5)
    (DEFPARAMETER +N-6PACK+ 7)
    (DEFPARAMETER +N-MASC+ 8)
    (DEFPARAMETER +N-R3964+ 9)
    (DEFPARAMETER +N-IRDA+ 11)
    (DEFPARAMETER +N-PROFIBUS-FDL+ 10)
    (DEFPARAMETER +N-SMSBLOCK+ 12)
    (DEFPARAMETER +N-HDLC+ 13)
    (DEFPARAMETER +N-SYNC-PPP+ 14)
    (DEFPARAMETER +N-HCI+ 15)
    (DEFPARAMETER +__ATTRIBUTE_PURE__+ NIL)
    (DEFPARAMETER +__ATTRIBUTE_CONST__+ NIL)
    (DEFPARAMETER +NCC+ 8)
    (DEFPARAMETER +__ATTRIBUTE_USED__+ NIL)
    (DEFPARAMETER +__ATTRIBUTE_NOINLINE__+ NIL)
    (DEFPARAMETER +TIOCM-LE+ 1)
    (DEFPARAMETER +TIOCM-DTR+ 2)
    (DEFPARAMETER +TIOCM-RTS+ 4)
    (DEFPARAMETER +TIOCM-ST+ 8)
    (DEFPARAMETER +TIOCM-CTS+ 32)
    (DEFPARAMETER +TIOCM-SR+ 16)
    (DEFPARAMETER +TIOCM-CAR+ 64)
    (DEFPARAMETER +__MODE_T_DEFINED+ NIL)
    (DEFPARAMETER +__USE_POSIX199309+ 1)
    (DEFPARAMETER +__USE_POSIX199506+ 1)
    (DEFPARAMETER +__NLINK_T_DEFINED+ NIL)
    (DEFPARAMETER +__USE_POSIX+ 1)
    (DEFPARAMETER +__UID_T_DEFINED+ NIL)
    (DEFPARAMETER +__USE_POSIX2+ 1)
    (DEFPARAMETER +__USE_ISOC99+ 1)
    (DEFPARAMETER +__OFF_T_DEFINED+ NIL)
    (DEFPARAMETER +__USE_ISOC95+ 1)
    (DEFPARAMETER +__USE_ISOC11+ 1)
    (DEFPARAMETER +__INO_T_DEFINED+ NIL)
    (DEFPARAMETER +_SYS_TYPES_H+ 1)
    (DEFPARAMETER +_FEATURES_H+ 1)
    (DEFPARAMETER +__DEV_T_DEFINED+ NIL)
    (DEFPARAMETER +__GID_T_DEFINED+ NIL)
    (DEFPARAMETER +__NEED_CLOCK_T+ NIL)
    (DEFPARAMETER +__NEED_TIMER_T+ NIL)
    (DEFPARAMETER +__KEY_T_DEFINED+ NIL)
    (DEFPARAMETER +__NEED_TIME_T+ NIL)
    (DEFPARAMETER +__NEED_CLOCKID_T+ NIL)
    (DEFPARAMETER +__PID_T_DEFINED+ NIL)
    (DEFPARAMETER +__ID_T_DEFINED+ NIL)
    (DEFPARAMETER +__DADDR_T_DEFINED+ NIL)
    (DEFPARAMETER +__SSIZE_T_DEFINED+ NIL)
    (DEFPARAMETER +_POSIX_C_SOURCE+ 200809)
    (DEFPARAMETER +_POSIX_SOURCE+ 1)
    (DEFPARAMETER +_DEFAULT_SOURCE+ 1)
    (DEFPARAMETER +__KERNEL_STRICT_NAMES+ NIL)
    (DEFPARAMETER +__USE_FORTIFY_LEVEL+ 0)
    (DEFPARAMETER +__U_CHAR_DEFINED+ NIL)
    (DEFPARAMETER +__USE_ATFILE+ 1)
    (DEFPARAMETER +__USE_MISC+ 1)
    (DEFPARAMETER +__USE_XOPEN2K8+ 1)
    (DEFPARAMETER +__USE_XOPEN2K+ 1)
    (DEFPARAMETER +__INT8_T_DEFINED+ NIL)
    (DEFPARAMETER +__TIMER_T_DEFINED+ 1)
    (DEFPARAMETER +__CLOCKID_T_DEFINED+ 1)
    (DEFPARAMETER +__NEED_SIZE_T+ NIL)
    (DEFPARAMETER +__TIMESPEC_DEFINED+ 1)
    (DEFPARAMETER +__NEED_TIMESPEC+ NIL)
    (DEFPARAMETER +__TIME_T_DEFINED+ 1)
    (DEFPARAMETER +__CLOCK_T_DEFINED+ 1)
    (DEFPARAMETER +SIOCSIFBRDADDR+ 35098)
    (DEFPARAMETER +__BLKSIZE_T_DEFINED+ NIL)
    (DEFPARAMETER +CLNEXT+ 22)
    (DEFPARAMETER +SIOCGIFNETMASK+ 35099)
    (DEFPARAMETER +CSTOP+ 19)
    (DEFPARAMETER +SIOCGIFDSTADDR+ 35095)
    (DEFPARAMETER +SIOCGIFBRDADDR+ 35097)
    (DEFPARAMETER +SIOCSIFDSTADDR+ 35096)
    (DEFPARAMETER +CRPRNT+ 18)
    (DEFPARAMETER +SIOCSIFMETRIC+ 35102)
    (DEFPARAMETER +CBRK+ 0)
    (DEFPARAMETER +SIOCGIFMEM+ 35103)
    (DEFPARAMETER +CEOT+ 4)
    (DEFPARAMETER +SIOCSIFNETMASK+ 35100)
    (DEFPARAMETER +CREPRINT+ 18)
    (DEFPARAMETER +CDISCARD+ 15)
    (DEFPARAMETER +SIOCGIFMETRIC+ 35101)
    (DEFPARAMETER +USBDEVFS-SUBMITURB32+ NIL)
    (DEFPARAMETER +S-IXOTH+ 1)
    (DEFPARAMETER +SIOCGIFNAME+ 35088)
    (DEFPARAMETER +SIOCSIFLINK+ 35089)
    (DEFPARAMETER +SIOCGIFCONF+ 35090)
    (DEFPARAMETER +S-IWOTH+ 2)
    (DEFPARAMETER +CWERASE+ 23)
    (DEFPARAMETER +ALLPERMS+ 4095)
    (DEFPARAMETER +S-IRWXO+ 7)
    (DEFPARAMETER +ACCESSPERMS+ 511)
    (DEFPARAMETER +SIOCDELRT+ 35084)
    (DEFPARAMETER +SIOCRTMSG+ 35085)
    (DEFPARAMETER +S-BLKSIZE+ 512)
    (DEFPARAMETER +SIOCGIFFLAGS+ 35091)
    (DEFPARAMETER +DEFFILEMODE+ 438)
    (DEFPARAMETER +SIOCSIFFLAGS+ 35092)
    (DEFPARAMETER +SIOCGIFADDR+ 35093)
    (DEFPARAMETER +TIOCPKT-STOP+ 4)
    (DEFPARAMETER +USBDEVFS-BULK32+ NIL)
    (DEFPARAMETER +_MKNOD_VER+ 0)
    (DEFPARAMETER +TIOCPKT-START+ 8)
    (DEFPARAMETER +TIOCPKT-NOSTOP+ 16)
    (DEFPARAMETER +TIOCPKT-FLUSHREAD+ 1)
    (DEFPARAMETER +TIOCPKT-FLUSHWRITE+ 2)
    (DEFPARAMETER +TIOCSER-TEMT+ 1)
    (DEFPARAMETER +SIOCADDRT+ 35083)
    (DEFPARAMETER +NFDBITS+ 64)
    (DEFPARAMETER +TIOCPKT-DOSTOP+ 32)
    (DEFPARAMETER +TIOCPKT-IOCTL+ 64)
    (DEFPARAMETER +TIOCSERGETLSR+ 21593)
    (DEFPARAMETER +TIOCSERGETMULTI+ 21594)
    (DEFPARAMETER +SIOCSIFADDR+ 35094)
    (DEFPARAMETER +TIOCSERSETMULTI+ 21595)
    (DEFPARAMETER +_SYS_SYSMACROS_H+ 1)
    (DEFPARAMETER +USBDEVFS-IOCTL32+ NIL)
    (DEFPARAMETER +TIOCSLCKTRMIOS+ 21591)
    (DEFPARAMETER +TIOCSERGSTRUCT+ 21592)
    (DEFPARAMETER +FIOQSIZE+ 21600)
    (DEFPARAMETER +CSTART+ 17)
    (DEFPARAMETER +TIOCPKT-DATA+ 0)
    (DEFPARAMETER +USBDEVFS-DISCSIGNAL32+ NIL)
    (DEFPARAMETER +TIOCMIWAIT+ 21596)
    (DEFPARAMETER +TIOCGICOUNT+ 21597)
    (DEFPARAMETER +SIOCADDDLCI+ 35200)
    (DEFPARAMETER +SIOCSIFMAP+ 35185)
    (DEFPARAMETER +SIOCGIFMAP+ 35184)
    (DEFPARAMETER +SIOCSRARP+ 35170)
    (DEFPARAMETER +SIOCDEVPRIVATE+ 35312)
    (DEFPARAMETER +SIOCDELDLCI+ 35201)
    (DEFPARAMETER +SIOCSIFTXQLEN+ 35139)
    (DEFPARAMETER +SIOCGIFTXQLEN+ 35138)
    (DEFPARAMETER +SIOCSIFBR+ 35137)
    (DEFPARAMETER +SIOCGIFBR+ 35136)
    (DEFPARAMETER +SIOCGRARP+ 35169)
    (DEFPARAMETER +SIOCDRARP+ 35168)
    (DEFPARAMETER +SIOCSARP+ 35157)
    (DEFPARAMETER +SIOCGARP+ 35156)
    (DEFPARAMETER +SIOCDARP+ 35155)
    (DEFPARAMETER +TCGETA+ 21509)
    (DEFPARAMETER +TCSETSW+ 21507)
    (DEFPARAMETER +SIOCGIFINDEX+ 35123)
    (DEFPARAMETER +TCSETS+ 21506)
    (DEFPARAMETER +SIOCDELMULTI+ 35122)
    (DEFPARAMETER +S-IWRITE+ 128)
    (DEFPARAMETER +TCGETS+ 21505)
    (DEFPARAMETER +S-IRGRP+ 32)
    (DEFPARAMETER +TCSETAF+ 21512)
    (DEFPARAMETER +S-IEXEC+ 64)
    (DEFPARAMETER +S-IXGRP+ 8)
    (DEFPARAMETER +TCSETA+ 21510)
    (DEFPARAMETER +S-IRWXG+ 56)
    (DEFPARAMETER +S-IWGRP+ 16)
    (DEFPARAMETER +S-IROTH+ 4)
    (DEFPARAMETER +IOCSIZE-MASK+ 1073676288)
    (DEFPARAMETER +IOCSIZE-SHIFT+ 16)
    (DEFPARAMETER +IOC-INOUT+ 3221225472)
    (DEFPARAMETER +TCSETSF+ 21508)
    (DEFPARAMETER +IOC-OUT+ 2147483648)
    (DEFPARAMETER +TCXONC+ 21514)
    (DEFPARAMETER +SIOCSIFMTU+ 35106)
    (DEFPARAMETER +TCSBRK+ 21513)
    (DEFPARAMETER +IOC-IN+ 1073741824)
    (DEFPARAMETER +SIOCGIFENCAP+ 35109)
    (DEFPARAMETER +SIOCGIFMTU+ 35105)
    (DEFPARAMETER +SIOCGIFSLAVE+ 35113)
    (DEFPARAMETER +TCSETAW+ 21511)
    (DEFPARAMETER +SIOCGIFHWADDR+ 35111)
    (DEFPARAMETER +SIOCSIFNAME+ 35107)
    (DEFPARAMETER +SIOCSIFENCAP+ 35110)
    (DEFPARAMETER +SIOCSIFHWADDR+ 35108)
    (DEFPARAMETER +SIOCSIFMEM+ 35104)
    (DEFPARAMETER +USBDEVFS-CONTROL32+ NIL)
    (DEFPARAMETER +SIOCSIFPFLAGS+ 35124)
    (DEFPARAMETER +SIOCGIFCOUNT+ 35128)
    (DEFPARAMETER +SIOCSIFSLAVE+ 35120)
    (DEFPARAMETER +SIOGIFINDEX+ 35123)
    (DEFPARAMETER +SIOCADDMULTI+ 35121)
    (DEFPARAMETER +__FLEXARR+ NIL)
    (DEFPARAMETER +SIOCSIFHWBROADCAST+ 35127)
    (DEFPARAMETER +SIOCGIFPFLAGS+ 35125)
    (DEFPARAMETER +__ATTRIBUTE_MALLOC__+ NIL)
    (DEFPARAMETER +SIOCDIFADDR+ 35126)
    (DEFPARAMETER +__PTR_T+ NIL)
    (DEFPARAMETER +__LONG_DOUBLE_T+ NIL)
    (DEFPARAMETER +__END_DECLS+ NIL)
    (DEFPARAMETER +__BEGIN_DECLS+ NIL)
    (DEFPARAMETER +__BEGIN_NAMESPACE_STD+ NIL)
    (DEFPARAMETER +__END_NAMESPACE_STD+ NIL)
    (DEFPARAMETER +__BEGIN_NAMESPACE_C99+ NIL)
    (DEFPARAMETER +__END_NAMESPACE_C99+ NIL)
    (DEFPARAMETER +_IOC_TYPEMASK+ 255)
    (DEFPARAMETER +_IOC_SIZEMASK+ 16383)
    (DEFPARAMETER +__STDC_IEC_559_COMPLEX__+ 1)
    (DEFPARAMETER +__SIGSET_T_DEFINED+ NIL)
    (DEFPARAMETER +__STDC_ISO_10646__+ 201505)
    (DEFPARAMETER +_IOC_DIRBITS+ 2)
    (DEFPARAMETER +__STDC_NO_THREADS__+ 1)
    (DEFPARAMETER +_IOC_NRMASK+ 255)
    (DEFPARAMETER +__GLIBC__+ 2)
    (DEFPARAMETER +__GNU_LIBRARY__+ 6)
    (DEFPARAMETER +_IOC_SIZESHIFT+ 16)
    (DEFPARAMETER +_SIGSET_NWORDS+ 16)
    (DEFPARAMETER +__GLIBC_MINOR__+ 23)
    (DEFPARAMETER +_IOC_DIRSHIFT+ 30)
    (DEFPARAMETER +_IOC_DIRMASK+ 3)
    (DEFPARAMETER +TIOCGLCKTRMIOS+ 21590)
    (DEFPARAMETER +_IOC_NRSHIFT+ 0)
    (DEFPARAMETER +_IOC_TYPESHIFT+ 8)
    (DEFPARAMETER +TIOCSERSWILD+ 21589)
    (DEFPARAMETER +_SYS_IOCTL_H+ 1)
    (DEFPARAMETER +_SYS_CDEFS_H+ 1)
    (DEFPARAMETER +__NFDBITS+ 64)
    (DEFPARAMETER +__ASM_GENERIC_IOCTLS_H+ NIL)
    (DEFPARAMETER +FD-SETSIZE+ 1024)
    (DEFPARAMETER +__LEAF+ NIL)
    (DEFPARAMETER +_IOC_NRBITS+ 8)
    (DEFPARAMETER +__LEAF_ATTR+ NIL)
    (DEFPARAMETER +_STRUCT_TIMEVAL+ 1)
    (DEFPARAMETER +__NEED_TIMEVAL+ NIL)
    (DEFPARAMETER +__THROWNL+ NIL)
    (DEFPARAMETER +__SUSECONDS_T_DEFINED+ NIL)
    (DEFPARAMETER +__THROW+ NIL)
    (DEFPARAMETER +_ASM_GENERIC_IOCTL_H+ NIL)
    (DEFPARAMETER +_LINUX_IOCTL_H+ NIL)
    (DEFPARAMETER +_IOC_TYPEBITS+ 8)
    (DEFPARAMETER +_IOC_SIZEBITS+ 14)
    (DEFPARAMETER +_SYS_SELECT_H+ 1)
    (DEFPARAMETER +__USE_POSIX_IMPLICITLY+ 1)
    (DEFPARAMETER +_ATFILE_SOURCE+ 1)
    (DEFPARAMETER +__FD_ZERO_STOS+ "stosq")
    (DEFPARAMETER +_IOC_READ+ 2)
    (DEFPARAMETER +_IOC_NONE+ 0)
    (DEFPARAMETER +_SIGSET_H_TYPES+ 1)
    (DEFPARAMETER +_IOC_WRITE+ 1)
    (DEFPARAMETER +_STDC_PREDEF_H+ 1)
    (DEFPARAMETER +__STDC_IEC_559__+ 1)
    (DEFPARAMETER +SIOCPROTOPRIVATE+ 35296)
    (DEFPARAMETER +_MKNOD_VER_LINUX+ 0)
    (DEFPARAMETER +_STAT_VER_LINUX+ 1)
    (DEFPARAMETER +_STAT_VER+ 1)
    (DEFPARAMETER +_STAT_VER_KERNEL+ 0)
    (DEFPARAMETER +_BITS_STAT_H+ 1)
    (DEFPARAMETER +TIOCGSOFTCAR+ 21529)
    (DEFPARAMETER +__S_IREAD+ 256)
    (DEFPARAMETER +_SYS_STAT_H+ 1)
    (DEFPARAMETER +TIOCSSOFTCAR+ 21530)
    (DEFPARAMETER +__S_IWRITE+ 128)
    (DEFPARAMETER +__S_ISGID+ 1024)
    (DEFPARAMETER +TIOCINQ+ 21531)
    (DEFPARAMETER +FIONREAD+ 21531)
    (DEFPARAMETER +__S_ISVTX+ 512)
    (DEFPARAMETER +TIOCSWINSZ+ 21524)
    (DEFPARAMETER +TIOCMGET+ 21525)
    (DEFPARAMETER +TIOCLINUX+ 21532)
    (DEFPARAMETER +__S_ISUID+ 2048)
    (DEFPARAMETER +TIOCMBIS+ 21526)
    (DEFPARAMETER +TIOCMBIC+ 21527)
    (DEFPARAMETER +TIOCMSET+ 21528)
    (DEFPARAMETER +__S_IFLNK+ 40960)
    (DEFPARAMETER +TIOCSPGRP+ 21520)
    (DEFPARAMETER +__S_IFSOCK+ 49152)
    (DEFPARAMETER +__S_IFREG+ 32768)
    (DEFPARAMETER +__S_IFIFO+ 4096)
    (DEFPARAMETER +TIOCGWINSZ+ 21523)
    (DEFPARAMETER +TIOCSTI+ 21522)
    (DEFPARAMETER +TIOCOUTQ+ 21521)
    (DEFPARAMETER +TCFLSH+ 21515)
    (DEFPARAMETER +__S_IFDIR+ 16384)
    (DEFPARAMETER +__S_IFBLK+ 24576)
    (DEFPARAMETER +__S_IFCHR+ 8192)
    (DEFPARAMETER +TIOCEXCL+ 21516)
    (DEFPARAMETER +TIOCNXCL+ 21517)
    (DEFPARAMETER +_STATBUF_ST_NSEC+ NIL)
    (DEFPARAMETER +TIOCSCTTY+ 21518)
    (DEFPARAMETER +__S_IFMT+ 61440)
    (DEFPARAMETER +_STATBUF_ST_BLKSIZE+ NIL)
    (DEFPARAMETER +TCSETS2+ NIL)
    (DEFPARAMETER +_STATBUF_ST_RDEV+ NIL)
    (DEFPARAMETER +TCSETSW2+ NIL)
    (DEFPARAMETER +ST-CTIME+ NIL)
    (DEFPARAMETER +TCSETSF2+ NIL)
    (DEFPARAMETER +TIOCSRS485+ 21551)
    (DEFPARAMETER +TIOCGPGRP+ 21519)
    (DEFPARAMETER +TIOCGRS485+ 21550)
    (DEFPARAMETER +ST-ATIME+ NIL)
    (DEFPARAMETER +TIOCGSID+ 21545)
    (DEFPARAMETER +TIOCSBRK+ 21543)
    (DEFPARAMETER +ST-MTIME+ NIL)
    (DEFPARAMETER +TCGETS2+ NIL)
    (DEFPARAMETER +TIOCNOTTY+ 21538)
    (DEFPARAMETER +TIOCSETD+ 21539)
    (DEFPARAMETER +__PTHREAD_RWLOCK_ELISION_EXTRA+ 0)
    (DEFPARAMETER +TIOCGETD+ 21540)
    (DEFPARAMETER +__PTHREAD_RWLOCK_INT_FLAGS_SHARED+ 1)
    (DEFPARAMETER +TIOCCBRK+ 21544)
    (DEFPARAMETER +TCSBRKP+ 21541)
    (DEFPARAMETER +TIOCCONS+ 21533)
    (DEFPARAMETER +TIOCGSERIAL+ 21534)
    (DEFPARAMETER +TIOCSSERIAL+ 21535)
    (DEFPARAMETER +FIONBIO+ 21537)
    (DEFPARAMETER +TIOCPKT+ 21536)
    (DEFPARAMETER +TIOCSERCONFIG+ 21587)
    (DEFPARAMETER +TIOCSERGWILD+ 21588)
    (DEFPARAMETER +__KERNEL_OLD_DEV_T+ NIL)
    (DEFPARAMETER +FIOASYNC+ 21586)
    (DEFPARAMETER +__ASM_GENERIC_POSIX_TYPES_H+ NIL)
    (DEFPARAMETER +__PTHREAD_MUTEX_HAVE_PREV+ 1)
    (DEFPARAMETER +__PTHREAD_SPINS+ 0)
    (DEFPARAMETER +TIOCGEXCL+ 2147767360)
    (DEFPARAMETER +TIOCGPTLCK+ 2147767353)
    (DEFPARAMETER +_ASM_X86_POSIX_TYPES_64_H+ NIL)
    (DEFPARAMETER +FIOCLEX+ 21585)
    (DEFPARAMETER +__KERNEL_OLD_UID_T+ NIL)
    (DEFPARAMETER +S-IREAD+ 256)
    (DEFPARAMETER +FIONCLEX+ 21584)
    (DEFPARAMETER +S-IRWXU+ 448)
    (DEFPARAMETER +TCSETXW+ 21557)
    (DEFPARAMETER +S-IXUSR+ 64)
    (DEFPARAMETER +S-IWUSR+ 128)
    (DEFPARAMETER +TCSETXF+ 21556)
    (DEFPARAMETER +TIOCVHANGUP+ 21559)
    (DEFPARAMETER +S-IRUSR+ 256)
    (DEFPARAMETER +S-ISVTX+ 512)
    (DEFPARAMETER +TIOCGPKT+ 2147767352)
    (DEFPARAMETER +TIOCSIG+ 1074025526)
    (DEFPARAMETER +S-ISGID+ 1024)
    (DEFPARAMETER +S-ISUID+ 2048)
    (DEFPARAMETER +TIOCSPTLCK+ 1074025521)
    (DEFPARAMETER +TIOCGPTN+ 2147767344)
    (DEFPARAMETER +TCGETX+ 21554)
    (DEFPARAMETER +TIOCGDEV+ 2147767346)
    (DEFPARAMETER +__SIZEOF_PTHREAD_RWLOCKATTR_T+ 8)
    (DEFPARAMETER +TCSETX+ 21555)
    (DEFPARAMETER +__SIZEOF_PTHREAD_BARRIER_T+ 32)
    (DEFPARAMETER +__SIZEOF_PTHREAD_BARRIERATTR_T+ 4)
    (DEFPARAMETER +_LINUX_POSIX_TYPES_H+ NIL)
    (DEFPARAMETER +__ASM_X86_BITSPERLONG_H+ NIL)
    (DEFPARAMETER +__HAVE_PTHREAD_ATTR_T+ 1)
    (DEFPARAMETER +__ASM_GENERIC_BITS_PER_LONG+ NIL)
    (DEFPARAMETER +S-IFLNK+ 40960)
    (DEFPARAMETER +S-IFSOCK+ 49152)
    (DEFPARAMETER +S-IFIFO+ 4096)
    (DEFPARAMETER +_ASM_X86_TYPES_H+ NIL)
    (DEFPARAMETER +S-IFREG+ 32768)
    (DEFPARAMETER +_ASM_GENERIC_TYPES_H+ NIL)
    (DEFPARAMETER +S-IFCHR+ 8192)
    (DEFPARAMETER +_ASM_GENERIC_INT_LL64_H+ NIL)
    (DEFPARAMETER +S-IFBLK+ 24576)
    (DEFPARAMETER +S-IFDIR+ 16384)
    (DEFPARAMETER +CFLUSH+ 15)
    (DEFPARAMETER +S-IFMT+ 61440)
    (DEFPARAMETER +UTIME-OMIT+ 1073741822)
    (DEFPARAMETER +__S_IEXEC+ 64)
    (DEFPARAMETER +UTIME-NOW+ 1073741823)
    (SETF AUTOWRAP::*FOREIGN-RECORD-INDEX* NIL))
   (AUTOWRAP:DEFINE-WRAPPER __FSID_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER __SIGSET_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (TIMESPEC)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (TIMEVAL)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER FD-SET #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:UNION (PTHREAD-ATTR-T)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-ATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (__PTHREAD_INTERNAL_LIST))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER __PTHREAD_LIST_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (__PTHREAD_MUTEX_S))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-MUTEX-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-MUTEXATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-COND-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-CONDATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-RWLOCK-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-RWLOCKATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-BARRIER-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER PTHREAD-BARRIERATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (STAT)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (WINSIZE)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (TERMIO)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER __KERNEL_FD_SET #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER __KERNEL_FSID_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-CTRLTRANSFER))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-BULKTRANSFER))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-SETINTERFACE))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-DISCONNECTSIGNAL))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-GETDRIVER))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-CONNECTINFO))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-ISO-PACKET-DESC))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-URB)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-IOCTL)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-HUB-PORTINFO))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-DISCONNECT-CLAIM))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER (:STRUCT (USBDEVFS-STREAMS))
                            #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER __TIMER_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER __QADDR_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER __CADDR_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-WRAPPER __KERNEL_CADDR_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS __FSID_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS __SIGSET_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (TIMESPEC)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (TIMEVAL)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS FD-SET #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:UNION (PTHREAD-ATTR-T))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-ATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (__PTHREAD_INTERNAL_LIST))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS __PTHREAD_LIST_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (__PTHREAD_MUTEX_S))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-MUTEX-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-MUTEXATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-COND-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-CONDATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-RWLOCK-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-RWLOCKATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-BARRIER-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS PTHREAD-BARRIERATTR-T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (STAT)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (WINSIZE)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (TERMIO)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS __KERNEL_FD_SET #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS __KERNEL_FSID_T #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-CTRLTRANSFER))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-BULKTRANSFER))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-SETINTERFACE))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-DISCONNECTSIGNAL))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-GETDRIVER))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-CONNECTINFO))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-ISO-PACKET-DESC))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-URB)) #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-IOCTL))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-HUB-PORTINFO))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-DISCONNECT-CLAIM))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-ACCESSORS (:STRUCT (USBDEVFS-STREAMS))
                              #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN SELECT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN PSELECT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN GNU-DEV-MAJOR #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN GNU-DEV-MINOR #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN GNU-DEV-MAKEDEV #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN STAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN FSTAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN FSTATAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN LSTAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN CHMOD #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN LCHMOD #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN FCHMOD #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN FCHMODAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN UMASK #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN MKDIR #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN MKDIRAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN MKNOD #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN MKNODAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN MKFIFO #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN MKFIFOAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN UTIMENSAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN FUTIMENS #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN __FXSTAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN __XSTAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN __LXSTAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN __FXSTATAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN __XMKNOD #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN __XMKNODAT #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP:DEFINE-CFUN IOCTL #<PACKAGE "NATIVE-USB">)
   (AUTOWRAP::COMPILE-TIME-REPORT-WRAP-FAILURES)
   (EXPORT
    '(USBDEVFS-STREAMS USBDEVFS-DISCONNECT-CLAIM USBDEVFS-HUB-PORTINFO
      USBDEVFS-IOCTL USBDEVFS-URB USBDEVFS-ISO-PACKET-DESC USBDEVFS-CONNECTINFO
      USBDEVFS-GETDRIVER USBDEVFS-DISCONNECTSIGNAL USBDEVFS-SETINTERFACE
      USBDEVFS-BULKTRANSFER USBDEVFS-CTRLTRANSFER __KERNEL_FSID_T
      __KERNEL_FD_SET TERMIO WINSIZE STAT PTHREAD-BARRIERATTR-T
      PTHREAD-BARRIER-T PTHREAD-RWLOCKATTR-T PTHREAD-RWLOCK-T
      PTHREAD-CONDATTR-T PTHREAD-COND-T PTHREAD-MUTEXATTR-T PTHREAD-MUTEX-T
      __PTHREAD_MUTEX_S __PTHREAD_LIST_T __PTHREAD_INTERNAL_LIST PTHREAD-ATTR-T
      PTHREAD-ATTR-T FD-SET TIMEVAL TIMESPEC __SIGSET_T __FSID_T)
    #<PACKAGE "NATIVE-USB">)
   (EXPORT
    '(IOCTL __XMKNODAT __XMKNOD __FXSTATAT __LXSTAT __XSTAT __FXSTAT FUTIMENS
            UTIMENSAT MKFIFOAT MKFIFO MKNODAT MKNOD MKDIRAT MKDIR UMASK
            FCHMODAT FCHMOD LCHMOD CHMOD LSTAT FSTATAT FSTAT STAT
            GNU-DEV-MAKEDEV GNU-DEV-MINOR GNU-DEV-MAJOR PSELECT SELECT)
    #<PACKAGE "NATIVE-USB">)
   NIL
   (EXPORT
    '(+UTIME-NOW+ +__S_IEXEC+ +UTIME-OMIT+ +S-IFMT+ +CFLUSH+ +S-IFDIR+
      +S-IFBLK+ +S-IFCHR+ +S-IFREG+ +S-IFIFO+ +S-IFSOCK+ +S-IFLNK+
      +__HAVE_PTHREAD_ATTR_T+ +__SIZEOF_PTHREAD_BARRIERATTR_T+
      +__SIZEOF_PTHREAD_BARRIER_T+ +TCSETX+ +__SIZEOF_PTHREAD_RWLOCKATTR_T+
      +TIOCGDEV+ +TCGETX+ +TIOCGPTN+ +TIOCSPTLCK+ +S-ISUID+ +S-ISGID+ +TIOCSIG+
      +TIOCGPKT+ +S-ISVTX+ +S-IRUSR+ +TIOCVHANGUP+ +TCSETXF+ +S-IWUSR+
      +S-IXUSR+ +TCSETXW+ +S-IRWXU+ +FIONCLEX+ +S-IREAD+ +FIOCLEX+ +TIOCGPTLCK+
      +TIOCGEXCL+ +__PTHREAD_SPINS+ +__PTHREAD_MUTEX_HAVE_PREV+ +FIOASYNC+
      +TIOCSERGWILD+ +TIOCSERCONFIG+ +TIOCPKT+ +FIONBIO+ +TIOCSSERIAL+
      +TIOCGSERIAL+ +TIOCCONS+ +TCSBRKP+ +TIOCCBRK+
      +__PTHREAD_RWLOCK_INT_FLAGS_SHARED+ +TIOCGETD+
      +__PTHREAD_RWLOCK_ELISION_EXTRA+ +TIOCSETD+ +TIOCNOTTY+ +TCGETS2+
      +ST-MTIME+ +TIOCSBRK+ +TIOCGSID+ +ST-ATIME+ +TIOCGRS485+ +TIOCGPGRP+
      +TIOCSRS485+ +TCSETSF2+ +ST-CTIME+ +TCSETSW2+ +_STATBUF_ST_RDEV+
      +TCSETS2+ +_STATBUF_ST_BLKSIZE+ +__S_IFMT+ +TIOCSCTTY+ +_STATBUF_ST_NSEC+
      +TIOCNXCL+ +TIOCEXCL+ +__S_IFCHR+ +__S_IFBLK+ +__S_IFDIR+ +TCFLSH+
      +TIOCOUTQ+ +TIOCSTI+ +TIOCGWINSZ+ +__S_IFIFO+ +__S_IFREG+ +__S_IFSOCK+
      +TIOCSPGRP+ +__S_IFLNK+ +TIOCMSET+ +TIOCMBIC+ +TIOCMBIS+ +__S_ISUID+
      +TIOCLINUX+ +TIOCMGET+ +TIOCSWINSZ+ +__S_ISVTX+ +FIONREAD+ +TIOCINQ+
      +__S_ISGID+ +__S_IWRITE+ +TIOCSSOFTCAR+ +_SYS_STAT_H+ +__S_IREAD+
      +TIOCGSOFTCAR+ +_BITS_STAT_H+ +_STAT_VER_KERNEL+ +_STAT_VER+
      +_STAT_VER_LINUX+ +_MKNOD_VER_LINUX+ +SIOCPROTOPRIVATE+
      +__STDC_IEC_559__+ +_STDC_PREDEF_H+ +_IOC_WRITE+ +_SIGSET_H_TYPES+
      +_IOC_NONE+ +_IOC_READ+ +__FD_ZERO_STOS+ +_ATFILE_SOURCE+
      +__USE_POSIX_IMPLICITLY+ +_SYS_SELECT_H+ +_IOC_SIZEBITS+ +_IOC_TYPEBITS+
      +_LINUX_IOCTL_H+ +_ASM_GENERIC_IOCTL_H+ +__THROW+ +__SUSECONDS_T_DEFINED+
      +__THROWNL+ +__NEED_TIMEVAL+ +_STRUCT_TIMEVAL+ +__LEAF_ATTR+
      +_IOC_NRBITS+ +__LEAF+ +FD-SETSIZE+ +__ASM_GENERIC_IOCTLS_H+ +__NFDBITS+
      +_SYS_CDEFS_H+ +_SYS_IOCTL_H+ +TIOCSERSWILD+ +_IOC_TYPESHIFT+
      +_IOC_NRSHIFT+ +TIOCGLCKTRMIOS+ +_IOC_DIRMASK+ +_IOC_DIRSHIFT+
      +__GLIBC_MINOR__+ +_SIGSET_NWORDS+ +_IOC_SIZESHIFT+ +__GNU_LIBRARY__+
      +__GLIBC__+ +_IOC_NRMASK+ +__STDC_NO_THREADS__+ +_IOC_DIRBITS+
      +__STDC_ISO_10646__+ +__SIGSET_T_DEFINED+ +__STDC_IEC_559_COMPLEX__+
      +_IOC_SIZEMASK+ +_IOC_TYPEMASK+ +__END_NAMESPACE_C99+
      +__BEGIN_NAMESPACE_C99+ +__END_NAMESPACE_STD+ +__BEGIN_NAMESPACE_STD+
      +__BEGIN_DECLS+ +__END_DECLS+ +__LONG_DOUBLE_T+ +__PTR_T+ +SIOCDIFADDR+
      +__ATTRIBUTE_MALLOC__+ +SIOCGIFPFLAGS+ +SIOCSIFHWBROADCAST+ +__FLEXARR+
      +SIOCADDMULTI+ +SIOGIFINDEX+ +SIOCSIFSLAVE+ +SIOCGIFCOUNT+
      +SIOCSIFPFLAGS+ +SIOCSIFMEM+ +SIOCSIFHWADDR+ +SIOCSIFENCAP+ +SIOCSIFNAME+
      +SIOCGIFHWADDR+ +TCSETAW+ +SIOCGIFSLAVE+ +SIOCGIFMTU+ +SIOCGIFENCAP+
      +IOC-IN+ +TCSBRK+ +SIOCSIFMTU+ +TCXONC+ +IOC-OUT+ +TCSETSF+ +IOC-INOUT+
      +IOCSIZE-SHIFT+ +IOCSIZE-MASK+ +S-IROTH+ +S-IWGRP+ +S-IRWXG+ +TCSETA+
      +S-IXGRP+ +S-IEXEC+ +TCSETAF+ +S-IRGRP+ +TCGETS+ +S-IWRITE+
      +SIOCDELMULTI+ +TCSETS+ +SIOCGIFINDEX+ +TCSETSW+ +TCGETA+ +SIOCDARP+
      +SIOCGARP+ +SIOCSARP+ +SIOCDRARP+ +SIOCGRARP+ +SIOCGIFBR+ +SIOCSIFBR+
      +SIOCGIFTXQLEN+ +SIOCSIFTXQLEN+ +SIOCDELDLCI+ +SIOCDEVPRIVATE+
      +SIOCSRARP+ +SIOCGIFMAP+ +SIOCSIFMAP+ +SIOCADDDLCI+ +TIOCGICOUNT+
      +TIOCMIWAIT+ +TIOCPKT-DATA+ +CSTART+ +FIOQSIZE+ +TIOCSERGSTRUCT+
      +TIOCSLCKTRMIOS+ +_SYS_SYSMACROS_H+ +TIOCSERSETMULTI+ +SIOCSIFADDR+
      +TIOCSERGETMULTI+ +TIOCSERGETLSR+ +TIOCPKT-IOCTL+ +TIOCPKT-DOSTOP+
      +NFDBITS+ +SIOCADDRT+ +TIOCSER-TEMT+ +TIOCPKT-FLUSHWRITE+
      +TIOCPKT-FLUSHREAD+ +TIOCPKT-NOSTOP+ +TIOCPKT-START+ +_MKNOD_VER+
      +TIOCPKT-STOP+ +SIOCGIFADDR+ +SIOCSIFFLAGS+ +DEFFILEMODE+ +SIOCGIFFLAGS+
      +S-BLKSIZE+ +SIOCRTMSG+ +SIOCDELRT+ +ACCESSPERMS+ +S-IRWXO+ +ALLPERMS+
      +CWERASE+ +S-IWOTH+ +SIOCGIFCONF+ +SIOCSIFLINK+ +SIOCGIFNAME+ +S-IXOTH+
      +SIOCGIFMETRIC+ +CDISCARD+ +CREPRINT+ +SIOCSIFNETMASK+ +CEOT+
      +SIOCGIFMEM+ +CBRK+ +SIOCSIFMETRIC+ +CRPRNT+ +SIOCSIFDSTADDR+
      +SIOCGIFBRDADDR+ +SIOCGIFDSTADDR+ +CSTOP+ +SIOCGIFNETMASK+ +CLNEXT+
      +__BLKSIZE_T_DEFINED+ +SIOCSIFBRDADDR+ +__CLOCK_T_DEFINED+
      +__TIME_T_DEFINED+ +__NEED_TIMESPEC+ +__TIMESPEC_DEFINED+ +__NEED_SIZE_T+
      +__CLOCKID_T_DEFINED+ +__TIMER_T_DEFINED+ +__INT8_T_DEFINED+
      +__USE_XOPEN2K+ +__USE_XOPEN2K8+ +__USE_MISC+ +__USE_ATFILE+
      +__U_CHAR_DEFINED+ +__USE_FORTIFY_LEVEL+ +__KERNEL_STRICT_NAMES+
      +_DEFAULT_SOURCE+ +_POSIX_SOURCE+ +_POSIX_C_SOURCE+ +__SSIZE_T_DEFINED+
      +__DADDR_T_DEFINED+ +__ID_T_DEFINED+ +__PID_T_DEFINED+ +__NEED_CLOCKID_T+
      +__NEED_TIME_T+ +__KEY_T_DEFINED+ +__NEED_TIMER_T+ +__NEED_CLOCK_T+
      +__GID_T_DEFINED+ +__DEV_T_DEFINED+ +_FEATURES_H+ +_SYS_TYPES_H+
      +__INO_T_DEFINED+ +__USE_ISOC11+ +__USE_ISOC95+ +__OFF_T_DEFINED+
      +__USE_ISOC99+ +__USE_POSIX2+ +__UID_T_DEFINED+ +__USE_POSIX+
      +__NLINK_T_DEFINED+ +__USE_POSIX199506+ +__USE_POSIX199309+
      +__MODE_T_DEFINED+ +TIOCM-CAR+ +TIOCM-SR+ +TIOCM-CTS+ +TIOCM-ST+
      +TIOCM-RTS+ +TIOCM-DTR+ +TIOCM-LE+ +__ATTRIBUTE_NOINLINE__+
      +__ATTRIBUTE_USED__+ +NCC+ +__ATTRIBUTE_CONST__+ +__ATTRIBUTE_PURE__+
      +N-HCI+ +N-SYNC-PPP+ +N-HDLC+ +N-SMSBLOCK+ +N-PROFIBUS-FDL+ +N-IRDA+
      +N-R3964+ +N-MASC+ +N-6PACK+ +N-AX25+ +N-X25+ +N-STRIP+ +N-PPP+ +N-SLIP+
      +N-MOUSE+ +N-TTY+ +TIOCM-RI+ +TIOCM-CD+ +TIOCM-DSR+ +TIOCM-RNG+
      +__CPU_MASK_TYPE+ +TTYDEF-CFLAG+ +__SSIZE_T_TYPE+
      +__INO_T_MATCHES_INO64_T+ +__OFF_T_MATCHES_OFF64_T+ +TTYDEF-LFLAG+
      +TTYDEF-OFLAG+ +CMIN+ +TTYDEF-IFLAG+ +_SYS_TTYDEFAULTS_H_+ +CDSUSP+
      +CSUSP+ +CTIME+ +CKILL+ +CQUIT+ +CERASE+ +CINTR+ +CSTATUS+ +CEOL+ +CEOF+
      +TTYDEF-SPEED+ +__LITTLE_ENDIAN+ +__SYSCALL_SLONG_TYPE+
      +__STUB_SIGRETURN+ +_ENDIAN_H+ +__SYSCALL_ULONG_TYPE+ +__STUB_SSTK+
      +__STUB_STTY+ +__BIT_TYPES_DEFINED__+ +__STD_TYPE+ +_BITS_TYPES_H+
      +__U64_TYPE+ +_BITS_TYPESIZES_H+ +__GID_T_TYPE+ +__FLOAT_WORD_ORDER+
      +__STUB_LCHMOD+ +__STUB_PUTMSG+ +__BYTE_ORDER+ +__INO_T_TYPE+
      +__DEV_T_TYPE+ +__STUB_REVOKE+ +__PDP_ENDIAN+ +__BIG_ENDIAN+
      +__UID_T_TYPE+ +__STUB_SETLOGIN+ +__FSWORD_T_TYPE+ +__NLINK_T_TYPE+
      +BYTE-ORDER+ +__OFF_T_TYPE+ +PDP-ENDIAN+ +BIG-ENDIAN+ +__INO64_T_TYPE+
      +__MODE_T_TYPE+ +LITTLE-ENDIAN+ +__RLIM_T_TYPE+ +__RLIM64_T_TYPE+
      +__OFF64_T_TYPE+ +__PID_T_TYPE+ +__FSBLKCNT_T_TYPE+ +__FSBLKCNT64_T_TYPE+
      +__BLKCNT_T_TYPE+ +__BLKCNT64_T_TYPE+ +_BITS_BYTESWAP_H+ +__ID_T_TYPE+
      +__CLOCK_T_TYPE+ +__TIME_T_TYPE+ +__FSFILCNT_T_TYPE+
      +__FSFILCNT64_T_TYPE+ +__DADDR_T_TYPE+ +__STUB_FATTACH+ +__KEY_T_TYPE+
      +__STUB_FDETACH+ +__STUB_FCHFLAGS+ +__STUB_GETMSG+ +__USECONDS_T_TYPE+
      +__STUB_GTTY+ +__SUSECONDS_T_TYPE+ +__BLKSIZE_T_TYPE+ +__FSID_T_TYPE+
      +__CLOCKID_T_TYPE+ +__STUB___COMPAT_BDFLUSH+ +__TIMER_T_TYPE+
      +__STUB_CHFLAGS+ +__RESTRICT_ARR+ +__BLKCNT_T_DEFINED+
      +__FSBLKCNT_T_DEFINED+ +__EXTERN_INLINE+ +__FORTIFY_FUNCTION+
      +__FSFILCNT_T_DEFINED+ +__EXTERN_ALWAYS_INLINE+ +__SYSCALL_WORDSIZE+
      +_BITS_PTHREADTYPES_H+ +__WORDSIZE_TIME64_COMPAT32+
      +__SIZEOF_PTHREAD_ATTR_T+ +__SIZEOF_PTHREAD_MUTEX_T+
      +__SIZEOF_PTHREAD_MUTEXATTR_T+ +__SIZEOF_PTHREAD_COND_T+
      +__SIZEOF_PTHREAD_CONDATTR_T+ +__SIZEOF_PTHREAD_RWLOCK_T+ +__WORDSIZE+
      +__U32_TYPE+ +__S32_TYPE+ +__SQUAD_TYPE+ +__ATTRIBUTE_DEPRECATED__+
      +__U16_TYPE+ +__S16_TYPE+ +__UQUAD_TYPE+ +__SWORD_TYPE+ +__ALWAYS_INLINE+
      +__WUR+ +__ULONGWORD_TYPE+ +__ATTRIBUTE_ARTIFICIAL__+ +__SLONGWORD_TYPE+
      +__S64_TYPE+ +__ULONG32_TYPE+ +__SLONG32_TYPE+ +__UWORD_TYPE+
      +__ATTRIBUTE_WARN_UNUSED_RESULT__+ +USBDEVFS-SUBMITURB+
      +USBDEVFS-SETCONFIGURATION+ +USBDEVFS-GETDRIVER+ +USBDEVFS-DISCARDURB+
      +USBDEVFS-REAPURB+ +USBDEVFS-SUBMITURB32+ +USBDEVFS-BULK+
      +USBDEVFS-BULK32+ +USBDEVFS-CONTROL32+ +USBDEVFS-SETINTERFACE+
      +USBDEVFS-RESETEP+ +USBDEVFS-DISCONNECT-CLAIM-IF-DRIVER+
      +USBDEVFS-DISCONNECT-CLAIM-EXCEPT-DRIVER+ +USBDEVFS-CONTROL+
      +USBDEVFS-CAP-ZERO-PACKET+ +USBDEVFS-CAP-BULK-CONTINUATION+
      +USBDEVFS-CAP-REAP-AFTER-DISCONNECT+ +USBDEVFS-CAP-NO-PACKET-SIZE-LIM+
      +USBDEVFS-CAP-BULK-SCATTER-GATHER+ +USBDEVFS-URB-TYPE-INTERRUPT+
      +USBDEVFS-URB-TYPE-ISO+ +USBDEVFS-URB-NO-INTERRUPT+
      +USBDEVFS-URB-TYPE-BULK+ +USBDEVFS-URB-TYPE-CONTROL+
      +USBDEVFS-URB-SHORT-NOT-OK+ +USBDEVFS-CONNECT+ +USBDEVFS-CLAIM-PORT+
      +USBDEVFS-RELEASE-PORT+ +USBDEVFS-URB-ZERO-PACKET+ +USBDEVFS-URB-NO-FSBR+
      +USBDEVFS-GET-CAPABILITIES+ +USBDEVFS-DISCONNECT-CLAIM+
      +USBDEVFS-URB-BULK-CONTINUATION+ +USBDEVFS-ALLOC-STREAMS+
      +USBDEVFS-URB-ISO-ASAP+ +USBDEVFS-DISCONNECT+ +USBDEVFS-CONNECTINFO+
      +USBDEVFS-RELEASEINTERFACE+ +USBDEVFS-IOCTL32+ +USBDEVFS-IOCTL+
      +USBDEVFS-HUB-PORTINFO+ +USBDEVFS-CLEAR-HALT+ +USBDEVFS-RESET+
      +USBDEVFS-REAPURBNDELAY+ +USBDEVFS-REAPURB32+ +USBDEVFS-REAPURBNDELAY32+
      +USBDEVFS-DISCSIGNAL32+ +USBDEVFS-DISCSIGNAL+ +USBDEVFS-CLAIMINTERFACE+
      +USBDEVFS-FREE-STREAMS+ +USBDEVFS-MAXDRIVERNAME+
      +_ASM_X86_POSIX_TYPES_64_H+ +__KERNEL_OLD_UID_T+ +_LINUX_POSIX_TYPES_H+
      +__FD_SETSIZE+ +__ASM_GENERIC_POSIX_TYPES_H+ +__KERNEL_OLD_DEV_T+
      +__ASM_GENERIC_BITS_PER_LONG+ +__BITS_PER_LONG+ +__ASM_X86_BITSPERLONG_H+
      +_ASM_GENERIC_INT_LL64_H+ +_ASM_GENERIC_TYPES_H+ +_ASM_X86_TYPES_H+
      +_LINUX_USBDEVICE_FS_H+)
    #<PACKAGE "NATIVE-USB">)
   (EXPORT
    '(__KERNEL_GID16_T __KERNEL_UID16_T __KERNEL_CLOCKID_T __KERNEL_TIMER_T
      __KERNEL_CLOCK_T __KERNEL_TIME_T __KERNEL_LOFF_T __KERNEL_OFF_T
      __KERNEL_PTRDIFF_T __KERNEL_SSIZE_T __KERNEL_SIZE_T __KERNEL_GID32_T
      __KERNEL_UID32_T __KERNEL_DADDR_T __KERNEL_SUSECONDS_T __KERNEL_GID_T
      __KERNEL_UID_T __KERNEL_IPC_PID_T __KERNEL_PID_T __KERNEL_MODE_T
      __KERNEL_INO_T __KERNEL_ULONG_T __KERNEL_LONG_T __KERNEL_OLD_DEV_T
      __KERNEL_OLD_GID_T __KERNEL_OLD_UID_T __KERNEL_MQD_T __KERNEL_KEY_T
      __KERNEL_SIGHANDLER_T |__U64| |__S64| |__U32| |__S32| |__U16| |__S16|
      |__U8| |__S8| PTHREAD-SPINLOCK-T PTHREAD-ONCE-T PTHREAD-KEY-T PTHREAD-T
      FSFILCNT-T FSBLKCNT-T BLKCNT-T BLKSIZE-T FD-MASK __FD_MASK SUSECONDS-T
      SIGSET-T __SIG_ATOMIC_T REGISTER-T U-INT64-T U-INT32-T U-INT16-T U-INT8-T
      INT64-T INT32-T INT16-T INT8-T UINT USHORT ULONG TIMER-T CLOCKID-T TIME-T
      CLOCK-T KEY-T CADDR-T DADDR-T SSIZE-T ID-T PID-T OFF-T UID-T NLINK-T
      MODE-T GID-T DEV-T INO-T LOFF-T FSID-T U-QUAD-T QUAD-T U-LONG U-INT
      U-SHORT U-CHAR __SOCKLEN_T __INTPTR_T __LOFF_T __SYSCALL_ULONG_T
      __SYSCALL_SLONG_T __SSIZE_T __FSWORD_T __FSFILCNT64_T __FSFILCNT_T
      __FSBLKCNT64_T __FSBLKCNT_T __BLKCNT64_T __BLKCNT_T __BLKSIZE_T
      __CLOCKID_T __KEY_T __DADDR_T __SUSECONDS_T __USECONDS_T __TIME_T __ID_T
      __RLIM64_T __RLIM_T __CLOCK_T __PID_T __OFF64_T __OFF_T __NLINK_T
      __MODE_T __INO64_T __INO_T __GID_T __UID_T __DEV_T __U_QUAD_T __QUAD_T
      __UINT64_T __INT64_T __UINT32_T __INT32_T __UINT16_T __INT16_T __UINT8_T
      __INT8_T __U_LONG __U_INT __U_SHORT __U_CHAR)
    #<PACKAGE "NATIVE-USB">)
   (SETF AUTOWRAP::*MUTE-REPORTING-P* NIL))
 (LET ((AUTOWRAP::*MUTE-REPORTING-P* NIL))
   (EVAL-WHEN (:LOAD-TOPLEVEL :EXECUTE)
     (AUTOWRAP::REPORT-WRAP-FAILURES 'AUTOWRAP::LOAD-TIME *STANDARD-OUTPUT*)
     (AUTOWRAP::CLEAR-WRAP-FAILURES))))
