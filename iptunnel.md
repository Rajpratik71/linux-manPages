IPTUNNEL(8)                                                                                                                                                                                       IPTUNNEL(8)



NAME
       iptunnel - creates, deletes, and displays configured tunnels


SYNOPSIS
       /usr/sbin/iptunnel [<operation>] [<args>]


NOTE
       This program is obsolete. For replacement check ip tunnel.


DESCRIPTION
       The iptunnel command creates configured tunnels for sending and receiving IPV6 or IPV4 packets that are encapsulated as the payload of an IPV4 datagram.

       The iptunnel command can perform one of the following operations:

       create - create a tunnel interface, which you must subsequently configure.

       delete - delete a tunnel interface. You must disable the tunnel before you can delete it.

       show - show the tunnel attributes (name, tunnel end points, next hop for tunneled packets).


SEE ALSO
       ip(8).



                                                                                                SEPTEMBER 2009                                                                                    IPTUNNEL(8)
