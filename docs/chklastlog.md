CHKLASTLOG(1)                                                 General Commands Manual                                                CHKLASTLOG(1)

NAME
       chklastlog - check lastlog-file for deleted entries

SYNOPSIS
       chklastlog

DESCRIPTION
       Chklastlog  is  reading all entries from the file /var/log/wtmp (file with informations about logins and logouts) and checks for every user
       found in this file whether there is an entry in the file /var/log/lastlog, too. The program will complain about userids with logins but  no
       lastlogin information.

       To  run  chklastlog you need read permission on the files /var/log/wtmp and /var/log/lastlogin. Normally these files are world-readable and
       no special privileges are required to run the checker.

FILES
       /var/log/wtmp       login data base
       /var/log/lastlog    last login times

SEE ALSO
       wtmp(4), who(1), last(1)

LIMITATIONS
       This program only works if the user has not logged in after the deletion of their lastlog entry.

       This program was designed to run on SunOS 4.x systems only. On other systems the output is undefined...

7th Edition                                                       Thu Oct 12 1994                                                    CHKLASTLOG(1)
