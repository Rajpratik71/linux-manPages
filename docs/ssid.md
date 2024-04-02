SSID(1)                                                           suckless-tools                                                           SSID(1)

NAME
       ssid - simple setsid

SYNOPSIS
       ssid [-v] cmd [ args ]

DESCRIPTION
       ssid is an extremly simple setsid replacement.  It executes any given command after first assuming the present session identity, and possi‐
       bly after forking to get a correct process group.

OPTIONS
       ssid only prints its version when fed with -v.

NOTES
       Like with all forking software, the shell interpreter might misplace a line feed when displaying output from the invoked command. This is a
       timing artefact.

SEE ALSO
       Homepage <http://www.suckless.org/>

AUTHOR
       ssid was written by Anselm R. Garbe <garbeam@gmail.com>.

       This manual page was written by Daniel Baumann <daniel@debian.org>, for the Debian project (but may be used by others).

0.1                                                                 2008-08-03                                                             SSID(1)
