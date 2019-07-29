tttview(1)                                                              net                                                             tttview(1)

NAME
       tttview - Tele Traffic Tapper viewer- a viewer program for remote, real-time, graphical traffic-monitoring.

SYNTAX
       tttview [-addr recv_addr] [-mcastifaddr addr] [-multicast] [-port recv_port] [-probe addr] [-yscale (K|M|n)]

DESCRIPTION
       tttview is the viewer program in the ttt program suite. tttview displays traffic-data collected on a remote host by tttprobe.

       To run tttview, it is not necessary to be "root".

       The  ttt program suite is yet another descendant of tcpdump but it is capable of real-time, graphical, local and remote traffic-monitoring.
       It won't replace tcpdump, rather, it helps you find out what to look into with tcpdump.

OPTIONS
       -addr recv_addr
              Specifies the local address. Only useful for multicast addresses. If omitted, "224.8.8.0 is used as default.

       -mcastifaddr addr
              Specifies the multicast interface address. Only useful when an interface is selected to join a multicast group.

       -multicast
              Shorthand for the default multicast destination "224.8.8.0".

       -port recv_port
              Specifies the udp port number to receive traffic-data from a remote tttprobe. If omitted, port 7288 is used as default.

       -probe addr
              Specifies the address of a probe. Only useful to select one among multiple probes.

       -yscale ('K'|'M'|n)
              change the scale of y-axis. 'K' and 'M' represent 1000 and 1000000 respectively.

EXAMPLES
       Remark: "hostA" is allways the host where traffic-data is collected with tttprobe and "hostB" is allways the host where the traffic-data is
       displayed with tttview.

       point-to-point monitoring:

              hostA: tttprobe hostB
              hostB: tttview

              or:

              hostA: tttprobe ip_of_hostB
              hostB: tttview

       multicast:

              when using the default multicast address:

              hostA: tttprobe -multicast
              hostB: tttview -multicast

              this is equivalent to:

              hostA: tttprobe 224.8.8.0
              hostB: tttview -addr 224.8.8.0

AUTHORS
       tttview was written by Kenjiro Cho < kjc@csl.sony.co.jp>.

       This  manual page was written by Thomas Scheffczyk <thomas.scheffczyk@verwaltung.uni-mainz.de>, for the Debian GNU/Linux system (but may be
       used by others).

SEE ALSO
       ttt(1), tttprobe(1)

Kenjiro Cho                                                             1.7                                                             tttview(1)
