IPTUNNEL(8)                             System Manager's Manual                            IPTUNNEL(8)

NAME
       iptunnel - Create and manage IP tunnels

SYNOPSIS
       iptunnel { add | change | del | show } [ NAME ]
         [ mode { ipip | gre | sit } ] [ remote ADDR ] [ local ADDR ]
         [ [i|o]seq ] [ [i|o]key KEY ] [ [i|o]csum ]
         [ ttl TTL ] [ tos TOS ] [ nopmtudisc ] [ dev PHYS_DEV ]

       iptunnel -V | --version

       Where: NAME := STRING
              ADDR := { IP_ADDRESS | any }
              TOS  := { NUMBER | inherit }
              TTL  := { 1..255 | inherit }
              KEY  := { DOTTED_QUAD | NUMBER }

DESCRIPTION
       iptunnel can be used to add, change, delete and show IP tunnels on the machine.

OPTIONS
       help   Show the help text.

       show   List existing IP tunnels.

       { add | change | del } [ NAME ]
              Specify an action (add, change or delete an IP tunnel) to be executed by iptunnel on the
              tunnel named NAME, which must be a string.  You must specify one action.

       mode PROTOCOL
              Specify the PROTOCOL to be used for the IP tunnel.  It can be ipip for TCP/IP,  gre  for
              Cisco GRE tunnel (RFCs 1701 and 1702), or sit for IPv6-in-IPv4 tunneling.

       remote ADDR
              Set the remote (i.e., destination) address of the tunnel.  ADDR must be an IP address or
              the word any.

       local ADDR
              Set the local (i.e., source) address of the tunnel.  ADDR must be an IP address  or  the
              word any.

       iseq   Require that all incoming packets are serialized.  Only applicable for GRE tunnels.

       oseq   Enable  serialization  (sequencing)  for  all outgoing packets.  Only applicable for GRE
              tunnels.

       ikey KEY
              Specify the input key for the Cisco GRE tunnel.  KEY must be either in dotted quad (dot‐
              ted decimal) or a number.  Only applicable for GRE tunnels.

       okey KEY
              Same as ikey, but set the output key instead.  Only applicable for GRE tunnels.

       icsum  Require  that  all  incoming packets have the correct checksum.  Only applicable for GRE
              tunnels.

       ocsum  Calculate checksums for all outgoing packets.  Only applicable for GRE tunnels.

       ttl TTL
              Specify the Time-To-Live value for the IP tunnel.  TTL must be a  value  between  1  and
              255,  or  the  word  inherit,  which  causes the field to be copied from the original IP
              header.

       tos TOS
              Specify the Type-Of-Service value for the IP tunnel.  TOS must be a value between 1  and
              255,  or  the  word  inherit,  which  causes the field to be copied from the original IP
              header.

       nopmtudisc
              Disable Path MTU Discovery on this tunnel.  Note that a fixed ttl is  incompatible  with
              this option.

       dev PHYS_DEV
              Bind the tunnel to the device PHYS_DEV.

HOMEPAGE
       <https://sourceforge.net/projects/net-tools/>

AUTHORS
       This  manpage  was  written by Sergio Durigan Junior <sergiodj (at) sergiodj (dot) net>.  A few
       parts were inspired by ip-tunnel(1)'s manpage.

       Permission is granted to copy, distribute and/or modify this document under the  terms  of  the
       GNU General Public License, Version 2 or any later version published by the Free Software Foun‐
       dation.

February 2018                                version 1.60                                  IPTUNNEL(8)
