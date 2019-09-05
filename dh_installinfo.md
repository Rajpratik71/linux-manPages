DH_INSTALLINFO(1)                                                    Debhelper                                                   DH_INSTALLINFO(1)

NAME
       dh_installinfo - install info files

SYNOPSIS
       dh_installinfo [debhelper options] [-A] [file ...]

DESCRIPTION
       dh_installinfo is a debhelper program that is responsible for installing info files into usr/share/info in the package build directory.

       From debhelper compatibility level 11 on, dh_install will fall back to looking in debian/tmp for files, if it does not find them in the
       current directory (or wherever you've told it to look using --sourcedir).

FILES
       debian/package.info
           List info files to be installed.

OPTIONS
       -A, --all
           Install all files specified by command line parameters in ALL packages acted on.

       --sourcedir=dir
           Look in the specified directory for files to be installed.  This option requires compat 11 or later (it is silently ignored in compat
           10 or earlier).

           Note that this is not the same as the --sourcedirectory option used by the dh_auto_* commands. You rarely need to use this option,
           since dh_installinfo automatically looks for files in debian/tmp in debhelper compatibility level 11 and above.

       file ...
           Install these info files into the first package acted on. (Or in all packages if -A is specified).

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                   DH_INSTALLINFO(1)
