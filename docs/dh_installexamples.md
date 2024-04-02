DH_INSTALLEXAMPLES(1)                                                Debhelper                                               DH_INSTALLEXAMPLES(1)

NAME
       dh_installexamples - install example files into package build directories

SYNOPSIS
       dh_installexamples [debhelper options] [-A] [-Xitem] [file ...]

DESCRIPTION
       dh_installexamples is a debhelper program that is responsible for installing examples into usr/share/doc/package/examples in package build
       directories.

       From debhelper compatibility level 11 on, dh_install will fall back to looking in debian/tmp for files, if it does not find them in the
       current directory (or wherever you've told it to look using --sourcedir).

FILES
       debian/package.examples
           Lists example files or directories to be installed.

OPTIONS
       -A, --all
           Install any files specified by command line parameters in ALL packages acted on.

       --sourcedir=dir
           Look in the specified directory for files to be installed.  This option requires compat 11 or later (it is silently ignored in compat
           10 or earlier).

           Note that this is not the same as the --sourcedirectory option used by the dh_auto_* commands. You rarely need to use this option,
           since dh_installexamples automatically looks for files in debian/tmp in debhelper compatibility level 11 and above.

       --doc-main-package=main-package
           Set the main package for a documentation package.  This is used to install the documentation of the documentation package in
           /usr/share/doc/main-package as recommended by the Debian policy manual 3.9.7 in §12.3.

           In compat 11 (or later), this option is only useful if debhelper's auto-detection of the main package is wrong.  The option can also be
           used to silence a warning from debhelper when the auto-detection fails but the default happens to be correct.

           This option cannot be used when dh_installexamples is instructed to act on multiple packages.  If you need this option, you will
           generally need to combine it with -p to ensure exactly one package is acted on.

       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being installed.

       file ...
           Install these files (or directories) as examples into the first package acted on. (Or into all packages if -A is specified.)

NOTES
       Note that dh_installexamples will happily copy entire directory hierarchies if you ask it to (similar to cp -a). If it is asked to install
       a directory, it will install the complete contents of the directory.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                               DH_INSTALLEXAMPLES(1)
