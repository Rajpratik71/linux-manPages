XSSSTATE(1)                                                   General Commands Manual                                                  XSSSTATE(1)

NAME
       xssstate - display X screensaver state

SYNOPSIS
       xssstate [-i] [-s] [-t] [-v]

DESCRIPTION
       xssstate will display the state of the X screensaver extension. See below what can be gathered.

OPTIONS
       -i     show the idle time of X11, in milliseconds.

       -s     show  the  current  state  of the X screensaver. There is on for the screensaver being active at the moment, off for the screensaver
              being off and disabled for the screensaver being disabled.

       -t     will show the time that needs to be waited until the screensaver should be activated, in milliseconds.

       -v     show version information

AUTHORS
       See the LICENSE file for the authors.

LICENSE
       See the LICENSE file for the terms of redistribution.

SEE ALSO
       slock(1) xlock(1) xss(1)

BUGS
       Please report them.

                                                                   xssstate-1.1                                                        XSSSTATE(1)
