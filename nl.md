NL(1P)                     POSIX Programmer's Manual                    NL(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       nl — line numbering filter

SSYYNNOOPPSSIISS
       nl [[−p]] [[−b _t_y_p_e]] [[−d _d_e_l_i_m]] [[−f _t_y_p_e]] [[−h _t_y_p_e]] [[−i _i_n_c_r]] [[−l _n_u_m]]
           [[−n _f_o_r_m_a_t]] [[−s _s_e_p]] [[−v _s_t_a_r_t_n_u_m]] [[−w _w_i_d_t_h]] [[_f_i_l_e]]

DDEESSCCRRIIPPTTIIOONN
       The _n_l utility shall read lines from the named _f_i_l_e or the standard
       input if no _f_i_l_e is named and shall reproduce the lines to standard
       output. Lines shall be numbered on the left. Additional functionality
       may be provided in accordance with the command options in effect.

       The _n_l utility views the text it reads in terms of logical pages. Line
       numbering shall be reset at the start of each logical page. A logical
       page consists of a header, a body, and a footer section. Empty sections
       are valid. Different line numbering options are independently available
       for header, body, and footer (for example, no numbering of header and
       footer lines while numbering blank lines only in the body).

       The starts of logical page sections shall be signaled by input lines
       containing nothing but the following delimiter characters:

                              +-----------+------------+
                              |   LLiinnee    |  SSttaarrtt ooff  |
                              +-----------+------------+
                              |\:\:\:     | Header     |
                              |\:\:       | Body       |
                              |\:         | Footer     |
                              +-----------+------------+
       Unless otherwise specified, _n_l shall assume the text being read is in a
       single logical page body.

OOPPTTIIOONNSS
       The _n_l utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.  Only one file
       can be named.

       The following options shall be supported:

       −−bb  _t_y_p_e   Specify which logical page body lines shall be numbered.
                 Recognized _t_y_p_e_s and their meaning are:

                 aa       Number all lines.

                 tt       Number only non-empty lines.

                 nn       No line numbering.

                 pp_s_t_r_i_n_g Number only lines that contain the basic regular
                         expression specified in _s_t_r_i_n_g.

                 The default _t_y_p_e for logical page body shall be tt (text lines
                 numbered).

       −−dd  _d_e_l_i_m  Specify the delimiter characters that indicate the start of a
                 logical page section. These can be changed from the default
                 characters ""\\::"" to two user-specified characters. If only one
                 character is entered, the second character shall remain the
                 default character ''::''.

       −−ff  _t_y_p_e   Specify the same as bb _t_y_p_e except for footer. The default for
                 logical page footer shall be nn (no lines numbered).

       −−hh  _t_y_p_e   Specify the same as bb _t_y_p_e except for header. The default
                 _t_y_p_e for logical page header shall be nn (no lines numbered).

       −−ii  _i_n_c_r   Specify the increment value used to number logical page
                 lines. The default shall be 1.

       −−ll  _n_u_m    Specify the number of blank lines to be considered as one.
                 For example, −−ll  22 results in only the second adjacent blank
                 line being numbered (if the appropriate −−hh  aa, −−bb  aa, or −−ff  aa
                 option is set). The default shall be 1.

       −−nn  _f_o_r_m_a_t Specify the line numbering format. Recognized values are: llnn,
                 left justified, leading zeros suppressed; rrnn, right
                 justified, leading zeros suppressed; rrzz, right justified,
                 leading zeros kept. The default _f_o_r_m_a_t shall be rrnn (right
                 justified).

       −−pp        Specify that numbering should not be restarted at logical
                 page delimiters.

       −−ss  _s_e_p    Specify the characters used in separating the line number and
                 the corresponding text line. The default _s_e_p shall be a
                 <tab>.

       −−vv  _s_t_a_r_t_n_u_m
                 Specify the initial value used to number logical page lines.
                 The default shall be 1.

       −−ww  _w_i_d_t_h  Specify the number of characters to be used for the line
                 number. The default _w_i_d_t_h shall be 6.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a text file to be line-numbered.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operand is specified, and
       shall be used if the _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input file shall be a text file.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _n_l:

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
                 files), the behavior of character classes within regular
                 expressions, and for deciding which characters are in
                 character class ggrraapphh (for the −−bb  tt, −−ff  tt, and −−hh  tt options).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The standard output shall be a text file in the following format:


           ""%%ss%%ss%%ss"",, <<_l_i_n_e _n_u_m_b_e_r>, <_s_e_p_a_r_a_t_o_r>, <_i_n_p_u_t _l_i_n_e>

       where <_l_i_n_e_ _n_u_m_b_e_r> is one of the following numeric formats:

       %6d       When the rrnn format is used (the default; see −−nn).

       %06d      When the rrzz format is used.

       %−6d      When the llnn format is used.

       <empty>   When line numbers are suppressed for a portion of the page;
                 the <_s_e_p_a_r_a_t_o_r> is also suppressed.

       In the preceding list, the number 6 is the default width; the −−ww option
       can change this value.

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
       In using the −−dd _d_e_l_i_m option, care should be taken to escape characters
       that have special meaning to the command interpreter.

EEXXAAMMPPLLEESS
       The command:


           nnll −−vv 1100 −−ii 1100 −−dd \\!!++ ffiillee11

       numbers _f_i_l_e_1 starting at line number 10 with an increment of 10. The
       logical page delimiter is ""!!++"".  Note that the ''!!'' has to be escaped
       when using _c_s_h as a command interpreter because of its history
       substitution syntax.  For _k_s_h and _s_h the escape is not necessary, but
       does not do any harm.

RRAATTIIOONNAALLEE
       None.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _p_r

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



IEEE/The Open Group                  2013                               NL(1P)
