OPIEPASSWD(1)                                                                              General Commands Manual                                                                              OPIEPASSWD(1)



NAME
       opiepasswd -  Change or set a user's password for the OPIE authentication system.


SYNOPSIS
       opiepasswd [-v] [-h] [-c|-d] [-f]
       [-n initial_sequence_number ] [-s seed ] [ user_name ]


DESCRIPTION
       opiepasswd will initialize the system information to allow one to use OPIE to login.  opiepasswd is downward compatible with the keyinit(1) program from the Bellcore S/Key Version 1 distribution.


OPTIONS
       -v     Display the version number and compile-time options, then exit.

       -h     Display a brief help message and exit.

       -c     Set  console  mode  where  the user is expected to have secure access to the system. In console mode, you will be asked to input your password directly instead of having to use an OPIE
              calculator. If you do not have secure access to the system (i.e., you are not on the system's console), you are volunteering your password to attackers by using this mode.

       -d     Disable OTP logins to the specified account.

       -f     Force opiepasswd to continue, even where it normally shouldn't. This is currently used to force opiepasswd to operate in "console" mode even from terminals it believes to be  insecure.
              It can also allow users to disclose their secret pass phrases to attackers. Use of the -f flag may be disabled by compile-time option in your particular build of OPIE.

       -n     Manually specify the initial sequence number. The default is 499.

       -s     Specify a non-random seed. The default is to generate a "random" seed using the first two characters of the host name and five pseudo-random digits.

EXAMPLE
       Using opiepasswd from the console:

       wintermute$ opiepasswd -c
       Updating kebe:
       Reminder - Only use this method from the console; NEVER from remote. If you
       are using telnet, xterm, or a dial-in, type ^C now or exit with no password.
       Then run opiepasswd without the -c parameter.
       Using MD5 to compute responses.
       Enter old secret pass phrase:
       Enter new secret pass phrase:
       Again new secret pass phrase:

       ID kebe OPIE key is 499 be93564
       CITE JAN GORY BELA GET ABED
       wintermute$

       Using opiepasswd from remote:

       wintermute$ opiepasswd
       Updating kebe:
       Reminder: You need the response from your OPIE calculator.
       Old secret password:
               otp-md5 482 wi93563
               Response: FIRM BERN THEE DUCK MANN AWAY
       New secret password:
               otp-md5 499 wi93564
               Response: SKY FAN BUG HUFF GUS BEAT

       ID kebe OPIE key is 499 wi93564
       SKY FAN BUG HUFF GUS BEAT
       wintermute$

FILES
       /etc/opiekeys -- database of key information for the OPIE system.


SEE ALSO
       passwd(1), opie(4), opiekey(1), opieinfo(1), opiesu(1), opielogin(1), opieftpd(8), opiekeys(5), opieaccess(5)


AUTHOR
       Bellcore's S/Key was written by Phil Karn, Neil M. Haller, and John S. Walden of Bellcore. OPIE was created at NRL by Randall Atkinson, Dan McDonald, and Craig Metz.

       S/Key is a trademark of Bell Communications Research (Bellcore).


CONTACT
       OPIE is discussed on the Bellcore "S/Key Users" mailing list. To join, send an email request to:

       skey-users-request@thumper.bellcore.com



7th Edition                                                                                    January 10, 1995                                                                                 OPIEPASSWD(1)
