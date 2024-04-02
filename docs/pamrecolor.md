Pamrecolor User Manual(0)                                                                                                                                                           Pamrecolor User Manual(0)



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">




       Table Of Contents ⟨#contents⟩



NAME
       pamrecolor - alter colors without affecting luminance


SYNOPSIS
       pamrecolor [--colorspace=name] [--rmult=fraction] [--gmult=fraction] [--bmult=fraction] [--targetcolor=color] [--colorfile=file] [-randomseed=integer]

       [infile]


       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamrecolor changes an image's colors to be as close as possible to given target colors but with the constraint that the luminance not be modified.  That is, the original image and the  target  image
       will look identical if both are converted to grayscale (e.g. with ppmtopgm(1) ).  You can have pamrecolor select target colors randomly, specify a single hue for the entire image, or take the target
       colors from a target image.

       pamrecolor works on pseudo-Netpbm images based on arbitrary color spaces.  You can define the color space explicitly or choose on of many that pamrecolor knows by name.

       The output is a PAM image on standard output.  Options control the exact format of the PAM.  If you want a PNM (PBM, PGM, or PPM) image, use pamtopnm(1)
        on the output.  There is no need to convert if you will use the image as input to a current Netpbm program, but many other programs don't know what a PAM is.



OPTIONS
       --colorspace=name
              Designate the color space to use for determining the contribution to luminance of each of the red, green, and blue color channels.  For example, in the SMPTE-C color space  an  RGB  color  is
              converted to grayscale by multiplying the red channel by 0.2124132, the green channel by 0.7010437, and the blue channel by 0.0865432 and summing the resulting three products.

              When  you  use  this option, the input and output images are not true Netpbm images, because the Netpbm image format specifies a particular color space.  Instead, you are using a variation on
              the format in which the sample values in the raster have different meaning.  Many programs that ostensibly use Netpbm images actually use a variation with a different color space,  For  exam-
              ple, GIMP ⟨http://www.gimp.org/⟩  uses sRGB internally and if you have GIMP generate a Netpbm image file, it really generates a variation of the format that uses sRGB.

              pamrecolor knows the following color spaces (name values):



       adobe

              Adobe RGB (1998) with a D65 reference white


       apple

              Apple  RGB with a D65 reference white


       cie

              CIE with an Illuminant E reference white


       ntsc

              NTSC RGB with an Illuminant C reference white


       pal

              PAL/SECAM with a D65 reference white


       smpte-c

              SMPTE-C with a D65 reference white


       srgb

              sRGB with a D65 reference white


       wide

              Wide-gamut RGB with a D50 reference white


              The  default is <q>ntsc</q> because this is the color space that the Netpbm format of Netpbm and many other graphics utilities.  As a counterexample, GIMP ⟨http://www.gimp.org/⟩  uses sRGB as
              its native color space.

              The luminance values pamrecolor uses for each of the above come from Bruce Lindbloom's  Computing RGB-to-XYZ and XYZ-to-RGB matrices (1)
               page.


       --rmult=fraction

       --gmult=fraction

       --bmult=fraction
              Instead of selecting a color space by name, you can specify explicitly the contribution of each color channel to the overall luminance as  red,  green,  and  blue  multipliers.   These  three
              options  must  be  used  together, and the three fraction values must sum to 1.0.  For example, you can specify the ProPhoto (ROMM) RGB color space with <q>--rmult=0.2880402 --gmult=0.7118741
              --bmult=0.0000857</q>.


       --targetcolor=color
              Designate color as the target color for the image.  pamrecolor will make each pixel as close as possible to color subject to the constraint that the luminance must stay the  same  as  in  the
              original image.  Specify color as in the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩  (e.g., <q>hotpink</q> or <q>#ff69b4</q>).

              If you specify neither --targetcolor nor --colorfile, pamrecolor will randomly select a target color for each pixel of the input image.

              You may not specify both -targetcolor and -colorfile.




       --colorfile=file
              Take  per-pixel  target  colors from Netpbm file file instead of using a single target color for the entire image.  file should be a PPM or color PAM image.  If the image in the file wider or
              taller than the input image, pamrecolor uses only the left and top part of it.  If the image is narrower or shorter, pamrecolor considers the image to be repeated in a tile pattern.

              If you specify neither --targetcolor nor --colorfile, pamrecolor will randomly select a target color for each pixel of the input image.

              You may not specify both -targetcolor and -colorfile.


       -randomseed=integer
              This is the seed for the random number generator that generates the pixels.

              Use this to ensure you get the same image on separate invocations.

              By default, pamrecolor uses a seed derived from the time of day and process ID, which gives you fairly uncorrelated results in multiple invocations.

              This option was new in Netpbm 10.61 (December 2012).





EXAMPLES
       This command tints an image yellow:

           pamrecolor --targetcolor=yellow colorpic.pam > yellowpic.pam

       This command takes the colors from colorpicture.ppm and applies them to graypicture.pgm:

           pamrecolor --colorfile=colorpic.ppm graypic.pgm > colorizedpic.pam

       The grayscale version of colorizedpic.pam will look just like graypic.pgm.  Note that if you use a non-Netpbm tool to do the conversion to grayscale, you may additionally need to specify  an  appro-
       priate --colorspace value for your conversion tool.



NOTES
       Here are a couple of fun special effects you can produce with pamrecolor:



       ·      Specify a color file that is identical to the input image but with some large, colored text added to it.  The text will <q>magically</q> vanish when the image is converted to grayscale.


       ·      Provide  a low-contrast grayscale image &mdash; perhaps a secret message written in similar shades of gray &mdash; as the input file and a colorful but completely different image as the color
              file.  If done carefully, the grayscale image can be hidden by the colorful image.  Only people who know to convert the result to grayscale can recover the original grayscale image.


       ·      Use --targetcolor=tan to make an image look like an old-timey photograph (or, more precisely, a sepia-toned photograph ⟨http://en.wikipedia.org/wiki/Photographic_print_toning⟩   of  the  late
              1800s).




HISTORY
       Scott Pakin wrote pamrecolor in July 2010.

       pamrecolor was new in Netpbm 10.52 (September 2010).



AUTHOR
       Copyright (C) 2010 Scott Pakin, scott+pbm@pakin.org.



SEE ALSO
       ·

              ppmtopgm(1)


       ·

              ppmchange(1)


       ·

              pnmremap(1)



netpbm documentation                                                                             31 July 2010                                                                       Pamrecolor User Manual(0)
