SPLIT(1P)                  POSIX Programmer's Manual                 SPLIT(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       split — split files into pieces

SSYYNNOOPPSSIISS
       split [[−l _l_i_n_e___c_o_u_n_t]] [[−a _s_u_f_f_i_x___l_e_n_g_t_h]] [[_f_i_l_e[[_n_a_m_e]]]]

       split −b _n[[k|m]] [[−a _s_u_f_f_i_x___l_e_n_g_t_h]] [[_f_i_l_e[[_n_a_m_e]]]]

DDEESSCCRRIIPPTTIIOONN
       The _s_p_l_i_t utility shall read an input file and write one or more output
       files.  The default size of each output file shall be 1000 lines. The
       size of the output files can be modified by specification of the −−bb or
       −−ll options. Each output file shall be created with a unique suffix. The
       suffix shall consist of exactly _s_u_f_f_i_x___l_e_n_g_t_h lowercase letters from
       the POSIX locale. The letters of the suffix shall be used as if they
       were a base-26 digit system, with the first suffix to be created
       consisting of all ''aa'' characters, the second with a ''bb'' replacing the
       last ''aa'', and so on, until a name of all ''zz'' characters is created. By
       default, the names of the output files shall be ''xx'', followed by a two-
       character suffix from the character set as described above, starting
       with ""aaaa"", ""aabb"", ""aacc"", and so on, and continuing until the suffix ""zzzz"",
       for a maximum of 676 files.

       If the number of files required exceeds the maximum allowed by the
       suffix length provided, such that the last allowable file would be
       larger than the requested size, the _s_p_l_i_t utility shall fail after
       creating the last file with a valid suffix; _s_p_l_i_t shall not delete the
       files it created with valid suffixes. If the file limit is not
       exceeded, the last file created shall contain the remainder of the
       input file, and may be smaller than the requested size.

OOPPTTIIOONNSS
       The _s_p_l_i_t utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−aa  _s_u_f_f_i_x___l_e_n_g_t_h
                 Use _s_u_f_f_i_x___l_e_n_g_t_h letters to form the suffix portion of the
                 filenames of the split file. If −−aa is not specified, the
                 default suffix length shall be two. If the sum of the _n_a_m_e
                 operand and the _s_u_f_f_i_x___l_e_n_g_t_h option-argument would create a
                 filename exceeding {NAME_MAX} bytes, an error shall result;
                 _s_p_l_i_t shall exit with a diagnostic message and no files shall
                 be created.

       −−bb  _n      Split a file into pieces _n bytes in size.

       −−bb  _nkk     Split a file into pieces _n*1024 bytes in size.

       −−bb  _nmm     Split a file into pieces _n*1048576 bytes in size.

       −−ll  _l_i_n_e___c_o_u_n_t
                 Specify the number of lines in each resulting file piece. The
                 _l_i_n_e___c_o_u_n_t argument is an unsigned decimal integer. The
                 default is 1000. If the input does not end with a <newline>,
                 the partial line shall be included in the last output file.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e      The pathname of the ordinary file to be split. If no input
                 file is given or _f_i_l_e is ''−−'', the standard input shall be
                 used.

       _n_a_m_e      The prefix to be used for each of the files resulting from
                 the split operation. If no _n_a_m_e argument is given, ''xx'' shall
                 be used as the prefix of the output files. The combined
                 length of the basename of _p_r_e_f_i_x and _s_u_f_f_i_x___l_e_n_g_t_h cannot
                 exceed {NAME_MAX} bytes. See the OPTIONS section.

SSTTDDIINN
       See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       Any file can be used as input.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _s_p_l_i_t:

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
       Not used.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       The output files contain portions of the original input file;
       otherwise, unchanged.

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
       In the following examples ffoooo is a text file that contains 5000 lines.

        1. Create five files, xxaaaa, xxaabb, xxaacc, xxaadd, and xxaaee:


               sspplliitt ffoooo

        2. Create five files, but the suffixed portion of the created files
           consists of three letters, xxaaaaaa, xxaaaabb, xxaaaacc, xxaaaadd, and xxaaaaee:


               sspplliitt −−aa 33 ffoooo

        3. Create three files with four-letter suffixes and a supplied prefix,
           bbaarr__aaaaaaaa, bbaarr__aaaaaabb, and bbaarr__aaaaaacc:


               sspplliitt −−aa 44 −−ll 22000000 ffoooo bbaarr__

        4. Create as many files as are necessary to contain at most 20*1024
           bytes, each with the default prefix of xx and a five-letter suffix:


               sspplliitt −−aa 55 −−bb 2200kk ffoooo

RRAATTIIOONNAALLEE
       The −−bb option was added to provide a mechanism for splitting files
       other than by lines. While most uses of the −−bb option are for
       transmitting files over networks, some believed it would have
       additional uses.

       The −−aa option was added to overcome the limitation of being able to
       create only 676 files.

       Consideration was given to deleting this utility, using the rationale
       that the functionality provided by this utility is available via the
       _c_s_p_l_i_t utility (see _c_s_p_l_i_t).  Upon reconsideration of the purpose of
       the User Portability Utilities option, it was decided to retain both
       this utility and the _c_s_p_l_i_t utility because users use both utilities
       and have historical expectations of their behavior. Furthermore, the
       splitting on byte boundaries in _s_p_l_i_t cannot be duplicated with the
       historical _c_s_p_l_i_t.

       The text ``_s_p_l_i_t shall not delete the files it created with valid
       suffixes'' would normally be assumed, but since the related utility,
       _c_s_p_l_i_t, does delete files under some circumstances, the historical
       behavior of _s_p_l_i_t is made explicit to avoid misinterpretation.

       Earlier versions of this standard allowed a −−_l_i_n_e___c_o_u_n_t option. This
       form is no longer specified by POSIX.1‐2008 but may be present in some
       implementations.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_s_p_l_i_t

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



IEEE/The Open Group                  2013                            SPLIT(1P)
