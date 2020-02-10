COMPIZ(1)                                                                                General Commands Manual                                                                                COMPIZ(1)

NAME
       compiz - OpenGL window and compositing manager

SYNOPSIS
       compiz [options] [plugins]

DESCRIPTION
       compiz is a compositing window manager using OpenGL for rendering.

OPTIONS
       --debug
              Enable debug mode.

       --display DISPLAY
              Manage the display called DISPLAY instead of the name obtained from the $DISPLAY environment variable.

       --help Shows a summary of options and exit.

       --keep-desktop-hints
              Retains existing desktop hints.

       --no-auto-add-ccp
              Do not automatically load the Compiz config plugin (ccp).

       --replace
              Replaces any existing window managers on the given X display.

       --send-startup-message
              Sends a message to all connected X clientd once startup is complete.

       --sm-disable
              Disables session management.

       --sm-client-id ID
              Uses the given ID as the client ID for session management.

       --sync Makes all X calls synchronous.

       --version
              Prints the version of the program and exits.

AUTHOR
       compiz was written by David Reveman <davidr@novell.com> and others.

Compiz                                                                                          2015-07-17                                                                                      COMPIZ(1)
