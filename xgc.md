XGC(1)                                                        General Commands Manual                                                       XGC(1)

NAME
       xgc - X graphics demo

SYNOPSIS
       xgc [-toolkitoption ...]

DESCRIPTION
       The  xgc  program demonstrates various features of the X graphics primitives.  In X, most of the details about the graphics to be generated
       are stored in a resource called a graphics context (GC).  The xgc program provides a user interface  for  setting  various  GC  components.
       Pressing  the  "Run" button causes these results to be displayed in the large drawing window on the right.  Timing information is displayed
       in the window immediately below.

       The items in the upper left hand window work as follows:

       Function - specify the logical function with which primitives will drawn.  The most usual setting is "set", i.e. simply  to  render  pixels
       without regard to what has been drawn before.

       LineStyle - specify whether lines should be drawn solid in foreground, dashed in foreground or alternating foreground and background.

       CapStyle - specify the appearance of the ends of a line.

       JoinStyle - specify the appearance of joints between consecutive lines drawn within a single graphics primitive.

       FillStyle - specify whether lines, text and fill requests are solid, tiled with a pixmap or stippled.

       FillRule  -  specifies  the  rule used to fill polygons.  The EvenOdd rule means that if areas overlap an odd number of times, they are not
       drawn.  Winding rule means that overlapping areas are always filled, regardless of how many times they overlap.

       ArcMode - specifies the rule for filling of arcs.  The boundary of the arc is either a Chord or two radii.

       planemask - specifies which planes of the drawing window are modified.  By default, all planes are modified.

       dashlist - specifies a pattern to be used when drawing dashed lines.

       Line Width - specifies the width in pixels of lines to be drawn.  Zero means to draw using the server's fastest algorithm with a line width
       of one pixel.

       Font - specifies the font to be used for text primitives.

       Foreground  and  Background  -  specify  the pixel values to be applied when drawing primitives.  The Foreground value is used as the pixel
       value for set bits in the source in all primitives.  The Background value is used as the pixel value for unset  bits  in  the  source  when
       using Copy Plane, drawing lines with LineStyle of DoubleDash and filling with FillStyle of OpaqueStippled.

       Percentage  of  Test  - scrollbar permits specifying only a percentage of the test to be run.  The number at the left indicates the current
       setting, which defaults to 100%.

       The window labeled "Test" permits choice of one a number of graphics primitive tests, including Points, Segments, Lines,  Arcs  and  Filled
       Arcs, 8-bit Text and Image Text, Rectangles and Filled Rectangles, Image draws, as well as Copy Plane and Copy Area.

       The window to the right of this has buttons which permit record/playback of the primitives rendered.

OPTIONS
       Xgc accepts all of the standard X Toolkit command line options.

X DEFAULTS
       This program accepts the usual defaults for toolkit applications.

ENVIRONMENT
       DISPLAY to get the default host and display number.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

SEE ALSO
       X(7)

BUGS
       This  program isn't really finished yet, but it probably never will be, since it only demonstrates the original X11 core protocol rendering
       operations, which few modern programs use anymore.

AUTHORS
       Dan Schmidt, MIT

X Version 11                                                         xgc 1.0.5                                                              XGC(1)
