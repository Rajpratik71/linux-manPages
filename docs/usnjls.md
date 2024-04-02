USNJLS(1)                                                     General Commands Manual                                                    USNJLS(1)

NAME
       usnjls - List the contents of a NTFS Update Sequence Number journal

SYNOPSIS
       usnjls [-f fstype ] [-vV] [-i imgtype] [-o imgoffset] [-b dev_sector_size] image [images] [inode]

DESCRIPTION
       usnjls  lists  the records in a NTFS Update Sequence Number Journal.  If inode is given, then it will look there for a journal.  Otherwise,
       it will use the default location.  The output lists the USN journal records.

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

       -l     Print the output in long format describing the field values and unpacking the data into human readable strings.

       -m     Print the output in mactime format.

       -V     Display version

       -v     verbose output

       image [images]
              One (or more if split) disk or partition images whose format is given with '-i'.

       [inode]
              The inode where the Update Sequence Number Journal can be found.

EXAMPLES
       usnjls -f ntfs img.dd

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                         USNJLS(1)
