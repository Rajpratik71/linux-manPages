BLKSTAT(1)                                                    General Commands Manual                                                   BLKSTAT(1)

NAME
       blkstat - Display details of a file system data unit (i.e. block or sector)

SYNOPSIS
       blkstat [-f fstype ] [-i imgtype] [-o imgoffset] [-b dev_sector_size] [-vV] image [images] addr

DESCRIPTION
       blkstat displays the allocation status of the given data unit.  blkstat was called dstat in TSK versions prior to 3.0.0.

ARGUMENTS
       -f fstype
              Specify the file system type.  Use '-f list' to list the supported file system types.  If not given, autodetection methods are used.

       -i imgtype
              Identify  the  type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection methods are
              used.

       -o imgoffset
              The sector offset where the file system starts in the image.

       -b dev_sector_size
              The size, in bytes, of the underlying device sectors.  If not given, the value in the  image  format  is  used  (if  it  exists)  or
              512-bytes is assumed.

       -v     Verbose output of debugging statements to stderr

       -V     Display version

       image [images]
              The  disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is split
              into multiple segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by  ending  in
              '.001'), subsequent image segments will be included automatically.

       addr   Address to display stats on.  This is a fragment for UNIX file systems or a sector for FAT.

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                        BLKSTAT(1)
