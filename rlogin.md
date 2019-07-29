RLOGIN(1)                                                                                BSD General Commands Manual                                                                                RLOGIN(1)

NAME
     rlogin — remote login

SYNOPSIS
     rlogin [-8EKLdx] [-e char] [-k realm] [-l username] host

DESCRIPTION
     Rlogin starts a terminal session on a remote host host.

     Rlogin first attempts to use the Kerberos authorization mechanism, described below.  If the remote host does not supporting Kerberos the standard Berkeley rhosts authorization mechanism is used.  The
     options are as follows:

     -8    The -8 option allows an eight-bit input data path at all times; otherwise parity bits are stripped except when the remote side's stop and start characters are other than ^S/^Q .

     -E    The -E option stops any character from being recognized as an escape character.  When used with the -8 option, this provides a completely transparent connection.

     -K    The -K option turns off all Kerberos authentication.

     -L    The -L option allows the rlogin session to be run in ``litout'' (see tty(4)) mode.

     -d    The -d option turns on socket debugging (see setsockopt(2)) on the TCP sockets used for communication with the remote host.

     -e    The -e option allows user specification of the escape character, which is ``~'' by default.  This specification may be as a literal character, or as an octal value in the form \nnn.

     -k    The option requests rlogin to obtain tickets for the remote host in realm realm instead of the remote host's realm as determined by krb_realmofhost(3).

     -x    The -x option turns on DES encryption for all data passed via the rlogin session.  This may impact response time and CPU utilization, but provides increased security.

     A line of the form ``<escape char>.'' disconnects from the remote host.  Similarly, the line ``<escape char>^Z'' will suspend the rlogin session, and ``<escape char><delayed-suspend char>'' suspends
     the send portion of the rlogin, but allows output from the remote system.  By default, the tilde (``~'') character is the escape character, and normally control-Y (``^Y'') is the delayed-suspend char-
     acter.

     All echoing takes place at the remote site, so that (except for delays) the rlogin is transparent.  Flow control via ^S/^Q and flushing of input and output on interrupts are handled properly.

KERBEROS AUTHENTICATION
     Each user may have a private authorization list in the file .klogin in their home directory.  Each line in this file should contain a Kerberos principal name of the form principal.instance@realm.  If
     the originating user is authenticated to one of the principals named in .klogin, access is granted to the account.  The principal accountname.@localrealm is granted access if there is no .klogin file.
     Otherwise a login and password will be prompted for on the remote machine as in login(1).  To avoid certain security problems, the .klogin file must be owned by the remote user.

     If Kerberos authentication fails, a warning message is printed and the standard Berkeley rlogin is used instead.

ENVIRONMENT
     The following environment variable is utilized by rlogin:

     TERM  Determines the user's terminal type.

SEE ALSO
     rsh(1), kerberos(3), krb_sendauth(3), krb_realmofhost(3)

HISTORY
     The rlogin command appeared in 4.2BSD.

BUGS
     Rlogin will be replaced by telnet(1) in the near future.

     More of the environment should be propagated.

Linux NetKit (0.17)                                                                            August 15, 1999                                                                            Linux NetKit (0.17)
