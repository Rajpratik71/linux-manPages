PPTPSETUP(1)                                            User Contributed Perl Documentation                                           PPTPSETUP(1)

NAME
       pptpsetup - Point-to-Point Tunneling Protocol setup

SYNOPSIS
           pptpsetup --create <TUNNEL> --server <SERVER> [--domain <DOMAIN>]
                     --username <USERNAME> [--password <PASSWORD>]
                     [--encrypt] [--start]

           pptpsetup --delete <TUNNEL>

DESCRIPTION
       PPTP Client is a Linux, FreeBSD, NetBSD and OpenBSD client for the proprietary Microsoft Point-to-Point Tunneling Protocol, PPTP.

       This script configures PPTP Client on Linux.

OPTIONS
       --create TUNNEL create a tunnel named TUNNEL

       --delete TUNNEL delete the file /etc/ppp/peers/TUNNEL and any lines from /etc/ppp/chap-secrets that contains "TUNNEL" as a single word

       --server SERVER the IP address or host name of the server

       --domain DOMAIN the authentication domain name (optional)

       --username USERNAME
                       the username you are to use

       --password PASSWORD
                       the password you are to use. If you don't specify a password, pptpsetup will ask for one.

       --encrypt       whether encryption is required

       --start         whether the connection should be started after configuration.

AUTHOR
       Nelson Ferraz <nferraz at gmail.com>, based on James Cameron's PPTP Client Debian HOWTO.

SEE ALSO
       PPTP Client Debian HOWTO
                       http://pptpclient.sourceforge.net/howto-debian.phtml

       PPTP Client Diagnosis HOWTO
                       http://pptpclient.sourceforge.net/howto-diagnosis.phtml

COPYRIGHT
       pptpsetup - Point-to-Point Tunneling Protocol setup

       Copyright (C) 2006 Nelson Ferraz

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

perl v5.10.0                                                        2009-04-12                                                        PPTPSETUP(1)
