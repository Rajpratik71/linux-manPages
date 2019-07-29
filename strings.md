STRINGS(1P)                POSIX Programmer's Manual               STRINGS(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       strings — find printable strings in files

SSYYNNOOPPSSIISS
       strings [[−a]] [[−t _f_o_r_m_a_t]] [[−n _n_u_m_b_e_r]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _s_t_r_i_n_g_s utility shall look for printable strings in regular files
       and shall write those strings to standard output. A printable string is
       any sequence of four (by default) or more printable characters
       terminated by a <newline> or NUL character. Additional implementation-
       defined strings may be written; see _l_o_c_a_l_e_d_e_f.

       If the first argument is ''−−'', the results are unspecified.

OOPPTTIIOONNSS
       The _s_t_r_i_n_g_s utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except for the
       unspecified usage of ''−−''.

       The following options shall be supported:

       −−aa        Scan files in their entirety. If −−aa is not specified, it is
                 implementation-defined what portion of each file is scanned
                 for strings.

       −−nn  _n_u_m_b_e_r Specify the minimum string length, where the _n_u_m_b_e_r argument
                 is a positive decimal integer. The default shall be 4.

       −−tt  _f_o_r_m_a_t Write each string preceded by its byte offset from the start
                 of the file. The format shall be dependent on the single
                 character used as the _f_o_r_m_a_t option-argument:

                 d     The offset shall be written in decimal.

                 o     The offset shall be written in octal.

                 x     The offset shall be written in hexadecimal.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a regular file to be used as input. If no _f_i_l_e
                 operand is specified, the _s_t_r_i_n_g_s utility shall read from the
                 standard input.

SSTTDDIINN
       See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files named by the utility arguments or the standard input
       shall be regular files of any format.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _s_t_r_i_n_g_s:

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
                 files) and to identify printable strings.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Strings found shall be written to the standard output, one per line.

       When the −−tt option is not specified, the format of the output shall be:


           ""%%ss"",, <<_s_t_r_i_n_g>

       With the −−tt  oo option, the format of the output shall be:


           ""%%oo %%ss"",, <<_b_y_t_e _o_f_f_s_e_t>, <_s_t_r_i_n_g>

       With the −−tt  xx option, the format of the output shall be:


           ""%%xx %%ss"",, <<_b_y_t_e _o_f_f_s_e_t>, <_s_t_r_i_n_g>

       With the −−tt  dd option, the format of the output shall be:


           ""%%dd %%ss"",, <<_b_y_t_e _o_f_f_s_e_t>, <_s_t_r_i_n_g>

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
       By default the data area (as opposed to the text, ``bss'', or header
       areas) of a binary executable file is scanned. Implementations document
       which areas are scanned.

       Some historical implementations do not require NUL or <newline>
       terminators for strings to permit those languages that do not use NUL
       as a string terminator to have their strings written.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Apart from rationalizing the option syntax and slight difficulties with
       object and executable binary files, _s_t_r_i_n_g_s is specified to match
       historical practice closely. The −−aa and −−nn options were introduced to
       replace the non-conforming −− and −−_n_u_m_b_e_r options. These options are no
       longer specified by POSIX.1‐2008 but may be present in some
       implementations.

       The −−oo option historically means different things on different
       implementations. Some use it to mean ``_o_f_f_s_e_t in decimal'', while
       others use it as ``_o_f_f_s_e_t in octal''. Instead of trying to decide which
       way would be least objectionable, the −−tt option was added. It was
       originally named −−OO to mean ``offset'', but was changed to −−tt to be
       consistent with _o_d.

       The ISO C standard function _i_s_p_r_i_n_t() is restricted to a domain of
       uunnssiiggnneedd cchhaarr.  This volume of POSIX.1‐2008 requires implementations to
       write strings as defined by the current locale.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _l_o_c_a_l_e_d_e_f, _n_m

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



IEEE/The Open Group                  2013                          STRINGS(1P)
