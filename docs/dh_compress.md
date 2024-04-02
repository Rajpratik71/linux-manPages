DH_COMPRESS(1)                                                       Debhelper                                                      DH_COMPRESS(1)

NAME
       dh_compress - compress files and fix symlinks in package build directories

SYNOPSIS
       dh_compress [debhelper options] [-Xitem] [-A] [file ...]

DESCRIPTION
       dh_compress is a debhelper program that is responsible for compressing the files in package build directories, and makes sure that any
       symlinks that pointed to the files before they were compressed are updated to point to the new files.

       By default, dh_compress compresses files that Debian policy mandates should be compressed, namely all files in usr/share/info,
       usr/share/man, files in usr/share/doc that are larger than 4k in size, (except the copyright file, .html and other web files, image files,
       and files that appear to be already compressed based on their extensions), and all changelog files. Plus PCF fonts underneath
       usr/share/fonts/X11/

FILES
       debian/package.compress
           These files are deprecated.

           If this file exists, the default files are not compressed. Instead, the file is ran as a shell script, and all filenames that the shell
           script outputs will be compressed. The shell script will be run from inside the package build directory. Note though that using -X is a
           much better idea in general; you should only use a debian/package.compress file if you really need to.

OPTIONS
       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being compressed. For example, -X.tiff will exclude TIFF files from
           compression.  You may use this option multiple times to build up a list of things to exclude.

       -A, --all
           Compress all files specified by command line parameters in ALL packages acted on.

       file ...
           Add these files to the list of files to compress.

CONFORMS TO
       Debian policy, version 3.0

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                      DH_COMPRESS(1)
