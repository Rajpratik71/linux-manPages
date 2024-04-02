SAMPASSWD(8)                                                  System Manager's Manual                                                 SAMPASSWD(8)

NAME
       sampasswd - reset passwords of users in the SAM user database

SYNOPSIS
       sampasswd [options] -uuser <samfile>

DESCRIPTION
       This  manual  page  documents briefly the sampasswd command.  This manual page was written for the Debian distribution because the original
       program does not have a manual page.

       sampasswd is a non-interactive command line utility that can reset a user's password and/or the user's account bits from the SAM user data‐
       base  file  of  a  Microsoft  Windows  system  (Windows  NT, 2000, XP, Vista, 7, 8.1, etc.).  This file is usually located at \WINDOWS\sys‐
       tem32\config\SAM on the file system of a Microsoft Windows Operating System

       On success, the program does not output any informatin and the exit code is 0.

OPTIONS
       -h     Show summary of options.

       -r     Reset the user's password.

       -a     Reset all the users. If this option is used there is no need to specify the next option.

       -u <user>
              User to change. The user value can be provided as a username, or a RID number in hexadecimal  (if  the  username  is  preceded  with
              '0x'). Usernames including international characters will probably not work.

       -l     Lists the users in the SAM database.

       -H     Output human readable output. The program by default will print a parsable table unless this option is used.

       -N     Do not allocate more information, only allow the editing of existing values with same size.

       -E     Do not expand the hive file (safe mode).

       -t     Print debug information of allocated blocks.

       -v     Print verbose information and debug messages.

EXAMPLES
       sampasswd -r -u theboss
              Reset the password of a user named 'theboss', if found.

       sampasswd -r -u 0x3ea
              Reset the password of the user with RID '0x3a'.

       samusrgrp -r -a
              Reset the password of all the users in the Administrator's group (0x220)

       samusrgrp -r -f
              Reset the password of the administrative users with the lowest RID number.  This does not include the built-in administrator (0x1f4)
              unless no other administrative user can be found in the database file.

KNOWN BUGS
       If the username includes international (non-ASCII) characters the program will not (usually) find it. Use the RID number instead.

SEE ALSO
       chntpwd, reged, samusrgrp
       You  will  find   more  information  available  on  how  this  program  works,  in  the  text  files  /usr/share/doc/chntpw/README.txt  and
       /usr/share/doc/chntpw/MANUAL.txt

       More documentation is available at the upstream's author site: http://pogostick.net/~pnh/ntpasswd/

AUTHOR
       This program was written by Petter N Hagen.

       This manual page was written by Javier Fernandez-Sanguino <jfs@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  6th August 2014                                                     SAMPASSWD(8)
