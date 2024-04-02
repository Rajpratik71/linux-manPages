SOCKLIST(8)                                                                                  Linux System Manual                                                                                  SOCKLIST(8)



NAME
       socklist - display list of open sockets


SYNOPSIS
       socklist


DESCRIPTION
       socklist is a Perl script that gives you a list of all open sockets, enumerating types, port, inode, uid, pid, fd and the program to which it belongs.


OPTIONS
       None.


FILES
       /proc/*/fd/*
              File descriptors.


       /proc/net/tcp
              List of TCP sockets.


       /proc/net/udp
              List of UDP sockets.


       /proc/net/raw
              List of raw sockets.


BUGS
       None as yet.


SEE ALSO
       procinfo(8), netstat(8).


AUTHOR
       Larry Doolittle <ldoolitt@jlab.org>



1st Release                                                                                       1998-02-09                                                                                      SOCKLIST(8)
