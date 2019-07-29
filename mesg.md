MESG(1P)                   POSIX Programmer's Manual                  MESG(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       mesg — permit or deny messages

SSYYNNOOPPSSIISS
       mesg [[y|n]]

DDEESSCCRRIIPPTTIIOONN
       The _m_e_s_g utility shall control whether other users are allowed to send
       messages via _w_r_i_t_e, _t_a_l_k, or other utilities to a terminal device. The
       terminal device affected shall be determined by searching for the first
       terminal in the sequence of devices associated with standard input,
       standard output, and standard error, respectively. With no arguments,
       _m_e_s_g shall report the current state without changing it. Processes with
       appropriate privileges may be able to send messages to the terminal
       independent of the current state.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operands shall be supported in the POSIX locale:

       _y         Grant permission to other users to send messages to the
                 terminal device.

       _n         Deny permission to other users to send messages to the
                 terminal device.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _m_e_s_g:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written (by _m_e_s_g) to
                 standard error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       If no operand is specified, _m_e_s_g shall display the current terminal
       state in an unspecified format.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Receiving messages is allowed.

        1    Receiving messages is not allowed.

       >1    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The mechanism by which the message status of the terminal is changed is
       unspecified. Therefore, unspecified actions may cause the status of the
       terminal to change after _m_e_s_g has successfully completed. These actions
       may include, but are not limited to: another invocation of the _m_e_s_g
       utility, login procedures; invocation of the _s_t_t_y utility, invocation
       of the _c_h_m_o_d utility or _c_h_m_o_d() function, and so on.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The terminal changed by _m_e_s_g is that associated with the standard
       input, output, or error, rather than the controlling terminal for the
       session. This is because users logged in more than once should be able
       to change any of their login terminals without having to stop the job
       running in those sessions.  This is not a security problem involving
       the terminals of other users because appropriate privileges would be
       required to affect the terminal of another user.

       The method of checking each of the first three file descriptors in
       sequence until a terminal is found was adopted from System V.

       The file //ddeevv//ttttyy is not specified for the terminal device because it
       was thought to be too restrictive. Typical environment changes for the
       _n operand are that write permissions are removed for _o_t_h_e_r_s and _g_r_o_u_p
       from the appropriate device. It was decided to leave the actual
       description of what is done as unspecified because of potential
       differences between implementations.

       The format for standard output is unspecified because of differences
       between historical implementations. This output is generally not useful
       to shell scripts (they can use the exit status), so exact parsing of
       the output is unnecessary.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _t_a_l_k, _w_r_i_t_e

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s

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



IEEE/The Open Group                  2013                             MESG(1P)
