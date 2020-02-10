SETARCH(8)                                                                                System Administration                                                                                SETARCH(8)

NAME
       setarch - change reported architecture in new program environment and set personality flags

SYNOPSIS
       setarch arch [options] [program [argument...]]

       arch [options] [program [argument...]]

       setarch --list|-h|-V

DESCRIPTION
       setarch  currently  only  affects the output of uname -m.  For example, on an AMD64 system, running setarch i386 program will cause program to see i686 instead of x86_64 as the machine type.  It
       also allows to set various personality options.  The default program is /bin/sh.

OPTIONS
       --list List the architectures that setarch knows about.  Whether setarch can actually set each of these architectures depends on the running kernel.

       --uname-2.6
              Causes the program to see a kernel version number beginning with 2.6.

       -v, --verbose
              Be verbose.

       -3, --3gb
              Specifies that processes should use a maximum of 3GB of address space on systems where it is supported (ADDR_LIMIT_3GB).

       --4gb  Ignored (for backward compatibility only).

       -B, --32bit
              Turns on ADDR_LIMIT_32BIT.

       -F, --fdpic-funcptrs
              Userspace function pointers point to descriptors (turns on FDPIC_FUNCPTRS).

       -I, --short-inode
              Turns on SHORT_INODE.

       -L, --addr-compat-layout
              Changes the way virtual memory is allocated (turns on the ADDR_COMPAT_LAYOUT).

       -R, --addr-no-randomize
              Disables randomization of the virtual address space (turns on ADDR_NO_RANDOMIZE).

       -S, --whole-seconds
              Turns on WHOLE_SECONDS.

       -T, --sticky-timeouts
              Turns on STICKY_TIMEOUTS.

       -X, --read-implies-exec
              Turns on READ_IMPLIES_EXEC.

       -Z, --mmap-page-zero
              Turns on MMAP_PAGE_ZERO.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

EXAMPLES
       setarch ppc32 rpmbuild --target=ppc --rebuild foo.src.rpm
       setarch ppc32 -v -vL3 rpmbuild --target=ppc --rebuild bar.src.rpm
       setarch ppc32 --32bit rpmbuild --target=ppc --rebuild foo.src.rpm

AUTHOR
       Elliot Lee ⟨sopwith@redhat.com⟩
       Jindrich Novy ⟨jnovy@redhat.com⟩

AVAILABILITY
       The setarch command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                                                                    December 2014                                                                                    SETARCH(8)
