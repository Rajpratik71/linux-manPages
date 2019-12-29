XREFRESH(1)                             General Commands Manual                            XREFRESH(1)

NAME
       xrefresh - refresh all or part of an X screen

SYNOPSIS
       xrefresh [-option ...]

DESCRIPTION
       Xrefresh is a simple X program that causes all or part of your screen to be repainted.  This is
       useful when system messages have messed up your screen.  Xrefresh maps a window on top  of  the
       desired area of the screen and then immediately unmaps it, causing refresh events to be sent to
       all applications.  By default, a window with no background is used, causing all applications to
       repaint  ``smoothly.''  However, the various options can be used to indicate that a solid back‐
       ground (of any color) or the root window background should be used instead.

ARGUMENTS
       -white    Use a white background.  The screen just appears to flash quickly, and then repaint.

       -black    Use a black background (in effect, turning off all of the electron guns to the tube).
                 This can be somewhat disorienting as everything goes black for a moment.

       -solid color
                 Use a solid background of the specified color.  Try green.

       -root     Use the root window background.

       -none     This is the default.  All of the windows simply repaint.

       -geometry WxH+X+Y
                 Specifies the portion of the screen to be repainted; see X(7).

       -display display
                 This  argument  allows  you  to  specify the server and screen to refresh; see X(7).

       -version  This argument prints the program version and exits.

X DEFAULTS
       The  xrefresh  program  uses the routine XGetDefault(3) to read defaults, so its resource names
       are all capitalized.

       Black, White, Solid, None, Root
               Determines what sort of window background to use.

       Geometry
               Determines the area to refresh.  Not very useful.

ENVIRONMENT
       DISPLAY - To get default host and display number.

SEE ALSO
       X(7)

BUGS
       It should have just one default type for the background.

AUTHORS
       Jim Gettys, Digital Equipment Corp., MIT Project Athena

X Version 11                                xrefresh 1.0.6                                 XREFRESH(1)
