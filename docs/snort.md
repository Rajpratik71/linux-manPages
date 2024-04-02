SNORT(8)                                                      System Manager's Manual                                                     SNORT(8)

NAME
       Snort - open source network intrusion detection system

SYNOPSIS
       snort  [-bCdDeEfHIMNOpqQsTUvVwWxXy?] [-A alert-mode ] [-B address-conversion-mask ] [-c rules-file ] [-F bpf-file ] [-g group-name ] [-G id
       ] [-h home-net ] [-i interface ] [-k checksum-mode ] [-K logging-mode ] [-l log-dir ] [-L bin-log-file ] [-m umask ] [-n packet-count ] [-P
       snap-length  ]  [-r  tcpdump-file  ]  [-R  name  ] [-S variable=value ] [-t chroot_directory ] [-u user-name ] [-Z pathname ] [--logid id ]
       [--perfmon-file pathname ] [--pid-path pathname ] [--snaplen snap-length ] [--help ] [--version ] [--dynamic-engine-lib file ]  [--dynamic-
       engine-lib-dir  directory  ]  [--dynamic-detection-lib  file  ]  [--dynamic-detection-lib-dir directory ] [--dump-dynamic-rules directory ]
       [--dynamic-preprocessor-lib file ] [--dynamic-preprocessor-lib-dir  directory  ]  [--dynamic-output-lib  file  ]  [--dynamic-output-lib-dir
       directory  ]  [--alert-before-pass  ]  [--treat-drop-as-alert  ]  [--treat-drop-as-ignore ] [--process-all-events ] [--enable-inline-test ]
       [--create-pidfile ] [--nolock-pidfile ] [--no-interface-pidfile  ]  [--disable-attribute-reload-thread  ]  [--pcap-single=  tcpdump-file  ]
       [--pcap-filter=  filter  ]  [--pcap-list= list ] [--pcap-dir= directory ] [--pcap-file= file ] [--pcap-no-filter ] [--pcap-reset ] [--pcap-
       reload ] [--pcap-show ] [--exit-check count ] [--conf-error-out ] [--enable-mpls-multicast ] [--enable-mpls-overlapping-ip  ]  [--max-mpls-
       labelchain-len  ]  [--mpls-payload-type  ]  [--require-rule-sid ] [--daq type ] [--daq-mode mode ] [--daq-var name=value ] [--daq-dir dir ]
       [--daq-list [dir] ] [--dirty-pig ] [--cs-dir dir ] [--ha-peer ] [--ha-out file ] [--ha-in file ] expression

DESCRIPTION
       Snort is an open source network intrusion detection system, capable of performing real-time traffic analysis and packet logging on IP  net‐
       works.   It  can  perform  protocol analysis, content searching/matching and can be used to detect a variety of attacks and probes, such as
       buffer overflows, stealth port scans, CGI attacks, SMB probes, OS fingerprinting attempts, and much more.  Snort uses a flexible rules lan‐
       guage to describe traffic that it should collect or pass, as well as a detection engine that utilizes a modular plugin architecture.  Snort
       also has a modular real-time alerting capability, incorporating alerting and logging plugins for syslog, a ASCII text files,  UNIX  sockets
       or XML.

       Snort  has  three  primary  uses.  It can be used as a straight packet sniffer like tcpdump(1), a packet logger (useful for network traffic
       debugging, etc), or as a full blown network intrusion detection system.

       Snort logs packets in tcpdump(1) binary format or in Snort's decoded ASCII format to a hierarchy of  logging  directories  that  are  named
       based on the IP address of the "foreign" host.

OPTIONS
       -A alert-mode
              Alert  using  the  specified alert-mode.  Valid alert modes include fast, full, none, and unsock.  Fast writes alerts to the default
              "alert" file in a single-line, syslog style alert message.  Full writes the alert to the "alert" file with the full  decoded  header
              as  well as the alert message.  None turns off alerting.  Unsock is an experimental mode that sends the alert information out over a
              UNIX socket to another process that attaches to that socket.

       -b     Log packets in a tcpdump(1) formatted file.   All packets are logged in their native binary state to a tcpdump  formatted  log  file
              named with the snort start timestamp and "snort.log".  This option results in much faster operation of the program
               since  it doesn't have to spend time in the packet binary->text converters.  Snort can keep up pretty well with 100Mbps networks in
              '-b' mode.  To choose an alternate name for the binary log file, use the '-L' switch.

       -B address-conversion-mask
              Convert all IP addresses in home-net to addresses specified by address-conversion-mask.   Used  to  obfuscate  IP  addresses  within
              binary logs. Specify home-net with the '-h' switch.  Note this is not the same as $HOME_NET.

       -c config-file
              Use the rules located in file config-file.

       -C     Print the character data from the packet payload only (no hex).

       -d     Dump the application layer data when displaying packets in verbose or packet logging mode.

       -D     Run Snort in daemon mode.  Alerts are sent to /var/log/snort/alert unless otherwise specified.

       -e     Display/log the link layer packet headers.

       -E     *WIN32 ONLY* Log alerts to the Windows Event Log.

       -f     Activate PCAP line buffering

       -F bpf-file
              Read  BPF filters from bpf-file.  This is handy for people running Snort as a SHADOW replacement or with a love Of super complex BPF
              filters.  See the "expressions" section of this man page for more info on writing BPF filters.

       -g group
              Change the group/GID Snort runs under to group after initialization.  This switch allows Snort to drop root  privileges  after  it's
              initialization phase has completed as a security measure.

       -G id  Use id as a base event ID when logging events.

       -h home-net
              Set  the  "home  network"  to  home-net.   The  format  of  this  address  variable  is  a network prefix plus a CIDR block, such as
              192.168.1.0/24.  Once this variable is set, all decoded packet logging will be done relative to  the  home  network  address  space.
              This is useful because of the way that Snort formats its ASCII log data.  With this value set to the local network, all decoded out‐
              put will be logged into decode directories with the address of the foreign computer as the directory name, which is very useful dur‐
              ing traffic analysis. This option does not change "$HOME_NET" in IDS mode.

       -H     Force  hash tables to be deterministic instead of using a random number generator for the seed & scale.  Useful for testing and gen‐
              erating repeatable results with the same traffic.

       -i interface
              Sniff packets on interface.

       -I     Print out the receiving interface name in alerts.

       -k checksum-mode
              Tune the internal checksum verification functionality with alert-mode.  Valid  checksum  modes  include  all,  noip,  notcp,  noudp,
              noicmp,  and none.  All activates checksum verification for all supported protocols.  Noip turns off IP checksum verification, which
              is handy if the gateway router is already dropping packets that fail their IP checksum checks.  Notcp turns off TCP checksum verifi‐
              cation,  all  other checksum modes are on.  noudp turns off UDP checksum verification.  Noicmp turns off ICMP checksum verification.
              None turns off the entire checksum verification subsystem.

       -K logging-mode
              Select a packet logging mode.  The default is pcap.  logging-mode.  Valid logging modes include pcap, ascii, and  none.   Pcap  logs
              packets  through  the  pcap  library  into pcap (tcpdump) format.  Ascii logs packets in the old "directories and files" format with
              packet printouts in each file.  None Turns off packet logging.

       -l log-dir
              Set the output logging directory to log-dir.  All plain text alerts and packet logs go into this directory.  If this option  is  not
              specified, the default logging directory is set to /var/log/snort.

       -L binary-log-file
              Set  the  filename  of  the binary log file to binary-log-file.  If this switch is not used, the default name is a timestamp for the
              time that the file is created plus "snort.log".

       -m umask
              Set the file mode creation mask to umask

       -M     Log console messages to syslog when not running daemon mode. Using both -D and -M will send all messages to  syslog  including  e.g.
              SIGUSR1 dump packet stats. This switch has no impact on logging of alerts.

       -n packet-count
              Process packet-count packets and exit.

       -N     Turn off packet logging.  The program still generates alerts normally.

       -O     Obfuscate  the IP addresses when in ASCII packet dump mode.  This switch changes the IP addresses that get printed to the screen/log
              file to "xxx.xxx.xxx.xxx".  If the homenet address switch is set (-h), only addresses on the homenet will be obfuscated  while  non-
              homenet IPs will be left visible.  Perfect for posting to your favorite security mailing list!

       -p     Turn off promiscuous mode sniffing.

       -P snap-length
              Set the packet snaplen to snap-length.  By default, this is set to 1514.

       -q     Quiet  operation.  Don't display banner and initialization information. In daemon mode, banner and initialization information is not
              logged to syslog.

       -Q     Enable inline mode operation.

       -r tcpdump-file
              Read the tcpdump-formatted file tcpdump-file.  This will cause Snort to read and process the file fed to it.  This is useful if, for
              instance,  you've  got  a  bunch  of SHADOW files that you want to process for content, or even if you've got a bunch of reassembled
              packet fragments which have been written into a tcpdump formatted file.

       -R name
              Use name as a suffix to the snort pidfile.

       -s     Send alert messages to syslog.  On linux boxen, they will appear in /var/log/secure, /var/log/messages on many other platforms.

       -S variable=value
              Set variable name "variable" to value "value".  This is useful for setting the value of a defined variable name  in  a  Snort  rules
              file  to a command line specified value.  For instance, if you define a HOME_NET variable name inside of a Snort rules file, you can
              set this value from it's predefined value at the command line.

       -t chroot
              Changes Snort's root directory to chroot after initialization.  Please note that all log/alert filenames are relative to the  chroot
              directory if chroot is used.

       -T     Snort  will  start  up  in self-test mode, checking all the supplied command line switches and rules files that are handed to it and
              indicating that everything is ready to proceed.  This is a good switch to use if daemon mode is going to be used, it  verifies  that
              the  Snort  configuration that is about to be used is valid and won't fail at run time. Note, Snort looks for either /etc/snort.conf
              or ./snort.conf.  If your config lives elsewhere, use the -c option to specify a valid config-file.

       -u user
              Change the user/UID Snort runs under to user after initialization.

       -U     Changes the timestamp in all logs to be in UTC

       -v     Be verbose.  Prints packets out to the console.  There is one big problem with verbose mode: it's slow.  If you are doing  IDS  work
              with Snort, don't use the '-v' switch, you WILL drop packets.

       -V     Show the version number and exit.

       -w     Show management frames if running on an 802.11 (wireless) network.

       -W     *WIN32 ONLY* Enumerate the network interfaces available.

       -x     Exit if Snort configuration problems occur such as duplicate gid/sid or flowbits without Stream5.

       -X     Dump the raw packet data starting at the link layer.  This switch overrides the '-d' switch.

       -y     Include the year in alert and log files

       -Z pathname
              Set the perfmonitor preprocessor path/filename to pathname.

       -?     Show the program usage statement and exit.

       --logid id
              Same as -G.

       --perfmon-file pathname
              Same as -Z.

       --pid-path directory
              Specify the directory for the Snort PID file.

       --snaplen snap-length
              Same as -P.

       --help Same as -?

       --version
              Same as -V

       --dynamic-engine-lib file
              Load a dynamic detection engine shared library specified by file.

       --dynamic-engine-lib-dir directory
              Load all dynamic detection engine shared libraries specified from directory.

       --dynamic-detection-lib file
              Load a dynamic detection rules shared library specified by file.

       --dynamic-detection-lib-dir directory
              Load all dynamic detection rules shared libraries specified from directory.

       --dump-dynamic-rules directory
              Create  stub rule files from all loaded dynamic detection rules libraries.  Files will be created in directory.  This is required to
              be done prior to running snort using those detection rules and the generated rules files must be included in snort.conf.

       --dynamic-preprocessor-lib file
              Load a dynamic preprocessor shared library specified by file.

       --dynamic-preprocessor-lib-dir directory
              Load all dynamic preprocessor shared libraries specified from directory.

       --alert-before-pass
              Process alert, drop, sdrop, or reject before pass.  Default is pass before alert, drop, etc.

       --treat-drop-as-alert
              Converts drop, sdrop, and reject rules into alert rules during startup.

       --treat-drop-as-ignore
              Use drop, sdrop, and reject rules to ignore session traffic when not inline.

       --process-all-events
              Process all triggered events in group order, per Rule Ordering configuration.  Default stops after first group.

       --enable-inline-test
              Enable Inline-Test Mode Operation.

       --pid-path directory
              Specify the path for Snort's PID file.

       --create-pidfile
              Create PID file, even when not in Daemon mode.

       --nolock-pidfile
              Do not try to lock Snort PID file.

       --no-interface-pidfile
              Do not include the interface name in Snort PID file

       --pcap-single=tcpdump-file
              Same as -r.  Added for completeness.

       --pcap-filter=filter
              Shell style filter to apply when getting pcaps from file or directory.  This filter will apply  to  any  --pcap-file  or  --pcap-dir
              arguments following.  Use --pcap-no-filter to delete filter for following --pcap-file or --pcap-dir arguments or specify --pcap-fil‐
              ter again to forget previous filter and to apply to following --pcap-file or --pcap-dir arguments.

       --pcap-list="list"
              A space separated list of pcaps to read.

       --pcap-dir=directory
              A directory to recurse to look for pcaps.  Sorted in ascii order.

       --pcap-file=file
              File that contains a list of pcaps to read.  Can specify path to pcap or directory to recurse to get pcaps.

       --pcap-no-filter
              Reset to use no filter when getting pcaps from file or directory.

       --pcap-reset
              If reading multiple pcaps, reset snort to post-configuration state before reading next pcap.  The default, i.e. without this option,
              is not to reset state.

       --pcap-show
              Print a line saying what pcap is currently being read.

       --exit-check=count
              Signal termination after <count> callbacks from DAQ_Acquire(), showing the time it takes from signaling until DAQ_Stop() is called.

       --conf-error-out
              Same as -x.

       --require-rule-sid
              Require an SID for every rule to be correctly threshold all rules.

       --daq <type>
              Select packet acquisition module (default is pcap).

       --daq-mode <mode>
              Select the DAQ operating mode.

       --daq-var <name=value>
              Specify extra DAQ configuration variable.

       --daq-dir <dir>
              Tell Snort where to find desired DAQ.

       --daq-list [<dir>]
              List packet acquisition modules available in dir.

       --cs-dir <dir>
              Tell Snort to use control socket and create the socket in dir.

        expression
              selects  which  packets  will be dumped.  If no expression is given, all packets on the net will be dumped.  Otherwise, only packets
              for which expression is `true' will be dumped.

              The expression consists of one or more primitives.  Primitives usually consist of an id (name or number) preceded  by  one  or  more
              qualifiers.  There are three different kinds of qualifier:

              type   qualifiers say what kind of thing the id name or number refers to.  Possible types are host, net and port.  E.g., `host foo',
                     `net 128.3', `port 20'.  If there is no type qualifier, host is assumed.

              dir    qualifiers specify a particular transfer direction to and/or from id.  Possible directions are src, dst, src or dst  and  src
                     and dst.  E.g., `src foo', `dst net 128.3', `src or dst port ftp-data'.  If there is no dir qualifier, src or dst is assumed.
                     For `null' link layers (i.e. point to point protocols such as slip) the inbound and outbound qualifiers can be used to  spec‐
                     ify a desired direction.

              proto  qualifiers  restrict  the match to a particular protocol.  Possible protos are: ether, fddi, ip, arp, rarp, decnet, lat, sca,
                     moprc, mopdl, tcp and udp.  E.g., `ether src foo', `arp net 128.3', `tcp port 21'.  If there is no proto qualifier, all  pro‐
                     tocols  consistent  with the type are assumed.  E.g., `src foo' means `(ip or arp or rarp) src foo' (except the latter is not
                     legal syntax), `net bar' means `(ip or arp or rarp) net bar' and `port 53' means `(tcp or udp) port 53'.

              [`fddi' is actually an alias for `ether'; the parser treats them identically as meaning ``the data link level used on the  specified
              network  interface.''   FDDI  headers contain Ethernet-like source and destination addresses, and often contain Ethernet-like packet
              types, so you can filter on these FDDI fields just as with the analogous Ethernet fields.  FDDI headers also contain  other  fields,
              but you cannot name them explicitly in a filter expression.]

              In  addition  to  the  above,  there  are some special `primitive' keywords that don't follow the pattern: gateway, broadcast, less,
              greater and arithmetic expressions.  All of these are described below.

              More complex filter expressions are built up by using the words and, or and not to combine primitives.  E.g., `host foo and not port
              ftp  and  not  port  ftp-data'.   To  save typing, identical qualifier lists can be omitted.  E.g., `tcp dst port ftp or ftp-data or
              domain' is exactly the same as `tcp dst port ftp or tcp dst port ftp-data or tcp dst port domain'.

              Allowable primitives are:

              dst host host
                     True if the IP destination field of the packet is host, which may be either an address or a name.

              src host host
                     True if the IP source field of the packet is host.

              host host
                     True if either the IP source or destination of the packet is host.  Any of the above host expressions can be  prepended  with
                     the keywords, ip, arp, or rarp as in:
                          ip host host
                     which is equivalent to:
                          ether proto \ip and host host
                     If host is a name with multiple IP addresses, each address will be checked for a match.

              ether dst ehost
                     True  if  the ethernet destination address is ehost.  Ehost may be either a name from /etc/ethers or a number (see ethers(3N)
                     for numeric format).

              ether src ehost
                     True if the ethernet source address is ehost.

              ether host ehost
                     True if either the ethernet source or destination address is ehost.

              gateway host
                     True if the packet used host as a gateway.  I.e., the ethernet source or destination address was  host  but  neither  the  IP
                     source  nor  the  IP  destination  was  host.  Host must be a name and must be found in both /etc/hosts and /etc/ethers.  (An
                     equivalent expression is
                          ether host ehost and not host host
                     which can be used with either names or numbers for host / ehost.)

              dst net net
                     True if the IP destination address of the packet has a network number of net. Net may be either a name from /etc/networks  or
                     a network number (see networks(4) for details).

              src net net
                     True if the IP source address of the packet has a network number of net.

              net net
                     True if either the IP source or destination address of the packet has a network number of net.

              net net mask mask
                     True if the IP address matches net with the specific netmask.  May be qualified with src or dst.

              net net/len
                     True if the IP address matches net a netmask len bits wide.  May be qualified with src or dst.

              dst port port
                     True  if the packet is ip/tcp or ip/udp and has a destination port value of port.  The port can be a number or a name used in
                     /etc/services (see tcp(4P) and udp(4P)).  If a name is used, both the port number and protocol are checked.  If a  number  or
                     ambiguous  name  is  used,  only the port number is checked (e.g., dst port 513 will print both tcp/login traffic and udp/who
                     traffic, and port domain will print both tcp/domain and udp/domain traffic).

              src port port
                     True if the packet has a source port value of port.

              port port
                     True if either the source or destination port of the packet is port.  Any of the above port expressions can be prepended with
                     the keywords, tcp or udp, as in:
                          tcp src port port
                     which matches only tcp packets whose source port is port.

              less length
                     True if the packet has a length less than or equal to length.  This is equivalent to:
                          len <= length.

              greater length
                     True if the packet has a length greater than or equal to length.  This is equivalent to:
                          len >= length.

              ip proto protocol
                     True  if  the  packet  is  an ip packet (see ip(4P)) of protocol type protocol.  Protocol can be a number or one of the names
                     icmp, igrp, udp, nd, or tcp.  Note that the identifiers tcp, udp, and icmp are also keywords and must be  escaped  via  back‐
                     slash (\), which is \\ in the C-shell.

              ether broadcast
                     True if the packet is an ethernet broadcast packet.  The ether keyword is optional.

              ip broadcast
                     True  if  the  packet  is  an IP broadcast packet.  It checks for both the all-zeroes and all-ones broadcast conventions, and
                     looks up the local subnet mask.

              ether multicast
                     True if the packet is an ethernet multicast packet.  The ether keyword is optional.  This is shorthand for `ether[0] &  1  !=
                     0'.

              ip multicast
                     True if the packet is an IP multicast packet.

              ether proto protocol
                     True  if the packet is of ether type protocol.  Protocol can be a number or a name like ip, arp, or rarp.  Note these identi‐
                     fiers are also keywords and must be escaped via backslash (\).  [In the case of FDDI (e.g., `fddi protocol arp'), the  proto‐
                     col  identification  comes  from  the  802.2  Logical  Link Control (LLC) header, which is usually layered on top of the FDDI
                     header.  Tcpdump assumes, when filtering on the protocol identifier, that all FDDI packets include an LLC  header,  and  that
                     the LLC header is in so-called SNAP format.]

              decnet src host
                     True  if  the  DECNET source address is host, which may be an address of the form ``10.123'', or a DECNET host name.  [DECNET
                     host name support is only available on Ultrix systems that are configured to run DECNET.]

              decnet dst host
                     True if the DECNET destination address is host.

              decnet host host
                     True if either the DECNET source or destination address is host.

              ip, arp, rarp, decnet
                     Abbreviations for:
                          ether proto p
                     where p is one of the above protocols.

              lat, moprc, mopdl
                     Abbreviations for:
                          ether proto p
                     where p is one of the above protocols.  Note that Snort does not currently know how to parse these protocols.

              tcp, udp, icmp
                     Abbreviations for:
                          ip proto p
                     where p is one of the above protocols.

              expr relop expr
                     True if the relation holds, where relop is one of >, <, >=, <=, =, !=, and expr is an arithmetic expression composed of inte‐
                     ger  constants  (expressed in standard C syntax), the normal binary operators [+, -, *, /, &, |], a length operator, and spe‐
                     cial packet data accessors.  To access data inside the packet, use the following syntax:
                          proto [ expr : size ]
                     Proto is one of ether, fddi, ip, arp, rarp, tcp, udp, or icmp, and indicates the protocol layer for the index operation.  The
                     byte  offset, relative to the indicated protocol layer, is given by expr.  Size is optional and indicates the number of bytes
                     in the field of interest; it can be either one, two, or four, and defaults to one.  The length  operator,  indicated  by  the
                     keyword len, gives the length of the packet.

                     For  example,  `ether[0]  &  1 != 0' catches all multicast traffic.  The expression `ip[0] & 0xf != 5' catches all IP packets
                     with options. The expression `ip[6:2] & 0x1fff = 0' catches only unfragmented datagrams and frag  zero  of  fragmented  data‐
                     grams.   This  check  is implicitly applied to the tcp and udp index operations.  For instance, tcp[0] always means the first
                     byte of the TCP header, and never means the first byte of an intervening fragment.

              Primitives may be combined using:

                     A parenthesized group of primitives and operators (parentheses are special to the Shell and must be escaped).

                     Negation (`!' or `not').

                     Concatenation (`&&' or `and').

                     Alternation (`||' or `or').

              Negation has highest precedence.  Alternation and concatenation have equal precedence  and  associate  left  to  right.   Note  that
              explicit and tokens, not juxtaposition, are now required for concatenation.

              If an identifier is given without a keyword, the most recent keyword is assumed.  For example,
                   not host vs and ace
              is short for
                   not host vs and host ace
              which should not be confused with
                   not ( host vs or ace )

              Expression  arguments  can  be  passed  to Snort as either a single argument or as multiple arguments, whichever is more convenient.
              Generally, if the expression contains Shell metacharacters, it is easier to pass it as a single, quoted  argument.   Multiple  argu‐
              ments are concatenated with spaces before being parsed.

READING PCAPS
       Instead  of  having  Snort listen on an interface, you can give it a packet capture to read.  Snort will read and analyze the packets as if
       they came off the wire.  This can be useful for testing and debugging Snort.

       Read a single pcap

            $ snort -r foo.pcap
            $ snort --pcap-single=foo.pcap

       Read pcaps from a file

            $ cat foo.txt
            foo1.pcap
            foo2.pcap
            /home/foo/pcaps

            $ snort --pcap-file=foo.txt

            This will read foo1.pcap, foo2.pcap and all files under /home/foo/pcaps.  Note that Snort will not try to determine whether the  files
            under that directory are really pcap files or not.

       Read pcaps from a command line list

            $ snort --pcap-list="foo1.pcap foo2.pcap foo3.pcap"

            This will read foo1.pcap, foo2.pcap and foo3.pcap.

       Read pcaps under a directory

            $ snort --pcap-dir="/home/foo/pcaps"

            This will include all of the files under /home/foo/pcaps.

       Using filters

            $ cat foo.txt
            foo1.pcap
            foo2.pcap
            /home/foo/pcaps

            $ snort --pcap-filter="*.pcap" --pcap-file=foo.txt
            $ snort --pcap-filter="*.pcap" --pcap-dir=/home/foo/pcaps

            The above will only include files that match the shell pattern "*.pcap", in other words, any file ending in ".pcap".

            $ snort --pcap-filter="*.pcap --pcap-file=foo.txt \
            > --pcap-filter="*.cap" --pcap-dir=/home/foo/pcaps

            In the above, the first filter "*.pcap" will only be applied to the pcaps in the file "foo.txt" (and any directories that are recursed
            in that file).  The addition of the second filter "*.cap" will cause the first filter to be forgotten and then applied to  the  direc‐
            tory /home/foo/pcaps, so only files ending in ".cap" will be included from that directory.

            $ snort --pcap-filter="*.pcap --pcap-file=foo.txt \
            > --pcap-no-filter --pcap-dir=/home/foo/pcaps

            In this example, the first filter will be applied to foo.txt, then no filter will be applied to the files found under /home/foo/pcaps,
            so all files found under /home/foo/pcaps will be included.

            $ snort --pcap-filter="*.pcap --pcap-file=foo.txt \
            > --pcap-no-filter --pcap-dir=/home/foo/pcaps \
            > --pcap-filter="*.cap" --pcap-dir=/home/foo/pcaps2

            In this example, the first filter will be applied to foo.txt, then no filter will be applied to the files found under /home/foo/pcaps,
            so  all  files  found  under  /home/foo/pcaps  will  be  included,  then  the  filter  "*.cap"  will  be  applied to files found under
            /home/foo/pcaps2.

       Resetting state

            $ snort --pcap-dir=/home/foo/pcaps --pcap-reset

            The above example will read all of the files under /home/foo/pcaps, but after each pcap is read, Snort will be reset to a post-config‐
            uration state, meaning all buffers will be flushed, statistics reset, etc.  For each pcap, it will be like Snort is seeing traffic for
            the first time.

       Printing the pcap

            $ snort --pcap-dir=/home/foo/pcaps --pcap-show

            The above example will read all of the files under /home/foo/pcaps and will print a line indicating  which  pcap  is  currently  being
            read.

RULES
       Snort  uses  a simple but flexible rules language to describe network packet signatures and associate them with actions.  The current rules
       document can be found at http://www.snort.org/snort-rules.

NOTES
       The following signals have the specified effect when sent to the daemon process using the kill(1) command:

       SIGHUP Causes the daemon to close all opened files and restart.  Please note that this will only work if  the  full  pathname  is  used  to
              invoke snort in daemon mode, otherwise snort will just exit with an error message being sent to syslogd(8).

       SIGUSR1
              Causes the program to dump its current packet statistical information to the console or syslogd(8) if in daemon mode.

       SIGUSR2
              Causes the program to rotate Perfmonitor statistical information to the console or syslogd(8) if in daemon mode.

       SIGURG Causes the program to reload attribute table.

       SIGCHLD
              Used internally.

       Please refer to manual for more details. Any other signal might cause the daemon to close all opened files and exit.

HISTORY
       Snort has been freely available under the GPL license since 1998.

DIAGNOSTICS
       Snort returns a 0 on a successful exit, 1 if it exits on an error.

BUGS
       After consulting the BUGS file included with the source distribution, send bug reports to snort-devel@lists.sourceforge.net

AUTHOR
       Martin Roesch <roesch@snort.org>

SEE ALSO
       tcpdump(1), pcap(3)

                                                                   December 2011                                                          SNORT(8)
