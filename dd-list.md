DD-LIST(1)                                                                               General Commands Manual                                                                               DD-LIST(1)

NAME
       dd-list - nicely list .deb packages and their maintainers

SYNOPSIS
       dd-list [-hiusV] [--help] [--stdin] [--sources Sources_file] [--dctrl] [--version] [--uploaders] [package ...]

DESCRIPTION
       dd-list produces nicely formatted lists of Debian (.deb) packages and their maintainers.

       Input is a list of source or binary package names on the command line (or the standard input if --stdin is given).  Output is a list of the following format, where package names are source pack‐
       ages by default:

              J. Random Developer <jrandom@debian.org>
                     j-random-package
                     j-random-other

              Diana Hacker <diana@example.org>
                     fun-package
                     more-fun-package

       This is useful when you want, for example, to produce a list of packages that need to attention from their maintainers, e.g., to be rebuilt when a library version transition happens.

OPTIONS
       -h, --help
              Print brief help message.

       -i, --stdin
              Read package names from the standard input, instead of taking them from the command line. Package names are whitespace delimited.

       -d, --dctrl
              Read package list from standard input in the format of a Debian package control file. This includes the status file, or output of apt-cache. This is the fastest way to use dd-list, as  it
              uses the maintainer information from the input instead of looking up the maintainer of each listed package.

              If no Source: line is given, the Package: name is used for output, which might be a binary package name.

       -z, --uncompress
              Try to uncompress the --dctrl input before parsing.  Supported compression formats are gz and bzip2.

       -s, --sources Sources_file
              Read  package information from the specified Sources_files.  This can be given multiple times.  The files can be gz or bzip2 compressed.  If the filename does not end in .gz or .bz2, then
              the -z option must be used.

              If no Sources_files are specified, any files matching /var/lib/apt/lists/*_source_Sources will be used.

       -u, --uploaders
              Also list developers who are named as uploaders of packages, not only the maintainers; this is the default behaviour, use --nouploaders to prevent it. Uploaders are indicated  with  "(U)"
              appended to the package name.

       -nou, --nouploaders
              Only list package Maintainers, do not list Uploaders.

       -b, --print-binary
              Use binary package names in the output instead of source package names (has no effect with --dctrl if the Package: line contains source package names).

       -V, --version
              Print the version.

AUTHOR
       Lars Wirzenius <liw@iki.fi>

       Joey Hess <joeyh@debian.org>

Debian                                                                                          2011-10-27                                                                                     DD-LIST(1)
