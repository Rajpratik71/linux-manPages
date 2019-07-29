FOLD(1P)                   POSIX Programmer's Manual                  FOLD(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       fold — filter for folding lines

SSYYNNOOPPSSIISS
       fold [[−bs]] [[−w _w_i_d_t_h]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _f_o_l_d utility is a filter that shall fold lines from its input
       files, breaking the lines to have a maximum of _w_i_d_t_h column positions
       (or bytes, if the −−bb option is specified). Lines shall be broken by the
       insertion of a <newline> such that each output line (referred to later
       in this section as a _s_e_g_m_e_n_t) is the maximum width possible that does
       not exceed the specified number of column positions (or bytes). A line
       shall not be broken in the middle of a character. The behavior is
       undefined if _w_i_d_t_h is less than the number of columns any single
       character in the input would occupy.

       If the <carriage-return>, <backspace>, or <tab> characters are
       encountered in the input, and the −−bb option is not specified, they
       shall be treated specially:

       <backspace>
                 The current count of line width shall be decremented by one,
                 although the count never shall become negative. The _f_o_l_d
                 utility shall not insert a <newline> immediately before or
                 after any <backspace>, unless the following character has a
                 width greater than 1 and would cause the line width to exceed
                 _w_i_d_t_h.

       <carriage-return>
                 The current count of line width shall be set to zero. The
                 _f_o_l_d utility shall not insert a <newline> immediately before
                 or after any <carriage-return>.

       <tab>     Each <tab> encountered shall advance the column position
                 pointer to the next tab stop. Tab stops shall be at each
                 column position _n such that _n modulo 8 equals 1.

OOPPTTIIOONNSS
       The _f_o_l_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−bb        Count _w_i_d_t_h in bytes rather than column positions.

       −−ss        If a segment of a line contains a <blank> within the first
                 _w_i_d_t_h column positions (or bytes), break the line after the
                 last such <blank> meeting the width constraints. If there is
                 no <blank> meeting the requirements, the −−ss option shall have
                 no effect for that output segment of the input line.

       −−ww  _w_i_d_t_h  Specify the maximum line length, in column positions (or
                 bytes if −−bb is specified). The results are unspecified if
                 _w_i_d_t_h is not a positive decimal number. The default value
                 shall be 80.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a text file to be folded. If no _f_i_l_e operands
                 are specified, the standard input shall be used.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operands are specified, and
       shall be used if a _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       If the −−bb option is specified, the input files shall be text files
       except that the lines are not limited to {LINE_MAX} bytes in length. If
       the −−bb option is not specified, the input files shall be text files.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _f_o_l_d:

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
                 files), and for the determination of the width in column
                 positions each character would occupy on a constant-width
                 font output device.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The standard output shall be a file containing a sequence of characters
       whose order shall be preserved from the input files, possibly with
       inserted <newline> characters.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input files were processed successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The _c_u_t and _f_o_l_d utilities can be used to create text files out of
       files with arbitrary line lengths. The _c_u_t utility should be used when
       the number of lines (or records) needs to remain constant. The _f_o_l_d
       utility should be used when the contents of long lines need to be kept
       contiguous.

       The _f_o_l_d utility is frequently used to send text files to printers that
       truncate, rather than fold, lines wider than the printer is able to
       print (usually 80 or 132 column positions).

EEXXAAMMPPLLEESS
       An example invocation that submits a file of possibly long lines to the
       printer (under the assumption that the user knows the line width of the
       printer to be assigned by _l_p):


           ffoolldd −−ww 113322 bbiiggffiillee || llpp

RRAATTIIOONNAALLEE
       Although terminal input in canonical processing mode requires the erase
       character (frequently set to <backspace>) to erase the previous
       character (not byte or column position), terminal output is not
       buffered and is extremely difficult, if not impossible, to parse
       correctly; the interpretation depends entirely on the physical device
       that actually displays/prints/stores the output. In all known
       internationalized implementations, the utilities producing output for
       mixed column-width output assume that a <backspace> character backs up
       one column position and outputs enough <backspace> characters to return
       to the start of the character when <backspace> is used to provide local
       line motions to support underlining and emboldening operations. Since
       _f_o_l_d without the −−bb option is dealing with these same constraints,
       <backspace> is always treated as backing up one column position rather
       than backing up one character.

       Historical versions of the _f_o_l_d utility assumed 1 byte was one
       character and occupied one column position when written out. This is no
       longer always true. Since the most common usage of _f_o_l_d is believed to
       be folding long lines for output to limited-length output devices, this
       capability was preserved as the default case. The −−bb option was added
       so that applications could _f_o_l_d files with arbitrary length lines into
       text files that could then be processed by the standard utilities. Note
       that although the width for the −−bb option is in bytes, a line is never
       split in the middle of a character.  (It is unspecified what happens if
       a width is specified that is too small to hold a single character found
       in the input followed by a <newline>.)

       The tab stops are hardcoded to be every eighth column to meet
       historical practice. No new method of specifying other tab stops was
       invented.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_u_t

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



IEEE/The Open Group                  2013                             FOLD(1P)
