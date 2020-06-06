XSTDCMAP(1)                                                                              General Commands Manual                                                                              XSTDCMAP(1)

NAME
       xstdcmap - X standard colormap utility

SYNOPSIS
       xstdcmap [-all] [-best] [-blue] [-default] [-delete map] [-display display] [-gray] [-green] [-help] [-red] [-verbose] [-version]

DESCRIPTION
       The  xstdcmap utility can be used to selectively define standard colormap properties.  It is intended to be run from a user's X startup script to create standard colormap definitions in order to
       facilitate sharing of scarce colormap resources among clients.  Where at all possible, colormaps are created with read-only allocations.

OPTIONS
       The following options may be used with xstdcmap:

       -all    This option indicates that all six standard colormap properties should be defined on each screen of the display.  Not all screens will support visuals under which all six  standard  col‐
               ormap  properties  are meaningful.  xstdcmap will determine the best allocations and visuals for the colormap properties of a screen. Any previously existing standard colormap properties
               will be replaced.

       -best   This option indicates that the RGB_BEST_MAP should be defined.

       -blue   This option indicates that the RGB_BLUE_MAP should be defined.

       -default
               This option indicates that the RGB_DEFAULT_MAP should be defined.

       -delete map
               This option specifies that a specific standard colormap property, or all such properties, should be removed.  map may be one of: default, best, red, green, blue, gray, or all.

       -display display
               This option specifies the host and display to use; see X(7).

       -gray   This option indicates that the RGB_GRAY_MAP should be defined.

       -green  This option indicates that the RGB_GREEN_MAP should be defined.

       -help   This option indicates that a brief description of the command line arguments should be printed on the standard error.  This will be done whenever an unhandled argument is given to  xstd‐
               cmap.

       -red    This option indicates that the RGB_RED_MAP should be defined.

       -verbose
               This option indicates that xstdcmap should print logging information as it parses its input and defines the standard colormap properties.

       -version
               This option indicates that xstdcmap should print its version and exit.

ENVIRONMENT
       DISPLAY to get default host and display number.

SEE ALSO
       X(7)

AUTHOR
       Donna Converse, MIT X Consortium

X Version 11                                                                                  xstdcmap 1.0.3                                                                                  XSTDCMAP(1)
