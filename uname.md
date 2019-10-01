UNAME(1)                                                                                        User Commands                                                                                        UNAME(1)



NAME
       uname - print system information

SYNOPSIS
       uname [OPTION]...

DESCRIPTION
       Print certain system information.  With no OPTION, same as -s.

       -a, --all
              print all information, in the following order, except omit -p and -i if unknown:

       -s, --kernel-name
              print the kernel name

       -n, --nodename
              print the network node hostname

       -r, --kernel-release
              print the kernel release

       -v, --kernel-version
              print the kernel version

       -m, --machine
              print the machine hardware name

       -p, --processor
              print the processor type or "unknown"

       -i, --hardware-platform
              print the hardware platform or "unknown"

       -o, --operating-system
              print the operating system

       --help display this help and exit

       --version
              output version information and exit

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report uname translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by David MacKenzie.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       arch(1), uname(2)

       The full documentation for uname is maintained as a Texinfo manual.  If the info and uname programs are properly installed at your site, the command

              info coreutils 'uname invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                         UNAME(1)
