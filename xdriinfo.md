xdriinfo(1)                                                                              General Commands Manual                                                                              xdriinfo(1)

NAME
       xdriinfo - query configuration information of DRI drivers

SYNOPSIS
       xdriinfo [-display displayname] [-version] [command]

DESCRIPTION
       xdriinfo can be used to query configuration information of direct rendering drivers. If no command argument is specified it lists the names of the direct rendering drivers for all screens.

       Valid options are:

       -display
              Specifies X server to connect to.

       -version
              Print the program version and exit.

       Valid commands are:

       nscreens
              Print the number of screens.

       driver screen
              Print the name of the direct rendering driver for screen.

       options screen|driver
              Print  the  XML document describing the configuration options of a driver. The driver can be specified directly by driver name or indirectly by screen number. If the driver name is speci‐
              fied directly then no X connection is needed.

ENVIRONMENT
       DISPLAY
              The default display.

SEE ALSO
       X(7), xdpyinfo(1), xwininfo(1), xvinfo(1), glxinfo(1), xprop(1)

AUTHOR
       Felix Kuehling

X Version 11                                                                                  xdriinfo 1.0.5                                                                                  xdriinfo(1)
