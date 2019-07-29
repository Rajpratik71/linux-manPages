xscreensaver-gl-helper(6x)                                                                   XScreenSaver manual                                                                   xscreensaver-gl-helper(6x)



NAME
       xscreensaver-gl-helper - figure out which X visual to use for GL programs

SYNOPSIS
       xscreensaver-gl-helper [-display host:display.screen]

DESCRIPTION
       This  program  prints the ID of the visual that should be used for proper operation of OpenGL programs.  This program only exists so that the xscreensaver(1) daemon does not need to link against the
       OpenGL library.

ENVIRONMENT
       DISPLAY to get the default host, display, and screen number.

SEE ALSO
       X(1), xdpyinfo(1), xglinfo(1), glxinfo(1), glxdpyinfo(1), xscreensaver(1), xscreensaver-demo(1), xscreensaver-command(1)

COPYRIGHT
       Copyright © 2000 by Jamie Zawinski.  Permission to use, copy, modify, distribute, and sell this software and its documentation for any purpose is hereby granted without fee, provided that the  above
       copyright  notice  appear  in all copies and that both that copyright notice and this permission notice appear in supporting documentation.  No representations are made about the suitability of this
       software for any purpose.  It is provided "as is" without express or implied warranty.



X Version 11                                                                                  5.22 (16-Jul-2013)                                                                   xscreensaver-gl-helper(6x)
