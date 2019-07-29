UUDECODE(1P)               POSIX Programmer's Manual              UUDECODE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       uudecode — decode a binary file

SSYYNNOOPPSSIISS
       uudecode [[−o _o_u_t_f_i_l_e]] [[_f_i_l_e]]

DDEESSCCRRIIPPTTIIOONN
       The _u_u_d_e_c_o_d_e utility shall read a file, or standard input if no file is
       specified, that includes data created by the _u_u_e_n_c_o_d_e utility. The
       _u_u_d_e_c_o_d_e utility shall scan the input file, searching for data
       compatible with one of the formats specified in _u_u_e_n_c_o_d_e, and attempt
       to create or overwrite the file described by the data (or overridden by
       the −−oo option). The pathname shall be contained in the data or
       specified by the −−oo option. The file access permission bits and
       contents for the file to be produced shall be contained in that data.
       The mode bits of the created file (other than standard output) shall be
       set from the file access permission bits contained in the data; that
       is, other attributes of the mode, including the file mode creation mask
       (see _u_m_a_s_k), shall not affect the file being produced. If either of the
       _o_p characters ''++'' and ''−−'' (see _c_h_m_o_d) are specified in symbolic mode,
       the initial mode on which those operations are based is unspecified.

       If the pathname of the file to be produced exists, and the user does
       not have write permission on that file, _u_u_d_e_c_o_d_e shall terminate with
       an error. If the pathname of the file to be produced exists, and the
       user has write permission on that file, the existing file shall be
       overwritten.

       If the input data was produced by _u_u_e_n_c_o_d_e on a system with a different
       number of bits per byte than on the target system, the results of
       _u_u_d_e_c_o_d_e are unspecified.

OOPPTTIIOONNSS
       The _u_u_d_e_c_o_d_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported by the implementation:

       −−oo  _o_u_t_f_i_l_e
                 A pathname of a file that shall be used instead of any
                 pathname contained in the input data. Specifying an _o_u_t_f_i_l_e
                 option-argument of //ddeevv//ssttddoouutt shall indicate standard
                 output.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      The pathname of a file containing the output of _u_u_e_n_c_o_d_e.

SSTTDDIINN
       See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be files containing the output of _u_u_e_n_c_o_d_e.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _u_u_d_e_c_o_d_e:

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
       If the file data header encoded by _u_u_e_n_c_o_d_e is −− or //ddeevv//ssttddoouutt, or the
       −−oo //ddeevv//ssttddoouutt option overrides the file data, the standard output
       shall be in the same format as the file originally encoded by _u_u_e_n_c_o_d_e.
       Otherwise, the standard output shall not be used.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       The output file shall be in the same format as the file originally
       encoded by _u_u_e_n_c_o_d_e.

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
       The user who is invoking _u_u_d_e_c_o_d_e must have write permission on any
       file being created.

       The output of _u_u_e_n_c_o_d_e is essentially an encoded bit stream that is not
       cognizant of byte boundaries. It is possible that a 9-bit byte target
       machine can process input from an 8-bit source, if it is aware of the
       requirement, but the reverse is unlikely to be satisfying. Of course,
       the only data that is meaningful for such a transfer between
       architectures is generally character data.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Input files are not necessarily text files, as stated by an early
       proposal. Although the _u_u_e_n_c_o_d_e output is a text file, that output
       could have been wrapped within another file or mail message that is not
       a text file.

       The −−oo option is not historical practice, but was added at the request
       of WG15 so that the user could override the target pathname without
       having to edit the input data itself.

       In early drafts, the [−−oo _o_u_t_f_i_l_e] option-argument allowed the use of −−
       to mean standard output. The symbol −− has only been used previously in
       POSIX.1‐2008 as a standard input indicator.  The standard developers
       did not wish to overload the meaning of −− in this manner. The
       //ddeevv//ssttddoouutt concept exists on most modern systems. The //ddeevv//ssttddoouutt
       syntax does not refer to a new special file. It is just a magic cookie
       to specify standard output.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_h_m_o_d, _u_m_a_s_k, _u_u_e_n_c_o_d_e

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



IEEE/The Open Group                  2013                         UUDECODE(1P)
