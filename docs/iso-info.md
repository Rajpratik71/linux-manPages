ISO-INFO(1)                                                                                     User Commands                                                                                     ISO-INFO(1)



NAME
       iso-info - shows Information about an ISO 9660 image

SYNOPSIS
       iso-info [OPTION...]

DESCRIPTION
       -d, --debug=UINT
              Set debugging to LEVEL

       -i, --input[=FILE]
              Filename to read ISO-9960 image from

       -f     Generate output similar to 'find . -print'

       -l, --iso9660
              output similar to 'ls -lR' for an ISO 9660 fs

       -U, --udf
              output similar to 'ls -lR' for a UDF fs

       --no-header
              Don't display header and copyright (for regression

       --no-joliet
              Don't use Joliet-extension information

       --no-rock-ridge
              Don't use Rock-Ridge-extension information

       --no-xa
              Don't use XA-extension information

       -r --show-rock-ridge UINT Show if image uses Rock-Ridge extensions
              A maximum of UINT files will be considered.  Use 0 for all files.

       -q, --quiet
              Don't produce warning output

       -V, --version
              display version and copyright information and exit

   Help options:
       -?, --help
              Show this help message

       --usage
              Display brief usage message

AUTHOR
       Rocky Bernstein <rocky@gnu.org>

COPYRIGHT
       Copyright © 2003-2005, 2007-2008, 2011-2013 R. Bernstein
       This  is  free  software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  Have driver: GNU/Linux ioctl and MMC driver
       Have driver: cdrdao (TOC) disk image driver Have driver: bin/cuesheet disk image driver Have driver: Nero NRG disk image driver Default CD-ROM device: /dev/sr0

SEE ALSO
       cd-info(1) for information about an ISO-9660 image.  cd-read(1) to read portions of an ISO 9660 image.



iso-info                                                                                        December 2013                                                                                     ISO-INFO(1)
