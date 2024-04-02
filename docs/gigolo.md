GIGOLO(1)                                                                                                                                GIGOLO(1)

NAME
       Gigolo — a simple frontend to easily connect to remote filesystems with GIO/GVfs

SYNOPSIS
       gigolo [option]

DESCRIPTION
       Gigolo  is  a frontend to easily manage connections to local and remote filesystems using GIO/GVfs. It allows you to quickly mount a remote
       filesystem and manage bookmarks to such.

       Homepage: http://www.uvena.de/gigolo/

OPTIONS
       If called without any arguments, the Gigolo main window is shown.

       -a, --auto-connect
                 Connect all bookmarks which are marked as 'auto connect' and exit.

       -i, --new-instance
                 Don't find and show an already running instance of Gigolo, instead force opening a new instance.

       -l, --list-schemes
                 Print a list of supported URI schemes and exit.

       -v, --verbose
                 Be verbose and print some more information to stdout.

       -V, --version
                 Show version information.

       -?, --help
                 Show help information and exit.

       Gigolo supports all generic GTK options, a list is available on the help screen.

AUTHOR
       This manual page was written by Enrico Troeger. Permission is granted to copy, distribute and/or modify this document under  the  terms  of
       the  GNU  General Public License, Version 2.  A copy of this license can be found in the file COPYING included with the source code of this
       program.

gigolo 0.4.2                                                                                                                             GIGOLO(1)
