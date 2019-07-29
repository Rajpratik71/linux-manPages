GREP(1P)                   POSIX Programmer's Manual                  GREP(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       grep — search a file for a pattern

SSYYNNOOPPSSIISS
       grep [[−E|−F]] [[−c|−l|−q]] [[−insvx]] −e _p_a_t_t_e_r_n___l_i_s_t
           [[−e _p_a_t_t_e_r_n___l_i_s_t]]... [[−f _p_a_t_t_e_r_n___f_i_l_e]]... [[_f_i_l_e...]]

       grep [[−E|−F]] [[−c|−l|−q]] [[−insvx]] [[−e _p_a_t_t_e_r_n___l_i_s_t]]......
           −f _p_a_t_t_e_r_n___f_i_l_e [[−f _p_a_t_t_e_r_n___f_i_l_e]]... [[_f_i_l_e...]]

       grep [[−E|−F]] [[−c|−l|−q]] [[−insvx]] _p_a_t_t_e_r_n___l_i_s_t [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _g_r_e_p utility shall search the input files, selecting lines matching
       one or more patterns; the types of patterns are controlled by the
       options specified. The patterns are specified by the −−ee option, −−ff
       option, or the _p_a_t_t_e_r_n___l_i_s_t operand. The _p_a_t_t_e_r_n___l_i_s_t's value shall
       consist of one or more patterns separated by <newline> characters; the
       _p_a_t_t_e_r_n___f_i_l_e's contents shall consist of one or more patterns
       terminated by a <newline> character. By default, an input line shall be
       selected if any pattern, treated as an entire basic regular expression
       (BRE) as described in the Base Definitions volume of POSIX.1‐2008,
       _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s, matches any part of the line
       excluding the terminating <newline>; a null BRE shall match every line.
       By default, each selected input line shall be written to the standard
       output.

       Regular expression matching shall be based on text lines. Since a
       <newline> separates or terminates patterns (see the −−ee and −−ff options
       below), regular expressions cannot contain a <newline>.  Similarly,
       since patterns are matched against individual lines (excluding the
       terminating <newline> characters) of the input, there is no way for a
       pattern to match a <newline> found in the input.

OOPPTTIIOONNSS
       The _g_r_e_p utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−EE        Match using extended regular expressions.  Treat each pattern
                 specified as an ERE, as described in the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._4, _E_x_t_e_n_d_e_d _R_e_g_u_l_a_r
                 _E_x_p_r_e_s_s_i_o_n_s.  If any entire ERE pattern matches some part of
                 an input line excluding the terminating <newline>, the line
                 shall be matched. A null ERE shall match every line.

       −−FF        Match using fixed strings. Treat each pattern specified as a
                 string instead of a regular expression. If an input line
                 contains any of the patterns as a contiguous sequence of
                 bytes, the line shall be matched.  A null string shall match
                 every line.

       −−cc        Write only a count of selected lines to standard output.

       −−ee  _p_a_t_t_e_r_n___l_i_s_t
                 Specify one or more patterns to be used during the search for
                 input.  The application shall ensure that patterns in
                 _p_a_t_t_e_r_n___l_i_s_t are separated by a <newline>.  A null pattern
                 can be specified by two adjacent <newline> characters in
                 _p_a_t_t_e_r_n___l_i_s_t.  Unless the −−EE or −−FF option is also specified,
                 each pattern shall be treated as a BRE, as described in the
                 Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c
                 _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s.  Multiple −−ee and −−ff options shall be
                 accepted by the _g_r_e_p utility. All of the specified patterns
                 shall be used when matching lines, but the order of
                 evaluation is unspecified.

       −−ff  _p_a_t_t_e_r_n___f_i_l_e
                 Read one or more patterns from the file named by the pathname
                 _p_a_t_t_e_r_n___f_i_l_e.  Patterns in _p_a_t_t_e_r_n___f_i_l_e shall be terminated
                 by a <newline>.  A null pattern can be specified by an empty
                 line in _p_a_t_t_e_r_n___f_i_l_e.  Unless the −−EE or −−FF option is also
                 specified, each pattern shall be treated as a BRE, as
                 described in the Base Definitions volume of POSIX.1‐2008,
                 _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s.

       −−ii        Perform pattern matching in searches without regard to case;
                 see the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._2,
                 _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n _G_e_n_e_r_a_l _R_e_q_u_i_r_e_m_e_n_t_s.

       −−ll        (The letter ell.) Write only the names of files containing
                 selected lines to standard output. Pathnames shall be written
                 once per file searched. If the standard input is searched, a
                 pathname of ""((ssttaannddaarrddinput)" shall be written, in the POSIX
                 locale. In other locales, ""ssttaannddaarrddinput" may be replaced by
                 something more appropriate in those locales.

       −−nn        Precede each output line by its relative line number in the
                 file, each file starting at line 1. The line number counter
                 shall be reset for each file processed.

       −−qq        Quiet. Nothing shall be written to the standard output,
                 regardless of matching lines. Exit with zero status if an
                 input line is selected.

       −−ss        Suppress the error messages ordinarily written for
                 nonexistent or unreadable files. Other error messages shall
                 not be suppressed.

       −−vv        Select lines not matching any of the specified patterns. If
                 the −−vv option is not specified, selected lines shall be those
                 that match any of the specified patterns.

       −−xx        Consider only input lines that use all characters in the line
                 excluding the terminating <newline> to match an entire fixed
                 string or regular expression to be matching lines.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _p_a_t_t_e_r_n___l_i_s_t
                 Specify one or more patterns to be used during the search for
                 input.  This operand shall be treated as if it were specified
                 as −−ee _p_a_t_t_e_r_n___l_i_s_t.

       _f_i_l_e      A pathname of a file to be searched for the patterns. If no
                 _f_i_l_e operands are specified, the standard input shall be
                 used.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operands are specified, and
       shall be used if a _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be text files.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _g_r_e_p:

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
       Default.

SSTTDDOOUUTT
       If the −−ll option is in effect, the following shall be written for each
       file containing at least one selected input line:


           ""%%ss\\nn"",, <<_f_i_l_e>

       Otherwise, if more than one _f_i_l_e argument appears, and −−qq is not
       specified, the _g_r_e_p utility shall prefix each output line by:


           ""%%ss::"",, <<_f_i_l_e>

       The remainder of each output line shall depend on the other options
       specified:

        *  If the −−cc option is in effect, the remainder of each output line
           shall contain:


               ""%%dd\\nn"",, <<_c_o_u_n_t>

        *  Otherwise, if −−cc is not in effect and the −−nn option is in effect,
           the following shall be written to standard output:


               ""%%dd::"",, <<_l_i_n_e _n_u_m_b_e_r>

        *  Finally, the following shall be written to standard output:


               ""%%ss"",, <<_s_e_l_e_c_t_e_d_-_l_i_n_e _c_o_n_t_e_n_t_s>

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    One or more lines were selected.

        1    No lines were selected.

       >1    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If the −−qq option is specified, the exit status shall be zero if an
       input line is selected, even if an error was detected. Otherwise,
       default actions shall be performed.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Care should be taken when using characters in _p_a_t_t_e_r_n___l_i_s_t that may
       also be meaningful to the command interpreter. It is safest to enclose
       the entire _p_a_t_t_e_r_n___l_i_s_t argument in single-quotes:


           ''......''

       The −−ee _p_a_t_t_e_r_n___l_i_s_t option has the same effect as the _p_a_t_t_e_r_n___l_i_s_t
       operand, but is useful when _p_a_t_t_e_r_n___l_i_s_t begins with the <hyphen>
       delimiter. It is also useful when it is more convenient to provide
       multiple patterns as separate arguments.

       Multiple −−ee and −−ff options are accepted and _g_r_e_p uses all of the
       patterns it is given while matching input text lines.  (Note that the
       order of evaluation is not specified. If an implementation finds a null
       string as a pattern, it is allowed to use that pattern first, matching
       every line, and effectively ignore any other patterns.)

       The −−qq option provides a means of easily determining whether or not a
       pattern (or string) exists in a group of files. When searching several
       files, it provides a performance improvement (because it can quit as
       soon as it finds the first match) and requires less care by the user in
       choosing the set of files to supply as arguments (because it exits zero
       if it finds a match even if _g_r_e_p detected an access or read error on
       earlier _f_i_l_e operands).

EEXXAAMMPPLLEESS
        1. To find all uses of the word ""PPoossiixx"" (in any case) in file tteexxtt..mmmm
           and write with line numbers:


               ggrreepp −−ii −−nn ppoossiixx tteexxtt..mmmm

        2. To find all empty lines in the standard input:


               ggrreepp ^^$$

           or:


               ggrreepp −−vv ..

        3. Both of the following commands print all lines containing strings
           ""aabbcc"" or ""ddeeff"" or both:


               ggrreepp −−EE ''aabbcc||ddeeff''

               grep −F 'abc
               def'

        4. Both of the following commands print all lines matching exactly
           ""aabbcc"" or ""ddeeff"":


               ggrreepp −−EE ''^^aabbcc$$||^^ddeeff$$''

               grep −F −x 'abc
               def'

RRAATTIIOONNAALLEE
       This _g_r_e_p has been enhanced in an upwards-compatible way to provide the
       exact functionality of the historical _e_g_r_e_p and _f_g_r_e_p commands as well.
       It was the clear intention of the standard developers to consolidate
       the three _g_r_e_ps into a single command.

       The old _e_g_r_e_p and _f_g_r_e_p commands are likely to be supported for many
       years to come as implementation extensions, allowing historical
       applications to operate unmodified.

       Historical implementations usually silently ignored all but one of
       multiply-specified −−ee and −−ff options, but were not consistent as to
       which specification was actually used.

       The −−bb option was omitted from the OPTIONS section because block
       numbers are implementation-defined.

       The System V restriction on using −− to mean standard input was omitted.

       A definition of action taken when given a null BRE or ERE is specified.
       This is an error condition in some historical implementations.

       The −−ll option previously indicated that its use was undefined when no
       files were explicitly named. This behavior was historical and placed an
       unnecessary restriction on future implementations. It has been removed.

       The historical BSD _g_r_e_p −−ss option practice is easily duplicated by
       redirecting standard output to //ddeevv//nnuullll.  The −−ss option required here
       is from System V.

       The −−xx option, historically available only with _f_g_r_e_p, is available
       here for all of the non-obsolescent versions.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _s_e_d

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _C_h_a_p_t_e_r _9, _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
       _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                             GREP(1P)
