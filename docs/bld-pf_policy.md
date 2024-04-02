BLD-POSTFIX_POLICY(8)                                         System Manager's Manual                                        BLD-POSTFIX_POLICY(8)

NAME
       bld-postfix_policy - BLD policy server for Postfix

SYNOPSIS
       bld-postfix_policy [-v] [host [port]]

OPTIONS
       -v     Log information to syslog

       host and port
              Connect to a BLD running on a different host and port (default localhost:2905)

DESCRIPTION
       bld-postfix_policy  implements  a policy server for Postfix.  It is a safe interface to BLD: any error (eg unable to connect to the daemon)
       returns a "dunno" action instead of a reject code.

       Please read Postfix documentation on how to install a policy server.

SEE ALSO
       bld(8) postfix(1)

AUTHOR
       Olivier Beyssac <obld@r14.freenix.org>

                                                                   October 2004                                              BLD-POSTFIX_POLICY(8)
