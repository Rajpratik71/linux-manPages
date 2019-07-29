CSPLIT(1P)                 POSIX Programmer's Manual                CSPLIT(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       csplit — split files based on context

SSYYNNOOPPSSIISS
       csplit [[−ks]] [[−f _p_r_e_f_i_x]] [[−n _n_u_m_b_e_r]] _f_i_l_e _a_r_g...

DDEESSCCRRIIPPTTIIOONN
       The _c_s_p_l_i_t utility shall read the file named by the _f_i_l_e operand, write
       all or part of that file into other files as directed by the _a_r_g
       operands, and write the sizes of the files.

OOPPTTIIOONNSS
       The _c_s_p_l_i_t utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−ff  _p_r_e_f_i_x Name the created files _p_r_e_f_i_x0000, _p_r_e_f_i_x0011, ..., _p_r_e_f_i_x_n.  The
                 default is xxxx0000 ...  xxxx_n.  If the _p_r_e_f_i_x argument would
                 create a filename exceeding {NAME_MAX} bytes, an error shall
                 result, _c_s_p_l_i_t shall exit with a diagnostic message, and no
                 files shall be created.

       −−kk        Leave previously created files intact. By default, _c_s_p_l_i_t
                 shall remove created files if an error occurs.

       −−nn  _n_u_m_b_e_r Use _n_u_m_b_e_r decimal digits to form filenames for the file
                 pieces. The default shall be 2.

       −−ss        Suppress the output of file size messages.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e      The pathname of a text file to be split. If _f_i_l_e is ''−−'', the
                 standard input shall be used.

       Each _a_r_g operand can be one of the following:

       /_r_e_x_p/[[_o_f_f_s_e_t]]
                 A file shall be created using the content of the lines from
                 the current line up to, but not including, the line that
                 results from the evaluation of the regular expression with
                 _o_f_f_s_e_t, if any, applied. The regular expression _r_e_x_p shall
                 follow the rules for basic regular expressions described in
                 the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._3,
                 _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s.  The application shall use the
                 sequence ""\\//"" to specify a <slash> character within the _r_e_x_p.
                 The optional offset shall be a positive or negative integer
                 value representing a number of lines. A positive integer
                 value can be preceded by ''++''.  If the selection of lines from
                 an _o_f_f_s_e_t expression of this type would create a file with
                 zero lines, or one with greater than the number of lines left
                 in the input file, the results are unspecified. After the
                 section is created, the current line shall be set to the line
                 that results from the evaluation of the regular expression
                 with any offset applied. If the current line is the first
                 line in the file and a regular expression operation has not
                 yet been performed, the pattern match of _r_e_x_p shall be
                 applied from the current line to the end of the file.
                 Otherwise, the pattern match of _r_e_x_p shall be applied from
                 the line following the current line to the end of the file.

       %_r_e_x_p%[[_o_f_f_s_e_t]]
                 Equivalent to /_r_e_x_p/[[_o_f_f_s_e_t]], except that no file shall be
                 created for the selected section of the input file. The
                 application shall use the sequence ""\\%%"" to specify a
                 <percent-sign> character within the _r_e_x_p.

       _l_i_n_e___n_o   Create a file from the current line up to (but not including)
                 the line number _l_i_n_e___n_o.  Lines in the file shall be numbered
                 starting at one. The current line becomes _l_i_n_e___n_o.

       {_n_u_m}     Repeat operand. This operand can follow any of the operands
                 described previously. If it follows a _r_e_x_p type operand, that
                 operand shall be applied _n_u_m more times. If it follows a
                 _l_i_n_e___n_o operand, the file shall be split every _l_i_n_e___n_o lines,
                 _n_u_m times, from that point.

       An error shall be reported if an operand does not reference a line
       between the current position and the end of the file.

SSTTDDIINN
       See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input file shall be a text file.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _c_s_p_l_i_t:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for the behavior of ranges, equivalence
                 classes, and multi-character collating elements within
                 regular expressions.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files) and the behavior of character classes within regular
                 expressions.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       If the −−kk option is specified, created files shall be retained.
       Otherwise, the default action occurs.

SSTTDDOOUUTT
       Unless the −−ss option is used, the standard output shall consist of one
       line per file created, with a format as follows:


           ""%%dd\\nn"",, <<_f_i_l_e _s_i_z_e _i_n _b_y_t_e_s>

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       The output files shall contain portions of the original input file;
       otherwise, unchanged.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       By default, created files shall be removed if an error occurs. When the
       −−kk option is specified, created files shall not be removed if an error
       occurs.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       None.

EEXXAAMMPPLLEESS
        1. This example creates four files, ccoobbooll0000 ...  ccoobbooll0033:


               ccsspplliitt −−ff ccoobbooll ffiillee ''//pprroocceedduurree ddiivviissiioonn//'' //ppaarr55..// //ppaarr1166..//

           After editing the split files, they can be recombined as follows:


               ccaatt ccoobbooll00[[00−−33]] >> ffiillee

           Note that this example overwrites the original file.

        2. This example would split the file after the first 99 lines, and
           every 100 lines thereafter, up to 9999 lines; this is because lines
           in the file are numbered from 1 rather than zero, for historical
           reasons:


               ccsspplliitt −−kk ffiillee  110000  {{9999}}

        3. Assuming that pprroogg..cc follows the C-language coding convention of
           ending routines with a ''}}'' at the beginning of the line, this
           example creates a file containing each separate C routine (up to
           21) in pprroogg..cc:


               ccsspplliitt −−kk pprroogg..cc ''%%mmaaiinn((%%''  ''//^^}}//++11'' {{2200}}

RRAATTIIOONNAALLEE
       The −−nn option was added to extend the range of filenames that could be
       handled.

       Consideration was given to adding a −−aa flag to use the alphabetic
       filename generation used by the historical _s_p_l_i_t utility, but the
       functionality added by the −−nn option was deemed to make alphabetic
       naming unnecessary.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _s_e_d, _s_p_l_i_t

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s, _S_e_c_t_i_o_n _1_2_._2,
       _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                           CSPLIT(1P)
