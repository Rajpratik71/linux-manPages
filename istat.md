ISTAT(1)                                                      General Commands Manual                                                     ISTAT(1)

NAME
       istat - Display details of a meta-data structure (i.e. inode)

SYNOPSIS
       istat [-B num ] [-f fstype ] [-i imgtype] [-o imgoffset] [-b dev_sector_size] [-vV] [-z zone ] [-s seconds ] image [images] inode

DESCRIPTION
       istat displays the uid, gid, mode, size, link number, modified, accessed, changed times, and all the disk units a structure has allocated.

       The options are as follows:

       -B num Display the addresses of num disk units.  Useful when the inode is unallocated with size 0, but still has block pointers.

       -f fstype
              Specify the file system type.  Use '-f list' to list the supported file system types.  If not given, autodetection methods are used.

       -s seconds
              The  time  skew  of  the  original system in seconds.  For example, if the original system was 100 seconds slow, this value would be
              -100.

       -i imgtype
              Identify the type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection  methods  are
              used.

       -o imgoffset
              The sector offset where the file system starts in the image.

       -b dev_sector_size
              The  size,  in  bytes,  of  the  underlying  device  sectors.  If not given, the value in the image format is used (if it exists) or
              512-bytes is assumed.

       -v     Verbose output of debugging statements to stderr

       -V     Display version

       -z zone
              An ASCII string of the original system's time zone.  For example, EST5EDT or GMT.  These strings are defined by the operating system
              and may vary.  NOTE: This has changed since TCTUTILs.

       image [images]
              The  disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is split
              into multiple segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by  ending  in
              '.001'), subsequent image segments will be included automatically.

       inode  Meta-data number to display stats on

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                          ISTAT(1)
