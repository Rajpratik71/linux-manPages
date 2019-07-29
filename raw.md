RAW(7)                     Linux Programmer's Manual                    RAW(7)



NNAAMMEE
       raw - Linux IPv4 raw sockets

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//ssoocckkeett..hh>>
       ##iinncclluuddee <<nneettiinneett//iinn..hh>>
       rraaww__ssoocckkeett == ssoocckkeett((AAFF__IINNEETT,, SSOOCCKK__RRAAWW,, iinntt _p_r_o_t_o_c_o_l));;

DDEESSCCRRIIPPTTIIOONN
       Raw sockets allow new IPv4 protocols to be implemented in user space.
       A raw socket receives or sends the raw datagram not including link
       level headers.

       The IPv4 layer generates an IP header when sending a packet unless the
       IIPP__HHDDRRIINNCCLL socket option is enabled on the socket.  When it is enabled,
       the packet must contain an IP header.  For receiving, the IP header is
       always included in the packet.

       In order to create a raw socket, a process must have the CCAAPP__NNEETT__RRAAWW
       capability in the user namespace that governs its network namespace.

       All packets or errors matching the _p_r_o_t_o_c_o_l number specified for the
       raw socket are passed to this socket.  For a list of the allowed
       protocols, see the IANA list of assigned protocol numbers at
       <http://www.iana.org/assignments/protocol-numbers/> and
       ggeettpprroottoobbyynnaammee(3).

       A protocol of IIPPPPRROOTTOO__RRAAWW implies enabled IIPP__HHDDRRIINNCCLL and is able to
       send any IP protocol that is specified in the passed header.  Receiving
       of all IP protocols via IIPPPPRROOTTOO__RRAAWW is not possible using raw sockets.

              +---------------------------------------------------+---------------------+
              |           IP Header fields modified on sending by IIPP__HHDDRRIINNCCLL            |
              +---------------------------------------------------+---------------------+
              |IP Checksum                                        | Always filled in    |
              +---------------------------------------------------+---------------------+
              |Source Address                                     | Filled in when zero |
              +---------------------------------------------------+---------------------+
              |Packet ID                                          | Filled in when zero |
              +---------------------------------------------------+---------------------+
              |Total Length                                       | Always filled in    |
              +---------------------------------------------------+---------------------+
       If IIPP__HHDDRRIINNCCLL is specified and the IP header has a nonzero destination
       address, then the destination address of the socket is used to route
       the packet.  When MMSSGG__DDOONNTTRROOUUTTEE is specified, the destination address
       should refer to a local interface, otherwise a routing table lookup is
       done anyway but gatewayed routes are ignored.

       If IIPP__HHDDRRIINNCCLL isn't set, then IP header options can be set on raw
       sockets with sseettssoocckkoopptt(2); see iipp(7) for more information.

       Starting with Linux 2.2, all IP header fields and options can be set
       using IP socket options.  This means raw sockets are usually needed
       only for new protocols or protocols with no user interface (like ICMP).

       When a packet is received, it is passed to any raw sockets which have
       been bound to its protocol before it is passed to other protocol
       handlers (e.g., kernel protocol modules).

   AAddddrreessss ffoorrmmaatt
       For sending and receiving datagrams (sseennddttoo(2), rreeccvvffrroomm(2), and
       similar), raw sockets use the standard _s_o_c_k_a_d_d_r___i_n address structure
       defined in iipp(7).  The _s_i_n___p_o_r_t field could be used to specify the IP
       protocol number, but it is ignored for sending in Linux 2.2 and later,
       and should be always set to 0 (see BUGS).  For incoming packets,
       _s_i_n___p_o_r_t is set to zero.

   SSoocckkeett ooppttiioonnss
       Raw socket options can be set with sseettssoocckkoopptt(2) and read with
       ggeettssoocckkoopptt(2) by passing the IIPPPPRROOTTOO__RRAAWW family flag.

       IICCMMPP__FFIILLTTEERR
              Enable a special filter for raw sockets bound to the
              IIPPPPRROOTTOO__IICCMMPP protocol.  The value has a bit set for each ICMP
              message type which should be filtered out.  The default is to
              filter no ICMP messages.

       In addition, all iipp(7) IIPPPPRROOTTOO__IIPP socket options valid for datagram
       sockets are supported.

   EErrrroorr hhaannddlliinngg
       Errors originating from the network are passed to the user only when
       the socket is connected or the IIPP__RREECCVVEERRRR flag is enabled.  For
       connected sockets, only EEMMSSGGSSIIZZEE and EEPPRROOTTOO are passed for
       compatibility.  With IIPP__RREECCVVEERRRR, all network errors are saved in the
       error queue.

EERRRROORRSS
       EEAACCCCEESS User tried to send to a broadcast address without having the
              broadcast flag set on the socket.

       EEFFAAUULLTT An invalid memory address was supplied.

       EEIINNVVAALL Invalid argument.

       EEMMSSGGSSIIZZEE
              Packet too big.  Either Path MTU Discovery is enabled (the
              IIPP__MMTTUU__DDIISSCCOOVVEERR socket flag) or the packet size exceeds the
              maximum allowed IPv4 packet size of 64 kB.

       EEOOPPNNOOTTSSUUPPPP
              Invalid flag has been passed to a socket call (like MMSSGG__OOOOBB).

       EEPPEERRMM  The user doesn't have permission to open raw sockets.  Only
              processes with an effective user ID of 0 or the CCAAPP__NNEETT__RRAAWW
              attribute may do that.

       EEPPRROOTTOO An ICMP error has arrived reporting a parameter problem.

VVEERRSSIIOONNSS
       IIPP__RREECCVVEERRRR and IICCMMPP__FFIILLTTEERR are new in Linux 2.2.  They are Linux
       extensions and should not be used in portable programs.

       Linux 2.0 enabled some bug-to-bug compatibility with BSD in the raw
       socket code when the SSOO__BBSSDDCCOOMMPPAATT socket option was set; since Linux
       2.2, this option no longer has that effect.

NNOOTTEESS
       By default, raw sockets do path MTU (Maximum Transmission Unit)
       discovery.  This means the kernel will keep track of the MTU to a
       specific target IP address and return EEMMSSGGSSIIZZEE when a raw packet write
       exceeds it.  When this happens, the application should decrease the
       packet size.  Path MTU discovery can be also turned off using the
       IIPP__MMTTUU__DDIISSCCOOVVEERR socket option or the _/_p_r_o_c_/_s_y_s_/_n_e_t_/_i_p_v_4_/_i_p___n_o___p_m_t_u___d_i_s_c
       file, see iipp(7) for details.  When turned off, raw sockets will
       fragment outgoing packets that exceed the interface MTU.  However,
       disabling it is not recommended for performance and reliability
       reasons.

       A raw socket can be bound to a specific local address using the bbiinndd(2)
       call.  If it isn't bound, all packets with the specified IP protocol
       are received.  In addition, a raw socket can be bound to a specific
       network device using SSOO__BBIINNDDTTOODDEEVVIICCEE; see ssoocckkeett(7).

       An IIPPPPRROOTTOO__RRAAWW socket is send only.  If you really want to receive all
       IP packets, use a ppaacckkeett(7) socket with the EETTHH__PP__IIPP protocol.  Note
       that packet sockets don't reassemble IP fragments, unlike raw sockets.

       If you want to receive all ICMP packets for a datagram socket, it is
       often better to use IIPP__RREECCVVEERRRR on that particular socket; see iipp(7).

       Raw sockets may tap all IP protocols in Linux, even protocols like ICMP
       or TCP which have a protocol module in the kernel.  In this case, the
       packets are passed to both the kernel module and the raw socket(s).
       This should not be relied upon in portable programs, many other BSD
       socket implementation have limitations here.

       Linux never changes headers passed from the user (except for filling in
       some zeroed fields as described for IIPP__HHDDRRIINNCCLL).  This differs from
       many other implementations of raw sockets.

       Raw sockets are generally rather unportable and should be avoided in
       programs intended to be portable.

       Sending on raw sockets should take the IP protocol from _s_i_n___p_o_r_t; this
       ability was lost in Linux 2.2.  The workaround is to use IIPP__HHDDRRIINNCCLL.

BBUUGGSS
       Transparent proxy extensions are not described.

       When the IIPP__HHDDRRIINNCCLL option is set, datagrams will not be fragmented and
       are limited to the interface MTU.

       Setting the IP protocol for sending in _s_i_n___p_o_r_t got lost in Linux 2.2.
       The protocol that the socket was bound to or that was specified in the
       initial ssoocckkeett(2) call is always used.

SSEEEE AALLSSOO
       rreeccvvmmssgg(2), sseennddmmssgg(2), ccaappaabbiilliittiieess(7), iipp(7), ssoocckkeett(7)

       RRFFCC  11119911 for path MTU discovery.  RRFFCC  779911 and the _<_l_i_n_u_x_/_i_p_._h_> header
       file for the IP protocol.

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                            RAW(7)
