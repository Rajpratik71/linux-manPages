Ppmglobe User Manual(0)                                                                                                                                                               Ppmglobe User Manual(0)



NAME
       ppmglobe - generate strips to glue onto a sphere


SYNOPSIS
       ppmglobe [-background=colorname] [-closeok] stripcount [filename]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       ppmglobe does the inverse of a cylindrical projection of a sphere.  Starting with a cylindrical projection, it produces an image you can cut up and glue onto a sphere to obtain the  spherical  image
       of which it is the cylindrical projection.

       What  is  a  cylindrical  projection?  Imagine a map of the Earth on flat paper.  There are lots of different ways cartographers show the three dimensional information in such a two dimensional map.
       The cylindrical projection is one.  You could make a cylindrical projection by tracing as folows: wrap a rectangular sheet of paper around the globe, touching the globe at  the  Equator.   For  each
       point of color on the globe, run a horizontal line from the axis of the globe through that point and out to the paper.  Mark the same color on the paper there.  Lay the paper out flat and you have a
       cylindrical projection.

       Here's where ppmglobe comes in:  Pass the image on that paper through ppmglobe and what comes out the other side looks something like this:

       Example of map of the earth run through ppmglobe

       You could cut out the strips and glue it onto a sphere and you'd have a copy of the original globe.

       Note that cylindrical projections are not what you normally see as maps of the Earth.  You're more likely to see a Mercator projection.  In the Mercator projection, the Earth gets  stretched  North-
       South as well as East-West as you move away from the Equator.  It was invented for use in navigation, because you can draw straight compass courses on it, but is used today because it is pretty.

       You can find maps of planets at maps.jpl.nasa.gov ⟨http://maps.jpl.nasa.gov⟩ .


PARAMETERS
       stripcount  is the number of strips ppmglobe is to generate in the output.  More strips makes it easier to fit onto a sphere (less stretching, tearing, and crumpling of paper), but makes you do more
       cutting out of the strips.

       The strips are all the same width.  If the number of columns of pixels in the image doesn't evenly divide by the number of strips, ppmglobe truncates the image on the right  to  create  nothing  but
       whole strips.  In the pathological case that there are fewer columns of pixels than the number of strips you asked for, ppmglobe fails.

       Before Netpbm 10.32 (February 2006), instead of truncating the image on the right, ppmglobe produces a fractional strip on the right.

       filename is the name of the input file.  If you don't specify this, ppmglobe reads the image from Standard Input.



OPTIONS
       -background=colorname
              This specifies the color that goes between the strips.

              Specify the color (color) as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .

              The default is black.

              This option was new in Netpbm 10.31 (December 2005).  Before that, the background is always black.


       -closeok
              This  means  it  is  OK  if  the  background isn't exactly the color you specify.  Sometimes, it is impossible to represent a named color exactly because of the precision (i.e. maxval) of the
              image's color space.  If you specify -closeok and ppmglobe can't represent the color you name exactly, it will use instead the closest color to it that is  possible.   If  you  don't  specify
              closeok, ppmglobe fails in that situation.

              This option was new in Netpbm 10.31 (December 2005).




SEE ALSO
       ppm(5)

       pnmmercator(1)



HISTORY
       ppmglobe was new in Netpbm 10.16 (June 2003).

       It is derived from Max Gensthaler's ppmglobemap.


AUTHORS
       Max Gensthaler wrote a program he called ppmglobemap in June 2003 and suggested it for inclusion in Netpbm.  Bryan Henderson modified the code slightly and included it in Netpbm as ppmglobe.



netpbm documentation                                                                           23 February 2006                                                                       Ppmglobe User Manual(0)
