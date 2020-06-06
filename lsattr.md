LSATTR(1)                                                                                General Commands Manual                                                                                LSATTR(1)

NAME
       lsattr - list file attributes on a Linux second extended file system

SYNOPSIS
       lsattr [ -RVadv ] [ files...  ]

DESCRIPTION
       lsattr lists the file attributes on a second extended file system.  See chattr(1) for a description of the attributes and what they mean.

OPTIONS
       -R     Recursively list attributes of directories and their contents.

       -V     Display the program version.

       -a     List all files in directories, including files that start with `.'.

       -d     List directories like other files, rather than listing their contents.

       -v     List the file's version/generation number.

AUTHOR
       lsattr was written by Remy Card <Remy.Card@linux.org>.  It is currently being maintained by Theodore Ts'o <tytso@alum.mit.edu>.

BUGS
       There are none :-).

AVAILABILITY
       lsattr is part of the e2fsprogs package and is available from http://e2fsprogs.sourceforge.net.

SEE ALSO
       chattr(1)

E2fsprogs version 1.42.13                                                                        May 2015                                                                                       LSATTR(1)
