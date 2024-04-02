RDMA_XSERVER(1)                                                                                   librdmacm                                                                                   RDMA_XSERVER(1)



NAME
       rdma_xserver - RDMA CM communication server test program

SYNOPSIS
       rdma_xserver [-p port] [-c comm_type]

DESCRIPTION
       Uses the librdmacm to establish various forms of communication and exchange data.

OPTIONS
       -p port
              Changes the port number that the server listens on.  By default the server listens on port 7471.

       -c communication type
              Specifies the type of communication established with the client program.  'r' results in using a reliable-connected QP (the default).  'x' uses extended reliable-connected XRC QPs.

NOTES
       Basic usage is to start rdma_xserver, then connect to the server using the rdma_xclient program.

       Because this test maps RDMA resources to userspace, users must ensure that they have available system resources and permissions.  See the libibverbs README file for additional details.

SEE ALSO
       rdma_cm(7), udaddy(1), mckey(1), rping(1), rdma_server(1), rdma_xclient(1)



librdmacm                                                                                         2011-06-15                                                                                  RDMA_XSERVER(1)
