Pamtosvg User Manual(0)                                                                                                                                                               Pamtosvg User Manual(0)



NAME
       pamtosvg - convert a Netpbm image to a SVG (Scalable Vector Graphics) image


SYNOPSIS
       pamtosvg

       [-background-color=colorname] [-centerline] [-corner-threshold=angle] [-corner-always-threshold=angle] [-corner-surround=integer] [-tangent-surround=integer] [-error-threshold=float] [-filter-itera-
       tions=count] [-line-reversion-threshold=float] [-line-threshold=float] [-width-weight-factor=float] [-preserve-width] [-remove-adjacent-corners] [-log] [-report-progress] [pnmfile]

       Minimum unique abbreviation of option is acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of  the  equals  sign  to  separate  an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamtosvg reads a PNM image as input and produce an SVG (Scalable Vector Graphics) image as output.  Thus, it traces curves in the input image and creates a set of splines that represent the image.

       SVG  is  a  vector image format, which means it describes curves that compose an image.  By contrast, PNM is a raster format, which means it describes dots that compose an image.  The main practical
       difference between the two types is that you can scale vector images better.  A vector image also takes a lot less data to describe an image if the image is composed of simple curves.

       That means it is really an understatement to say that pamtosvg is an image format converter.  It's really an image tracer.  Its main job is to trace a raster image and find the lines in it.  It then
       represents its findings in SVG format.

       pamtosvg does the same kind of thing that StreamLine, CorelTrace, and Autotrace do.  It is in fact derived from Autotrace.

       SVG is a gigantic format, capable of amazing things.  pamtosvg exploits only a morsel of it.  The SVG image produced by pamtosvg consists of a single <svg> element, which has a 'width' attribute and
       a 'height' attribute.  The value of that element is composed of <path> elements.  That's it.

       In the SVG output, distances are unitless, with one unit corresponding to one pixel of the input.

       So that pamtosvg will find simple curves in the image, you may want to remove speckles from it with pbmclean and consolidate multiple shades into single colors with pnmquant first.

       For more information on SVG, see the Worldwide Web Consortium's SVG web page ⟨http://www.w3.org/Graphics/SVG/⟩ .



OPTIONS
       -background-color=colorname
              Treat the specified color as the background color and ignore it.

              If you don't specify this option, pamtosvg does not recognize any background color.

              Specify the color (colorname) as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .


       -centerline
              Trace an object's centerline.

              By default, pamtosvg traces an object's outline.


       -corner-always-threshold=angle
              Consider any angle at a pixel which falls below angle angle (in decimal floating point degrees) as a corner, even if it is bordered by other corner pixels.  Default is 60 degrees.


       -corner-surround=integer
              Consider the specified number of pixels on either side of a point when determining if that point is a corner.  Default is 4.


       -corner-threshold=angle
              Consider any pixel which forms an angle with its predecessors and successors that is smaller than angle (in decimal floating point degrees) as a corner.  Default is 100.


       -error-threshold=float
              Subdivide fitted curves that are offset by a number of pixels exceeding the specified number.  Default is 2.0.


       -filter-iterations=integer
              Smooth the curve the specified number of times prior to fitting Default is 4.


       -line-reversion-threshold=float
              When a spline is closer to a straight line than the specified real number weighted by the square of the curve length, maintain it as a straight line, even if it is a list with curves.

              Default is .01.


       -line-threshold=float
              If a spline does not deviate from the straight line defined by its endpoints by more than the specified number of pixels, then treat it as a straight line.

              Default is 1.


       -log   Create a log of the curve tracing process (suitable for debugging).  Put it in the file named inputfile.log in the current directory, where inputfile is the root of the input  file  name,  or
              'pamtosvg' if the input is from Standard Input or a file with a weird name.


       -preserve-width
              Preserve line width prior to thinning.  Meaningful only with -centerline.


       remove-adjacent-corners
              Remove adjacent corners.


       -report-progress
              Report the progress of the tracing to Standard Error as it happens.


       -tangent-surround
              Consider the specified number of points to either side of a point when computing the tangent at that point.  Default is 3.


       -width-weight-factor
              Weight factor for fitting the linewidth.





Application Notes
       A convenient way to view an SVG document is with a web browser.  Many understand a file whose name ends in '.svg' to be an SVG image and can render it.



SEE ALSO
       pnmquant(1) , pbmclean(1) , pnm(5) , Autotrace ⟨http://autotrace.sourceforge.net⟩


HISTORY
       pamtosvg was added to Netpbm in Version 10.33 (March 2006).

       The  core of pamtosvg -- the curve tracing logic -- was taken nearly unmodified from Martin Weber's Autotrace program.  That program duplicates a lot of Netpbm function, so pamtosvg is a much leaner
       program.

       Bryan Henderson created pamtosvg, basically just by adapting Autotrace to Netpbm.

       Autotrace was first released in 2000 and updates were released through 2002.  A number of people wrote the code in it, but Masatake Yamato and Martin Weber appear to be the principal creators of it.

       As of June 2006, there was a Sourceforge project ⟨http://autotrace.sourceforge.net⟩  for it.



netpbm documentation                                                                            23 April 2006                                                                         Pamtosvg User Manual(0)
