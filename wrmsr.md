wrmsr(1)                                General Commands Manual                               wrmsr(1)

NAME
       wrmsr - tool for writing CPU machine specific registers (MSR)

SYNOPSIS
       wrmsr [options] regno value

DESCRIPTION
       wrmsr is a tool used for writing values to a CPU's machine specific registers (MSR).
       Note: if you're running a Debian kernel, be sure that the msr.ko kernel module is loaded. 'mod‐
       probe msr' should do the trick. Otherwise, you'll get an error about wrmsr not  being  able  to
       open files in /dev/cpu/...

OPTIONS
       --help, -h
              Print a list of available options

       --version, -V
              Print current version

       --all, -a
              All processors

       --processor <#>, -p
              Select processor number (default: 0)

SEE ALSO
       rdmsr(1)

AUTHOR
       wrmsr was written by Transmeta Corporation

       This  man page was contributed by Andres Salomon <dilinger@debian.org> for the Debian GNU/Linux
       system (but may be used by others).

                                               Mar 2008                                       wrmsr(1)
