glxinfo(1)                                                    General Commands Manual                                                   glxinfo(1)

NAME
       glxinfo - show information about the GLX implementation

SYNOPSIS
       glxinfo [options]

DESCRIPTION
       The glxinfo program shows information about the OpenGL and GLX implementations running on a given X display.

       The information includes details about the server- and client-side GLX implementation, the OpenGL and GLU implementations as well as a list
       of available GLX visuals.

OPTIONS
       -v      Print visuals info in verbose form.

       -t      Print verbose table.

       -display display
               Specify the X display to interrogate.

       -h      Print usage information.

       -i      Force an indirect rendering context.

       -b      Find the "best" visual and print its number.

       -l      Print interesting OpenGL limits.

AUTHOR
       glxinfo was written by Brian Paul <brian.paul@tungstengraphics.com>.

       This manual page was written by Thierry Reding <thierry@gilfi.de>, for the Debian project (but may be used by others).

                                                                    2006-11-29                                                          glxinfo(1)
