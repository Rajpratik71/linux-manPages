TEE(1P)                    POSIX Programmer's Manual                   TEE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       tee — duplicate standard input

SSYYNNOOPPSSIISS
       tee [[−ai]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _t_e_e utility shall copy standard input to standard output, making a
       copy in zero or more files. The _t_e_e utility shall not buffer output.

       If the −−aa option is not specified, output files shall be written (see
       _S_e_c_t_i_o_n _1_._1_._1_._4, _F_i_l_e _R_e_a_d, _W_r_i_t_e, _a_n_d _C_r_e_a_t_i_o_n.

OOPPTTIIOONNSS
       The _t_e_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−aa        Append the output to the files.

       −−ii        Ignore the SIGINT signal.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e      A pathname of an output file. If a _f_i_l_e operand is ''−−'', it
                 shall refer to a file named −−; implementations shall not
                 treat it as meaning standard output.  Processing of at least
                 13 _f_i_l_e operands shall be supported.

SSTTDDIINN
       The standard input can be of any type.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _t_e_e:

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
       Default, except that if the −−ii option was specified, SIGINT shall be
       ignored.

SSTTDDOOUUTT
       The standard output shall be a copy of the standard input.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       If any _f_i_l_e operands are specified, the standard input shall be copied
       to each named file.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The standard input was successfully copied to all output files.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If a write to any successfully opened _f_i_l_e operand fails, writes to
       other successfully opened _f_i_l_e operands and standard output shall
       continue, but the exit status shall be non-zero. Otherwise, the default
       actions specified in _S_e_c_t_i_o_n _1_._4, _U_t_i_l_i_t_y _D_e_s_c_r_i_p_t_i_o_n _D_e_f_a_u_l_t_s apply.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The _t_e_e utility is usually used in a pipeline, to make a copy of the
       output of some utility.

       The _f_i_l_e operand is technically optional, but _t_e_e is no more useful
       than _c_a_t when none is specified.

EEXXAAMMPPLLEESS
       Save an unsorted intermediate form of the data in a pipeline:


           ...... || tteeee uunnssoorrtteedd || ssoorrtt >> ssoorrtteedd

RRAATTIIOONNAALLEE
       The buffering requirement means that _t_e_e is not allowed to use ISO C
       standard fully buffered or line-buffered writes. It does not mean that
       _t_e_e has to do 1-byte reads followed by 1-byte writes.

       It should be noted that early versions of BSD ignore any invalid
       options and accept a single ''−−'' as an alternative to −−ii.  They also
       print a message if unable to open a file:


           ""tteeee:: ccaannnnoott aacccceessss %%ss\\nn"",, <<_p_a_t_h_n_a_m_e>>

       Historical implementations ignore write errors. This is explicitly not
       permitted by this volume of POSIX.1‐2008.

       Some historical implementations use O_APPEND when providing append
       mode; others use the _l_s_e_e_k() function to seek to the end-of-file after
       opening the file without O_APPEND. This volume of POSIX.1‐2008 requires
       functionality equivalent to using O_APPEND; see _S_e_c_t_i_o_n _1_._1_._1_._4, _F_i_l_e
       _R_e_a_d, _W_r_i_t_e, _a_n_d _C_r_e_a_t_i_o_n.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _1, _I_n_t_r_o_d_u_c_t_i_o_n, _c_a_t

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _l_s_e_e_k()

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



IEEE/The Open Group                  2013                              TEE(1P)
