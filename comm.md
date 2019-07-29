COMM(1P)                   POSIX Programmer's Manual                  COMM(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       comm — select or reject lines common to two files

SSYYNNOOPPSSIISS
       comm [[−123]] _f_i_l_e_1 _f_i_l_e_2

DDEESSCCRRIIPPTTIIOONN
       The _c_o_m_m utility shall read _f_i_l_e_1 and _f_i_l_e_2, which should be ordered in
       the current collating sequence, and produce three text columns as
       output: lines only in _f_i_l_e_1, lines only in _f_i_l_e_2, and lines in both
       files.

       If the lines in both files are not ordered according to the collating
       sequence of the current locale, the results are unspecified.

OOPPTTIIOONNSS
       The _c_o_m_m utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−11        Suppress the output column of lines unique to _f_i_l_e_1.

       −−22        Suppress the output column of lines unique to _f_i_l_e_2.

       −−33        Suppress the output column of lines duplicated in _f_i_l_e_1 and
                 _f_i_l_e_2.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e_1     A pathname of the first file to be compared. If _f_i_l_e_1 is ''−−'',
                 the standard input shall be used.

       _f_i_l_e_2     A pathname of the second file to be compared. If _f_i_l_e_2 is
                 ''−−'', the standard input shall be used.

       If both _f_i_l_e_1 and _f_i_l_e_2 refer to standard input or to the same FIFO
       special, block special, or character special file, the results are
       undefined.

SSTTDDIINN
       The standard input shall be used only if one of the _f_i_l_e_1 or _f_i_l_e_2
       operands refers to standard input. See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be text files.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _c_o_m_m:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for the collating sequence _c_o_m_m expects
                 to have been used when the input files were sorted.

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
       The _c_o_m_m utility shall produce output depending on the options
       selected. If the −−11, −−22, and −−33 options are all selected, _c_o_m_m shall
       write nothing to standard output.

       If the −−11 option is not selected, lines contained only in _f_i_l_e_1 shall
       be written using the format:


           ""%%ss\\nn"",, <<_l_i_n_e _i_n _f_i_l_e_1>

       If the −−22 option is not selected, lines contained only in _f_i_l_e_2 are
       written using the format:


           ""%%ss%%ss\\nn"",, <<_l_e_a_d>, <_l_i_n_e _i_n _f_i_l_e_2>

       where the string <_l_e_a_d> is as follows:

       <tab>     The −−11 option is not selected.

       null string
                 The −−11 option is selected.

       If the −−33 option is not selected, lines contained in both files shall
       be written using the format:


           ""%%ss%%ss\\nn"",, <<_l_e_a_d>, <_l_i_n_e _i_n _b_o_t_h>

       where the string <_l_e_a_d> is as follows:

       <tab><tab>
                 Neither the −−11 nor the −−22 option is selected.

       <tab>     Exactly one of the −−11 and −−22 options is selected.

       null string
                 Both the −−11 and −−22 options are selected.

       If the input files were ordered according to the collating sequence of
       the current locale, the lines written shall be in the collating
       sequence of the original lines.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input files were successfully output as specified.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       If the input files are not properly presorted, the output of _c_o_m_m might
       not be useful.

EEXXAAMMPPLLEESS
       If a file named xxccuu contains a sorted list of the utilities in this
       volume of POSIX.1‐2008, a file named xxppgg33 contains a sorted list of the
       utilities specified in the X/Open Portability Guide, Issue 3, and a
       file named ssvviidd8899 contains a sorted list of the utilities in the System
       V Interface Definition Third Edition:


           ccoommmm −−2233 xxccuu xxppgg33 || ccoommmm −−2233 −− ssvviidd8899

       would print a list of utilities in this volume of POSIX.1‐2008 not
       specified by either of the other documents:


           ccoommmm −−1122 xxccuu xxppgg33 || ccoommmm −−1122 −− ssvviidd8899

       would print a list of utilities specified by all three documents, and:


           ccoommmm −−1122 xxppgg33 ssvviidd8899 || ccoommmm −−2233 −− xxccuu

       would print a list of utilities specified by both XPG3 and the SVID,
       but not specified in this volume of POSIX.1‐2008.

RRAATTIIOONNAALLEE
       None.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_m_p, _d_i_f_f, _s_o_r_t, _u_n_i_q

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



IEEE/The Open Group                  2013                             COMM(1P)
