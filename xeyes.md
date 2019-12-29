XEYES(1)                                General Commands Manual                               XEYES(1)

NAME
       xeyes - a follow the mouse X demo

SYNOPSIS
       xeyes [-option ...]

DESCRIPTION
       Xeyes watches what you do and reports to the Boss.

OPTIONS
       -fg foreground color
               choose a different color for the pupil of the eyes.

       -bg background color
               choose a different color for the background.

       -outline outline color
               choose a different color for the outline of the eyes.

       -center center color
               choose a different color for the center of the eyes.

       -backing { WhenMapped Always NotUseful }
               selects an appropriate level of backing store.

       -geometry geometry
               define the initial window geometry; see X(7).

       -display display
               specify the display to use; see X(7).

       -bd border color
               choose a different color for the window border.

       -bw border width
               choose a different width for the window border.

       -shape  uses the SHAPE extension to shape the window.  This is the default.

       +shape  disables use of the SHAPE extension to shape the window.

       -render uses Xrender to draw anti-aliased eyes.  This is the default if xeyes has been compiled
               with Xrender support.

       +render disables Xrender and draws traditional eyes.

       -distance
               uses an alternative mapping, as if the eyes were set back from the screen, thus follow‐
               ing the mouse more precisely.

SEE ALSO
       X(7), X Toolkit documentation
       See X(7) for a full statement of rights and permissions.

AUTHOR
       Keith Packard, MIT X Consortium
       Copied from the NeWS version written (apparently) by Jeremy Huxtable as seen at SIGGRAPH '88

X Version 11                                  xeyes 1.1.2                                     XEYES(1)
