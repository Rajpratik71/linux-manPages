UNIQ(1P)                   POSIX Programmer's Manual                  UNIQ(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       uniq — report or filter out repeated lines in a file

SSYYNNOOPPSSIISS
       uniq [[−c|−d|−u]] [[−f _f_i_e_l_d_s]] [[−s _c_h_a_r]] [[_i_n_p_u_t___f_i_l_e [[_o_u_t_p_u_t___f_i_l_e]]]]

DDEESSCCRRIIPPTTIIOONN
       The _u_n_i_q utility shall read an input file comparing adjacent lines, and
       write one copy of each input line on the output. The second and
       succeeding copies of repeated adjacent input lines shall not be
       written.  The trailing <newline> of each line in the input shall be
       ignored when doing comparisons.

       Repeated lines in the input shall not be detected if they are not
       adjacent.

OOPPTTIIOONNSS
       The _u_n_i_q utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that ''++''
       may be recognized as an option delimiter as well as ''−−''.

       The following options shall be supported:

       −−cc        Precede each output line with a count of the number of times
                 the line occurred in the input.

       −−dd        Suppress the writing of lines that are not repeated in the
                 input.

       −−ff  _f_i_e_l_d_s Ignore the first _f_i_e_l_d_s fields on each input line when doing
                 comparisons, where _f_i_e_l_d_s is a positive decimal integer. A
                 field is the maximal string matched by the basic regular
                 expression:


                     [[[[::bbllaannkk::]]]]**[[^^[[::bbllaannkk::]]]]**

                 If the _f_i_e_l_d_s option-argument specifies more fields than
                 appear on an input line, a null string shall be used for
                 comparison.

       −−ss  _c_h_a_r_s  Ignore the first _c_h_a_r_s characters when doing comparisons,
                 where _c_h_a_r_s shall be a positive decimal integer. If specified
                 in conjunction with the −−ff option, the first _c_h_a_r_s characters
                 after the first _f_i_e_l_d_s fields shall be ignored. If the _c_h_a_r_s
                 option-argument specifies more characters than remain on an
                 input line, a null string shall be used for comparison.

       −−uu        Suppress the writing of lines that are repeated in the input.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _i_n_p_u_t___f_i_l_e
                 A pathname of the input file. If the _i_n_p_u_t___f_i_l_e operand is
                 not specified, or if the _i_n_p_u_t___f_i_l_e is ''−−'', the standard
                 input shall be used.

       _o_u_t_p_u_t___f_i_l_e
                 A pathname of the output file. If the _o_u_t_p_u_t___f_i_l_e operand is
                 not specified, the standard output shall be used. The results
                 are unspecified if the file named by _o_u_t_p_u_t___f_i_l_e is the file
                 named by _i_n_p_u_t___f_i_l_e.

SSTTDDIINN
       The standard input shall be used only if no _i_n_p_u_t___f_i_l_e operand is
       specified or if _i_n_p_u_t___f_i_l_e is ''−−''.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input file shall be a text file.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _u_n_i_q:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for ordering rules.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files) and which characters constitute a <blank> in the
                 current locale.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The standard output shall be used if no _o_u_t_p_u_t___f_i_l_e operand is
       specified, and shall be used if the _o_u_t_p_u_t___f_i_l_e operand is ''−−'' and the
       implementation treats the ''−−'' as meaning standard output. Otherwise,
       the standard output shall not be used.  See the OUTPUT FILES section.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       If the −−cc option is specified, the output file shall be empty or each
       line shall be of the form:


           ""%%dd %%ss"",, <<_n_u_m_b_e_r _o_f _d_u_p_l_i_c_a_t_e_s>, <_l_i_n_e>

       otherwise, the output file shall be empty or each line shall be of the
       form:


           ""%%ss"",, <<_l_i_n_e>

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The utility executed successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The _s_o_r_t utility can be used to cause repeated lines to be adjacent in
       the input file.

EEXXAAMMPPLLEESS
       The following input file data (but flushed left) was used for a test
       series on _u_n_i_q:


           ##0011 ffoooo00 bbaarr00 ffoooo11 bbaarr11
           ##0022 bbaarr00 ffoooo11 bbaarr11 ffoooo11
           ##0033 ffoooo00 bbaarr00 ffoooo11 bbaarr11
           ##0044
           ##0055 ffoooo00 bbaarr00 ffoooo11 bbaarr11
           ##0066 ffoooo00 bbaarr00 ffoooo11 bbaarr11
           ##0077 bbaarr00 ffoooo11 bbaarr11 ffoooo00

       What follows is a series of test invocations of the _u_n_i_q utility that
       use a mixture of _u_n_i_q options against the input file data. These tests
       verify the meaning of _a_d_j_a_c_e_n_t.  The _u_n_i_q utility views the input data
       as a sequence of strings delimited by ''\\nn''.  Accordingly, for the
       _f_i_e_l_d_sth member of the sequence, _u_n_i_q interprets unique or repeated
       adjacent lines strictly relative to the _f_i_e_l_d_s+1th member.

        1. This first example tests the line counting option, comparing each
           line of the input file data starting from the second field:


               uunniiqq −−cc −−ff 11 uunniiqq__00II..tt
                   11 ##0011 ffoooo00 bbaarr00 ffoooo11 bbaarr11
                   11 ##0022 bbaarr00 ffoooo11 bbaarr11 ffoooo11
                   11 ##0033 ffoooo00 bbaarr00 ffoooo11 bbaarr11
                   11 ##0044
                   22 ##0055 ffoooo00 bbaarr00 ffoooo11 bbaarr11
                   11 ##0077 bbaarr00 ffoooo11 bbaarr11 ffoooo00

           The number ''22'', prefixing the fifth line of output, signifies that
           the _u_n_i_q utility detected a pair of repeated lines. Given the input
           data, this can only be true when _u_n_i_q is run using the −−ff  11 option
           (which shall cause _u_n_i_q to ignore the first field on each input
           line).

        2. The second example tests the option to suppress unique lines,
           comparing each line of the input file data starting from the second
           field:


               uunniiqq −−dd −−ff 11 uunniiqq__00II..tt
               ##0055 ffoooo00 bbaarr00 ffoooo11 bbaarr11

        3. This test suppresses repeated lines, comparing each line of the
           input file data starting from the second field:


               uunniiqq −−uu −−ff 11 uunniiqq__00II..tt
               ##0011 ffoooo00 bbaarr00 ffoooo11 bbaarr11
               ##0022 bbaarr00 ffoooo11 bbaarr11 ffoooo11
               ##0033 ffoooo00 bbaarr00 ffoooo11 bbaarr11
               ##0044
               ##0077 bbaarr00 ffoooo11 bbaarr11 ffoooo00

        4. This suppresses unique lines, comparing each line of the input file
           data starting from the third character:


               uunniiqq −−dd −−ss 22 uunniiqq__00II..tt

           In the last example, the _u_n_i_q utility found no input matching the
           above criteria.

RRAATTIIOONNAALLEE
       Some historical implementations have limited lines to be 1080 bytes in
       length, which does not meet the implied {LINE_MAX} limit.

       Earlier versions of this standard allowed the −−_n_u_m_b_e_r and ++_n_u_m_b_e_r
       options. These options are no longer specified by POSIX.1‐2008 but may
       be present in some implementations.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_o_m_m, _s_o_r_t

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



IEEE/The Open Group                  2013                             UNIQ(1P)
