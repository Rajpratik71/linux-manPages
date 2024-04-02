MCKEY(1)                                                                                          librdmacm                                                                                          MCKEY(1)



NAME
       mckey - RDMA CM multicast setup and simple data transfer test.

SYNOPSIS
       mckey -m multicast_address [-s] [-b bind_address] [-c connections]
                 [-C message_count] [-S message_size] [-p port_space]
       mckey -m multicast_address -s [-b bind_address] [-c connections]
                 [-C message_count] [-S message_size] [-p port_space]
       mckey -M unmapped_multicast_address -b bind_address [-s] [-c connections]
                 [-C message_count] [-S message_size] [-p port_space]

DESCRIPTION
       Establishes a set of RDMA multicast communication paths between nodes using the librdmacm, optionally transfers datagrams to receiving nodes, then tears down the communication.

OPTIONS
       -m multicast_address
              IP multicast address to join.

       -M unmapped_multicast_address
              RDMA transport specific multicast address to join.

       -s     Send datagrams to the multicast group.

       -b bind_address
              The local network address to bind to.

       -c connections
              The number of QPs to join the multicast group.  (default 1)

       -C message_count
              The number of messages to transfer over each connection.  (default 10)

       -S message_size
              The size of each message transferred, in bytes.  This value must be smaller than the MTU of the underlying RDMA transport, or an error will occur.  (default 100)

       -o     Join the multicast group as a send-only full-member. Otherwise the group is joined as a full-member.

       -p port_space
              The port space of the datagram communication.  May be either the RDMA UDP (0x0111) or IPoIB (0x0002) port space.  (default RDMA_PS_UDP)

NOTES
       Basic usage is to start mckey -m multicast_address on a server system, then run mckey -m multicast_address -s on a client system.

       Unique Infiniband SA assigned multicast GIDs can be retrieved by invoking mckey with a zero MGID or IP address.  (Example, -M 0 or -m 0.0.0.0).  The assigned address will be displayed to allow mckey
       clients to join the created group.

       Because this test maps RDMA resources to userspace, users must ensure that they have available system resources and permissions.  See the libibverbs README file for additional details.

SEE ALSO
       rdma_cm(7), ucmatose(1), udaddy(1), rping(1)



librdmacm                                                                                         2007-05-15                                                                                         MCKEY(1)
