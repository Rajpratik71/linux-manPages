QPERF(1)                                                                                        User Commands                                                                                        QPERF(1)



NAME
       qperf - Measure RDMA and IP performance

SYNOPSIS
       qperf
       qperf SERVERNODE [OPTIONS] TESTS


DESCRIPTION
       qperf  measures  bandwidth  and  latency between two nodes.  It can work over TCP/IP as well as the RDMA transports.  On one of the nodes, qperf is typically run with no arguments designating it the
       server node.  One may then run qperf on a client node to obtain measurements such as bandwidth, latency and cpu utilization.

       In its most basic form, qperf is run on one node in server mode by invoking it with no arguments.  On the other node, it is run with two arguments: the name of the server node followed by  the  name
       of the test.  A list of tests can be found in the section, TESTS.  A variety of options may also be specified.

       One can get more detailed information on qperf by using the --help option.  Below are examples of using the --help option:

           qperf --help examples       Some examples of using qperf
           qperf --help opts           Summary of options
           qperf --help options        Description of options
           qperf --help tests          Short summary and description of tests
           qperf --help TESTNAME       More information on test TESTNAME

EXAMPLES
       In  these  examples,  we  first  run qperf on a node called myserver in server mode by invoking it with no arguments.  In all the subsequent examples, we run qperf on another node and connect to the
       server which we assume has a hostname of myserver.

       To run a TCP bandwidth and latency test:
              qperf myserver tcp_bw tcp_lat

       To run a UDP latency test and then cause the server to terminate:
              qperf myserver udp_lat quit

       To measure the RDMA UD latency and bandwidth:
              qperf myserver ud_lat ud_bw

       To measure RDMA UC bi-directional bandwidth:
              qperf myserver rc_bi_bw

       To get a range of TCP latencies with a message size from 1 to 64K
              qperf myserver -oo msg_size:1:64K:*2 -vu tcp_lat

OPTIONS
       -ar, --access_recv OnOff
              If OnOff is non-zero, data is accessed once received.  Otherwise, data is ignored.  By default, OnOff is 0.  This can help to mimic some applications.

       -ar1   Cause received data to be accessed.

       -ap, --alt_port Port
              Set alternate path port. This enables automatic path failover.

       -lap, --loc_alt_port Port
              Set local alternate path port. This enables automatic path failover.

       -rap, --rem_alt_port Port
              Set remote alternate path port. This enables automatic path failover.

       -ca, --cpu_affinity PN
              Set cpu affinity to PN.  CPUs are numbered sequentially from 0.  If PN is "any", any cpu is allowed otherwise the cpu is limited to the one specified.

       -lca, --loc_cpu_affinity PN
              Set local processor affinity to PN.

       -rca, --rem_cpu_affinity PN
              Set remote processor affinity to PN.

       -f, --flip OnOff
              If non-zero, cause sender and receiver to play opposite roles.

       -f1    Cause sender and receiver to play opposite roles.

       -h, --help Topic
              Print out information about Topic.  To see the list of topics, type qperf --help

       -H, --host Host
              Run test between the current node and the qperf running on node Host.  This can also be specified as the first non-option argument.

       -i, --id Device:Port
              Use RDMA Device and Port.

       -li, --loc_id Device:Port
              Use local RDMA Device and Port.

       -ri, --rem_id Device:Port
              Use remote RDMA Device and Port.

       -lp, --listen_port Port
              Set the port we listen on to ListenPort.  This must be set to the same port on both the server and client machines.  The default value is 19765.

       -oo, --loop Var:Init:Last:Incr
              Run a test multiple times sequencing through a series of values.  Var is the loop variable; Init is the initial value; Last is the value it must not exceed and Incr is the increment.   It  is
              useful to set the --verbose_used (-vu) option in conjunction with this option.

       -m, --msg_size Size
              Set  the  message  size  to Size.  The default value varies by test.  It is assumed that the value is specified in bytes however, a trailing kib or K, mib or M, or gib or G indicates that the
              size is being specified in kibibytes, mebibytes or gibibytes respectively while a trailing kb or k, mb or m, or gb or g indicates kilobytes, megabytes or gigabytes respectively.

       -mt, --mtu_size Size
              Set the MTU size.  Only relevant to the RDMA UC/RC tests.  Units are specified in the same manner as the --msg_size option.

       -n, --no_msgs N
              Set test duration by number of messages sent instead of time.

       -cp, --cq_poll OnOff
              Turn polling mode on or off.  This is only relevant to the RDMA tests and determines whether they poll or wait on the completion queues.  If OnOff is 0, they wait; otherwise they poll.

       -lcp, --loc_cq_poll OnOff
              Locally turn polling mode on or off.

       -rcp, --rem_cq_poll OnOff
              Remotely turn polling mode on or off.

       -cp1   Turn polling mode on.

       -lcp1  Turn local polling mode on.

       -rcp1  Turn remote polling mode on.

       -ip, --ip_port Port
              Use Port to run the socket tests.  This is different from --listen_port which is used for synchronization.  This is only relevant for the socket tests and refers to the TCP/UDP/RDS/SCTP  port
              that the test is run on.

       -e, --precision Digits
              Set the number of significant digits that are used to report results.

       -nr, --rd_atomic Max
              Set the number of in-flight operations that can be handled for a RDMA read or atomic operation to Max.  This is only relevant to the RDMA Read and Atomic tests.

       -lnr, --loc_rd_atomic Max
              Set local read/atomic count.

       -rnr, --rem_rd_atomic Max
              Set remote read/atomic count.

       -sl, --service_level SL
              Set RDMA service level to SL.  This is only used by the RDMA tests.  The service level must be between 0 and 15.  The default service level is 0.

       -lsl, --loc_service_level SL
              Set local service level.

       -rsl, --rem_service_level SL
              Set remote service level.

       -sb, --sock_buf_size Size
              Set the socket buffer size.  This is only relevant to the socket tests.

       -lsb, --loc_sock_buf_size Size
              Set local socket buffer size.

       -rsb, --rem_sock_buf_size Size
              Set remote socket buffer size.

       -sp, --src_path_bits N
              Set source path bits. If the LMC is not zero, this will cause the connection to use a LID with the low order LMC bits set to N.

       -lsp, --loc_src_path_bits N
              Set local source path bits.

       -rsp, --rem_src_path_bits N
              Set remote source path bits.

       -sr, --static_rate Rate
              Force  InfiniBand  static rate.  Rate can be one of: 2.5, 5, 10, 20, 30, 40, 60, 80, 120, 1xSDR (2.5 Gbps), 1xDDR (5 Gbps), 1xQDR (10 Gbps), 4xSDR (2.5 Gbps), 4xDDR (5 Gbps), 4xQDR (10 Gbps),
              8xSDR (2.5 Gbps), 8xDDR (5 Gbps), 8xQDR (10 Gbps).

       -lsr, --loc_static_rate
              Force local InfiniBand static rate

       -rsr, --rem_static_rate
              Force remote InfiniBand static rate

       -t, --time Time
              Set test duration to Time.  Specified in seconds however a trailing m, h or d indicates that the time is specified in minutes, hours or days respectively.

       -to, --timeout Time
              Set timeout to Time.  This is the timeout used for various things such as exchanging messages.  The default is 5 seconds.

       -lto, --loc_timeout Time
              Set local timeout to Time.  This may be used on the server to set the timeout when initially exchanging data with each client.  However, as soon as we receive  the  client's  parameters,  the
              client's remote timeout will override this parameter.

       -rto, --rem_timeout Time
              Set remote timeout to Time.

       -un, --unify_nodes
              Unify the nodes.  Describe them in terms of local and remote rather than send and receive.

       -uu, --unify_units
              Unify the units that results are shown in.  Uses the lowest common denominator.  Helpful for scripts.

       -ub, --use_bits_per_sec
              Use bits/sec rather than bytes/sec when displaying networking speed.

       -cm, --use_cm OnOff
              Use the RDMA Connection Manager (CM) if OnOff is non-zero.  It is necessary to use the CM for iWARP devices.  The default is to establish the connection without using the CM.  This only works
              for the tests that use the RC transport.

       -cm1   Use RDMA Connection Manager.

       -v, --verbose
              Provide more detailed output.  Turns on -vc, -vs, -vt and -vu.

       -vc, --verbose_conf
              Provide information on configuration.

       -vs, --verbose_stat
              Provide information on statistics.

       -vt, --verbose_time
              Provide information on timing.

       -vu, --verbose_used
              Provide information on parameters used.

       -vv, --verbose_more
              Provide even more detailed output.  Turns on -vvc, -vvs, -vvt and -vvu.

       -vvc, --verbose_more_conf
              Provide more information on configuration.

       -vvs, --verbose_more_stat
              Provide more information on statistics.

       -vvt, --verbose_more_time
              Provide more information on timing.

       -vvu, --verbose_more_used
              Provide more information on parameters used.

       -V, --version
              The current version of qperf is printed.

       -ws, --wait_server Time
              If the server is not ready, continue to try connecting for Time seconds before giving up.  The default is 5 seconds.

TESTS
       conf   Show configuration

       quit   Cause the server to quit

       rds_bw RDS streaming one way bandwidth

       rds_lat
              RDS one way latency

       sctp_bw
              SCTP streaming one way bandwidth

       sctp_lat
              SCTP one way latency

       tcp_bw TCP streaming one way bandwidth

       tcp_lat
              TCP one way latency

       udp_bw UDP streaming one way bandwidth

       udp_lat
              UDP one way latency

       rc_bi_bw
              RC streaming two way bandwidth

       rc_bw  RC streaming one way bandwidth

       rc_lat RC one way latency

       uc_bi_bw
              UC streaming two way bandwidth

       uc_bw  UC streaming one way bandwidth

       uc_lat UC one way latency

       ud_bi_bw
              UD streaming two way bandwidth

       ud_bw  UD streaming one way bandwidth

       ud_lat UD one way latency

       xrc_bi_bw
              XRC streaming two way bandwidth

       xrc_bw XRC streaming one way bandwidth

       xrc_lat
              XRC one way latency

       rc_rdma_read_bw
              RC RDMA read streaming one way bandwidth

       rc_rdma_read_lat
              RC RDMA read one way latency

       rc_rdma_write_bw
              RC RDMA write streaming one way bandwidth

       rc_rdma_write_lat
              RC RDMA write one way latency

       rc_rdma_write_poll_lat
              RC RDMA write one way polling latency

       uc_rdma_write_bw
              UC RDMA write streaming one way bandwidth

       uc_rdma_write_lat
              UC RDMA write one way latency

       uc_rdma_write_poll_lat
              UC RDMA write one way polling latency

       rc_compare_swap_mr
              RC compare and swap messaging rate

       rc_fetch_add_mr
              RC fetch and add messaging rate

       ver_rc_compare_swap
              Verify RC compare and swap

       ver_rc_fetch_add
              Verify RC fetch and add

AUTHOR
       Written by Johann George.

BUGS
       None of the RDMA tests are available if qperf is compiled without the RDMA libraries.  None of the XRC tests are available if qperf is compiled without the XRC extensions.  The -f option is not  yet
       implemented in many of the tests.



qperf                                                                                           November 2016                                                                                        QPERF(1)
