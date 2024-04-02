FCAT(1)                                                       General Commands Manual                                                      FCAT(1)

NAME
       fcat - Output the contents of a file based on its name.

SYNOPSIS
       fcat [-hRsvV] [-f fstype ] [-i imgtype ] [-o imgoffset ] [-b dev_sector_size] path_of_file image [images]

DESCRIPTION
       fcat opens the named image(s) and copies the file at the path path_of_file to standard output.

ARGUMENTS
       -f fstype
              Specifies  the  file  system  type.  Use '-f list' to list the supported file system types.  If not given, autodetection methods are
              used.

       -h     Skip over holes in sparse files, so that absolute address information is lost. This option saves space when copying sparse files.

       -R     Supress errors if a deleted file is being recovered.

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

       path_of_file
              Path of file to extract the contents of.  Surround the path in quotes if there is a space in a file or directory name.  Use  forward
              slashes.

LICENSE
       This software is distributed under the Common Public License.

       Send documentation updates to <doc-updates at sleuthkit dot org>

                                                                                                                                           FCAT(1)
