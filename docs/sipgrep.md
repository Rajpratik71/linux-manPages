
SIPGREP(8)                                                         User Manuals                                                         SIPGREP(8)

NAME
       sipgrep - sip packet grep

SYNOPSIS
       sipgrep  <-ahNViwgGJpevxlDTRMmqCJj>  <-IO pcap_dump > < -n num > < -d dev > < -A num > < -s snaplen > < -S limitlen > < -c contact user > <
       -j user agent > < -f from user > < -t to user > < -H capture URL > < -q seconds > < -P portrange > < -F file > < match expression >  <  bpf
       filter >

DESCRIPTION
       sipgrep  strives  to provide most of GNU grep's common features, applying them to the SIP signaling protocol.  sipgrep is a pcap-aware tool
       that will allow you to specify extended regular expressions to match against data payloads of SIP packets with application specific filter‐
       ing options.  The tool understands filter logic common to other packet sniffing tools, such as tcpdump(8) and sipgrep(1).

OPTIONS
       -h     Display help/usage information.

       -V     Display version information.

       -e     Display empty packets.

       -i     Ignore case.

       -v     Invert match.

       -R     Do not try to drop privileges to the DROPPRIVS_USER.

              sipgrep  makes  no  effort  to  validate  input from live or offline sources as it is focused more on performance and handling large
              amounts of data than protocol correctness, which is most often a fair assumption to make.  However, sometimes it matters and thus as
              a rule sipgrep will try to be defensive and drop any root privileges it might have.

              There  exist scenarios where this behaviour can become an obstacle, so this option is provided to end-users who want to disable this
              feature, but must do so with an understanding of the risks.  Packets can be randomly malformed  or  even  specifically  designed  to
              overflow  sniffers  and  take  control  of  them, and revoking root privileges is currently the only risk mitigation sipgrep employs
              against such an attack.  Use this option and turn it off at your own risk.

       -w     Match the regex expression as a word.

       -p     Don't put the interface into promiscuous mode.

       -l     Make stdout line buffered.

       -D     When reading pcap_dump files, replay them at their recorded time intervals (mimic realtime).

       -T     Print a timestamp in the form of +S.UUUUUU, indicating the delta between packet matches.

       -m     Disable SIP Dialog matching.

       -M     Disable multi-line match (prefers single-line match instead).

       -I pcap_dump
              Input file pcap_dump into sipgrep.  Works with any pcap-compatible dump file format.  This option is useful for searching for a wide
              range of different patterns over the same packet stream.

       -O pcap_dump
              Output matched packets to a pcap-compatible dump file.  This feature does not interfere with normal output to stdout.

       -n num Match only num packets total, then exit.

       -A num Dump num packets of trailing context after matching a packet.

       -s snaplen
              Set the bpf caplen to snaplen (default 65536).

       -S limitlen
              Set the upper limit on the size of packets that sipgrep will look at.  Useful for looking at only the first N bytes of packets with‐
              out changing the BPF snaplen.

       -C     Do not use colors in stdout.

       -c     Match user in Contact: SIP header.

       -f     Match user in From: SIP header.

       -t     Match user in To: SIP header.

       -F file
              Read in the bpf filter from the specified filename.  This is a compatibility option for users familiar with  tcpdump.   Please  note
              that specifying ``-F'' will override any bpf filter specified on the command-line.

       -H ip:port
              Duplicate matching traffic to HEP Capture Server / HOMER.

       -N     Show sub-protocol number along with single-character identifier (useful when observing raw or unknown protocols).

       -g     Disable clean-up of Dialogs during trace.

       -G     Print Dialogs report during trace.

       -J     Automatically send SIP packet-of-death to SipVicious scanners (kill).

       -j     For matching user-agent strings send SIP packet-of-death to SipVicious scanners (kill).

       -q     Terminate sipgrep after a specified number of seconds.

       -a     Enable packet re-assemblation.

       -P     Specify SIP port range (default 5060-5061).

       -d dev By default sipgrep will select a default interface to listen on.  Use this option to force sipgrep to listen on interface dev.

DIAGNOSTICS
       Errors from sipgrep, libpcap, and the GNU regex library are all output to stderr.

AUTHOR
       Written by Alexandr Dubovikov <alexandr.dubovikov@gmail.com>.

REPORTING BUGS
       Please report bugs to the sipgrep Bug Tracker, located at

           https://github.com/sipcapture/sipgrep/issues

       Non-bug, non-feature-request general feedback should be sent to the author directly by email.

NOTES
       ALL YOUR BASE ARE BELONG TO HOMER.

*nux                                                                March 2014                                                          SIPGREP(8)
