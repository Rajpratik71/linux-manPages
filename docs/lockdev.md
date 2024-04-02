LOCKDEV(8)                                                                                                                                                                                         LOCKDEV(8)



NAME
       Lockdev  is  a setgid binary, which provides a reliable way to put an exclusive lock in /var/lock to devices (e.g. ttyS0) using both FSSTND and SVr4 methods, so regular users don't need write access
       there.

       This task is achieved through calls to the liblockdev(3) API.


SYNOPSIS
       /usr/sbin/lockdev [<operation>] <device>


DESCRIPTION
       The lockdev command can perform one of the following operations (calls to liblockdev(3) API):

       -l - lock device with dev_lock() function

       -u - unlock device with dev_unlock() function

       no operation - test lock with dev_testlock() function


RETURN VALUES
          Value  dev_lock         dev_unlock       dev_testlock
          0      OK               OK               not locked
          1      locked other     locked other     locked
          2      EACCES
          3      EROFS
          4      EFAULT
          5      EINVAL
          6      ENAMETOOLONG
          7      ENOENT
          8      ENOTDIR
          9      ENOMEM
         10      ELOOP
         11      EIO
         12      EPERM
        255      error               error               error


SEE ALSO
       lockdev(3).



                                                                                                SEPTEMBER 2009                                                                                     LOCKDEV(8)
