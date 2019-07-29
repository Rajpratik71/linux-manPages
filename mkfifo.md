MKFIFO(1P)                 POSIX Programmer's Manual                MKFIFO(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       mkfifo — make FIFO special files

SSYYNNOOPPSSIISS
       mkfifo [[−m _m_o_d_e]] _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _m_k_f_i_f_o utility shall create the FIFO special files specified by the
       operands, in the order specified.

       For each _f_i_l_e operand, the _m_k_f_i_f_o utility shall perform actions
       equivalent to the _m_k_f_i_f_o() function defined in the System Interfaces
       volume of POSIX.1‐2008, called with the following arguments:

        1. The _f_i_l_e operand is used as the _p_a_t_h argument.

        2. The value of the bitwise-inclusive OR of S_IRUSR, S_IWUSR, S_IRGRP,
           S_IWGRP, S_IROTH, and S_IWOTH is used as the _m_o_d_e argument. (If the
           −−mm option is specified, the value of the _m_k_f_i_f_o() _m_o_d_e argument is
           unspecified, but the FIFO shall at no time have permissions less
           restrictive than the −−mm _m_o_d_e option-argument.)

OOPPTTIIOONNSS
       The _m_k_f_i_f_o utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−mm  _m_o_d_e   Set the file permission bits of the newly-created FIFO to the
                 specified _m_o_d_e value. The _m_o_d_e option-argument shall be the
                 same as the _m_o_d_e operand defined for the _c_h_m_o_d utility. In
                 the _s_y_m_b_o_l_i_c___m_o_d_e strings, the _o_p characters ''++'' and ''−−''
                 shall be interpreted relative to an assumed initial mode of
                 _a=_r_w.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of the FIFO special file to be created.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _m_k_f_i_f_o:

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
       Default.

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

        0    All the specified FIFO special files were created successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       None.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       This utility was added to permit shell applications to create FIFO
       special files.

       The −−mm option was added to control the file mode, for consistency with
       the similar functionality provided by the _m_k_d_i_r utility.

       Early proposals included a −−pp option similar to the _m_k_d_i_r −−pp option
       that created intermediate directories leading up to the FIFO specified
       by the final component. This was removed because it is not commonly
       needed and is not common practice with similar utilities.

       The functionality of _m_k_f_i_f_o is described substantially through a
       reference to the _m_k_f_i_f_o() function in the System Interfaces volume of
       POSIX.1‐2008. For example, by default, the mode of the FIFO file is
       affected by the file mode creation mask in accordance with the
       specified behavior of the _m_k_f_i_f_o() function. In this way, there is less
       duplication of effort required for describing details of the file
       creation.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_h_m_o_d, _u_m_a_s_k

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _m_k_f_i_f_o()

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



IEEE/The Open Group                  2013                           MKFIFO(1P)
