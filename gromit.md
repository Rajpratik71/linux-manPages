GROMIT(1)                                                     General Commands Manual                                                    GROMIT(1)

NAME
       Gromit - Presentation helper to make annotations on screen

SYNOPSIS
       gromit [options]

DESCRIPTION
       Gromit  enables  you  to  make annotations on your screen. It can run in the background and be activated on demand to let you draw over all
       your currently running applications. The drawing will stay on screen as long as you want, you can continue to use your  applications  while
       the drawing is visible.
       Gromit is XInput-Aware, so if you have a graphic tablet you can draw lines with different strength, color, erase things, etc.
       Since  you  typically  want  to  use  the program you are demonstrating and highlighting something is a short interruption of you workflow,
       Gromit is activated by either a hotkey or a repeated invokation of Gromit (the latter can e.g. used by other applications or  your  window‐
       manager).

KEYBOARD CONTROL
       By  default,  Gromit  grabs  the "Pause" key (this can be change using the "--key" option), making it unavailable to other application. The
       available shortcuts are:

       Pause  toggle painting

       SHIFT-Pause
              clear screen

       CTRL-Pause
              toggle visibility

       ALT-Pause
              quit Gromit

OPTIONS (STARTUP)
       A short summary of the available commandline arguments for invoking Gromit, see below for the options to control an already running  Gromit
       process:

       -a, --active
              start Gromit and immediately activate it.

       -k <keysym>, --key <keysym>
              will change the key used to grab the mouse. <keysym> can e.g. be "Pause", "F12", "Control_R" or "Print". To determine the keysym for
              different keys you can use the xev(1) command. You can specify "none" to prevent Gromit from grabbing a key.

       -K <keycode>, --keycode <keycode>
              will change the key used to grab the mouse. Under rare circumstances identifying the key with the keysym can fail. You can then  use
              the keycode to specify the key uniquely. To determine the keycode for different keys you can use the xev(1) command.

       -d, --debug
              gives some debug output.

OPTIONS (CONTROL)
       A  sort summary of the available commandline arguments to control an already running Gromit process, see above for the options available to
       start Gromit.

       -q, --quit
              will cause the main Gromit process to quit.

       -t, --toggle
              will toggle the grabbing of the cursor.

       -v, --visibility
              will toggle the visibility of the window.

       -c, --clear
              will clear the screen.

BUGS
       Gromit may drastically slow down your X-Server, especially when you draw very thin lines. It makes heavily  use  of  the  shape  extension,
       which is quite expensive if you paint a complex pattern on screen. Especially terminal-programs tend to scroll incredibly slow if something
       is painted over their window. There is nothing I can do about this.
       Gromit partially disables DnD, since it lays a transparent window across the whole screen and everything gets "dropped" to this (invisible)
       window.  Gromit tries to minimize this effect: When you clear the screen the shaped window will be hidden. It will be resurrected, when you
       want to paint something again. However: The window does not hide, if you erase everything with the eraser  tool,  you  have  to  clear  the
       screen explicitly with the "gromit --clear" command or hide Gromit with "gromit --visibility".

AUTHOR
       Simon Budig <simon@gimp.org>

       This manual page was written by Pierre Chifflier <chifflier@cpe.fr> and Simon Budig.

                                                                 January 16, 2005                                                        GROMIT(1)
