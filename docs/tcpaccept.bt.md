tcpaccept(8)                                                  System Manager's Manual                                                 tcpaccept(8)

NAME
       tcpaccept.bt - Trace TCP passive connections (accept()). Uses bpftrace/eBPF

SYNOPSIS
       tcpaccept.bt

DESCRIPTION
       This  tool  traces  passive TCP connections (eg, via an accept() syscall; connect() are active connections). This can be useful for general
       troubleshooting to see what new connections the local server is accepting.

       This uses dynamic tracing of the kernel inet_csk_accept() socket function (from tcp_prot.accept), and will need to  be  modified  to  match
       kernel changes.

       This  tool only traces successful TCP accept()s. Connection attempts to closed ports will not be shown (those can be traced via other func‐
       tions).

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace all passive TCP connections (accept()s):
              # tcpaccept.bt

       FIELDS

       TIME(s)
              Time of the call, in HH:MM:SS format.

       PID    Process ID

       COMM   Process name

       RADDR  Remote IP address.

       RPORT  Remote port.

       LADDR  Local IP address.

       LPORT  Local port

       BL     Current accept backlog vs maximum backlog

OVERHEAD
       This traces the kernel inet_csk_accept function and prints output for each event.  The rate of this depends on your server application.  If
       it  is  a  web or proxy server accepting many tens of thousands of connections per second, then the overhead of this tool may be measurable
       (although, still a lot better than tracing every packet). If it is less than a thousand a second, then the overhead is expected to be  neg‐
       ligible. Test and understand this overhead before use.

SOURCE
       This is from bpftrace

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool may provide more options and customizations.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg, adapted for bpftrace by Dale Hamel

SEE ALSO
       tcpconnect(8), funccount(8), tcpdump(8)

USER COMMANDS                                                       2018-10-24                                                        tcpaccept(8)
