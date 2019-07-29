OCLOCK(1)                                                     General Commands Manual                                                    OCLOCK(1)

NAME
       oclock - round X clock

SYNOPSIS
       oclock [-option ... ]

DESCRIPTION
       Oclock simply displays the current time on an analog display.

OPTIONS
       -fg color
               choose a different color for the both hands and the jewel of the clock

       -bg color
               choose a different color for the background.

       -jewel color
               choose a different color for the jewel on the clock.

       -minute color
               choose a different color for the minute hand of the clock.

       -hour color
               choose a different color for the hour hand of the clock.

       -backing { WhenMapped Always NotUseful }
               selects an appropriate level of backing store.

       -geometry geometry
               define the initial window geometry; see X(7).

       -display display
               specify the display to use; see X(7).

       -bd color
               choose a different color for the window border.

       -bw width
               choose  a  different width for the window border.  As the Clock widget changes its border around quite a bit, this is most usefully
               set to zero.

       -shape  causes the clock to use the Shape extension to create an oval window.  This is the default unless the shapeWindow resource  is  set
               to false.

       -noshape
               causes the clock to not reshape itself and ancestors to exactly fit the outline of the clock.

       -transparent
               causes the clock to consist only of the jewel, the hands, and the border.

COLORS
       If you would like your clock to be viewable in color, include the following in the #ifdef COLOR section you read with xrdb:

       *customization:                 -color

       This  will  cause  oclock to pick up the colors in the app-defaults color customization file: /usr/lib/X11/app-defaults/Clock-color.  Below
       are the default colors:

       Clock*Background: grey
       Clock*BorderColor: light blue
       Clock*hour: yellow
       Clock*jewel: yellow
       Clock*minute: yellow

SEE ALSO
       X(7), X Toolkit documentation

AUTHOR
       Keith Packard, MIT X Consortium

X Version 11                                                       oclock 1.0.3                                                          OCLOCK(1)
