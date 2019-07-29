Rletopnm User Manual(0)                                                                                                                                                               Rletopnm User Manual(0)



NAME
       rletopnm - convert a Utah Raster Tools RLE image file to a PNM image file.


SYNOPSIS
       rletopnm

       [--alphaout={alpha-filename,-}] [--headerdump|-h]

       [--verbose|-v]

       [rlefile|-]

       All options may be abbreviated to their minimum unique abbreviation and options and arguments may be in any order.


DESCRIPTION
       This program is part of Netpbm(1)

       rletopnm  converts Utah Raster Toolkit RLE image files to PNM image files.  rletopnm handles four types of RLE files: Grayscale (8 bit data, no color map), Pseudocolor (8 bit data with a color map),
       Truecolor (24 bit data with color map), and Directcolor (24 bit data, no color map).  rletopnm generates a PPM file for all these cases except for the Grayscale file, for which rletopnm generates  a
       PGM file.

       rlefile is the RLE input file.  If it is absent or -, the input comes from Standard Input.


OPTIONS
       --alphaout=alpha-filename
              rletopnm   creates a PGM (portable graymap) file containing the alpha channel values in the input image.  If the input image doesn't contain an alpha channel, the alpha-filename file contains
              all zero (transparent) alpha values.  If you don't specify --alphaout, rletopnm does not generate an alpha file, and if the input image has an alpha channel, rletopnm simply discards it.

              If you specify - as the filename, rletopnm writes the alpha output to Standard Output and discards the image.

              See pamcomp(1)
               for one way to use the alpha output file.


       --verbose
              This option causes rletopnm  to operate in verbose mode.  It prints messages about what it's doing, including the contents of the RLE image header, to Standard Error.


       --headerdump
              This option causes rletopnm to operate in header dump mode.  It prints the contents of the RLE image header to Standard Error, but does not produce any other output.




EXAMPLES
       ·      While running in verbose mode, convert lenna.rle to PPM format and store the resulting image as lenna.ppm:

                  rletopnm --verbose lenna.rle >lenna.ppm


       ·      Dump the header information of the RLE file called file.rle:

                  rletopnm --headerdump file.rle


       ·      Convert RLE file dart.rle to PPM format as dart.ppm.  Store the alpha channel of dart.rle as dartalpha.pgm (if dart.rle doesn't have an alpha channel, store a fully transparent alpha mask  as
              dartalpha.pgm):

                  rletopnm --alphaout=dartalpha.pgm dart.rle >dart.ppm




SEE ALSO
       pnmtorle(1) , pnmconvol(1) , pnm(5) , ppm(5) , pgm(5) ,


AUTHOR
       Wes Barris Army High Performance Computing Research Center (AHPCRC) Minnesota Supercomputer Center, Inc.

       Modifications by Eric Haines to support raw and plain formats.

       Modifications by Bryan Henderson to create alpha files and use mnemonic options.



netpbm documentation                                                                            13 April 2000                                                                         Rletopnm User Manual(0)
