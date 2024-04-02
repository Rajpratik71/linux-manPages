IBV_ASYNCWATCH(1)                                                                               USER COMMANDS                                                                               IBV_ASYNCWATCH(1)



NAME
       ibv_asyncwatch - display asynchronous events


SYNOPSIS
       ibv_asyncwatch [-d device] [-h]


DESCRIPTION
       Display asynchronous events forwarded to userspace for an RDMA device.


OPTIONS
       -d, --ib-dev=DEVICE
              use IB device DEVICE (default first device found)

       -h, --help=DEVICE
              Print a help text and exit.


AUTHORS
       Roland Dreier
              <rolandd@cisco.com>

       Eran Ben Elisha
              <eranbe@mellanox.com>



libibverbs                                                                                     August 30, 2005                                                                              IBV_ASYNCWATCH(1)
