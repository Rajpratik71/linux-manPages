JCAT(1)                                                       General Commands Manual                                                      JCAT(1)

NAME
       jcat - Show the contents of a block in the file system journal.

SYNOPSIS
       jcat [-f fstype ] [-vV] [-i imgtype] [-o imgoffset] [-b dev_sector_size] image [images] ] [ inode ] jblk

DESCRIPTION
       jcat  shows the contents of a journal block in the file system journal.  The inode address of the journal can be given or the default loca‐
       tion will be used.  Note that the block address is a journal block address and not a file system block.  The raw output is given to STDOUT.

ARGUMENTS
       -f fstype
              Specify the file system type.  Use '-f list' to list the supported file system types.  If not given, autodetection methods are used.

       -i imgtype
              Identify the type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection  methods  are
              used.

       -o imgoffset
              The sector offset where the file system starts in the image.

       -b dev_sector_size
              The  size,  in  bytes,  of  the  underlying  device  sectors.  If not given, the value in the image format is used (if it exists) or
              512-bytes is assumed.

       -V     Display version

       -v     verbose output

       image [images]
              The disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is  split
              into  multiple  segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by ending in
              '.001'), subsequent image segments will be included automatically.

       [inode]
              The inode where the file system journal can be found.

       jblk   The journal block to display.

EXAMPLES
       jcat -f linux-ext3 img.dd 34 | xxd

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                           JCAT(1)
