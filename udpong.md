UDPONG(1)                                                                                         librdmacm                                                                                         UDPONG(1)



NAME
       udpong - unreliable datagram streaming over RDMA ping-pong test.

SYNOPSIS
       udpong [-s server_address] [-b bind_address]
                      [-B buffer_size] [-C transfer_count]
                      [-S transfer_size] [-p server_port] [-T test_option]

DESCRIPTION
       Uses unreliable datagram streaming over RDMA protocol (rsocket) to connect and exchange data between a client and server application.

OPTIONS
       -s server_address
              The network name or IP address of the server system listening for connections.  The used name or address must route over an RDMA device.  This option must be specified by the client.

       -b bind_address
              The local network address to bind to.

       -B buffer_size
              Indicates the size of the send and receive network buffers.

       -C transfer_count
              The number of messages to transfer from the client to the server and back again on each iteration.  (default 1000)

       -S transfer_size
              The size of each send transfer, in bytes.  (default 1000)

       -p server_port
              The server's port number.

       -T test_option
              Specifies test parameters.  Available options are:

       s | socket  - uses standard socket calls to transfer data

       a | async - uses asynchronous operation (e.g. select / poll)

       b | blocking - uses blocking calls

       n | nonblocking - uses non-blocking calls

       e | echo - server echoes all messages

NOTES
       Basic  usage  is  to start udpong on a server system, then run udpong -s server_name on a client system.  udpong will run a series of latency and bandwidth performance tests.  Specifying a different
       transfer_count or transfer_size will run a user customized test using default values where none have been specified.

       Because this test maps RDMA resources to userspace, users must ensure that they have available system resources and permissions.  See the libibverbs README file for additional details.

SEE ALSO
       rdma_cm(7)



librdmacm                                                                                         2017-04-28                                                                                        UDPONG(1)
