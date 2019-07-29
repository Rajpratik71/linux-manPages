WMDOCKER(1)                                                   General Commands Manual                                                  WMDOCKER(1)

NAME
       wmdocker - System tray for KDE3/GNOME2 docklet applications

SYNOPSIS
       wmdocker [options]

DESCRIPTION
       This  manual  page  documents  briefly the wmdocker command.  This manual page was written for the Debian distribution because the original
       program does not have a manual page.

       wmdocker is a docking application (WindowMaker dock app) which acts as a system tray for KDE3 and GNOME2. It can be  used  to  replace  the
       panel in either environment, allowing you to have a system tray without running the KDE/GNOME panel.

       Docker was written and designed to work with Openbox 2, but it should work fine in any window manager that supports WindowMaker dock apps.

OPTIONS
       -h-help
              Show summary of options.

       -display DISPLAY
              The X display to connect to.

       -border N
              The width of the border to put around the system tray icons. Defaults to 1.

       -vertical
              Line up the icons vertically. Defaults to horizontally.

       -wmaker
              WindowMaker mode. This makes wmdocker a fixed size (64x64) to appear nicely in in WindowMaker.  Note: In this mode, you have a fixed
              number of icons that wmdocker can hold.

       -iconsize SIZE
              The size (width and height and height) to display icons as in the system tray. Defaults to 24.

       -color COLOR
              The background color to use for the tray. Defaults to whatever color the window manager specifies.

AUTHOR
       This manual page was written by Ari Pollak <ari@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                 November 2, 2002                                                      WMDOCKER(1)
