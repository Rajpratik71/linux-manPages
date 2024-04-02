TSK_RECOVER(1)                                                General Commands Manual                                               TSK_RECOVER(1)

NAME
       tsk_recover - Export files from an image into a local directory

SYNOPSIS
       tsk_recover [-vVae] [ -f fstype ] [ -i imgtype ] [ -b dev_sector_size ] [ -o sector_offset ] [ -d dir_inum ] image [images] output_dir

DESCRIPTION
       tsk_recover  recovers  files  to the output_dir from the image.  By default recovers only unallocated files. With flags, it will export all
       files.

       The arguments are as follows:

       -v     verbose output to stderr

       -V     Print version

       -a     Recover allocated files only

       -e     Recover all files (allocated and unallocated)

       -f fstype
              Specify the file system type.  Use '-f list' to list the supported file system types.  If not given, autodetection methods are used.

       -i imgtype
              The format of the image file, such as raw.  Use '-i list' to list the supported types.  If  not  given,  autodetection  methods  are
              used.

       -b dev_sector_size
              The size (in bytes) of the device sectors.  If not given, autodetection methods are used.

       -o sector_offset
              Sector  offset  for  a  volume to recover (recovers only that volume) If not given, will attempt to recover all volumes in image and
              save them to different folders.

       -d dir_inum
              Directory inum to recover from (must also specify a specific partition using -o or there must not be a volume system)

       image [images]
              The disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is  split
              into  multiple  segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by ending in
              '.001'), subsequent image segments will be included automatically.

       output_dir
              The directory in which to save recovered files.

EXAMPLES
       To recover only unallocated files from image.dd to the recovered directory:

            # tsk_recover ./image.dd ./recovered

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                    TSK_RECOVER(1)
