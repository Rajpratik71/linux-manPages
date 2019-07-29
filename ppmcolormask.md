Ppmcolormask User Manual(0)                                                                                                                                                       Ppmcolormask User Manual(0)



NAME
       ppmcolormask - produce mask of areas of a certain color in a PPM file


SYNOPSIS
       ppmcolormask -color=color_list [ppmfile]

       ppmcolormask color [ppmfile]


EXAMPLES
           ppmcolormask -color red testimg.ppm >redmask.pbm
           pamcomp background.ppm testimg.ppm -alpha=redmask.pbm >test.ppm

           ppmcolormask -color=red,pink,salmon testimg.ppm >reddishmask.pbm

           ppmcolormask -color=bk:red,bk:orange,bk:yellow testimg.ppm >firemask.pbm



DESCRIPTION
       This program is part of Netpbm(1)

       ppmcolormask  reads  a  PPM  file  as input and produces a PBM (bitmap) file as output.  The output file is the same dimensions as the input file and is black in all places where the input file is a
       color indicated by the -color option, and white everywhere else.

       The output of ppmcolormask is useful as an alpha mask input to pamcomp.  Note that you can generate such an alpha mask automatically as you convert to PNG format with pnmtopng(1) option.

       ppmfile is the input file.  If you don't specify ppmfile, the input is from Standard Input.

       The output goes to Standard Output.

       In the obsolete alternative syntax, specifying the color names a single exact color to be masked.

       ppmchange does a similar thing: it modifies an image by changing colors you specify to other colors you specify.  The two programs give you somewhat different means of specifying colors in the input
       image.

       To make a mask of an image's background, without having to tell it what color it is, use pambackground.


OPTIONS
       -color=color_list
              This mandatory option specifies the colors that are to be masked (where the image is one of these colors, the output mask will be black).

              Examples:



       ·      -color=red

       ·      -color=red,pink,salmon

       ·      -color=rgb:80/80/ff

       ·      -color=bk:red,bk:orange,bk:yellow


              color_list is a list of colors separated by commas.  Each color is either an exact color name as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩  or
              one of the Berlin-Kay color names ⟨libppm.html#berlinkay⟩ .  In the latter case, all colors that are better described by that Berlin-Kay color name than any other are in the mask set.

              The algorithm ppmcolormask uses to determine to which colors a Berlin-Kay color name applies is based on a Sugeno-type fuzzy inference system developed by Kenan Kalajdzic in 2006.  The  fuzzy
              model  consists of partially linear membership functions defined in the HSV color space.  Although more complex algorithms for fuzzy color matching exist, this algorithm is intentionally sim-
              plified to achieve a satisfactory speed using relatively compact code.

              This option was new in Netpbm 10.34 (June 2006).  Before that, you must use the color argument and cannot specify a Berlin-Kay color.




SEE ALSO
       pambackground(1) , ppmchange(1) , pgmtoppm(1) , pamcomp(1) , pbmmask(1) , ppm(5)



netpbm documentation                                                                              1 May 2006                                                                      Ppmcolormask User Manual(0)
