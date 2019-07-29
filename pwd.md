PWD(1P)                    POSIX Programmer's Manual                   PWD(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       pwd — return working directory name

SSYYNNOOPPSSIISS
       pwd [[−L|−P]]

DDEESSCCRRIIPPTTIIOONN
       The _p_w_d utility shall write to standard output an absolute pathname of
       the current working directory, which does not contain the filenames dot
       or dot-dot.

OOPPTTIIOONNSS
       The _p_w_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported by the implementation:

       −−LL        If the _P_W_D environment variable contains an absolute pathname
                 of the current directory that does not contain the filenames
                 dot or dot-dot, _p_w_d shall write this pathname to standard
                 output. Otherwise, if the _P_W_D environment variable contains a
                 pathname of the current directory that is longer than
                 {PATH_MAX} bytes including the terminating null, and the
                 pathname does not contain any components that are dot or dot-
                 dot, it is unspecified whether _p_w_d writes this pathname to
                 standard output or behaves as if the −−PP option had been
                 specified. Otherwise, the −−LL option shall behave as the −−PP
                 option.

       −−PP        The pathname written to standard output shall not contain any
                 components that refer to files of type symbolic link. If
                 there are multiple pathnames that the _p_w_d utility could write
                 to standard output, one beginning with a single <slash>
                 character and one or more beginning with two <slash>
                 characters, then it shall write the pathname beginning with a
                 single <slash> character. The pathname shall not contain any
                 unnecessary <slash> characters after the leading one or two
                 <slash> characters.

       If both −−LL and −−PP are specified, the last one shall apply. If neither
       −−LL nor −−PP is specified, the _p_w_d utility shall behave as if −−LL had been
       specified.

OOPPEERRAANNDDSS
       None.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _p_w_d:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s the precedence of internationalization variables
                 used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _P_W_D       An absolute pathname of the current working directory. If an
                 application sets or unsets the value of _P_W_D, the behavior of
                 _p_w_d is unspecified.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The _p_w_d utility output is an absolute pathname of the current working
       directory:


           ""%%ss\\nn"",, <<_d_i_r_e_c_t_o_r_y _p_a_t_h_n_a_m_e>

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If an error is detected, output shall not be written to standard
       output, a diagnostic message shall be written to standard error, and
       the exit status is not zero.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       If the pathname obtained from _p_w_d is longer than {PATH_MAX} bytes, it
       could produce an error if passed to _c_d.  Therefore, in order to return
       to that directory it may be necessary to break the pathname into
       sections shorter than {PATH_MAX} and call _c_d on each section in turn
       (the first section being an absolute pathname and subsequent sections
       being relative pathnames).

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Some implementations have historically provided _p_w_d as a shell special
       built-in command.

       In most utilities, if an error occurs, partial output may be written to
       standard output. This does not happen in historical implementations of
       _p_w_d.  Because _p_w_d is frequently used in historical shell scripts
       without checking the exit status, it is important that the historical
       behavior is required here; therefore, the CONSEQUENCES OF ERRORS
       section specifically disallows any partial output being written to
       standard output.

       An earlier version of this standard stated that the _P_W_D environment
       variable was affected when the −−PP option was in effect. This was
       incorrect; conforming implementations do not do this.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_d

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _g_e_t_c_w_d()

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



IEEE/The Open Group                  2013                              PWD(1P)
