I3-SENSIBLE-TERMIN(1)                                                i3 Manual                                               I3-SENSIBLE-TERMIN(1)

NAME
       i3-sensible-terminal - launches $TERMINAL with fallbacks

SYNOPSIS
       i3-sensible-terminal [arguments]

DESCRIPTION
       i3-sensible-terminal is invoked in the i3 default config to start a terminal. This wrapper script is necessary since there is no
       distribution-independent terminal launcher (but for example Debian has x-terminal-emulator). Distribution packagers are responsible for
       shipping this script in a way which is appropriate for the distribution.

       It tries to start one of the following (in that order):

       ·   $TERMINAL (this is a non-standard variable)

       ·   x-terminal-emulator (only present on Debian and derivatives)

       ·   urxvt

       ·   rxvt

       ·   terminator

       ·   Eterm

       ·   aterm

       ·   xterm

       ·   gnome-terminal

       ·   roxterm

       ·   xfce4-terminal

       Please don’t complain about the order: If the user has any preference, they will have $TERMINAL set or modified their i3 configuration
       file.

SEE ALSO
       i3(1)

AUTHOR
       Michael Stapelberg and contributors

i3 4.11                                                             10/24/2015                                               I3-SENSIBLE-TERMIN(1)
