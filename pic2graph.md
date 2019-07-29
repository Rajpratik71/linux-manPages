PIC2GRAPH(1)                                                  General Commands Manual                                                 PIC2GRAPH(1)

NAME
       pic2graph - convert a PIC diagram into a cropped image

SYNOPSIS
       pic2graph [ -unsafe ] [ -format fmt ] [ -eqn delim ]

DESCRIPTION
       Reads a PIC program as input; produces an image file (by default in Portable Network Graphics format) suitable for the Web as output.  Also
       translates eqn(1) constructs, so it can be used for generating images of mathematical formulae.

       PIC is a rather expressive graphics minilanguage suitable for producing box-and-arrow diagrams of the kind  frequently  used  in  technical
       papers  and  textbooks.  The language is sufficiently flexible to be quite useful for state charts, Petri-net diagrams, flow charts, simple
       circuit schematics, jumper layouts, and other kinds of illustration involving repetitive  uses  of  simple  geometric  forms  and  splines.
       Because PIC descriptions are procedural and object-based, they are both compact and easy to modify.

       The PIC language is fully documented in Making Pictures With GNU PIC, a document which is part of the groff(1) distribution.

       Your input PIC code should not be wrapped with the .PS and .PE macros that normally guard it within groff(1) macros.

       The  output  image  will be clipped to the smallest possible bounding box that contains all the black pixels.  Older versions of convert(1)
       will produce a black-on-white graphic; newer ones may produce a black-on-transparent graphic.  By specifying  command-line  options  to  be
       passed  to  convert(1)  you  can give it a border, force the background transparent, set the image's pixel density, or perform other useful
       transformations.

       This program uses pic(1), eqn(1), groff(1), gs(1), and the ImageMagick convert(1) program.  These programs must be installed on your system
       and accessible on your $PATH for pic2graph to work.

OPTIONS
       -unsafe
              Run  pic(1)  and  groff(1)  in  the ‘unsafe’ mode enabling the PIC macro sh to execute arbitrary commands.  The default is to forbid
              this.

       -format fmt
              Specify an output format; the default is PNG (Portable Network Graphics).  Any format that convert(1) can emit is supported.

       -eqn delim
              Change the fencepost characters that delimit eqn(1) directives ($ and $, by default).  This option  requires  an  argument,  but  an
              empty string is accepted as a directive to disable eqn(1) processing.

       Command-line switches and arguments not listed above are passed to convert(1).

FILES
       /usr/share/groff/1.22.3/tmac/eqnrc  The eqn(1) initialization file.

ENVIRONMENT
       GROFF_TMPDIR
              The  directory  in  which  temporary files will be created.  If this is not set pic2graph searches the environment variables TMPDIR,
              TMP, and TEMP (in that order).  Otherwise, temporary files will be created in /tmp.

BUGS
       Due to changes in the behavior of ImageMagick convert(1) that are both forward and backward-incompatible, mismatches between your pic2graph
       and  convert(1)  versions  may  produce  zero-sized  or  untrimmed output images.  For this version of pic2graph you will need a version of
       convert(1) that supports the -trim option; older versions of pic2graph used -crop 0x0, which no longer has trimming behavior.

SEE ALSO
       eqn2graph(1), grap2graph(1), pic(1), eqn(1), groff(1), gs(1), convert(1).

COPYING
       This documentation is released to the public domain.

AUTHORS
       ⟨⟩esr@thyrsus.com Eric S. Raymond ⟨⟩, based on a recipe by W. Richard Stevens.

Groff Version 1.22.3                                              28 January 2016                                                     PIC2GRAPH(1)
