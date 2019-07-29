Pamstack User Manual(0)                                                                                                                                                               Pamstack User Manual(0)



NAME
       pamstack - stack planes of multiple PAM images into one PAM image


SYNOPSIS
       pamstack [-tupletype tupletype] [inputfilespec ...]

       All options may be abbreviated to the shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option from its value with a space instead of =.


DESCRIPTION
       This program is part of Netpbm(1)

       pamstack reads multiple PAM or PNM images as input and produces a PAM image as output, consisting of all the planes (channels) of the inputs, stacked in the order specified.

       For any one (but not more) of the input files, you may specify '-' to mean Standard Input.  If you specify no arguments at all, the input is one file: Standard Input.

       The  output  is  the  same  dimensions as the inputs, except that the depth is the sum of the depths of the inputs.  It has the same maxval.  pamstack fails if the inputs are not all the same width,
       height, and maxval.  The tuple type is a null string unless you specify the -tupletype option.

       pamstack works with multi-image streams.  It stacks the 1st image in all the streams into one output image (the first one in the output stream), then stacks the 2nd image in all the streams into the
       2nd image in the output stream, and so on, until one of the streams runs dry.  It's like a matrix operation.

       Before Netpbm 10.32 (February 2006), pamstack ignored all but the first image in each input stream.

       pamchannel does the opposite of pamstack:  It extracts individual planes from a single PAM.

       Use pamtopnm(1)
        to  convert a suitable PAM image to a more traditional PNM (PBM, PGM, or PPM) image.  (But there's no need to do that if you're going to feed it to a modern Netpbm program -- they all take suitable
       PAM input directly).

       One example of using pamstack is that some Netpbm programs accept as input a PAM that represents graphic image with transparency information.  Taking a color image for example, this would be  a  PAM
       with tuple type "RGB_ALPHA".  In Netpbm, such images were traditionally represented as two images - a PPM for the color and a PGM for the transparency.  To convert a PPM/PGM pair into PAM(RGB_ALPHA)
       input that newer programs require, do something like this:

       $ pamstack -tupletype=RGB_ALPHA myimage.ppm myalpha.pgm | \
             pamtouil >myimage.uil


OPTIONS
       -tupletype tupletype
              This specifies the tuple type name to be recorded in the output.  You may use any string up to 255 characters.  Some programs recognize some names.  If you omit this option, the default tuple
              type name is null.



SEE ALSO
       pam(5)

       pamchannel(1)



HISTORY
       pamstack was new in Netpbm 10.0 (June 2002).



netpbm documentation                                                                           10 January 2006                                                                        Pamstack User Manual(0)
