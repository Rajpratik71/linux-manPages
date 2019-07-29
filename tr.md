TR(1P)                     POSIX Programmer's Manual                    TR(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       tr — translate characters

SSYYNNOOPPSSIISS
       tr [[−c|−C]] [[−s]] _s_t_r_i_n_g_1 _s_t_r_i_n_g_2

       tr −s [[−c|−C]] _s_t_r_i_n_g_1

       tr −d [[−c|−C]] _s_t_r_i_n_g_1

       tr −ds [[−c|−C]] _s_t_r_i_n_g_1 _s_t_r_i_n_g_2

DDEESSCCRRIIPPTTIIOONN
       The _t_r utility shall copy the standard input to the standard output
       with substitution or deletion of selected characters. The options
       specified and the _s_t_r_i_n_g_1 and _s_t_r_i_n_g_2 operands shall control
       translations that occur while copying characters and single-character
       collating elements.

OOPPTTIIOONNSS
       The _t_r utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−cc        Complement the set of values specified by _s_t_r_i_n_g_1.  See the
                 EXTENDED DESCRIPTION section.

       −−CC        Complement the set of characters specified by _s_t_r_i_n_g_1.  See
                 the EXTENDED DESCRIPTION section.

       −−dd        Delete all occurrences of input characters that are specified
                 by _s_t_r_i_n_g_1.

       −−ss        Replace instances of repeated characters with a single
                 character, as described in the EXTENDED DESCRIPTION section.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _s_t_r_i_n_g_1, _s_t_r_i_n_g_2
                 Translation control strings. Each string shall represent a
                 set of characters to be converted into an array of characters
                 used for the translation. For a detailed description of how
                 the strings are interpreted, see the EXTENDED DESCRIPTION
                 section.

SSTTDDIINN
       The standard input can be any type of file.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _t_r:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for the behavior of range expressions
                 and equivalence classes.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments) and the
                 behavior of character classes.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The _t_r output shall be identical to the input, with the exception of
       the specified transformations.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       The operands _s_t_r_i_n_g_1 and _s_t_r_i_n_g_2 (if specified) define two arrays of
       characters. The constructs in the following list can be used to specify
       characters or single-character collating elements. If any of the
       constructs result in multi-character collating elements, _t_r shall
       exclude, without a diagnostic, those multi-character elements from the
       resulting array.

       _c_h_a_r_a_c_t_e_r Any character not described by one of the conventions below
                 shall represent itself.

       \_o_c_t_a_l    Octal sequences can be used to represent characters with
                 specific coded values. An octal sequence shall consist of a
                 <backslash> followed by the longest sequence of one, two, or
                 three-octal-digit characters (01234567). The sequence shall
                 cause the value whose encoding is represented by the one,
                 two, or three-digit octal integer to be placed into the
                 array. Multi-byte characters require multiple, concatenated
                 escape sequences of this type, including the leading
                 <backslash> for each byte.

       \_c_h_a_r_a_c_t_e_r
                 The <backslash>-escape sequences in the Base Definitions
                 volume of POSIX.1‐2008, _T_a_b_l_e _5_-_1, _E_s_c_a_p_e _S_e_q_u_e_n_c_e_s _a_n_d
                 _A_s_s_o_c_i_a_t_e_d _A_c_t_i_o_n_s (''\\\\'', ''\\aa'', ''\\bb'', ''\\ff'', ''\\nn'', ''\\rr'', ''\\tt'',
                 ''\\vv'') shall be supported. The results of using any other
                 character, other than an octal digit, following the
                 <backslash> are unspecified. Also, if there is no character
                 following the <backslash>, the results are unspecified.

       _c−_c       In the POSIX locale, this construct shall represent the range
                 of collating elements between the range endpoints (as long as
                 neither endpoint is an octal sequence of the form \_o_c_t_a_l),
                 inclusive, as defined by the collation sequence. The
                 characters or collating elements in the range shall be placed
                 in the array in ascending collation sequence. If the second
                 endpoint precedes the starting endpoint in the collation
                 sequence, it is unspecified whether the range of collating
                 elements is empty, or this construct is treated as invalid.
                 In locales other than the POSIX locale, this construct has
                 unspecified behavior.

                 If either or both of the range endpoints are octal sequences
                 of the form \_o_c_t_a_l, this shall represent the range of
                 specific coded values between the two range endpoints,
                 inclusive.

       [:_c_l_a_s_s:] Represents all characters belonging to the defined character
                 class, as defined by the current setting of the _L_C___C_T_Y_P_E
                 locale category. The following character class names shall be
                 accepted when specified in _s_t_r_i_n_g_1:

                 aallnnuumm   bbllaannkk   ddiiggiitt   lloowweerr   ppuunncctt   uuppppeerr
                 aallpphhaa   ccnnttrrll   ggrraapphh   pprriinntt   ssppaaccee   xxddiiggiitt

                 In addition, character class expressions of the form [:_n_a_m_e:]
                 shall be recognized in those locales where the _n_a_m_e keyword
                 has been given a cchhaarrccllaassss definition in the _L_C___C_T_Y_P_E
                 category.

                 When both the −−dd and −−ss options are specified, any of the
                 character class names shall be accepted in _s_t_r_i_n_g_2.
                 Otherwise, only character class names lloowweerr or uuppppeerr are
                 valid in _s_t_r_i_n_g_2 and then only if the corresponding character
                 class (uuppppeerr and lloowweerr, respectively) is specified in the
                 same relative position in _s_t_r_i_n_g_1.  Such a specification
                 shall be interpreted as a request for case conversion. When
                 [:_l_o_w_e_r:] appears in _s_t_r_i_n_g_1 and [:_u_p_p_e_r:] appears in
                 _s_t_r_i_n_g_2, the arrays shall contain the characters from the
                 ttoouuppppeerr mapping in the _L_C___C_T_Y_P_E category of the current
                 locale. When [:_u_p_p_e_r:] appears in _s_t_r_i_n_g_1 and [:_l_o_w_e_r:]
                 appears in _s_t_r_i_n_g_2, the arrays shall contain the characters
                 from the ttoolloowweerr mapping in the _L_C___C_T_Y_P_E category of the
                 current locale. The first character from each mapping pair
                 shall be in the array for _s_t_r_i_n_g_1 and the second character
                 from each mapping pair shall be in the array for _s_t_r_i_n_g_2 in
                 the same relative position.

                 Except for case conversion, the characters specified by a
                 character class expression shall be placed in the array in an
                 unspecified order.

                 If the name specified for _c_l_a_s_s does not define a valid
                 character class in the current locale, the behavior is
                 undefined.

       [=_e_q_u_i_v=] Represents all characters or collating elements belonging to
                 the same equivalence class as _e_q_u_i_v, as defined by the
                 current setting of the _L_C___C_O_L_L_A_T_E locale category. An
                 equivalence class expression shall be allowed only in
                 _s_t_r_i_n_g_1, or in _s_t_r_i_n_g_2 when it is being used by the combined
                 −−dd and −−ss options. The characters belonging to the
                 equivalence class shall be placed in the array in an
                 unspecified order.

       [_x*_n]     Represents _n repeated occurrences of the character _x.
                 Because this expression is used to map multiple characters to
                 one, it is only valid when it occurs in _s_t_r_i_n_g_2.  If _n is
                 omitted or is zero, it shall be interpreted as large enough
                 to extend the _s_t_r_i_n_g_2-based sequence to the length of the
                 _s_t_r_i_n_g_1-based sequence. If _n has a leading zero, it shall be
                 interpreted as an octal value.  Otherwise, it shall be
                 interpreted as a decimal value.

       When the −−dd option is not specified:

        *  If _s_t_r_i_n_g_2 is present, each input character found in the array
           specified by _s_t_r_i_n_g_1 shall be replaced by the character in the same
           relative position in the array specified by _s_t_r_i_n_g_2.  If the array
           specified by _s_t_r_i_n_g_2 is shorter that the one specified by _s_t_r_i_n_g_1,
           or if a character occurs more than once in _s_t_r_i_n_g_1, the results are
           unspecified.

        *  If the −−CC option is specified, the complements of the characters
           specified by _s_t_r_i_n_g_1 (the set of all characters in the current
           character set, as defined by the current setting of _L_C___C_T_Y_P_E,
           except for those actually specified in the _s_t_r_i_n_g_1 operand) shall
           be placed in the array in ascending collation sequence, as defined
           by the current setting of _L_C___C_O_L_L_A_T_E.

        *  If the −−cc option is specified, the complement of the values
           specified by _s_t_r_i_n_g_1 shall be placed in the array in ascending
           order by binary value.

        *  Because the order in which characters specified by character class
           expressions or equivalence class expressions is undefined, such
           expressions should only be used if the intent is to map several
           characters into one. An exception is case conversion, as described
           previously.

       When the −−dd option is specified:

        *  Input characters found in the array specified by _s_t_r_i_n_g_1 shall be
           deleted.

        *  When the −−CC option is specified with −−dd, all characters except
           those specified by _s_t_r_i_n_g_1 shall be deleted. The contents of
           _s_t_r_i_n_g_2 are ignored, unless the −−ss option is also specified.

        *  When the −−cc option is specified with −−dd, all values except those
           specified by _s_t_r_i_n_g_1 shall be deleted. The contents of _s_t_r_i_n_g_2
           shall be ignored, unless the −−ss option is also specified.

        *  The same string cannot be used for both the −−dd and the −−ss option;
           when both options are specified, both _s_t_r_i_n_g_1 (used for deletion)
           and _s_t_r_i_n_g_2 (used for squeezing) shall be required.

       When the −−ss option is specified, after any deletions or translations
       have taken place, repeated sequences of the same character shall be
       replaced by one occurrence of the same character, if the character is
       found in the array specified by the last operand. If the last operand
       contains a character class, such as the following example:


           ttrr −−ss ''[[::ssppaaccee::]]''

       the last operand's array shall contain all of the characters in that
       character class. However, in a case conversion, as described
       previously, such as:


           ttrr −−ss ''[[::uuppppeerr::]]'' ''[[::lloowweerr::]]''

       the last operand's array shall contain only those characters defined as
       the second characters in each of the ttoouuppppeerr or ttoolloowweerr character
       pairs, as appropriate.

       An empty string used for _s_t_r_i_n_g_1 or _s_t_r_i_n_g_2 produces undefined results.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input was processed successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       If necessary, _s_t_r_i_n_g_1 and _s_t_r_i_n_g_2 can be quoted to avoid pattern
       matching by the shell.

       If an ordinary digit (representing itself) is to follow an octal
       sequence, the octal sequence must use the full three digits to avoid
       ambiguity.

       When _s_t_r_i_n_g_2 is shorter than _s_t_r_i_n_g_1, a difference results between
       historical System V and BSD systems. A BSD system pads _s_t_r_i_n_g_2 with the
       last character found in _s_t_r_i_n_g_2.  Thus, it is possible to do the
       following:


           ttrr 00112233445566778899 dd

       which would translate all digits to the letter ''dd''.  Since this area is
       specifically unspecified in this volume of POSIX.1‐2008, both the BSD
       and System V behaviors are allowed, but a conforming application cannot
       rely on the BSD behavior. It would have to code the example in the
       following way:


           ttrr 00112233445566778899 ''[[dd**]]''

       It should be noted that, despite similarities in appearance, the string
       operands used by _t_r are not regular expressions.

       Unlike some historical implementations, this definition of the _t_r
       utility correctly processes NUL characters in its input stream. NUL
       characters can be stripped by using:


           ttrr −−dd ''\\000000''

EEXXAAMMPPLLEESS
        1. The following example creates a list of all words in ffiillee11 one per
           line in ffiillee22, where a word is taken to be a maximal string of
           letters.


               ttrr −−ccss ""[[::aallpphhaa::]]"" ""[[\\nn**]]"" <<ffiillee11 >>ffiillee22

        2. The next example translates all lowercase characters in ffiillee11 to
           uppercase and writes the results to standard output.


               ttrr ""[[::lloowweerr::]]"" ""[[::uuppppeerr::]]"" <<ffiillee11

        3. This example uses an equivalence class to identify accented
           variants of the base character ''ee'' in ffiillee11, which are stripped of
           diacritical marks and written to ffiillee22.


               ttrr ""[[==ee==]]"" ""[[ee**]]"" <<ffiillee11 >>ffiillee22

RRAATTIIOONNAALLEE
       In some early proposals, an explicit option −−nn was added to disable the
       historical behavior of stripping NUL characters from the input. It was
       considered that automatically stripping NUL characters from the input
       was not correct functionality.  However, the removal of −−nn in a later
       proposal does not remove the requirement that _t_r correctly process NUL
       characters in its input stream. NUL characters can be stripped by using
       _t_r −−dd '\000'.

       Historical implementations of _t_r differ widely in syntax and behavior.
       For example, the BSD version has not needed the bracket characters for
       the repetition sequence. The _t_r utility syntax is based more closely on
       the System V and XPG3 model while attempting to accommodate historical
       BSD implementations. In the case of the short _s_t_r_i_n_g_2 padding, the
       decision was to unspecify the behavior and preserve System V and XPG3
       scripts, which might find difficulty with the BSD method.  The
       assumption was made that BSD users of _t_r have to make accommodations to
       meet the syntax defined here. Since it is possible to use the
       repetition sequence to duplicate the desired behavior, whereas there is
       no simple way to achieve the System V method, this was the correct, if
       not desirable, approach.

       The use of octal values to specify control characters, while having
       historical precedents, is not portable. The introduction of escape
       sequences for control characters should provide the necessary
       portability. It is recognized that this may cause some historical
       scripts to break.

       An early proposal included support for multi-character collating
       elements.  It was pointed out that, while _t_r does employ some
       syntactical elements from REs, the aim of _t_r is quite different;
       ranges, for example, do not have a similar meaning (``any of the chars
       in the range matches'', _v_e_r_s_u_s ``translate each character in the range
       to the output counterpart''). As a result, the previously included
       support for multi-character collating elements has been removed. What
       remains are ranges in current collation order (to support, for example,
       accented characters), character classes, and equivalence classes.

       In XPG3 the [:_c_l_a_s_s:] and [=_e_q_u_i_v=] conventions are shown with double
       brackets, as in RE syntax. However, _t_r does not implement RE
       principles; it just borrows part of the syntax.  Consequently,
       [:_c_l_a_s_s:] and [=_e_q_u_i_v=] should be regarded as syntactical elements on a
       par with [_x*_n], which is not an RE bracket expression.

       The standard developers will consider changes to _t_r that allow it to
       translate characters between different character encodings, or they
       will consider providing a new utility to accomplish this.

       On historical System V systems, a range expression requires enclosing
       square-brackets, such as:


           ttrr ''[[aa--zz]]'' ''[[AA--ZZ]]''

       However, BSD-based systems did not require the brackets, and this
       convention is used here to avoid breaking large numbers of BSD scripts:


           ttrr aa--zz AA--ZZ

       The preceding System V script will continue to work because the
       brackets, treated as regular characters, are translated to themselves.
       However, any System V script that relied on ""aa‐‐zz"" representing the
       three characters ''aa'', ''−−'', and ''zz'' have to be rewritten as ""aazz−−"".

       The ISO POSIX‐2:1993 standard had a −−cc option that behaved similarly to
       the −−CC option, but did not supply functionality equivalent to the −−cc
       option specified in POSIX.1‐2008. This meant that historical practice
       of being able to specify _t_r −−ccdd\000−\177 (which would delete all bytes
       with the top bit set) would have no effect because, in the C locale,
       bytes with the values octal 200 to octal 377 are not characters.

       The earlier version also said that octal sequences referred to
       collating elements and could be placed adjacent to each other to
       specify multi-byte characters. However, it was noted that this caused
       ambiguities because _t_r would not be able to tell whether adjacent octal
       sequences were intending to specify multi-byte characters or multiple
       single byte characters. POSIX.1‐2008 specifies that octal sequences
       always refer to single byte binary values when used to specify an
       endpoint of a range of collating elements.

       Earlier versions of this standard allowed for implementations with
       bytes other than eight bits, but this has been modified in this
       version.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _s_e_d

       The Base Definitions volume of POSIX.1‐2008, _T_a_b_l_e _5_-_1, _E_s_c_a_p_e
       _S_e_q_u_e_n_c_e_s _a_n_d _A_s_s_o_c_i_a_t_e_d _A_c_t_i_o_n_s, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s,
       _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                               TR(1P)
