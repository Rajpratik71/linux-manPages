rdmsr(1)                                                                                 General Commands Manual                                                                                 rdmsr(1)

NAME
       rdmsr - tool for reading CPU machine specific registers (MSR)

SYNOPSIS
       rdmsr [options] regno

DESCRIPTION
       rdmsr is a tool used for reading a CPU's machine specific registers (MSR).
       Note:  if  you're  running a Debian kernel, be sure that the msr.ko kernel module is loaded. 'modprobe msr' should do the trick. Otherwise, you'll get an error about rdmsr not being able to open
       files in /dev/cpu/...

OPTIONS
       --help, -h
              Print a list of available options

       --version, -V
              Print current version

       --hexadecimal, -x
              Display output in hexadecimal (lower case)

       --capital-hex, -X
              Display output in hexadecimal (upper case)

       --decimal, -d
              Display output in signed decimal

       --unsigned, -u
              Display output in unsigned decimal

       --octal, -o
              Display output in octal

       --c-language, -c
              Format output as a C language constant

       --zero-pad, -0
              Output leading zeroes

       --zero-pad, -0
              Output leading zeroes

       --raw, -r
              Output raw binary

       --all, -a
              All processors

       --processor <#>, -p
              Select processor number (default: 0)

       --bitfield h:l, -f
              Output bits [h:l] only

SEE ALSO
       wrmsr(1)

AUTHOR
       rdmsr was written by Transmeta Corporation

       This man page was contributed by Andres Salomon <dilinger@debian.org> for the Debian GNU/Linux system (but may be used by others).

                                                                                                 Mar 2008                                                                                        rdmsr(1)
