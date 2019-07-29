Pnmquant User Manual(0)                                                                                                                                                               Pnmquant User Manual(0)



NAME
       pnmquant - quantize the colors in a Netpbm image to a smaller set


SYNOPSIS
       pnmquant [-center|-meancolor|-meanpixel] [-floyd|-fs] [-nofloyd|-nofs] [-spreadbrightness|-spreadluminosity] ncolors [pnmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pnmquant reads a PNM image as input.  It chooses ncolors colors to best represent the image, maps the existing colors to the new ones, and writes a PNM image as output.

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or equals signs between an option name
       and its value.

       This program is simply a combination of pnmcolormap and pnmremap, where the colors of the input are remapped using a color map which is generated from the colors in that  same  input.   The  options
       have the same meaning as in those programs.  See their documentation to understand pnmquant.

       It is much faster to call pnmcolormap and pnmremap directly than to run pnmquant.  You save the overhead of the Perl interpreter and creating two extra processes.  pnmquant is just a convenience.

       Here is an example of the relationship between the programs:

       This:

           $ pnmquant 256 myimage.pnm >/tmp/colormap.pnm >myimage256.pnm

       does essentially this:

           $ pnmcolormap 256 myimage.pnm >/tmp/colormap.pnm
           $ pnmremap -mapfile=/tmp/colormap.pnm myimage.pnm >myimage256.pnm

       pnmquant  did not exist before Netpbm 9.21 (January 2001).  Before that, ppmquant did the same thing, but only on PPM images.  ppmquant continues to exist, but is only a front end (for name compati-
       bility) to pnmquant.


SEE ALSO
       pnmcolormap(1) , pnmremap(1) , ppmquantall(1) , pamdepth(1) , ppmdither(1) , ppmquant(1) , pnm(5)



netpbm documentation                                                                            09 April 2013                                                                         Pnmquant User Manual(0)
