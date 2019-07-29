Ppmhist User Manual(0)                                                                                                                                                                 Ppmhist User Manual(0)



NAME
       ppmhist - print a histogram of the colors in a PPM image


SYNOPSIS
       ppmhist [-hexcolor | -float | -colorname | -map] [-nomap] [-noheader] [-sort={frequency,rgb}] [-forensic [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmhistreads a PPM image as input and generates a histogram of the colors in the image, i.e. a list of all the colors and how many pixels of each color are in the image.


   Output Format
       The output is in one of two basic formats:  a report for humans and a PPM image for use by programs.  The PPM image is actually quite readable by humans too.

       Human Report

       You get this format by specifying (or defaulting to) the -nomap option.

       The format is one line for each color in the input image.

       By default, there are two lines of column header at the top.  Use the -noheader option to suppress those lines.

       In  each line, ppmhist identifies the color by red, green, and blue components.  By default, it lists each of these in decimal, using the exact values that are in the PPM input.  So if the image has
       a maxval of 255, the numbers in the listing range from 0 to 255.  With the -hexcolor option, you can change these numbers to hexadecimal.   With  the  -float  option,  the  numbers  are  fractional,
       adjusted to a maxval of 1.

       Each line lists the luminosity of the color.  It is in decimal on the same scale as the rgb values (see above).

       Each line lists the number of pixels in the image that have the color.  This is in decimal.


       PPM Output

       You get this format with the -map option.

       The output file is a genuine PPM image, but it is PPM Plain format and contains comments so that it is not a lot different from the human report described above.

       As a PPM image, it can be useful as input to other programs that need some kind of palette.  The image is a single row with one column for each distinct color in the image.



OPTIONS
       -sort={frequency,rgb}
              The  -sort option determines the order in which the colors are listed in the output.  frequency means to list them in order of how pixels in the input image have the color, with the most rep-
              resented colors first.  rgb means to sort them first by the intensity of the red component of the color, then of the green, then of the blue, with the least intense first.

              The default is frequency.


       -hexcolor
              Print the color components in hexadecimal.  See output format ⟨#output⟩ .

              You may not specify this option along with -float or map.


       -float Print the color components and the luminosity as floating point numbers in the range [0,1].  See output format ⟨#output⟩ .

              You may not specify this option along with -hexcolor or map.

              This option was added in Netpbm 10.19 (November 2003).


       -map   Generates a PPM file of the colormap for the image, with the color histogram as comments.  See output format ⟨#output⟩ .

              You may not specify this option along with -float or hexcolor.


       -nomap Generates the histogram for human reading.  This is the default.


       -colorname
              Add the color name to the output.  This is the name from the system color dictionary ⟨libppm.html#rgb.txt⟩ .  If the exact color is not in the color dictionary, it is the closest  color  that
              is in the dictionary and is preceded by a '*'.  If you don't have a system color dictionary, the program fails.

              This option was added in Netpbm 10.10 (October 2002).


       -noheader
              Do not print the column headings.


       -forensic

              With  this option, ppmhist works on images that contain invalid sample values.  Normally, like most Netpbm programs, ppmhist fails if it encounters a sample value greater than the maxval that
              the image declares.  The presence of such a value means the image is invalid, so the pixels have no meaning.  But with -forensic, ppmhist produces a histogram  of  the  actual  sample  values
              without regard to maxval.  It issues messages summarizing the invalid pixels if there are any.

              One use for this is to diagnose the problem that caused the invalid Netpbm image to exist.

              There is a small exception to the ability of ppmhist to process invalid pixels even with -forensic: it can never process a sample value greater than 65535.  Note that in the rarely used Plain
              PPM format, it is possible for a number greater than that to appear where a sample value belongs.

              This option was new in Netpbm 10.66 (March 2014).  But Netpbm older than 10.66 does not properly reject invalid sample values, so the effect is very similar to -forensic.




SEE ALSO
       ppm(5) , pgmhist(1) , pnmcolormmap(1) , pnmhistmap(1) , ppmchange(1)



AUTHOR
       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                            11 March 2014                                                                          Ppmhist User Manual(0)
