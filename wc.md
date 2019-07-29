WC(1P)                     POSIX Programmer's Manual                    WC(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       wc — word, line, and byte or character count

SSYYNNOOPPSSIISS
       wc [[−c|−m]] [[−lw]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _w_c utility shall read one or more input files and, by default,
       write the number of <newline> characters, words, and bytes contained in
       each input file to the standard output.

       The utility also shall write a total count for all named files, if more
       than one input file is specified.

       The _w_c utility shall consider a _w_o_r_d to be a non-zero-length string of
       characters delimited by white space.

OOPPTTIIOONNSS
       The _w_c utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−cc        Write to the standard output the number of bytes in each
                 input file.

       −−ll        Write to the standard output the number of <newline>
                 characters in each input file.

       −−mm        Write to the standard output the number of characters in each
                 input file.

       −−ww        Write to the standard output the number of words in each
                 input file.

       When any option is specified, _w_c shall report only the information
       requested by the specified options.

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
       The input files may be of any type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _w_c:

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
                 files) and which characters are defined as white-space
                 characters.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       By default, the standard output shall contain an entry for each input
       file of the form:


           ""%%dd %%dd %%dd %%ss\\nn"",, <<_n_e_w_l_i_n_e_s>, <_w_o_r_d_s>, <_b_y_t_e_s>, <_f_i_l_e>

       If the −−mm option is specified, the number of characters shall replace
       the <_b_y_t_e_s> field in this format.

       If any options are specified and the −−ll option is not specified, the
       number of <newline> characters shall not be written.

       If any options are specified and the −−ww option is not specified, the
       number of words shall not be written.

       If any options are specified and neither −−cc nor −−mm is specified, the
       number of bytes or characters shall not be written.

       If no input _f_i_l_e operands are specified, no name shall be written and
       no <blank> characters preceding the pathname shall be written.

       If more than one input _f_i_l_e operand is specified, an additional line
       shall be written, of the same format as the other lines, except that
       the word ttoottaall (in the POSIX locale) shall be written instead of a
       pathname and the total of each column shall be written as appropriate.
       Such an additional line, if any, is written at the end of the output.

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
       The −−mm option is not a switch, but an option at the same level as −−cc.
       Thus, to produce the full default output with character counts instead
       of bytes, the command required is:


           wwcc −−mmllww

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The output file format pseudo-_p_r_i_n_t_f() string differs from the System V
       version of _w_c:


           ""%%77dd%%77dd%%77dd %%ss\\nn""

       which produces possibly ambiguous and unparsable results for very large
       files, as it assumes no number shall exceed six digits.

       Some historical implementations use only <space>, <tab>, and <newline>
       as word separators. The equivalent of the ISO C standard _i_s_s_p_a_c_e()
       function is more appropriate.

       The −−cc option stands for ``character'' count, even though it counts
       bytes.  This stems from the sometimes erroneous historical view that
       bytes and characters are the same size. Due to international
       requirements, the −−mm option (reminiscent of ``multi-byte'') was added
       to obtain actual character counts.

       Early proposals only specified the results when input files were text
       files. The current specification more closely matches historical
       practice. (Bytes, words, and <newline> characters are counted
       separately and the results are written when an end-of-file is
       detected.)

       Historical implementations of the _w_c utility only accepted one argument
       to specify the options −−cc, −−ll, and −−ww.  Some of them also had multiple
       occurrences of an option cause the corresponding count to be written
       multiple times and had the order of specification of the options affect
       the order of the fields on output, but did not document either of
       these. Because common usage either specifies no options or only one
       option, and because none of this was documented, the changes required
       by this volume of POSIX.1‐2008 should not break many historical
       applications (and do not break any historical conforming applications).

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_k_s_u_m

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



IEEE/The Open Group                  2013                               WC(1P)
