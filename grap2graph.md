GRAP2GRAPH(1)                                                 General Commands Manual                                                GRAP2GRAPH(1)

NAME
       grap2graph - convert a grap diagram into a cropped bitmap image

SYNOPSIS
       grap2graph [ -unsafe ] [ -resolution M|MxN ] [ -format fmt ]

DESCRIPTION
       Reads a grap program as input; produces an image file (by default in Portable Network Graphics format) suitable for the Web as output.  For
       a description of the grap language, see grap(1).

       Your graph specification should not be wrapped with the .G1 and .G2 macros that normally guard it within groff(1) macros.

       The output image will be a black-on-white graphic clipped to the smallest possible bounding box that contains all  the  black  pixels.   By
       specifying  command-line options to be passed to convert(1) you can give it a border, set the background transparent, set the image's pixel
       density, or perform other useful transformations.

       This program uses grap(1), pic(1), groff(1), and the ImageMagick convert(1) program.  These programs must be installed on your  system  and
       accessible on your $PATH for grap2graph to work.

OPTIONS
       -unsafe
              Run  pic(1)  and  groff(1)  in  the `unsafe' mode enabling the PIC macro sh to execute arbitrary commands.  The default is to forbid
              this.

       -format fmt
              Specify an output format; the default is PNG (Portable Network Graphics).  Any format that convert(1) can emit is supported.

       Command-line switches and arguments not listed above are passed to convert(1).

ENVIRONMENT
       GROFF_TMPDIR
              The directory in which temporary files will be created.  If this is not set grap2graph searches the  environment  variables  TMPDIR,
              TMP, and TEMP (in that order).  Otherwise, temporary files will be created in /tmp.

SEE ALSO
       pic2graph(1), eqn2graph(1), pic(1), groff(1), gs(1), convert(1).

COPYING
       This documentation is released to the public domain.

AUTHORS
       This document was written by Eric S. Raymond ⟨esr@thyrsus.com⟩.

Groff Version 1.22.3                                              28 January 2016                                                    GRAP2GRAPH(1)
