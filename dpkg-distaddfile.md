dpkg-distaddfile(1)                           dpkg suite                           dpkg-distaddfile(1)

NAME
       dpkg-distaddfile - add entries to debian/files

SYNOPSIS
       dpkg-distaddfile [option...] filename section priority

DESCRIPTION
       dpkg-distaddfile adds an entry for a named file to debian/files.

       It takes three non-option arguments, the filename and the section and priority for the .changes
       file.

       The filename should be specified relative to the directory where dpkg-genchanges will expect to
       find the files, usually .., rather than being a pathname relative to the current directory when
       dpkg-distaddfile is run.

OPTIONS
       -ffiles-list-file
              Read or write the list of files to be uploaded here, rather than using debian/files.

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

ENVIRONMENT
       DPKG_COLORS
              Sets the color mode (since dpkg  1.18.5).   The  currently  accepted  values  are:  auto
              (default), always and never.

       DPKG_NLS
              If  set,  it  will  be  used to decide whether to activate Native Language Support, also
              known as internationalization (or i18n)  support  (since  dpkg  1.19.0).   The  accepted
              values are: 0 and 1 (default).

FILES
       debian/files
              The   list   of   generated   files  which  are  part  of  the  upload  being  prepared.
              dpkg-distaddfile can be used to add additional files.

SEE ALSO
       deb-src-files(5).

1.19.7                                        2019-09-05                           dpkg-distaddfile(1)
