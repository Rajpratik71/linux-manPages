xrestop(1)                                                                                 General Commands Manual                                                                                 xrestop(1)



NAME
       xrestop - monitor server resources used by X11 clients

SYNOPSIS
       xrestop -help
       xrestop [ -display display ] [ --batch ] [ --delay-time seconds ]

DESCRIPTION
       Xrestop  uses  the  X-Resource  extension to provide 'top'-like statistics of each connected X11 client's server-side resource usage.  It is intended as a developer tool to aid more efficient server
       resource usage and debug server-side resource leakage.

OPTIONS
       --help Show usage.

       --display, -d <display>
              Specify X11 display to monitor.

       --delay-time, -dt <seconds>
              Time in seconds between taking samples. Default is 2 seconds.

       --batch, -b
              Run in batch mode. Slightly more detailed infomation is streamed to stdout rather than the usual curses interface. This mode is intended for debugging a single client with something like
                xrestop -b | grep -A 14 appname

       --max-samples, -m <count>
              Specify number of times to gather and display results.  Default is continuous, which can be set with 0 (zero).

SEE ALSO
       X(7), top(1).

BUGS
       The X-Resource extension is very new and may not be 100% accurate.

AUTHOR
       xrestop was written by Matthew Allum <mallum@handhelds.org>.



                                                                                                                                                                                                   xrestop(1)
