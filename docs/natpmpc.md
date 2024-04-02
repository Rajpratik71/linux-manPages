natpmpc(1)               General Commands Manual              natpmpc(1)

NAME
       natpmpc - NAT-PMP library test client and mapping setter.

SYNOPSIS
       Display the public IP address:
       natpmpc

       Add a port mapping:
       natpmpc -a <public port> <private port> <protocol> [lifetime]

DESCRIPTION
       In  order  to  remove a mapping, set it with a lifetime of 0 sec‐
       onds.  To remove all mappings for your machine, use 0 as  private
       port and lifetime.

                                                              natpmpc(1)
