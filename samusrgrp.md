SAMUSRGRP(8)                                                  System Manager's Manual                                                 SAMUSRGRP(8)

NAME
       samusrgrp - add or remove users from groups in SAM database files

SYNOPSIS
       samusrgrp [options] <samfile>

DESCRIPTION
       This  manual  page  documents briefly the samusrgrp command.  This manual page was written for the Debian distribution because the original
       program does not have a manual page.

       samusrgrp is a non-interactive command line utility that can add or remove a user from a local group that exists in the SAM  user  database
       of a Microsoft Windows system (Windows NT, 2000, XP, Vista, 7, 8.1, etc.).  This file is usually located at \WINDOWS\system32\config\SAM on
       the file system of a Microsoft Windows Operating System

       On success, the program does not output any informatin and the exit code is 0.

       The binary program supports multiple names. If it is called named samusrtogrp it will assume -a mode (add user).  If  it  is  called  named
       samusrfromgrp it will assume -r mode (remove user).

OPTIONS
       -h     Show summary of options.

       -a     The user is added to the group.  This option has to be followed by -u and -g .

       -r     The user is removed from the group.  This option has to be followed by -u and -g .

       -u <user>
              User  to  change.  The  user  value  can be provided as a username, or a RID number in hexadecimal (if the username is preceded with
              '0x'). Usernames including international characters will probably not work.

       -g <group>
              Group to change. The group can only be given as a group number, in hexadecimal, preceded with with '0x'.

       -l     Lists the groups in the SAM database.

       -L     Lists the groups in the SAM database as well as their members.

       -s     Print the machine SID.

       -H     Output human readable output. The program by default will print a parsable table unless this option is used.

       -N     Do not allocate more information, only allow the editing of existing values with same size.

       -E     Do not expand the hive file (safe mode).

       -t     Print debug information of allocated blocks.

       -v     Print verbose information and debug messages.

EXAMPLES
       samusrgrp -a -u theboss -g 0x220 SAMFILE
              Adds a user named 'theboss' to the group 0x220 (Administrators)

       samusrgrp -a -u 0x3ea -g 0x221 SAMFILE
              Adds a user with the id '0x3aa' to the group 0x221 (Users)

       samusrgrp -r -u 0x3ff -g 0x221 SAMFILE
              Remove a user with the id '0x3ff' from the group 0x221 (Users)

KNOWN BUGS
       If the username includes international (non-ASCII) characters the program will not (usually) find it. Use the RID number instead.

SEE ALSO
       chntpwd, reged, sampasswd
       You  will  find   more  information  available  on  how  this  program  works,  in  the  text  files  /usr/share/doc/chntpw/README.txt  and
       /usr/share/doc/chntpw/MANUAL.txt

       More documentation is available at the upstream's author site: http://pogostick.net/~pnh/ntpasswd/

AUTHOR
       This program was written by Petter N Hagen.

       This manual page was written by Javier Fernandez-Sanguino <jfs@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  6th August 2014                                                     SAMUSRGRP(8)
