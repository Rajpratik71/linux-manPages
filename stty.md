STTY(1P)                   POSIX Programmer's Manual                  STTY(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       stty — set the options for a terminal

SSYYNNOOPPSSIISS
       stty [[−a|−g]]

       stty _o_p_e_r_a_n_d...

DDEESSCCRRIIPPTTIIOONN
       The _s_t_t_y utility shall set or report on terminal I/O characteristics
       for the device that is its standard input. Without options or operands
       specified, it shall report the settings of certain characteristics,
       usually those that differ from implementation-defined defaults.
       Otherwise, it shall modify the terminal state according to the
       specified operands. Detailed information about the modes listed in the
       first five groups below are described in the Base Definitions volume of
       POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.  Operands in the
       Combination Modes group (see _C_o_m_b_i_n_a_t_i_o_n _M_o_d_e_s) are implemented using
       operands in the previous groups. Some combinations of operands are
       mutually-exclusive on some terminal types; the results of using such
       combinations are unspecified.

       Typical implementations of this utility require a communications line
       configured to use the tteerrmmiiooss interface defined in the System
       Interfaces volume of POSIX.1‐2008. On systems where none of these lines
       are available, and on lines not currently configured to support the
       tteerrmmiiooss interface, some of the operands need not affect terminal
       characteristics.

OOPPTTIIOONNSS
       The _s_t_t_y utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−aa        Write to standard output all the current settings for the
                 terminal.

       −−gg        Write to standard output all the current settings in an
                 unspecified form that can be used as arguments to another
                 invocation of the _s_t_t_y utility on the same system. The form
                 used shall not contain any characters that would require
                 quoting to avoid word expansion by the shell; see _S_e_c_t_i_o_n
                 _2_._6, _W_o_r_d _E_x_p_a_n_s_i_o_n_s.

OOPPEERRAANNDDSS
       The following operands shall be supported to set the terminal
       characteristics.

   CCoonnttrrooll MMooddeess
       ppaarreennbb  (−−ppaarreennbb)
                   Enable (disable) parity generation and detection. This
                   shall have the effect of setting (not setting) PARENB in
                   the tteerrmmiiooss _c___c_f_l_a_g field, as defined in the Base
                   Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l
                   _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       ppaarroodddd  (−−ppaarroodddd)
                   Select odd (even) parity. This shall have the effect of
                   setting (not setting) PARODD in the tteerrmmiiooss _c___c_f_l_a_g field,
                   as defined in the Base Definitions volume of POSIX.1‐2008,
                   _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       ccss55  ccss66  ccss77  ccss88
                   Select character size, if possible. This shall have the
                   effect of setting CS5, CS6, CS7, and CS8, respectively, in
                   the tteerrmmiiooss _c___c_f_l_a_g field, as defined in the Base
                   Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l
                   _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       _n_u_m_b_e_r      Set terminal baud rate to the number given, if possible. If
                   the baud rate is set to zero, the modem control lines shall
                   no longer be asserted. This shall have the effect of
                   setting the input and output tteerrmmiiooss baud rate values as
                   defined in the Base Definitions volume of POSIX.1‐2008,
                   _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iissppeeeedd  _n_u_m_b_e_r
                   Set terminal input baud rate to the number given, if
                   possible. If the input baud rate is set to zero, the input
                   baud rate shall be specified by the value of the output
                   baud rate. This shall have the effect of setting the input
                   tteerrmmiiooss baud rate values as defined in the Base Definitions
                   volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l
                   _I_n_t_e_r_f_a_c_e.

       oossppeeeedd  _n_u_m_b_e_r
                   Set terminal output baud rate to the number given, if
                   possible. If the output baud rate is set to zero, the modem
                   control lines shall no longer be asserted. This shall have
                   the effect of setting the output tteerrmmiiooss baud rate values
                   as defined in the Base Definitions volume of POSIX.1‐2008,
                   _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       hhuuppccll  (−−hhuuppccll)
                   Stop asserting modem control lines (do not stop asserting
                   modem control lines) on last close. This shall have the
                   effect of setting (not setting) HUPCL in the tteerrmmiiooss
                   _c___c_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       hhuupp  (−−hhuupp)  Equivalent to hhuuppccll(−−hhuuppccll).

       ccssttooppbb  (−−ccssttooppbb)
                   Use two (one) stop bits per character. This shall have the
                   effect of setting (not setting) CSTOPB in the tteerrmmiiooss
                   _c___c_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       ccrreeaadd  (−−ccrreeaadd)
                   Enable (disable) the receiver. This shall have the effect
                   of setting (not setting) CREAD in the tteerrmmiiooss _c___c_f_l_a_g
                   field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       ccllooccaall  (−−ccllooccaall)
                   Assume a line without (with) modem control. This shall have
                   the effect of setting (not setting) CLOCAL in the tteerrmmiiooss
                   _c___c_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       It is unspecified whether _s_t_t_y shall report an error if an attempt to
       set a Control Mode fails.

   IInnppuutt MMooddeess
       iiggnnbbrrkk  (−−iiggnnbbrrkk)
                   Ignore (do not ignore) break on input. This shall have the
                   effect of setting (not setting) IGNBRK in the tteerrmmiiooss
                   _c___i_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       bbrrkkiinntt  (−−bbrrkkiinntt)
                   Signal (do not signal) INTR on break. This shall have the
                   effect of setting (not setting) BRKINT in the tteerrmmiiooss
                   _c___i_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iiggnnppaarr  (−−iiggnnppaarr)
                   Ignore (do not ignore) bytes with parity errors. This shall
                   have the effect of setting (not setting) IGNPAR in the
                   tteerrmmiiooss _c___i_f_l_a_g field, as defined in the Base Definitions
                   volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l
                   _I_n_t_e_r_f_a_c_e.

       ppaarrmmrrkk  (−−ppaarrmmrrkk)
                   Mark (do not mark) parity errors. This shall have the
                   effect of setting (not setting) PARMRK in the tteerrmmiiooss
                   _c___i_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iinnppcckk  (−−iinnppcckk)
                   Enable (disable) input parity checking. This shall have the
                   effect of setting (not setting) INPCK in the tteerrmmiiooss
                   _c___i_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iissttrriipp  (−−iissttrriipp)
                   Strip (do not strip) input characters to seven bits. This
                   shall have the effect of setting (not setting) ISTRIP in
                   the tteerrmmiiooss _c___i_f_l_a_g field, as defined in the Base
                   Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l
                   _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iinnllccrr  (−−iinnllccrr)
                   Map (do not map) NL to CR on input. This shall have the
                   effect of setting (not setting) INLCR in the tteerrmmiiooss
                   _c___i_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iiggnnccrr  ((−−iiggnnccrr))
                   Ignore (do not ignore) CR on input. This shall have the
                   effect of setting (not setting) IGNCR in the tteerrmmiiooss
                   _c___i_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iiccrrnnll  (−−iiccrrnnll)
                   Map (do not map) CR to NL on input. This shall have the
                   effect of setting (not setting) ICRNL in the tteerrmmiiooss
                   _c___i_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iixxoonn  (−−iixxoonn)
                   Enable (disable) START/STOP output control. Output from the
                   system is stopped when the system receives STOP and started
                   when the system receives START. This shall have the effect
                   of setting (not setting) IXON in the tteerrmmiiooss _c___i_f_l_a_g field,
                   as defined in the Base Definitions volume of POSIX.1‐2008,
                   _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iixxaannyy  (−−iixxaannyy)
                   Allow any character to restart output. This shall have the
                   effect of setting (not setting) IXANY in the tteerrmmiiooss
                   _c___i_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iixxooffff  (−−iixxooffff)
                   Request that the system send (not send) STOP characters
                   when the input queue is nearly full and START characters to
                   resume data transmission.  This shall have the effect of
                   setting (not setting) IXOFF in the tteerrmmiiooss _c___i_f_l_a_g field,
                   as defined in the Base Definitions volume of POSIX.1‐2008,
                   _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

   OOuuttppuutt MMooddeess
       ooppoosstt  (−−ooppoosstt)
                   Post-process output (do not post-process output; ignore all
                   other output modes). This shall have the effect of setting
                   (not setting) OPOST in the tteerrmmiiooss _c___o_f_l_a_g field, as
                   defined in the Base Definitions volume of POSIX.1‐2008,
                   _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       ooccrrnnll  (−−ooccrrnnll)
                   Map (do not map) CR to NL on output This shall have the
                   effect of setting (not setting) OCRNL in the tteerrmmiiooss
                   _c___o_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       oonnooccrr  (−−oonnooccrr)
                   Do not (do) output CR at column zero. This shall have the
                   effect of setting (not setting) ONOCR in the tteerrmmiiooss
                   _c___o_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       oonnllrreett  (−−oonnllrreett)
                   The terminal newline key performs (does not perform) the CR
                   function.  This shall have the effect of setting (not
                   setting) ONLRET in the tteerrmmiiooss _c___o_f_l_a_g field, as defined in
                   the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1,
                   _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       ooffiillll  (−−ooffiillll)
                   Use fill characters (use timing) for delays. This shall
                   have the effect of setting (not setting) OFILL in the
                   tteerrmmiiooss _c___o_f_l_a_g field, as defined in the Base Definitions
                   volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l
                   _I_n_t_e_r_f_a_c_e.

       ooffddeell  (−−ooffddeell)
                   Fill characters are DELs (NULs). This shall have the effect
                   of setting (not setting) OFDEL in the tteerrmmiiooss _c___o_f_l_a_g
                   field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       ccrr00  ccrr11  ccrr22  ccrr33
                   Select the style of delay for CRs. This shall have the
                   effect of setting CRDLY to CR0, CR1, CR2, or CR3,
                   respectively, in the tteerrmmiiooss _c___o_f_l_a_g field, as defined in
                   the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1,
                   _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       nnll00  nnll11     Select the style of delay for NL. This shall have the
                   effect of setting NLDLY to NL0 or NL1, respectively, in the
                   tteerrmmiiooss _c___o_f_l_a_g field, as defined in the Base Definitions
                   volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l
                   _I_n_t_e_r_f_a_c_e.

       ttaabb00  ttaabb11  ttaabb22  ttaabb33
                   Select the style of delay for horizontal tabs. This shall
                   have the effect of setting TABDLY to TAB0, TAB1, TAB2, or
                   TAB3, respectively, in the tteerrmmiiooss _c___o_f_l_a_g field, as
                   defined in the Base Definitions volume of POSIX.1‐2008,
                   _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.  Note that TAB3 has
                   the effect of expanding <tab> characters to <space>
                   characters.

       ttaabbss  (−−ttaabbss)
                   Synonym for ttaabb00 (ttaabb33).

       bbss00  bbss11     Select the style of delay for <backspace> characters. This
                   shall have the effect of setting BSDLY to BS0 or BS1,
                   respectively, in the tteerrmmiiooss _c___o_f_l_a_g field, as defined in
                   the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1,
                   _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       ffff00  ffff11     Select the style of delay for <form-feed> characters. This
                   shall have the effect of setting FFDLY to FF0 or FF1,
                   respectively, in the tteerrmmiiooss _c___o_f_l_a_g field, as defined in
                   the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1,
                   _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       vvtt00  vvtt11     Select the style of delay for <vertical-tab> characters.
                   This shall have the effect of setting VTDLY to VT0 or VT1,
                   respectively, in the tteerrmmiiooss _c___o_f_l_a_g field, as defined in
                   the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1,
                   _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

   LLooccaall MMooddeess
       iissiigg  (−−iissiigg)
                   Enable (disable) the checking of characters against the
                   special control characters INTR, QUIT, and SUSP. This shall
                   have the effect of setting (not setting) ISIG in the
                   tteerrmmiiooss _c___l_f_l_a_g field, as defined in the Base Definitions
                   volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l
                   _I_n_t_e_r_f_a_c_e.

       iiccaannoonn  (−−iiccaannoonn)
                   Enable (disable) canonical input (ERASE and KILL
                   processing). This shall have the effect of setting (not
                   setting) ICANON in the tteerrmmiiooss _c___l_f_l_a_g field, as defined in
                   the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1,
                   _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       iieexxtteenn  (−−iieexxtteenn)
                   Enable (disable) any implementation-defined special control
                   characters not currently controlled by iiccaannoonn, iissiigg, iixxoonn,
                   or iixxooffff.  This shall have the effect of setting (not
                   setting) IEXTEN in the tteerrmmiiooss _c___l_f_l_a_g field, as defined in
                   the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1,
                   _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       eecchhoo  (−−eecchhoo)
                   Echo back (do not echo back) every character typed. This
                   shall have the effect of setting (not setting) ECHO in the
                   tteerrmmiiooss _c___l_f_l_a_g field, as defined in the Base Definitions
                   volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l
                   _I_n_t_e_r_f_a_c_e.

       eecchhooee  (−−eecchhooee)
                   The ERASE character visually erases (does not erase) the
                   last character in the current line from the display, if
                   possible. This shall have the effect of setting (not
                   setting) ECHOE in the tteerrmmiiooss _c___l_f_l_a_g field, as defined in
                   the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1,
                   _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       eecchhookk  (−−eecchhookk)
                   Echo (do not echo) NL after KILL character. This shall have
                   the effect of setting (not setting) ECHOK in the tteerrmmiiooss
                   _c___l_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

       eecchhoonnll  (−−eecchhoonnll)
                   Echo (do not echo) NL, even if eecchhoo is disabled. This shall
                   have the effect of setting (not setting) ECHONL in the
                   tteerrmmiiooss _c___l_f_l_a_g field, as defined in the Base Definitions
                   volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l
                   _I_n_t_e_r_f_a_c_e.

       nnooffllsshh  (−−nnooffllsshh)
                   Disable (enable) flush after INTR, QUIT, SUSP. This shall
                   have the effect of setting (not setting) NOFLSH in the
                   tteerrmmiiooss _c___l_f_l_a_g field, as defined in the Base Definitions
                   volume of POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l
                   _I_n_t_e_r_f_a_c_e.

       ttoossttoopp  (−−ttoossttoopp)
                   Send SIGTTOU for background output. This shall have the
                   effect of setting (not setting) TOSTOP in the tteerrmmiiooss
                   _c___l_f_l_a_g field, as defined in the Base Definitions volume of
                   POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e.

   SSppeecciiaall CCoonnttrrooll CChhaarraacctteerr AAssssiiggnnmmeennttss
       <_c_o_n_t_r_o_l>‐_c_h_a_r_a_c_t_e_r_ _s_t_r_i_n_g
             Set <_c_o_n_t_r_o_l>‐_c_h_a_r_a_c_t_e_r to _s_t_r_i_n_g.  If <_c_o_n_t_r_o_l>‐_c_h_a_r_a_c_t_e_r is one
             of the character sequences in the first column of the following
             table, the corresponding the Base Definitions volume of
             POSIX.1‐2008, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e control
             character from the second column shall be recognized. This has
             the effect of setting the corresponding element of the tteerrmmiiooss
             _c___c_c array (see the Base Definitions volume of POSIX.1‐2008,
             _C_h_a_p_t_e_r _1_3, _H_e_a_d_e_r_s, _<_t_e_r_m_i_o_s_._h_>).

                          TTaabbllee:: CCoonnttrrooll CChhaarraacctteerr NNaammeess iinn _s_t_t_y

                  +------------------+----------------+-----------------+
                  |CCoonnttrrooll CChhaarraacctteerr | cc__cccc SSuubbssccrriipptt |   DDeessccrriippttiioonn   |
                  +------------------+----------------+-----------------+
                  |eeooff               | VEOF           | EOF character   |
                  |eeooll               | VEOL           | EOL character   |
                  |eerraassee             | VERASE         | ERASE character |
                  |iinnttrr              | VINTR          | INTR character  |
                  |kkiillll              | VKILL          | KILL character  |
                  |qquuiitt              | VQUIT          | QUIT character  |
                  |ssuusspp              | VSUSP          | SUSP character  |
                  |ssttaarrtt             | VSTART         | START character |
                  |ssttoopp              | VSTOP          | STOP character  |
                  +------------------+----------------+-----------------+
             If _s_t_r_i_n_g is a single character, the control character shall be
             set to that character. If _s_t_r_i_n_g is the two-character sequence
             ""^^−−"" or the string _u_n_d_e_f, the control character shall be set to
             _POSIX_VDISABLE , if it is in effect for the device; if
             _POSIX_VDISABLE is not in effect for the device, it shall be
             treated as an error. In the POSIX locale, if _s_t_r_i_n_g is a two-
             character sequence beginning with <circumflex> (''^^''), and the
             second character is one of those listed in the ""^^cc"" column of the
             following table, the control character shall be set to the
             corresponding character value in the Value column of the table.

                       TTaabbllee:: CCiirrccuummfflleexx CCoonnttrrooll CChhaarraacctteerrss iinn _s_t_t_y

                      +--------------+----------------+--------------+
                      | ^^cc   VVaalluuee   |   ^^cc   VVaalluuee   |   ^^cc   VVaalluuee |
                      +--------------+----------------+--------------+
                      |a, A  <SOH>   |  l, L  <FF>    |  w, W  <ETB> |
                      |b, B  <STX>   |  m, M  <CR>    |  x, X  <CAN> |
                      |c, C  <ETX>   |  n, N  <SO>    |  y, Y  <EM>  |
                      |d, D  <EOT>   |  o, O  <SI>    |  z, Z  <SUB> |
                      |e, E  <ENQ>   |  p, P  <DLE>   |  [     <ESC> |
                      |f, F  <ACK>   |  q, Q  <DC1>   |  \     <FS>  |
                      |g, G  <BEL>   |  r, R  <DC2>   |  ]     <GS>  |
                      |h, H  <BS>    |  s, S  <DC3>   |  ^     <RS>  |
                      |i, I  <HT>    |  t, T  <DC4>   |  _     <US>  |
                      |j, J  <LF>    |  u, U  <NAK>   |  ?     <DEL> |
                      |k, K  <VT>    |  v, V  <SYN>   |              |
                      +--------------+----------------+--------------+
       mmiinn  _n_u_m_b_e_r
             Set the value of MIN to _n_u_m_b_e_r.  MIN is used in non-canonical
             mode input processing (iiccaannoonn).

       ttiimmee  _n_u_m_b_e_r
             Set the value of TIME to _n_u_m_b_e_r.  TIME is used in non-canonical
             mode input processing (iiccaannoonn).

   CCoommbbiinnaattiioonn MMooddeess
       _s_a_v_e_d_ _s_e_t_t_i_n_g_s
             Set the current terminal characteristics to the saved settings
             produced by the −−gg option.

       eevveennpp or ppaarriittyy
             Enable ppaarreennbb and ccss77; disable ppaarroodddd.

       ooddddpp
             Enable ppaarreennbb, ccss77, and ppaarroodddd.

       −−ppaarriittyy, −−eevveennpp, or −−ooddddpp
             Disable ppaarreennbb, and set ccss88.

       rraaww  (−−rraaww or ccooookkeedd)
             Enable (disable) raw input and output. Raw mode shall be
             equivalent to setting:


                 ssttttyy ccss88 eerraassee ^^−− kkiillll ^^−− iinnttrr ^^−− \\
                     qquuiitt ^^−− eeooff ^^−− eeooll ^^−− −−ppoosstt −−iinnppcckk

       nnll  (−−nnll)
             Disable (enable) iiccrrnnll.  In addition, −−nnll unsets iinnllccrr and iiggnnccrr.

       eekk    Reset ERASE and KILL characters back to system defaults.

       ssaannee
             Reset all modes to some reasonable, unspecified, values.

SSTTDDIINN
       Although no input is read from standard input, standard input shall be
       used to get the current terminal I/O characteristics and to set new
       terminal I/O characteristics.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _s_t_t_y:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  This variable determines the locale for the interpretation of
                 sequences of bytes of text data as characters (for example,
                 single-byte as opposed to multi-byte characters in arguments)
                 and which characters are in the class pprriinntt.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       If operands are specified, no output shall be produced.

       If the −−gg option is specified, _s_t_t_y shall write to standard output the
       current settings in a form that can be used as arguments to another
       instance of _s_t_t_y on the same system.

       If the −−aa option is specified, all of the information as described in
       the OPERANDS section shall be written to standard output. Unless
       otherwise specified, this information shall be written as
       <space>-separated tokens in an unspecified format, on one or more
       lines, with an unspecified number of tokens per line. Additional
       information may be written.

       If no options or operands are specified, an unspecified subset of the
       information written for the −−aa option shall be written.

       If speed information is written as part of the default output, or if
       the −−aa option is specified and if the terminal input speed and output
       speed are the same, the speed information shall be written as follows:


           ""ssppeeeedd %%dd bbaauudd;;"",, <<_s_p_e_e_d>

       Otherwise, speeds shall be written as:


           ""iissppeeeedd %%dd bbaauudd;; oossppeeeedd %%dd bbaauudd;;"",, <<_i_s_p_e_e_d>, <_o_s_p_e_e_d>

       In locales other than the POSIX locale, the word bbaauudd may be changed to
       something more appropriate in those locales.

       If control characters are written as part of the default output, or if
       the −−aa option is specified, control characters shall be written as:


           ""%%ss == %%ss;;"",, <<_c_o_n_t_r_o_l_-_c_h_a_r_a_c_t_e_r _n_a_m_e>, <_v_a_l_u_e>

       where <_v_a_l_u_e> is either the character, or some visual representation of
       the character if it is non-printable, or the string _u_n_d_e_f if the
       character is disabled.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The terminal options were read or set successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The −−gg flag is designed to facilitate the saving and restoring of
       terminal state from the shell level. For example, a program may:


           ssaavveetteerrmm==""$$((ssttttyy −−gg))""       ## ssaavvee tteerrmmiinnaall ssttaattee
           ssttttyy _(_n_e_w _s_e_t_t_i_n_g_s_)         # set new state
           ...                         # ...
           stty $saveterm              # restore terminal state

       Since the format is unspecified, the saved value is not portable across
       systems.

       Since the −−aa format is so loosely specified, scripts that save and
       restore terminal settings should use the −−gg option.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The original _s_t_t_y description was taken directly from System V and
       reflected the System V terminal driver tteerrmmiioo.  It has been modified to
       correspond to the terminal driver tteerrmmiiooss.

       Output modes are specified only for XSI-conformant systems. All
       implementations are expected to provide _s_t_t_y operands corresponding to
       all of the output modes they support.

       The _s_t_t_y utility is primarily used to tailor the user interface of the
       terminal, such as selecting the preferred ERASE and KILL characters. As
       an application programming utility, _s_t_t_y can be used within shell
       scripts to alter the terminal settings for the duration of the script.

       The tteerrmmiiooss section states that individual disabling of control
       characters is possible through the option _POSIX_VDISABLE.  If enabled,
       two conventions currently exist for specifying this: System V uses
       ""^^−−"", and BSD uses _u_n_d_e_f.  Both are accepted by _s_t_t_y in this volume of
       POSIX.1‐2008. The other BSD convention of using the letter ''uu'' was
       rejected because it conflicts with the actual letter ''uu'', which is an
       acceptable value for a control character.

       Early proposals did not specify the mapping of ""^^cc"" to control
       characters because the control characters were not specified in the
       POSIX locale character set description file requirements. The control
       character set is now specified in the Base Definitions volume of
       POSIX.1‐2008, _C_h_a_p_t_e_r _3, _D_e_f_i_n_i_t_i_o_n_s, so the historical mapping is
       specified. Note that although the mapping corresponds to control-
       character key assignments on many terminals that use the
       ISO/IEC 646:1991 standard (or ASCII) character encodings, the mapping
       specified here is to the control characters, not their keyboard
       encodings.

       Since tteerrmmiiooss supports separate speeds for input and output, two new
       options were added to specify each distinctly.

       Some historical implementations use standard input to get and set
       terminal characteristics; others use standard output. Since input from
       a login TTY is usually restricted to the owner while output to a TTY is
       frequently open to anyone, using standard input provides fewer chances
       of accidentally (or maliciously) altering the terminal settings of
       other users. Using standard input also allows _s_t_t_y −−aa and _s_t_t_y −−gg
       output to be redirected for later use. Therefore, usage of standard
       input is required by this volume of POSIX.1‐2008.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _C_h_a_p_t_e_r _1_1, _G_e_n_e_r_a_l _T_e_r_m_i_n_a_l _I_n_t_e_r_f_a_c_e, _S_e_c_t_i_o_n _1_2_._2,
       _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, <<tteerrmmiiooss..hh>>

CCOOPPYYRRIIGGHHTT
       Portions of this text are reprinted and reproduced in electronic form
       from IEEE Std 1003.1, 2013 Edition, Standard for Information Technology
       -- Portable Operating System Interface (POSIX), The Open Group Base
       Specifications Issue 7, Copyright (C) 2013 by the Institute of
       Electrical and Electronics Engineers, Inc and The Open Group.  (This is
       POSIX.1-2008 with the 2013 Technical Corrigendum 1 applied.) In the
       event of any discrepancy between this version and the original IEEE and
       The Open Group Standard, the original IEEE and The Open Group Standard
       is the referee document. The original Standard can be obtained online
       at http://www.unix.org/online.html .

       Any typographical or formatting errors that appear in this page are
       most likely to have been introduced during the conversion of the source
       files to man page format. To report such errors, see
       https://www.kernel.org/doc/man-pages/reporting_bugs.html .



IEEE/The Open Group                  2013                             STTY(1P)
