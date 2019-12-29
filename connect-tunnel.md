CONNECT-TUNNEL(1p)                User Contributed Perl Documentation               CONNECT-TUNNEL(1p)

NAME
       connect-tunnel - Create CONNECT tunnels through HTTP proxies

SYNOPSIS
       connect-tunnel [ -Lv ] [ -A user:pass ] [ -P proxy:port ]
                      [ -C controlport ] [ -T port:host:hostport ]

DESCRIPTION
       connect-tunnel sets up tunneled connections to external hosts by redirecting connections to
       local ports towards thoses hosts/ports through a HTTP proxy.

       connect-tunnel makes use of the HTTP "CONNECT" method to ask the proxy to create a tunnel to an
       outside server. Be aware that some proxies are set up to deny outside tunnels (either to ports
       other than 443 or outside a specified set of outside hosts).

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with two
       dashes.

       -A, --proxy-authentication user:password
           Proxy authentication information.

           Please note that all the authentication schemes supported by "LWP::UserAgent" are supported
           (we use an "LWP::UserAgent" internally to contact the proxy).

       -C, --control-port controlport
           The port to which one can connect to issue control commands to connect-tunnel.

           See "CONTROL CONNECTIONS" for more details about the available commands.

       -L, --local-only
           Create the tunnels so that they will only listen on "localhost".  Thus, only connections
           originating from the machine that runs connect-tunnel will be accepted.

           That was the default behaviour in connect-tunnel version 0.02.

       -P, --proxy proxy[:port]
           The proxy is required to connect the tunnels.  If no port is given, 8080 is used by
           default.

           See also "ENVIRONMENT VARIABLES".

       -T, --tunnel port:host:hostport
           Specifies that the given port on the local host is to be forwarded to the given host and
           hostport on the remote side. This works by allocating a socket to listen to port on the
           local side, and whenever a connection is made to this port, connect-tunnel forwards it to
           the proxy (with the credentials, if required), which in turn forwards it to the final
           destination.

           Note that this does not imply the use of any cryptographic system (SSL or any other). This
           is a simple TCP redirection. The security if any, is the one provided by the protocol used
           to connect to the destination through connect-tunnel.

           On Unix systems, only root can forward privileged ports.

           Note that you can setup tunnels to multiple destinations, by using the --tunnel option
           several times.

       -U, --user-agent string
           Specify User-Agent value to send in HTTP requests.  The default is to send
           "connect-tunnel/version".

       -v, --verbose
           Verbose output.

           This option can be used several times for more verbose output.

EXAMPLES
       To connect to a SSH server running on "ssh.example.com", on port 443, through the proxy
       "proxy.company.com", running on port 8080, use the following command:

           connect-tunnel -P proxy.company.com:8080 -T 22:ssh.example.com:443

       And now point your favorite ssh client to the machine running connect-tunnel.

       You can also emulate a "standard" user-agent:

           connect-tunnel -U "Mozilla/4.03 [en] (X11; I; Linux 2.1.89 i586)"
                          -P proxy.company.com:8080 -T 22:ssh.example.com:443

       connect-tunnel can easily use your proxy credentials to connect outside:

           connect-tunnel -U "Mozilla/4.03 [en] (X11; I; Linux 2.1.89 i586)"
                          -P proxy.company.com:8080 -T 22:ssh.example.com:443
                          -A book:s3kr3t

       But if you don't want anybody else to connect to your tunnels and through the proxy with your
       credentials, use the --local-only option:

        connect-tunnel -U "Mozilla/4.03 [en] (X11; I; Linux 2.1.89 i586)"
                       -P proxy.company.com:8080 -T 22:ssh.example.com:443
                       -A book:s3kr3t -L

       If you have several destinations, there is no need to run several instances of connect-tunnel:

        connect-tunnel -U "Mozilla/4.03 [en] (X11; I; Linux 2.1.89 i586)"
                       -P proxy.company.com:8080 -A book:s3kr3t -L
                       -T 22:ssh.example.com:443
                       -T 222:ssh2.example.com:443

       But naturally, you will need to correctly set up the ports in your clients.

       Mmm, such a long command line would perfectly fit in an alias or a .BAT file. ";-)"

ENVIRONMENT VARIABLES
       The environment variable "HTTP_PROXY" can be used to provide a proxy definition.

       The environment variable is overriden by the --proxy option, if passed to connect-tunnel.

AUTHOR
       Philippe "BooK" Bruhat, "<book@cpan.org>".

       I seem to have re-invented a well-known wheel with that script, but at least, I hope I have
       added a few interesting options to it.

SCRIPT HISTORY
       The first version of the script was a quick hack that let me go through a corporate proxy.

       Version 0.02 and version 0.03 were released on CPAN in 2003.

       Version 0.04 sits half-finished in a CVS repository at home: I couldn't decypher the spaghetti
       of my data structures any more. ":-("

       Version 0.05 (and higher) are based on "Net::Proxy", and included with the "Net::Proxy"
       distribution.

       Even though it's not rocket science, connect-tunnel has been cited in at least one academic
       works:

       •   HTTP Tunnels Through Proxies, Daniel Alman

           Available at SANS InfoSec Reading Room: Covert Channels
           <http://www.sans.org/rr/whitepapers/covert/>

           Direct link: <http://www.sans.org/rr/whitepapers/covert/1202.php>

COPYRIGHT
       Copyright 2003-2007, Philippe Bruhat. All rights reserved.

LICENSE
       This module is free software; you can redistribute it or modify it under the same terms as Perl
       itself.

perl v5.18.1                                  2013-10-22                            CONNECT-TUNNEL(1p)
