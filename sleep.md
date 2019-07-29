SLEEP(1P)                  POSIX Programmer's Manual                 SLEEP(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       sleep — suspend execution for an interval

SSYYNNOOPPSSIISS
       sleep _t_i_m_e

DDEESSCCRRIIPPTTIIOONN
       The _s_l_e_e_p utility shall suspend execution for at least the integral
       number of seconds specified by the _t_i_m_e operand.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _t_i_m_e      A non-negative decimal integer specifying the number of
                 seconds for which to suspend execution.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _s_l_e_e_p:

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
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       If the _s_l_e_e_p utility receives a SIGALRM signal, one of the following
       actions shall be taken:

        1. Terminate normally with a zero exit status.

        2. Effectively ignore the signal.

        3. Provide the default behavior for signals described in the
           ASYNCHRONOUS EVENTS section of _S_e_c_t_i_o_n _1_._4, _U_t_i_l_i_t_y _D_e_s_c_r_i_p_t_i_o_n
           _D_e_f_a_u_l_t_s.  This could include terminating with a non-zero exit
           status.

       The _s_l_e_e_p utility shall take the standard action for all other signals.

SSTTDDOOUUTT
       Not used.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The execution was successfully suspended for at least _t_i_m_e
             seconds, or a SIGALRM signal was received. See the ASYNCHRONOUS
             EVENTS section.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       None.

EEXXAAMMPPLLEESS
       The _s_l_e_e_p utility can be used to execute a command after a certain
       amount of time, as in:


           ((sslleeeepp 110055;; _c_o_m_m_a_n_d)) &&

       or to execute a command every so often, as in:


           wwhhiillee ttrruuee
           ddoo
               _c_o_m_m_a_n_d
               sslleeeepp 3377
           ddoonnee

RRAATTIIOONNAALLEE
       The exit status is allowed to be zero when _s_l_e_e_p is interrupted by the
       SIGALRM signal because most implementations of this utility rely on the
       arrival of that signal to notify them that the requested finishing time
       has been successfully attained. Such implementations thus do not
       distinguish this situation from the successful completion case. Other
       implementations are allowed to catch the signal and go back to sleep
       until the requested time expires or to provide the normal signal
       termination procedures.

       As with all other utilities that take integral operands and do not
       specify subranges of allowed values, _s_l_e_e_p is required by this volume
       of POSIX.1‐2008 to deal with _t_i_m_e requests of up to 2147483647 seconds.
       This may mean that some implementations have to make multiple calls to
       the delay mechanism of the underlying operating system if its argument
       range is less than this.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _w_a_i_t

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s

       The System Interfaces volume of POSIX.1‐2008, _a_l_a_r_m(), _s_l_e_e_p()

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



IEEE/The Open Group                  2013                            SLEEP(1P)
