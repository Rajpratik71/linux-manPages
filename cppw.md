CPPW(8)                                                                                 System Manager's Manual                                                                                CPPW(8)

NAME
       cppw, cpgr - copy with locking the given file to the password or group file

SYNOPSIS
       cppw [-h] [-s] password_file
       cpgr [-h] [-s] group_file

DESCRIPTION
       cppw  and  cpgr  will  copy,  with  locking,  the given file to /etc/passwd and /etc/group, respectively.  With the -s flag, they will copy the shadow versions of those files, /etc/shadow and
       /etc/gshadow, respectively.

       With the -h flag, the commands display a short help message and exit silently.

SEE ALSO
       vipw(8), vigr(8), group(5), passwd(5), shadow(5), gshadow(5)

AUTHOR
       cppw and cpgr were written by Stephen Frost, based on vipw and vigr written by Guy Maor.

                                                                                              7 Apr 2005                                                                                       CPPW(8)
