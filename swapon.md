SWAPON(2)                  Linux Programmer's Manual                 SWAPON(2)



NNAAMMEE
       swapon, swapoff - start/stop swapping to file/device

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>
       ##iinncclluuddee <<ssyyss//sswwaapp..hh>>

       iinntt sswwaappoonn((ccoonnsstt cchhaarr **_p_a_t_h,, iinntt _s_w_a_p_f_l_a_g_s));;
       iinntt sswwaappooffff((ccoonnsstt cchhaarr **_p_a_t_h));;

DDEESSCCRRIIPPTTIIOONN
       sswwaappoonn() sets the swap area to the file or block device specified by
       _p_a_t_h.  sswwaappooffff() stops swapping to the file or block device specified
       by _p_a_t_h.

       If the SSWWAAPP__FFLLAAGG__PPRREEFFEERR flag is specified in the sswwaappoonn() _s_w_a_p_f_l_a_g_s
       argument, the new swap area will have a higher priority than default.
       The priority is encoded within _s_w_a_p_f_l_a_g_s as:

           _(_p_r_i_o _<_< _S_W_A_P___F_L_A_G___P_R_I_O___S_H_I_F_T_) _& _S_W_A_P___F_L_A_G___P_R_I_O___M_A_S_K

       If the SSWWAAPP__FFLLAAGG__DDIISSCCAARRDD flag is specified in the sswwaappoonn() _s_w_a_p_f_l_a_g_s
       argument, freed swap pages will be discarded before they are reused, if
       the swap device supports the discard or trim operation.  (This may
       improve performance on some Solid State Devices, but often it does
       not.)  See also NOTES.

       These functions may be used only by a privileged process (one having
       the CCAAPP__SSYYSS__AADDMMIINN capability).

   PPrriioorriittyy
       Each swap area has a priority, either high or low.  The default
       priority is low.  Within the low-priority areas, newer areas are even
       lower priority than older areas.

       All priorities set with _s_w_a_p_f_l_a_g_s are high-priority, higher than
       default.  They may have any nonnegative value chosen by the caller.
       Higher numbers mean higher priority.

       Swap pages are allocated from areas in priority order, highest priority
       first.  For areas with different priorities, a higher-priority area is
       exhausted before using a lower-priority area.  If two or more areas
       have the same priority, and it is the highest priority available, pages
       are allocated on a round-robin basis between them.

       As of Linux 1.3.6, the kernel usually follows these rules, but there
       are exceptions.

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       EEBBUUSSYY  (for sswwaappoonn()) The specified _p_a_t_h is already being used as a
              swap area.

       EEIINNVVAALL The file _p_a_t_h exists, but refers neither to a regular file nor
              to a block device;

       EEIINNVVAALL (sswwaappoonn()) The indicated path does not contain a valid swap
              signature or resides on an in-memory filesystem such as
              ttmmppffss(5).

       EEIINNVVAALL (since Linux 3.4)
              (sswwaappoonn()) An invalid flag value was specified in _f_l_a_g_s.

       EEIINNVVAALL (sswwaappooffff()) _p_a_t_h is not currently a swap area.

       EENNFFIILLEE The system-wide limit on the total number of open files has been
              reached.

       EENNOOEENNTT The file _p_a_t_h does not exist.

       EENNOOMMEEMM The system has insufficient memory to start swapping.

       EEPPEERRMM  The caller does not have the CCAAPP__SSYYSS__AADDMMIINN capability.
              Alternatively, the maximum number of swap files are already in
              use; see NOTES below.

CCOONNFFOORRMMIINNGG TTOO
       These functions are Linux-specific and should not be used in programs
       intended to be portable.  The second _s_w_a_p_f_l_a_g_s argument was introduced
       in Linux 1.3.2.

NNOOTTEESS
       The partition or path must be prepared with mmkksswwaapp(8).

       There is an upper limit on the number of swap files that may be used,
       defined by the kernel constant MMAAXX__SSWWAAPPFFIILLEESS.  Before kernel 2.4.10,
       MMAAXX__SSWWAAPPFFIILLEESS has the value 8; since kernel 2.4.10, it has the value
       32.  Since kernel 2.6.18, the limit is decreased by 2 (thus: 30) if the
       kernel is built with the CCOONNFFIIGG__MMIIGGRRAATTIIOONN option (which reserves two
       swap table entries for the page migration features of mmbbiinndd(2) and
       mmiiggrraattee__ppaaggeess(2)).  Since kernel 2.6.32, the limit is further decreased
       by 1 if the kernel is built with the CCOONNFFIIGG__MMEEMMOORRYY__FFAAIILLUURREE option.

       Discard of swap pages was introduced in kernel 2.6.29, then made
       conditional on the SSWWAAPP__FFLLAAGG__DDIISSCCAARRDD flag in kernel 2.6.36, which still
       discards the entire swap area when sswwaappoonn() is called, even if that
       flag bit is not set.

SSEEEE AALLSSOO
       mmkksswwaapp(8), sswwaappooffff(8), sswwaappoonn(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                         SWAPON(2)
