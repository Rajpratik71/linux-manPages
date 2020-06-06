GNOME-SCREENSHOT(1)                                                                                                                                                                   GNOME-SCREENSHOT(1)

NAME
       gnome-screenshot - capture the screen, a window, or an user-defined area and save the snapshot image to a file.

SYNOPSIS
       gnome-screenshot [ -c ]  [ -w ]  [ -a ]  [ -b ]  [ -B ]  [ -p ]  [ -d SECONDS  ]  [ -e EFFECT  ]  [ -i ]  [ -f FILENAME  ]  [ --display DISPLAY  ]

DESCRIPTION
       gnome-screenshot is a GNOME utility for taking screenshots of the entire screen, a window or an user-defined area of the screen, with optional beautifying border effects.

OPTIONS
       -c, --clipboard
              Send the grab directly to the clipboard.

       -w, --window
              Grab the current active window instead of the entire screen.

       -a, --area
              Grab an area of the screen instead of the entire screen.

       -b, --include-border
              Include the window border within the screenshot.

       -B, --remove-border
              Remove the window border from the screenshot.

       -p, --include-pointer
              Include the pointer with the screenshot.

       -d, --delay=SECONDS,
              Take the screenshot after the specified delay [in seconds].

       -e, --border-effect=EFFECT,
              Add an effect to the outside of the screenshot border.  EFFECT can be ``shadow'' (adding drop shadow), ``border'' (adding rectangular space around the screenshot), ``vintage'' (desaturat‐
              ing the screenshot slightly, tinting it and adding rectangular space around it) or ``none'' (no effect).  Default is ``none''.

       -i, --interactive
              Interactively set options in a dialog.

       -f, --file=FILENAME
              Save screenshot directly to this file.

       --display=DISPLAY
              X display to use.

       -?, -h, --help
              Show a summary of the available options.

       In addition, the usual GTK+ command line options apply.  See the output of --help for details.

AUTHOR
       This manual page was written by Christian Marillat <marillat@debian.org> for the Debian GNU/Linux system (but may be used by others).

       Updated by Theppitak Karoonboonyanan <thep@linux.thai.net>, Tom Feiner <feiner.tom@gmail.com>, Cosimo Cecchi <cosimoc@gnome.org> and others.

                                                                                             August 10, 2013                                                                          GNOME-SCREENSHOT(1)
