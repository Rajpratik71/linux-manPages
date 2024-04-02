

SASLPASSWD2(8)                                                                             System Manager's Manual                                                                             SASLPASSWD2(8)



NAME
       saslpasswd2 - set a user's sasl password

SYNOPSIS
       saslpasswd2 [-p] [-d] [-c] [-n] [-f file] [-u domain] [-a appname] [-v] userid

DESCRIPTION
       saslpasswd2 is used by a server administrator to set a user's sasl password for server programs and SASL mechanisms which use the standard libsasl database of user secrets.

OPTIONS
       -p     Pipe mode - saslpasswd2 will neither prompt for the password nor verify that it was entered correctly.  This is the default when standard input is not a terminal.

       -c     Creates an entry for the user if the user doesn't already exist.  This is mutually exclusive with the -d (delete user) flag.

       -d     Deletes the entry for the user.  This is mutually exclusive with the -c (create user) flag.

       -n     Don't set the plaintext userPassword property for the user.  Only mechanism-specific secrets will be set (e.g. OTP, SRP)

       -u domain
              use domain for user domain (realm).

       -f file
              use file for sasldb

       -a appname
              use appname as application name.

       -v     Print libsasl2 version number and exit.

SEE ALSO
       sasldblistusers2(8)

       rfc4422 - Simple Authentication and Security Layer (SASL)



CMU SASL                                                                                         Mar 7, 2005                                                                                   SASLPASSWD2(8)
