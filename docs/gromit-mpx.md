GROMIT-MPX(1)                                                 General Commands Manual                                                GROMIT-MPX(1)

NAME
       Gromit-MPX - Presentation helper to make annotations on screen

SYNOPSIS
       gromit-mpx [options]

DESCRIPTION
       Gromit-MPX enables you to make multi-pointer annotations on your screen. It can run in the background and be activated on demand to let you
       draw over all your currently running applications. The drawing will stay on screen as long as you want, you can continue to use your appli‐
       cations while the drawing is visible.
       Gromit-MPX is XInput-Aware, so if you have a graphic tablet you can draw lines with different strength, colour, erase things, etc.
       Since  you  typically  want  to  use  the program you are demonstrating and highlighting something is a short interruption of you workflow,
       Gromit-MPX is activated by either a hotkey or a repeated invocation of Gromit-MPX (the latter can e.g. used by other applications  or  your
       windowmanager).

KEYBOARD CONTROL
       By  default,  Gromit-MPX  grabs  the "Pause" key, making it unavailable to other applications.  (The use of "Pause" is Debian-specific: the
       upstream package uses "F9".  The hotkey can be changed using the "--key" option.)  The available shortcuts are:

       Pause  toggle painting

       SHIFT-Pause
              clear screen

       CTRL-Pause
              toggle visibility

       ALT-Pause
              quit Gromit-MPX

OPTIONS (STARTUP)
       A short summary of the available commandline arguments for invoking Gromit-MPX, see below for the options to  control  an  already  running
       Gromit-MPX process:

       -a, --active
              start Gromit-MPX and immediately activate it.

       -k <keysym>, --key <keysym>
              will  change  the  key used to grab the mouse. <keysym> can e.g. be "F9", "F12", "Control_R" or "Print". To determine the keysym for
              different keys you can use the xev(1) command. You can specify "none" to prevent Gromit-MPX from grabbing a key.

       -K <keycode>, --keycode <keycode>
              will change the key used to grab the mouse. Under rare circumstances identifying the key with the keysym can fail. You can then  use
              the keycode to specify the key uniquely. To determine the keycode for different keys you can use the xev(1) command.

       -u <keysym>, --undo-key <keysym>
              will change the key used to undo/redo strokes. <keysym> can e.g. be "F9", "F12", "Control_R" or "Print". To determine the keysym for
              different keys you can use the xev(1) command. You can specify "none" to prevent Gromit-MPX from grabbing a key.

       -U <keycode>, --undo-keycode <keycode>
              will change the key used to undo/redo strokes. Under rare circumstances identifying the key with the keysym can fail. You  can  then
              use the keycode to specify the key uniquely. To determine the keycode for different keys you can use the xev(1) command.

       -d, --debug
              gives some debug output.

OPTIONS (CONTROL)
       A sort summary of the available commandline arguments to control an already running Gromit-MPX process, see above for the options available
       to start Gromit-MPX.

       -q, --quit
              will cause the main Gromit-MPX process to quit.

       -t, --toggle
              will toggle the grabbing of the cursor.

       -v, --visibility
              will toggle the visibility of the window.

       -c, --clear
              will clear the screen.

       -z, --undo
              will undo the last drawing stroke.

       -y, --redo
              will redo the last undone drawing stroke.

BUGS
       When there is no compositing manager such as Compiz or xcompmgr running, Gromit-MPX falls back to a legacy drawing mode. This  may  drasti‐
       cally  slow  down your X-Server, especially when you draw very thin lines. It makes heavy use of the shape extension, which is quite expen‐
       sive if you paint a complex pattern on screen. Especially terminal-programs tend to scroll incredibly slow if  something  is  painted  over
       their window.

AUTHORS
       Simon Budig <simon@gimp.org> Christian Beier <dontmind@freeshell.org>

       This  manual page was written by Pierre Chifflier <chifflier@cpe.fr> and Simon Budig for the original Gromit and extended for Gromit-MPX by
       Christian Beier.

                                                                 February 10, 2011                                                   GROMIT-MPX(1)
