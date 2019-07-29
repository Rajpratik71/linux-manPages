EQN2GRAPH(1)                                                  General Commands Manual                                                 EQN2GRAPH(1)

NAME
       eqn2graph - convert an EQN equation into a cropped image

SYNOPSIS
       eqn2graph [ -unsafe ] [ -format fmt ]

DESCRIPTION
       Reads  an EQN equation (one line) as input; produces an image file (by default in Portable Network Graphics format) suitable for the Web as
       output.

       Your input EQN code should not have the .EQ/.EN preamble that normally precedes it within groff(1) macros; nor do you need to have  dollar-
       sign or other delimiters around the equation.

       The  output  image  will be clipped to the smallest possible bounding box that contains all the black pixels.  Older versions of convert(1)
       will produce a black-on-white graphic; newer ones may produce a black-on-transparent graphic.  By specifying  command-line  options  to  be
       passed  to  convert(1)  you  can give it a border, force the background transparent, set the image's pixel density, or perform other useful
       transformations.

       This program uses eqn(1), groff(1), and the ImageMagick convert(1) program.  These programs must be installed on your system and accessible
       on your $PATH for eqn2graph to work.

OPTIONS
       -unsafe
              Run groff(1) in the `unsafe' mode enabling the PIC macro sh to execute arbitrary commands.  The default is to forbid this.

       -format fmt
              Specify an output format; the default is PNG (Portable Network Graphics).  Any format that convert(1) can emit is supported.

       Command-line switches and arguments not listed above are passed to convert(1).

FILES
       /usr/share/groff/1.22.3/tmac/eqnrc  The eqn(1) initialization file.

ENVIRONMENT
       GROFF_TMPDIR
              The  directory  in  which  temporary files will be created.  If this is not set eqn2graph searches the environment variables TMPDIR,
              TMP, and TEMP (in that order).  Otherwise, temporary files will be created in /tmp.

BUGS
       Due to changes in the behavior of ImageMagick convert(1) that are both forward and backward-incompatible, mismatches between your eqn2graph
       and  convert(1)  versions may produce zero-sized or untrimmed output images.  For this version of eqn2graph you will need a version of con‐
       vert(1) that supports the -trim option; older versions of eqn2graph used -crop 0x0, which no longer has trimming behavior.

SEE ALSO
       pic2graph(1), grap2graph(1), eqn(1), groff(1), gs(1), convert(1).

AUTHORS
       Eric S. Raymond <esr@thyrsus.com>.  This documentation is released to the public domain.

Groff Version 1.22.3                                              28 January 2016                                                     EQN2GRAPH(1)
