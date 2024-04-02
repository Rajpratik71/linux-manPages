FFIND(1)                                                      General Commands Manual                                                     FFIND(1)

NAME
       ffind - Finds the name of the file or directory using a given inode

SYNOPSIS
       ffind [-aduvV] [-f fstype] [-i imgtype] [-o imgoffset] [-b dev_sector_size] image [images] inode

DESCRIPTION
       ffind  finds  the  names  of files or directories that are allocated to inode on disk image image.  By default it only will only return the
       first name it finds.  With some file systems, this will find deleted file names.

ARGUMENTS
       -a     Find all occurrences of inode.

       -d     Find deleted entries only.

       -f fstype
              Identify the file system type of the image.  Use '-f list' to list the supported file system types.   If  not  given,  autodetection
              methods are used.

       -u     Find undeleted entries only.

       -i imgtype
              Identify  the  type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection methods are
              used.

       -o imgoffset
              The sector offset where the file system starts in the image.

       -b dev_sector_size
              The size, in bytes, of the underlying device sectors.  If not given, the value in the  image  format  is  used  (if  it  exists)  or
              512-bytes is assumed.

       -v     Verbose output to stderr.

       -V     Display version.

       image [images]
              The  disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is split
              into multiple segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by  ending  in
              '.001'), subsequent image segments will be included automatically.

       inode  Integer of inode to find.

       This program searches all directory entries looking for the given inode.  This is useful when an inode has been identified from a disk unit
       address using ifind(1).

EXAMPLE
       # ffind -a image 212

SEE ALSO
       ifind(1)

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                          FFIND(1)
