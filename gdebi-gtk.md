GDEBI-GTK(1)                                                  General Commands Manual                                                 GDEBI-GTK(1)

NAME
       gdebi-gtk - Simple tool to install deb files

SYNOPSIS
       gdebi-gtk [package.deb]...

DESCRIPTION
       gdebi  lets  you  install  local deb packages resolving and installing its dependencies. apt does the same, but only for remote (http, ftp)
       located packages.

OPTIONS
       -h, --help
              Show this help message and exit.

       --n, --non-interactive
              Run non-interactive (dangerous!).

       --auto-close
              Auto close when the install is finished.

       --datadir=DATADIR
              Use alternative datadir.

       -r, --remove
              Remove selected package.

       SEE ALSO
              Homepage: <https://launchpad.net/gdebi/>

AUTHOR
       This manual page was written by Gustavo Franco <stratus@debian.org> and Kartik Mistry <kartik@debian.org>, for the Debian project (but  may
       be used by others).

                                                                   Oct 13, 2009                                                       GDEBI-GTK(1)
