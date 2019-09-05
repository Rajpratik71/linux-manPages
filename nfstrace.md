nfstrace(8)                                                   System Manager's Manual                                                  nfstrace(8)

NAME
       nfstrace - NFS and CIFS tracing/monitoring/capturing/analyzing tool

SYNOPSIS
       nfstrace [ -m drain|live|dump|stat ] [ -i interface ] [ -f filter ]
                [ -s 1..65535 ] [ -t Milliseconds ] [ -b MBytes ] [ -p promisc ]
                [ -d in|out|inout ] [ -a path#opt1,opt2=val,...  ] [ -I path ]
                [ -O path ] [ -C 'shell command' ] [ -D MBytes ] [ -E interfaces|plugins ]
                [ -M 1..4000 ] [ -Q 1..65535 ] [ -T true|false ] [ -Z username ] [ -v 0|1|2 ]

DESCRIPTION
       nfstrace  performs  live Ethernet 1 Gbps – 10 Gbps packets capturing and helps to determine NFS and CIFS procedures in raw network traffic.
       Furthermore, it performs filtration, dumping, compression, statistical analysis, visualization and provides the API  for  custom  pluggable
       analysis modules.

       nfstrace  captures  raw  packets from an Ethernet interface using libpcap interface to Linux (LSF) or FreeBSD (BPF) implementations. At the
       moment it is assumed that libpcap delivers correct TCP and UDP packets. Assembling of IP  packets  from  ethernet  frames  and  IP  packets
       defragmentation are performed in the operating system's kernel.

       The application has been tested on the workstations with integrated 1 Gbps NICs (Ethernet 1000baseT/Full).

       Currently nfstrace supports the following protocols:

           Ethernet > IPv4 | IPv6 > UDP | TCP > NFSv3 | NFSv4 | NFSv4.1 | CIFSv1 | CIFSv2

       nfstrace can operate in four different modes:

          -  online  analysis  (--mode=live): performs online capturing, filtration and live analysis of detected NFS procedures using a pluggable
          analysis module or prints out them to stdout (-T or --trace options);

          - online dumping (--mode=dump): performs online traffic capturing, filtration and dumping to the  output  file  (specified  with  -O  or
          --ofile options);

          -  offline  analysis  (--mode=stat): performs offline filtration of the .pcap file that contains previously captured traces and performs
          analysis using a pluggable analysis module or prints found NFS procedures to stdout (-T or --trace options);

          - offline dumping (--mode=drain): performs a reading of traffic from the .pcap file (specified with -I or --ifile options),  filtration,
          dumping  to the output .pcap file (specified with -O or --ofile options) and removing all the packets that are not related to NFS proce‐
          dures.

       nfstrace uses libpcap file format for input and output files so any external tool (e.g.  Wireshark) can be used in order  to  inspect  fil‐
       tered traces.

       Since  nfstrace  internally uses libpcap that provides a portable interface to the native system API for capturing network traffic, filtra‐
       tion is performed in the operating system's kernel.  nfstrace provides a special option (-f or --filtration) for specifying custom  filters
       in BPF syntax (see pcap-filter(7)).

       The default BPF filter in nfstrace is 'port 2049 or port 445', which means that each packet that is delivered to user-space from the kernel
       satisfies the following conditions: it has IPv4 or IPv6 header and it has TCP and UDP header with source or destination port number  equals
       to 2049 (default NFS port) or 445 (default CIFS port).

       The  reality  is that this filter is very heavy and support of IPv6 is experimental, so if you want to reach faster filtration of IPv4-only
       traffic we suggest to use the following BPF filter:
           'ip and port 2049 or port 445'.

OPTIONS
       nfstrace can usually be run without arguments: in this case default arguments will be used.

       -m, --mode=live|dump|drain|stat
              Set the running mode (see the description above) (default: live).

       -i, --interface=INTERFACE
              Listen interface, it is required for live and dump modes (default: searches for the lowest numbered, configured up interface (except
              loopback)).

       -f, --filtration=filter
              Specify the packet filter in BPF syntax; for the expression syntax, see pcap-filter(7) (default: 'port 2049 or port 445').

       -s, --snaplen=1..65535
              Set the max length of captured raw packet (bigger packets will be truncated).  Can be used only for UDP (default: 65535).

       -t, --timeout=milliseconds
              Set the read timeout that will be used while capturing (default: 100).

       -b, --bsize=MBytes
              Set  the  size  of  the  operating  system  capture  buffer  in  MBytes;  note that this option is crucial for capturing performance
              (default: 20).

       -p, --promisc
              Put the capturing interface into promiscuous mode (default: true).

       -d, --direction=in|out|inout
              Set the direction for which packets will be captured (default: inout).

       -a, --analysis=PATH#opt1,opt2=val,...
              Specify the path to an analysis module and set its options (if any).

       -I, --ifile=PATH
              Specify the input file for stat mode, '-' means stdin (default: nfstrace-{filter}.pcap).

       -O, --ofile=PATH
              Specify the output file for dump mode, '-' means stdout (default: nfstrace-{filter}.pcap).

       --log=PATH
              Specify the log file (default: nfstrace.log.{timestamp}).

       -C, --command='shell command'
              Execute command for each dumped file.

       -D, --dump-size=MBytes
              Set the size of the dumping file portion, 0 means no limit (default: 0).

       -E, --enum=interfaces|plugins
              Enumerate all available network interfaces and and/or all available plugins, then exit; please note that interfaces can't be  listed
              unless nfstrace was built against the recent version of libpcap that supports the pcap_findalldevs() function (default: none).

       -M, --msg-header=1..4000
              Truncate RPC messages to this limit (specified in bytes) before passing to a pluggable analysis module (default: 512).

       -Q, --qcapacity=1..65535
              Set the initial capacity of the queue with RPC messages (default: 4096).

       -T, --trace
              Print collected NFSv3 or NFSv4 procedures, true if no modules were passed with -a option.

       -Z, --droproot=username
              Drop root privileges after opening the capture device.

       -v, --verbose=0|1|2
              Specify verbosity level (default: 1).

       -h, --help
              Print help message and usage for modules passed with -a option, then exit.

ANALYSIS MODULES
   Operation Breakdown Analyzer
       Operation Breakdown (OB) analyzer calculates average frequency of NFS and CIFS procedures and computes standard deviation of latency.

           $ nfstrace -a libbreakdown.so -h
           nfstrace 0.4.0 (Release)
           built on Linux-3.16.1-1-generic
           by C++ compiler GNU 4.9.1
           Usage: ./nfstrace [OPTIONS]...

           Usage example:

               $ nfstrace -m stat -a libreakdown.so

           Breakdown  analyzer  produces  .dat file in the current directory for each detected NFS session that can be visualized using nst.sh and
           breakdown_nfsv3.plt or breakdown_nfsv4.plt (according to NFS version).

               $ nst.sh -a breakdown_nfsv4.plt -d . -p 'breakdown_10.6.137.47:903*.dat'

   Watch
       Watch plugin mimics old nfswatch utility: it monitors NFS and CIFS traffic and displays it in terminal using ncurses.  It  supports  NFSv3,
       NFSv4, NFSv41, CIFSv1 and CIFSv2.

       By default watch plugin will update its screen every second, you can specify another timeout in milliseconds:

           $ nfstrace -a libwatch.so#2000

   JSON Analyzer
       JSON analyzer calculates a total amount of each supported application protocol operation. It accepts TCP-connections on particular TCP-end‐
       point (host:port), sends a respective JSON to the TCP-client and closes connection. Suggested to be used in live mode.

       Available options

           host=hostname
                  Network interface to listen (default is to listen all interfaces)

           port=port
                  IP-port to bind to (default: 8888)

           workers=workers
                  Amount of worker threads (default: 10)

           duration=duration
                  Max serving duration in milliseconds (default: 500)

           backlog=backlog
                  Listen backlog (default: 15)

       Example of use

           Start nfstrace in one console:

               $ sudo nfstrace -i eth0 -a analyzers/libjson.so#host=localhost
               ...

           Make a TCP-request to nfstrace in another console to fetch current statistics:

               $ telnet localhost 8888
               Trying 127.0.0.1...
               Connected to localhost.
               Escape character is '^]'.
               {
                 "nfs_v3":{
                   "null":32,
                   "getattr":4582,
                   ...
                 },
                 "nfs_v4":{
                   ...
                 },
                 ...
               }Connection closed by foreign host.

EXAMPLES
   Available options
       The following command demonstrates available options of the application and plugged  analysis  modules  (attached  with  --analysis  or  -a
       options). Note that you can pass more than one module here.

           nfstrace --help --analysis=libjson.so

   Online tracing
       The  following command will run nfstrace in online analysis mode (specified with --mode or -m options) without a pluggable analysis module.
       It will capture NFS and CIFS traffic transferred over TCP or UDP with source or destination port number equals  to  2049  and  will  simply
       print them out to stdout (-T or --trace options). Capturing ends when nfstrace receives SIGINT (Control-C).

       Note that capturing from network interface requires superuser privileges.

           nfstrace --mode=live --filtration='ip and port 2049' --trace

   Online analysis
       The  following  command  demonstrates  running nfstrace in online analysis mode.  Just like in the previous example it will capture NFS and
       CIFS traffic transferred over TCP or UDP with source or destination port number equals to 2049 and then it will perform Operation Breakdown
       analysis using pluggable analysis module libbreakdown.so.

           nfstrace -m live -f 'ip and port 2049' --analysis=libbreakdown.so

   Online dumping and offline analysis
       The following example demonstrates running nfstrace in online dumping and offline analysis modes.

       At  first nfstrace will capture NFS traffic transferred over TCP or UDP with source or destination port number equals to 2049 and will dump
       captured packets to dump.pcap file (specified with --ofile or -O options).

       At the second run nfstrace will perform offline Operation Breakdown analysis using pluggable analysis module libbreakdown.so.

           # Dump captured packets to dump.pcap
           nfstrace -m dump -f 'ip and port 2049' --ofile=dump.pcap

           # Analyse dump.pcap using libbreakdown.so
           nfstrace -m stat --ifile=dump.pcap -a libbreakdown.so

   Online dumping, compression and offline analysis
       The following example demonstrates running nfstrace in online dumping and offline analysis modes. Since dump file can easily  exhaust  disk
       space, compression makes sense.

       At  first nfstrace will capture NFS traffic transferred over TCP or UDP with source or destination port number equals to 2049 and will dump
       captured packets to dump.pcap file.

       Note that compression is done by the external tool (executed in script passed with --command or -C options) and it will  be  executed  when
       capturing is done. The output file can be inspected using some external tool.

       At  the  second run nfstrace will perform offline analysis. Again, the external tool (bzcat in this example) is used in order to decompress
       previously saved dump.  nfstrace will read stdin (note the -I – option) and perform offline analysis using Operation Breakdown analyzer.

           # Dump captured procedures to dump.pcap file.
           # Compress output using bzip2 when capturing ends.
           nfstrace -m dump -f 'ip and port 2049' -O dump.pcap --command 'bzip2 -f -9'

           # Extract dump.pcap from dump.pcap.bz2 to stdin.
           # Read stdin and analyze data with libbreakdown.so module.
           bzcat dump.pcap.bz2 | nfstrace -m stat -I - -a libbreakdown.so

   Online dumping with file limit, compression and offline analysis
       This example is similar to the previous one except one thing: output dump file can be very huge and cause problems in some  situations,  so
       nfstrace provides the ability to split it into parts.

       At  first nfstrace will be invoked in online dumping mode. Everything is similar to the previous example except -D (--dump-size) option: it
       specifies the size limit in MBytes, so dump file will be split according to this value.

       At the second run nfstrace will perform offline analysis of captured packets using Operation Breakdown analyzer.

       Please note that only the first dump file has the pcap header.

           # Dump captured procedures multiple files and compress them.
           nfstrace -m dump -f 'ip and port 2049' -O dump.pcap -D 1 -C bzip2 -f -9

           # get list of parts in the right order:
           # dump.pcap.bz2
           # dump.pcap-1.bz2
           # dump.pcap-2.bz2
           parts=$(ls dump.pcap*.bz2 | sort -n -t - -k 2)

           # Extract dump.pcap from main dump.pcap.bz2 and parts to stdin.
           # Read stdin and analyze data with libbreakdown.so module.
           bzcat $parts | nfstrace --mode=stat -I - --analysis=libbreakdown.so

   Visualization
       This example demonstrates the ability to plot graphical representation of data collected by Operation Breakdown analyzer.

       nst.sh is a shell script that collects data generated by analyzers and passes it to gnuplot script specified with -a option.

       breakdown.plt is a gnuplot script that understands output data format of Operation Breakdown analyzer and generates .png files with plots.

       Note that gnuplot must be installed.

           # Extract dump.pcap from dump.pcap.bz2 to stdin.
           # Read stdin and analyze data with libbreakdown.so module.
           bzcat trace.pcap.bz2 | nfstrace -m stat -I - -a libbreakdown.so

           # Generate plot according to *.dat files generated by
           # libbreakdown.so analyzer.
           nst.sh -a breakdown.plt -d . -p 'breakdown*.dat' -v

FILES
       API headers
              /usr/include/nfstrace/api/

       Pluggable Analysis Modules (PAMs)
              /usr/lib/nfstrace/

BUGS
       Any problems, bugs, questions, desirable enhancements, etc.  should be sent to <nfstrace@epam.com>

AUTHORS
       Vitali Adamenka <Vitali_Adamenka@epam.com>

       Yauheni Azaranka <Yauheni_Azaranka@epam.com>

       Alexey Costroma <Alexey_Costroma@epam.com>

       Dzianis Huznou <Dzianis_Huznou@epam.com>

       Pavel Karneliuk <Pavel_Karneliuk@epam.com>

       Andrey Kuznetsov <Andrey_Kuznetsov@epam.com>

       Mikhail Litvinets <Mikhail_Litvinets@epam.com>

       Ilya Storozhilov <Ilya_Storozhilov@epam.com>

SEE ALSO
       bpf(4), pcap(3), nfsstat(8), pcap-filter(7).

version 0.4.0                                                       2016-02-07                                                         nfstrace(8)
