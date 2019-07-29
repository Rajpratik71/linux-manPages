Ppmrainbow User Manual(0)                                                                                                                                                           Ppmrainbow User Manual(0)



NAME
       ppmrainbow - Generate a rainbow


SYNOPSIS
       ppmrainbow

       [-width=number] [-height=number] [-tmpdir=directory] [-norepeat] [-verbose] color ...


DESCRIPTION
       This program is part of Netpbm(1)

       ppmrainbow  generates a PPM image that fades from one color to another to another from left to right, like a rainbow.  The colors are those you specify on the command line, in that order.  The first
       color is added again on the right end of the image unless you specify the -norepeat option.

       If you want a vertical or other non-horizontal rainbow, run the output through pnmrotate or pamflip.

       One use for such a rainbow is to compose it with another image under an alpha mask in order to add a rainbow area to another image.  In fact, you can make rainbow-colored text by using pbmtext, pam-
       comp, and ppmrainbow.

       pgmramp does a similar thing for grayscale images.

       If you just want an image containing all the possible colors (for some kind of processing; not to look at), see pamseq.


OPTIONS
       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or equals signs between an option name
       and its value.



       -width number
              The width in pixels of the output image.

              Default is 600.


       -height number
              The height in pixels of the output image.

              Default is 8.


       -norepeat

              This option makes ppmrainbow end the rainbow with the last color you specify.  Without this option, ppmrainbow adds the first color you specify to the right end of the rainbow as if  you  had
              repeated it.  (I don't understand the point of this default behavior; it exists today just for backward compatibility).


       -tmpdir
              The directory specification of the directory ppmrainbow is to use for temporary files.

              Default is the value of the TMPDIR environment variable, or /tmp if TMPDIR is not set.

              ppmrainbow always creates a directory within this directory and creates all its files within that directory.


       -verbose
              Print the 'commands' (invocations of other Netpbm programs) that ppmrainbow uses to create the image.




SEE ALSO
       pgmramp(1) , pamseq(1) , pamgradient(1) , ppmmake(1) , ppmfade(1) , ppm(5)


AUTHOR
       Arjen Bax wrote ppmrainbow in June 2001 and contributed it to the Netpbm package.  Bryan Henderson wrote this manual in July 2001.



netpbm documentation                                                                           09 December 2009                                                                     Ppmrainbow User Manual(0)
