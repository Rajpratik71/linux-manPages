GDEBI(1)                                                      General Commands Manual                                                     GDEBI(1)

NAME
       gdebi - Simple tool to install deb files

SYNOPSIS
       gdebi [package.deb]...

DESCRIPTION
       gdebi  lets  you  install  local deb packages resolving and installing its dependencies. apt does the same, but only for remote (http, ftp)
       located packages. It can also resolve build-depends of debian/control files.

OPTIONS
       --version
              Show program's version number and exit.

       -h, --help
              Show this help message and exit.

       --n, --non-interactive
              Run non-interactive (dangerous!).

       --o APT_OPTS, --option=APT_OPTS
              Set an APT configuration option.

       --q, --quiet
              Do not show progress information.

       --apt-line
              Simulate only and print a apt-get install compatible line to stderr.

       --root=ROOTDIR
              Use alternative root dir.

EXAMPLES
              gdebi foo_1.0_all.deb
              gdebi foo-1.0/debian/control

SEE ALSO
       Homepage: <https://launchpad.net/gdebi/>

AUTHOR
       This manual page was written by Gustavo Franco <stratus@debian.org> and Kartik Mistry <kartik@debian.org>, for the Debian project (but  may
       be used by others).

                                                                   Oce 13, 2009                                                           GDEBI(1)
