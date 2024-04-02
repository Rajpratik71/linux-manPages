MMLS(1)                                                       General Commands Manual                                                      MMLS(1)

NAME
       mmls - Display the partition layout of a volume system  (partition tables)

SYNOPSIS
       mmls [-t mmtype ] [-o offset ] [ -i imgtype ] [-b dev_sector_size] [-BrvV] [-aAmM] image [images]

DESCRIPTION
       mmls displays the layout of the partitions in a volume system, which include partition tables and disk labels.

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

       -B     Include a column with the partition sizes in bytes

       -r     Recurse into DOS partitions and look for other partition tables.  This setup frequently occurs when Unix is installed  on  x86  sys‐
              tems.

       -v     Verbose output of debugging statements to stderr

       -V     Display version

       -a     Show allocated volumes

       -A     Show unallocated volumes

       -m     Show metadata volumes

       -M     Hide metadata volumes

       image [images]
              The  disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is split
              into multiple segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by  ending  in
              '.001'), subsequent image segments will be included automatically.

       ´mmls´  is similar to 'fdisk -lu' in Linux with a few differences.  Namely, it will show which sectors are not being used so that those can
       be searched for hidden data.  It also gives the length value so that it can be plugged into 'dd' more easily for extracting the partitions.
       It also will show BSD disk labels for Free, Open, and NetBSD and will display the output in sectors and not cylinders.  Lastly, it works on
       non-Linux systems.

       If none of -a, -A, -m, or -M are given then all volume types will be listed.  If any of them are given, then only the  types  specified  on
       the command line will be listed.

       Allocated  volumes  are those that are listed in a partition table in the volume system AND can store data.  Unallocated volumes are virtu‐
       ally created by mmls to show you which sectors have not been allocated to a volume.  The metadata volumes overlap the allocated and unallo‐
       cated  volumes and describe where the partition tables and other metadata structures are located.  In some volume systems, these structures
       are in allocated space and in others they are in unallocated space.  In some volume systems, their location is explicitly given in the par‐
       tition tables and in others they are not.

EXAMPLES
       To list the partition table of a Windows system using autodetect:

       # mmls disk_image.dd

       To list the contents of a BSD system that starts in sector 12345 of a split image:

       # mmls -t bsd -o 12345 -i split disk-1.dd disk-2.dd

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

                                                                                                                                           MMLS(1)
