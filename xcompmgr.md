xcompmgr(1)                                                   General Commands Manual                                                  xcompmgr(1)

NAME
       xcompmgr - sample X compositing manager

SYNOPSIS
       xcompmgr [-d display] [-r radius] [-o opacity] [-l left-offset] [-t top-offset] [-acCfFnsS]

DESCRIPTION
       xcompmgr is a sample compositing manager for X servers supporting the XFIXES, DAMAGE, and COMPOSITE extensions.  It enables basic eye-candy
       effects.

OPTIONS
       -d display
              Specifies the display to manage.

       -r radius
              Specifies the blur radius for client-side shadows.

       -o opacity
              Specifies the opacity for client-side shadows.

       -l left-offset
              Specifies the left offset for client-side shadows.

       -t top-offset
              Specifies the top offset for client-side shadows.

       -I fade-in-step
              Specifies the opacity change between steps while fading in.

       -O fade-out-step
              Specifies the opacity change between steps while fading out.

       -D fade-delta
              Specifies the time (in milliseconds) between steps in a fade.

       -a     Automatic server-side compositing.  This instructs the server to use the standard composition rules.  Useful for debugging.

       -c     Client-side compositing with soft shadows and translucency support.

       -f     When -c is specified, enables a smooth fade effect for transient windows like menus, and for all windows on hide and restore events.

       -n     Simple client-side compositing. This is the default mode.

       -s     Server-side compositing with hard-edged shadows.

       -C     When -c is specified, attempts to avoid painting shadows on panels and docks.

       -F     When -f is specified, also enables the fade effect when windows change their opacity, as with transset(1).

       -S     Enables synchronous operation.  Useful for debugging.

BUGS
       Probably.  Please report any you find to http://bugs.freedesktop.org/.

AUTHORS
       Keith Packard, with contributions from Matthew Allum, Eric Anholt, Dan Doel, Thomas Luebking, Matthew Hawn, Ely Levy,  Phil  Blundell,  and
       Carl Worth.

X Version 11                                                      xcompmgr 1.1.7                                                       xcompmgr(1)
