PnmMercator User Manual(0)                                                                                                                                                         PnmMercator User Manual(0)



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">




NAME
       pnmmercator - transform a worldmap from rectangular projection to Mercator projection and vice-versa


SYNOPSIS
       pnmmercator [-inverse] [-nomix] [-[v]verbose] [filename]

       Minimum unique abbreviation of option is acceptable.  You may use double hyphens instead of single hyphen to denote options.


DESCRIPTION
       This program is part of Netpbm(1)

       The  pnmmercator  utility,  converts a rectangular projection worldmap to a Mercator projection format, as used for maps.google.com and many other online maps.  The map used as input for pnmmercator
       must have rows for -90 to 90 degrees latitude and columns for -180 to +180 degrees longitude. The file will typically be twice as wide as high, but this is not a requirement. The output file will be
       using the Mercator projection ⟨http://en.wikipedia.org/wiki/Mercator_projection⟩  and will get double the height of the input file.

       Maps  using the Mercator projection are stretched more the closer a row is to the North or South Pole. The last few degrees (> 85 or < -85 degrees) are not part of a Mercator map at all because they
       would be stretched too much and the rows close to the edge will show banding, because they originate from the same row in the original map.

       To overcome this, the program will by default do interpolation of pixel colors, which will eliminate the banding effect, but will cause some blurring of the output.  With  the  -nomix  option,  this
       interpolation  of  colors isn't applied. You can obtain the highest quality output by starting with an input map of high resolution, so that you can follow the pnmmercator transformation with a pam-
       scale reduction in size.

       This program can also convert a Mercator projection map back to a rectangular projection based.  As said, the Mercator map doesn't have information about the latitudes close to the poles.  Therefore
       the top rows in the output image will be identical and copied from the row corresponding with latitude of 85 degrees. The same at the bottom of the map.

       Pnmmercator doesn't have any provision for scaling the image. You can scale by piping the output of the program through Netpbm programs such as pamscale.

       You can find maps to be used as input at flatplanet.sourceforge.net(1)

       or uic.edu/pape ⟨http://www.evl.uic.edu/pape/data/Earth/⟩ .

       The point of a Mercator projection map is that compass directions work on it.  If you draw a straight line northeast from some point on the Mercator map, the line traces the course you would sail if
       you sailed a compass bearing of northeast from that spot.  Naturally, primitive navigators appreciated that.  The biggest drawback of Mercator is that areas to the north and south appear much larger
       than  they are in real life.  For example, Greenland appears to be larger than South America even though it only a ninth as large.  Note that areas away from the equator are stretched north-south as
       well as east-west.

       A rectangular projection is one where vertical distance is proportional to angular latitude distance of the represented area and horizontal distance is proportional to angular longitude.



PARAMETERS
       filename is the name of the input file.  If you don't specify this, pnmmercator reads the image from standard Input.


OPTIONS
       <dl compact="compact">

       -inverse

              With this option a conversion from Mercator to degrees is applied.The output image will have half the height of the input map.


       -nomix

              Default behaviour is that color blending is applied in between two adjacent rows. If you specify the -nomix parameter there is no blending. The consequence is a banding at the top and  bottom
              of the map.  With this option, the output map will also consist of exactly the same colors as the input.


       -verbose and -vverbose

              This parameter outputs some additional information. If you double the 'v', it will output debug data about the lat/long degree and Mercator conversions.




SEE ALSO
       pnm(1)
        and pamscale(1)

       ppmglobe(1)



HISTORY
       pnmmercator was new in Netpbm 10.49 (December 2009).


AUTHORS
       Willem van Schaik (of pnmtopng/pngtopnm fame) wrote this program in October 2009 and suggested it for inclusion in Netpbm.



netpbm documentation                                                                             October 2009                                                                      PnmMercator User Manual(0)
