tcptracer(8)                                                  System Manager's Manual                                                 tcptracer(8)

NAME
       tcptracer - Trace TCP established connections. Uses Linux eBPF/bcc.

SYNOPSIS
       tcptracer [-h] [-v] [-p PID] [-N NETNS]

DESCRIPTION
       This  tool  traces established TCP connections that open and close while tracing, and prints a line of output per connect, accept and close
       events. This includes the type of event, PID, IP addresses and ports.

       This tool works by using kernel dynamic tracing, and will need to be updated if the kernel implementation  changes.  Only  established  TCP
       connections are traced, so it is expected that the overhead of this tool is rather low.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -v     Print full lines, with long event type names and network namespace numbers.

       -p PID Trace this process ID only (filtered in-kernel).

       -N NETNS
              Trace this network namespace only (filtered in-kernel).

       EXAMPLES

       Trace all TCP established connections:
              # tcptracer

       Trace all TCP established connections with verbose lines:
              # tcptracer -v

       Trace PID 181 only:
              # tcptracer -p 181

       Trace connections in network namespace 4026531969 only:
              # tcptracer -N 4026531969

FIELDS
       TYPE   Type of event. In non-verbose mode: C for connect, A for accept, X for close.

       PID    Process ID

       COMM   Process name

       IP     IP address family (4 or 6)

       SADDR  Source IP address.

       DADDR  Destination IP address.

       SPORT  Source port.

       DPORT  Destination port.

       NETNS  Network namespace where the event originated.

OVERHEAD
       This  traces  the kernel inet accept function, and the TCP connect, close, and set state functions. However, it only prints information for
       connections that are established, so it shouldn't have a huge overhead.

       As always, test and understand this tools overhead for your types of workloads before production use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Iago López Galeiras

SEE ALSO
       tcpaccept(8), tcpconnect(8), tcptop(8), tcplife(8)

USER COMMANDS                                                       2017-03-27                                                        tcptracer(8)
