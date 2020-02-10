MTR(8)                                                                                             mtr                                                                                             MTR(8)

NAME
       mtr - a network diagnostic tool

SYNOPSIS
       mtr  [-4|-6]  [-F FILENAME]  [--report] [--report-wide] [--xml] [--gtk] [--curses] [--raw] [--csv] [--split] [--no-dns] [--show-ips] [-o FIELDS] [-y IPINFO] [--aslookup] [-i INTERVAL] [-c COUNT]
       [-s PACKETSIZE] [-B BITPATTERN] [-Q TOS] [--mpls] [-a ADDRESS] [-f FIRST-TTL] [-m MAX-TTL] [--udp] [--tcp] [-P PORT] [-Z TIMEOUT] [-M MARK] HOSTNAME

DESCRIPTION
       mtr combines the functionality of the traceroute and ping programs in a single network diagnostic tool.

       As mtr starts, it investigates the network connection between the host mtr runs on and HOSTNAME by sending packets with purposely low TTLs.  It continues to send packets with low TTL, noting the
       response  time  of  the intervening routers.  This allows mtr to print the response percentage and response times of the internet route to HOSTNAME.  A sudden increase in packet loss or response
       time is often an indication of a bad (or simply overloaded) link.

       The results are usually reported as round-trip-response times in miliseconds and the percentage of packetloss.

OPTIONS
       -h, --help
              Print the summary of command line argument options.

       -v, --version
              Print the installed version of mtr.

       -4     Use IPv4 only.

       -6     Use IPv6 only.  (IPV4 may be used for DNS lookups).

       -F FILENAME, --filename FILENAME
              MISSING

       -r, --report
              This option puts mtr into report mode.  When in this mode, mtr will run for the number of cycles specified by the -c option, and then print statistics and exit.

              This mode is useful for generating statistics about network quality.  Note that each running instance of mtr generates a significant amount of network traffic.  Using mtr to  measure  the
              quality of your network may result in decreased network performance.

       -w, --report-wide
              This option puts mtr into wide report mode.  When in this mode, mtr will not cut hostnames in the report.

       -x, --xml
              Use this option to tell mtr to use the xml output format.  This format is better suited for automated processing of the measurement results.

       -t, --curses
              Use this option to force mtr to use the curses based terminal interface (if available).

       -g, --gtk
              Use this option to force mtr to use the GTK+ based X11 window interface (if available).  GTK+ must have been available on the system when mtr was built for this to work.  See the GTK+ web
              page at http://www.gtk.org/ for more information about GTK+.

       -l, --raw
              Use this option to tell mtr to use the raw output format.  This format is better suited for archival of the measurement results.  It could be parsed to be presented into any of the  other
              display methods.

       -C, --csv
              MISSING

       -p, --split
              Use this option to set mtr to spit out a format that is suitable for a split-user interface.

       -n, --no-dns
              Use this option to force mtr to display numeric IP numbers and not try to resolve the host names.

       -b, --show-ips
              Use  this  option  to  tell  mtr to display both the host names and numeric IP numbers.  In split mode this adds an extra field to the output.  In report mode, there is usually too little
              space to add the IPs, and they will be truncated.  Use the wide report (-w) mode to see the IPs in report mode.

       -o FIELDS, --order FIELDS
              Use this option to specify which fields to display and in which order.  You may use one or more space characters to separate fields.
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
              Example: -o "LSD NBAW  X"

       -y n, --ipinfo n
              MISSING

       -z, --aslookup
              MISSING

       -i SECONDS, --interval SECONDS
              Use this option to specify the positive number of seconds between ICMP ECHO requests.  The default value for this parameter is one second.  The root user may choose  values  between  zero
              and one.

       -c COUNT, --report-cycles COUNT
              Use this option to set the number of pings sent to determine both the machines on the network and the reliability of those machines.  Each cycle lasts one second.

       -s PACKETSIZE, --psize PACKETSIZE
              This option sets the packet size used for probing.  It is in bytes, inclusive IP and ICMP headers.

              If set to a negative number, every iteration will use a different, random packet size up to that number.

       -B NUM, --bitpattern NUM
              Specifies bit pattern to use in payload.  Should be within range 0 - 255.  If NUM is greater than 255, a random pattern is used.

       -Q NUM, --tos NUM
              Specifies value for type of service field in IP header.  Should be within range 0 - 255.

       -e, --mpls
              Use this option to tell mtr to display information from ICMP extensions for MPLS (RFC 4950) that are encoded in the response packets.

       -a ADDRESS, --address ADDRESS
              Use  this option to bind the outgoing socket to ADDRESS, so that all packets will be sent with ADDRESS as source address.  NOTE that this option doesn't apply to DNS requests (which could
              be and could not be what you want).

       -f NUM, --first-ttl NUM
              Specifies with what TTL to start.  Defaults to 1.

       -m NUM, --max-ttl NUM
              Specifies the maximum number of hops (max time-to-live value) traceroute will probe.  Default is 30.

       -u, --udp
              Use UDP datagrams instead of ICMP ECHO.

       -T, --tcp
              Use TCP SYN packets instead of ICMP ECHO.  PACKETSIZE is ignored, since SYN packets can not contain data.

       -P PORT, --port PORT
              The target port number for TCP traces.

       -Z SECONDS, --timeout SECONDS
              The number of seconds to keep the TCP socket open before giving up on the connection.  This will only affect the final hop.  Using large values for this, especially combined with a  short
              interval, will use up a lot of file descriptors.

       -M MARK, --mark MARK
              MISSING

ENVIRONMENT
       mtr recognizes a few environment variables.

       MTR_OPTIONS
              This environment variable allows to specify options, as if they were passed on the command line.  It is parsed before reading the actual command line options, so that options specified in
              MTR_OPTIONS are overriden by command-line options.

              Example:

              MTR_OPTIONS="-4 -c 1" mtr -6 localhost

              would send one probe (because of -c 1) towards ::1 (because of -6, which overrides the -4 passed in MTR_OPTIONS).

       DISPLAY
              Used for the GTK+ frontend.

BUGS
       Some modern routers give a lower priority to ICMP ECHO packets than to other network traffic.  Consequently, the reliability of these routers reported by mtr will be significantly lower than the
       actual reliability of these routers.

CONTACT INFORMATION
       For the latest version, see the mtr web page at http://www.bitwizard.nl/mtr/.

       The mtr mailinglist was little used and is no longer active.

       For patches, bug reports, or feature requests, please open an issue on GitHub at: https://github.com/traviscross/mtr.

SEE ALSO
       traceroute(8), ping(8) TCP/IP Illustrated (Stevens, ISBN 0201633469).

mtr                                                                                           July 12, 2014                                                                                        MTR(8)
