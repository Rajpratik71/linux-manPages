I3-SENSIBLE-TERMIN(1)                                         General Commands Manual                                        I3-SENSIBLE-TERMIN(1)

NAME
       rofi-sensible-terminal - launches $TERMINAL with fallbacks

SYNOPSIS
       rofi-sensible-terminal [arguments]

DESCRIPTION
       rofi-sensible-terminal is invoked in the rofi default config to start a terminal. This wrapper script is necessary since there is no
       distribution-independent terminal launcher (but for example Debian has x-terminal-emulator). Distribution packagers are responsible for
       shipping this script in a way which is appropriate for the distribution.

       It tries to start one of the following (in that order):

       ·   $TERMINAL (this is a non-standard variable)

       ·   x-terminal-emulator

       ·   termite

       ·   urxvt

       ·   rxvt

       ·   terminator

       ·   Eterm

       ·   aterm

       ·   xterm

       ·   gnome-terminal

       ·   roxterm

       ·   xfce4-terminal

       Please don’t complain about the order: If the user has any preference, she will have $TERMINAL set or modified her rofi configuration file.

SEE ALSO
       rofi(1)

AUTHOR
       Dave Davenport and contributors

       Copied script from i3:
       Michael Stapelberg and contributors

                                                                                                                             I3-SENSIBLE-TERMIN(1)
