EXPR(1P)                   POSIX Programmer's Manual                  EXPR(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       expr — evaluate arguments as an expression

SSYYNNOOPPSSIISS
       expr _o_p_e_r_a_n_d...

DDEESSCCRRIIPPTTIIOONN
       The _e_x_p_r utility shall evaluate an expression and write the result to
       standard output.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The single expression evaluated by _e_x_p_r shall be formed from the
       _o_p_e_r_a_n_d operands, as described in the EXTENDED DESCRIPTION section. The
       application shall ensure that each of the expression operator symbols:


           ((  ))  ||  &&  ==  >>  >>==  <<  <<==  !!==  ++  −−  **  //  %%  ::

       and the symbols _i_n_t_e_g_e_r and _s_t_r_i_n_g in the table are provided as
       separate arguments to _e_x_p_r.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _e_x_p_r:

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
                 regular expressions and by the string comparison operators.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments) and the
                 behavior of character classes within regular expressions.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The _e_x_p_r utility shall evaluate the expression and write the result,
       followed by a <newline>, to standard output.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       The formation of the expression to be evaluated is shown in the
       following table. The symbols _e_x_p_r, _e_x_p_r_1, and _e_x_p_r_2 represent
       expressions formed from _i_n_t_e_g_e_r and _s_t_r_i_n_g symbols and the expression
       operator symbols (all separate arguments) by recursive application of
       the constructs described in the table. The expressions are listed in
       order of increasing precedence, with equal-precedence operators grouped
       between horizontal lines. All of the operators shall be left-
       associative.

             +---------------+------------------------------------------+
             |  EExxpprreessssiioonn   |               DDeessccrriippttiioonn                |
             +---------------+------------------------------------------+
             |_e_x_p_r_1 | _e_x_p_r_2  | Returns the evaluation of expr1 if it is |
             |               | neither null nor zero; otherwise,        |
             |               | returns the evaluation of expr2 if it is |
             |               | not null; otherwise, zero.               |
             +---------------+------------------------------------------+
             |_e_x_p_r_1 & _e_x_p_r_2  | Returns the evaluation of expr1 if       |
             |               | neither expression evaluates to null or  |
             |               | zero; otherwise, returns zero.           |
             +---------------+------------------------------------------+
             |               | Returns the result of a decimal integer  |
             |               | comparison if both arguments are         |
             |               | integers; otherwise, returns the result  |
             |               | of a string comparison using the         |
             |               | locale-specific collation sequence. The  |
             |               | result of each comparison is 1 if the    |
             |               | specified relationship is true, or 0 if  |
             |               | the relationship is false.               |
             |_e_x_p_r_1 = _e_x_p_r_2  | Equal.                                   |
             |_e_x_p_r_1 > _e_x_p_r_2  | Greater than.                            |
             |_e_x_p_r_1 >= _e_x_p_r_2 | Greater than or equal.                   |
             |_e_x_p_r_1 < _e_x_p_r_2  | Less than.                               |
             |_e_x_p_r_1 <= _e_x_p_r_2 | Less than or equal.                      |
             |_e_x_p_r_1 != _e_x_p_r_2 | Not equal.                               |
             +---------------+------------------------------------------+
             |_e_x_p_r_1 + _e_x_p_r_2  | Addition of decimal integer-valued       |
             |               | arguments.                               |
             |_e_x_p_r_1 − _e_x_p_r_2  | Subtraction of decimal integer-valued    |
             |               | arguments.                               |
             +---------------+------------------------------------------+
             |_e_x_p_r_1 * _e_x_p_r_2  | Multiplication of decimal integer-valued |
             |               | arguments.                               |
             |_e_x_p_r_1 / _e_x_p_r_2  | Integer division of decimal              |
             |               | integer-valued arguments, producing an   |
             |               | integer result.                          |
             |_e_x_p_r_1 % _e_x_p_r_2  | Remainder of integer division of decimal |
             |               | integer-valued arguments.                |
             +---------------+------------------------------------------+
             |_e_x_p_r_1 : _e_x_p_r_2  | Matching expression; see below.          |
             +---------------+------------------------------------------+
             |( _e_x_p_r )       | Grouping symbols. Any expression can be  |
             |               | placed within parentheses. Parentheses   |
             |               | can be nested to a depth of              |
             |               | {EXPR_NEST_MAX}.                         |
             +---------------+------------------------------------------+
             |_i_n_t_e_g_e_r        | An argument consisting only of an        |
             |               | (optional) unary minus followed by       |
             |               | digits.                                  |
             |_s_t_r_i_n_g         | A string argument; see below.            |
             +---------------+------------------------------------------+
   MMaattcchhiinngg EExxpprreessssiioonn
       The ''::'' matching operator shall compare the string resulting from the
       evaluation of _e_x_p_r_1 with the regular expression pattern resulting from
       the evaluation of _e_x_p_r_2.  Regular expression syntax shall be that
       defined in the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._3,
       _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s, except that all patterns are anchored to the
       beginning of the string (that is, only sequences starting at the first
       character of a string are matched by the regular expression) and,
       therefore, it is unspecified whether ''^^'' is a special character in that
       context. Usually, the matching operator shall return a string
       representing the number of characters matched (''00'' on failure).
       Alternatively, if the pattern contains at least one regular expression
       subexpression ""[[\\((......\\))]]"", the string matched by the back-reference
       expression ""\\11"" shall be returned. If the back-reference expression
       ""\\11"" does not match, then the null string shall be returned.

   SSttrriinngg OOppeerraanndd
       A string argument is an argument that cannot be identified as an
       _i_n_t_e_g_e_r argument or as one of the expression operator symbols shown in
       the OPERANDS section.

       The use of string arguments lleennggtthh, ssuubbssttrr, iinnddeexx, or mmaattcchh produces
       unspecified results.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The _e_x_p_r_e_s_s_i_o_n evaluates to neither null nor zero.

        1    The _e_x_p_r_e_s_s_i_o_n evaluates to null or zero.

        2    Invalid _e_x_p_r_e_s_s_i_o_n.

       >2    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       After argument processing by the shell, _e_x_p_r is not required to be able
       to tell the difference between an operator and an operand except by the
       value. If ""$$aa"" is ''=='', the command:


           eexxpprr $$aa == ''==''

       looks like:


           eexxpprr == == ==

       as the arguments are passed to _e_x_p_r (and they all may be taken as the
       ''=='' operator). The following works reliably:


           eexxpprr XX$$aa == XX==

       Also note that this volume of POSIX.1‐2008 permits implementations to
       extend utilities. The _e_x_p_r utility permits the integer arguments to be
       preceded with a unary minus. This means that an integer argument could
       look like an option.  Therefore, the conforming application must employ
       the ""−−−−"" construct of Guideline 10 of the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s to protect its
       operands if there is any chance the first operand might be a negative
       integer (or any string with a leading minus).

EEXXAAMMPPLLEESS
       The _e_x_p_r utility has a rather difficult syntax:

        *  Many of the operators are also shell control operators or reserved
           words, so they have to be escaped on the command line.

        *  Each part of the expression is composed of separate arguments, so
           liberal usage of <blank> characters is required. For example:

                       +-----------------+-----------------------+
                       |    IInnvvaalliidd      |         VVaalliidd         |
                       +-----------------+-----------------------+
                       |_e_x_p_r 1+2         | _e_x_p_r 1 + 2            |
                       |_e_x_p_r "1 + 2"     | _e_x_p_r 1 + 2            |
                       |_e_x_p_r 1 + (2 * 3) | _e_x_p_r 1 + \( 2 \* 3 \) |
                       +-----------------+-----------------------+
       In many cases, the arithmetic and string features provided as part of
       the shell command language are easier to use than their equivalents in
       _e_x_p_r.  Newly written scripts should avoid _e_x_p_r in favor of the new
       features within the shell; see _S_e_c_t_i_o_n _2_._5, _P_a_r_a_m_e_t_e_r_s _a_n_d _V_a_r_i_a_b_l_e_s
       and _S_e_c_t_i_o_n _2_._6_._4, _A_r_i_t_h_m_e_t_i_c _E_x_p_a_n_s_i_o_n.

       The following command:


           aa==$$((eexxpprr $$aa ++ 11))

       adds 1 to the variable _a.

       The following command, for ""$$aa"" equal to either //uussrr//aabbcc//ffiillee or just
       ffiillee:


           eexxpprr $$aa :: ''..**//\\((..**\\))'' \\|| $$aa

       returns the last segment of a pathname (that is, ffiillee).  Applications
       should avoid the character ''//'' used alone as an argument; _e_x_p_r may
       interpret it as the division operator.

       The following command:


           eexxpprr ""////$$aa"" :: ''..**//\\((..**\\))''

       is a better representation of the previous example. The addition of the
       ""////"" characters eliminates any ambiguity about the division operator
       and simplifies the whole expression. Also note that pathnames may
       contain characters contained in the _I_F_S variable and should be quoted
       to avoid having ""$$aa"" expand into multiple arguments.

       The following command:


           eexxpprr ""$$VVAARR"" :: ''..**''

       returns the number of characters in _V_A_R.

RRAATTIIOONNAALLEE
       In an early proposal, EREs were used in the matching expression syntax.
       This was changed to BREs to avoid breaking historical applications.

       The use of a leading <circumflex> in the BRE is unspecified because
       many historical implementations have treated it as a special character,
       despite their system documentation. For example:


           eexxpprr ffoooo :: ^^ffoooo     eexxpprr ^^ffoooo :: ^^ffoooo

       return 3 and 0, respectively, on those systems; their documentation
       would imply the reverse. Thus, the anchoring condition is left
       unspecified to avoid breaking historical scripts relying on this
       undocumented feature.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _2_._5, _P_a_r_a_m_e_t_e_r_s _a_n_d _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _2_._6_._4, _A_r_i_t_h_m_e_t_i_c
       _E_x_p_a_n_s_i_o_n

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



IEEE/The Open Group                  2013                             EXPR(1P)
