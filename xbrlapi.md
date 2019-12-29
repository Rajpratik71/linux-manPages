XBRLAPI(1)                               BrlAPI User's Manual                               XBRLAPI(1)

NAME
       xbrlapi - X11 BrlAPI helper for Linux/Unix

SYNOPSIS
       xbrlapi [option ...]

DESCRIPTION
       xbrlapi  connects to a BrlAPI server in order to provide it with the ID of the X11 window which
       currently has focus.  It also simulates X keysyms from braille key presses (else  brltty  would
       simulate them using a qwerty keyboard).

OPTIONS
       Options  are  processed  sequentially  from left to right.  If an option is specified more than
       once, or in case of a conflict, the rightmost specification takes precedence.

       The following options are supported:

       -b [host][:port] (--brlapi=)
              The BrlAPI server to connect to.

       -a string (--auth=)
              The BrlAPI authorization/authentication string.

       -d display (--display=)
              The X display to connect to.  If not specified, the content of the  DISPLAY  environment
              variable is used.

       -q (--quiet)
              Do not write any text to the braille device.

       -h (--help)
              Print a command line usage summary and then exit.

       -H (--full-help)
              Print a thorough command line usage summary and then exit.

SEE ALSO
       For   more   details   on   the   purpose   of   xbrlapi,   see   BrlAPI's  on-line  manual  at
       [http://brltty.com/doc/Manual-BrlAPI/English/BrlAPI-3.html].

BrlAPI 0.6.7                                  2018-02-01                                    XBRLAPI(1)
