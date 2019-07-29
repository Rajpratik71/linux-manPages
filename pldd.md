PLDD(1)                       Linux User Manual                       PLDD(1)

NAME
       pldd - display dynamic shared objects linked into a process

SYNOPSIS
       pldd pid
       pldd option

DESCRIPTION
       The  pldd  command  displays a list of the dynamic shared objects that
       are linked into the process with the specified process ID.   The  list
       includes  the  libraries  that  have  been  dynamically  loaded  using
       dlopen(3).

OPTIONS
       -?, --help
              Display program help message.

       --usage
              Display a short usage message.

       -V, --version
              Display the program version.

EXIT STATUS
       On success, pldd exits with the status 0.  If  the  specified  process
       does  not  exist,  the  user  does  not  have permission to access its
       dynamic shared object list, or no command-line arguments are supplied,
       pldd  exists with a status of 1.  If given an invalid option, it exits
       with the status 64.

VERSIONS
       pldd is available since glibc 2.15.

CONFORMING TO
       The pldd command is not specified by POSIX.1.  Some other systems have
       a similar command.

NOTES
       The command

           lsof -p PID

       also  shows  output  that includes the dynamic shared objects that are
       linked into a process.

       The gdb(1) info shared command also shows the shared  libraries  being
       used by a process, so that one can obtain similar output to pldd using
       a command such as the following (to monitor the process with the spec‐
       ified pid):

           $ gdb -ex "set confirm off" -ex "set height 0" -ex "info shared" \
                   -ex "quit" -p $pid | grep '^0x.*0x'

BUGS
       Since  glibc 2.19, pldd is broken: it just hangs when executed.  It is
       unclear if it will ever be fixed.

EXAMPLE
       $ echo $$               # Display PID of shell
       1143
       $ pldd $$               # Display DSOs linked into the shell
       1143:     /usr/bin/bash
       linux-vdso.so.1
       /lib64/libtinfo.so.5
       /lib64/libdl.so.2
       /lib64/libc.so.6
       /lib64/ld-linux-x86-64.so.2
       /lib64/libnss_files.so.2

SEE ALSO
       ldd(1), lsof(1), dlopen(3), ld.so(8)

COLOPHON
       This page is part of release 4.15 of the Linux man-pages  project.   A
       description  of the project, information about reporting bugs, and the
       latest    version    of    this    page,    can    be     found     at
       https://www.kernel.org/doc/man-pages/.

GNU                               2017-09-15                          PLDD(1)
