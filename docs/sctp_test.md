sctp_test(1)                                                  General Commands Manual                                                 sctp_test(1)

NAME
       sctp_test - Send and receive messages via SCTP

SYNOPSIS
       sctp_test -H -P -h -p -l|s

DESCRIPTION
        This is a userspace test application for the SCTP Linux kernel reference implementation.

OPTIONS
       -H local-addr

       -P local-port

       -h remote-addr

       -p remote-port

       -s     Act as client

       -l     Listen for connections (server)

       -a assoc_pattern
              assoc_pattern in the mixed mode 0 = sequential ascending(default) 1 = random

       -d debug
              0 = none 1 = min(default) 2 = max

       -c testcase
              0 = 1 byte packets.  1 = 1352 byte packets.
                  (fragmentation point for an i/f with 1500 as mtu.)  2 = 1353 byte packets.
                  (min. size at which fragmentation occurs
                  for an i/f with 1500 as mtu.)  3 = Sequence of 1, 1353, 32768 byte packets.  4 = Sequence of following size packets.
                  (1, 1000, 2000, 3000, 5000, 10000,15000, 20000, 25000, 32768) 5 = 32768 byte packets.
                  (default max receive window size.)  6 = random size packets.

       -ve value
              Packets of specifed size.

       -m msgsize
              (1500-65515, default value 32768)

       -x number_of_repeats

       -o order_pattern
              0 = all unordered(default) 1 = all ordered 2 = alternating 3 = random -t stream_pattern
               0 = sequential ascending(default)
               1  =  random  -M max_stream (default value 0) -r seed (default 0, use time()) -L num_ports (default value 0). Run the mixed mode -S
              num_ports (default value 0). Run the mixed mode -D Drain. If in client mode do a read following send.

USAGE
       server: sctp_test -H local_addr -P local_port -l

       client: sctp_test -H local_addr -P local_port -h remote_addr
        -p remote-port -s

AUTHOR
       Michael Biebl <biebl@debian.org>

                                                                                                                                      sctp_test(1)
