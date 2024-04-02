IMG_CAT(1)                                                    General Commands Manual                                                   IMG_CAT(1)

NAME
       img_cat - Output contents of an image file.

SYNOPSIS
       img_cat [-i imgtype] [-b dev_sector_size] [-s start_sector] [-e stop_sector] [-vV] image [images]

DESCRIPTION
       img_cat  outputs  the  contents  of an image file.  Image files that are not raw will have embedded data and metadata.  img_cat will output
       only the data.  This allows you to convert an embedded format to raw or to calculate the MD5 hash of the data by piping the output  to  the
       appropriate tool.

ARGUMENTS
       -i imgtype
              Identify  the type of image file, such as raw or aff.  Use '-i list' to list the supported types.  If not given, autodetection meth‐
              ods are used.

       -b dev_sector_size
              The size, in bytes, of the underlying device sectors.  If not given, the value in the  image  format  is  used  (if  it  exists)  or
              512-bytes is assumed.

       -s start_sector
              The sector number to start at.

       -e stop_sector
              The sector number to stop at.

       -v     Verbose output of debugging statements to stderr

       -V     Display version

       image [images]
              The  disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is split
              into multiple segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by  ending  in
              '.001'), subsequent image segments will be included automatically.

AUTHOR
       Brian Carrier <carrier at sleuthkit dot org>

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                        IMG_CAT(1)
