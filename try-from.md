TRY-FROM(8)                                                                             Linux Programmer's Manual                                                                             TRY-FROM(8)

NAME
       try-from - test program for the tcp_wrapper

SYNOPSIS
       try-from

DESCRIPTION
       The  try-from  command  can  be  called via a remote shell command to find out if the hostname and address are properly recognized by the tcp_wrapper library, if username lookup works, and (SysV
       only) if the TLI on top of IP heuristics work. Diagnostics are reported through syslog(3) and redirected to stderr.

       Example:

       rsh host /usr/sbin/try-from

SEE ALSO
       hosts_access(5), hosts_options(5), tcpd(8)

AUTHOR
       Wietse Venema, Eindhoven University of Technology, The Netherlands.

Linux                                                                                         21th June 1997                                                                                  TRY-FROM(8)
