JLS(1)                                                        General Commands Manual                                                       JLS(1)

NAME
       jls - List the contents of a file system journal

SYNOPSIS
       jls [-f fstype ] [-vV] [-i imgtype] [-o imgoffset] [-b dev_sector_size] image [images] [inode]

DESCRIPTION
       jls  lists the records and entries in a file system journal.  If inode is given, then it will look there for a journal.  Otherwise, it will
       use the default location.  The output lists the journal block number and a description.

ARGUMENTS
       -f fstype
              Specify the file system type.  Use '-f list' to list the supported file system types. If not given, autodetection methods are used.

       -i imgtype
              Identify the type of image file, such as raw or split.  Use '-i list' to list the supported types. If not given, autodetection meth‐
              ods are used.

       -o imgoffset
              The sector offset where the file system starts in the image.

       -b dev_sector_size
              The  size,  in  bytes,  of  the  underlying  device  sectors.  If not given, the value in the image format is used (if it exists) or
              512-bytes is assumed.

       -V     Display version

       -v     verbose output

       image [images]
              One (or more if split) disk or partition images whose format is given with '-i'.

       [inode]
              The inode where the file system journal can be found.

EXAMPLES
       jls -f linux-ext3 img.dd

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                            JLS(1)
