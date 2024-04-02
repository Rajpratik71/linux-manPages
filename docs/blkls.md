BLKLS(1)                                                      General Commands Manual                                                     BLKLS(1)

NAME
       blkls - List or output file system data units.

SYNOPSIS
       blkls [-aAelsvV] [-f fstype ] [-i imgtype ] [-o imgoffset ] [-b dev_sector_size] image [images] [start-stop]

DESCRIPTION
       blkls  opens  the  named  image(s)  and  copies file system data units (blocks).  By default, blkls copies the contents of unallocated data
       blocks.  blkls was called dls in TSK versions prior to 3.0.0.  blkls was called unrm in TCT.

ARGUMENTS
       -e     Copy every block, including file system metadata blocks. The output is the entire file system.

       -a     Display all allocated blocks (same as -e if -A is also given).

       -A     Display all unallocated blocks (same as -e if -a is also given). This is the default behavior.

       -f fstype
              Specifies the file system type.  Use '-f list' to list the supported file system types.  If not  given,  autodetection  methods  are
              used.

       -i imgtype
              Identify  the  type of image file, such as raw.  Use '-i list' to list the supported types.  If not given, autodetection methods are
              used.

       -o imgoffset
              The sector offset where the file system starts in the image.

       -b dev_sector_size
              The size, in bytes, of the underlying device sectors.  If not given, the value in the  image  format  is  used  (if  it  exists)  or
              512-bytes is assumed.

       -l     List the data information in time machine format.

       -s     Copy only the slack space of the image.

       -v     Turn on verbose mode, output to stderr.

       -V     Display version.

       image [images]
              The  disk or partition image to read, whose format is given with '-i'.  Multiple image file names can be given if the image is split
              into multiple segments.  If only one image file is given, and its name is the first in a sequence (e.g., as indicated by  ending  in
              '.001'), subsequent image segments will be included automatically.

       start-stop ...
              Examine the specified block number or number range.

LICENSE
       This software is distributed under the IBM Public License.

HISTORY
       First appeared in The Coroners Toolkit (TCT) 1.0 (Wietse Venema).  Now maintained by Brian Carrier <carrier at sleuthkit dot org>.

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                          BLKLS(1)
