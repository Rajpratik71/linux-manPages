JIGSUM(1)                                                     General Commands Manual                                                    JIGSUM(1)

NAME
       jigsum - List MD5 sums of files in jigdo's bas64-alike format

SYNOPSIS
       jigsum [files]...

DESCRIPTION
       jigsum will read in all the files specified and write the MD5sum of each file to stdout (similarly to the md5sum program), but in the jigdo
       base64-like format rather than the normal hexadecimal format.

EXAMPLES
       $ jigsum *.c

       l47z1lSgp8LjDKFbK-JE4g  endian.c

       14LC5gWctrarRvkobDxRQQ  jigdump.c

       NBACGqWruP5PAsv_o8Ahyg  jigsum.c

       qIsPRZQZmUWwim_yeYIQvg  md5.c

       Im7-9TForecHp6C7bekXUg  mkimage.c

SEE ALSO
       jigdo-file(1), jigit(1), jigdump(1) and mkimage(1).

COPYRIGHT
       Copyright 2004 Steve McIntyre (steve@einval.com)

       jigsum may be copied under the terms and conditions of version 2 of the GNU General Public License, as published by the Free Software Foun‐
       dation (Cambridge, MA, USA).

AUTHOR
       Written by Steve McIntyre (steve@einval.com)

Jigit jigdo tools                                                 September 2004                                                         JIGSUM(1)
