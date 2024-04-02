ARP(7)                     Linux Programmer's Manual                    ARP(7)



NNAAMMEE
       arp - Linux ARP kernel module.

DDEESSCCRRIIPPTTIIOONN
       This kernel protocol module implements the Address Resolution Protocol
       defined in RFC 826.  It is used to convert between Layer2 hardware
       addresses and IPv4 protocol addresses on directly connected networks.
       The user normally doesn't interact directly with this module except to
       configure it; instead it provides a service for other protocols in the
       kernel.

       A user process can receive ARP packets by using ppaacckkeett(7) sockets.
       There is also a mechanism for managing the ARP cache in user-space by
       using nneettlliinnkk(7) sockets.  The ARP table can also be controlled via
       iiooccttll(2) on any AAFF__IINNEETT socket.

       The ARP module maintains a cache of mappings between hardware addresses
       and protocol addresses.  The cache has a limited size so old and less
       frequently used entries are garbage-collected.  Entries which are
       marked as permanent are never deleted by the garbage-collector.  The
       cache can be directly manipulated by the use of ioctls and its behavior
       can be tuned by the _/_p_r_o_c interfaces described below.

       When there is no positive feedback for an existing mapping after some
       time (see the _/_p_r_o_c interfaces below), a neighbor cache entry is
       considered stale.  Positive feedback can be gotten from a higher layer;
       for example from a successful TCP ACK.  Other protocols can signal
       forward progress using the MMSSGG__CCOONNFFIIRRMM flag to sseennddmmssgg(2).  When there
       is no forward progress, ARP tries to reprobe.  It first tries to ask a
       local arp daemon aapppp__ssoolliicciitt times for an updated MAC address.  If that
       fails and an old MAC address is known, a unicast probe is sent
       uuccaasstt__ssoolliicciitt times.  If that fails too, it will broadcast a new ARP
       request to the network.  Requests are sent only when there is data
       queued for sending.

       Linux will automatically add a nonpermanent proxy arp entry when it
       receives a request for an address it forwards to and proxy arp is
       enabled on the receiving interface.  When there is a reject route for
       the target, no proxy arp entry is added.

   IIooccttllss
       Three ioctls are available on all AAFF__IINNEETT sockets.  They take a pointer
       to a _s_t_r_u_c_t _a_r_p_r_e_q as their argument.

           struct arpreq {
               struct sockaddr arp_pa;      /* protocol address */
               struct sockaddr arp_ha;      /* hardware address */
               int             arp_flags;   /* flags */
               struct sockaddr arp_netmask; /* netmask of protocol address */
               char            arp_dev[16];
           };

       SSIIOOCCSSAARRPP, SSIIOOCCDDAARRPP and SSIIOOCCGGAARRPP respectively set, delete and get an ARP
       mapping.  Setting and deleting ARP maps are privileged operations and
       may be performed only by a process with the CCAAPP__NNEETT__AADDMMIINN capability or
       an effective UID of 0.

       _a_r_p___p_a must be an AAFF__IINNEETT address and _a_r_p___h_a must have the same type as
       the device which is specified in _a_r_p___d_e_v.  _a_r_p___d_e_v is a zero-terminated
       string which names a device.

              +----------------+--------------------+
              |             _a_r_p___f_l_a_g_s               |
              +----------------+--------------------+
              |flag            | meaning            |
              +----------------+--------------------+
              |ATF_COM         | Lookup complete    |
              +----------------+--------------------+
              |ATF_PERM        | Permanent entry    |
              +----------------+--------------------+
              |ATF_PUBL        | Publish entry      |
              +----------------+--------------------+
              |ATF_USETRAILERS | Trailers requested |
              +----------------+--------------------+
              |ATF_NETMASK     | Use a netmask      |
              +----------------+--------------------+
              |ATF_DONTPUB     | Don't answer       |
              +----------------+--------------------+
       If the AATTFF__NNEETTMMAASSKK flag is set, then _a_r_p___n_e_t_m_a_s_k should be valid.
       Linux 2.2 does not support proxy network ARP entries, so this should be
       set to 0xffffffff, or 0 to remove an existing proxy arp entry.
       AATTFF__UUSSEETTRRAAIILLEERRSS is obsolete and should not be used.

   //pprroocc iinntteerrffaacceess
       ARP supports a range of _/_p_r_o_c interfaces to configure parameters on a
       global or per-interface basis.  The interfaces can be accessed by
       reading or writing the _/_p_r_o_c_/_s_y_s_/_n_e_t_/_i_p_v_4_/_n_e_i_g_h_/_*_/_* files.  Each
       interface in the system has its own directory in
       _/_p_r_o_c_/_s_y_s_/_n_e_t_/_i_p_v_4_/_n_e_i_g_h_/.  The setting in the "default" directory is
       used for all newly created devices.  Unless otherwise specified, time-
       related interfaces are specified in seconds.

       _a_n_y_c_a_s_t___d_e_l_a_y (since Linux 2.2)
              The maximum number of jiffies to delay before replying to a IPv6
              neighbor solicitation message.  Anycast support is not yet
              implemented.  Defaults to 1 second.

       _a_p_p___s_o_l_i_c_i_t (since Linux 2.2)
              The maximum number of probes to send to the user space ARP
              daemon via netlink before dropping back to multicast probes (see
              _m_c_a_s_t___s_o_l_i_c_i_t).  Defaults to 0.

       _b_a_s_e___r_e_a_c_h_a_b_l_e___t_i_m_e (since Linux 2.2)
              Once a neighbor has been found, the entry is considered to be
              valid for at least a random value between _b_a_s_e___r_e_a_c_h_a_b_l_e___t_i_m_e/2
              and 3*_b_a_s_e___r_e_a_c_h_a_b_l_e___t_i_m_e/2.  An entry's validity will be
              extended if it receives positive feedback from higher level
              protocols.  Defaults to 30 seconds.  This file is now obsolete
              in favor of _b_a_s_e___r_e_a_c_h_a_b_l_e___t_i_m_e___m_s.

       _b_a_s_e___r_e_a_c_h_a_b_l_e___t_i_m_e___m_s (since Linux 2.6.12)
              As for _b_a_s_e___r_e_a_c_h_a_b_l_e___t_i_m_e, but measures time in milliseconds.
              Defaults to 30000 milliseconds.

       _d_e_l_a_y___f_i_r_s_t___p_r_o_b_e___t_i_m_e (since Linux 2.2)
              Delay before first probe after it has been decided that a
              neighbor is stale.  Defaults to 5 seconds.

       _g_c___i_n_t_e_r_v_a_l (since Linux 2.2)
              How frequently the garbage collector for neighbor entries should
              attempt to run.  Defaults to 30 seconds.

       _g_c___s_t_a_l_e___t_i_m_e (since Linux 2.2)
              Determines how often to check for stale neighbor entries.  When
              a neighbor entry is considered stale, it is resolved again
              before sending data to it.  Defaults to 60 seconds.

       _g_c___t_h_r_e_s_h_1 (since Linux 2.2)
              The minimum number of entries to keep in the ARP cache.  The
              garbage collector will not run if there are fewer than this
              number of entries in the cache.  Defaults to 128.

       _g_c___t_h_r_e_s_h_2 (since Linux 2.2)
              The soft maximum number of entries to keep in the ARP cache.
              The garbage collector will allow the number of entries to exceed
              this for 5 seconds before collection will be performed.
              Defaults to 512.

       _g_c___t_h_r_e_s_h_3 (since Linux 2.2)
              The hard maximum number of entries to keep in the ARP cache.
              The garbage collector will always run if there are more than
              this number of entries in the cache.  Defaults to 1024.

       _l_o_c_k_t_i_m_e (since Linux 2.2)
              The minimum number of jiffies to keep an ARP entry in the cache.
              This prevents ARP cache thrashing if there is more than one
              potential mapping (generally due to network misconfiguration).
              Defaults to 1 second.

       _m_c_a_s_t___s_o_l_i_c_i_t (since Linux 2.2)
              The maximum number of attempts to resolve an address by
              multicast/broadcast before marking the entry as unreachable.
              Defaults to 3.

       _p_r_o_x_y___d_e_l_a_y (since Linux 2.2)
              When an ARP request for a known proxy-ARP address is received,
              delay up to _p_r_o_x_y___d_e_l_a_y jiffies before replying.  This is used
              to prevent network flooding in some cases.  Defaults to 0.8
              seconds.

       _p_r_o_x_y___q_l_e_n (since Linux 2.2)
              The maximum number of packets which may be queued to proxy-ARP
              addresses.  Defaults to 64.

       _r_e_t_r_a_n_s___t_i_m_e (since Linux 2.2)
              The number of jiffies to delay before retransmitting a request.
              Defaults to 1 second.  This file is now obsolete in favor of
              _r_e_t_r_a_n_s___t_i_m_e___m_s.

       _r_e_t_r_a_n_s___t_i_m_e___m_s (since Linux 2.6.12)
              The number of milliseconds to delay before retransmitting a
              request.  Defaults to 1000 milliseconds.

       _u_c_a_s_t___s_o_l_i_c_i_t (since Linux 2.2)
              The maximum number of attempts to send unicast probes before
              asking the ARP daemon (see _a_p_p___s_o_l_i_c_i_t).  Defaults to 3.

       _u_n_r_e_s___q_l_e_n (since Linux 2.2)
              The maximum number of packets which may be queued for each
              unresolved address by other network layers.  Defaults to 3.

VVEERRSSIIOONNSS
       The _s_t_r_u_c_t _a_r_p_r_e_q changed in Linux 2.0 to include the _a_r_p___d_e_v member
       and the ioctl numbers changed at the same time.  Support for the old
       ioctls was dropped in Linux 2.2.

       Support for proxy arp entries for networks (netmask not equal
       0xffffffff) was dropped in Linux 2.2.  It is replaced by automatic
       proxy arp setup by the kernel for all reachable hosts on other
       interfaces (when forwarding and proxy arp is enabled for the
       interface).

       The _n_e_i_g_h_/_* interfaces did not exist before Linux 2.2.

BBUUGGSS
       Some timer settings are specified in jiffies, which is architecture-
       and kernel version-dependent; see ttiimmee(7).

       There is no way to signal positive feedback from user space.  This
       means connection-oriented protocols implemented in user space will
       generate excessive ARP traffic, because ndisc will regularly reprobe
       the MAC address.  The same problem applies for some kernel protocols
       (e.g., NFS over UDP).

       This man page mashes together functionality that is IPv4-specific with
       functionality that is shared between IPv4 and IPv6.

SSEEEE AALLSSOO
       ccaappaabbiilliittiieess(7), iipp(7), aarrppdd(8)

       RFC 826 for a description of ARP.  RFC 2461 for a description of IPv6
       neighbor discovery and the base algorithms used.  Linux 2.2+ IPv4 ARP
       uses the IPv6 algorithms when applicable.

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                            ARP(7)
