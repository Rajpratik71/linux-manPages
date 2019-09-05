MMSTAT(1)                                                     General Commands Manual                                                    MMSTAT(1)

NAME
       mmstat - Display details about the volume system (partition tables)

SYNOPSIS
       mmstat [-t mmtype ] [-o offset ] [ -i imgtype ] [-b dev_sector_size] [-vV] image [images]

DESCRIPTION
       mmstat displays the general details of a volume system, which includes partition tables and disk labels.  Mainly, the type is given.

ARGUMENTS
       -t mmtype
              Specify the media management type.  Use '-t list' to list the supported types.  If not given, autodetection methods are used.

       -o offset
              Specify  the  offset  into  the image where the volume containing the partition system starts.  The relative offset of the partition
              system will be added to this value.

       -b dev_sector_size
              The size, in bytes, of the underlying device sectors.  If not given, the value in the  image  format  is  used  (if  it  exists)  or
              512-bytes is assumed.

       -i imgtype
              Identify  the  type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection methods are
              used.

       -v     Verbose output of debugging statements to stderr

       -V     Display version

       image [images]
              The disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is  split
              into  multiple  segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by ending in
              '.001'), subsequent image segments will be included automatically.

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                         MMSTAT(1)
