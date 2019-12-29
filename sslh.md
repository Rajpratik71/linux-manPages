SSLH(1p)                          User Contributed Perl Documentation                         SSLH(1p)

NAME
       sslh - Switch incoming connection between SSH and SSL/HTTPS servers

SYNOPSIS
       sslh [ -v ] [ -p [host:]port ] [ -t timeout ]
            [ --ssh [host:]port ] [ --ssl [host:]port ]

DESCRIPTION
       sslh is a simple script that lets you switch an incoming connection on a single port between
       distinct SSH and SSL/HTTPS servers.

       sslh listens for connections on a port and is able to redirect them either to an HTTPS web
       server or a SSH server.

       This lets one setup both a HTTPS web server and a SSH server and access them through the same
       host+port.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with two
       dashes.

       -p, --port [host:]port
           The port the proxy will listen to.  If no port is given, 443 is used by default.  If no
           host is given, "localhost" is used by default.

       -s, --ssh [host:]port
           The SSH server which the SSH connections must be forwarded to.  If omitted, the default is
           localhost:22.

       -l, --ssl, --https [host:]port
           The HTTPS server which the HTTPS connections must be forwarded to.  If omitted, the default
           is localhost:443.

       -t, --timeout delay
           Timeout in seconds before a silent incoming connection is considered as a SSH connection.
           The number can be fractional.

           The default is 2seconds.

       -v, --verbose
           Verbose output.  This option can be used several times for more verbose output.

EXAMPLE OF USE
       Is this tool actually useful? Yes.

       For example one can use it to access both a SSH server and a secure web server via a corporate
       proxy that only accepts to relay connections to port 443. Creating a tunnel that passes SSH
       connection through a CONNECT-enabled web proxy is easy with connect-tunnel (also included in
       the "Net::Proxy" distribution).

       The proxy will let both SSH and HTTPS connections out (since they all point to port 443), and
       the home server will connect those incoming connections to the appropriate server. This only
       requires to run the HTTPS server on a non standard port (not 443).

TECHNICAL NOTE
       How can this proxy find out what kind of protocol is using a TCP connection to port 443,
       without being connected (yet) to the server?  We actually rely on a slight difference between
       the SSL and SSH protocols (found thanks to ethereal):

       SSH Once the TCP connection is established, the server speaks first, presenting itself by
           saying something like:

               SSH-2.0-OpenSSH_3.6.1p2 Debian 1:3.6.1p2-1

       SSL With SSL, it's always the client that speaks first.

       This means that sslh can be used with any pair of protocols/services that share this property
       (the client speaks first for one and the server speaks first for the other).

AUTHORS
       Original idea and C version
           Frederic Ple "<sslh@wattoo.org>".

       Perl versions
           Philippe 'BooK' Bruhat "<book@cpan.org>".

SCRIPT HISTORY
       Version 0.01 of the script was a quick hack designed in 2003 as a proof of concept.

       Version 0.02 (and higher) are based on "Net::Proxy", and included with the "Net::Proxy"
       distribution. Version 0.02 didn't work, though.

       Version 0.03 correctly initialised the "in" connector.

       Version 0.04 lets the proxy listen on any address (instead of "localhost", which is still the
       default). Thanks to Dieter Voegtli for spotting this.

SEE ALSO
       Net::Proxy, Net::Proxy::Connector::dual.

COPYRIGHT
       Copyright 2003-2006, Philippe Bruhat. All rights reserved.

LICENSE
       This module is free software; you can redistribute it or modify it under the same terms as Perl
       itself.

POD ERRORS
       Hey! The above document had some coding errors, which are explained below:

       Around line 200:
           Non-ASCII character seen before =encoding in 'Frederic'. Assuming ISO8859-1

perl v5.18.1                                  2013-10-22                                      SSLH(1p)
