RDATE(1)                                                                                           Red Hat                                                                                           RDATE(1)



NAME
       rdate - get the time via the network

SYNOPSIS
       rdate [-p] [-s] [-u] [-l] [-t sec] [host...]

DESCRIPTION
       rdate connects to an RFC 868 time server over a TCP/IP network, printing the returned time and/or setting the system clock.

   OPTIONS
       -p     Print the time returned by the remote machine.

       -s     Set the system time to the returned time.

       -u     Use UDP instead of TCP as the transport.

       -l     Use syslog to output errors (cron.warning) and output (cron.info).

       -t     Set timeout in seconds for every attempt to retrieve date.

HISTORY
       2004-03-16 Johan Nilsson <joh-nils@dsv.su.se>
              Timeout support added.

       2002-11-06 Elliot Lee <sopwith@redhat.com>
              Patch from Tomek Orzechowski <orzech@pld.org.pl> - alarm(10) to not wait forever for connections.

       2001-05-23 Phil Knirsch <pknirsch@redhat.com>
              Added UDP protocol support.  Close the connection after message handling in conformance to RFC 868.

       2002-03-07 Elliot Lee <sopwith@redhat.com>
              Add syslog functionality.

       2000-02-04 Elliot Lee <sopwith@redhat.com>
              Wrote it (previous incarnation had license problems, all 200 lines of it).



Utilities                                                                                          May 2001                                                                                          RDATE(1)
