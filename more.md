MORE(1P)                   POSIX Programmer's Manual                  MORE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       more — display files on a page-by-page basis

SSYYNNOOPPSSIISS
       more [[−ceisu]] [[−n _n_u_m_b_e_r]] [[−p _c_o_m_m_a_n_d]] [[−t _t_a_g_s_t_r_i_n_g]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _m_o_r_e utility shall read files and either write them to the terminal
       on a page-by-page basis or filter them to standard output. If standard
       output is not a terminal device, all input files shall be copied to
       standard output in their entirety, without modification, except as
       specified for the −−ss option. If standard output is a terminal device,
       the files shall be written a number of lines (one screenful) at a time
       under the control of user commands. See the EXTENDED DESCRIPTION
       section.

       Certain block-mode terminals do not have all the capabilities necessary
       to support the complete _m_o_r_e definition; they are incapable of
       accepting commands that are not terminated with a <newline>.
       Implementations that support such terminals shall provide an operating
       mode to _m_o_r_e in which all commands can be terminated with a <newline>
       on those terminals. This mode:

        *  Shall be documented in the system documentation

        *  Shall, at invocation, inform the user of the terminal deficiency
           that requires the <newline> usage and provide instructions on how
           this warning can be suppressed in future invocations

        *  Shall not be required for implementations supporting only fully
           capable terminals

        *  Shall not affect commands already requiring <newline> characters

        *  Shall not affect users on the capable terminals from using _m_o_r_e as
           described in this volume of POSIX.1‐2008

OOPPTTIIOONNSS
       The _m_o_r_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that ''++''
       may be recognized as an option delimiter as well as ''−−''.

       The following options shall be supported:

       −−cc        If a screen is to be written that has no lines in common with
                 the current screen, or _m_o_r_e is writing its first screen, _m_o_r_e
                 shall not scroll the screen, but instead shall redraw each
                 line of the screen in turn, from the top of the screen to the
                 bottom. In addition, if _m_o_r_e is writing its first screen, the
                 screen shall be cleared. This option may be silently ignored
                 on devices with insufficient terminal capabilities.

       −−ee        Exit immediately after writing the last line of the last file
                 in the argument list; see the EXTENDED DESCRIPTION section.

       −−ii        Perform pattern matching in searches without regard to case;
                 see the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._2,
                 _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n _G_e_n_e_r_a_l _R_e_q_u_i_r_e_m_e_n_t_s.

       −−nn  _n_u_m_b_e_r Specify the number of lines per screenful. The _n_u_m_b_e_r
                 argument is a positive decimal integer. The −−nn option shall
                 override any values obtained from any other source.

       −−pp  _c_o_m_m_a_n_d
                 Each time a screen from a new file is displayed or
                 redisplayed (including as a result of _m_o_r_e commands; for
                 example, ::pp), execute the _m_o_r_e command(s) in the command
                 arguments in the order specified, as if entered by the user
                 after the first screen has been displayed. No intermediate
                 results shall be displayed (that is, if the command is a
                 movement to a screen different from the normal first screen,
                 only the screen resulting from the command shall be
                 displayed.) If any of the commands fail for any reason, an
                 informational message to this effect shall be written, and no
                 further commands specified using the −−pp option shall be
                 executed for this file.

       −−ss        Behave as if consecutive empty lines were a single empty
                 line.

       −−tt  _t_a_g_s_t_r_i_n_g
                 Write the screenful of the file containing the tag named by
                 the _t_a_g_s_t_r_i_n_g argument. See the _c_t_a_g_s utility. The tags
                 feature represented by −−tt _t_a_g_s_t_r_i_n_g and the ::tt command is
                 optional. It shall be provided on any system that also
                 provides a conforming implementation of _c_t_a_g_s; otherwise, the
                 use of −−tt produces undefined results.

                 The filename resulting from the −−tt option shall be logically
                 added as a prefix to the list of command line files, as if
                 specified by the user. If the tag named by the _t_a_g_s_t_r_i_n_g
                 argument is not found, it shall be an error, and _m_o_r_e shall
                 take no further action.

                 If the tag specifies a line number, the first line of the
                 display shall contain the beginning of that line. If the tag
                 specifies a pattern, the first line of the display shall
                 contain the beginning of the matching text from the first
                 line of the file that contains that pattern. If the line does
                 not exist in the file or matching text is not found, an
                 informational message to this effect shall be displayed, and
                 _m_o_r_e shall display the default screen as if −−tt had not been
                 specified.

                 If both the −−tt _t_a_g_s_t_r_i_n_g and −−pp _c_o_m_m_a_n_d options are given,
                 the −−tt _t_a_g_s_t_r_i_n_g shall be processed first; that is, the file
                 and starting line for the display shall be as specified by
                 −−tt, and then the −−pp _m_o_r_e command shall be executed. If the
                 line (matching text) specified by the −−tt command does not
                 exist (is not found), no −−pp _m_o_r_e command shall be executed
                 for this file at any time.

       −−uu        Treat a <backspace> as a printable control character,
                 displayed as an implementation-defined character sequence
                 (see the EXTENDED DESCRIPTION section), suppressing
                 backspacing and the special handling that produces underlined
                 or standout mode text on some terminal types.  Also, do not
                 ignore a <carriage-return> at the end of a line.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of an input file. If no _f_i_l_e operands are
                 specified, the standard input shall be used. If a _f_i_l_e is
                 ''−−'', the standard input shall be read at that point in the
                 sequence.

SSTTDDIINN
       The standard input shall be used only if no _f_i_l_e operands are
       specified, or if a _f_i_l_e operand is ''−−''.

IINNPPUUTT FFIILLEESS
       The input files being examined shall be text files. If standard output
       is a terminal, standard error shall be used to read commands from the
       user. If standard output is a terminal, standard error is not readable,
       and command input is needed, _m_o_r_e may attempt to obtain user commands
       from the controlling terminal (for example, //ddeevv//ttttyy); otherwise, _m_o_r_e
       shall terminate with an error indicating that it was unable to read
       user commands. If standard output is not a terminal, no error shall
       result if standard error cannot be opened for reading.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _m_o_r_e:

       _C_O_L_U_M_N_S   Override the system-selected horizontal display line size.
                 See the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8,
                 _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s for valid values and results when it is
                 unset or null.

       _E_D_I_T_O_R    Used by the vv command to select an editor. See the EXTENDED
                 DESCRIPTION section.

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
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _L_I_N_E_S     Override the system-selected vertical screen size, used as
                 the number of lines in a screenful. See the Base Definitions
                 volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s for
                 valid values and results when it is unset or null. The −−nn
                 option shall take precedence over the _L_I_N_E_S variable for
                 determining the number of lines in a screenful.

       _M_O_R_E      Determine a string containing options described in the
                 OPTIONS section preceded with <hyphen> characters and
                 <blank>-separated as on the command line. Any command line
                 options shall be processed after those in the _M_O_R_E variable,
                 as if the command line were:


                     mmoorree $$MMOORREE _o_p_t_i_o_n_s _o_p_e_r_a_n_d_s

                 The _M_O_R_E variable shall take precedence over the _T_E_R_M and
                 _L_I_N_E_S variables for determining the number of lines in a
                 screenful.

       _T_E_R_M      Determine the name of the terminal type. If this variable is
                 unset or null, an unspecified default terminal type is used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The standard output shall be used to write the contents of the input
       files.

SSTTDDEERRRR
       The standard error shall be used for diagnostic messages and user
       commands (see the INPUT FILES section), and, if standard output is a
       terminal device, to write a prompting string. The prompting string
       shall appear on the screen line below the last line of the file
       displayed in the current screenful. The prompt shall contain the name
       of the file currently being examined and shall contain an end-of-file
       indication and the name of the next file, if any, when prompting at the
       end-of-file. If an error or informational message is displayed, it is
       unspecified whether it is contained in the prompt. If it is not
       contained in the prompt, it shall be displayed and then the user shall
       be prompted for a continuation character, at which point another
       message or the user prompt may be displayed. The prompt is otherwise
       unspecified. It is unspecified whether informational messages are
       written for other user commands.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       The following section describes the behavior of _m_o_r_e when the standard
       output is a terminal device. If the standard output is not a terminal
       device, no options other than −−ss shall have any effect, and all input
       files shall be copied to standard output otherwise unmodified, at which
       time _m_o_r_e shall exit without further action.

       The number of lines available per screen shall be determined by the −−nn
       option, if present, or by examining values in the environment (see the
       ENVIRONMENT VARIABLES section). If neither method yields a number, an
       unspecified number of lines shall be used.

       The maximum number of lines written shall be one less than this number,
       because the screen line after the last line written shall be used to
       write a user prompt and user input. If the number of lines in the
       screen is less than two, the results are undefined. It is unspecified
       whether user input is permitted to be longer than the remainder of the
       single line where the prompt has been written.

       The number of columns available per line shall be determined by
       examining values in the environment (see the ENVIRONMENT VARIABLES
       section), with a default value as described in the Base Definitions
       volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s.

       Lines that are longer than the display shall be folded; the length at
       which folding occurs is unspecified, but should be appropriate for the
       output device. Folding may occur between glyphs of single characters
       that take up multiple display columns.

       When standard output is a terminal and −−uu is not specified, _m_o_r_e shall
       treat <backspace> and <carriage-return> characters specially:

        *  A character, followed first by a sequence of _n <backspace>
           characters (where _n is the same as the number of column positions
           that the character occupies), then by _n <underscore> characters
           (''__''), shall cause that character to be written as underlined text,
           if the terminal type supports that. The _n <underscore> characters,
           followed first by _n <backspace> characters, then any character with
           _n column positions, shall also cause that character to be written
           as underlined text, if the terminal type supports that.

        *  A sequence of _n <backspace> characters (where _n is the same as the
           number of column positions that the previous character occupies)
           that appears between two identical printable characters shall cause
           the first of those two characters to be written as emboldened text
           (that is, visually brighter, standout mode, or inverse-video mode),
           if the terminal type supports that, and the second to be discarded.
           Immediately subsequent occurrences of <backspace>/character pairs
           for that same character shall also be discarded. (For example, the
           sequence ""aa\\bbaa\\bbaa\\bbaa"" is interpreted as a single emboldened ''aa''.)

        *  The _m_o_r_e utility shall logically discard all other <backspace>
           characters from the line as well as the character which precedes
           them, if any.

        *  A <carriage-return> at the end of a line shall be ignored, rather
           than being written as a non-printable character, as described in
           the next paragraph.

       It is implementation-defined how other non-printable characters are
       written. Implementations should use the same format that they use for
       the _e_x pprriinntt command; see the OPTIONS section within the _e_d utility. It
       is unspecified whether a multi-column character shall be separated if
       it crosses a display line boundary; it shall not be discarded. The
       behavior is unspecified if the number of columns on the display is less
       than the number of columns any single character in the line being
       displayed would occupy.

       When each new file is displayed (or redisplayed), _m_o_r_e shall write the
       first screen of the file. Once the initial screen has been written,
       _m_o_r_e shall prompt for a user command. If the execution of the user
       command results in a screen that has lines in common with the current
       screen, and the device has sufficient terminal capabilities, _m_o_r_e shall
       scroll the screen; otherwise, it is unspecified whether the screen is
       scrolled or redrawn.

       For all files but the last (including standard input if no file was
       specified, and for the last file as well, if the −−ee option was not
       specified), when _m_o_r_e has written the last line in the file, _m_o_r_e shall
       prompt for a user command. This prompt shall contain the name of the
       next file as well as an indication that _m_o_r_e has reached end-of-file.
       If the user command is ff, <control>‐F, <space>, jj, <newline>, dd,
       <control>‐D, or ss, _m_o_r_e shall display the next file. Otherwise, if
       displaying the last file, _m_o_r_e shall exit. Otherwise, _m_o_r_e shall
       execute the user command specified.

       Several of the commands described in this section display a previous
       screen from the input stream. In the case that text is being taken from
       a non-rewindable stream, such as a pipe, it is implementation-defined
       how much backwards motion is supported. If a command cannot be executed
       because of a limitation on backwards motion, an error message to this
       effect shall be displayed, the current screen shall not change, and the
       user shall be prompted for another command.

       If a command cannot be performed because there are insufficient lines
       to display, _m_o_r_e shall alert the terminal. If a command cannot be
       performed because there are insufficient lines to display or a //
       command fails: if the input is the standard input, the last screen in
       the file may be displayed; otherwise, the current file and screen shall
       not change, and the user shall be prompted for another command.

       The interactive commands in the following sections shall be supported.
       Some commands can be preceded by a decimal integer, called _c_o_u_n_t in the
       following descriptions. If not specified with the command, _c_o_u_n_t shall
       default to 1. In the following descriptions, _p_a_t_t_e_r_n is a basic regular
       expression, as described in the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s.  The term
       ``examine'' is historical usage meaning ``open the file for viewing'';
       for example, _m_o_r_e ffoooo would be expressed as examining file ffoooo.

       In the following descriptions, unless otherwise specified, _l_i_n_e is a
       line in the _m_o_r_e display, not a line from the file being examined.

       In the following descriptions, the _c_u_r_r_e_n_t _p_o_s_i_t_i_o_n refers to two
       things:

        1. The position of the current line on the screen

        2. The line number (in the file) of the current line on the screen

       Usually, the line on the screen corresponding to the current position
       is the third line on the screen. If this is not possible (there are
       fewer than three lines to display or this is the first page of the
       file, or it is the last page of the file), then the current position is
       either the first or last line on the screen as described later.

   HHeellpp
       _S_y_n_o_p_s_i_s:

                     hh

       Write a summary of these commands and other implementation-defined
       commands. The behavior shall be as if the _m_o_r_e utility were executed
       with the −−ee option on a file that contained the summary information.
       The user shall be prompted as described earlier in this section when
       end-of-file is reached. If the user command is one of those specified
       to continue to the next file, _m_o_r_e shall return to the file and screen
       state from which the hh command was executed.

   SSccrroollll FFoorrwwaarrdd OOnnee SSccrreeeennffuull
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]f
                     [[_c_o_u_n_t]]<control>-F

       Scroll forward _c_o_u_n_t lines, with a default of one screenful. If _c_o_u_n_t
       is more than the screen size, only the final screenful shall be
       written.

   SSccrroollll BBaacckkwwaarrdd OOnnee SSccrreeeennffuull
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]b
                     [[_c_o_u_n_t]]<control>-B

       Scroll backward _c_o_u_n_t lines, with a default of one screenful (see the
       −−nn option). If _c_o_u_n_t is more than the screen size, only the final
       screenful shall be written.

   SSccrroollll FFoorrwwaarrdd OOnnee LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]<space>
                     [[_c_o_u_n_t]]j
                     [[_c_o_u_n_t]]<newline>

       Scroll forward _c_o_u_n_t lines. The default _c_o_u_n_t for the <space> shall be
       one screenful; for jj and <newline>, one line. The entire _c_o_u_n_t lines
       shall be written, even if _c_o_u_n_t is more than the screen size.

   SSccrroollll BBaacckkwwaarrdd OOnnee LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]k

       Scroll backward _c_o_u_n_t lines. The entire _c_o_u_n_t lines shall be written,
       even if _c_o_u_n_t is more than the screen size.

   SSccrroollll FFoorrwwaarrdd OOnnee HHaallff SSccrreeeennffuull
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]d
                     [[_c_o_u_n_t]]<control>-D

       Scroll forward _c_o_u_n_t lines, with a default of one half of the screen
       size. If _c_o_u_n_t is specified, it shall become the new default for
       subsequent dd, <control>‐D, and uu commands.

   SSkkiipp FFoorrwwaarrdd OOnnee LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]s

       Display the screenful beginning with the line _c_o_u_n_t lines after the
       last line on the current screen. If _c_o_u_n_t would cause the current
       position to be such that less than one screenful would be written, the
       last screenful in the file shall be written.

   SSccrroollll BBaacckkwwaarrdd OOnnee HHaallff SSccrreeeennffuull
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]u
                     [[_c_o_u_n_t]]<control>-U

       Scroll backward _c_o_u_n_t lines, with a default of one half of the screen
       size. If _c_o_u_n_t is specified, it shall become the new default for
       subsequent dd, <control>−D, uu, and <control>−U commands. The entire
       _c_o_u_n_t lines shall be written, even if _c_o_u_n_t is more than the screen
       size.

   GGoo ttoo BBeeggiinnnniinngg ooff FFiillee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]g

       Display the screenful beginning with line _c_o_u_n_t.

   GGoo ttoo EEnndd--ooff--FFiillee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]G

       If _c_o_u_n_t is specified, display the screenful beginning with the line
       _c_o_u_n_t.  Otherwise, display the last screenful of the file.

   RReeffrreesshh tthhee SSccrreeeenn
       _S_y_n_o_p_s_i_s:

                     rr
                     <<ccoonnttrrooll>>--LL

       Refresh the screen.

   DDiissccaarrdd aanndd RReeffrreesshh
       _S_y_n_o_p_s_i_s:

                     RR

       Refresh the screen, discarding any buffered input. If the current file
       is non-seekable, buffered input shall not be discarded and the RR
       command shall be equivalent to the rr command.

   MMaarrkk PPoossiittiioonn
       _S_y_n_o_p_s_i_s:

                     mm_l_e_t_t_e_r

       Mark the current position with the letter named by _l_e_t_t_e_r, where _l_e_t_t_e_r
       represents the name of one of the lowercase letters of the portable
       character set. When a new file is examined, all marks may be lost.

   RReettuurrnn ttoo MMaarrkk
       _S_y_n_o_p_s_i_s:

                     ''_l_e_t_t_e_r

       Return to the position that was previously marked with the letter named
       by _l_e_t_t_e_r, making that line the current position.

   RReettuurrnn ttoo PPrreevviioouuss PPoossiittiioonn
       _S_y_n_o_p_s_i_s:

                     ''''

       Return to the position from which the last large movement command was
       executed (where a ``large movement'' is defined as any movement of more
       than a screenful of lines). If no such movements have been made, return
       to the beginning of the file.

   SSeeaarrcchh FFoorrwwaarrdd ffoorr PPaatttteerrnn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]/[[!]]_p_a_t_t_e_r_n<newline>

       Display the screenful beginning with the _c_o_u_n_tth line containing the
       pattern. The search shall start after the first line currently
       displayed. The null regular expression (''//'' followed by a <newline>)
       shall repeat the search using the previous regular expression, with a
       default _c_o_u_n_t.  If the character ''!!'' is included, the matching lines
       shall be those that do not contain the _p_a_t_t_e_r_n.  If no match is found
       for the _p_a_t_t_e_r_n, a message to that effect shall be displayed.

   SSeeaarrcchh BBaacckkwwaarrdd ffoorr PPaatttteerrnn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]?[[!]]_p_a_t_t_e_r_n<newline>

       Display the screenful beginning with the _c_o_u_n_tth previous line
       containing the pattern. The search shall start on the last line before
       the first line currently displayed. The null regular expression (''??''
       followed by a <newline>) shall repeat the search using the previous
       regular expression, with a default _c_o_u_n_t.  If the character ''!!'' is
       included, matching lines shall be those that do not contain the
       _p_a_t_t_e_r_n.  If no match is found for the _p_a_t_t_e_r_n, a message to that
       effect shall be displayed.

   RReeppeeaatt SSeeaarrcchh
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]n

       Repeat the previous search for _c_o_u_n_tth line containing the last _p_a_t_t_e_r_n
       (or not containing the last _p_a_t_t_e_r_n, if the previous search was ""//!!"" or
       ""??!!"").

   RReeppeeaatt SSeeaarrcchh iinn RReevveerrssee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]N

       Repeat the search in the opposite direction of the previous search for
       the _c_o_u_n_tth line containing the last _p_a_t_t_e_r_n (or not containing the
       last _p_a_t_t_e_r_n, if the previous search was ""//!!"" or ""??!!"").

   EExxaammiinnee NNeeww FFiillee
       _S_y_n_o_p_s_i_s:

                     ::ee [[_f_i_l_e_n_a_m_e]]<newline>

       Examine a new file. If the _f_i_l_e_n_a_m_e argument is not specified, the
       current file (see the ::nn and ::pp commands below) shall be re-examined.
       The _f_i_l_e_n_a_m_e shall be subjected to the process of shell word expansions
       (see _S_e_c_t_i_o_n _2_._6, _W_o_r_d _E_x_p_a_n_s_i_o_n_s); if more than a single pathname
       results, the effects are unspecified.  If _f_i_l_e_n_a_m_e is a <number-sign>
       (''##''), the previously examined file shall be re-examined. If _f_i_l_e_n_a_m_e
       is not accessible for any reason (including that it is a non-seekable
       file), an error message to this effect shall be displayed and the
       current file and screen shall not change.

   EExxaammiinnee NNeexxtt FFiillee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]:n

       Examine the next file. If a number _c_o_u_n_t is specified, the _c_o_u_n_tth next
       file shall be examined. If _f_i_l_e_n_a_m_e refers to a non-seekable file, the
       results are unspecified.

   EExxaammiinnee PPrreevviioouuss FFiillee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]]:p

       Examine the previous file. If a number _c_o_u_n_t is specified, the _c_o_u_n_tth
       previous file shall be examined. If _f_i_l_e_n_a_m_e refers to a non-seekable
       file, the results are unspecified.

   GGoo ttoo TTaagg
       _S_y_n_o_p_s_i_s:

                     ::tt _t_a_g_s_t_r_i_n_g<newline>

       If the file containing the tag named by the _t_a_g_s_t_r_i_n_g argument is not
       the current file, examine the file, as if the ::ee command was executed
       with that file as the argument. Otherwise, or in addition, display the
       screenful beginning with the tag, as described for the −−tt option (see
       the OPTIONS section). If the _c_t_a_g_s utility is not supported by the
       system, the use of ::tt produces undefined results.

   IInnvvookkee EEddiittoorr
       _S_y_n_o_p_s_i_s:

                     vv

       Invoke an editor to edit the current file being examined. If standard
       input is being examined, the results are unspecified. The name of the
       editor shall be taken from the environment variable _E_D_I_T_O_R, or shall
       default to _v_i.  If the last pathname component in _E_D_I_T_O_R is either _v_i
       or _e_x, the editor shall be invoked with a −−cc _l_i_n_e_n_u_m_b_e_r command line
       argument, where _l_i_n_e_n_u_m_b_e_r is the line number of the file line
       containing the display line currently displayed as the first line of
       the screen. It is implementation-defined whether line-setting options
       are passed to editors other than _v_i and _e_x.

       When the editor exits, _m_o_r_e shall resume with the same file and screen
       as when the editor was invoked.

   DDiissppllaayy PPoossiittiioonn
       _S_y_n_o_p_s_i_s:

                     ==
                     <<ccoonnttrrooll>>--GG

       Write a message for which the information references the first byte of
       the line after the last line of the file on the screen. This message
       shall include the name of the file currently being examined, its number
       relative to the total number of files there are to examine, the line
       number in the file, the byte number and the total bytes in the file,
       and what percentage of the file precedes the current position. If _m_o_r_e
       is reading from standard input, or the file is shorter than a single
       screen, the line number, the byte number, the total bytes, and the
       percentage need not be written.

   QQuuiitt
       _S_y_n_o_p_s_i_s:

                     qq
                     ::qq
                     ZZZZ

       Exit _m_o_r_e.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If an error is encountered accessing a file when using the ::nn command,
       _m_o_r_e shall attempt to examine the next file in the argument list, but
       the final exit status shall be affected. If an error is encountered
       accessing a file via the ::pp command, _m_o_r_e shall attempt to examine the
       previous file in the argument list, but the final exit status shall be
       affected. If an error is encountered accessing a file via the ::ee
       command, _m_o_r_e shall remain in the current file and the final exit
       status shall not be affected.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       When the standard output is not a terminal, only the −−ss filter-
       modification option is effective. This is based on historical practice.
       For example, a typical implementation of _m_a_n pipes its output through
       _m_o_r_e −−ss to squeeze excess white space for terminal users. When _m_a_n is
       piped to _l_p, however, it is undesirable for this squeezing to happen.

EEXXAAMMPPLLEESS
       The −−pp allows arbitrary commands to be executed at the start of each
       file.  Examples are:

       _m_o_r_e_ −−pp  GG  _f_i_l_e_1_ _f_i_l_e_2
             Examine each file starting with its last screenful.

       _m_o_r_e_ −−pp  100 _f_i_l_e_1_ _f_i_l_e_2
             Examine each file starting with line 100 in the current position
             (usually the third line, so line 98 would be the first line
             written).

       _m_o_r_e_ −−pp  /100 _f_i_l_e_1_ _f_i_l_e_2
             Examine each file starting with the first line containing the
             string ""110000"" in the current position

RRAATTIIOONNAALLEE
       The _m_o_r_e utility, available in BSD and BSD-derived systems, was chosen
       as the prototype for the POSIX file display program since it is more
       widely available than either the public-domain program _l_e_s_s or than _p_g,
       a pager provided in System V. The 4.4 BSD _m_o_r_e is the model for the
       features selected; it is almost fully upwards-compatible from the 4.3
       BSD version in wide use and has become more amenable for _v_i users.
       Several features originally derived from various file editors, found in
       both _l_e_s_s and _p_g, have been added to this volume of POSIX.1‐2008 as
       they have proved extremely popular with users.

       There are inconsistencies between _m_o_r_e and _v_i that result from
       historical practice. For example, the single-character commands hh, ff,
       bb, and <space> are screen movers in _m_o_r_e, but cursor movers in _v_i.
       These inconsistencies were maintained because the cursor movements are
       not applicable to _m_o_r_e and the powerful functionality achieved without
       the use of the control key justifies the differences.

       The tags interface has been included in a program that is not a text
       editor because it promotes another degree of consistent operation with
       _v_i.  It is conceivable that the paging environment of _m_o_r_e would be
       superior for browsing source code files in some circumstances.

       The operating mode referred to for block-mode terminals effectively
       adds a <newline> to each Synopsis line that currently has none. So, for
       example, dd<newline> would page one screenful. The mode could be
       triggered by a command line option, environment variable, or some other
       method. The details are not imposed by this volume of POSIX.1‐2008
       because there are so few systems known to support such terminals.
       Nevertheless, it was considered that all systems should be able to
       support _m_o_r_e given the exception cited for this small community of
       terminals because, in comparison to _v_i, the cursor movements are few
       and the command set relatively amenable to the optional <newline>
       characters.

       Some versions of _m_o_r_e provide a shell escaping mechanism similar to the
       _e_x !!  command. The standard developers did not consider that this was
       necessary in a paginator, particularly given the wide acceptance of
       multiple window terminals and job control features. (They chose to
       retain such features in the editors and _m_a_i_l_x because the shell
       interaction also gives an opportunity to modify the editing buffer,
       which is not applicable to _m_o_r_e.)

       The −−pp (position) option replaces the ++ command because of the Utility
       Syntax Guidelines. The ++_c_o_m_m_a_n_d option is no longer specified by
       POSIX.1‐2008 but may be present in some implementations. In early
       proposals, it took a _p_a_t_t_e_r_n argument, but historical _l_e_s_s provided the
       _m_o_r_e general facility of a command. It would have been desirable to use
       the same −−cc as _e_x and _v_i, but the letter was already in use.

       The text stating ``from a non-rewindable stream ... implementations may
       limit the amount of backwards motion supported'' would allow an
       implementation that permitted no backwards motion beyond text already
       on the screen. It was not possible to require a minimum amount of
       backwards motion that would be effective for all conceivable device
       types. The implementation should allow the user to back up as far as
       possible, within device and reasonable memory allocation constraints.

       Historically, non-printable characters were displayed using the ARPA
       standard mappings, which are as follows:

        1. Printable characters are left alone.

        2. Control characters less than \177 are represented as followed by
           the character offset from the ''@@'' character in the ASCII map; for
           example, \007 is represented as ''GG''.

        3. \177 is represented as followed by ''??''.

       The display of characters having their eighth bit set was less
       standard. Existing implementations use hex (0x00), octal (\000), and a
       meta-bit display. (The latter displayed characters with their eighth
       bit set as the two characters ""MM−−"", followed by the seven-bit display
       as described previously.) The latter probably has the best claim to
       historical practice because it was used with the −−vv option of 4 BSD and
       4 BSD-derived versions of the _c_a_t utility since 1980.

       No specific display format is required by POSIX.1‐2008. Implementations
       are encouraged to conform to historic practice in the absence of any
       strong reason to diverge.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e, _c_t_a_g_s, _e_d, _e_x, _v_i

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _9_._2, _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n _G_e_n_e_r_a_l _R_e_q_u_i_r_e_m_e_n_t_s,
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



IEEE/The Open Group                  2013                             MORE(1P)
