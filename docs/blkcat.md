BLKCAT(1)                                                     General Commands Manual                                                    BLKCAT(1)

NAME
       blkcat - Display the contents of file system data unit in a disk image.

SYNOPSIS
       blkcat [-ahswvV] [-f fstype] [-u unit_size] [-i imgtype] [-o imgoffset] [-b dev_sector_size] image [images] unit_addr [num]

DESCRIPTION
       blkcat  displays  num data units (default is one) starting at the unit address unit_addr from image to stdout in different formats (default
       is raw).  blkcat was called dcat in TSK versions prior to 3.0.0.

ARGUMENTS
       -a     Display the contents in ASCII

       -f fstype
              Specify image as a specific file type.  If 'swap' is given here, the image will be displayed in pages of size 4096 bytes.  If  'raw'
              is  given,  then  512-bytes is used as the default size.  The '-u' flag can change the default size.  Use '-f list' to list the sup‐
              ported file system types.  If not given, autodetection methods are used.

       -h     Display the contents in hexdump

       -s     Display statistics on the image (unit size, file block size,  and number of fragments).

       -u unit_size
              Specify the size of the default data unit for raw, blkls, and swap images.

       -i imgtype
              Identify the type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection  methods  are
              used.

       -o imgoffset
              The sector offset where the file system starts in the image.

       -b dev_sector_size
              The  size,  in  bytes,  of  the  underlying  device  sectors.  If not given, the value in the image format is used (if it exists) or
              512-bytes is assumed.

       -v     Verbose output to stderr.

       -V     Display version.

       -w     Display the contents in an HTML table format.

       image [images]
              The disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is  split
              into  multiple  segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by ending in
              '.001'), subsequent image segments will be included automatically.

       unit_addr
              Address of the disk unit to display.  The size of a unit on this file system can be determined using the -s option.

       num    Number of data units to display.

       The basic functionality of blkcat can also be achieved using dd.  To determine which inode has allocated a given unit, the ifind(1) command
       can be used.

EXAMPLES
       # blkcat -hw image 264 4

       or

       # blkcat -hw image 264

SEE ALSO
       ifind(1)

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                         BLKCAT(1)
