FDUTILSCONFIG(8)                                                                         System Manager's Manual                                                                         FDUTILSCONFIG(8)

NAME
       fdutilsconfig - configure the suid bit of fdmount

SYNOPSIS
       fdutilsconfig

DESCRIPTION
       The  fdutilsconfig  script  provides  an  interactive  way  to  configure the suid bit of the fdmount(1) binary.  It asks you some questions, give you a hint if needed, and enters your choice to
       /etc/fdmount.conf file.

       When upgrading the Debian fdutils package, the suid bit information stored in /etc/fdmount.conf is used to tell the new fdmount binary to keep your old suid bit settings.

       The script makes use of the suidmanager Debian package, if it is installed.  If the script cannot find it, it manipulates the suid bit directly via `chmod u+s' command.

FILES
       fdutilsconfig reads and writes the configuration from /etc/fdmount.conf.  This file is  usually  created  when  the  fdutils  package  is  installed  for  the  first  time.   Please  don't  edit
       /etc/fdmount.conf manually!  Use fdutilsconfig instead.

NOTE
       This script was written exclusively for the Debian GNU/Linux distribution.  It is not a part of the upstream fdutils sources.

AUTHORS
       fdutilsconfig was adapted by Anthony Fok <foka@debian.org> from the gnuplotconfig script written by Tibor Simko <simko@debian.org>.

SEE ALSO
       fdmount(1), suidregister(8), suidunregister(8)

4th Berkeley Distribution                                                                    24 January 1999                                                                             FDUTILSCONFIG(8)
