GENNORM2(8)                                ICU 60.2 Manual                                GENNORM2(8)

NAME
       gennorm2 - Builds binary data file with Unicode normalization data.

SYNOPSIS
       gennorm2  [  -h,  -?,  --help  ] [ -V, --version ] [ -c, --copyright ] [ -v, --verbose ] [ -u,
       --unicode unicode-version-number ] [ -s, --sourcedir source-directory ] [  -o,  --output  out‐
       put-filename ] --fast

DESCRIPTION
       gennorm2  reads  text  files that define Unicode normalization, them, and builds a binary data
       file.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -V, --version
              Print the version of gennorm2 and exit.

       -c, --copyright
              Include a copyright notice.

       -v, --verbose
              Display extra informative messages during execution.

       -u, --unicode
              Specify Unicode version number, such as 5.2.0.

       -s, --sourcedir source-directory
              Specify the input directory.

       -s, --sourcedir source-directory
              Set the name of the output file.

       --fast optimize the .nrm file for fast normalization, which might increase its  size   (Writes
              fully  decomposed  regular  mappings instead of delta mappings.  You should measure the
              runtime speed to make sure that this is a good trade-off.)

COPYRIGHT
       Copyright (C) 2009-2010 International Business Machines Corporation and others

ICU MANPAGE                                 15 March 2010                                 GENNORM2(8)
