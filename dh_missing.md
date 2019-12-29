DH_MISSING(1)                                  Debhelper                                 DH_MISSING(1)

NAME
       dh_missing - check for missing files

SYNOPSIS
       dh_missing [-Xitem] [--sourcedir=dir] [debhelper options]

DESCRIPTION
       dh_missing compares the list of installed files with the files in the source directory. If any
       of the files (and symlinks) in the source directory were not installed to somewhere, it will
       warn on stderr about that (--list-missing) or fail (--fail-missing).

       Please note that in compat 11 and earlier without either of these options, dh_missing will
       silently do nothing.  From compat 12 on, --list-missing is the default.

       This may be useful if you have a large package and want to make sure that you don't miss
       installing newly added files in new upstream releases.

       Remember to test different kinds of builds (dpkg-buildpackage -A/-B/...) as you may experience
       varying results when only a subset of the packages are built.

FILES
       debian/not-installed
           List the files that are deliberately not installed in any binary package.  Paths listed in
           this file are ignored by dh_missing.  However, it is not a method to exclude files from
           being installed by any of the debhelper tool.  If you want a tool to not install a given
           file, please use its --exclude option (where available).

           dh_missing will expand wildcards in this file (since debhelper 11.1).  Wildcards without
           matches will be ignored.

OPTIONS
       --list-missing
           Warn on stderr about source files not installed to somewhere.

           Note that many dh-tools acting on a path will mark the path as installed even if it has
           been excluded via -X or --exclude.  This is also seen when a dh-tool is acting on a
           directory and exclusion is used to ignore some files in the directory.  In either case,
           this will make dh_missing silently assume the excluded files have been handled.

           This is the default in compat 12 and later.

       --fail-missing
           This option is like --list-missing, except if a file was missed, it will not only list the
           missing files, but also fail with a nonzero exit code.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Michael Stapelberg <stapelberg@debian.org>

12.6.1ubuntu2                                 2019-09-17                                 DH_MISSING(1)
