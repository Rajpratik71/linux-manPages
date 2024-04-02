KPSEACCESS(1)                                                                    General Commands Manual                                                                    KPSEACCESS(1)

NAME
       kpseaccess - determine whether a file can be accessed

SYNOPSIS
       kpseaccess mode file

DESCRIPTION
       Exit  successfully if file can be accessed with the specified mode.  The mode is an optional dash (`-') followed by zero or more letters of rwx, where r is for readable, w is for
       writable, and x is for executable.

       The difference between kpseaccess and test is that the latter looks at the permission bits, while the former checks using the access(2) system call.  This makes a difference when
       file systems have been mounted read-only.

OPTIONS
       kpseaccess accepts the following options:

       --help Print help message and exit.

       --version
              Print version information and exit.

SEE ALSO
       access(2)

Kpathsea 6.3.1/dev                                                                     1 March 2011                                                                         KPSEACCESS(1)
