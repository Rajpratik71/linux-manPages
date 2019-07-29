CMP(1P)                    POSIX Programmer's Manual                   CMP(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       cmp — compare two files

SSYYNNOOPPSSIISS
       cmp [[−l|−s]] _f_i_l_e_1 _f_i_l_e_2

DDEESSCCRRIIPPTTIIOONN
       The _c_m_p utility shall compare two files. The _c_m_p utility shall write no
       output if the files are the same. Under default options, if they
       differ, it shall write to standard output the byte and line number at
       which the first difference occurred. Bytes and lines shall be numbered
       beginning with 1.

OOPPTTIIOONNSS
       The _c_m_p utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−ll        (Lowercase ell.) Write the byte number (decimal) and the
                 differing bytes (octal) for each difference.

       −−ss        Write nothing for differing files; return exit status only.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e_1     A pathname of the first file to be compared. If _f_i_l_e_1 is ''−−'',
                 the standard input shall be used.

       _f_i_l_e_2     A pathname of the second file to be compared. If _f_i_l_e_2 is
                 ''−−'', the standard input shall be used.

       If both _f_i_l_e_1 and _f_i_l_e_2 refer to standard input or refer to the same
       FIFO special, block special, or character special file, the results are
       undefined.

SSTTDDIINN
       The standard input shall be used only if the _f_i_l_e_1 or _f_i_l_e_2 operand
       refers to standard input. See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files can be any file type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _c_m_p:

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
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       In the POSIX locale, results of the comparison shall be written to
       standard output. When no options are used, the format shall be:


           ""%%ss %%ss ddiiffffeerr:: cchhaarr %%dd,, lliinnee %%dd\\nn"",, _f_i_l_e_1, _f_i_l_e_2,
               <_b_y_t_e _n_u_m_b_e_r>, <_l_i_n_e _n_u_m_b_e_r>

       When the −−ll option is used, the format shall be:


           ""%%dd %%oo %%oo\\nn"",, <<_b_y_t_e _n_u_m_b_e_r>, <_d_i_f_f_e_r_i_n_g _b_y_t_e>,
               <_d_i_f_f_e_r_i_n_g _b_y_t_e>

       for each byte that differs. The first <_d_i_f_f_e_r_i_n_g_ _b_y_t_e> number is from
       _f_i_l_e_1 while the second is from _f_i_l_e_2.  In both cases, <_b_y_t_e_ _n_u_m_b_e_r>
       shall be relative to the beginning of the file, beginning with 1.

       No output shall be written to standard output when the −−ss option is
       used.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages. If the
       −−ll option is used and _f_i_l_e_1 and _f_i_l_e_2 differ in length, or if the −−ss
       option is not used and _f_i_l_e_1 and _f_i_l_e_2 are identical for the entire
       length of the shorter file, in the POSIX locale the following
       diagnostic message shall be written:


           ""ccmmpp:: EEOOFF oonn %%ss%%ss\\nn"",, <<_n_a_m_e _o_f _s_h_o_r_t_e_r _f_i_l_e>, <_a_d_d_i_t_i_o_n_a_l _i_n_f_o>

       The <_a_d_d_i_t_i_o_n_a_l_ _i_n_f_o> field shall either be null or a string that
       starts with a <blank> and contains no <newline> characters. Some
       implementations report on the number of lines in this case.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The files are identical.

        1    The files are different; this includes the case where one file is
             identical to the first part of the other.

       >1    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Although input files to _c_m_p can be any type, the results might not be
       what would be expected on character special device files or on file
       types not described by the System Interfaces volume of POSIX.1‐2008.
       Since this volume of POSIX.1‐2008 does not specify the block size used
       when doing input, comparisons of character special files need not
       compare all of the data in those files.

       For files which are not text files, line numbers simply reflect the
       presence of a <newline>, without any implication that the file is
       organized into lines.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The global language in _S_e_c_t_i_o_n _1_._4, _U_t_i_l_i_t_y _D_e_s_c_r_i_p_t_i_o_n _D_e_f_a_u_l_t_s
       indicates that using two mutually-exclusive options together produces
       unspecified results. Some System V implementations consider the option
       usage:


           ccmmpp −−ll −−ss ......

       to be an error. They also treat:


           ccmmpp −−ss −−ll ......

       as if no options were specified. Both of these behaviors are considered
       bugs, but are allowed.

       The word cchhaarr in the standard output format comes from historical
       usage, even though it is actually a byte number. When _c_m_p is supported
       in other locales, implementations are encouraged to use the word _b_y_t_e
       or its equivalent in another language. Users should not interpret this
       difference to indicate that the functionality of the utility changed
       between locales.

       Some implementations report on the number of lines in the identical-
       but-shorter file case. This is allowed by the inclusion of the
       <_a_d_d_i_t_i_o_n_a_l_ _i_n_f_o> fields in the output format. The restriction on
       having a leading <blank> and no <newline> characters is to make parsing
       for the filename easier. It is recognized that some filenames
       containing white-space characters make parsing difficult anyway, but
       the restriction does aid programs used on systems where the names are
       predominantly well behaved.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_o_m_m, _d_i_f_f

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



IEEE/The Open Group                  2013                              CMP(1P)
