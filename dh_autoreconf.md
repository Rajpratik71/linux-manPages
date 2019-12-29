DH_AUTORECONF(1)                             dh-autoreconf                            DH_AUTORECONF(1)

NAME
       dh_autoreconf - Call autoreconf -f -i and keep track of the changed files.

SYNOPSIS
       dh_autoreconf [debhelper options] [-Xitem] [--mode=mode] [program -- params]

DESCRIPTION
       dh_autoreconf is responsible for calling autoreconf and creating the files
       debian/autoreconf.before and debian/autoreconf.after which contain checksums of all files
       before/after the build. It is complemented by dh_autoreconf_clean which creates a list of all
       changed and added files and removes them.

       Please note that dh_autoreconf can only be run once. Thus, if you need to run multiple
       commands, use a script or similar. An example is given in dh-autoreconf(7).

FILES
       debian/autoreconf
           This file can contain a list of directories. If present, dh_autoreconf will only scan the
           given directories for changes. If no special command is given to dh_autoreconf, it will
           also forward the directory list to autoreconf which causes it to be run only on those sub
           directories.

OPTIONS
       -Xitem --exclude=item
           Exclude files that contain "item" anywhere in their filename from being checked for
           changes. This means that those files won't be deleted by "dh_autoreconf_clean" even if
           there are changes. You may use this option multiple times to build up a list of things to
           exclude.

           Starting with version 3, the directories of common version control systems such as cvs,
           git, hg, svn, and bzr are excluded automatically.

       --mode=mode
           Change the way in which modifications to files are detected. The default mode is md5 for
           using MD5 checksums, but there is also timesize for using the time of the last modification
           and the file size.

       --as-needed
           Enable support for -Wl,--as-needed in all ltmain.sh files identical to the one of the
           libtool package. This only works in the MD5 mode (the default one). The changes are
           reverted in dh_autoreconf_clean. You should not prevent LIBTOOLIZE from running with this,
           as it only works correctly with libtoolize running.

       -Ddir --sourcedirectory=dir
           Run everything in the source directory. Supported only in debhelper compat level 10 for
           backwards compatibility.

       program -- params
           Run the program given by program with the arguments given by params instead of autoreconf
           -f -i. If you need to run multiple commands, put them in a script and pass the script
           instead (or add a target to debian/rules).

ENVIRONMENT
       For each tool executed by autoreconf(1), one can export a variable with the uppercase name of
       the tool to the specific program which shall be run, including true to prevent the tool in
       question from being run. The following example shows the beginning of a debian/rules for a
       package where automake 1.11 shall be run instead of the default automake version and libtoolize
       shall not be run:

           #!/usr/bin/make -f
           export AUTOMAKE = automake-1.11
           export LIBTOOLIZE = true

SEE ALSO
       debhelper(7), dh_autoreconf_clean(1), dh-autoreconf(7)

AUTHOR
       Julian Andres Klode <jak@debian.org>

dh-autoreconf v19                             2018-05-19                              DH_AUTORECONF(1)
