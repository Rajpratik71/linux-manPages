FASTJAR(1)                                                              GNU                                                             FASTJAR(1)

NAME
       fastjar - archive tool for Java archives

SYNOPSIS
       fastjar -ctxu [OPTIONS] [jar-file] [manifest-file] [-C dir] files...

DESCRIPTION
       "fastjar" is an implementation of Sun's jar utility that comes with the JDK, written entirely in C, and runs in a fraction of the time
       while being feature compatible.

       If any file is a directory then it is processed recursively.  The manifest file name and the archive file name needs to be specified in the
       same order the -m and -f flags are specified.

OPTIONS
       Exactly one of the following actions must be specified:

       -c  Create new archive.

       -t  List table of contents for archive.

       -x  Extract named (or all) files from archive.

       -u  Update existing archive.

       The following parameters are optional:

       -@  Read the names of the files to add to the archive from stdin.  This option is supported only in combination with -c or -u.  Non
           standard option added in the GCC version.

       -C directory
           Change to the directory and include the following file.

       -E  Prevent fastjar from reading the content of a directory when specifying one (and instead relying on the provided list of files to
           populate the archive with regard to the directory entry). Non standard option added in the GCC version.

       -M  Do not create a manifest file for the entries.

       -i  Generate an index of the packages in this jar and its Class-Path.

       -J  All options starting with -J are ignored.

       -0  Store only; use no ZIP compression.

       -V
       --version
           Display version information.

       -f archive
           Specify archive file name.

       -m manifest
           Include manifest information from specified manifest file.

       -v  Generate verbose output on standard output.

       Parameters of the form @option{@}FILE are considered to be names of files, and are expanded with the contents of the file.

       All remaining options are considered to be names of files.

SEE ALSO
       gcj(1), gij(1), grepjar(1) and the Info entry for gcj.

COPYRIGHT
       Copyright (C) 2002, 2007, 2008 Matthias Klose

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License as published by the
       Free Software Foundation; either version 2, or (at your option) any later version. A copy of the license is included in the man page
       gfdl(7).

0.97                                                                2008-10-16                                                          FASTJAR(1)
