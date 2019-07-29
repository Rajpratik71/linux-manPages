SORT(1P)                   POSIX Programmer's Manual                  SORT(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       sort — sort, merge, or sequence check text files

SSYYNNOOPPSSIISS
       sort [[−m]] [[−o _o_u_t_p_u_t]] [[−bdfinru]] [[−t _c_h_a_r]] [[−k _k_e_y_d_e_f]]... [[_f_i_l_e...]]

       sort [[−c|−C]] [[−bdfinru]] [[−t _c_h_a_r]] [[−k _k_e_y_d_e_f]] [[_f_i_l_e]]

DDEESSCCRRIIPPTTIIOONN
       The _s_o_r_t utility shall perform one of the following functions:

        1. Sort lines of all the named files together and write the result to
           the specified output.

        2. Merge lines of all the named (presorted) files together and write
           the result to the specified output.

        3. Check that a single input file is correctly presorted.

       Comparisons shall be based on one or more sort keys extracted from each
       line of input (or, if no sort keys are specified, the entire line up
       to, but not including, the terminating <newline>), and shall be
       performed using the collating sequence of the current locale.

OOPPTTIIOONNSS
       The _s_o_r_t utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except for
       Guideline 9, and the −−kk _k_e_y_d_e_f option should follow the −−bb, −−dd, −−ff, −−ii,
       −−nn, and −−rr options. In addition, ''++'' may be recognized as an option
       delimiter as well as ''−−''.

       The following options shall be supported:

       −−cc        Check that the single input file is ordered as specified by
                 the arguments and the collating sequence of the current
                 locale. Output shall not be sent to standard output. The exit
                 code shall indicate whether or not disorder was detected or
                 an error occurred. If disorder (or, with −−uu, a duplicate key)
                 is detected, a warning message shall be sent to standard
                 error indicating where the disorder or duplicate key was
                 found.

       −−CC        Same as −−cc, except that a warning message shall not be sent
                 to standard error if disorder or, with −−uu, a duplicate key is
                 detected.

       −−mm        Merge only; the input file shall be assumed to be already
                 sorted.

       −−oo  _o_u_t_p_u_t Specify the name of an output file to be used instead of the
                 standard output. This file can be the same as one of the
                 input _f_i_l_es.

       −−uu        Unique: suppress all but one in each set of lines having
                 equal keys.  If used with the −−cc option, check that there are
                 no lines with duplicate keys, in addition to checking that
                 the input file is sorted.

       The following options shall override the default ordering rules. When
       ordering options appear independent of any key field specifications,
       the requested field ordering rules shall be applied globally to all
       sort keys. When attached to a specific key (see −−kk), the specified
       ordering options shall override all global ordering options for that
       key.

       −−dd        Specify that only <blank> characters and alphanumeric
                 characters, according to the current setting of _L_C___C_T_Y_P_E,
                 shall be significant in comparisons. The behavior is
                 undefined for a sort key to which −−ii or −−nn also applies.

       −−ff        Consider all lowercase characters that have uppercase
                 equivalents, according to the current setting of _L_C___C_T_Y_P_E, to
                 be the uppercase equivalent for the purposes of comparison.

       −−ii        Ignore all characters that are non-printable, according to
                 the current setting of _L_C___C_T_Y_P_E.  The behavior is undefined
                 for a sort key for which −−nn also applies.

       −−nn        Restrict the sort key to an initial numeric string,
                 consisting of optional <blank> characters, optional minus-
                 sign, and zero or more digits with an optional radix
                 character and thousands separators (as defined in the current
                 locale), which shall be sorted by arithmetic value. An empty
                 digit string shall be treated as zero. Leading zeros and
                 signs on zeros shall not affect ordering.

       −−rr        Reverse the sense of comparisons.

       The treatment of field separators can be altered using the options:

       −−bb        Ignore leading <blank> characters when determining the
                 starting and ending positions of a restricted sort key. If
                 the −−bb option is specified before the first −−kk option, it
                 shall be applied to all −−kk options. Otherwise, the −−bb option
                 can be attached independently to each −−kk _f_i_e_l_d___s_t_a_r_t or
                 _f_i_e_l_d___e_n_d option-argument (see below).

       −−tt  _c_h_a_r   Use _c_h_a_r as the field separator character; _c_h_a_r shall not be
                 considered to be part of a field (although it can be included
                 in a sort key). Each occurrence of _c_h_a_r shall be significant
                 (for example, <_c_h_a_r><_c_h_a_r> delimits an empty field). If −−tt is
                 not specified, <blank> characters shall be used as default
                 field separators; each maximal non-empty sequence of <blank>
                 characters that follows a non-<blank> shall be a field
                 separator.

       Sort keys can be specified using the options:

       −−kk  _k_e_y_d_e_f The _k_e_y_d_e_f argument is a restricted sort key field
                 definition. The format of this definition is:


                     _f_i_e_l_d___s_t_a_r_t[[_t_y_p_e]][[,_f_i_e_l_d___e_n_d[[_t_y_p_e]]]]

                 where _f_i_e_l_d___s_t_a_r_t and _f_i_e_l_d___e_n_d define a key field restricted
                 to a portion of the line (see the EXTENDED DESCRIPTION
                 section), and _t_y_p_e is a modifier from the list of characters
                 ''bb'', ''dd'', ''ff'', ''ii'', ''nn'', ''rr''.  The ''bb'' modifier shall behave
                 like the −−bb option, but shall apply only to the _f_i_e_l_d___s_t_a_r_t
                 or _f_i_e_l_d___e_n_d to which it is attached. The other modifiers
                 shall behave like the corresponding options, but shall apply
                 only to the key field to which they are attached; they shall
                 have this effect if specified with _f_i_e_l_d___s_t_a_r_t, _f_i_e_l_d___e_n_d, or
                 both. If any modifier is attached to a _f_i_e_l_d___s_t_a_r_t or to a
                 _f_i_e_l_d___e_n_d, no option shall apply to either. Implementations
                 shall support at least nine occurrences of the −−kk option,
                 which shall be significant in command line order. If no −−kk
                 option is specified, a default sort key of the entire line
                 shall be used.

                 When there are multiple key fields, later keys shall be
                 compared only after all earlier keys compare equal. Except
                 when the −−uu option is specified, lines that otherwise compare
                 equal shall be ordered as if none of the options −−dd, −−ff, −−ii,
                 −−nn, or −−kk were present (but with −−rr still in effect, if it
                 was specified) and with all bytes in the lines significant to
                 the comparison. The order in which lines that still compare
                 equal are written is unspecified.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a file to be sorted, merged, or checked. If no
                 _f_i_l_e operands are specified, or if a _f_i_l_e operand is ''−−'', the
                 standard input shall be used.

SSTTDDIINN
       The standard input shall be used only if no _f_i_l_e operands are
       specified, or if a _f_i_l_e operand is ''−−''.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be text files, except that the _s_o_r_t utility shall
       add a <newline> to the end of a file ending with an incomplete last
       line.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _s_o_r_t:

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
                 files) and the behavior of character classification for the
                 −−bb, −−dd, −−ff, −−ii, and −−nn options.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _L_C___N_U_M_E_R_I_C
                 Determine the locale for the definition of the radix
                 character and thousands separator for the −−nn option.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Unless the −−oo or −−cc options are in effect, the standard output shall
       contain the sorted input.

SSTTDDEERRRR
       The standard error shall be used for diagnostic messages. When −−cc is
       specified, if disorder is detected (or if −−uu is also specified and a
       duplicate key is detected), a message shall be written to the standard
       error which identifies the input line at which disorder (or a duplicate
       key) was detected. A warning message about correcting an incomplete
       last line of an input file may be generated, but need not affect the
       final exit status.

OOUUTTPPUUTT FFIILLEESS
       If the −−oo option is in effect, the sorted input shall be written to the
       file _o_u_t_p_u_t.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       The notation:


           −−kk _f_i_e_l_d___s_t_a_r_t[[_t_y_p_e]][[,_f_i_e_l_d___e_n_d[[_t_y_p_e]]]]

       shall define a key field that begins at _f_i_e_l_d___s_t_a_r_t and ends at
       _f_i_e_l_d___e_n_d inclusive, unless _f_i_e_l_d___s_t_a_r_t falls beyond the end of the
       line or after _f_i_e_l_d___e_n_d, in which case the key field is empty. A
       missing _f_i_e_l_d___e_n_d shall mean the last character of the line.

       A field comprises a maximal sequence of non-separating characters and,
       in the absence of option −−tt, any preceding field separator.

       The _f_i_e_l_d___s_t_a_r_t portion of the _k_e_y_d_e_f option-argument shall have the
       form:


           _f_i_e_l_d___n_u_m_b_e_r[[._f_i_r_s_t___c_h_a_r_a_c_t_e_r]]

       Fields and characters within fields shall be numbered starting with 1.
       The _f_i_e_l_d___n_u_m_b_e_r and _f_i_r_s_t___c_h_a_r_a_c_t_e_r pieces, interpreted as positive
       decimal integers, shall specify the first character to be used as part
       of a sort key. If _._f_i_r_s_t___c_h_a_r_a_c_t_e_r is omitted, it shall refer to the
       first character of the field.

       The _f_i_e_l_d___e_n_d portion of the _k_e_y_d_e_f option-argument shall have the
       form:


           _f_i_e_l_d___n_u_m_b_e_r[[._l_a_s_t___c_h_a_r_a_c_t_e_r]]

       The _f_i_e_l_d___n_u_m_b_e_r shall be as described above for _f_i_e_l_d___s_t_a_r_t_.  The
       _l_a_s_t___c_h_a_r_a_c_t_e_r piece, interpreted as a non-negative decimal integer,
       shall specify the last character to be used as part of the sort key. If
       _l_a_s_t___c_h_a_r_a_c_t_e_r evaluates to zero or _._l_a_s_t___c_h_a_r_a_c_t_e_r is omitted, it
       shall refer to the last character of the field specified by
       _f_i_e_l_d___n_u_m_b_e_r.

       If the −−bb option or bb type modifier is in effect, characters within a
       field shall be counted from the first non-<blank> in the field. (This
       shall apply separately to _f_i_r_s_t___c_h_a_r_a_c_t_e_r and _l_a_s_t___c_h_a_r_a_c_t_e_r.)

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input files were output successfully, or −−cc was specified and
             the input file was correctly sorted.

        1    Under the −−cc option, the file was not ordered as specified, or if
             the −−cc and −−uu options were both specified, two input lines were
             found with equal keys.

       >1    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The default value for −−tt, <blank>, has different properties from, for
       example, −−tt"<space>". If a line contains:


           <<ssppaaccee>><<ssppaaccee>>ffoooo

       the following treatment would occur with default separation as opposed
       to specifically selecting a <space>:

                    +--------+-------------------+--------------+
                    | FFiieelldd  |      DDeeffaauulltt      | −−tt ""<<ssppaaccee>>"" |
                    +--------+-------------------+--------------+
                    |1       | <space><space>foo | _e_m_p_t_y        |
                    |2       | _e_m_p_t_y             | _e_m_p_t_y        |
                    |3       | _e_m_p_t_y             | foo          |
                    +--------+-------------------+--------------+
       The leading field separator itself is included in a field when −−tt is
       not used. For example, this command returns an exit status of zero,
       meaning the input was already sorted:


           ssoorrtt −−cc −−kk 22 <<<<eeooff
           yy<<ttaabb>>bb
           xx<<ssppaaccee>>aa
           eeooff

       (assuming that a <tab> precedes the <space> in the current collating
       sequence). The field separator is not included in a field when it is
       explicitly set via −−tt.  This is historical practice and allows usage
       such as:


           ssoorrtt −−tt ""||"" −−kk 22nn <<<<eeooff
           AAttllaannttaa||442255002222||GGeeoorrggiiaa
           BBiirrmmiinngghhaamm||228844441133||AAllaabbaammaa
           CCoolluummbbiiaa||110000338855||SSoouutthh CCaarroolliinnaa
           eeooff

       where the second field can be correctly sorted numerically without
       regard to the non-numeric field separator.

       The wording in the OPTIONS section clarifies that the −−bb, −−dd, −−ff, −−ii,
       −−nn, and −−rr options have to come before the first sort key specified if
       they are intended to apply to all specified keys. The way it is
       described in this volume of POSIX.1‐2008 matches historical practice,
       not historical documentation.  The results are unspecified if these
       options are specified after a −−kk option.

       The −−ff option might not work as expected in locales where there is not
       a one-to-one mapping between an uppercase and a lowercase letter.

EEXXAAMMPPLLEESS
        1. The following command sorts the contents of iinnffiillee with the second
           field as the sort key:


               ssoorrtt −−kk 22,,22 iinnffiillee

        2. The following command sorts, in reverse order, the contents of
           iinnffiillee11 and iinnffiillee22, placing the output in oouuttffiillee and using the
           second character of the second field as the sort key (assuming that
           the first character of the second field is the field separator):


               ssoorrtt −−rr −−oo oouuttffiillee −−kk 22..22,,22..22 iinnffiillee11 iinnffiillee22

        3. The following command sorts the contents of iinnffiillee11 and iinnffiillee22
           using the second non-<blank> of the second field as the sort key:


               ssoorrtt −−kk 22..22bb,,22..22bb iinnffiillee11 iinnffiillee22

        4. The following command prints the System V password file (user
           database) sorted by the numeric user ID (the third
           <colon>-separated field):


               ssoorrtt −−tt :: −−kk 33,,33nn //eettcc//ppaasssswwdd

        5. The following command prints the lines of the already sorted file
           iinnffiillee, suppressing all but one occurrence of lines having the same
           third field:


               ssoorrtt −−uumm −−kk 33..11,,33..00 iinnffiillee

RRAATTIIOONNAALLEE
       Examples in some historical documentation state that options −−uumm with
       one input file keep the first in each set of lines with equal keys.
       This behavior was deemed to be an implementation artifact and was not
       standardized.

       The −−zz option was omitted; it is not standard practice on most systems
       and is inconsistent with using _s_o_r_t to sort several files individually
       and then merge them together. The text concerning −−zz in historical
       documentation appeared to require implementations to determine the
       proper buffer length during the sort phase of operation, but not during
       the merge.

       The −−yy option was omitted because of non-portability. The −−MM option,
       present in System V, was omitted because of non-portability in
       international usage.

       An undocumented −−TT option exists in some implementations. It is used to
       specify a directory for intermediate files. Implementations are
       encouraged to support the use of the _T_M_P_D_I_R environment variable
       instead of adding an option to support this functionality.

       The −−kk option was added to satisfy two objections. First, the zero-
       based counting used by _s_o_r_t is not consistent with other utility
       conventions. Second, it did not meet syntax guideline requirements.

       Historical documentation indicates that ``setting −−nn implies −−bb''.  The
       description of −−nn already states that optional leading <blank>s are
       tolerated in doing the comparison. If −−bb is enabled, rather than
       implied, by −−nn, this has unusual side-effects. When a character offset
       is used in a column of numbers (for example, to sort modulo 100), that
       offset is measured relative to the most significant digit, not to the
       column.  Based upon a recommendation from the author of the original
       _s_o_r_t utility, the −−bb implication has been omitted from this volume of
       POSIX.1‐2008, and an application wishing to achieve the previously
       mentioned side-effects has to code the −−bb flag explicitly.

       Earlier versions of this standard allowed the −−oo option to appear after
       operands. Historical practice allowed all options to be interspersed
       with operands. This version of the standard allows implementations to
       accept options after operands but conforming applications should not
       use this form.

       Earlier versions of this standard also allowed the −−_n_u_m_b_e_r and ++_n_u_m_b_e_r
       options. These options are no longer specified by POSIX.1‐2008 but may
       be present in some implementations.

       Historical implementations produced a message on standard error when −−cc
       was specified and disorder was detected, and when −−cc and −−uu were
       specified and a duplicate key was detected. An earlier version of this
       standard contained wording that did not make it clear that this message
       was allowed and some implementations removed this message to be sure
       that they conformed to the standard's requirements. Confronted with
       this difference in behavior, interactive users that wanted to be sure
       that they got visual feedback instead of just exit code 1 could have
       used a command like:


           ssoorrtt −−cc ffiillee |||| eecchhoo ddiissoorrddeerr

       whether or not the _s_o_r_t utility provided a message in this case. But,
       it was not easy for a user to find where the disorder or duplicate key
       occurred on implementations that do not produce a message, especially
       when some parts of the input line were not part of the key and when one
       or more of the −−bb, −−dd, −−ff, −−ii, −−nn, or −−r options or _k_e_y_d_e_f type
       modifiers were in use. POSIX.1‐2008 requires a message to be produced
       in this case. POSIX.1‐2008 also contains the −−CC option giving users the
       ability to choose either behavior.

       When a disorder or duplicate is found when the −−cc option is specified,
       some implementations print a message containing the first line that is
       out of order or contains a duplicate key; others print a message
       specifying the line number of the offending line. This standard allows
       either type of message.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_o_m_m, _j_o_i_n, _u_n_i_q

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _t_o_u_p_p_e_r()

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



IEEE/The Open Group                  2013                             SORT(1P)
