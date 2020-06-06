CMTIME(1)                                                                                         librdmacm                                                                                         CMTIME(1)



NAME
       cmtime - RDMA CM connection steps timing test.

SYNOPSIS
       cmtime [-s server_address] [-b bind_address]
                      [-c connections] [-p port_number]
                      [-r retries] [-t timeout_ms]

DESCRIPTION
       Determines min and max times for various "steps" in RDMA CM connection setup and teardown between a client and server application.

       "Steps" that are timed are: create id, bind address, resolve address, resolve route, create qp, connect, disconnect, and destroy.

OPTIONS
       -s server_address
              The network name or IP address of the server system listening for connections.  The used name or address must route over an RDMA device.  This option must be specified by the client.

       -b bind_address
              The local network address to bind to.

       -c connections
              The number of connections to establish between the client and server.  (default 100)

       -p port_number
              The server's port number.

       -r retries
              Number of retries when resolving address or route.  (default 2)

       -t timeout_ms
              Timeout in millseconds (ms) when resolving address or route.  (default 2000 - 2 seconds)

NOTES
       Basic usage is to start cmtime on a server system, then run cmtime -s server_name on a client system.

       Because this test maps RDMA resources to userspace, users must ensure that they have available system resources and permissions.  See the libibverbs README file for additional details.

SEE ALSO
       rdma_cm(7)



librdmacm                                                                                         2017-04-28                                                                                        CMTIME(1)
