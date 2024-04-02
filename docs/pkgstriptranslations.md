pkgstriptranslations(1)                                       General Commands Manual                                      pkgstriptranslations(1)

NAME
       pkgstriptranslations - extract translation files and remove gettext *.mo files from package build directories

SYNOPSIS
       pkgstriptranslations

DESCRIPTION
       pkgstriptranslations   extracts   all   gettext  related  files  from  the  source  and  package  build  directories  and  puts  them  into
       <pkg-build-dir>/../package_version_arch_suffix.tar.gz.  suffix is configurable in /etc/pkgbinarymangler/striptranslations.conf and defaults
       to translations.

       Tarball layout:

       source/
              contains all pot and po files from source package, preserving the directory structure.

       debname1/, debname2/, ...
              There will be one directory per generated binary deb package, each contains all .mo files from this deb, preserving directory struc‐
              ture.

       This script also removes all gettext *.mo files below <pkg-build-dir>/usr/share/locale from all built binary packages.  It will also remove
       subdirectories  which  became  empty after removal of the gettext files. However, if a file /CurrentlyBuilding is present (as on the Ubuntu
       autobuilders), then the *.mo files are only deleted if the Component: value in this file  matches  one  of  the  components  configured  in
       /etc/pkgbinarymangler/striptranslations.conf.  This allows to selectively strip files only for source packages which are in e. g.  main and
       restricted, but not in e. g.  universe.

       By default, pkgstriptranslations is inactive. To enable it, the enable option in the configuration file must be set to true.

ENVIRONMENT VARIABLES
       NO_PKG_MANGLE
              If this variable is set to a nonempty value, then pkgstriptranslations is disabled. This is most useful  if  source  packages  build
              nested binary packages as part of their build.

AUTHOR
       pkgstriptranslations is developed by Martin Pitt <martin.pitt@canonical.com>.

Martin Pitt                                                      December 17, 2004                                         pkgstriptranslations(1)
