TOR-RESOLVE(1)                                Tor Manual                                TOR-RESOLVE(1)

NAME
       tor-resolve - resolve a hostname to an IP address via tor

SYNOPSIS
       tor-resolve [-4|-5] [-v] [-x] [-p socksport] hostname [sockshost[:socksport]]

DESCRIPTION
       tor-resolve is a simple script to connect to a SOCKS proxy that knows about the SOCKS RESOLVE
       command, hand it a hostname, and return an IP address.

       By default, tor-resolve uses the Tor server running on 127.0.0.1 on SOCKS port 9050. If this
       isn’t what you want, you should specify an explicit sockshost and/or socksport on the command
       line.

OPTIONS
       -v
           Display verbose output.

       -x
           Perform a reverse lookup: get the PTR record for an IPv4 address.

       -5
           Use the SOCKS5 protocol. (Default)

       -4
           Use the SOCKS4a protocol rather than the default SOCKS5 protocol. Doesn’t support reverse
           DNS.

       -p socksport
           Override the default SOCKS port without setting the hostname.

SEE ALSO
       tor(1), torify(1).

       For protocol details, see: https://spec.torproject.org/socks-extensions

AUTHORS
       Roger Dingledine <arma@mit.edu>, Nick Mathewson <nickm@alum.mit.edu>.

AUTHOR
       Peter Palfrader
           Author.

Tor                                           08/21/2019                                TOR-RESOLVE(1)
