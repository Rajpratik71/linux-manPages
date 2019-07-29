FSSTAT(1)                                                     General Commands Manual                                                    FSSTAT(1)

NAME
       fsstat - Display general details of a file system

SYNOPSIS
       fsstat [-f fstype ] [-i imgtype] [-o imgoffset] [-b dev_sector_size] [-tvV] image [images]

DESCRIPTION
       fsstat displays the details associated with a file system.  The output of this command is file system specific.  At a minimum, the range of
       meta-data values (inode numbers) and content units (blocks or clusters) are given.  Also given are details from the Super  Block,  such  as
       mount times and and features.   For file systems that use groups (FFS and EXT2FS), the layout of each group is listed.

       For a FAT file system, the FAT table is displayed in a condensed format.  Note that the data is in sectors and not in clusters.

ARGUMENTS
       -t type
              Print the file system type only.

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

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                         FSSTAT(1)
