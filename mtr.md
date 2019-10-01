MTR(8)                                                                                               mtr                                                                                               MTR(8)



NAME
       mtr - a network diagnostic tool



SYNOPSIS
       mtr   [-BfhvrctglxspQemniuTP46]   [--help]   [--version]  [--report]  [--report-wide]  [--report-cycles COUNT]  [--curses]  [--split]  [--raw]  [  --xml]  [--mpls]  [--no-dns]  [--show-ips]  [--gtk]
       [--address IP.ADD.RE.SS] [--interval SECONDS] [--max-ttl NUM] [--first-ttl NUM] [--bitpattern NUM] [--tos NUM] [--psize BYTES | -s BYTES] [--tcp] [--udp] [--port PORT]  [--timeout SECONDS]  HOSTNAME
       [PACKETSIZE]



DESCRIPTION
       mtr combines the functionality of the traceroute and ping programs in a single network diagnostic tool.


       As  mtr  starts,  it investigates the network connection between the host mtr runs on and HOSTNAME.  by sending packets with purposely low TTLs. It continues to send packets with low TTL, noting the
       response time of the intervening routers.  This allows mtr to print the response percentage and response times of the internet route to HOSTNAME.  A sudden increase in packet loss or  response  time
       is often an indication of a bad (or simply overloaded) link.


       The results are usually reported as round-trip-response times in miliseconds and the percentage of packetloss.


OPTIONS
       -h

       --help
              Print the summary of command line argument options.


       -v

       --version
              Print the installed version of mtr.


       -r

       --report
              This option puts mtr into report mode.  When in this mode, mtr will run for the number of cycles specified by the -c option, and then print statistics and exit.

              This mode is useful for generating statistics about network quality.  Note that each running instance of mtr generates a significant amount of network traffic.  Using mtr to measure the qual‐
              ity of your network may result in decreased network performance.


       -w

       --report-wide
              This option puts mtr into wide report mode.  When in this mode, mtr will not cut hostnames in the report.


       -c COUNT

       --report-cycles COUNT
              Use this option to set the number of pings sent to determine both the machines on the network and the reliability of those machines.  Each cycle lasts one second.


       -s BYTES

       --psize BYTES

       PACKETSIZE
              These options or a trailing PACKETSIZE on the command line sets the packet size used for probing.  It is in bytes inclusive IP and ICMP headers

              If set to a negative number, every iteration will use a different, random packet size upto that number.

       -t

       --curses
              Use this option to force mtr to use the curses based terminal interface (if available).


       -e

       --mpls
              Use this option to tell mtr to display information from ICMP extensions for MPLS (RFC 4950) that are encoded in the response packets.


       -n

       --no-dns
              Use this option to force mtr to display numeric IP numbers and not try to resolve the host names.


       -b

       --show-ips
              Use this option to tell mtr to display both the host names and numeric IP numbers.  In split mode this adds an extra field to the output. In report mode, there is usually too little space  to
              add the IPs, and they will be truncated. Use the wide report (-w) mode to see the IPs in report mode.


       -o fields order

       --order fields order
              Use this option to specify the fields and their order when loading mtr.
              Available fields:

                                                                                                 ┌──┬─────────────────────┐
                                                                                                 │L │ Loss ratio          │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │D │ Dropped packets     │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │R │ Received packets    │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │S │ Sent Packets        │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │N │ Newest RTT(ms)      │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │B │ Min/Best RTT(ms)    │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │A │ Average RTT(ms)     │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │W │ Max/Worst RTT(ms)   │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │V │ Standard Deviation  │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │G │ Geometric Mean      │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │J │ Current Jitter      │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │M │ Jitter Mean/Avg.    │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │X │ Worst Jitter        │
                                                                                                 ├──┼─────────────────────┤
                                                                                                 │I │ Interarrival Jitter │
                                                                                                 └──┴─────────────────────┘
              Example: -o "LSD NBAW"

       -g

       --gtk
              Use  this  option  to  force mtr to use the GTK+ based X11 window interface (if available).  GTK+ must have been available on the system when mtr was built for this to work.  See the GTK+ web
              page at http://www.gtk.org/ for more information about GTK+.


       -p

       --split
              Use this option to set mtr to spit out a format that is suitable for a split-user interface.


       -l

       --raw
              Use this option to tell mtr to use the raw output format. This format is better suited for archival of the measurement results. It could be parsed to be presented into any of the  other  dis‐
              play methods.


       -x

       --xml
              Use this option to tell mtr to use the xml output format. This format is better suited for automated processing of the measurement results.


       -a IP.ADD.RE.SS

       --address IP.ADD.RE.SS
              Use  this  option  to  bind  outgoing packets' socket to specific interface, so that any packet will be sent through this interface. NOTE that this option doesn't apply to DNS requests (which
              could be and could not be what you want).


       -i SECONDS

       --interval SECONDS
              Use this option to specify the positive number of seconds between ICMP ECHO requests.  The default value for this parameter is one second.


       -m NUM

       --max-ttl NUM
              Specifies the maximum number of hops (max time-to-live value) traceroute will probe. Default is 30.


       -f NUM

       --first-ttl NUM
              Specifies with what TTL to start. Defaults to 1.


       -B NUM

       --bitpattern NUM
              Specifies bit pattern to use in payload. Should be within range 0 - 255.


       -Q NUM

       --tos NUM
              Specifies value for type of service field in IP header. Should be within range 0 - 255.


       -u

       --udp
              Use UDP datagrams instead of ICMP ECHO.


       -T

       --tcp
              Use TCP SYN packets instead of ICMP ECHO. PACKETSIZE is ignored, since SYN packets can not contain data.


       -P PORT

       --port PORT
              The target port number for TCP traces.


       --timeout SECONDS
              The number of seconds to keep the TCP socket open before giving up on the connection. This will only affect the final hop. Using large values for this, especially combined with a short inter‐
              val, will use up a lot of file descriptors.


       -4
              Use IPv4 only.


       -6
              Use IPv6 only.


BUGS
       Some  modern  routers  give  a lower priority to ICMP ECHO packets than to other network traffic.  Consequently, the reliability of these routers reported by mtr will be significantly lower than the
       actual reliability of these routers.



CONTACT INFORMATION
       For the latest version, see the mtr web page at http://www.bitwizard.nl/mtr/.


       The mtr mailinglist was little used and is no longer active.


       Bug reports and feature requests should be submitted to the launchpad mtr bugtracker.


SEE ALSO
       traceroute(8), ping(8) TCP/IP Illustrated (Stevens, ISBN 0201633469).



mtr                                                                                             March 4, 1999                                                                                          MTR(8)
