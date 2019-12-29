ISOHYBRID.PL(1)                            Syslinux Project                            ISOHYBRID.PL(1)

NAME
       isohybrid.pl - Postprocess ISO images for hybrid mode (Perl)

SYNOPSIS
       isohybrid.pl [OPTIONS] IMAGE

DESCRIPTION
       Starting in version 3.72, ISOLINUX supports a "hybrid mode" which can be booted from either CD-
       ROM or from a device which BIOS considers a hard disk or ZIP disk, e.g. a USB key or similar.

       To enable this mode, the .iso image needs to be postprecessed with this utility.

       Note: isohybrid.pl is a Perl script, a C implementation of the same  utility  is  available  as
       isohybrid(1).

OPTIONS
       -h  Number of default geometry heads.

       -s  Number of default geometry sectors.

       -entry
           Specify partition entry number (1-4).

       -offset
           Specify partition offset (default 0).

       -type
           Specify partition type (default 0x17).

       -id Specify MBR ID (default random).

       -forcehd0
           Always assume we are loaded as disk ID 0.

       -ctrlhd0
           Assume disk ID 0 if the Ctrl key is pressed.

       -partok
           Allow booting from within a partition.

SEE ALSO
       syslinux(1)

HOMEPAGE
       More  information  about  the Syslinux project can be found on the homepage at <http://www.sys‐
       linux.org/>.

AUTHOR
       isohybrid.pl was written by H. Peter Anvin <hpa@zytor.com>.

       This manual page was written by Daniel Baumann <mail@daniel-baumann.ch>.

5.00                                          2014-06-14                               ISOHYBRID.PL(1)
