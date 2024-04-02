LABREA(1)                                                     General Commands Manual                                                    LABREA(1)

NAME
       labrea - Honeypot for incoming IP connection attempts

SYNOPSIS
       labrea  [-i  --device  INTERFACE] [-n --network nnn.nnn.nnn.nnn[/nn]] [-m --mask nnn.nnn.nnn.nnn] [-t --throttle-size BYTES] [-p --max-rate
       RATE ] [-R --soft-restart] [-r --arp-timeout RATE] [-s --switch-safe] [-h --hard-capture] [-x --disable-capture] [-X  --exclude-resolvable-
       ips]  [-P  --persist-mode-only]  [-a --no-resp-synack] [-H --auto-hard-capture] [-f --no-resp-excluded-ports] [--no-arp-sweep] [--init-file
       FILE] [-F --bpf-file FILE] [-T --dry-run] [-d --foreground]  [-o  --log-to-stdout]  [-O  --log-timestamp-epoch]  [-l  --log-to-syslog]  [-b
       --log-bandwidth]  [-v  --verbose]  [-q  --quiet]  [-z  --no-nag]  [-?  --usage  --help  ] [-V --version] [-I --ip-addr nnn.nnn.nnn.nnn] [-E
       --my-mac-addr xx:xx:xx:xx:xx:xx] [-D --list-interfaces] [-j --winpcap-dev nn] [--syslog-server nnn.nnn.nnn.nnn] [--syslog-port nnn]

       [BPF Filter]

DESCRIPTION
       labrea creates virtual machines for unused IP addresses in the specified block of IP addresses.  LaBrea sits and listens for ARP  "who-has"
       requests.

       When an ARP request for a particular IP goes unanswered for longer than its "rate" setting (default: 3 seconds), labrea crafts an ARP reply
       that routes all traffic destined for the IP to a "bogus" MAC address.  labrea sniffs for TCP/IP traffic sent to that MAC address  and  then
       responds to any SYN packet with a SYN/ACK packet that it creates.

OPTIONS
       labrea accepts the following options:

       -i --device interface
              By default, labrea uses the first ethernet interface. This forces labrea to use the specified interface.

       -n --network xxx.xxx.xxx.xxx[/nn]
              labrea  normally  pulls  information  about  the netblock from the IP information assigned to the interface.  If labrea is run on an
              unconfigured interface (one without an assigned IP address), then use this option to specify the subnet to be captured.

              xxx.xxx.xxx.xxx is the network address.  /nn is the subnet mask in CIDR notation. If the subnet mask is not specified here, then you
              must include the -m parameter.

       -m --mask xxx.xxx.xxx.xxx
              Another way to specify the network mask for the capture netblock. If this parameter is specified, then the -n parameter must also be
              specified.

       -t --throttle-size nn
              Sets the TCP window advertisement to limit the amount of data sent to labrea. The number of data bytes to allow  per  packet  is  nn
              bytes.

       -p --max-rate rate
              Connect  attempts will be permanently captured by forcing the connection into a "persist" state (by closing the TCP window). In this
              state, the connection will not time out.  labrea will permanently capture connect attempts up to maximum bandwidth rate  bytes.   If
              the specified bandwidth is exceeded, labrea will still tarpit the incoming connection (ie respond SYN/ACK to incoming SYN).

       -R --soft-restart
              New  captures  will  be held off for 5 minutes to let bandwidth calculations progress. If a major scan hits just after startup, this
              prevents labrea from capturing too many connections.

       -r --arp-timeout rate
              Wait rate seconds after seeing incoming arp requests before capturing an IP address.

       -s --switch-safe
              When there is an incoming ARP request, specifies that labrea should send out an ARP request of its own for the same IP address. This
              is necessary for safe operation in a switched environment where one host does not necessarily see all the traffic on the switch.

       -h --hard-capture
              Once an IP address has been captured, then do not wait for a "-r" timeout for the next incoming ARP request.

       -x --disable-capture
              Do not capture IPs.

       -X --exclude-resolvable-ips
              On  startup,  attempt  DNS  resolution on all IPs within the capture netblock. Automatically exclude any IP that has a corresponding
              entry in the DNS. Be careful because this can generate a lot of DNS lookups if the capture subnet is large.

       -P --persist-mode-only
              Try to limit bandwidth use by doing only persist capturing. Note: This parameter has limited usefulness since  below  max  b/w,  the
              same exchange that leads to persist capture also has the side effect of tarpitting.

       -a --no-resp-synack
              By default, the LaBrea virtual hosts respond to SYN/ACK with RST, and answer Pings. Disables this behaviour.

       -H --auto-hard-capture
              Mark  all  non-excluded and all non-hardexcluded IPs as being hard captured. See labrea.conf(5) for more information. This parameter
              should be used with caution.

       -f --no-resp-excluded-ports
              Drop incoming connections to excluded ports. Normal default behaviour is to return a RST. Makes nmap-style scanning go much slower.

       --no-arp-sweep
              On startup, labrea sweeps the capture subnet with bursts of ARP requests in an attempt to locate all live machines.  This  parameter
              disables the sweep.

       --init-file file
              Read the configuration from the specified file instead of from the default location.

       -F --bpf-file file
              Designates the name of a file containing a BPF filter pointing to machines/ports to be tarpitted.  As with the command line BPF fil‐
              ter, these connections MUST be firewalled to DROP inbound traffic.

       -T --dry-run
              Do labrea initialization, including Dns excludes, parse of the configuration file, opening the network interface etc. Print diagnos‐
              tic information, then exit.

       -d --foreground
              Do not detach the process. (Unix systems only)

       -o --log-to-stdout
              Send log information to stdout rather than to syslog.  This option also implies and sets the -d option (i.e. do not detach process).

       -O --log-timestamp-epoch
              Same as the "-o" option, but with time output in seconds since epoch to make it easier for logfile analysis programs.

       -l --log-to-syslog
              Send log messages to syslog.

       -b --log-bandwidth
              Log a message every minute detailing the current bandwidth consumption of the -p option (persist capture).

       -v --verbose
              Increase the verbosity of log messages. Use twice for more effect.

       -q --quiet
              Do not report arp requests for IPs that are not in the capture subnet.

       -z --no-nag
              Turn off the nag message. Before you do this, read the basic warning in the Notes section just below.

       -? --usage --help
              Print a help message and then exit.

       -V --version
              Print version information and exit.

       -I --ip-addr nnn.nnn.nnn.nnn
              Manually specify the IP address for the labrea server.

       -E --my-mac-addr xx:xx:xx:xx:xx:xx
              Manually specify the MAC address of the labrea server's NIC.

       -D --list-interfaces
              On Windows systems, print the list of WinPcap devices, followed by the list of the libdnet interfaces. Note that each API has a dif‐
              ferent nomenclature for the underlying NIC.

       -j --winpcap-dev nn
              On windows systems, select the nth winpcap device in the list.

NOTES
   Basic Warning about use of labrea
       You must understand this: As a default, LaBrea captures IP addresses by creating a "virtual machine" that sits on  any  UNUSED  IP  address
       that  it  sees.  labrea has been carefully written and tested to transparently and peacefully operate in normal production environments but
       ...

       There is a potential for problems if someone decides to start using one of the IP addresses that labrea has laid claim  to,  or  if  labrea
       erroneously decides that an IP address is free when in fact a real machine is already there.

   Built-in protections
       labrea tries very hard to NEVER capture an IP that has a live machine sitting on it.

       The following automatic mechanisms are provided:

              ·      If  labrea  sees a gratuitous ARP signalling the arrival of a new machine, it marks the corresponding IP address as excluded.
                     ("new kids on the block" logic)

              ·      Each ARP response is noted and the corresponding IP address is marked as excluded.

              ·      At startup, a systematic sweep is done of the entire capture subnet (as long as the subnet is not too big). All IP  addresses
                     that respond are marked as excluded.

       Then there are ways of manually specifying the exclusion of certain addresses, and otherwise ensuring safe operation:

              ·      The EXC config stmt allows specified IP addresses to be manually excluded from capture.

              ·      The IPI config stmt causes packets with the specified IP source address(es) to be ignored.

              ·      -s --switch-safe parameter causes mirroring of ARP requests in a switched environment

              ·      -X --exclude-resolvable-ips says to exclude all IPs that have a corresponding Dns entry

       Traffic rerouting: Despite all this, if labrea somehow receives traffic whose IP destination address belongs to a live machine, labrea will
       reroute that traffic to the real machine.

   Size of the capture subnet
       It is best to limit the capture subnet to the actual physical segment (VLAN, hub) where labrea is running.

       In some configurations, where proxy arp is being used to determine routing, interface subnet masks can be quite large.  (i.e.  the  "whole"
       network is "directly" attached to the physical segment).

       In  this case, if labrea picks up the subnet mask from the interface, then labrea will inefficiently watch addresses that it has no hope of
       capturing. You should use the -m / -n parameters to manually limit the size of the capture subnet.

   Other usage notes
       The labrea virtual machines use a bogus MAC address of 0:0:f:ff:ff:ff

       On certain older Windows systems, it may be necessary to manually specify the capture subnet.

       On unix systems, KILL -USR1 will toggle logging off on and off.

       On unix systems, KILL -HUP will cause labrea to reinitialize (and thus free captured IPs).

       If the capture subnet is too large (greater than 1024 addresses), then labrea will not do an arp sweep.

BUGS
       On some systems, if there is absolutely no traffic to sniff, pcap_dispatch will wait instead of timing out, making the program  seem  unre‐
              sponsive. (Workaround: ping the labrea server to "wake" it up.)

       If --exclude-resolvable-ips is enabled, and if the capture subnet is large (say class A /8), then a LOT of traffic will be generated to the
              Dns server.

EXAMPLES
       1)     Run safely in a switched environment with very verbose logging. Don't respond to excluded ports. Log bandwidth  usage  from  persist
              capturing. Exclude all IPs that are in the Dns. Run in the foreground, and log to stdout. Maximum capture bandwidth is 2 MB/sec. Use
              toto.conf as the initialisation file. Use network device "eth1" instead of the default device. Do a test run  only  -  parse  input,
              initialize, then exit.

              labrea --switch-safe --verbose -v  --no-resp-excluded-ports
                 --log-bandwidth --exclude-resolvable-ips --foreground
                 --log-to-stdout --max-rate 2000000 --init-file toto.conf
                 --device eth1 -z --dry-run
                 (one line)

       2)     Same thing with the short parameter style.

              labrea -z -s -v -v -f -b -X -d -o -p 2000000
                 --init-file toto.conf -i eth1 -T
                 (one line)

FILES
       /usr/local/etc/labrea.conf
              Default configuration file

       /usr/local/sbin/labrea
              Program

SEE ALSO
       labrea.conf(5)

AUTHOR
       Tom Liston <tliston@hackbusters.net> Bugs: lorgor@users.sourceforge.net or http://labrea.sourceforge.net

                                                                                                                                         LABREA(1)
