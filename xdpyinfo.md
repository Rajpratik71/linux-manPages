XDPYINFO(1)                                                                             General Commands Manual                                                                            XDPYINFO(1)

NAME
       xdpyinfo - display information utility for X

SYNOPSIS
       xdpyinfo [-display displayname] [-queryExtensions] [-ext extension-name] [-version]

DESCRIPTION
       Xdpyinfo  is  a  utility  for displaying information about an X server.  It is used to examine the capabilities of a server, the predefined values for various parameters used in communicating
       between clients and the server, and the different types of screens and visuals that are available.

       By default, numeric information (opcode, base event, base error) about protocol extensions is not displayed.  This information can be obtained with the -queryExtensions option.  Use  of  this
       option on servers that dynamically load extensions will likely cause all possible extensions to be loaded, which can be slow and can consume significant server resources.

       Detailed  information  about  a particular extension is displayed with the -ext extensionName option.  If extensionName is all, information about all extensions supported by both xdpyinfo and
       the server is displayed.

       If -version is specified, xdpyinfo prints its version and exits, without contacting the X server.

ENVIRONMENT
       DISPLAY To get the default host, display number, and screen.

SEE ALSO
       X(7), xprop(1), xrdb(1), xwininfo(1), xrandr(1), xdriinfo(1), xvinfo(1), glxinfo(1)

AUTHOR
       Jim Fulton, MIT X Consortium
       Support for the XFree86-VidModeExtension, XFree86-DGA, XFree86-Misc, and XKB extensions added by Joe Moss

X Version 11                                                                                xdpyinfo 1.3.2                                                                                 XDPYINFO(1)
