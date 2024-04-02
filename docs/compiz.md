COMPIZ(1)                                                     General Commands Manual                                                    COMPIZ(1)

NAME
       compiz - OpenGL window and compositing manager

SYNOPSIS
       compiz [options] [plugins]

DESCRIPTION
       compiz is a compositing window-manager using OpenGL for rendering.

OPTIONS
       --display DISPLAY
              Manage the display called DISPLAY instead of the name obtained from the $DISPLAY environment variable.

       --bg-image IMAGE
              Use IMAGE as background image.

       --refresh-rate RATE
              Set the default refresh rate.

       --fast-filter
              Use a fast texture filter.

       --indirect-rendering
              Force an indirect rendering context. Use this when running compiz on AIGLX.

       --loose-binding
              Disable  strict binding of textures. This may improve performance in some situations (running on XGL). As opposed to strict binding,
              however, this isn't guaranteed to work. Use with care.

       --replace
              Replace any existing window managers on the given X display.

       --sm-disable
              Disable the session management.

       --sm-client-id ID
              Use the given ID as the client ID for session management.

       --no-detection
              Disable output screen detection.

       --no-fbo
              Disable the use of FBOs (frame buffer objects). This can be useful to work around drivers with broken FBO implementations.

       --ignore-desktop-hints
              Do not use desktop hints (number of desktops, current desktop) as left by the previous window manager.

       --only-current-screen
              Manage only the screen defined by $DISPLAY (or given by the --display option) and leave all other screens alone.

       --use-root-window
              Use the root window instead of the composite overlay window for drawing.

       --version
              Show the compiz version string.

       --help Show a summary of the command-line options.

AUTHOR
       compiz was written by David Reveman <davidr@novell.com> and others.

       This manual page was written by Thierry Reding <thierry@gilfi.de>, for the Debian project (but may be used by others).

                                                                   July 13, 2007                                                         COMPIZ(1)
