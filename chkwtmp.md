CHKWTMP(1)                                                    General Commands Manual                                                   CHKWTMP(1)

NAME
       chkwtmp - check wtmp-file for deleted entries

SYNOPSIS
       chkwtmp

DESCRIPTION
       Chkwtmp examines the file /var/log/wtmp for entries with no information (containing only null-bytes). If such entries are found the program
       prints the time window for the original entry. This is done by displaying the timestamps of the wtmp-entry before  and  after  the  deleted
       entry.

       To  run  chkwtmp  you  need  read permission on the file /var/log/wtmp.  Normally this file is world-readable and no special privileges are
       required to run the checker.

FILES
       /var/log/wtmp       login data base

SEE ALSO
       wtmp(4), who(1)

LIMITATIONS
       An entry is recognized as overwritten if the time-information has been overwritten with null-bytes.

       This program was designed to run on SunOS 4.x systems only. On other systems the output is undefined...

7th Edition                                                       Thu Oct 12 1994                                                       CHKWTMP(1)
