PACOBALL(8)                                                           System                                                           PACOBALL(8)

NAME
       pacoball - Binary package support for paco(8).

SYNOPSIS
       pacoball [-bgftv] [-d DIR] [-1..9] [-a|<packages>]
       pacoball -e [-ltv] [-C DIR] <pacoballs>

DESCRIPTION
       By  default,  pacoball  may  be  given  one  or more package names as arguments, and for each of those packages it creates a binary tarball
       (.tar.bz2 or .tar.gz) containing all the currently installed files. For this to work the input packages have to be registered in  the  paco
       database.
       Leading slashes ('/') are stripped from the paths of the files in the tarballs.

       With  option  -e,  pacoball  admits  one or more previously created tarballs ("pacoballs") as arguments, and installs them into the system,
       optionally logging the installation with paco.

       Mandatory arguments to long options are mandatory for short options too.

GENERAL OPTIONS
       -t, --test
              Test compressed file integrity.

       -h, --help
              Show usage information and exit.

       -v, --verbose
              Verbose output.

       -V, --version
              Display version information and exit.

PACKAGE CREATION OPTIONS
       -a, --all
              Create a pacoball for each package logged in the paco database.

       -d, --directory=DIR
              Create the pacoballs in directory DIR (default is '.').

       -b, --bzip2
              Compress with bzip2 (this is the default).

       -g, --gzip
              Compress with gzip.

       -#     Set the compression level (speed/quality balance). '#' is a number between 1 (faster compression) and 9 (best compression).

       --fast An alias for -1.

       --best An alias for -9.

       -f, --force
              Force overwrite of existing output files.

PACKAGE EXTRACTION OPTIONS
       -e, --extract
              Extract (install) the given <pacoballs>, in directory '/' by default.

       -l, --log
              Log the file extraction with paco(8), retrieving the appropiate package name from the name of the pacoball.

       -C, --root=DIR
              Extract the files into directory DIR (as the -C option in tar).

FILES
       /etc/pacorc - paco configuration file
       /var/log/paco - default paco log directory

WEB SITE
       The latest version of pacoball should be always available at:
            http://paco.sourceforge.net

COPYRIGHT
       Copyright (C) 2004-2009 David Rosal <davidrr@sourceforge.net>
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       paco(8), pacorc(5), superpaco(8), rpm2paco(8)

paco-2.0.9                                                         28 June 2010                                                        PACOBALL(8)
