SED(1P)                    POSIX Programmer's Manual                   SED(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       sed — stream editor

SSYYNNOOPPSSIISS
       sed [[−n]] _s_c_r_i_p_t [[_f_i_l_e...]]

       sed [[−n]] −e _s_c_r_i_p_t [[−e _s_c_r_i_p_t]]... [[−f _s_c_r_i_p_t___f_i_l_e]]... [[_f_i_l_e...]]

       sed [[−n]] [[−e _s_c_r_i_p_t]]... −f _s_c_r_i_p_t___f_i_l_e [[−f _s_c_r_i_p_t___f_i_l_e]]... [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _s_e_d utility is a stream editor that shall read one or more text
       files, make editing changes according to a script of editing commands,
       and write the results to standard output. The script shall be obtained
       from either the _s_c_r_i_p_t operand string or a combination of the option-
       arguments from the −−ee _s_c_r_i_p_t and −−ff _s_c_r_i_p_t___f_i_l_e options.

OOPPTTIIOONNSS
       The _s_e_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that the
       order of presentation of the −−ee and −−ff options is significant.

       The following options shall be supported:

       −−ee  _s_c_r_i_p_t Add the editing commands specified by the _s_c_r_i_p_t option-
                 argument to the end of the script of editing commands.

       −−ff  _s_c_r_i_p_t___f_i_l_e
                 Add the editing commands in the file _s_c_r_i_p_t___f_i_l_e to the end
                 of the script of editing commands.

       −−nn        Suppress the default output (in which each line, after it is
                 examined for editing, is written to standard output). Only
                 lines explicitly selected for output are written.

       If any −−ee or −−ff options are specified, the script of editing commands
       shall initially be empty. The commands specified by each −−ee or −−ff
       option shall be added to the script in the order specified. When each
       addition is made, if the previous addition (if any) was from a −−ee
       option, a <newline> shall be inserted before the new addition. The
       resulting script shall have the same properties as the _s_c_r_i_p_t operand,
       described in the OPERANDS section.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e      A pathname of a file whose contents are read and edited. If
                 multiple _f_i_l_e operands are specified, the named files shall
                 be read in the order specified and the concatenation shall be
                 edited. If no _f_i_l_e operands are specified, the standard input
                 shall be used.

       _s_c_r_i_p_t    A string to be used as the script of editing commands. The
                 application shall not present a _s_c_r_i_p_t that violates the
                 restrictions of a text file except that the final character
                 need not be a <newline>.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operands are specified, and
       shall be used if a _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be text files. The _s_c_r_i_p_t___f_i_l_es named by the −−ff
       option shall consist of editing commands.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _s_e_d:

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
                 files), and the behavior of character classes within regular
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
       The input files shall be written to standard output, with the editing
       commands specified in the script applied. If the −−nn option is
       specified, only those input lines selected by the script shall be
       written to standard output.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       The output files shall be text files whose formats are dependent on the
       editing commands given.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       The _s_c_r_i_p_t shall consist of editing commands of the following form:


           [[_a_d_d_r_e_s_s[[,_a_d_d_r_e_s_s]]]]_f_u_n_c_t_i_o_n

       where _f_u_n_c_t_i_o_n represents a single-character command verb from the list
       in _E_d_i_t_i_n_g _C_o_m_m_a_n_d_s _i_n _s_e_d, followed by any applicable arguments.

       The command can be preceded by <blank> characters and/or <semicolon>
       characters. The function can be preceded by <blank> characters. These
       optional characters shall have no effect.

       In default operation, _s_e_d cyclically shall append a line of input, less
       its terminating <newline> character, into the pattern space. Reading
       from input shall be skipped if a <newline> was in the pattern space
       prior to a DD command ending the previous cycle. The _s_e_d utility shall
       then apply in sequence all commands whose addresses select that pattern
       space, until a command starts the next cycle or quits. If no commands
       explicitly started a new cycle, then at the end of the script the
       pattern space shall be copied to standard output (except when −−nn is
       specified) and the pattern space shall be deleted. Whenever the pattern
       space is written to standard output or a named file, _s_e_d shall
       immediately follow it with a <newline>.

       Some of the editing commands use a hold space to save all or part of
       the pattern space for subsequent retrieval. The pattern and hold spaces
       shall each be able to hold at least 8192 bytes.

   AAddddrreesssseess iinn sseedd
       An address is either a decimal number that counts input lines
       cumulatively across files, a ''$$'' character that addresses the last line
       of input, or a context address (which consists of a BRE, as described
       in _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s _i_n _s_e_d, preceded and followed by a delimiter,
       usually a <slash>).

       An editing command with no addresses shall select every pattern space.

       An editing command with one address shall select each pattern space
       that matches the address.

       An editing command with two addresses shall select the inclusive range
       from the first pattern space that matches the first address through the
       next pattern space that matches the second. (If the second address is a
       number less than or equal to the line number first selected, only one
       line shall be selected.) Starting at the first line following the
       selected range, _s_e_d shall look again for the first address. Thereafter,
       the process shall be repeated. Omitting either or both of the address
       components in the following form produces undefined results:


           [[_a_d_d_r_e_s_s[[,_a_d_d_r_e_s_s]]]]

   RReegguullaarr EExxpprreessssiioonnss iinn sseedd
       The _s_e_d utility shall support the BREs described in the Base
       Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c _R_e_g_u_l_a_r
       _E_x_p_r_e_s_s_i_o_n_s, with the following additions:

        *  In a context address, the construction ""\\ccBBRREEcc"", where _c is any
           character other than <backslash> or <newline>, shall be identical
           to ""//BBRREE//"".  If the character designated by _c appears following a
           <backslash>, then it shall be considered to be that literal
           character, which shall not terminate the BRE. For example, in the
           context address ""\\xxaabbcc\\xxddeeffxx"", the second _x stands for itself, so
           that the BRE is ""aabbccxxddeeff"".

        *  The escape sequence ''\\nn'' shall match a <newline> embedded in the
           pattern space. A literal <newline> shall not be used in the BRE of
           a context address or in the substitute function.

        *  If an RE is empty (that is, no pattern is specified) _s_e_d shall
           behave as if the last RE used in the last command applied (either
           as an address or as part of a substitute command) was specified.

   EEddiittiinngg CCoommmmaannddss iinn sseedd
       In the following list of editing commands, the maximum number of
       permissible addresses for each function is indicated by [_0_a_d_d_r],
       [_1_a_d_d_r], or [_2_a_d_d_r], representing zero, one, or two addresses.

       The argument _t_e_x_t shall consist of one or more lines. Each embedded
       <newline> in the text shall be preceded by a <backslash>.  Other
       <backslash> characters in text shall be removed, and the following
       character shall be treated literally.

       The rr and ww command verbs, and the _w flag to the ss command, take an
       _r_f_i_l_e (or _w_f_i_l_e) parameter, separated from the command verb letter or
       flag by one or more <blank> characters; implementations may allow zero
       separation as an extension.

       The argument _r_f_i_l_e or the argument _w_f_i_l_e shall terminate the editing
       command. Each _w_f_i_l_e shall be created before processing begins.
       Implementations shall support at least ten _w_f_i_l_e arguments in the
       script; the actual number (greater than or equal to 10) that is
       supported by the implementation is unspecified. The use of the _w_f_i_l_e
       parameter shall cause that file to be initially created, if it does not
       exist, or shall replace the contents of an existing file.

       The bb, rr, ss, tt, ww, yy, and :: command verbs shall accept additional
       arguments. The following synopses indicate which arguments shall be
       separated from the command verbs by a single <space>.

       The aa and rr commands schedule text for later output. The text specified
       for the aa command, and the contents of the file specified for the rr
       command, shall be written to standard output just before the next
       attempt to fetch a line of input when executing the NN or nn commands, or
       when reaching the end of the script. If written when reaching the end
       of the script, and the −−nn option was not specified, the text shall be
       written after copying the pattern space to standard output. The
       contents of the file specified for the rr command shall be as of the
       time the output is written, not the time the rr command is applied. The
       text shall be output in the order in which the aa and rr commands were
       applied to the input.

       Command verbs other than {{, aa, bb, cc, ii, rr, tt, ww, ::, and ## can be
       followed by a <semicolon>, optional <blank> characters, and another
       command verb. However, when the ss command verb is used with the _w flag,
       following it with another command in this manner produces undefined
       results.

       A function can be preceded by one or more ''!!'' characters, in which case
       the function shall be applied if the addresses do not select the
       pattern space. Zero or more <blank> characters shall be accepted before
       the first ''!!'' character. It is unspecified whether <blank> characters
       can follow a ''!!'' character, and conforming applications shall not
       follow a ''!!'' character with <blank> characters.

       [[_2_a_d_d_r]]  {{_e_d_i_t_i_n_g _c_o_m_m_a_n_d

       _e_d_i_t_i_n_g _c_o_m_m_a_n_d

       ...

       }}         Execute a list of _s_e_d editing commands only when the pattern
                 space is selected. The list of _s_e_d editing commands shall be
                 surrounded by braces and separated by <newline> characters,
                 and conform to the following rules. The braces can be
                 preceded or followed by <blank> characters. The editing
                 commands can be preceded by <blank> characters, but shall not
                 be followed by <blank> characters. The <right-brace> shall be
                 preceded by a <newline> and can be preceded or followed by
                 <blank> characters.

       [[_1_a_d_d_r]]aa\\

       _t_e_x_t      Write text to standard output as described previously.

       [[_2_a_d_d_r]]bb  [[_l_a_b_e_l]]
                 Branch to the :: function bearing the _l_a_b_e_l.  If _l_a_b_e_l is not
                 specified, branch to the end of the script. The
                 implementation shall support _l_a_b_e_ls recognized as unique up
                 to at least 8 characters; the actual length (greater than or
                 equal to 8) that shall be supported by the implementation is
                 unspecified. It is unspecified whether exceeding a label
                 length causes an error or a silent truncation.

       [[_2_a_d_d_r]]cc\\

       _t_e_x_t      Delete the pattern space. With a 0 or 1 address or at the end
                 of a 2-address range, place _t_e_x_t on the output and start the
                 next cycle.

       [[_2_a_d_d_r]]dd  Delete the pattern space and start the next cycle.

       [[_2_a_d_d_r]]DD  If the pattern space contains no <newline>, delete the
                 pattern space and start a normal new cycle as if the dd
                 command was issued. Otherwise, delete the initial segment of
                 the pattern space through the first <newline>, and start the
                 next cycle with the resultant pattern space and without
                 reading any new input.

       [[_2_a_d_d_r]]gg  Replace the contents of the pattern space by the contents of
                 the hold space.

       [[_2_a_d_d_r]]GG  Append to the pattern space a <newline> followed by the
                 contents of the hold space.

       [[_2_a_d_d_r]]hh  Replace the contents of the hold space with the contents of
                 the pattern space.

       [[_2_a_d_d_r]]HH  Append to the hold space a <newline> followed by the contents
                 of the pattern space.

       [[_1_a_d_d_r]]ii\\

       _t_e_x_t      Write _t_e_x_t to standard output.

       [[_2_a_d_d_r]]ll  (The letter ell.) Write the pattern space to standard output
                 in a visually unambiguous form. The characters listed in the
                 Base Definitions volume of POSIX.1‐2008, _T_a_b_l_e _5_-_1, _E_s_c_a_p_e
                 _S_e_q_u_e_n_c_e_s _a_n_d _A_s_s_o_c_i_a_t_e_d _A_c_t_i_o_n_s (''\\\\'', ''\\aa'', ''\\bb'', ''\\ff'',
                 ''\\rr'', ''\\tt'', ''\\vv'') shall be written as the corresponding
                 escape sequence; the ''\\nn'' in that table is not applicable.
                 Non-printable characters not in that table shall be written
                 as one three-digit octal number (with a preceding
                 <backslash>) for each byte in the character (most significant
                 byte first).

                 Long lines shall be folded, with the point of folding
                 indicated by writing a <backslash> followed by a <newline>;
                 the length at which folding occurs is unspecified, but should
                 be appropriate for the output device. The end of each line
                 shall be marked with a ''$$''.

       [[_2_a_d_d_r]]nn  Write the pattern space to standard output if the default
                 output has not been suppressed, and replace the pattern space
                 with the next line of input, less its terminating <newline>.

                 If no next line of input is available, the nn command verb
                 shall branch to the end of the script and quit without
                 starting a new cycle.

       [[_2_a_d_d_r]]NN  Append the next line of input, less its terminating
                 <newline>, to the pattern space, using an embedded <newline>
                 to separate the appended material from the original material.
                 Note that the current line number changes.

                 If no next line of input is available, the NN command verb
                 shall branch to the end of the script and quit without
                 starting a new cycle or copying the pattern space to standard
                 output.

       [[_2_a_d_d_r]]pp  Write the pattern space to standard output.

       [[_2_a_d_d_r]]PP  Write the pattern space, up to the first <newline>, to
                 standard output.

       [[_1_a_d_d_r]]qq  Branch to the end of the script and quit without starting a
                 new cycle.

       [[_1_a_d_d_r]]rr  _r_f_i_l_e
                 Copy the contents of _r_f_i_l_e to standard output as described
                 previously. If _r_f_i_l_e does not exist or cannot be read, it
                 shall be treated as if it were an empty file, causing no
                 error condition.

       [[_2_a_d_d_r]]ss//_B_R_E//_r_e_p_l_a_c_e_m_e_n_t//_f_l_a_g_s
                 Substitute the replacement string for instances of the BRE in
                 the pattern space. Any character other than <backslash> or
                 <newline> can be used instead of a <slash> to delimit the BRE
                 and the replacement. Within the BRE and the replacement, the
                 BRE delimiter itself can be used as a literal character if it
                 is preceded by a <backslash>.

                 The replacement string shall be scanned from beginning to
                 end. An <ampersand> (''&&'') appearing in the replacement shall
                 be replaced by the string matching the BRE. The special
                 meaning of ''&&'' in this context can be suppressed by preceding
                 it by a <backslash>.  The characters "\_n_", where _n is a
                 digit, shall be replaced by the text matched by the
                 corresponding back-reference expression. If the corresponding
                 back-reference expression does not match, then the characters
                 "\_n_" shall be replaced by the empty string. The special
                 meaning of "\_n_" where _n is a digit in this context, can be
                 suppressed by preceding it by a <backslash>.  For each other
                 <backslash> encountered, the following character shall lose
                 its special meaning (if any). The meaning of a <backslash>
                 immediately followed by any character other than ''&&'',
                 <backslash>, a digit, or the delimiter character used for
                 this command, is unspecified.

                 A line can be split by substituting a <newline> into it. The
                 application shall escape the <newline> in the replacement by
                 preceding it by a <backslash>.  A substitution shall be
                 considered to have been performed even if the replacement
                 string is identical to the string that it replaces. Any
                 <backslash> used to alter the default meaning of a subsequent
                 character shall be discarded from the BRE or the replacement
                 before evaluating the BRE or using the replacement.

                 The value of _f_l_a_g_s shall be zero or more of:

                 _n         Substitute for the _nth occurrence only of the BRE
                           found within the pattern space.

                 gg         Globally substitute for all non-overlapping
                           instances of the BRE rather than just the first
                           one. If both gg and _n are specified, the results are
                           unspecified.

                 pp         Write the pattern space to standard output if a
                           replacement was made.

                 ww  _w_f_i_l_e   Write. Append the pattern space to _w_f_i_l_e if a
                           replacement was made. A conforming application
                           shall precede the _w_f_i_l_e argument with one or more
                           <blank> characters. If the ww flag is not the last
                           flag value given in a concatenation of multiple
                           flag values, the results are undefined.

       [[_2_a_d_d_r]]tt  [[_l_a_b_e_l]]
                 Test. Branch to the :: command verb bearing the _l_a_b_e_l if any
                 substitutions have been made since the most recent reading of
                 an input line or execution of a tt.  If _l_a_b_e_l is not
                 specified, branch to the end of the script.

       [[_2_a_d_d_r]]ww  _w_f_i_l_e
                 Append (write) the pattern space to _w_f_i_l_e.

       [[_2_a_d_d_r]]xx  Exchange the contents of the pattern and hold spaces.

       [[_2_a_d_d_r]]yy//_s_t_r_i_n_g_1//_s_t_r_i_n_g_2//
                 Replace all occurrences of characters in _s_t_r_i_n_g_1 with the
                 corresponding characters in _s_t_r_i_n_g_2.  If a <backslash>
                 followed by an ''nn'' appear in _s_t_r_i_n_g_1 or _s_t_r_i_n_g_2, the two
                 characters shall be handled as a single <newline>.  If the
                 number of characters in _s_t_r_i_n_g_1 and _s_t_r_i_n_g_2 are not equal, or
                 if any of the characters in _s_t_r_i_n_g_1 appear more than once,
                 the results are undefined. Any character other than
                 <backslash> or <newline> can be used instead of <slash> to
                 delimit the strings. If the delimiter is not ''nn'', within
                 _s_t_r_i_n_g_1 and _s_t_r_i_n_g_2, the delimiter itself can be used as a
                 literal character if it is preceded by a <backslash>.  If a
                 <backslash> character is immediately followed by a
                 <backslash> character in _s_t_r_i_n_g_1 or _s_t_r_i_n_g_2, the two
                 <backslash> characters shall be counted as a single literal
                 <backslash> character. The meaning of a <backslash> followed
                 by any character that is not ''nn'', a <backslash>, or the
                 delimiter character is undefined.

       [[_0_a_d_d_r]]::_l_a_b_e_l
                 Do nothing. This command bears a _l_a_b_e_l to which the bb and tt
                 commands branch.

       [[_1_a_d_d_r]]==  Write the following to standard output:


                     ""%%dd\\nn"",, <<_c_u_r_r_e_n_t _l_i_n_e _n_u_m_b_e_r>

       [[_0_a_d_d_r]]   Ignore this empty command.

       [[_0_a_d_d_r]]##  Ignore the ''##'' and the remainder of the line (treat them as a
                 comment), with the single exception that if the first two
                 characters in the script are ""##nn"", the default output shall
                 be suppressed; this shall be the equivalent of specifying −−nn
                 on the command line.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Regular expressions match entire strings, not just individual lines,
       but a <newline> is matched by ''\\nn'' in a _s_e_d RE; a <newline> is not
       allowed by the general definition of regular expression in
       POSIX.1‐2008. Also note that ''\\nn'' cannot be used to match a <newline>
       at the end of an arbitrary input line; <newline> characters appear in
       the pattern space as a result of the NN editing command.

EEXXAAMMPPLLEESS
       This _s_e_d script simulates the BSD _c_a_t −−ss command, squeezing excess
       empty lines from standard input.


           sseedd −−nn ''
           ## WWrriittee nnoonn--eemmppttyy lliinneess..
           //..// {{
               pp
               dd
               }}
           ## WWrriittee aa ssiinnggllee eemmppttyy lliinnee,, tthheenn llooookk ffoorr mmoorree eemmppttyy lliinneess..
           //^^$$//    pp
           ## GGeett nneexxtt lliinnee,, ddiissccaarrdd tthhee hheelldd <<nneewwlliinnee>> ((eemmppttyy lliinnee)),,
           ## aanndd llooookk ffoorr mmoorree eemmppttyy lliinneess..
           ::EEmmppttyy
           //^^$$//    {{
               NN
               ss//..////
               bb EEmmppttyy
               }}
           ## WWrriittee tthhee nnoonn--eemmppttyy lliinnee bbeeffoorree ggooiinngg bbaacckk ttoo sseeaarrcchh
           ## ffoorr tthhee ffiirrsstt iinn aa sseett ooff eemmppttyy lliinneess..
               pp
           ''

       The following _s_e_d command is a much simpler method of squeezing empty
       lines, although it is not quite the same as _c_a_t −−ss since it removes any
       initial empty lines:


           sseedd −−nn ''//..//,,//^^$$//pp''

RRAATTIIOONNAALLEE
       This volume of POSIX.1‐2008 requires implementations to support at
       least ten distinct _w_f_i_l_es, matching historical practice on many
       implementations. Implementations are encouraged to support more, but
       conforming applications should not exceed this limit.

       The exit status codes specified here are different from those in System
       V. System V returns 2 for garbled _s_e_d commands, but returns zero with
       its usage message or if the input file could not be opened. The
       standard developers considered this to be a bug.

       The manner in which the ll command writes non-printable characters was
       changed to avoid the historical backspace-overstrike method, and other
       requirements to achieve unambiguous output were added. See the
       RATIONALE for _e_d for details of the format chosen, which is the same as
       that chosen for _s_e_d.

       This volume of POSIX.1‐2008 requires implementations to provide pattern
       and hold spaces of at least 8192 bytes, larger than the 4000 bytes
       spaces used by some historical implementations, but less than the 20480
       bytes limit used in an early proposal. Implementations are encouraged
       to allocate dynamically larger pattern and hold spaces as needed.

       The requirements for acceptance of <blank> and <space> characters in
       command lines has been made more explicit than in early proposals to
       describe clearly the historical practice and to remove confusion about
       the phrase ``protect initial blanks [_s_i_c] and tabs from the stripping
       that is done on every script line'' that appears in much of the
       historical documentation of the _s_e_d utility description of text. (Not
       all implementations are known to have stripped <blank> characters from
       text lines, although they all have allowed leading <blank> characters
       preceding the address on a command line.)

       The treatment of ''##'' comments differs from the SVID which only allows a
       comment as the first line of the script, but matches BSD-derived
       implementations. The comment character is treated as a command, and it
       has the same properties in terms of being accepted with leading <blank>
       characters; the BSD implementation has historically supported this.

       Early proposals required that a _s_c_r_i_p_t___f_i_l_e have at least one non-
       comment line. Some historical implementations have behaved in
       unexpected ways if this were not the case. The standard developers
       considered that this was incorrect behavior and that application
       developers should not have to avoid this feature. A correct
       implementation of this volume of POSIX.1‐2008 shall permit _s_c_r_i_p_t___f_i_l_es
       that consist only of comment lines.

       Early proposals indicated that if −−ee and −−ff options were intermixed,
       all −−ee options were processed before any −−ff options. This has been
       changed to process them in the order presented because it matches
       historical practice and is more intuitive.

       The treatment of the pp flag to the ss command differs between System V
       and BSD-based systems when the default output is suppressed. In the two
       examples:


           eecchhoo aa || sseedd    ''ss//aa//AA//pp''
           eecchhoo aa || sseedd −−nn ''ss//aa//AA//pp''

       this volume of POSIX.1‐2008, BSD, System V documentation, and the SVID
       indicate that the first example should write two lines with AA, whereas
       the second should write one. Some System V systems write the AA only
       once in both examples because the pp flag is ignored if the −−nn option is
       not specified.

       This is a case of a diametrical difference between systems that could
       not be reconciled through the compromise of declaring the behavior to
       be unspecified. The SVID/BSD/System V documentation behavior was
       adopted for this volume of POSIX.1‐2008 because:

        *  No known documentation for any historic system describes the
           interaction between the pp flag and the −−nn option.

        *  The selected behavior is more correct as there is no technical
           justification for any interaction between the pp flag and the −−nn
           option. A relationship between −−nn and the pp flag might imply that
           they are only used together, but this ignores valid scripts that
           interrupt the cyclical nature of the processing through the use of
           the DD, dd, qq, or branching commands. Such scripts rely on the pp
           suffix to write the pattern space because they do not make use of
           the default output at the ``bottom'' of the script.

        *  Because the −−nn option makes the pp flag unnecessary, any interaction
           would only be useful if _s_e_d scripts were written to run both with
           and without the −−nn option. This is believed to be unlikely. It is
           even more unlikely that programmers have coded the pp flag expecting
           it to be unnecessary. Because the interaction was not documented,
           the likelihood of a programmer discovering the interaction and
           depending on it is further decreased.

        *  Finally, scripts that break under the specified behavior produce
           too much output instead of too little, which is easier to diagnose
           and correct.

       The form of the substitute command that uses the nn suffix was limited
       to the first 512 matches in an early proposal. This limit has been
       removed because there is no reason an editor processing lines of
       {LINE_MAX} length should have this restriction. The command ss//aa//AA//22004477
       should be able to substitute the 2047th occurrence of aa on a line.

       The bb, tt, and :: commands are documented to ignore leading white space,
       but no mention is made of trailing white space. Historical
       implementations of _s_e_d assigned different locations to the labels ''xx''
       and ""xx  "".  This is not useful, and leads to subtle programming errors,
       but it is historical practice, and changing it could theoretically
       break working scripts. Implementors are encouraged to provide warning
       messages about labels that are never used or jumps to labels that do
       not exist.

       Historically, the _s_e_d !!  and }} editing commands did not permit multiple
       commands on a single line using a <semicolon> as a command delimiter.
       Implementations are permitted, but not required, to support this
       extension.

       Earlier versions of this standard allowed for implementations with
       bytes other than eight bits, but this has been modified in this
       version.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _a_w_k, _e_d, _g_r_e_p

       The Base Definitions volume of POSIX.1‐2008, _T_a_b_l_e _5_-_1, _E_s_c_a_p_e
       _S_e_q_u_e_n_c_e_s _a_n_d _A_s_s_o_c_i_a_t_e_d _A_c_t_i_o_n_s, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s,
       _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
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



IEEE/The Open Group                  2013                              SED(1P)
