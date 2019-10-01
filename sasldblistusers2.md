

SASLDBLISTUSERS2(8)                                                                        System Manager's Manual                                                                        SASLDBLISTUSERS2(8)



NAME
       sasldblistusers2 - list users in sasldb

SYNOPSIS
       sasldblistusers2 [-f file] [-v]

DESCRIPTION
       sasldblistusers2  is  used  to list the users in the SASL password database (usually /etc/sasldb2). This will NOT list all the users in /etc/passwd, shadow, PAM, etc. only those created by SASL (via
       saslpasswd2).

OPTIONS
       -f file
              use file for sasldb

       -v     Print libsasl2 version number and exit.

SEE ALSO
       saslpasswd2(8)

       rfc4422 - Simple Authentication and Security Layer (SASL)



CMU SASL                                                                                        March 7, 2005                                                                             SASLDBLISTUSERS2(8)
