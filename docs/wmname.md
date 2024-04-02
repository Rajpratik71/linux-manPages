WMNAME(1)                                                         suckless-tools                                                         WMNAME(1)

NAME
       wmname - prints/sets window manager name

SYNOPSIS
       wmname [-v] [ WM_NAME ]

DESCRIPTION
       wmname prints or sets the window manager name property of the root window, somewhat similar to how hostname(1) acts for network identities.
       Without argument the EWMH name is recovered and printed.

       wmname is a nice utility to fix problems with JDK versions and other broken programs, which are assuming a reparenting window manager.

OPTIONS
       wmname prints its version when fed with -v.

ENVIRONMENT
       wmname uses DISPLAY to determine which display to act on.

SEE ALSO
       Homepage <http://www.suckless.org/>

AUTHOR
       wmname was written by Anselm R. Garbe <garbeam@gmail.com>.

       This manual page was written by Daniel Baumann <daniel@debian.org>, for the Debian project (but may be used by others).

0.1                                                                 2008-08-03                                                           WMNAME(1)
