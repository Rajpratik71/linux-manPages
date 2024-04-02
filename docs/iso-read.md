ISO-READ(1)                                                                                     User Commands                                                                                     ISO-READ(1)



NAME
       iso-read - reads portions of an ISO 9660 image

SYNOPSIS
       iso-read [OPTION...]

DESCRIPTION
       -d, --debug=INT
              Set debugging to LEVEL.

       -i, --image=FILE
              Read from ISO-9660 image. This option is mandatory

       -e, --extract=FILE
              Extract FILE from ISO-9660 image. This option is mandatory.

       -k, --ignore
              Ignore read error(s), i.e. keep going

       --no-header
              Don't display header and copyright (for regression testing)

       -o, --output-file=FILE
              Output file. This option is mandatory.

       -U  --udf
              Contents are in UDF format

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
       iso-info(1) for information about an ISO-9660 image.  cd-read(1) to read portions of an ISO 9660 image.



iso-read                                                                                        December 2013                                                                                     ISO-READ(1)
