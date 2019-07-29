EXPAND(1P)                 POSIX Programmer's Manual                EXPAND(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       expand — convert tabs to spaces

SSYYNNOOPPSSIISS
       expand [[−t _t_a_b_l_i_s_t]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _e_x_p_a_n_d utility shall write files or the standard input to the
       standard output with <tab> characters replaced with one or more <space>
       characters needed to pad to the next tab stop. Any <backspace>
       characters shall be copied to the output and cause the column position
       count for tab stop calculations to be decremented; the column position
       count shall not be decremented below zero.

OOPPTTIIOONNSS
       The _e_x_p_a_n_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−tt  _t_a_b_l_i_s_t
                 Specify the tab stops. The application shall ensure that the
                 argument _t_a_b_l_i_s_t consists of either a single positive decimal
                 integer or a list of tabstops. If a single number is given,
                 tabs shall be set that number of column positions apart
                 instead of the default 8.

                 If a list of tabstops is given, the application shall ensure
                 that it consists of a list of two or more positive decimal
                 integers, separated by <blank> or <comma> characters, in
                 ascending order. The <tab> characters shall be set at those
                 specific column positions. Each tab stop _N shall be an
                 integer value greater than zero, and the list is in strictly
                 ascending order. This is taken to mean that, from the start
                 of a line of output, tabbing to position _N shall cause the
                 next character output to be in the (_N+1)th column position on
                 that line.

                 In the event of _e_x_p_a_n_d having to process a <tab> at a
                 position beyond the last of those specified in a multiple
                 tab-stop list, the <tab> shall be replaced by a single
                 <space> in the output.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      The pathname of a text file to be used as input.

SSTTDDIINN
       See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       Input files shall be text files.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _e_x_p_a_n_d:

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
                 files), the processing of <tab> and <space> characters, and
                 for the determination of the width in column positions each
                 character would occupy on an output device.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The standard output shall be equivalent to the input files with <tab>
       characters converted into the appropriate number of <space> characters.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       The _e_x_p_a_n_d utility shall terminate with an error message and non-zero
       exit status upon encountering difficulties accessing one of the _f_i_l_e
       operands.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       None.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The _e_x_p_a_n_d utility is useful for preprocessing text files (before
       sorting, looking at specific columns, and so on) that contain <tab>
       characters.

       See the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._1_0_3, _C_o_l_u_m_n
       _P_o_s_i_t_i_o_n.

       The _t_a_b_l_i_s_t option-argument consists of integers in ascending order.
       Utility Syntax Guideline 8 mandates that _e_x_p_a_n_d shall accept the
       integers (within the single argument) separated using either <comma> or
       <blank> characters.

       Earlier versions of this standard allowed the following form in the
       SYNOPSIS:


           eexxppaanndd [[−tabstop]][[−tab1,tab2,...,tabn]][[_f_i_l_e ...]]

       This form is no longer specified by POSIX.1‐2008 but may be present in
       some implementations.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _t_a_b_s, _u_n_e_x_p_a_n_d

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._1_0_3, _C_o_l_u_m_n
       _P_o_s_i_t_i_o_n, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y
       _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                           EXPAND(1P)
