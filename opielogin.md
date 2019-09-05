OPIELOGIN(1)                                                                               General Commands Manual                                                                               OPIELOGIN(1)



NAME
       opielogin - Replacement for login(1) that issues OPIE challenges.


SYNOPSIS
       opielogin [ -p ] [ -r hostname | -h hostname | -f username
       | username ]


DESCRIPTION
       opielogin  provides a replacement for the login(1) program that provides OPIE challenges to users and accepts OPIE responses. It is downward compatible with the keylogin(1) program from the Bellcore
       S/Key Version 1 distribution, which, in turn, is downward compatible with the login(1) program from the 4.3BSD Net/2 distribution.


OPTIONS
       -p     By default, login discards any previous environment.  The -p option disables this behavior.

       -r     Process remote login from hostname.

       -h     The -h option specifies the host from which the connection was received.  It is used by various daemons such as telnetd(8).  This option may only be used by the super-user.

       -f     The -f option is used when a user name is specified to indicate that proper authentication has already been done and that no password need be requested.  This option may only be used  by  the
              super-user or when an already logged in user is logging in as themselves.

       username
              The user name to log in as.

EXAMPLE
       wintermute$ opielogin
       login: kebe
       otp-md5 499 wi43143
       Password: (echo on)
       Password:SLY BLOB TOUR POP BRED EDDY

                      Welcome to wintermute.

       wintermute$

FILES
       /etc/opiekeys -- database of information for the OPIE system.

       /etc/opieaccess -- list of safe and unsafe networks and masks to go with them.

       $HOME/.opiealways -- presence makes OPIE for logins mandatory for the user.


SEE ALSO
       login(1), opie(4), opiekey(1), opiepasswd(1), opieinfo(1), opiesu(1), opieftpd(8), opiekeys(5), opieaccess(5)


AUTHOR
       Bellcore's S/Key was written by Phil Karn, Neil M. Haller, and John S. Walden of Bellcore. OPIE was created at NRL by Randall Atkinson, Dan McDonald, and Craig Metz.

       S/Key is a trademark of Bell Communications Research (Bellcore).


CONTACT
       OPIE is discussed on the Bellcore "S/Key Users" mailing list. To join, send an email request to:

       skey-users-request@thumper.bellcore.com



7th Edition                                                                                    January 10, 1995                                                                                  OPIELOGIN(1)
