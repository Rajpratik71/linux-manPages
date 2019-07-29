PASTE(1P)                  POSIX Programmer's Manual                 PASTE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       paste — merge corresponding or subsequent lines of files

SSYYNNOOPPSSIISS
       paste [[−s]] [[−d _l_i_s_t]] _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _p_a_s_t_e utility shall concatenate the corresponding lines of the
       given input files, and write the resulting lines to standard output.

       The default operation of _p_a_s_t_e shall concatenate the corresponding
       lines of the input files. The <newline> of every line except the line
       from the last input file shall be replaced with a <tab>.

       If an end-of-file condition is detected on one or more input files, but
       not all input files, _p_a_s_t_e shall behave as though empty lines were read
       from the files on which end-of-file was detected, unless the −−ss option
       is specified.

OOPPTTIIOONNSS
       The _p_a_s_t_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−dd  _l_i_s_t   Unless a <backslash> character appears in _l_i_s_t, each
                 character in _l_i_s_t is an element specifying a delimiter
                 character. If a <backslash> character appears in _l_i_s_t, the
                 <backslash> character and one or more characters following it
                 are an element specifying a delimiter character as described
                 below. These elements specify one or more delimiters to use,
                 instead of the default <tab>, to replace the <newline> of the
                 input lines. The elements in _l_i_s_t shall be used circularly;
                 that is, when the list is exhausted the first element from
                 the list is reused. When the −−ss option is specified:

                  *  The last <newline> in a file shall not be modified.

                  *  The delimiter shall be reset to the first element of _l_i_s_t
                     after each _f_i_l_e operand is processed.

                 When the −−ss option is not specified:

                  *  The <newline> characters in the file specified by the
                     last _f_i_l_e operand shall not be modified.

                  *  The delimiter shall be reset to the first element of list
                     each time a line is processed from each file.

                 If a <backslash> character appears in _l_i_s_t, it and the
                 character following it shall be used to represent the
                 following delimiter characters:

                 \n    <newline>.

                 \t    <tab>.

                 \\    <backslash> character.

                 \0    Empty string (not a null character). If ''\\00'' is
                       immediately followed by the character ''xx'', the
                       character ''XX'', or any character defined by the _L_C___C_T_Y_P_E
                       ddiiggiitt keyword (see the Base Definitions volume of
                       POSIX.1‐2008, _C_h_a_p_t_e_r _7, _L_o_c_a_l_e), the results are
                       unspecified.

                 If any other characters follow the <backslash>, the results
                 are unspecified.

       −−ss        Concatenate all of the lines of each separate input file in
                 command line order. The <newline> of every line except the
                 last line in each input file shall be replaced with the
                 <tab>, unless otherwise specified by the −−dd option.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of an input file. If ''−−'' is specified for one or
                 more of the _f_i_l_es, the standard input shall be used; the
                 standard input shall be read one line at a time, circularly,
                 for each instance of ''−−''.  Implementations shall support
                 pasting of at least 12 _f_i_l_e operands.

SSTTDDIINN
       The standard input shall be used only if one or more _f_i_l_e operands is
       ''−−''.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be text files, except that line lengths shall be
       unlimited.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _p_a_s_t_e:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s the precedence of internationalization variables
                 used to determine the values of locale categories.)

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
       Concatenated lines of input files shall be separated by the <tab> (or
       other characters under the control of the −−dd option) and terminated by
       a <newline>.

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
       If one or more input files cannot be opened when the −−ss option is not
       specified, a diagnostic message shall be written to standard error, but
       no output is written to standard output. If the −−ss option is specified,
       the _p_a_s_t_e utility shall provide the default behavior described in
       _S_e_c_t_i_o_n _1_._4, _U_t_i_l_i_t_y _D_e_s_c_r_i_p_t_i_o_n _D_e_f_a_u_l_t_s.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       When the escape sequences of the _l_i_s_t option-argument are used in a
       shell script, they must be quoted; otherwise, the shell treats the
       <backslash> as a special character.

       Conforming applications should only use the specific
       <backslash>-escaped delimiters presented in this volume of
       POSIX.1‐2008. Historical implementations treat ''\\xx'', where ''xx'' is not
       in this list, as ''xx'', but future implementations are free to expand
       this list to recognize other common escapes similar to those accepted
       by _p_r_i_n_t_f and other standard utilities.

       Most of the standard utilities work on text files. The _c_u_t utility can
       be used to turn files with arbitrary line lengths into a set of text
       files containing the same data. The _p_a_s_t_e utility can be used to create
       (or recreate) files with arbitrary line lengths. For example, if _f_i_l_e
       contains long lines:


           ccuutt −−bb 11−−550000 −−nn ffiillee >> ffiillee11
           ccuutt −−bb 550011−− −−nn ffiillee >> ffiillee22

       creates ffiillee11 (a text file) with lines no longer than 500 bytes (plus
       the <newline>) and ffiillee22 that contains the remainder of the data from
       _f_i_l_e.  Note that ffiillee22 is not a text file if there are lines in _f_i_l_e
       that are longer than 500 + {LINE_MAX} bytes. The original file can be
       recreated from ffiillee11 and ffiillee22 using the command:


           ppaassttee −−dd ""\\00"" ffiillee11 ffiillee22 >> ffiillee

       The commands:


           ppaassttee −−dd ""\\00"" ......
           ppaassttee −−dd """" ......

       are not necessarily equivalent; the latter is not specified by this
       volume of POSIX.1‐2008 and may result in an error. The construct ''\\00''
       is used to mean ``no separator'' because historical versions of _p_a_s_t_e
       did not follow the syntax guidelines, and the command:


           ppaassttee −−dd"""" ......

       could not be handled properly by _g_e_t_o_p_t().

EEXXAAMMPPLLEESS
        1. Write out a directory in four columns:


               llss || ppaassttee −− −− −− −−

        2. Combine pairs of lines from a file into single lines:


               ppaassttee −−ss −−dd ""\\tt\\nn"" ffiillee

RRAATTIIOONNAALLEE
       None.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _1_._4, _U_t_i_l_i_t_y _D_e_s_c_r_i_p_t_i_o_n _D_e_f_a_u_l_t_s, _c_u_t, _g_r_e_p, _p_r

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _7, _L_o_c_a_l_e, _C_h_a_p_t_e_r
       _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                            PASTE(1P)
