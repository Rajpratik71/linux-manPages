
XPROBE2(1)                                                    General Commands Manual                                                   XPROBE2(1)

NAME
       xprobe2 - A Remote active operating system fingerprinting tool.

SYNOPSIS
       xprobe2 [ -v ] [ -r ] [ -p proto:portnum:state ] [ -c configfile ] [ -o logfile ] [ -p port ] [ -t receive_timeout ] [ -m numberofmatches ]
       [ -D modnum ] [ -F ] [ -X ] [ -B ] [ -A ] [ -T port spec ] [ -U port spec ] host

DESCRIPTION
       xprobe2 is an active operating system fingerprinting tool with a different approach to operating system fingerprinting. xprobe2  relies  on
       fuzzy signature matching, probabilistic guesses, multiple matches simultaneously, and a signature database.

       The  operation  of  xprobe2 is described in a paper titled "xprobe2 - A ´Fuzzy´ Approach to Remote Active Operating System Fingerprinting",
       which is available from http://www.sys-security.com/html/projects/X.html.

       As xprobe2 uses raw sockets to send probes, you must have root privileges in order for xprobe2 to be able to use them.

OPTIONS
       -v     be verbose.

       -r     display route to target (traceroute-like output).

       -c     use configfile to read the configuration file, xprobe2.conf, from a non-default location.

       -D     disable module number modnum.

       -m     set number of results to display to numofmatches.

       -o     use logfile to log everything (default output is stderr).

       -p     specify port number (portnum), protocol (proto) and it's state for xprobe2 to use during rechability/fingerprinting tests of  remote
              host.  Possible  values  for  proto are  tcp or  udp, portnum can only take values from  1 to 65535, state can be either closed (for
              tcp that means that remote host replies with RST packet, for  udp that means that remote host replies  with  ICMP  Port  Unreachable
              packet)  or  open (for  tcp that means that remote host replies with SYN ACK packet and for  udp that means that remote host doesn't
              send any packet back).

       -t     set receive timeout to receive_timeout in seconds (the default is set to 10 seconds).

       -F     generate signature for specified target (use -o to save fingerprint into file)

       -X     write XML output to logfile specified with -o

       -B     causes xprobe2 to be a bit more noisy, as -B makes TCP handshake module to try and blindly guess an open TCP port on the target,  by
              sending sequential probes to the following well-known ports: 80, 443, 23, 21, 25, 22, 139, 445 and 6000 hoping to get SYN ACK reply.
              If xprobe2 receives RST|ACK or SYN|ACK packets for a port in the list above, it will be saved in the  target  port  database  to  be
              later used by other modules (i.e. RST module).

       -T, -U enable built-in portscanning module, which will attempt to scan TCP and/or UDP ports respectively, which were specified in port spec

       -A     enable  experimental  support  for detection of transparent proxies and firewalls/NIDSs spoofing RST packets in portscanning module.
              Option should be used in conjunction with -T. All responses from target gathered during portscanning  process  are  divided  in  two
              classes  (SYN|ACK  and  RST)  and saved for analysis. During analysis module will search for different packets, based on some of the
              fields of TCP and IP headers, within the same class and if such packets are found, message will be displayed showing different pack‐
              ets within the same class.

EXAMPLES
              xprobe2 -v -D 1 -D 2 192.168.1.10

              Will launch an OS fingerprinting attempt targeting 192.168.1.10. Modules 1 and 2, which are reachability tests, will be disabled, so
              probes will be sent even if target is down. Output will be verbose.

              xprobe2 -v -p udp:53:closed 192.168.1.20

              Will launch an OS fingerprint attempt targeting 192.168.1.20. The UDP destination port is set to 53, and the output will be verbose.

              xprobe2 -M 11 -p tcp:80:open 192.168.1.1

              Will only enable TCP handshake module (number 11) to probe the target, very useful when all ICMP traffic is filtered.

              xprobe2 -B 192.168.1.1

              Will cause TCP handshake module to try blindly guess open port on the target by sequentially sending TCP packets to the most  likely
              open ports (80, 443, 23, 21, 25, 22, 139, 445 and 6000).

              xprobe2 -T 1-1024 127.0.0.1

              Will enable portscanning module, which will scan TCP ports starting from 1 to 1024 on 127.0.0.1

              xprobe2 -p tcp:139:open 192.168.1.2

              If  remote  target  has TCP port 139 open, the command line above will enable application level SMB module (if remote target has TCP
              port 445 open, substitue 139 in the command line with 445).

              xprobe2 -p udp:161:open 192.168.1.10

              Will enable SNMPv2c application level module, which will  try  to  retrieve  sysDescr.0  OID  using  community  strings  taken  from
              xprobe2.conf file.

NOTES
       xprobe2 fingerprints remote operating system by analyzing the replies from the target, so to get the most out of xprobe2 you need to supply
       xprobe2 with as much information as possible, in particular it is important to supply at least one open TCP port and one closed  UDP  port.
       Open  TCP  port  can  either be provided in command line (-p), obtained through built-in portscanner (-T) or -B option can be used to cause
       xprobe2 to try to blindly guess open TCP port. UDP port can be supplied via command line (-p) or through built-in portscanner (-U).

HISTORY
       xprobe has been developed in 2001 based  on research performed by Ofir Arkin <ofir@sys-security.com>. The code has been officially released
       at  the  BlackHat Briefings in Las-Vegas in 2001. xprobe2 is a logical evolution of xprobe code. Signature based fuzzy fingerprinting logic
       was embedded.

SEE ALSO
       nmap(1) queso(1) pcap(3)

AUTHORS
       Fyodor Yarochkin <fyodor@o0o.nu>, Ofir Arkin <ofir@sys-security.com>, Meder Kydyraliev <meder@o0o.nu>

       (see also CREDITS in distro tarball).

AVAILABILITY
       The current version and relevant documentation is available from following url:
       https://sourceforge.net/projects/xprobe/

BUGS
       None known (please report).

                                                                                                                                        XPROBE2(1)
