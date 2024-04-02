tcpsubnet(8)                                                  System Manager's Manual                                                 tcpsubnet(8)

NAME
       tcpsubnet - Summarize and aggregate IPv4 TCP traffic by subnet.

SYNOPSIS
       tcpsubnet [-h] [-v] [--ebpf] [-J] [-f FORMAT] [-i INTERVAL] [subnets]

DESCRIPTION
       This tool summarizes and aggregates IPv4 TCP sent to the subnets passed in argument and prints to stdout on a fixed interval.

       This uses dynamic tracing of kernel TCP send/receive functions, and will need to be updated to match kernel changes.

       The  traced  data is summarized in-kernel using a BPF map to reduce overhead.  At very high TCP event rates, the overhead may still be mea‐
       surable.  See the OVERHEAD section for more details.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print USAGE message.

       -v     Run in verbose mode. Will output subnet evaluation and the BPF program

       -J     Format output in JSON.

       -i     Interval between updates, seconds (default 1).

       -f     Format output units. Supported values are bkmBKM. When using kmKM the output will be rounded to floor.

       --ebpf Prints the BPF program.

       subnets
              Comma   separated   list   of   subnets.   Traffic   will   be   categorized   in   theses   subnets.   Order   matters.    (default
              127.0.0.1/32,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,0.0.0.0/0)

EXAMPLES
       Summarize TCP traffic by the default subnets:
              # tcpsubnet

       Summarize all TCP traffic:
              # tcpsubnet 0.0.0.0/0

       Summarize all TCP traffic and output in JSON and Kb:
              # tcpsubnet -J -fk 0.0.0.0/0

FIELDS
       (Standad output) Left hand side column:
              Subnet

       (Standard output) Right hand side column:
              Aggregate traffic in units passed as argument

       (JSON output) date
              Current date formatted in the system locale

       (JSON output) time
              Current time formatted in the system locale

       (JSON output) entries
              Map of subnets to aggregates. Values will be in format passed to -f

OVERHEAD
       This  traces  all  tcp_sendmsg  function  calls in the TCP/IP stack.  It summarizes data in-kernel to reduce overhead.  A simple iperf test
       (v2.0.5) with the default values shows a loss of ~5% throughput. On 10 runs without tcpsubnet running the average throughput was 32.42Gb/s,
       with  tcpsubnet enabled it was 31.26Gb/s.  This is not meant to be used as a long running service. Use it for troubleshooting or for a con‐
       trolled interval. As always, try it out in a test environment first.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Rodrigo Manyari

INSPIRATION
       tcptop(8) by Brendan Gregg

SEE ALSO
       netlink(7)

USER COMMANDS                                                       2018-03-01                                                        tcpsubnet(8)
