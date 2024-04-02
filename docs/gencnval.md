GENCNVAL(1)                                ICU 60.2 Manual                                GENCNVAL(1)

NAME
       gencnval - compile the converters aliases file

SYNOPSIS
       gencnval [ -h, -?, --help ] [ -v, --verbose ] [ -c, --copyright ] [ -s, --sourcedir source ] [
       -d, --destdir destination ] [ converterfile ]

DESCRIPTION
       gencnval converts the ICU aliases file converterfile into the binary file cnvalias.icu.   This
       binary  file  can then be read directly by ICU, or used by pkgdata(1) for incorporation into a
       larger archive or library.

       If converterfile is not provided, the default ICU convrtrs.txt file is used.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -v, --verbose
              Display verbose output. This information  can  include  information  about  conflicting
              aliases and the converters the aliases resolve to.

       -c, --copyright
              Include a copyright notice in the binary data.

       -s, --sourcedir source
              Set  the  source directory to source.  The default source directory is specified by the
              environment variable ICU_DATA.

       -d, --destdir destination
              Set the destination directory to destination.  The  default  destination  directory  is
              specified by the environment variable ICU_DATA.

ENVIRONMENT
       ICU_DATA  Specifies  the directory containing ICU data. Defaults to ${prefix}/share/icu/60.2/.
                 Some tools in ICU depend on the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.

FILES
       icu/source/data/mappings/convrtrs.txt   Description  of  ICU's  converters  and their aliases.
                                               This data file is not normally installed,  and  it  is
                                               available as a part of ICU source code.

VERSION
       60.2

COPYRIGHT
       Copyright (C) 2000-2004 IBM, Inc. and others.

SEE ALSO
       pkgdata(1)

ICU MANPAGE                                 11 March 2004                                 GENCNVAL(1)
