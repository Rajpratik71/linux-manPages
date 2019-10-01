NOLOGIN(8)                                                                               BSD System Manager's Manual                                                                               NOLOGIN(8)

NAME
     nologin — politely refuse a login

SYNOPSIS
     nologin

DESCRIPTION
     nologin displays a message that an account is not available and exits non-zero.  It is intended as a replacement shell field for accounts that have been disabled.

     If the file /etc/nologin.txt exists, nologin displays its contents to the user instead of the default message.

SEE ALSO
     login(1)

HISTORY
     The nologin command appeared in 4.4BSD.

BSD                                                                                           February 15, 1997                                                                                           BSD
