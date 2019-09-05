RLOGIN(1)                                                   BSD General Commands Manual                                                  RLOGIN(1)

NAME
     rlogin — remote login

SYNOPSIS
     rlogin [-8EKLd] [-e char] [-i identity] [-l username] [-p port] host

DESCRIPTION
     Rlogin starts a terminal session on a remote host host.

     Rlogin first attempts to use the Kerberos authorization mechanism, described below.  If the remote host does not supporting Kerberos the
     standard Berkeley rhosts authorization mechanism is used.  The options are as follows:

     -8    The -8 option allows an eight-bit input data path at all times; otherwise parity bits are stripped except when the remote side's stop
           and start characters are other than ^S/^Q .

     -i    The -i option specifies the local user name to use for authentication with the remote rlogind server.  This overrides the default which
           is the name of the user invoking rlogin.

     -l    The -l option specifies the name of the remote user to login as.  This overrides the default which is the name of the user invoking
           rlogin.

     -E    The -E option stops any character from being recognized as an escape character.  When used with the -8 option, this provides a com‐
           pletely transparent connection.

     -K    The -K option turns off all Kerberos authentication.  This option has no effect since Kerberos authentication is not available in this
           version.

     -L    The -L option allows the rlogin session to be run in ``litout'' (see tty(4)) mode.

     -d    The -d option turns on socket debugging (see setsockopt(2)) on the TCP sockets used for communication with the remote host.

     -e    The -e option allows user specification of the escape character, which is ``~'' by default.  This specification may be as a literal
           character, or as an octal value in the form \nnn.

     -p    The -p option specifies the port to connect to.  This overrides the default which is login.

     A line of the form ``<escape char>.'' disconnects from the remote host.  Similarly, the line ``<escape char>^Z'' will suspend the rlogin ses‐
     sion, and ``<escape char><delayed-suspend char>'' suspends the send portion of the rlogin, but allows output from the remote system.  By
     default, the tilde (``~'') character is the escape character, and normally control-Y (``^Y'') is the delayed-suspend character.

     All echoing takes place at the remote site, so that (except for delays) the rlogin is transparent.  Flow control via ^S/^Q and flushing of
     input and output on interrupts are handled properly.

ENVIRONMENT
     The following environment variable is utilized by rlogin:

     TERM  Determines the user's terminal type.

SEE ALSO
     rsh(1)

HISTORY
     The rlogin command appeared in 4.2BSD.

BUGS
     Rlogin will be replaced by telnet(1) in the near future.

     More of the environment should be propagated.

Linux NetKit (0.17)                                               August 15, 1999                                              Linux NetKit (0.17)
