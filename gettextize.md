GETTEXTIZE(1)                        GNU                        GETTEXTIZE(1)

NAME
       gettextize - install or upgrade gettext infrastructure

SYNOPSIS
       gettextize [OPTION]... [package-dir]

DESCRIPTION
       Prepares a source package to use gettext.

OPTIONS
       --help print this help and exit

       --version
              print version information and exit

       -f, --force
              force writing of new files even if old exist

       --intl install libintl in a subdirectory (deprecated)

       --po-dir=DIR
              specify directory with PO files

       --no-changelog
              don't update or create ChangeLog files

       --symlink
              make symbolic links instead of copying files

       -n, --dry-run
              print modifications but don't perform them

AUTHOR
       Written by Ulrich Drepper

REPORTING BUGS
       Report bugs to <bug-gnu-gettext@gnu.org>.

COPYRIGHT
       Copyright  ©  1995-1998,  2000-2013  Free  Software  Foundation,  Inc.
       License     GPLv3+:     GNU     GPL     version     3     or     later
       <http://gnu.org/licenses/gpl.html>
       This  is  free  software:  you are free to change and redistribute it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for gettextize is maintained as a Texinfo  man‐
       ual.   If  the  info and gettextize programs are properly installed at
       your site, the command

              info gettextize

       should give you access to the complete manual.

GNU gettext-tools 0.19.8.1        June 2016                     GETTEXTIZE(1)
