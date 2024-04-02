mergebad(1)                                               merge multiple images into one                                               mergebad(1)

NAME
       mergebad - merge multiple images into one

SYNOPSIS
       mergebad -i <mapfile><imagefile> -o <output_file> -l <mapfile> -s <size> -v -h

DESCRIPTION
       mergebad merges multiple images into one. This can be useful when you have, for example, multiple CDs with the same data which are all dam‐
       aged. In such case, you can then first use recoverdm to retrieve the data from the damaged CDs into image files and then combine them  into
       one image with mergebad.

OPTIONS
       -i <mapfile> <imagefile>
              With -i one selects a mapfile+imagefile to read.

       -o <output_file>
              File to write output to.

       -l <mapfile>
              In case all input images had a bad block on the same place, this file will list those blocks.

       -s <size>
              Limit or extend the size of the output image.

       -v     Be verbose.

       -h     This help.

SEE ALSO
       recoverdm(1)

AUTHOR
       The mergebad is part of recoverdm and was written by Folkert van Heusden <folkert@vanheusden.com>.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

MERGEBAD 0.20                                                        Jul 2015                                                          mergebad(1)
