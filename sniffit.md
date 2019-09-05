SNIFFIT(8)                                                    System Manager's Manual                                                   SNIFFIT(8)

NAME
       sniffit - packet sniffer and monitoring tool

SYNOPSIS
       sniffit  [-xdabvnN]  [-P  proto  ]  [-A char ] [-p port ] [(-r|-R) recordfile ] [-l sniflen ] [-L logparam ] [-F snifdevice ] [-D tty ] [-M
       plugin ] [(-t Target-IP | -s Source-IP ) | (-i|-I) | -c config-file ]

DESCRIPTION
       sniffit is a packet sniffer for TCP/UDP/ICMP packets.  sniffit is able to give you very detailed technical info on these packets (SEQ, ACK,
       TTL, Window, ...) but also packet contents in different formats (hex or plain text, ...).

       sniffit  can  by  default  handle  ethernet  and  PPP devices, but can easily be forced into using other devices (read the README.FIRST and
       sn_config.h files on this subject!)

       The sniffer can easily be configured in order to 'filter' the incoming packets (to make the sniffing results easier to study).  The  config
       file (see sniffit(5) ) allows you to be verry specific on the packets to be processed.

       sniffit also has an interactive mode for active monitoring, and can also be used for continuous monitoring on different levels.

NOTE
       This  man page is supposed to be a reference manual. So please read README.FIRST first, and use this only for better understanding or for a
       quick check on the use of sniffit

OPTIONS
       -v     Shows the version of sniffit you are running and exits (overrides all)

       -t Target-IP
              Only process packets TO Target-IP. If Target-IP is in dot-nr notation, ´x' is allowed as wildcard. (e.g.  '-t  157.193.x',  '-t  x',
              ...)  (NOT compatible with: '-s' '-i' '-I' '-c' '-v' '-L')

       -s Source-IP
              Similar to '-t', only process packets FROM Source-IP.  (NOT compatible with: '-t' '-i' '-I' '-c' '-v' '-L')

       -b     ´both'  mode, together with '-s' or '-t', only process FROM/TO the IP specified by '-s' or '-t' (NOT compatible with: '-t' '-i' '-I'
              '-c' '-v' '-L')

       -c config-file
              Use config-file for the packet filtering. This allows you to be very specific on the packets to be  processed  (see  sniffit(5)  for
              details on the format).  (NOT compatible with: '-t' '-s' '-i' '-I' '-v' '-L')

       -i     Launch the ncurses interface for active monitoring ('interactive mode').  (NOT available if you compiled without INTERACTIVE support
              see sn_config.h and README.FIRST ) (one of the options '-t' '-s' '-i' '-I' '-c' is required) (NOT compatible with:  '-t'  '-s'  '-c'
              '-v' '-L')

       -I     Same  as '-i', but gives you more information.  (one of the options '-t' '-s' '-i' '-I' '-c' is required) (NOT compatible with: '-t'
              '-s' '-c' '-v' '-L')

       -R <file>
              Record all traffic in <file> This file can then be fed to Sniffit with the '-r' option.  (Needs a selection parameter like '-c' '-t'
              '-s') (NOT compatible with '-i' '-I' '-v' '-L' '-r')

       -r <file>
              This  option feeds the recorded <file> to sniffit.  It requires the '-F' option with the correct device. Suppose you log a file on a
              machine with 'eth0'. When feeding the logged file to sniffit , you will need to add '-F eth0' or '-F eth' to the  command  line.  It
              doesn't need much explanation that using '-i' or '-I' in combination with '-r' makes no sense (at this moment).  (requires '-F', NOT
              compatible with '-R' '-i' '-I')

       -n     Turn of IP checksum checking. This can show you bogus packets.  (mind you ARP, RARP, other non-IP packets will show  up  bogus  too)
              (compatible with ALL options)

       -N     Don't perform any of the build in Sniffit functions. Useful for only running a Plugin.  (compatible with ALL options)

       -x     Prints extended info on TCP packets to stdout (SEQ, ACK, Flags, etc...)  Interesting when tracing spoofs, packet loss and other real
              net debugging/checking tasks.  (if you want to log this, pipe stdout to a file) (NOT compatible with: '-i' 'I' '-v')

       -d     ´dump mode', shows the packets on the screen (stdout) instead of logging into files (default). Data is printed in bytes (hex).  (NOT
              compatible with: '-i' 'I' '-v' '-L')

       -a     ´dump  mode', same of '-d' but outputs ASCII. Non printable chars are replaced by '.'.  ('-d' and '-a' mix without any problem) (NOT
              compatible with: '-i' '-I' '-v' '-L')

       -P proto
              Specify the protocols that should be processed (default TCP). Possible options currently are: IP, TCP, ICMP, UDP. They can  be  com‐
              bined.  IP, ICMP, UDP info is dumped to stdout. IP gives ADDITIONAL info on the IPwrapping around other packets, it is not needed to
              specify IP for TCP packet logging.  IP, ICMP packets are not filtered (UDP packets are as of 0.3.4).   (NOT  compatible  with:  '-i'
              '-I' '-v' '-L')

       -A char
              When  in  'normal  mode' (not '-d','-a','-i','-I','-L'), all non-printable chars will be replaced by char (NOT compatible with: '-a'
              '-d' '-i' '-I' '-v' '-L')

       -p port
              Only checks packets going TO (!!)  port port , 0 means all ports, default is 0 (all).  (NOT compatible with:  '-c'  '-i'  '-I'  '-v'
              '-L')

       -l sniflen
              Amount  of  data  to log (default 300 bytes) in 'normal mode'. The first sniflen bytes of every connection are logged. Length 0 logs
              means everything. (look out with diskspace!)  (NOT compatible with: '-i' '-I' '-v' '-L')

       -F snifdevice
              Force sniffit to use a certain network device.  snifdevice can be found with ifconfig (see ifconfig(8)).  sniffit supports  ethernet
              and PPP by default. Read README.FIRST for info on forcing the use of other devices.  (compatible with ALL options)

       -D tty All logging output will be send to that device.  (ONLY works with '-i' and '-I')

       -M plugin
              Activate  Plugin  nr.  Plugin , for a list on all plugins compiled in your version, just type ' sniffit ´. Read all about Plugins in
              the PLUGIN-HOWTO (READ IT!)  (NOT compatible with: '-i' '-I' '-v')

       -L logparam
              Use sniffit as a monitoring tool and enable different logging modes ( logparam ) The File for logging can be specified in the config
              file (see sniffit(5) ) but is sniffit.log by default. Different logparam can be combined.  (ONLY works with '-c')

NORMAL MODE
       A  bunch of sniflen initial bytes (default 300) of each connection is logged into a file x.x.x.x.p-y.y.y.y.o where 'x.x.x.x' is the sending
       host (port 'p') and 'y.y.y.y' the receiving host (port 'o').

DUMP MODE ('-d' and/or '-a')
       Output is dumped to stdout, the packet contents is shown in it's unwrapped form (the complete IP packet).

INTERACTIVE MODE ('-i' or '-I')
       Keys available in interactive mode:

       'UP or 'k'
              self explanatory

       DOWN or j'
              self explanatory

       F1 or '1'
              Enter a host (enter 'all' for no mask) for packet filtering (host that sends the packets)

       F2 or '2'
              Enter a host (enter 'all' for no mask) for packet filtering. (host that receives the packets)

       F3 or '3'
              Enter a port (enter '0' for no mask) for packet filtering. (host that sends the packets)

       F4 or '4'
              Enter a port (enter '0' for no mask) for packet filtering. (host that receives the packets)

       F5 or '5'
              Start a program 'sniffit_key5' with arguments <from IP> <from port> <to IP> <to port> If the program doesn't exist, nothing is done.
              Sniffit should be in the same path as sniffit was STARTED FROM (not necessarely the path sniffit is stored in) This function is use‐
              ful for interactive connection killing or extra monitoring. A little shell script can always transform the arguments given and  pass
              them on to other programs.

       F6 or '6'
              Same as F5 or '5', but with program 'sniffit_key6'

       F7 or '7'
              Same as F5 or '5', but with program 'sniffit_key7'

       F8 or '8'
              Same as F5 or '5', but with program 'sniffit_key8'

       ENTER  a window will pop up and log the connection, or the connection output will be send at a chosen device if you used the '-D' option.

       'q'    When in logging mode, stop logging. Otherwise, quit.

       'n'    Toggle netstatistics. These are sampled at 3 secs, look in the sn_config.h file to change this.

       'g'    Sniffit  is  now able to generate some trafic load. Currently this is a 'underdevelloped' feature with very few options, but it will
              be expanded a lot.  Currently only UDP packets are generated. When pressing 'g' you will be asked the source/dest  IP/port  and  how
              much packets are needed to be transmitted.  Packets contain the line: "This Packet was fired with Sniffit!

       'r'    Reset.. clears all current connections from memory and restarts.

LOGGING MODE ('-L')
       Output is saved to sniffit.log , unless you have specified some other name in the config file (see sniffit(5) ).

       raw    Log  all  SYN,  FIN,  RST  packets. This will give you an overview of all network (TCP) trafic in a 'RAW' way (a connection starting
              could gives you at least 2 SYN packets, etc...).

       norm   Same as raw, but a bit more intelligent. Unless packets are transmitted multiple times because of packet loss, you will only  get  1
              notice of a connection starting or ending. (the packet id will give you the host that initiated the connection first)

       telnet Sniffit will try to catch login and passwords for this application. (see telnet(1) )

       ftp    Sniffit will try to catch login and passwords for this application.  (see ftp(1) )

       mail   Sniffit will try to identify all mail that was logged.

IP ICMP UDP LOGGING
       Information  on these packets is dumped to stdout. Packet Filtering options only refer to TCP and UDP packets.  The contents of UDP packets
       is only shown when enabling '-a' or '-d'.

AUTHOR
       Brecht Claerhout <coder@reptile.rug.ac.be>

SEE ALSO
       sniffit(5)

                                                                                                                                        SNIFFIT(8)
