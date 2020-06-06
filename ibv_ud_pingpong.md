IBV_UD_PINGPONG(1)                                                                              USER COMMANDS                                                                              IBV_UD_PINGPONG(1)



NAME
       ibv_ud_pingpong - simple InfiniBand UD transport test


SYNOPSIS
       ibv_ud_pingpong [-p port] [-d device] [-i ib port] [-s size] [-r rx depth] [-n iters] [-l sl] [-e] [-g gid index] HOSTNAME

       ibv_ud_pingpong [-p port] [-d device] [-i ib port] [-s size] [-r rx depth] [-n iters] [-l sl] [-e] [-g gid index]


DESCRIPTION
       Run a simple ping-pong test over InfiniBand via the unreliable datagram (UD) transport.


OPTIONS
       -p, --port=PORT
              use TCP port PORT for initial synchronization (default 18515)

       -d, --ib-dev=DEVICE
              use IB device DEVICE (default first device found)

       -i, --ib-port=PORT
              use IB port PORT (default port 1)

       -s, --size=SIZE
              ping-pong messages of size SIZE (default 2048)

       -r, --rx-depth=DEPTH
              post DEPTH receives at a time (default 500)

       -n, --iters=ITERS
              perform ITERS message exchanges (default 1000)

       -l, --sl=SL
              send messages with service level SL (default 0)

       -e, --events
              sleep while waiting for work completion events (default is to poll for completions)

       -g, --gid-idx=GIDINDEX
              local port GIDINDEX

       -c, --chk
              validate received buffer


SEE ALSO
       ibv_rc_pingpong(1), ibv_uc_pingpong(1), ibv_srq_pingpong(1), ibv_xsrq_pingpong(1)


AUTHORS
       Roland Dreier
              <rolandd@cisco.com>


BUGS
       The  network synchronization between client and server instances is weak, and does not prevent incompatible options from being used on the two instances.  The method used for retrieving work comple‐
       tions is not strictly correct, and race conditions may cause failures on some systems.



libibverbs                                                                                     August 30, 2005                                                                             IBV_UD_PINGPONG(1)
