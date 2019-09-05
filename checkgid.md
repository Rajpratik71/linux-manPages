CHECKGID(8)                                                   System Manager's Manual                                                  CHECKGID(8)

NAME
       checkgid - checks the gid

SYNOPSIS
       checkgid group

DESCRIPTION
       This manual page documents briefly the checkgid command.

       checkgid is a program that checks whether it can setgid to the group specified. This is to see if it is a valid group for apache2 to use at
       runtime.  If the user (should be run as superuser) is in that group, or can setgid to it, it will return 0.

AUTHOR
       This manual page was written by Daniel Stone <daniel@sfarc.net> for the Debian GNU/Linux distribution, as the original did not have a  man‐
       page.

                                                                November 3rd, 2001                                                     CHECKGID(8)
