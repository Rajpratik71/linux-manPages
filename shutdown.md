SHUTDOWN(2)                Linux Programmer's Manual               SHUTDOWN(2)



NNAAMMEE
       shutdown - shut down part of a full-duplex connection

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//ssoocckkeett..hh>>

       iinntt sshhuuttddoowwnn((iinntt _s_o_c_k_f_d,, iinntt _h_o_w));;

DDEESSCCRRIIPPTTIIOONN
       The sshhuuttddoowwnn() call causes all or part of a full-duplex connection on
       the socket associated with _s_o_c_k_f_d to be shut down.  If _h_o_w is SSHHUUTT__RRDD,
       further receptions will be disallowed.  If _h_o_w is SSHHUUTT__WWRR, further
       transmissions will be disallowed.  If _h_o_w is SSHHUUTT__RRDDWWRR, further
       receptions and transmissions will be disallowed.

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       EEBBAADDFF  _s_o_c_k_f_d is not a valid file descriptor.

       EEIINNVVAALL An invalid value was specified in _h_o_w (but see BUGS).

       EENNOOTTCCOONNNN
              The specified socket is not connected.

       EENNOOTTSSOOCCKK
              The file descriptor _s_o_c_k_f_d does not refer to a socket.

CCOONNFFOORRMMIINNGG TTOO
       POSIX.1-2001, POSIX.1-2008, 4.4BSD (sshhuuttddoowwnn() first appeared in
       4.2BSD).

NNOOTTEESS
       The constants SSHHUUTT__RRDD, SSHHUUTT__WWRR, SSHHUUTT__RRDDWWRR have the value 0, 1, 2,
       respectively, and are defined in _<_s_y_s_/_s_o_c_k_e_t_._h_> since glibc-2.1.91.

BBUUGGSS
       Checks for the validity of _h_o_w are done in domain-specific code, and
       before Linux 3.7 not all domains performed these checks.  Most notably,
       UNIX domain sockets simply ignored invalid values.  This problem was
       fixed for UNIX domain sockets in Linux 3.7.

SSEEEE AALLSSOO
       cclloossee(2), ccoonnnneecctt(2), ssoocckkeett(2), ssoocckkeett(7)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2018-04-30                       SHUTDOWN(2)
