IMG_STAT(1)                                                   General Commands Manual                                                  IMG_STAT(1)

NAME
       img_stat - Display details of an image file

SYNOPSIS
       img_stat [-i imgtype] [-b dev_sector_size] [-tvV] image [images]

DESCRIPTION
       img_stat  displays the details associated with an image file.  The output of this command is image format specific.  At a minimum, the size
       will be given and the byte range of each file will be given for split image formats.

ARGUMENTS
       -i imgtype
              Identify the type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection  methods  are
              used.

       -b dev_sector_size
              The  size,  in  bytes,  of  the  underlying  device  sectors.  If not given, the value in the image format is used (if it exists) or
              512-bytes is assumed.

       -t     Print the image type only.

       -v     Verbose output of debugging statements to stderr

       -V     Display version

       image [images]
              The disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is  split
              into  multiple  segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by ending in
              '.001'), subsequent image segments will be included automatically.

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                       IMG_STAT(1)
