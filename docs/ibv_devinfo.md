IBV_DEVINFO(1)                                                                                  USER COMMANDS                                                                                  IBV_DEVINFO(1)



NAME
       ibv_devinfo - query RDMA devices


SYNOPSIS
       ibv_devinfo [-d device] [-i port] [-l] [-v]


DESCRIPTION
       Print information about RDMA devices available for use from userspace.


OPTIONS
       -d, --ib-dev=DEVICE
              use IB device DEVICE (default first device found)

              -i, --ib-port=PORT query port PORT (default all ports)

              -l, --list only list names of RDMA devices

              -v, --verbose print all available information about RDMA devices


SEE ALSO
       ibv_devices(1)


AUTHORS
       Dotan Barak
              <dotanba@gmail.com>

       Roland Dreier
              <rolandd@cisco.com>



libibverbs                                                                                     August 30, 2005                                                                                 IBV_DEVINFO(1)
