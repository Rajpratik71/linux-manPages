IB_ATOMIC_BW(1)                                                                            General Commands Manual                                                                            IB_ATOMIC_BW(1)



NAME
       ib_atomic_bw, ib_atomic_lat, ib_read_bw, ib_read_lat, ib_send_bw, ib_send_lat, ib_write_bw, ib_write_lat - Collection of tests written over uverbs intended for use as a performance micro-benchmark

SYNOPSIS
       ib_atomic_bw [<host>] [options]

       ib_atomic_lat [<host>] [options]

       ib_read_bw [<host>] [options]

       ib_read_lat [<host>] [options]

       ib_write_bw [<host>] [options]

       ib_write_lat [<host>] [options]

DESCRIPTION
       This is a collection of tests written over uverbs intended for use as a performance micro-benchmark. As an example, the tests can be used for HW or SW tuning and/or functional testing.

       The collection conatains a set of BW and latency benchmark such as :

       * Read   - ib_read_bw and ib_read_lat.

       * Write  - ib_write_bw and ib_wriet_lat.

       * Send   - ib_send_bw and ib_send_lat.

       * Atomic - ib_atomic_bw and ib_atomic_lat

       * Raw Etherent (when working with MOFED2) - raw_ethernet_bw, raw_ethernet_lat

       The benchmark used the CPU cycle counter to get time stamps without context switch.  Some CPU architectures (e.g., Intel's 80486 or older PPC) do NOT have such capability.

       The latency benchmarks measures round-trip time but reports half of that as one-way latency.  This means that it may not be sufficiently accurate for asymmetrical configurations.

       On  Bw benchmarks, we calculate the BW on send side only, as he calculates the Bw after collecting completion from the receive side.  In case we use the bidirectional flag , BW is calculated on both
       sides.  in ib_send_bw, server side also calculate the received throughput.

       Min/Median/Max result is reported in latency tests.  The median (vs average) is less sensitive to extreme scores.  Typically, the "Max" value is the first value measured.

       Larger samples help marginally only. The default (1000) is pretty good.  Note that an array of cycles_t (typically unsigned long) is allocated once to collect samples and again to store the  differ‐
       ence  between  them.   Really  big  sample  sizes  (e.g., 1 million) might expose other problems with the program. In this case you can use -N flag (No Peak) to instruct the test sample only 2 times
       (begining and end).

       All throughput tests now have duration feature as well (-D <seconds to run>) to instruct the test to run for <seconds to run>.  Another feature added is --run_infinitely, which instruct the test  to
       run all te time and print throughput every 5 seconds.

       The "-H" option (latency) will dump the histogram for additional statistical analysis.  See xgraph, ygraph, r-base (http://www.r-project.org/), pspp, or other statistical math programs.


       Architectures tested: i686, x86_64, ia64

OPTIONS
       The SAME OPTIONS must be passed to both server and client.

       If <host> is not presented, command starts a server and waits for connection.  If it is, command connects to server at <host>.

       Common Options:

           -h, --help
                  Display this help message screen.

           -p, --port=<port>
                  Listen on/connect to port <port> (default: 18515) when exchaning data.

           -R, --rdma_cm
                  Connect QPs with rdma_cm and run test on those QPs.

           -z, --com_rdma_cm
                  Communicate with rdma_cm module to exchange data - use regular QPs.

           -m, --mtu=<mtu>
                   QP Mtu size (default: active_mtu from ibv_devinfo).

           -c, --connection=<RC/UC/UD>
                  Connection type RC/UC/UD (default RC)

           -d, --ib-dev=<dev>
                  Use IB device <dev> (default: first device found).

           -i, --ib-port=<port>
                  Use port <port> of IB device (default: 1).

           -s, --size=<size>
                  Size of message to exchange (default: 1).

           -a, --all
                  Run sizes from 2 till 2^23.

           -n, --iters=<iters>
                  Number of exchanges (at least 100, default: 1000).

           -x, --gid-index=<index>
                  Test uses GID with GID index taken from command

           -V, --version
                  Display version number.

           -e, --events
                  Sleep on CQ events (default poll).

           -F, --CPU-freq
                  Do not fail even if cpufreq_ondemand module.

           -I, --inline_size=<size>
                  Max size of message to be sent in inline mode.

           -u, --qp-timeout=<timeout>
                  QP timeout, timeout value is 4 usec*2 ^timeout (default: 14).

           -S, --sl=<sl>
                  SL - Service Level (default 0)

           -r, --rx-depth=<dep>
                  Make rx queue bigger than tx (default 600).

       Latenct tests options:

           -C, --report-cycles
                  Report times in cpu cycle units.

           -H, --report-histogram
                  Print out all results (Default: summary only).

           -U, --report-unsorted
                  Print out unsorted results (default sorted).

       BW tests options:

           -b, --bidirectional
                  Measure bidirectional bandwidth (default uni).

           -N, --no
                  peak-bw              Cancel peak-bw calculation (default with peak-bw)

           -Q, --cq-mod
                  Generate Cqe only after <cq-mod> completion

           -t, --tx-depth=<dep>
                  Size of tx queue (default: 128).

           -O, --dualport
                  Run test in dual-port mode (2 QPs). both ports must be active (default OFF).

           -D, --duration=<sec>
                  Run test for <sec> period of seconds.

           -f, --margin=<sec>
                  When in Duration, measure results within margins (default: 2)

           -l, --post_list=<list_size>
                  Post list of WQEs of <list size> size (instead of single post).

           -q, --qp=<num_of_qps>
                  Num of QPs running in the process (default: 1).

           --run_infinitely
                  Run test forever, print results every 5 seconds.

       SEND tests options:

           -r, --rx-depth=<dep>
                  Size of RX queue (default: 512 in BW test).

           -g, --mcg=<num_of_qps>
                  Send messages to multicast group with <num_of_qps> qps attached to it.

           -M, --MGID=<multicast_gid>
                  In multicast, uses <multicast_gid> as the group MGID.

       Raw Ethernet BW test options:

           -A, --atomic_type=<type>
                  type of atomic operation from {CMP_AND_SWAP,FETCH_AND_ADD}.

           -o, --outs=<num>
                  Number of outstanding read/atomic requests - also on READ tests.

           -B, --source_mac
                  source MAC address by this format XX:XX:XX:XX:XX:XX (default take the MAC address form GID).

           -E, --dest_mac
                  destination MAC address by this format XX:XX:XX:XX:XX:XX **MUST** be entered.

           -J, --server_ip
                  server ip address by this format X.X.X.X (using to send packets with IP header).

           -j, --client_ip
                  client ip address by this format X.X.X.X (using to send packets with IP header).

           -K, --server_port
                  server udp port number (using to send packets with UPD header).

           -k, --client_port
                  client udp port number (using to send packets with UDP header).

           -Z, --server
                  choose server side for the current machine (--server/--client must be selected ).

           -P, --client
                  choose client side for the current machine (--server/--client must be selected).

ENVIRONMENT
       Prerequisites:
              kernel 2.6
              (kernel module) matches libibverbs
              (kernel module) matches librdmacm
              (kernel module) matches libibumad
              (kernel module) matches libmath (lm).

NOTES
       You need to be running a Subnet Manager on the switch or on one of the nodes in your fabric, in case you are in IB fabric.

BUGS
       1.  Multicast  feauture  in  ib_send_lat and in ib_send_bw still have many problems!  Will increase the support and bug fixes in this Q, but now the tests may stuck and could produce undefine behav‐
       iours.

       2. Bidirectional feature in ib_send_bw test, when running in UD or UC mode.  The algorithm we use for the bidirectional measurement is designed for RC connection type.  When running in UC or UD con‐
       nection types, there is a small probablity the test will be stuck.

       3. RDMA_CM feature in read tests still doesn't work.

       4. Dual-port support currently works only with ib_write_bw.

       5. Compabilty issues may occur between different versions of perftest.  Please make sure you work with the same version on both sides to ensure consistency of the test.

AUTHORS
       Please post results/observations to the openib-general mailing list.  See "Contact Us" at http://openib.org/mailman/listinfo/openib-general and http://www.openib.org.



Open Fabrics Enterprise Distribution                                                                 2014                                                                                     IB_ATOMIC_BW(1)
