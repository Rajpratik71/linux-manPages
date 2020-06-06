xvinfo(1)                                                                                General Commands Manual                                                                                xvinfo(1)

NAME
       xvinfo - Print out X-Video extension adaptor information

SYNOPSIS
       xvinfo [-display displayname]

DESCRIPTION
       xvinfo prints out the capabilities of any video adaptors associated with the display that are accessible through the X-Video extension.

OPTIONS
       -display display
               This argument allows you to specify the server to query; see X(7).

       -short  Output less details, to reduce the amount of text.

       -version
               Output program version, then exit.

ENVIRONMENT
       DISPLAY This variable may be used to specify the server to query.

SEE ALSO
       X(7), xdpyinfo(1), xwininfo(1), xdriinfo(1), glxinfo(1), xprop(1)

AUTHORS
       Mark Vojkovich

X Version 11                                                                                   xvinfo 1.1.3                                                                                     xvinfo(1)
