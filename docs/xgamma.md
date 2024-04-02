xgamma(1)                                                                               General Commands Manual                                                                              xgamma(1)

NAME
       xgamma - Alter a monitor's gamma correction through the X server

SYNOPSIS
       xgamma [-display display] [-screen screen] [-quiet] [-version] [-gamma f.f | [[-rgamma f.f] [-ggamma f.f] [-bgamma f.f]]]

DESCRIPTION
       xgamma allows X users to query and alter the gamma correction of a monitor via the X video mode extension (XFree86-VidModeExtension).

       Note that the xgamma utility is obsolete and deficient, xrandr should be used with drivers that support the XRandr extension.

       If no value for the gamma correction is given via the -gamma or -rgamma/-ggamma/-bgamma options, xgamma prints the current gamma correction of the display.

OPTIONS
       -display display
               This argument allows you to specify the server to connect to; see X(7).

       -screen screen
               When multiple displays are configured as a single logical display, this option allows you to select the screen you wish to change.

       -quiet  Silence the normal output of xgamma

       -help   Print out the `Usage:' command syntax summary.

       -version
               Print out the program version and exit.

       -gamma f.f
               The gamma correction can either be defined as a single value, or separately for the red, green and blue components. This argument specifies the gamma correction as a single value.

       -rgamma f.f
               This argument specifies the red component of the gamma correction.

       -ggamma f.f
               This argument specifies the green component of the gamma correction.

       -bgamma f.f
               This argument specifies the blue component of the gamma correction.

ENVIRONMENT
       DISPLAY To get default host and display number.

BUGS
       This client changes the internal values of the gamma correction for the Xserver. Whether or not these values are respected depends on the video drivers.

       The gamma values are passed to the Xserver with 3 decimal places of accuracy.

SEE ALSO
       xvidtune(1), xrandr(1)

AUTHORS
       Kaleb S. Keithley, X Consortium.
       David Dawes, David Bateman

X Version 11                                                                                 xgamma 1.0.6                                                                                    xgamma(1)
