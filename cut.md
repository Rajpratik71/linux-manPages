CUT(1P)                    POSIX Programmer's Manual                   CUT(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       cut — cut out selected fields of each line of a file

SSYYNNOOPPSSIISS
       cut −b _l_i_s_t [[−n]] [[_f_i_l_e...]]

       cut −c _l_i_s_t [[_f_i_l_e...]]

       cut −f _l_i_s_t [[−d _d_e_l_i_m]] [[−s]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _c_u_t utility shall cut out bytes (−−bb option), characters (−−cc
       option), or character-delimited fields (−−ff option) from each line in
       one or more files, concatenate them, and write them to standard output.

OOPPTTIIOONNSS
       The _c_u_t utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The application shall ensure that the option-argument _l_i_s_t (see options
       −−bb, −−cc, and −−ff below) is a <comma>-separated list or <blank>-separated
       list of positive numbers and ranges. Ranges can be in three forms. The
       first is two positive numbers separated by a <hyphen> (_l_o_w−_h_i_g_h), which
       represents all fields from the first number to the second number. The
       second is a positive number preceded by a <hyphen> (−_h_i_g_h), which
       represents all fields from field number 1 to that number. The third is
       a positive number followed by a <hyphen> (_l_o_w−), which represents that
       number to the last field, inclusive. The elements in _l_i_s_t can be
       repeated, can overlap, and can be specified in any order, but the
       bytes, characters, or fields selected shall be written in the order of
       the input data. If an element appears in the selection list more than
       once, it shall be written exactly once.

       The following options shall be supported:

       −−bb  _l_i_s_t   Cut based on a _l_i_s_t of bytes. Each selected byte shall be
                 output unless the −−nn option is also specified. It shall not
                 be an error to select bytes not present in the input line.

       −−cc  _l_i_s_t   Cut based on a _l_i_s_t of characters. Each selected character
                 shall be output. It shall not be an error to select
                 characters not present in the input line.

       −−dd  _d_e_l_i_m  Set the field delimiter to the character _d_e_l_i_m.  The default
                 is the <tab>.

       −−ff  _l_i_s_t   Cut based on a _l_i_s_t of fields, assumed to be separated in the
                 file by a delimiter character (see −−dd).  Each selected field
                 shall be output. Output fields shall be separated by a single
                 occurrence of the field delimiter character. Lines with no
                 field delimiters shall be passed through intact, unless −−ss is
                 specified. It shall not be an error to select fields not
                 present in the input line.

       −−nn        Do not split characters. When specified with the −−bb option,
                 each element in _l_i_s_t of the form _l_o_w−_h_i_g_h (<hyphen>-separated
                 numbers) shall be modified as follows:

                  *  If the byte selected by _l_o_w is not the first byte of a
                     character, _l_o_w shall be decremented to select the first
                     byte of the character originally selected by _l_o_w.  If the
                     byte selected by _h_i_g_h is not the last byte of a
                     character, _h_i_g_h shall be decremented to select the last
                     byte of the character prior to the character originally
                     selected by _h_i_g_h, or zero if there is no prior character.
                     If the resulting range element has _h_i_g_h equal to zero or
                     _l_o_w greater than _h_i_g_h, the list element shall be dropped
                     from _l_i_s_t for that input line without causing an error.

                 Each element in _l_i_s_t of the form _l_o_w− shall be treated as
                 above with _h_i_g_h set to the number of bytes in the current
                 line, not including the terminating <newline>.  Each element
                 in _l_i_s_t of the form −_h_i_g_h shall be treated as above with _l_o_w
                 set to 1. Each element in _l_i_s_t of the form _n_u_m (a single
                 number) shall be treated as above with _l_o_w set to _n_u_m and
                 _h_i_g_h set to _n_u_m.

       −−ss        Suppress lines with no delimiter characters, when used with
                 the −−ff option. Unless specified, lines with no delimiters
                 shall be passed through untouched.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of an input file. If no _f_i_l_e operands are
                 specified, or if a _f_i_l_e operand is ''−−'', the standard input
                 shall be used.

SSTTDDIINN
       The standard input shall be used only if no _f_i_l_e operands are
       specified, or if a _f_i_l_e operand is ''−−''.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be text files, except that line lengths shall be
       unlimited.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _c_u_t:

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
       The _c_u_t utility output shall be a concatenation of the selected bytes,
       characters, or fields (one of the following):


           ""%%ss\\nn"",, <<_c_o_n_c_a_t_e_n_a_t_i_o_n _o_f _b_y_t_e_s>

           "%s\n", <_c_o_n_c_a_t_e_n_a_t_i_o_n _o_f _c_h_a_r_a_c_t_e_r_s>

           "%s\n", <_c_o_n_c_a_t_e_n_a_t_i_o_n _o_f _f_i_e_l_d_s _a_n_d _f_i_e_l_d _d_e_l_i_m_i_t_e_r_s>

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input files were output successfully.

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

       Earlier versions of the _c_u_t utility worked in an environment where
       bytes and characters were considered equivalent (modulo <backspace> and
       <tab> processing in some implementations). In the extended world of
       multi-byte characters, the new −−bb option has been added. The −−nn option
       (used with −−bb) allows it to be used to act on bytes rounded to
       character boundaries.  The algorithm specified for −−nn guarantees that:


           ccuutt −−bb 11−−550000 −−nn ffiillee >> ffiillee11
           ccuutt −−bb 550011−− −−nn ffiillee >> ffiillee22

       ends up with all the characters in ffiillee appearing exactly once in ffiillee11
       or ffiillee22.  (There is, however, a <newline> in both ffiillee11 and ffiillee22 for
       each <newline> in ffiillee.)

EEXXAAMMPPLLEESS
       Examples of the option qualifier list:

       1,4,7   Select the first, fourth, and seventh bytes, characters, or
               fields and field delimiters.

       1−3,8   Equivalent to 1,2,3,8.

       −5,10   Equivalent to 1,2,3,4,5,10.

       3−      Equivalent to third to last, inclusive.

       The _l_o_w−_h_i_g_h forms are not always equivalent when used with −−bb and −−nn
       and multi-byte characters; see the description of −−nn.

       The following command:


           ccuutt −−dd :: −−ff 11,,66 //eettcc//ppaasssswwdd

       reads the System V password file (user database) and produces lines of
       the form:


           <<_u_s_e_r _I_D>:<_h_o_m_e _d_i_r_e_c_t_o_r_y>

       Most utilities in this volume of POSIX.1‐2008 work on text files. The
       _c_u_t utility can be used to turn files with arbitrary line lengths into
       a set of text files containing the same data. The _p_a_s_t_e utility can be
       used to create (or recreate) files with arbitrary line lengths. For
       example, if ffiillee contains long lines:


           ccuutt −−bb 11−−550000 −−nn ffiillee >> ffiillee11
           ccuutt −−bb 550011−− −−nn ffiillee >> ffiillee22

       creates ffiillee11 (a text file) with lines no longer than 500 bytes (plus
       the <newline>) and ffiillee22 that contains the remainder of the data from
       ffiillee.  (Note that ffiillee22 is not a text file if there are lines in ffiillee
       that are longer than 500 + {LINE_MAX} bytes.) The original file can be
       recreated from ffiillee11 and ffiillee22 using the command:


           ppaassttee −−dd ""\\00"" ffiillee11 ffiillee22 >> ffiillee

RRAATTIIOONNAALLEE
       Some historical implementations do not count <backspace> characters in
       determining character counts with the −−cc option. This may be useful for
       using _c_u_t for processing _n_r_o_f_f output. It was deliberately decided not
       to have the −−cc option treat either <backspace> or <tab> characters in
       any special fashion. The _f_o_l_d utility does treat these characters
       specially.

       Unlike other utilities, some historical implementations of _c_u_t exit
       after not finding an input file, rather than continuing to process the
       remaining _f_i_l_e operands. This behavior is prohibited by this volume of
       POSIX.1‐2008, where only the exit status is affected by this problem.

       The behavior of _c_u_t when provided with either mutually-exclusive
       options or options that do not work logically together has been
       deliberately left unspecified in favor of global wording in _S_e_c_t_i_o_n
       _1_._4, _U_t_i_l_i_t_y _D_e_s_c_r_i_p_t_i_o_n _D_e_f_a_u_l_t_s.

       The OPTIONS section was changed in response to IEEE PASC Interpretation
       1003.2 #149. The change represents historical practice on all known
       systems. The original standard was ambiguous on the nature of the
       output.

       The _l_i_s_t option-arguments are historically used to select the portions
       of the line to be written, but do not affect the order of the data. For
       example:


           eecchhoo aabbccddeeffgghhii || ccuutt −−cc66,,22,,44−−77,,11

       yields ""aabbddeeffgg"".

       A proposal to enhance _c_u_t with the following option:

       −−oo    Preserve the selected field order. When this option is specified,
             each byte, character, or field (or ranges of such) shall be
             written in the order specified by the _l_i_s_t option-argument, even
             if this requires multiple outputs of the same bytes, characters,
             or fields.

       was rejected because this type of enhancement is outside the scope of
       the IEEE P1003.2b draft standard.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _2_._5, _P_a_r_a_m_e_t_e_r_s _a_n_d _V_a_r_i_a_b_l_e_s, _f_o_l_d, _g_r_e_p, _p_a_s_t_e

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



IEEE/The Open Group                  2013                              CUT(1P)
