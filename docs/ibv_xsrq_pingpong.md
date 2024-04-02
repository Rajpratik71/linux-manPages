IBV_XSRQ_PINGPONG(1)                                                                            USER COMMANDS                                                                            IBV_XSRQ_PINGPONG(1)



NAME
       ibv_xsrq_pingpong - simple InfiniBand shared receive queue test


SYNOPSIS
       ibv_xsrq_pingpong [-p port] [-d device] [-i ib port] [-s size] [-m mtu] [-c clients] [-n num_tests] [-l sl] [-e] [-g gid index] HOSTNAME

       ibv_xsrq_pingpong [-p port] [-d device] [-i ib port] [-s size] [-m mtu] [-c clients] [-n num_tests] [-l sl] [-e] [-g gid index]


DESCRIPTION
       Run a simple ping-pong test over InfiniBand via the extended reliable connected (XRC) transport service, using a shared receive queue (SRQ).


OPTIONS
       -p, --port=PORT
              use TCP port PORT for initial synchronization (default 18515)

       -d, --ib-dev=DEVICE
              use IB device DEVICE (default first device found)

       -i, --ib-port=PORT
              use IB port PORT (default port 1)

       -s, --size=SIZE
              ping-pong messages of size SIZE (default 4096)

       -m, --mtu=MTU
              use path mtu of size MTU (default 2048)

       -c, --clients=CLIENTS
              number of clients CLIENTS (on server only, default 1)

       -n, --num-tests=NUM_TESTS
              perform NUM_TESTS tests per client (default 5)

       -l, --sl=SL
              use SL as the service level value (default 0)

       -e, --events
              sleep while waiting for work completion events (default is to poll for completions)

       -g, --gid-idx=GIDINDEX
              local port GIDINDEX


SEE ALSO
       ibv_rc_pingpong(1), ibv_uc_pingpong(1), ibv_ud_pingpong(1) ibv_srq_pingpong(1)


AUTHORS
       Roland Dreier
              <roland@purestorage.com>

       Jarod Wilson
              <jarod@redhat.com>


BUGS
       The  network synchronization between client and server instances is weak, and does not prevent incompatible options from being used on the two instances.  The method used for retrieving work comple‐
       tions is not strictly correct, and race conditions may cause failures on some systems.



libibverbs                                                                                       May 24, 2016                                                                            IBV_XSRQ_PINGPONG(1)
