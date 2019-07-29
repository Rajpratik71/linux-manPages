Ppmcie User Manual(0)                                                                                                                                                                   Ppmcie User Manual(0)



NAME
       ppmcie - draw a CIE color chart as a PPM image


SYNOPSIS
       ppmcie

       [ -rec709|-cie|-ebu|-hdtv|-ntsc|-smpte ] [-xy|-upvp]

       [-red rx ry]

       [-green gx gy]

       [-blue bx by]

       [-white wx wy]

       [-size edge]

       [{-xsize|-width} width]

       [{-ysize|-height} height]

       [-noblack] [-nowpoint] [-nolabel] [-noaxes] [-full]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmcie  creates a PPM file containing a plot of the CIE 'tongue' color chart -- to the extent possible in a PPM image.  Alternatively, creates a pseudo-PPM image of the color tongue using RGB values
       from a color system of your choice.

       The CIE color tongue is an image of all the hues that can be described by CIE X-Y chromaticity coordinates.  They are arranged on a two dimensional coordinate plane with the X  chromaticity  on  the
       horizontal axis and the Y chromaticity on the vertical scale.  (You can choose alternatively to use CIE u'-v' chromaticity coordinates, but the general idea of the color tongue is the same).

       Note that the PPM format specifies that the RGB values in the file are from the ITU-R Recommendation BT.709 color system, gamma-corrected.  And positive.  See ppm(5)
        for  details.   If  you  use one of the color system options on ppmcie, what you get is not a true PPM image, but is very similar.  If you display such ppmcie output using a device that expects PPM
       input (which includes just about any computer graphics display program), it will display the wrong colors.

       However, you may have a device that expects one of these variations on PPM.

       In every RGB color system you can specify, including the default (which produces a true PPM image) there are hues in the color tongue that can't be represented.   For  example,  monochromatic  blue-
       green with a wavelength of 500nm cannot be represented in a PPM image.

       For these hues, ppmcie substitutes a similar hue as follows: They are desaturated and rendered as the shade where the edge of the Maxwell triangle intersects a line drawn from the requested shade to
       the white point defined by the color system's white point.  Furthermore, unless you specify the -full option, ppmcie reduces their intensity by 25% compared to the true hues in the image.

       ppmcie draws and labels the CIE X-Y coordinate axes unless you choose otherwise with options.

       ppmcie draws the Maxwell triangle for the color system in use on the color tongue.  The Maxwell triangle is the triangle whose vertices are the primary illuminant hues for  the  color  system.   The
       hues  inside  the  triangle show the color gamut for the color system.  They are also the only ones that are correct for the CIE X-Y chromaticity coordinates shown.  (See explanation above).  ppmcie
       denotes the Maxwell triangle by rendering it at full brightness, while rendering the rest of the color tongue as 3/4 brightness.  You can turn this off with options.

       ppmcie also places a black cross at the color system's white point (with the center of the cross open so you can actually see the white color) and displays in text the CIE X-Y chromaticities of  the
       primary illuminants and white point for the color system.  You can turn this off with options, though.

       ppmcie annotates the periphery of the color tongue with the wavelength, in nanometers of the monochromatic hues which appear there.

       ppmcie displays the black body chromaticity curve for Planckian radiators from 1000 to 30000 kelvins on the image.  This curve traces the colors of black bodies as various temperatures.

       You can choose from several standard color systems, or specify one of your own numerically.

       CIE  charts,  by  their very nature, contain a very large number of colors.  If you're encoding the chart for a color mapped device or file format, you'll need to use pnmquant or ppmdither to reduce
       the number of colors in the image.


OPTIONS
       You may abbreviate any option to its shortest unique prefix.



       -rec709

       -cie

       -ebu

       -hdtv

       -ntsc

       -smpte Select a standard color system whose gamut to plot.  The default is -rec709, which chooses ITU-R Recommendation BT.709, gamma-corrected.  This is the only color system for which ppmcie's out-
              put  is a true PPM image.  See explanation above.  -ebu chooses the primaries used in the PAL and SECAM broadcasting standards.  -ntsc chooses the primaries specified by the NTSC broadcasting
              system (few modern monitors actually cover this range).  -smpte selects the primaries recommended by the Society of Motion Picture and Television Engineers  (SMPTE)  in  standards  RP-37  and
              RP-145, and -hdtv uses the much broader HDTV ideal primaries.  -cie chooses a color system that has the largest possible gamut within the spectrum of the chart.  This is the same color system
              as you get with the -cie option to John Walker's cietoppm program.


       -xy    plot CIE 1931 x y chromaticities.  This is the default.


       -upvp  plot u' v' 1976 chromaticities rather than CIE 1931 x y chromaticities.  The advantage of u' v' coordinates is that equal intervals of distance on the u' v' plane correspond  roughly  to  the
              eye's ability to discriminate colors.


       -red rx ry
              specifies the CIE x and y co-ordinates of the red illuminant of a custom color system and selects the custom system.


       -green gx gy
              specifies the CIE x and y co-ordinates of the green illuminant of the color system and selects the custom system.


       -blue bx by
              specifies the CIE x and y co-ordinates of the blue illuminant of the color system and selects the custom system.


       -white wx wy
              specifies the CIE x and y co-ordinates of the white point of the color system and selects the custom system.


       -size edge
              Create an image of edge by edge pixels.  The default is 512x512.


       -xsize|-width width
              Sets  the  width  of  the  generated  image to width pixels.  The default width is 512 pixels.  If the height and width of the image are not the same, the CIE diagram will be stretched in the
              longer dimension.


       -ysize|-height height
              Sets the height of the generated image to height pixels.  The default height is 512 pixels.  If the height and width of the image are not the same, the CIE diagram will be  stretched  in  the
              longer dimension.


       -noblack
              Don't plot the black body chromaticity curve.


       -nowpoint
              Don't plot the color system's white point.


       -nolabel
              Omit the label.


       -noaxes
              Don't plot axes.


       -full  Plot the entire CIE tongue in full brightness; don't dim the part which is outside the gamut of the specified color system (i.e. outside the Maxwell triangle).




INTERPRETATION OF COLOR CHART
       A color spectrum is a linear combination of one or more monochromatic colors.

       A  color  is  a  set of color spectra that all look the same to the human eye (and brain).  Actually, for the purposes of the definition, we assume the eye has infinite precision, so we can call two
       color spectra different colors even though they're so close a person couldn't possibly tell them apart.

       The eye contains 3 kinds of color receptors (cones).  Each has a different response to the various monochromatic colors.  One kind responds  most  strongly  to  blue,  another  red,  another  green.
       Because there are only three, many different color spectra will excite the cones at exactly the same level, so the eye cannot tell them apart.  All such spectra that excite the cones in the same way
       are a single color.

       Each point in the color tongue represents a unique color.  But there are an infinite number of color spectra in the set that is that color; i.e. an infinite number of color spectra that  would  look
       to you like this point.  A machine could tell them apart, but you could not.

       Remember  that  the colors outside the highlighted triangle are approximations of the real colors because the PPM format cannot represent them (and your display device probably cannot display them).
       That is, unless you're using a variation of PPM and a special display device, as discussed earlier in this manual.

       A color is always relative to some given maximum brightness.  A particular beam of light looks lime green if in a dim field, but pea green if in a bright field.  An image on a movie screen may  look
       pitch black because the projector is not shining any light on it, but when you turn off the projector and look at the same spot in room light, the screen looks quite white.  The same light from that
       spot hit your eye with the project on as with it off.

       The chart shows two dimensions of color.  The third is intensity.  All the colors in the chart have the same intensity.  To get all possible colors in the gamut, Make copies of the  whole  chart  at
       every intensity between zero and the maximum.

       The  edge of the tongue consists of all the monochromatic colors.  A monochromatic color is one with a single wavelength.  I.e. a color that is in a rainbow.  The numbers you see are the wavelengths
       in nanometers.

       Any straight line segment within the tongue contains colors which are linear combinations of two colors -- the colors at either end of the line segment.

       Any color in the chart can be created from two other colors (actually, from any of an infinite number of pairs of other colors).

       All the colors within a triangle inside the tongue can be created from a linear combination of the colors at the vertices of that triangle.

       Any color in the tongue can be created from at most 3 monochromatic colors.

       The highlighted triangle shows the colors that can be expressed in the tristimulus color system you chose.  (ITU-R BT.709 by default).  The corners of the triangle are the 3 primary  illuminants  in
       that  system  (a  certain  red,  green, and blue for BT.709).  The edges of the triangle, then, represent the colors you can represent with two of the primary illuminants (saturated colors), and the
       interior colors require all three primary illuminants (are not saturated).

       In the ITU-R BT.709 color system (the default), the white point is defined as D65, which is (and is named after) the color of a black body at 6502 kelvins.  Therefore, you should see the temperature
       curve on the image pass through the white part of the image, and the cross that marks the white point, at 6502 kelvins.

       D65 white is supposed to be the color of the sun.  If you have a perfect BT.709 display device, you should see the color of the sun at the white point cross.  That's an important color, because when
       you look at an object in sunlight, the color that reflects of the object is based on the color of sunlight.  Note that the sun produces a particular color spectrum, but many other color spectra  are
       the same color, and display devices never use the actual color spectrum of the sun.

       The  colors  at  the corners of the triangle have the chromaticities phosphors in a monitor that uses the selected color system.  Note that in BT.709 they are very close to monochromatic red, green,
       and blue, but not quite.  That's why you can't display even one true color of the rainbow on a video monitor.

       Remember that the chart shows colors of constant intensity, therefore the corners of the triangles are not the full colors of the primary illuminants, but only their chromaticities.   In  fact,  the
       illuminants typically have different intensities.  In BT.709, the blue primary illuminant is far more intense than the green, which is more intense than the red.  Designers did this in order to make
       an equal combination of red, green, and blue generate gray.  I.e.  a combination of full strength red, full strength green, and full strength blue BT.709 primary illuminants is D65 white.

       The tongue has a sharp straight edge at the bottom because that's the limit of human vision.  There are colors below that line, but they involve infrared and ultraviolet  light,  so  you  can't  see
       them.  This line is called the 'line of purples.'




SEE ALSO
       ppmdither(1) , pnmquant(1) , ppm(5)



AUTHOR
       Copyright (C) 1995 by John Walker (kelvin@fourmilab.ch)

       WWW home page: http://www.fourmilab.ch/ ⟨http://www.fourmilab.ch/⟩

       Permission  to use, copy, modify, and distribute this software and its documentation for any purpose and without fee is hereby granted, without any conditions or restrictions.  This software is pro-
       vided as is without express or implied warranty.



netpbm documentation                                                                            July 31, 2005                                                                           Ppmcie User Manual(0)
