tcpretrans(8)                                                 System Manager's Manual                                                tcpretrans(8)

NAME
       tcpretrans - Trace or count TCP retransmits and TLPs. Uses Linux eBPF/bcc.

SYNOPSIS
       tcpretrans [-h] [-l] [-c]

DESCRIPTION
       This  traces TCP retransmits, showing address, port, and TCP state information, and sometimes the PID (although usually not, since retrans‐
       mits are usually sent by the kernel on timeouts). To keep overhead very low, only the TCP retransmit functions are traced.  This  does  not
       trace  every  packet (like tcpdump(8) or a packet sniffer). Optionally, it can count retransmits over a user signalled interval to spot po‐
       tentially dropping network paths the flows are traversing.

       This uses dynamic tracing of the kernel tcp_retransmit_skb() and tcp_send_loss_probe() functions, and will need to be updated to match ker‐
       nel changes to these functions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -l     Include tail loss probe attempts (in some cases the kernel may not complete the TLP send).

       -c     Count occurring retransmits per flow.

EXAMPLES
       Trace TCP retransmits:
              # tcpretrans

       Trace TCP retransmits and TLP attempts:
              # tcpretrans -l

FIELDS
       TIME   Time of the retransmit.

       PID    Process  ID  that  was  on-CPU. This is less useful than it might sound, as it may usually be 0, for the kernel, for timer-based re‐
              transmits.

       IP     IP address family (4 or 6).

       LADDR  Local IP address.

       LPORT  Local port.

       T>     Type of event: R> == retransmit, L> == tail loss probe.

       RADDR  Remote IP address.

       RPORT  Remote port.

       STATE  TCP session state.

       RETRANSMITS
              Accumulated occurred retransmits since start.

OVERHEAD
       Should be negligible: TCP retransmit events should be low (<1000/s), and the low overhead this tool adds to each event should make the cost
       negligible.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       tcpconnect(8), tcpaccept(8)

USER COMMANDS                                                       2016-02-14                                                       tcpretrans(8)
