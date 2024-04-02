OPIEKEY(1)                                                                                 General Commands Manual                                                                                 OPIEKEY(1)



NAME
       opiegen - Example OPIE-based OTP generator


SYNOPSIS
       opiegen
       [ challenge ]


DESCRIPTION
       opiegen  takes  a properly formed OTP challenge either from the command line or from standard input, prompts the user for a secret pass phrase, and generates an OTP response to that challenge. It is
       intended as an example for programmers of how a simple OTP generator can be built. Users should probably use the opiekey program instead.


EXAMPLE
       wintermute$ opiegen otp-md5 495 wi01309
       Secret Pass Phrase:
       GILL HUED GOES CHUM LIEU VAIN
       wintermute$

BUGS
       opiegen(1) can lull a user into revealing his/her password when remotely logged in, thus defeating the purpose of OPIE. This is especially a problem with xterm.  opiegen(1) implements simple  checks
       to reduce the risk of a user making this mistake. Better checks are needed.

SEE ALSO
       opiekey(1), opieserv(1), opie(4), opiepasswd(1), opieinfo(1), opiesu(1), opielogin(1), opieftpd(8), opiekeys(5), opieaccess(5)


AUTHOR
       The opiegen(1) program was created by Craig Metz for OPIE 2.2.

       Bellcore's S/Key was written by Phil Karn, Neil M. Haller, and John S. Walden of Bellcore. OPIE was created at NRL by Randall Atkinson, Dan McDonald, and Craig Metz.

       S/Key is a trademark of Bell Communications Research (Bellcore).


CONTACT
       OPIE is discussed on the Bellcore "S/Key Users" mailing list. To join, send an email request to:

       skey-users-request@thumper.bellcore.com



7th Edition                                                                                   February 20, 1996                                                                                    OPIEKEY(1)
