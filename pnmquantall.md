Pnmquantall User Manual(0)                                                                                                                                                         Pnmquantall User Manual(0)



NAME
       pnmquantall - run Pnmquant on a bunch of files all at once, so they share a common colormap


SYNOPSIS
       pnmquantall

       [-ext extension] ncolors netpbm_file...

       Note that the usual syntax rules for Netpbm programs don't apply to this program.  For example, you can't abbreviation -ext and you can't put it anywhere on the line you want.



DESCRIPTION
       This program is part of Netpbm(1)

       pnmquantall  takes  a  bunch of Netpbm image files as input, chooses ncolors colors to best represent all of the images, maps the existing colors to the new ones, and overwrites the input files with
       the new quantized versions.

       If you don't want to overwrite your input files, use the -ext option.  The output files are then named the same as the input files, plus a period and the extension text you specify.

       The purpose is this: Let's say you've got a dozen PPMs that you want to display on the screen all at the same time.  Your screen can only display 256 different colors, but the PPMs have a total of a
       thousand or so different colors.  For a single image you solve this problem with pnmquant; pnmquantall solves it for multiple images.

       Note that another approach to this problem is to pre-select a set of colors and then use pnmremap to separately quantize each PPM to that set.)

       This  is  a rather simple program that runs pnmcolormap and pnmremap.  If you are considering using it in a program of any sophistication, you should probably just run those programs directly.  Even
       if you are typing it, you may want to do the steps manually because it gives you access to the various options of pnmcolormap and pnmremap for doing the quantization differently.



SEE ALSO
       pnmquant(1) , pnmremap(1) , pnmcolormap(1) , pnm(5)



netpbm documentation                                                                            05 March 2012                                                                      Pnmquantall User Manual(0)
