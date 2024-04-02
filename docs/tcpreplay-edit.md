TCPREPLAY(1)                                                    Programmer's Manual                                                   TCPREPLAY(1)

NAME
       tcpreplay - Replay network traffic stored in pcap files

SYNOPSIS
       tcpreplay [-flag [value]]... [--opt-name [[=| ]value]]...
               <pcap_file(s)>

       tcpreplay is a tool for replaying network traffic from files saved with tcpdump or other tools which write pcap(3) files.

DESCRIPTION
       This  manual  page  briefly  documents the tcpreplay command.  The basic operation of tcpreplay is to resend  all  packets  from  the input
       file(s) at the speed at which they were recorded, or a specified data rate, up to as fast as the hardware is capable.

       Optionally, the traffic can be split between two interfaces, written to files, filtered and edited in various ways, providing the means  to
       test firewalls, NIDS and other network devices.

       For more details, please see the Tcpreplay Manual at: http://tcpreplay.synfin.net/trac/wiki/manual

OPTIONS

       -r string, --portmap=string
              Rewrite TCP/UDP ports.  This option may appear up to -1 times.

              Specify  a list of comma delimited port mappingings consisting of colon delimited port number pairs.  Each colon delimited port pair
              consists of the port to match followed by the port number to rewrite.

              Examples:
                  --portmap=80:8000 --portmap=8080:80    # 80->8000 and 8080->80
                  --portmap=8000,8080,88888:80           # 3 different ports become 80
                  --portmap=8000-8999:80                 # ports 8000 to 8999 become 80

       -s number, --seed=number
              Randomize src/dst IPv4/v6 addresses w/ given seed.  This option may appear up to 1 times.  This option takes an  integer  number  as
              its argument.

              Causes  the  source and destination IPv4/v6 addresses to be pseudo randomized but still maintain client/server relationships.  Since
              the randomization is deterministic based on the seed, you can reuse the same seed value to recreate the traffic.

       -N string, --pnat=string
              Rewrite IPv4/v6 addresses using pseudo-NAT.  This option may appear up to 2 times.  This option must not appear in combination  with
              any of the following options: srcipmap.

              Takes  a  comma  delimited  series  of colon delimited CIDR netblock pairs.  Each netblock pair is evaluated in order against the IP
              addresses.  If the IP address in the packet matches the first netblock, it is rewriten using the second netblock as a  mask  against
              the high order bits.

              IPv4 Example:
                  --pnat=192.168.0.0/16:10.77.0.0/16,172.16.0.0/12:10.1.0.0/24
              IPv6 Example:
                  --pnat=[2001:db8::/32]:[dead::/16],[2001:db8::/32]:[::ffff:0:0/96]

       -S string, --srcipmap=string
              Rewrite  source  IPv4/v6 addresses using pseudo-NAT.  This option may appear up to 1 times.  This option must not appear in combina‐
              tion with any of the following options: pnat.

              Works just like the --pnat option, but only affects the source IP addresses in the IPv4/v6 header.

       -D string, --dstipmap=string
              Rewrite destination IPv4/v6 addresses using pseudo-NAT.  This option may appear up to 1 times.  This option must not appear in  com‐
              bination with any of the following options: pnat.

              Works just like the --pnat option, but only affects the destination IP addresses in the IPv4/v6 header.

       -e string, --endpoints=string
              Rewrite  IP  addresses  to  be between two endpoints.  This option may appear up to 1 times.  This option must appear in combination
              with the following options: cachefile.

              Takes a pair of colon delimited IPv4/v6 addresses which will be used to rewrite all traffic to appear to be between the two IP's.

              IPv4 Example:
                  --endpoints=172.16.0.1:172.16.0.2
              IPv6 Example:
                  --endpoints=[2001:db8::dead:beef]:[::ffff:0:0:ac:f:0:2]

       -b, --skipbroadcast
              Skip rewriting broadcast/multicast IPv4/v6 addresses.

              By default --seed, --pnat and --endpoints will rewrite broadcast and multicast IPv4/v6 and MAC addresses.     Setting this flag will
              keep broadcast/multicast IPv4/v6 and MAC addresses from being rewritten.

       -C, --fixcsum
              Force recalculation of IPv4/TCP/UDP header checksums.

              Causes  each  IPv4/v6 packet to have it's checksums recalcualted and fixed.  Automatically enabled for packets modified with --seed,
              --pnat, --endpoints or --fixlen.

       -m number, --mtu=number
              Override default MTU length (1500 bytes).  This option may appear up to 1 times.  This option takes an integer number as  its  argu‐
              ment.  The value of number is constrained to being:
                  in the range  1 through MAXPACKET

              Override the default 1500 byte MTU size for determining the maximum padding length (--fixlen=pad) or when truncating (--mtu-trunc).

       --mtu-trunc
              Truncate packets larger then specified MTU.  This option may appear up to 1 times.

              Similar to --fixlen, this option will truncate data in packets from Layer 3 and above to be no larger then the MTU.

       -E, --efcs
              Remove Ethernet checksums (FCS) from end of frames.

              Note, this option is pretty dangerous!  We don't actually check to see if a FCS actually exists in the frame, we just blindly delete
              the last two bytes.  Hence, you should only use this if you know know that your OS provides the FCS when reading raw packets.

       --ttl=string
              Modify the IPv4/v6 TTL/Hop Limit.

              Allows you to modify the TTL/Hop Limit of all the IPv4/v6 packets.  Specify a number to hard-code the value or +/-value to increase
              or decrease by the value provided (limited to 1-255).

              Examples:
                  --ttl=10
                  --ttl=+7
                  --ttl=-64

       --tos=number
              Set the IPv4 TOS/DiffServ/ECN byte.  This option may appear up to 1 times.  This option takes an integer number as its argument.
              The value of number is constrained to being:
                  in the range  0 through 255

              Allows you to override the TOS (also known as DiffServ/ECN) value in IPv4.

       --tclass=number
              Set the IPv6 Traffic Class byte.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The
              value of number is constrained to being:
                  in the range  0 through 255

              Allows you to override the IPv6 Traffic Class field.

       --flowlabel=number
              Set the IPv6 Flow Label.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of
              number is constrained to being:
                  in the range  0 through 1048575

              Allows you to override the 20bit IPv6 Flow Label field.  Has no effect on IPv4 packets.

       -F string, --fixlen=string
              Pad or truncate packet data to match header length.  This option may appear up to 1 times.

              Packets may be truncated during capture if the snaplen is smaller then the packet.  This option allows you to modify the packet to
              pad the packet back out to the size stored in the IPv4/v6 header or rewrite the IP header total length to reflect the stored packet
              length.

              pad Truncated packets will be padded out so that the packet length matches the IPv4 total length

              trunc Truncated packets will have their IPv4 total length field rewritten to match the actual packet length

              del Delete the packet

       --skipl2broadcast
              Skip rewriting broadcast/multicast Layer 2 addresses.

              By default, editing Layer 2 addresses will rewrite broadcast and multicast MAC addresses.  Setting this flag will keep broad‐
              cast/multicast MAC addresses from being rewritten.

       --dlt=string
              Override output DLT encapsulation.  This option may appear up to 1 times.

              By default, no DLT (data link type) conversion will be made.  To change the DLT type of the output pcap, select one of the following
              values:

              enet Ethernet aka DLT_EN10MB

              hdlc Cisco HDLC aka DLT_C_HDLC

              user User specified Layer 2 header and DLT type

       --enet-dmac=string
              Override destination ethernet MAC addresses.  This option may appear up to 1 times.

              Takes a pair of comma deliminated ethernet MAC addresses which will replace the destination MAC address of outbound packets.  The
              first MAC address will be used for the server to client traffic and the optional second MAC address will be used for the client to
              server traffic.

              Example:
                  --enet-dmac=00:12:13:14:15:16,00:22:33:44:55:66

       --enet-smac=string
              Override source ethernet MAC addresses.  This option may appear up to 1 times.

              Takes a pair of comma deliminated ethernet MAC addresses which will replace the source MAC address of outbound packets.  The first
              MAC address will be used for the server to client traffic and the optional second MAC address will be used for the client to server
              traffic.

              Example:
                  --enet-smac=00:12:13:14:15:16,00:22:33:44:55:66

       --enet-vlan=string
              Specify ethernet 802.1q VLAN tag mode.  This option may appear up to 1 times.

              Allows you to rewrite ethernet frames to add a 802.1q header to standard 802.3 ethernet headers or remove the 802.1q VLAN tag infor‐
              mation.

              add Rewrites the existing 802.3 ethernet header as an 802.1q VLAN header

              del Rewrites the existing 802.1q VLAN header as an 802.3 ethernet header

       --enet-vlan-tag=number
              Specify the new ethernet 802.1q VLAN tag value.  This option may appear up to 1 times.  This option must appear in combination with
              the following options: enet-vlan.  This option takes an integer number as its argument.  The value of number is constrained to
              being:
                  in the range  0 through 4095

       --enet-vlan-cfi=number
              Specify the ethernet 802.1q VLAN CFI value.  This option may appear up to 1 times.  This option must appear in combination with the
              following options: enet-vlan.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 1

       --enet-vlan-pri=number
              Specify the ethernet 802.1q VLAN priority.  This option may appear up to 1 times.  This option must appear in combination with the
              following options: enet-vlan.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 7

       --hdlc-control=number
              Specify HDLC control value.  This option may appear up to 1 times.  This option takes an integer number as its argument.

              The Cisco HDLC header has a 1 byte "control" field.  Apparently this should always be 0, but if you can use any 1 byte value.

       --hdlc-address=number
              Specify HDLC address.  This option may appear up to 1 times.  This option takes an integer number as its argument.

              The Cisco HDLC header has a 1 byte "address" field which has two valid values:

              0x0F Unicast

              0xBF Broadcast
              You can however specify any single byte value.

       --user-dlt=number
              Set output file DLT type.  This option may appear up to 1 times.  This option takes an integer number as its argument.

              Set the DLT value of the output pcap file.

       --user-dlink=string
              Rewrite Data-Link layer with user specified data.  This option may appear up to 2 times.

              Provide a series of comma deliminated hex values which will be used to rewrite or create the Layer 2 header of the packets.  The
              first instance of this argument will rewrite both server and client traffic, but if this argument is specified a second time, it
              will be used for the client traffic.

              Example:
                  --user-dlink=01,02,03,04,05,06,00,1A,2B,3C,4D,5E,6F,08,00

       -d number, --dbug=number
              Enable debugging output.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of
              number is constrained to being:
                  in the range  0 through 5
              The default number for this option is:
                   0

              If configured with --enable-debug, then you can specify a verbosity level for debugging output.  Higher numbers increase verbosity.

       -q, --quiet
              Quiet mode.

              Print nothing except the statistics at the end of the run

       -T string, --timer=string
              Select packet timing mode: select, ioport, rdtsc, gtod, nano, abstime.  This option may appear up to 1 times.  The default string
              for this option is:
                   gtod

              Allows you to select the packet timing method to use:

              nano - Use nanosleep() API

              select - Use select() API

              ioport - Write to the i386 IO Port 0x80

              rdtsc - Use the x86/x86_64/PPC RDTSC

              gtod [default] - Use a gettimeofday() loop

              abstime - Use OS X's AbsoluteTime API

       --sleep-accel=number
              Reduce the amount of time to sleep by specified usec.  This option takes an integer number as its argument.  The default number for
              this option is:
                   0

              Reduce the amount of time we would normally sleep between two packets by the specified number of usec.  This provides a "fuzz fac‐
              tor" to compensate for running on a non-RTOS and other processes using CPU time.  Default is disabled.

       --rdtsc-clicks=number
              Specify the RDTSC clicks/usec.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The
              default number for this option is:
                   0

              Override the calculated number of RDTSC clicks/usec which is often the speed of the CPU in Mhz.  Only useful if you specified
              --timer=rdtsc

       -v, --verbose
              Print decoded packets via tcpdump to STDOUT.  This option may appear up to 1 times.

       -A string, --decode=string
              Arguments passed to tcpdump decoder.  This option may appear up to 1 times.  This option must appear in combination with the follow‐
              ing options: verbose.

              When enabling verbose mode (-v) you may also specify one or more additional  arguments to pass to tcpdump to modify the way packets
              are decoded.  By default, -n and -l are used.   Be  sure  to quote the arguments like: -A "-axxx" so that they are not interpreted
              by tcpreplay.   Please see the tcpdump(1) man page for a complete list of options.

       -K, --enable-file-cache
              Enable caching of packets to internal memory.  This option must appear in combination with the following options: loop.

              Cache pcap file(s) the first time they are cached in RAM so that subsequent loops don't incurr any disk I/O latency in order to
              increase performance.  Make sure you have enough free RAM to store the entire pcap file(s) in memory or the system will swap and
              performance will suffer.

       --preload-pcap
              Preloads packets into RAM before sending.

              This option loads the specified pcap(s) into RAM before starting to send in order to improve replay performance while introducing a
              startup performance hit.  Preloading can be used with or without --loop and implies --enable-file-cache.

       -c string, --cachefile=string
              Split traffic via a tcpprep cache file.  This option may appear up to 1 times.

       -i string, --intf1=string
              Server/primary traffic output interface.  This option may appear up to 1 times.

       -I string, --intf2=string
              Client/secondary traffic output interface.  This option may appear up to 1 times.  This option must appear in combination with the
              following options: cachefile.

       --listnics
              List available network interfaces and exit.

       -l number, --loop=number
              Loop through the capture file X times.  This option may appear up to 1 times.  This option takes an integer number as its argument.
              The value of number is constrained to being:
                  greater than or equal to 0
              The default number for this option is:
                   1

       --pktlen
              Override the snaplen and use the actual packet len.  This option may appear up to 1 times.

              By default, tcpreplay will send packets based on the size of the "snaplen" stored in the pcap file which is usually the correct
              thing to do.  However, occasionally, tools will store more bytes then told to.  By specifying this option, tcpreplay will ignore the
              snaplen field and instead try to send packets based on the original packet length.  Bad things may happen if you specify this
              option.

       -L number, --limit=number
              Limit the number of packets to send.  This option may appear up to 1 times.  This option takes an integer number as its argument.
              The value of number is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   -1

              By default, tcpreplay will send all the packets.  Alternatively, you can specify a maximum number of packets to send.

       -x string, --multiplier=string
              Modify replay speed to a given multiple.  This option may appear up to 1 times.  This option must not appear in combination with any
              of the following options: pps, mbps, oneatatime, topspeed.

              Specify a floating point value to modify the packet replay speed.  Examples:
                      2.0 will replay traffic at twice the speed captured
                      0.7 will replay traffic at 70% the speed captured

       -p number, --pps=number
              Replay packets at a given packets/sec.  This option may appear up to 1 times.  This option must not appear in combination with any
              of the following options: multiplier, mbps, oneatatime, topspeed.  This option takes an integer number as its argument.

       -M string, --mbps=string
              Replay packets at a given Mbps.  This option may appear up to 1 times.  This option must not appear in combination with any of the
              following options: multiplier, pps, oneatatime, topspeed.

              Specify a floating point value for the Mbps rate that tcpreplay should send packets at.

       -t, --topspeed
              Replay packets as fast as possible.  This option must not appear in combination with any of the following options: mbps, multiplier,
              pps, oneatatime.

       -o, --oneatatime
              Replay one packet at a time for each user input.  This option must not appear in combination with any of the following options:
              mbps, pps, multiplier, topspeed.

              Allows you to step through one or more packets at a time.

       --pps-multi=number
              Number of packets to send for each time interval.  This option must appear in combination with the following options: pps.  This
              option takes an integer number as its argument.  The value of number is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   1

              When trying to send packets at very high rates, the time between each packet can be so short that it is impossible to accurately
              sleep for the required period of time.  This option allows you to send multiple packets at a time, thus allowing for longer sleep
              times which can be more accurately implemented.

       -P, --pid
              Print the PID of tcpreplay at startup.

       --stats=number
              Print statistics every X seconds.  This option takes an integer number as its argument.  The value of number is constrained to
              being:
                  greater than or equal to 1

              Note that this is very much a "best effort" and long delays between sending packets may cause equally long delays between printing
              statistics.

       -V, --version
              Print version information.

       -h, --less-help
              Display less usage information and exit.

       -H, --help
              Display usage information and exit.

       -!, --more-help
              Extended usage information passed thru pager.

       - [rcfile], --save-opts[=rcfile]
              Save the option state to rcfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.

       - rcfile, --load-opts=rcfile, --no-load-opts
              Load options from rcfile.  The no-load-opts form will disable the loading of earlier RC/INI files.  --no-load-opts is handled early,
              out of order.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s).  The homerc
       file is "$$/", unless that is a directory.  In that case, the file ".tcpreplayrc" is searched for within that directory.

SIGNALS
       tcpreplay understands the following signals:

       SIGUSR1 Suspend tcpreplay

       SIGCONT Restart tcpreplay

SEE ALSO
       tcpreplay-edit(1), tcpdump(1), tcpprep(1), tcprewrite(1), libnet(3)

BUGS
       tcpreplay can only send packets as fast as your computer's interface, processor, disk and system bus will allow.

       Packet timing at high speeds is a black art and very OS/CPU dependent.

       Replaying captured traffic may simulate odd or broken conditions on your network and cause all sorts of problems.

       In most cases, you can not replay traffic back to/at a server.

       Some operating systems by default do not allow for forging source MAC addresses.  Please consult your operating system's documentation and
       the tcpreplay FAQ if you experience this issue.

AUTHOR
       Copyright 2000-2010 Aaron Turner

       For support please use the tcpreplay-users@lists.sourceforge.net mailing list.

       The latest version of this software is always available from: http://tcpreplay.synfin.net/

       Released under the Free BSD License.

       This manual page was AutoGen-erated from the tcpreplay option definitions.

(tcpreplay )                                                        2010-04-04                                                        TCPREPLAY(1)
