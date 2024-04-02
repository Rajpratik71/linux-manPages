LAPCAT(1)                                                     General Commands Manual                                                    LAPCAT(1)

NAME
       lapcat - Location Aware Proxy Chooser And Tunneler

SYNOPSIS
       lapcat [options] <host> <port>

DESCRIPTION
       lapcat is a netcat-like tool which opens up a TCP/IP connection to a particular host, on a particular port.

       How the connection is established depends on a set of rules which may vary depending on host, active network connection and availability.

OPTIONS
         -v       Enable debug output.

         -v -v    Enable even more debug output.

MODES
       Lapcat operates in one of 4 different modes: netcat mode, HTTP Proxy mode, dedicated mode and one-off mode.  Each are described below.

       In  netcat mode, lapcat will connect to the remote host and relay data back and forth to the standard input and output.  This is similar to
       using the telnet or netcat tools.

AUTHOR
       Written by Bjarni R. Einarsson <http://bre.klaki.net/> for The Beanstalks Project ehf. and PageKite <https://pagekite.net/>.

CONFIGURATION
       FIXME: Write this!

SEE ALSO
       pagekite(1), <http://pagekite.org/>, <http://pagekite.net/>

COPYRIGHT
       Copyright © 2011 Bjarni R. Einarsson and The Beanstalks Project ehf.

       License: AGPLv3+, GNU Affero GPL version 3 or later <http://gnu.org/licenses/agpl.html>.  This is free software: you are free to change and
       redistribute it.  There is NO WARRANTY, to the extent permitted by law.

                                                                    2011-07-31                                                           LAPCAT(1)
