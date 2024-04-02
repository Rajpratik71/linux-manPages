CD-READ(1)                                                                                      User Commands                                                                                      CD-READ(1)



NAME
       cd-read - reads Information from a CD or CD-image

SYNOPSIS
       cd-read [OPTION...]

DESCRIPTION
       -a, --access-mode=STRING
              Set CD control access mode

       -m, --mode=MODE-TYPE
              set CD-ROM read mode (audio, auto, m1f1, m1f2, m2mf1, m2f2)

       -d, --debug=INT
              Set debugging to LEVEL

       -x, --hexdump
              Show output as a hex dump. The default is a hex dump when output goes to stdout and no hex dump when output is to a file.

       -j, --just-hex
              Don't display printable chars on hex dump. The default is print chars too.

       --no-header
              Don't display header and copyright (for regression testing)

       --no-hexdump
              Don't show output as a hex dump.

       -s, --start=INT
              Set LBA to start reading from

       -e, --end=INT
              Set LBA to end reading from

       -n, --number=INT
              Set number of sectors to read

       -b, --bin-file[=FILE]
              set "bin" CD-ROM disk image file as source

       -c, --cue-file[=FILE]
              set "cue" CD-ROM disk image file as source

       -i, --input[=FILE]
              set source and determine if "bin" image or device

       -C, --cdrom-device[=DEVICE]
              set CD-ROM device as source

       -N, --nrg-file[=FILE]
              set Nero CD-ROM disk image file as source

       -t, --toc-file[=FILE]
              set "TOC" CD-ROM disk image file as source

       -o, --output-file=FILE
              Output blocks to file rather than give a hexdump.

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
       cd-info(1) for information about a CD; cd-drive(1) for CD-ROM characteristics; iso-read(1) for information about an ISO-9660 image.



cd-read version 0.92                                                                            December 2013                                                                                      CD-READ(1)
