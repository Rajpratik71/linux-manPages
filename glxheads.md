glxheads(1)                                                   General Commands Manual                                                  glxheads(1)

NAME
       glxheads - exercise multiple GLX connections

SYNOPSIS
       glxheads [display ...]

DESCRIPTION
       The  glxheads program will try to open GLX connections on multiple X displays as specified on the command-line. If a connection can be made
       it will try to create a direct GLX context (and fallback to using indirect contexts if that fails) and open a window displaying a  spinning
       green triangle.

       If no display names are specified, glxheads will default to opening a single local connection on display 0.

EXAMPLE
       To  open  a local connection on display 0 and two remote connections to the hosts mars (display 0) and venus (display 1), run glxheads with
       the following command-line:

          $ glxheads :0 mars:0 venus:1

AUTHOR
       glxheads was written by Brian Paul <brian.paul@tungstengraphics.com>.

       This manual page was written by Thierry Reding <thierry@gilfi.de> for the Debian project (but may be used by others).

                                                                    2006-11-29                                                         glxheads(1)
