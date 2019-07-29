HEAD(1P)                   POSIX Programmer's Manual                  HEAD(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       head — copy the first part of files

SSYYNNOOPPSSIISS
       head [[−n _n_u_m_b_e_r]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _h_e_a_d utility shall copy its input files to the standard output,
       ending the output for each file at a designated point.

       Copying shall end at the point in each input file indicated by the −−nn
       _n_u_m_b_e_r option. The option-argument _n_u_m_b_e_r shall be counted in units of
       lines.

OOPPTTIIOONNSS
       The _h_e_a_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−nn  _n_u_m_b_e_r The first _n_u_m_b_e_r lines of each input file shall be copied to
                 standard output. The application shall ensure that the _n_u_m_b_e_r
                 option-argument is a positive decimal integer.

       When a file contains less than _n_u_m_b_e_r lines, it shall be copied to
       standard output in its entirety. This shall not be an error.

       If no options are specified, _h_e_a_d shall act as if −−nn 1100 had been
       specified.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of an input file. If no _f_i_l_e operands are
                 specified, the standard input shall be used.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operands are specified, and
       shall be used if a _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       Input files shall be text files, but the line length is not restricted
       to {LINE_MAX} bytes.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _h_e_a_d:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The standard output shall contain designated portions of the input
       files.

       If multiple _f_i_l_e operands are specified, _h_e_a_d shall precede the output
       for each with the header:


           ""\\nn====>> %%ss <<====\\nn"",, <<_p_a_t_h_n_a_m_e>

       except that the first header written shall not include the initial
       <newline>.

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
       None.

EEXXAAMMPPLLEESS
       To write the first ten lines of all files (except those with a leading
       period) in the directory:


           hheeaadd −−−− **

RRAATTIIOONNAALLEE
       Although it is possible to simulate _h_e_a_d with _s_e_d 10q for a single
       file, the standard developers decided that the popularity of _h_e_a_d on
       historical BSD systems warranted its inclusion alongside _t_a_i_l.

       POSIX.1‐2008 version of _h_e_a_d follows the Utility Syntax Guidelines. The
       −−nn option was added to this new interface so that _h_e_a_d and _t_a_i_l would
       be more logically related. Earlier versions of this standard allowed a
       −−nnuummbbeerr option. This form is no longer specified by POSIX.1‐2008 but
       may be present in some implementations.

       There is no −−cc option (as there is in _t_a_i_l) because it is not
       historical practice and because other utilities in this volume of
       POSIX.1‐2008 provide similar functionality.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _s_e_d, _t_a_i_l

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



IEEE/The Open Group                  2013                             HEAD(1P)
