RDMA_XCLIENT(1)                                                                                   librdmacm                                                                                   RDMA_XCLIENT(1)



NAME
       rdma_xclient - RDMA CM communication client test program

SYNOPSIS
       rdma_xclient [-s server_address] [-p server_port] [-c comm_type]

DESCRIPTION
       Uses synchronous librdmam calls to establish an RDMA connection between two nodes.  This example is intended to provide a very simple coding example of how to use RDMA.

OPTIONS
       -s server_address
              Specifies the address of the system that the rdma_server is running on.  By default, the client will attempt to connect to the server using 127.0.0.1.

       -p server_port
              Specifies the port number that the server listens on.  By default the server listens on port 7471.

       -c communication type
              Specifies the type of communication established with the server program.  'r' results in using a reliable-connected QP (the default).  'x' uses extended reliable-connected XRC QPs.

NOTES
       Basic usage is to start rdma_xserver, then connect to the server using the rdma_client program.

       Because this test maps RDMA resources to userspace, users must ensure that they have available system resources and permissions.  See the libibverbs README file for additional details.

SEE ALSO
       rdma_cm(7), udaddy(1), mckey(1), rping(1), rdma_xserver(1), rdma_client(1)



librdmacm                                                                                         2011-06-15                                                                                  RDMA_XCLIENT(1)
