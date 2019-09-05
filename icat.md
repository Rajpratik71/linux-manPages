ICAT(1)                                                       General Commands Manual                                                      ICAT(1)

NAME
       icat - Output the contents of a file based on its inode number.

SYNOPSIS
       icat [-hrsvV] [-f fstype ] [-i imgtype ] [-o imgoffset ] [-b dev_sector_size] image [images] inode

DESCRIPTION
       icat opens the named image(s) and copies the file with the specified inode number to standard output.

ARGUMENTS
       -f fstype
              Specifies  the  file  system  type.  Use '-f list' to list the supported file system types.  If not given, autodetection methods are
              used.

       -h     Skip over holes in sparse files, so that absolute address information is lost. This option saves space when copying sparse files.

       -r     Use file recovery techniques if the file is deleted.

       -s     Include the slack space in the output.

       -i imgtype
              Identify the type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection  methods  are
              used.

       -o imgoffset
              The sector offset where the file system starts in the image.

       -b dev_sector_size
              The  size,  in  bytes,  of  the  underlying  device  sectors.  If not given, the value in the image format is used (if it exists) or
              512-bytes is assumed.

       -v     Enable verbose mode, output to stderr.

       -V     Display version

       image [images]
              The disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is  split
              into  multiple  segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by ending in
              '.001'), subsequent image segments will be included automatically.

       inode  Inode number. icat concatenates the contents of all specified files.

LICENSE
       This software is distributed under the IBM Public License.

HISTORY
       First appeared in The Coroners Toolkit (TCT) 1.0 and is now in The Sleuth Kit.

AUTHOR(S)
       Wietse Venema IBM T.J. Watson Research P.O. Box 704 Yorktown Heights, NY 10598, USA

       This version is maintained by Brian Carrier (carrier at sleuthkit at org).

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                           ICAT(1)
