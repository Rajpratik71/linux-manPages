Pamfile User Manual(0)                                                                                                                                                                 Pamfile User Manual(0)



NAME
       pamfile - describe a Netpbm (PAM or PNM) file


SYNOPSIS
       pamfile

       [-allimages] [-count] [-comments]

       [file ...]

       Minimum  unique  abbreviations  of options are acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamfile reads one or more Netpbm files as input and writes out short descriptions of the image type, size, etc.  This is partly for use in shell scripts, so the format is not particularly pretty.

       By default, pamfile reads only the header of the input file.  If that file is a pipe, that might cause problems for the process that is feeding the pipe.  In that case, see the -allimages option.


OPTIONS
       -allimages
              This option causes pamfile to describe every image in each input file.  Without this option, pamfile describes only the first image in each input file.

              This option also causes pamfile to read all the images from the input stream, whereas without it, pamfile reads only the header of the first one.  If the input stream  is  from  a  pipe,  the
              process that is feeding the pipe might require the entire stream to be consumed.  In that case, use this option even if the stream contains only one image.

              This option has no effect if you also specify -count.

              Note that before July 2000, a file could not contain more than one image and many programs ignore all but the first.

              This option was new in Netpbm 9.5 (July 2000).


       -comments
              This option causes pamfile to include for each PAM image a report of the comments from the header of the image.

              For a PBM, PGM, or PPM image, pamfile reports there are no comments, even if there are.

              This option was new in Netpbm 10.35 (August 2006).


       -count This option causes pamfile to display only a count of how many images are in each input file.

              As with -allimages, this causes pamfile to read all the images.

              This option was new with Netpbm 10.31 (December 2005).




SEE ALSO
       pam(5) , ppmhist(1) , file


AUTHOR
       Copyright (C) 1991 by Jef Poskanzer.



netpbm documentation                                                                            11 July 2006;                                                                          Pamfile User Manual(0)
