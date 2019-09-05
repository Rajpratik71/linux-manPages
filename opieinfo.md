OPIEINFO(1)                                                                                General Commands Manual                                                                                OPIEINFO(1)



NAME
       opieinfo -  Extract sequence number and seed for future OPIE challenges.


SYNOPSIS
       opieinfo [-v] [-h] [ user_name ]


DESCRIPTION
       opieinfo  takes an optional user name and writes the current sequence number and seed found in the OPIE key database for either the current user or the user specified. opiekey is compatible with the
       keyinfo(1) program from Bellcore's S/Key Version 1 except that specification of a remote system name is not permitted.

       opieinfo can be used to generate a listing of your future OPIE responses if you are going to be without an OPIE calculator and still need to log into the system. To do so, you  would  run  something
       like:

       opiekey -n 42 `opieinfo`


OPTIONS
       -v     Display the version number and compile-time options, then exit.

       -h     Display a brief help message and exit.

       <user_name>
              The name of a user whose key information you wish to display. The default is the user running opieinfo.


EXAMPLE
       wintermute$ opieinfo
       495 wi01309
       wintermute$

FILES
       /etc/opiekeys -- database of key information for the OPIE system.


SEE ALSO
       opie(4), opiekey(1), opiepasswd(1), opiesu(1), opielogin(1), opieftpd(8), opiekeys(5) opieaccess(5)


AUTHOR
       Bellcore's S/Key was written by Phil Karn, Neil M. Haller, and John S. Walden of Bellcore. OPIE was created at NRL by Randall Atkinson, Dan McDonald, and Craig Metz.

       S/Key is a trademark of Bell Communications Research (Bellcore).


CONTACT
       OPIE is discussed on the Bellcore "S/Key Users" mailing list. To join, send an email request to:

       skey-users-request@thumper.bellcore.com



7th Edition                                                                                    January 10, 1995                                                                                   OPIEINFO(1)
