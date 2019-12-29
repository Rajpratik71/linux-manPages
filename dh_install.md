DH_INSTALL(1)                                  Debhelper                                 DH_INSTALL(1)

NAME
       dh_install - install files into package build directories

SYNOPSIS
       dh_install [-Xitem] [--autodest] [--sourcedir=dir] [debhelper options] [file|dir ... destdir]

DESCRIPTION
       dh_install is a debhelper program that handles installing files into package build directories.
       There are many dh_install* commands that handle installing specific types of files such as
       documentation, examples, man pages, and so on, and they should be used when possible as they
       often have extra intelligence for those particular tasks. dh_install, then, is useful for
       installing everything else, for which no particular intelligence is needed. It is a replacement
       for the old dh_movefiles command.

       This program may be used in one of two ways. If you just have a file or two that the upstream
       Makefile does not install for you, you can run dh_install on them to move them into place. On
       the other hand, maybe you have a large package that builds multiple binary packages. You can
       use the upstream Makefile to install it all into debian/tmp, and then use dh_install to copy
       directories and files from there into the proper package build directories.

       From debhelper compatibility level 7 on, dh_install will fall back to looking in debian/tmp for
       files, if it does not find them in the current directory (or wherever you've told it to look
       using --sourcedir).

FILES
       debian/package.install
           List the files to install into each package and the directory they should be installed to.
           The format is a set of lines, where each line lists a file or files to install, and at the
           end of the line tells the directory it should be installed in. The name of the files (or
           directories) to install should be given relative to the current directory, while the
           installation directory is given relative to the package build directory. You may use
           wildcards in the names of the files to install.

           Note that if you list exactly one filename or wildcard-pattern on a line by itself, with no
           explicit destination, then dh_install will automatically guess the destination to use, the
           same as if the --autodest option were used.

       debian/not-installed
           Used with the deprecated --list-missing and --fail-missing options.  Please refer to
           dh_missing(1) for the documentation of this file.

OPTIONS
       --list-missing
           Deprecated: Please use dh_missing --list-missing instead.  If you use this option,
           dh_install will call dh_missing with that option after it has processed all the files.
           Please see dh_missing(1) for the documentation of this option.

           This option is removed in compat 12.

       --fail-missing
           Deprecated: Please use dh_missing --fail-missing instead.  If you use this option,
           dh_install will call dh_missing with that option after it has processed all the files.
           Please see dh_missing(1) for the documentation of this option.

           This option is removed in compat 12.

       --sourcedir=dir
           Look in the specified directory for files to be installed.

           Note that this is not the same as the --sourcedirectory option used by the dh_auto_*
           commands. You rarely need to use this option, since dh_install automatically looks for
           files in debian/tmp in debhelper compatibility level 7 and above.

       --autodest
           Guess as the destination directory to install things to. If this is specified, you should
           not list destination directories in debian/package.install files or on the command line.
           Instead, dh_install will guess as follows:

           Strip off debian/tmp (or the sourcedir if one is given) from the front of the filename, if
           it is present, and install into the dirname of the filename. So if the filename is
           debian/tmp/usr/bin, then that directory will be copied to debian/package/usr/. If the
           filename is debian/tmp/etc/passwd, it will be copied to debian/package/etc/.

       file|dir ... destdir
           Lists files (or directories) to install and where to install them to.  The files will be
           installed into the first package dh_install acts on.

LIMITATIONS
       dh_install cannot rename files or directories, it can only install them with the names they
       already have into wherever you want in the package build tree.

       However, renaming can be achieved by using dh-exec with compatibility level 9 or later.  An
       example debian/package.install file using dh-exec could look like:

        #!/usr/bin/dh-exec
        debian/default.conf => /etc/my-package/start.conf

       Please remember the following three things:

       •   The package must be using compatibility level 9 or later (see debhelper(7))

       •   The package will need a build-dependency on dh-exec.

       •   The install file must be marked as executable.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                                 DH_INSTALL(1)
