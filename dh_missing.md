DH_MISSING(1)                                                        Debhelper                                                       DH_MISSING(1)

NAME
       dh_missing - check for missing files

SYNOPSIS
       dh_missing [-Xitem] [--sourcedir=dir] [debhelper options]

DESCRIPTION
       dh_missing compares the list of installed files with the files in the source directory. If any of the files (and symlinks) in the source
       directory were not installed to somewhere, it will warn on stderr about that (--list-missing) or fail (--fail-missing).

       Please note that in compat 11 and earlier without either of these options, dh_missing will silently do nothing.  From compat 12 on,
       --list-missing is the default.

       This may be useful if you have a large package and want to make sure that you don't miss installing newly added files in new upstream
       releases.

       Remember to test different kinds of builds (dpkg-buildpackage -A/-B/...) as you may experience varying results when only a subset of the
       packages are built.

FILES
       debian/not-installed
           List the files that are deliberately not installed in any binary package.  Paths listed in this file are ignored by dh_missing.
           However, it is not a method to exclude files from being installed by any of the debhelper tool.  If you want a tool to not install a
           given file, please use its --exclude option (where available).

           dh_missing will expand wildcards in this file (since debhelper 11.1).  Wildcards without matches will be ignored.

OPTIONS
       --list-missing
           Warn on stderr about source files not installed to somewhere.

           Note that files that are excluded from being moved via the -X option are not warned about.

           This is the default in compat 12 and later.

       --fail-missing
           This option is like --list-missing, except if a file was missed, it will not only list the missing files, but also fail with a nonzero
           exit code.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Michael Stapelberg <stapelberg@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                       DH_MISSING(1)
