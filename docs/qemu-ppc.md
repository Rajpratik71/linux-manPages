qemu-user(1)                                    Debian                                   qemu-user(1)

NAME
       qemu-user - QEMU User Emulator

SYNOPSIS
       qemu-user [options] program [program-arguments...]

DESCRIPTION
       The  qemu-user  emulator  can run binaries for other architectures but with the same operating
       system as the current one.

OPTIONS
       -h     Print this help.

       -g     Wait gdb connection to port 1234.

       -L <path>
              Set the elf interpreter prefix (default=/etc/qemu-binfmt/%M).

       -s <size>
              Set the stack size in bytes (default=524288).

       -d <options>
              Activate log (logfile=/tmp/qemu.log)

       -p <pagesize>
              Set the host page size to 'pagesize'.

SEE ALSO
       qemu-system(1) (in qemu-system-common package).

AUTHOR
       This manual page was written by Guillem Jover <guillem@debian.org>.

0.9.0                                         2007-02-08                                 qemu-user(1)
