withsctp(1)                                                   General Commands Manual                                                  withsctp(1)

NAME
       withsctp - Run TCP binaries over SCTP

SYNOPSIS
       withsctp

DESCRIPTION
       This  package  enables you to use SCTP with your existing TCP-based binaries.  withsctp uses the LD_PRELOAD hack to intercept library calls
       used for TCP connections and use SCTP instead.

EXAMPLES
       withsctp xinetd
              # Start xinetd stream services on SCTP.

       withsctp telnet localhost
              # Make a telnet over SCTP/IP connection.

AUTHOR
       Michael Biebl <biebl@debian.org>

                                                                                                                                       withsctp(1)
