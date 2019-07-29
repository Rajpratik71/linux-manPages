PRINTF(1P)                 POSIX Programmer's Manual                PRINTF(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       printf — write formatted output

SSYYNNOOPPSSIISS
       printf _f_o_r_m_a_t [[_a_r_g_u_m_e_n_t...]]

DDEESSCCRRIIPPTTIIOONN
       The _p_r_i_n_t_f utility shall write formatted operands to the standard
       output. The _a_r_g_u_m_e_n_t operands shall be formatted under control of the
       _f_o_r_m_a_t operand.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_o_r_m_a_t    A string describing the format to use to write the remaining
                 operands.  See the EXTENDED DESCRIPTION section.

       _a_r_g_u_m_e_n_t  The strings to be written to standard output, under the
                 control of _f_o_r_m_a_t.  See the EXTENDED DESCRIPTION section.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _p_r_i_n_t_f:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s the precedence of internationalization variables
                 used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _L_C___N_U_M_E_R_I_C
                 Determine the locale for numeric formatting. It shall affect
                 the format of numbers written using the ee, EE, ff, gg, and GG
                 conversion specifier characters (if supported).

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       See the EXTENDED DESCRIPTION section.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       The _f_o_r_m_a_t operand shall be used as the _f_o_r_m_a_t string described in the
       Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t
       _N_o_t_a_t_i_o_n with the following exceptions:

        1. A <space> in the format string, in any context other than a flag of
           a conversion specification, shall be treated as an ordinary
           character that is copied to the output.

        2. A ''' character in the format string shall be treated as a '''
           character, not as a <space>.

        3. In addition to the escape sequences shown in the Base Definitions
           volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t _N_o_t_a_t_i_o_n (''\\\\'',
           ''\\aa'', ''\\bb'', ''\\ff'', ''\\nn'', ''\\rr'', ''\\tt'', ''\\vv''), ""\\dddddd"", where _d_d_d is a
           one, two, or three-digit octal number, shall be written as a byte
           with the numeric value specified by the octal number.

        4. The implementation shall not precede or follow output from the dd or
           uu conversion specifiers with <blank> characters not specified by
           the _f_o_r_m_a_t operand.

        5. The implementation shall not precede output from the oo conversion
           specifier with zeros not specified by the _f_o_r_m_a_t operand.

        6. The aa, AA, ee, EE, ff, FF, gg, and GG conversion specifiers need not be
           supported.

        7. An additional conversion specifier character, bb, shall be supported
           as follows. The argument shall be taken to be a string that may
           contain <backslash>-escape sequences. The following
           <backslash>-escape sequences shall be supported:

           --  The escape sequences listed in the Base Definitions volume of
               POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t _N_o_t_a_t_i_o_n (''\\\\'', ''\\aa'',
               ''\\bb'', ''\\ff'', ''\\nn'', ''\\rr'', ''\\tt'', ''\\vv''), which shall be converted
               to the characters they represent

           --  ""\\00dddddd"", where _d_d_d is a zero, one, two, or three-digit octal
               number that shall be converted to a byte with the numeric value
               specified by the octal number

           --  ''\\cc'', which shall not be written and shall cause _p_r_i_n_t_f to
               ignore any remaining characters in the string operand
               containing it, any remaining string operands, and any
               additional characters in the _f_o_r_m_a_t operand

           The interpretation of a <backslash> followed by any other sequence
           of characters is unspecified.

           Bytes from the converted string shall be written until the end of
           the string or the number of bytes indicated by the precision
           specification is reached. If the precision is omitted, it shall be
           taken to be infinite, so all bytes up to the end of the converted
           string shall be written.

        8. For each conversion specification that consumes an argument, the
           next argument operand shall be evaluated and converted to the
           appropriate type for the conversion as specified below.

        9. The _f_o_r_m_a_t operand shall be reused as often as necessary to satisfy
           the argument operands. Any extra cc or ss conversion specifiers shall
           be evaluated as if a null string argument were supplied; other
           extra conversion specifications shall be evaluated as if a zero
           argument were supplied. If the _f_o_r_m_a_t operand contains no
           conversion specifications and _a_r_g_u_m_e_n_t operands are present, the
           results are unspecified.

       10. If a character sequence in the _f_o_r_m_a_t operand begins with a ''%%''
           character, but does not form a valid conversion specification, the
           behavior is unspecified.

       11. The argument to the cc conversion specifier can be a string
           containing zero or more bytes. If it contains one or more bytes,
           the first byte shall be written and any additional bytes shall be
           ignored. If the argument is an empty string, it is unspecified
           whether nothing is written or a null byte is written.

       The _a_r_g_u_m_e_n_t operands shall be treated as strings if the corresponding
       conversion specifier is bb, cc, or ss, and shall be evaluated as if by the
       _s_t_r_t_o_d() function if the corresponding conversion specifier is aa, AA, ee,
       EE, ff, FF, gg, or GG.  Otherwise, they shall be evaluated as unsuffixed C
       integer constants, as described by the ISO C standard, with the
       following extensions:

        *  A leading <plus-sign> or minus-sign shall be allowed.

        *  If the leading character is a single-quote or double-quote, the
           value shall be the numeric value in the underlying codeset of the
           character following the single-quote or double-quote.

        *  Suffixed integer constants may be allowed.

       If an argument operand cannot be completely converted into an internal
       value appropriate to the corresponding conversion specification, a
       diagnostic message shall be written to standard error and the utility
       shall not exit with a zero exit status, but shall continue processing
       any remaining operands and shall write the value accumulated at the
       time the error was detected to standard output.

       It is not considered an error if an argument operand is not completely
       used for a cc or ss conversion.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The floating-point formatting conversion specifications of _p_r_i_n_t_f() are
       not required because all arithmetic in the shell is integer arithmetic.
       The _a_w_k utility performs floating-point calculations and provides its
       own pprriinnttff function. The _b_c utility can perform arbitrary-precision
       floating-point arithmetic, but does not provide extensive formatting
       capabilities. (This _p_r_i_n_t_f utility cannot really be used to format _b_c
       output; it does not support arbitrary precision.) Implementations are
       encouraged to support the floating-point conversions as an extension.

       Note that this _p_r_i_n_t_f utility, like the _p_r_i_n_t_f() function defined in
       the System Interfaces volume of POSIX.1‐2008 on which it is based,
       makes no special provision for dealing with multi-byte characters when
       using the %%cc conversion specification or when a precision is specified
       in a %%bb or %%ss conversion specification. Applications should be
       extremely cautious using either of these features when there are multi-
       byte characters in the character set.

       No provision is made in this volume of POSIX.1‐2008 which allows field
       widths and precisions to be specified as ''**'' since the ''**'' can be
       replaced directly in the _f_o_r_m_a_t operand using shell variable
       substitution. Implementations can also provide this feature as an
       extension if they so choose.

       Hexadecimal character constants as defined in the ISO C standard are
       not recognized in the _f_o_r_m_a_t operand because there is no consistent way
       to detect the end of the constant. Octal character constants are
       limited to, at most, three octal digits, but hexadecimal character
       constants are only terminated by a non-hex-digit character. In the
       ISO C standard, the ""####"" concatenation operator can be used to
       terminate a constant and follow it with a hexadecimal character to be
       written. In the shell, concatenation occurs before the _p_r_i_n_t_f utility
       has a chance to parse the end of the hexadecimal constant.

       The %%bb conversion specification is not part of the ISO C standard; it
       has been added here as a portable way to process <backslash>-escapes
       expanded in string operands as provided by the _e_c_h_o utility. See also
       the APPLICATION USAGE section of _e_c_h_o for ways to use _p_r_i_n_t_f as a
       replacement for all of the traditional versions of the _e_c_h_o utility.

       If an argument cannot be parsed correctly for the corresponding
       conversion specification, the _p_r_i_n_t_f utility is required to report an
       error. Thus, overflow and extraneous characters at the end of an
       argument being used for a numeric conversion shall be reported as
       errors.

EEXXAAMMPPLLEESS
       To alert the user and then print and read a series of prompts:


           pprriinnttff ""\\aaPPlleeaassee ffiillll iinn tthhee ffoolllloowwiinngg:: \\nnNNaammee:: ""
           rreeaadd nnaammee
           pprriinnttff ""PPhhoonnee nnuummbbeerr:: ""
           rreeaadd pphhoonnee

       To read out a list of right and wrong answers from a file, calculate
       the percentage correctly, and print them out. The numbers are right-
       justified and separated by a single <tab>.  The percentage is written
       to one decimal place of accuracy:


           wwhhiillee rreeaadd rriigghhtt wwrroonngg ;; ddoo
               ppeerrcceenntt==$$((eecchhoo ""ssccaallee==11;;(($$rriigghhtt**110000))//(($$rriigghhtt++$$wwrroonngg))"" || bbcc))
               pprriinnttff ""%%22dd rriigghhtt\\tt%%22dd wwrroonngg\\tt((%%ss%%%%))\\nn"" \\
                   $$rriigghhtt $$wwrroonngg $$ppeerrcceenntt
           ddoonnee << ddaattaabbaassee__ffiillee

       The command:


           pprriinnttff ""%%55dd%%44dd\\nn"" 11 2211 332211 44332211 5544332211

       produces:


               11  2211
             33221144332211
           5544332211   00

       Note that the _f_o_r_m_a_t operand is used three times to print all of the
       given strings and that a ''00'' was supplied by _p_r_i_n_t_f to satisfy the last
       %%44dd conversion specification.

       The _p_r_i_n_t_f utility is required to notify the user when conversion
       errors are detected while producing numeric output; thus, the following
       results would be expected on an implementation with 32-bit twos-
       complement integers when %%dd is specified as the _f_o_r_m_a_t operand:

       +------------+-------------+-------------------------------------------+
       |            |  SSttaannddaarrdd   |                                           |
       | AArrgguummeenntt   |   OOuuttppuutt    |             DDiiaaggnnoossttiicc OOuuttppuutt             |
       +------------+-------------+-------------------------------------------+
       |5a          | 5           | printf: "5a" not completely converted     |
       |9999999999  | 2147483647  | printf: "9999999999" arithmetic overflow  |
       |−9999999999 | −2147483648 | printf: "−9999999999" arithmetic overflow |
       |ABC         | 0           | printf: "ABC" expected numeric value      |
       +------------+-------------+-------------------------------------------+
       The diagnostic message format is not specified, but these examples
       convey the type of information that should be reported. Note that the
       value shown on standard output is what would be expected as the return
       value from the _s_t_r_t_o_l() function as defined in the System Interfaces
       volume of POSIX.1‐2008. A similar correspondence exists between %%uu and
       _s_t_r_t_o_u_l() and %%ee, %%ff, and %%gg (if the implementation supports floating-
       point conversions) and _s_t_r_t_o_d().

       In a locale using the ISO/IEC 646:1991 standard as the underlying
       codeset, the command:


           pprriinnttff ""%%dd\\nn"" 33 ++33 −−33 \\''33 \\""++33 ""''−−33""

       produces:

       3     Numeric value of constant 3

       3     Numeric value of constant 3

       −3    Numeric value of constant −3

       51    Numeric value of the character ''33'' in the ISO/IEC 646:1991
             standard codeset

       43    Numeric value of the character ''++'' in the ISO/IEC 646:1991
             standard codeset

       45    Numeric value of the character ''−−'' in the ISO/IEC 646:1991
             standard codeset

       Note that in a locale with multi-byte characters, the value of a
       character is intended to be the value of the equivalent of the wwcchhaarr__tt
       representation of the character as described in the System Interfaces
       volume of POSIX.1‐2008.

RRAATTIIOONNAALLEE
       The _p_r_i_n_t_f utility was added to provide functionality that has
       historically been provided by _e_c_h_o.  However, due to irreconcilable
       differences in the various versions of _e_c_h_o extant, the version has few
       special features, leaving those to this new _p_r_i_n_t_f utility, which is
       based on one in the Ninth Edition system.

       The EXTENDED DESCRIPTION section almost exactly matches the _p_r_i_n_t_f()
       function in the ISO C standard, although it is described in terms of
       the file format notation in the Base Definitions volume of
       POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t _N_o_t_a_t_i_o_n.

       Earlier versions of this standard specified that arguments for all
       conversions other than bb, cc, and ss were evaluated in the same way (as C
       constants, but with stated exceptions). For implementations supporting
       the floating-point conversions it was not clear whether integer
       conversions need only accept integer constants and floating-point
       conversions need only accept floating-point constants, or whether both
       types of conversions should accept both types of constants. Also by not
       distinguishing between them, the requirement relating to a leading
       single-quote or double-quote applied to floating-point conversions even
       though this provided no useful functionality to applications that was
       not already available through the integer conversions. The current
       standard clarifies the situation by specifying that the arguments for
       floating-point conversions are evaluated as if by _s_t_r_t_o_d(), and the
       arguments for integer conversions are evaluated as C integer constants,
       with the special treatment of leading single-quote and double-quote
       applying only to integer conversions.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _a_w_k, _b_c, _e_c_h_o

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t
       _N_o_t_a_t_i_o_n, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s

       The System Interfaces volume of POSIX.1‐2008, _f_p_r_i_n_t_f(), _s_t_r_t_o_d()

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



IEEE/The Open Group                  2013                           PRINTF(1P)
