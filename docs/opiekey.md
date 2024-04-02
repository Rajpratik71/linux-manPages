OPIEKEY(1)                                                                                 General Commands Manual                                                                                 OPIEKEY(1)



NAME
       opiekey, otp-md4, otp-md5 - Programs for computing responses to OTP challenges.


SYNOPSIS
       opiekey | otp-md4 | otp-md5 [-v] [-h] [-f] [-x]
       [-t type ] [-4|-5] [-a] [-n count ] sequence_number seed


DESCRIPTION
       opiekey  takes  the optional count of the number of responses to print along with a (maximum) sequence number and seed as command line args. It prompts for the user's secret pass phrase and produces
       an OPIE response as six words. If compiled to do so, it can prompt for the user's secret pass phrase twice to help reduce errors due to mistypes. The second password entry  can  be  circumvented  by
       entering only an end of line.  opiekey is downward compatible with the key(1) program from the Bellcore S/Key Version 1 distribution and several of its variants.


OPTIONS
       -v     Display the version number and compile-time options, then exit.

       -h     Display a brief help message and exit.

       -4, -5 Selects  MD4  or  MD5,  respectively, as the response generation algorithm. The default for otp-md4 is MD4 and the default for opie-md5 is MD5. The default for opiekey depends on compile-time
              configuration, but should be MD5. MD4 is compatible with the Bellcore S/Key Version 1 distribution.

       -f     Force opiekey to continue, even where it normally shouldn't. This is currently used to force opiekey to operate in even from terminals it believes to be insecure.  It can also allow users  to
              disclose their secret pass phrases to attackers.  Use of the -f flag may be disabled by compile-time option in your particular build of OPIE.

       -a     Allows  you  to input an arbitrary secret pass phrase, instead of running checks against it. Arbitrary currently does not include ' ' or '0 characters. This can be used for backwards compati-
              bility with key generators that do not check passwords.

       -n <count>
              the number of one time access passwords to print.  The default is one.

       -x     Output the OTPs as hexadecimal numbers instead of six words.

       -t <type>
              Generate an extended response of the specified type. Supported types are:

              word           six-word
              hex            hexadecimal
              init           hexadecimal re-initialization
              init-word      six-word re-initialization

              The re-initialization responses always generate the simple active attack protection.


       EXAMPLE
              wintermute$ opiekey -5 -n 5 495 wi01309
              Using MD5 algorithm to compute response.
              Reminder: Don't use opiekey from telnet or dial-in sessions.
              Enter secret pass phrase:
              491: HOST VET FOWL SEEK IOWA YAP
              492: JOB ARTS WERE FEAT TILE IBIS
              493: TRUE BRED JOEL USER HALT EBEN
              494: HOOD WED MOLT PAN FED RUBY
              495: SUB YAW BILE GLEE OWE NOR
              wintermute$

BUGS
       opiekey(1) can lull a user into revealing his/her password when remotely logged in, thus defeating the purpose of OPIE. This is especially a problem with xterm.  opiekey(1) implements simple  checks
       to reduce the risk of a user making this mistake. Better checks are needed.

SEE ALSO
       opie(4), opiepasswd(1), opieinfo(1), opiesu(1), opielogin(1), opieftpd(8), opiekeys(5), opieaccess(5), opiegen(1)


AUTHOR
       Bellcore's S/Key was written by Phil Karn, Neil M. Haller, and John S. Walden of Bellcore. OPIE was created at NRL by Randall Atkinson, Dan McDonald, and Craig Metz.

       S/Key is a trademark of Bell Communications Research (Bellcore).


CONTACT
       OPIE is discussed on the Bellcore "S/Key Users" mailing list. To join, send an email request to:

       skey-users-request@thumper.bellcore.com



7th Edition                                                                                   February 20, 1996                                                                                    OPIEKEY(1)
