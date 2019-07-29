ECHO(1P)                   POSIX Programmer's Manual                  ECHO(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       echo — write arguments to standard output

SSYYNNOOPPSSIISS
       echo [[_s_t_r_i_n_g...]]

DDEESSCCRRIIPPTTIIOONN
       The _e_c_h_o utility writes its arguments to standard output, followed by a
       <newline>.  If there are no arguments, only the <newline> is written.

OOPPTTIIOONNSS
       The _e_c_h_o utility shall not recognize the ""−−−−"" argument in the manner
       specified by Guideline 10 of the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s; ""−−−−"" shall be
       recognized as a string operand.

       Implementations shall not support any options.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _s_t_r_i_n_g    A string to be written to standard output. If the first
                 operand is −−nn, or if any of the operands contain a
                 <backslash> character, the results are implementation-
                 defined.

                 On XSI-conformant systems, if the first operand is −−nn, it
                 shall be treated as a string, not an option. The following
                 character sequences shall be recognized on XSI-conformant
                 systems within any of the arguments:

                 \a      Write an <alert>.

                 \b      Write a <backspace>.

                 \c      Suppress the <newline> that otherwise follows the
                         final argument in the output. All characters
                         following the ''\\cc'' in the arguments shall be ignored.

                 \f      Write a <form-feed>.

                 \n      Write a <newline>.

                 \r      Write a <carriage-return>.

                 \t      Write a <tab>.

                 \v      Write a <vertical-tab>.

                 \\      Write a <backslash> character.

                 \0_n_u_m   Write an 8-bit value that is the zero, one, two, or
                         three-digit octal number _n_u_m.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _e_c_h_o:

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
       The _e_c_h_o utility arguments shall be separated by single <space>
       characters and a <newline> character shall follow the last argument.
       Output transformations shall occur based on the escape sequences in the
       input. See the OPERANDS section.

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
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       It is not possible to use _e_c_h_o portably across all POSIX systems unless
       both −−nn (as the first argument) and escape sequences are omitted.

       The _p_r_i_n_t_f utility can be used portably to emulate any of the
       traditional behaviors of the _e_c_h_o utility as follows (assuming that _I_F_S
       has its standard value or is unset):

        *  The historic System V _e_c_h_o and the requirements on XSI
           implementations in this volume of POSIX.1‐2008 are equivalent to:


               pprriinnttff ""%%bb\\nn$$**""

        *  The BSD _e_c_h_o is equivalent to:


               iiff [[ ""XX$$11"" == ""XX−−nn"" ]]
               tthheenn
                   sshhiifftt
                   pprriinnttff ""%%ss$$**""
               eellssee
                   pprriinnttff ""%%ss\\nn$$**""
               ffii

       New applications are encouraged to use _p_r_i_n_t_f instead of _e_c_h_o.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The _e_c_h_o utility has not been made obsolescent because of its extremely
       widespread use in historical applications. Conforming applications that
       wish to do prompting without <newline> characters or that could
       possibly be expecting to echo a −−nn, should use the _p_r_i_n_t_f utility
       derived from the Ninth Edition system.

       As specified, _e_c_h_o writes its arguments in the simplest of ways. The
       two different historical versions of _e_c_h_o vary in fatally incompatible
       ways.

       The BSD _e_c_h_o checks the first argument for the string −−nn which causes
       it to suppress the <newline> that would otherwise follow the final
       argument in the output.

       The System V _e_c_h_o does not support any options, but allows escape
       sequences within its operands, as described for XSI implementations in
       the OPERANDS section.

       The _e_c_h_o utility does not support Utility Syntax Guideline 10 because
       historical applications depend on _e_c_h_o to echo _a_l_l of its arguments,
       except for the −−nn option in the BSD version.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _p_r_i_n_t_f

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                             ECHO(1P)
