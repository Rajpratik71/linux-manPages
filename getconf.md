GETCONF(1P)                POSIX Programmer's Manual               GETCONF(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       getconf — get configuration values

SSYYNNOOPPSSIISS
       getconf [[−v specification]] _s_y_s_t_e_m___v_a_r

       getconf [[−v specification]] _p_a_t_h___v_a_r _p_a_t_h_n_a_m_e

DDEESSCCRRIIPPTTIIOONN
       In the first synopsis form, the _g_e_t_c_o_n_f utility shall write to the
       standard output the value of the variable specified by the _s_y_s_t_e_m___v_a_r
       operand.

       In the second synopsis form, the _g_e_t_c_o_n_f utility shall write to the
       standard output the value of the variable specified by the _p_a_t_h___v_a_r
       operand for the path specified by the _p_a_t_h_n_a_m_e operand.

       The value of each configuration variable shall be determined as if it
       were obtained by calling the function from which it is defined to be
       available by this volume of POSIX.1‐2008 or by the System Interfaces
       volume of POSIX.1‐2008 (see the OPERANDS section). The value shall
       reflect conditions in the current operating environment.

OOPPTTIIOONNSS
       The _g_e_t_c_o_n_f utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−vv  _s_p_e_c_i_f_i_c_a_t_i_o_n
                 Indicate a specific specification and version for which
                 configuration variables shall be determined. If this option
                 is not specified, the values returned correspond to an
                 implementation default conforming compilation environment.

                 If the command:


                     ggeettccoonnff __PPOOSSIIXX__VV77__IILLPP3322__OOFFFF3322

                 does not write ""−−11\\nn"" or ""uunnddeeffiinneedd\\nn"" to standard output,
                 then commands of the form:


                     ggeettccoonnff −−vv PPOOSSIIXX__VV77__IILLPP3322__OOFFFF3322 ......

                 determine values for configuration variables corresponding to
                 the POSIX_V7_ILP32_OFF32 compilation environment specified in
                 _c_9_9, the EXTENDED DESCRIPTION.

                 If the command:


                     ggeettccoonnff __PPOOSSIIXX__VV77__IILLPP3322__OOFFFFBBIIGG

                 does not write ""−−11\\nn"" or ""uunnddeeffiinneedd\\nn"" to standard output,
                 then commands of the form:


                     ggeettccoonnff −−vv PPOOSSIIXX__VV77__IILLPP3322__OOFFFFBBIIGG ......

                 determine values for configuration variables corresponding to
                 the POSIX_V7_ILP32_OFFBIG compilation environment specified
                 in _c_9_9, the EXTENDED DESCRIPTION.

                 If the command:


                     ggeettccoonnff __PPOOSSIIXX__VV77__LLPP6644__OOFFFF6644

                 does not write ""−−11\\nn"" or ""uunnddeeffiinneedd\\nn"" to standard output,
                 then commands of the form:


                     ggeettccoonnff −−vv PPOOSSIIXX__VV77__LLPP6644__OOFFFF6644 ......

                 determine values for configuration variables corresponding to
                 the POSIX_V7_LP64_OFF64 compilation environment specified in
                 _c_9_9, the EXTENDED DESCRIPTION.

                 If the command:


                     ggeettccoonnff __PPOOSSIIXX__VV77__LLPPBBIIGG__OOFFFFBBIIGG

                 does not write ""−−11\\nn"" or ""uunnddeeffiinneedd\\nn"" to standard output,
                 then commands of the form:


                     ggeettccoonnff −−vv PPOOSSIIXX__VV77__LLPPBBIIGG__OOFFFFBBIIGG ......

                 determine values for configuration variables corresponding to
                 the POSIX_V7_LPBIG_OFFBIG compilation environment specified
                 in _c_9_9, the EXTENDED DESCRIPTION.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _p_a_t_h___v_a_r  A name of a configuration variable. All of the variables in
                 the Variable column of the table in the DESCRIPTION of the
                 _f_p_a_t_h_c_o_n_f() function defined in the System Interfaces volume
                 of POSIX.1‐2008, without the enclosing braces, shall be
                 supported. The implementation may add other local variables.

       _p_a_t_h_n_a_m_e  A pathname for which the variable specified by _p_a_t_h___v_a_r is to
                 be determined.

       _s_y_s_t_e_m___v_a_r
                 A name of a configuration variable. All of the following
                 variables shall be supported:

                  *  The names in the Variable column of the table in the
                     DESCRIPTION of the _s_y_s_c_o_n_f() function in the System
                     Interfaces volume of POSIX.1‐2008, except for the entries
                     corresponding to _SC_CLK_TCK, _SC_GETGR_R_SIZE_MAX, and
                     _SC_GETPW_R_SIZE_MAX, without the enclosing braces.

                     For compatibility with earlier versions, the following
                     variable names shall also be supported: POSIX2_C_BIND
                     POSIX2_C_DEV POSIX2_CHAR_TERM POSIX2_FORT_DEV
                     POSIX2_FORT_RUN POSIX2_LOCALEDEF POSIX2_SW_DEV POSIX2_UPE
                     POSIX2_VERSION

                     and shall be equivalent to the same name prefixed with an
                     <underscore>.  This requirement may be removed in a
                     future version.

                  *  The names of the symbolic constants used as the _n_a_m_e
                     argument of the _c_o_n_f_s_t_r() function in the System
                     Interfaces volume of POSIX.1‐2008, without the _CS_
                     prefix.

                  *  The names of the symbolic constants listed under the
                     headings ``Maximum Values'' and ``Minimum Values'' in the
                     description of the _<_l_i_m_i_t_s_._h_> header in the Base
                     Definitions volume of POSIX.1‐2008, without the enclosing
                     braces.

                     For compatibility with earlier versions, the following
                     variable names shall also be supported:
                     POSIX2_BC_BASE_MAX POSIX2_BC_DIM_MAX POSIX2_BC_SCALE_MAX
                     POSIX2_BC_STRING_MAX POSIX2_COLL_WEIGHTS_MAX
                     POSIX2_EXPR_NEST_MAX POSIX2_LINE_MAX POSIX2_RE_DUP_MAX

                     and shall be equivalent to the same name prefixed with an
                     <underscore>.  This requirement may be removed in a
                     future version.

                 The implementation may add other local values.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _g_e_t_c_o_n_f:

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
       If the specified variable is defined on the system and its value is
       described to be available from the _c_o_n_f_s_t_r() function defined in the
       System Interfaces volume of POSIX.1‐2008, its value shall be written in
       the following format:


           ""%%ss\\nn"",, <<_v_a_l_u_e>

       Otherwise, if the specified variable is defined on the system, its
       value shall be written in the following format:


           ""%%dd\\nn"",, <<_v_a_l_u_e>

       If the specified variable is valid, but is undefined on the system,
       _g_e_t_c_o_n_f shall write using the following format:


           ""uunnddeeffiinneedd\\nn""

       If the variable name is invalid or an error occurs, nothing shall be
       written to standard output.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The specified variable is valid and information about its current
             state was written successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       None.

EEXXAAMMPPLLEESS
       The following example illustrates the value of {NGROUPS_MAX}:


           ggeettccoonnff NNGGRROOUUPPSS__MMAAXX

       The following example illustrates the value of {NAME_MAX} for a
       specific directory:


           ggeettccoonnff NNAAMMEE__MMAAXX //uussrr

       The following example shows how to deal more carefully with results
       that might be unspecified:


           iiff vvaalluuee==$$((ggeettccoonnff PPAATTHH__MMAAXX //uussrr));; tthheenn
               iiff [[ ""$$vvaalluuee"" == ""uunnddeeffiinneedd"" ]];; tthheenn
                   eecchhoo PPAATTHH__MMAAXX iinn //uussrr iiss iinnddeetteerrmmiinnaattee..
               eellssee
                   eecchhoo PPAATTHH__MMAAXX iinn //uussrr iiss $$vvaalluuee..
               ffii
           eellssee
               eecchhoo EErrrroorr iinn ggeettccoonnff..
           ffii

RRAATTIIOONNAALLEE
       The original need for this utility, and for the _c_o_n_f_s_t_r() function, was
       to provide a way of finding the configuration-defined default value for
       the _P_A_T_H environment variable. Since _P_A_T_H can be modified by the user
       to include directories that could contain utilities replacing the
       standard utilities, shell scripts need a way to determine the system-
       supplied _P_A_T_H environment variable value that contains the correct
       search path for the standard utilities. It was later suggested that
       access to the other variables described in this volume of POSIX.1‐2008
       could also be useful to applications.

       This functionality of _g_e_t_c_o_n_f would not be adequately subsumed by
       another command such as:


           ggrreepp _v_a_r //eettcc//ccoonnff

       because such a strategy would provide correct values for neither those
       variables that can vary at runtime, nor those that can vary depending
       on the path.

       Early proposal versions of _g_e_t_c_o_n_f specified exit status 1 when the
       specified variable was valid, but not defined on the system. The output
       string ""uunnddeeffiinneedd"" is now used to specify this case with exit code 0
       because so many things depend on an exit code of zero when an invoked
       utility is successful.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_9_9

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, <<lliimmiittss..hh>>

       The System Interfaces volume of POSIX.1‐2008, _c_o_n_f_s_t_r(), _f_p_a_t_h_c_o_n_f(),
       _s_y_s_c_o_n_f(), _s_y_s_t_e_m()

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



IEEE/The Open Group                  2013                          GETCONF(1P)
