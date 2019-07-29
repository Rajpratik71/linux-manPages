UNHIDE-TCP(8)                                                 System Manager's Manual                                                UNHIDE-TCP(8)

NAME
       unhide-tcp — forensic tool to find hidden TCP/UDP ports

SYNOPSIS
       unhide-tcp [options]

DESCRIPTION
       unhide-tcp  is  a  forensic  tool  that  identifies  TCP/UDP  ports  that are listening but are not listed by /sbin/ss (or alternatively by
       /bin/netstat) through brute forcing of all TCP/UDP ports available.
       Note1 : On FreeBSD ans OpenBSD, netstat is allways used as iproute2 doesn't exist on these OS. In addition, on FreeBSD,  sockstat  is  used
       instead of fuser.  Note2 : If iproute2 is not available on the system, option -n or -s SHOULD be given on the command line.

OPTIONS
       -h --help
              Display help

       --brief
              Don't display warning messages, that's the default behavior.

       -f --fuser
              Display  fuser  output  (if available) for the hidden port On FreeBSD, instead of fuser command, displays the output of the sockstat
              command for the hidden port.

       -l --lsof
              Display lsof output (if available) for the hidden port

       -n --netstat
              Use /bin/netstat instead of /sbin/ss. On system with many opened ports, this can slow down the test dramatically.

       -s --server
              Use a very quick strategy of scanning. On system with a lot of opened ports, it is hundreds times faster  than  ss  method  and  ten
              thousands times faster than netstat method.

       -o --log
              Write a log file (unhide-tcp-AAAA-MM-DD.log) in the current directory.

       -V --version
              Show version and exit

       -v --verbose
              Be verbose, display warning message (default : don't display).  This option may be repeated more than once.

   Exit status:
       0      if no hidden port is found,

       4      if one or more hidden TCP port(s) is(are) found,

       8      if one or more hidden UDP port(s) is(are) found,

       12     if one or more hidden TCP and UDP ports are found.

SEE ALSO
       unhide (8).

AUTHOR
       This  manual  page  was written by Francois Marier francois@debian.org and Patrick Gouin.  Permission is granted to copy, distribute and/or
       modify this document under the terms of the GNU General Public License, Version 3 or any later version published by the Free Software Foun‐
       dation.

LICENSE
       License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

Administration commands                                             August 2012                                                      UNHIDE-TCP(8)
