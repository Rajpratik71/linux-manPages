CD-INFO(1)                                                                                      User Commands                                                                                      CD-INFO(1)



NAME
       cd-info - shows Information about a CD or CD-image

SYNOPSIS
       cd-info [OPTION...]

DESCRIPTION
       -a, --access-mode=STRING
              Set CD access method

       -d, --debug=INT
              Set debugging to LEVEL

       -T, --no-tracks
              Don't show track information

       -A, --no-analyze
              Don't show filesystem analysis

       --no-cddb
              Don't look up audio CDDB information or print it

       -P, --cddb-port=INT
              CDDB port number to use (default 8880)

       -H, --cddb-http
              Lookup CDDB via HTTP proxy (default no proxy)

       --cddb-server=STRING
              CDDB server to contact for information (default: freedb.freedb.org)

       --cddb-cache=STRING
              Location of CDDB cache directory (default ~/.cddbclient)

       --cddb-email=STRING
              Email address to give CDDB server (default me@home)

       --no-cddb-cache
              Disable caching of CDDB entries locally (default caches)

       --cddb-timeout=INT
              CDDB timeout value in seconds (default 10 seconds)

       --no-device-info
              Don't show device info, just CD info

       --no-disc-mode
              Don't show disc-mode info

       --dvd  Attempt to give DVD information if a DVD is found.

       -v, --no-vcd
              Don't look up Video CD information - for this build, this is always set

       -I, --no-ioctl
              Don't show ioctl() information

       -b, --bin-file[=FILE]
              set "bin" CD-ROM disk image file as source

       -c, --cue-file[=FILE]
              set "cue" CD-ROM disk image file as source

       -N, --nrg-file[=FILE]
              set Nero CD-ROM disk image file as source

       -t, --toc-file[=FILE]
              set cdrdao CD-ROM disk image file as source

       -i, --input[=FILE]
              set source and determine if "bin" image or device

       --iso9660
              print directory contents of any ISO-9660 filesystems

       -C, --cdrom-device[=DEVICE]
              set CD-ROM device as source

       -l, --list-drives
              Give a list of CD-drives

       --no-header
              Don't display header and copyright (for regression testing)

       --no-joliet
              Don't use Joliet extensions

       --no-rock-ridge
              Don't use Rock-Ridge-extension information

       --no-xa
              Don't use XA-extension information

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
       Rocky Bernstein rocky@gnu.org, based on the cdinfo program by Gerd Knorr <kraxel@bytesex.org> and Heiko Eissfeldt <heiko@hexco.de>

COPYRIGHT
       Copyright © 2003-2005, 2007-2008, 2011-2013 R. Bernstein
       This  is  free  software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  Have driver: GNU/Linux ioctl and MMC driver
       Have driver: cdrdao (TOC) disk image driver Have driver: bin/cuesheet disk image driver Have driver: Nero NRG disk image driver Default CD-ROM device: /dev/sr0

SEE ALSO
       cd-drive(1) for CD-ROM characteristics; iso-info(1) for information about an ISO-9660 image.



cd-info                                                                                         December 2013                                                                                      CD-INFO(1)
