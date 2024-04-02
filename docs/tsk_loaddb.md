TSK_LOADDB(1)                                                 General Commands Manual                                                TSK_LOADDB(1)

NAME
       tsk_loaddb - populate a SQLite database with metadata from a disk image

SYNOPSIS
       tsk_loaddb [-ahkvV] [ -i imgtype ] [ -b dev_sector_size ] [ -i imgtype ] [ -d database ] image [images]

DESCRIPTION
       tsk_loaddb  loads  disk information from image to a SQLite database.  This database can then be used by tools in other languages for analy‐
       sis. By default, the database is stored in the same directory as the image with ".db" appended to the name or  the  database  name  can  be
       specified with '-d'.

       The arguments are as follows:

       -a     Adds image to an existing database instead of creating a new one.  Requires that -d be also specified.

       -d database
              Path for the database (default is the same directory as the image with name derived from image name

       -v     verbose output to stderr

       -V     Print version

       -k     Don't  create  block  data table.  This table maps each block to the file that allocated it.  This option will make this program run
              faster.

       -h     Calculate MD5 hash value for each file and store it in table.  This option will make the program run slower.

       -i imgtype
              The format of the image file, such as raw.  Use '-i list' to list the supported types.  If  not  given,  autodetection  methods  are
              used.

       -b dev_sector_size
              The size (in bytes) of the device sectors.  If not given, autodetection methods are used.

       image [images]
              The  disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is split
              into multiple segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by  ending  in
              '.001'), subsequent image segments will be included automatically.

EXAMPLES
       To load image data from image.dd to image.dd.db:

            # tsk_loaddb ./image.dd

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                     TSK_LOADDB(1)
