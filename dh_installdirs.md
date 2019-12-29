DH_INSTALLDIRS(1)                              Debhelper                             DH_INSTALLDIRS(1)

NAME
       dh_installdirs - create subdirectories in package build directories

SYNOPSIS
       dh_installdirs [debhelper options] [-A] [--sourcedir=dir] [--create-in-sourcedir] [dir ...]

DESCRIPTION
       dh_installdirs is a debhelper program that is responsible for creating subdirectories in
       package build directories.

       Many packages can get away with omitting the call to dh_installdirs completely.  Notably, other
       dh_* commands are expected to create directories as needed.

FILES
       debian/package.dirs
           Lists directories to be created in package.

           Generally, there is no need to list directories created by the upstream build system or
           directories needed by other debhelper commands.

OPTIONS
       -A, --all
           Create any directories specified by command line parameters in ALL packages acted on, not
           just the first.

       --create-in-sourcedir, --no-create-in-sourcedir
           Whether to create the specified directories in the source directory (usually debian/tmp) in
           addition to in the package build directory (usually debian/package).

           The default is --no-create-in-sourcedir.

       --sourcedir=dir
           Consider dir the source directory for the packages acted on instead of the default (which
           is usually debian/tmp).

           Please note that this option is dependent on the --create-in-sourcedir option (when
           --no-create-in-sourcedir is in effect, this option does nothing in dh_installdirs).

       dir ...
           Create these directories in the package build directory of the first package acted on. (Or
           in all packages if -A is specified.)

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                             DH_INSTALLDIRS(1)
