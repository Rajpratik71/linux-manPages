OPIESU(1)                                                                                  General Commands Manual                                                                                  OPIESU(1)



NAME
       opiesu - Replacement su(1) program that uses OPIE challenges

SYNOPSIS
       opiesu [ -f ] [ -c ] [ user_name ]

DESCRIPTION
       opiesu  is  a  replacement  for  the su(1) program that issues OPIE challenges and uses OPIE responses. It is downward compatible with keysu(1) from the Bellcore S/Key Version 1 distribution and the
       su(1) program from the 4.3BSD Net/2 distribution.

OPTIONS
       -f     If the invoked shell is csh(1),  this option prevents it from reading the ``.cshrc'' file.  (The [f] option may be passed as a shell argument after the login name, so this option is redundant
              and obsolescent.)

       -c     Set  console  mode where the user is expected to have secure access to the system. In console mode, you will be asked to input your password directly instead of having to use an OPIE calcula-
              tor. If you do not have secure access to the system (i.e., you are not on the system's console), you are volunteering your password to attackers by using this mode.

       user_name
              The name of the user to become.  The default is root.

EXAMPLE
       wintermute$ opiesu kebe
       otp-md5 498 wi910502
       (OTP response required)
       kebe's password:  (echo on)
       kebe's password: RARE GLEN HUGH BOYD NECK MOLL
       wintermute#

FILES
       /etc/opiekeys database of information for OPIE system.

SEE ALSO
       su(1), opie(4), opiekey(1), opieinfo(1), opiesu(1), opielogin(1), opieftpd(8), opiekeys(5), opieaccess(5)


AUTHOR
       Bellcore's S/Key was written by Phil Karn, Neil M. Haller, and John S. Walden of Bellcore. OPIE was created at NRL by Randall Atkinson, Dan McDonald, and Craig Metz.

       S/Key is a trademark of Bell Communications Research (Bellcore).


CONTACT
       OPIE is discussed on the Bellcore "S/Key Users" mailing list. To join, send an email request to:

       skey-users-request@thumper.bellcore.com



7th Edition                                                                                    January 10, 1995                                                                                     OPIESU(1)
