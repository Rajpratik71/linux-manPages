DH_MOVEFILES(1)                                                      Debhelper                                                     DH_MOVEFILES(1)

NAME
       dh_movefiles - move files out of debian/tmp into subpackages

SYNOPSIS
       dh_movefiles [debhelper options] [--sourcedir=dir] [-Xitem] [file ...]

DESCRIPTION
       dh_movefiles is a debhelper program that is responsible for moving files out of debian/tmp or some other directory and into other package
       build directories. This may be useful if your package has a Makefile that installs everything into debian/tmp, and you need to break that
       up into subpackages.

       Note: dh_install is a much better program, and you are recommended to use it instead of dh_movefiles.

FILES
       debian/package.files
           Lists the files to be moved into a package, separated by whitespace. The filenames listed should be relative to debian/tmp/. You can
           also list directory names, and the whole directory will be moved.

OPTIONS
       --sourcedir=dir
           Instead of moving files out of debian/tmp (the default), this option makes it move files out of some other directory. Since the entire
           contents of the sourcedir is moved, specifying something like --sourcedir=/ is very unsafe, so to prevent mistakes, the sourcedir must
           be a relative filename; it cannot begin with a `/'.

       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being installed.

       file ...
           Lists files to move. The filenames listed should be relative to debian/tmp/. You can also list directory names, and the whole directory
           will be moved. It is an error to list files here unless you use -p, -i, or -a to tell dh_movefiles which subpackage to put them in.

NOTES
       Note that files are always moved out of debian/tmp by default (even if you have instructed debhelper to use a compatibility level higher
       than one, which does not otherwise use debian/tmp for anything at all). The idea behind this is that the package that is being built can be
       told to install into debian/tmp, and then files can be moved by dh_movefiles from that directory. Any files or directories that remain are
       ignored, and get deleted by dh_clean later.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                     DH_MOVEFILES(1)
