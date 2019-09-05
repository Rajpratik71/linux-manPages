Pambayer User Manual(0)                                                                                                                                                               Pambayer User Manual(0)



NAME
       pambayer - interpret Bayer patterns


SYNOPSIS
       pambayer -type={1|2|3|4} [-nointerpolate] [pamfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pambayer reads a Bayer pattern in a 1-deep Netpbm image and produces a color image in PAM RGB format as output.

       A Bayer pattern is what you get from the optical sensor in some digital cameras.  Such a camera doesn't have a red, green, and blue sensor in the exact same place for an individual pixel.   Instead,
       it  has  red,  green, and blue sensors laid out in a two dimensional array.  The pattern in which they are laid out is the Bayer pattern.  The input to pambayer is one sample value for each of those
       sensors, so some samples are red, some are green, and some are blue.

       pambayer turns that into a regular visual image with one pixel per sensor.  For the two components of each pixel that are missing in the corresponding Bayer input, pambayer averages the sample  val-
       ues from the adjacent pixels that do have that component.

       But  you can have pambayer fill in black instead (see the -noninterpolate option), which gives you a simpler representation of what the camera saw, on which you might do further processing.  Such an
       image still looks right, though considerably dimmer, if you stand far enough away and let your eyes do the interpolation.

       The input image is a pseudo-PNM image (pseudo- because while the structure is the same, the sample values have different meanings) or PAM image of arbitrary tuple type.  pambayer looks at  only  the
       first plane of the input.

       The output image is a PAM image of tuple type 'RGB', i.e.  a standard color image.  You can convert this to PPM with pamtopnm(1)

       If you're interested in just one of the primary colors, use pamchannel on the output of pambayer to extract it.



OPTIONS
       -type=n
              This tells which Bayer pattern the input is:



       1      GBG/RGR/GBG matrix

       2      RGR/GBG/RGR matrix

       3      BGB/GRG/BGB matrix

       4      GRG/BGB/GRG matrix


              This option is mandatory.


       -nointerpolate
              Each output pixel position corresponds to one position in the input Bayer pattern, which means only one of the three color components is supplied by the input.  For the other two, this option
              says to user zero.  Without it, pambayer instead interpolates from the adjacent pixels that do have that color component.

              This option was new in Netpbm 10.49 (December 2009).






SEE ALSO
       cameratopam(1)

       pam(5)



HISTORY
       pambayer was new in Netpbm 10.30 (October 2005).



netpbm documentation                                                                            18 August 2005                                                                        Pambayer User Manual(0)
