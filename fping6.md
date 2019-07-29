FPING(8)                                                                                                                                  FPING(8)

NAME
       fping - send ICMP ECHO_REQUEST packets to network hosts

SYNOPSIS
       fping [ options ] [ systems... ] fping6 [ options ] [ systems... ]

DESCRIPTION
       fping is a program like ping which uses the Internet Control Message Protocol (ICMP) echo request to determine if a target host is
       responding.  fping differs from ping in that you can specify any number of targets on the command line, or specify a file containing the
       lists of targets to ping.  Instead of sending to one target until it times out or replies, fping will send out a ping packet and move on to
       the next target in a round-robin fashion.  In the default mode, if a target replies, it is noted and removed from the list of targets to
       check; if a target does not respond within a certain time limit and/or retry limit it is designated as unreachable. fping also supports
       sending a specified number of pings to a target, or looping indefinitely (as in ping ). Unlike ping, fping is meant to be used in scripts,
       so its output is designed to be easy to parse.

       The binary named fping6 is the same as fping, except that it uses IPv6 addresses instead of IPv4.

OPTIONS
       -a   Show systems that are alive.

       -A   Display targets by address rather than DNS name. Combined with -d, the output will be both the ip and (if available) the hostname.

       -b n Number of bytes of ping data to send.  The minimum size (normally 12) allows room for the data that fping needs to do its work
            (sequence number, timestamp).  The reported received data size includes the IP header (normally 20 bytes) and ICMP header (8 bytes),
            so the minimum total size is 40 bytes.  Default is 56, as in ping. Maximum is the theoretical maximum IP datagram size (64K), though
            most systems limit this to a smaller, system-dependent number.

       -B n Backoff factor. In the default mode, fping sends several requests to a target before giving up, waiting longer for a reply on each
            successive request.  This parameter is the value by which the wait time (-t) is multiplied on each successive request; it must be
            entered as a floating-point number (x.y). The default is 1.5.

       -c n Number of request packets to send to each target.  In this mode, a line is displayed for each received response (this can suppressed
            with -q or -Q).  Also, statistics about responses for each target are displayed when all requests have been sent (or when
            interrupted).

       -C n Similar to -c, but the per-target statistics are displayed in a format designed for automated response-time statistics gathering. For
            example:

             % fping -C 5 -q somehost
             somehost : 91.7 37.0 29.2 - 36.8

            shows the response time in milliseconds for each of the five requests, with the "-" indicating that no response was received to the
            fourth request.

       -d   Use DNS to lookup address of return ping packet. This allows you to give fping a list of IP addresses as input and print hostnames in
            the output.

       -D   Add Unix timestamps in front of output lines generated with in looping or counting modes (-l, -c, or -C).

       -e   Show elapsed (round-trip) time of packets.

       -f   Read list of targets from a file.  This option can only be used by the root user. Regular users should pipe in the file via stdin:

             % fping < targets_file

       -g addr/mask
            Generate a target list from a supplied IP netmask, or a starting and ending IP.  Specify the netmask or start/end in the targets
            portion of the command line. If a network with netmask is given, the network and broadcast addresses will be excluded. ex. To ping the
            network 192.168.1.0/24, the specified command line could look like either:

             fping -g 192.168.1.0/24

            or

             fping -g 192.168.1.1 192.168.1.254

       -h   Print usage message.

       -i n The minimum amount of time (in milliseconds) between sending a ping packet to any target (default is 25).

       -l   Loop sending packets to each target indefinitely. Can be interrupted with Ctrl-C; statistics about responses for each target are then
            displayed.

       -m   Send pings to each of a target host's multiple interfaces.

       -n   Same as -d.

       -p <n>
            In looping or counting modes (-l, -c, or -C), this parameter sets the time in milliseconds that fping waits between successive packets
            to an individual target.  Default is 1000.

       -q   Quiet. Don't show per-probe results, but only the final summary. Also don't show ICMP error messages.

       -Q n Like -q, but show summary results every n seconds.

       -r n Retry limit (default 3). This is the number of times an attempt at pinging a target will be made, not including the first try.

       -R   Instead of using all-zeros as the packet data, generate random bytes.  Use to defeat, e.g., link data compression.

       -s   Print cumulative statistics upon exit.

       -S addr
            Set source address.

       -I if
            Set the interface (requires SO_BINDTODEVICE support)

       -t n Initial target timeout in milliseconds (default 500). In the default mode, this is the amount of time that fping waits for a response
            to its first request.  Successive timeouts are multiplied by the backoff factor specified with -B.  Note that this option has no
            effect looping or counting modes (-l, -c, or -C).

       -T n Ignored (for compatibility with fping 2.4).

       -u   Show targets that are unreachable.

       -O n Set the typ of service flag (TOS). n can be either decimal or hexadecimal (0xh) format.

       -v   Print fping version information.

       -H n Set the IP TTL field (time to live hops).

EXAMPLES
       Generate ~1000 pings per second to a host until canceled, printing statistics on the fly at one second intervals, and printing statistics
       at the end:

       # fping -s -l -i 1 -p 1 -T 1 -Q 1 127.0.0.1

       Note that ping intervals less than 10ms can only be used as root.

AUTHORS
       ·   Roland J. Schemers III, Stanford University, concept and versions 1.x

       ·   RL "Bob" Morgan, Stanford University, versions 2.x

       ·   David Papp, versions 2.3x and up

       ·   David Schweikert, versions 3.0 and up

       fping website: <http://www.fping.org>

DIAGNOSTICS
       Exit status is 0 if all the hosts are reachable, 1 if some hosts were unreachable, 2 if any IP addresses were not found, 3 for invalid
       command line arguments, and 4 for a system call failure.

RESTRICTIONS
       If certain options are used (i.e, a low value for -i and -t, and a high value for -r) it is possible to flood the network. This program
       must be installed as setuid root in order to open up a raw socket, or must be run by root. In order to stop mere mortals from hosing the
       network, normal users can't specify the following:

       ·   -i n, where n < 10 msec

       ·   -r n, where n > 20

       ·   -t n, where n < 250 msec

SEE ALSO
       ping(8)

fping                                                               2015-10-21                                                            FPING(8)
