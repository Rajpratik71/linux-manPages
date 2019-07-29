VI(1P)                     POSIX Programmer's Manual                    VI(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       vi — screen-oriented (visual) display editor

SSYYNNOOPPSSIISS
       vi [[−rR]] [[−c _c_o_m_m_a_n_d]] [[−t _t_a_g_s_t_r_i_n_g]] [[−w _s_i_z_e]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       This utility shall be provided on systems that both support the User
       Portability Utilities option and define the POSIX2_CHAR_TERM symbol.
       On other systems it is optional.

       The _v_i (visual) utility is a screen-oriented text editor. Only the open
       and visual modes of the editor are described in POSIX.1‐2008; see the
       line editor _e_x for additional editing capabilities used in _v_i.  The
       user can switch back and forth between _v_i and _e_x and execute _e_x
       commands from within _v_i.

       This reference page uses the term _e_d_i_t _b_u_f_f_e_r to describe the current
       working text. No specific implementation is implied by this term. All
       editing changes are performed on the edit buffer, and no changes to it
       shall affect any file until an editor command writes the file.

       When using _v_i, the terminal screen acts as a window into the editing
       buffer. Changes made to the editing buffer shall be reflected in the
       screen display; the position of the cursor on the screen shall indicate
       the position within the editing buffer.

       Certain terminals do not have all the capabilities necessary to support
       the complete _v_i definition. When these commands cannot be supported on
       such terminals, this condition shall not produce an error message such
       as ``not an editor command'' or report a syntax error. The
       implementation may either accept the commands and produce results on
       the screen that are the result of an unsuccessful attempt to meet the
       requirements of this volume of POSIX.1‐2008 or report an error
       describing the terminal-related deficiency.

OOPPTTIIOONNSS
       The _v_i utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that ''++''
       may be recognized as an option delimiter as well as ''−−''.

       The following options shall be supported:

       −−cc  _c_o_m_m_a_n_d
                 See the _e_x command description of the −−cc option.

       −−rr        See the _e_x command description of the −−rr option.

       −−RR        See the _e_x command description of the −−RR option.

       −−tt  _t_a_g_s_t_r_i_n_g
                 See the _e_x command description of the −−tt option.

       −−ww  _s_i_z_e   See the _e_x command description of the −−ww option.

OOPPEERRAANNDDSS
       See the OPERANDS section of the _e_x command for a description of the
       operands supported by the _v_i command.

SSTTDDIINN
       If standard input is not a terminal device, the results are undefined.
       The standard input consists of a series of commands and input text, as
       described in the EXTENDED DESCRIPTION section.

       If a read from the standard input returns an error, or if the editor
       detects an end-of-file condition from the standard input, it shall be
       equivalent to a SIGHUP asynchronous event.

IINNPPUUTT FFIILLEESS
       See the INPUT FILES section of the _e_x command for a description of the
       input files supported by the _v_i command.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       See the ENVIRONMENT VARIABLES section of the _e_x command for the
       environment variables that affect the execution of the _v_i command.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       See the ASYNCHRONOUS EVENTS section of the _e_x for the asynchronous
       events that affect the execution of the _v_i command.

SSTTDDOOUUTT
       If standard output is not a terminal device, undefined results occur.

       Standard output may be used for writing prompts to the user, for
       informational messages, and for writing lines from the file.

SSTTDDEERRRR
       If standard output is not a terminal device, undefined results occur.

       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       See the OUTPUT FILES section of the _e_x command for a description of the
       output files supported by the _v_i command.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       If the terminal does not have the capabilities necessary to support an
       unspecified portion of the _v_i definition, implementations shall start
       initially in _e_x mode or open mode. Otherwise, after initialization, _v_i
       shall be in command mode; text input mode can be entered by one of
       several commands used to insert or change text. In text input mode,
       <ESC> can be used to return to command mode; other uses of <ESC> are
       described later in this section; see _T_e_r_m_i_n_a_t_e _C_o_m_m_a_n_d _o_r _I_n_p_u_t _M_o_d_e.

   IInniittiiaalliizzaattiioonn iinn eexx aanndd vvii
       See _I_n_i_t_i_a_l_i_z_a_t_i_o_n _i_n _e_x _a_n_d _v_i for a description of _e_x and _v_i
       initialization for the _v_i utility.

   CCoommmmaanndd DDeessccrriippttiioonnss iinn vvii
       The following symbols are used in this reference page to represent
       arguments to commands.

       _b_u_f_f_e_r  See the description of _b_u_f_f_e_r in the EXTENDED DESCRIPTION
               section of the _e_x utility; see _C_o_m_m_a_n_d _D_e_s_c_r_i_p_t_i_o_n_s _i_n _e_x.

               In open and visual mode, when a command synopsis shows both
               [_b_u_f_f_e_r] and [_c_o_u_n_t] preceding the command name, they can be
               specified in either order.

       _c_o_u_n_t   A positive integer used as an optional argument to most
               commands, either to give a repeat count or as a size. This
               argument is optional and shall default to 1 unless otherwise
               specified.

               The Synopsis lines for the _v_i commands <control>‐G,
               <control>‐L, <control>‐R, <control>‐], %%, &&, ^^, DD, mm, MM, QQ, uu,
               UU, and ZZZZ do not have _c_o_u_n_t as an optional argument.
               Regardless, it shall not be an error to specify a _c_o_u_n_t to
               these commands, and any specified _c_o_u_n_t shall be ignored.

       _m_o_t_i_o_n  An optional trailing argument used by the !!, <<, >>, cc, dd, and yy
               commands, which is used to indicate the region of text that
               shall be affected by the command. The motion can be either one
               of the command characters repeated or one of several other _v_i
               commands (listed in the following table). Each of the
               applicable commands specifies the region of text matched by
               repeating the command; each command that can be used as a
               motion command specifies the region of text it affects.

               Commands that take _m_o_t_i_o_n arguments operate on either lines or
               characters, depending on the circumstances. When operating on
               lines, all lines that fall partially or wholly within the text
               region specified for the command shall be affected. When
               operating on characters, only the exact characters in the
               specified text region shall be affected. Each motion command
               specifies this individually.

               When commands that may be motion commands are not used as
               motion commands, they shall set the current position to the
               current line and column as specified.

               The following commands shall be valid cursor motion commands:


                   <<aappoossttrroopphhee>>       ((    --    jj    HH
                   <<ccaarrrriiaaggee--rreettuurrnn>>  ))    $$    kk    LL
                   <<ccoommmmaa>>            [[[[   %%    ll    MM
                   <<ccoonnttrrooll>>--HH        ]]]]   __    nn    NN
                   <<ccoonnttrrooll>>--NN        {{    ;;    tt    TT
                   <<ccoonnttrrooll>>--PP        }}    ??    ww    WW
                   <<ggrraavvee--aacccceenntt>>     ^^    bb    BB
                   <<nneewwlliinnee>>          ++    ee    EE
                   <<ssppaaccee>>            ||    ff    FF
                   <<zzeerroo>>             //    hh    GG

               Any _c_o_u_n_t that is specified to a command that has an associated
               motion command shall be applied to the motion command. If a
               _c_o_u_n_t is applied to both the command and its associated motion
               command, the effect shall be multiplicative.

       The following symbols are used in this section to specify locations in
       the edit buffer:

       _c_u_r_r_e_n_t_ _c_h_a_r_a_c_t_e_r
               The character that is currently indicated by the cursor.

       _e_n_d_ _o_f_ _a_ _l_i_n_e
               The point located between the last non-<newline> (if any) and
               the terminating <newline> of a line. For an empty line, this
               location coincides with the beginning of the line.

       _e_n_d_ _o_f_ _t_h_e_ _e_d_i_t_ _b_u_f_f_e_r
               The location corresponding to the end of the last line in the
               edit buffer.

       The following symbols are used in this section to specify command
       actions:

       _b_i_g_w_o_r_d In the POSIX locale, _v_i shall recognize four kinds of _b_i_g_w_o_r_d_s:

                1. A maximal sequence of non-<blank> characters preceded and
                   followed by <blank> characters or the beginning or end of a
                   line or the edit buffer

                2. One or more sequential blank lines

                3. The first character in the edit buffer

                4. The last non-<newline> in the edit buffer

       _w_o_r_d    In the POSIX locale, _v_i shall recognize five kinds of words:

                1. A maximal sequence of letters, digits, and underscores,
                   delimited at both ends by:

                   --  Characters other than letters, digits, or underscores

                   --  The beginning or end of a line

                   --  The beginning or end of the edit buffer

                2. A maximal sequence of characters other than letters,
                   digits, underscores, or <blank> characters, delimited at
                   both ends by:

                   --  A letter, digit, underscore

                   --  <blank> characters

                   --  The beginning or end of a line

                   --  The beginning or end of the edit buffer

                3. One or more sequential blank lines

                4. The first character in the edit buffer

                5. The last non-<newline> in the edit buffer

       _s_e_c_t_i_o_n_ _b_o_u_n_d_a_r_y
               A _s_e_c_t_i_o_n _b_o_u_n_d_a_r_y is one of the following:

                1. A line whose first character is a <form-feed>

                2. A line whose first character is an open curly brace (''{{'')

                3. A line whose first character is a <period> and whose second
                   and third characters match a two-character pair in the
                   sseeccttiioonnss edit option (see _e_d)

                4. A line whose first character is a <period> and whose only
                   other character matches the first character of a two-
                   character pair in the sseeccttiioonnss edit option, where the
                   second character of the two-character pair is a <space>

                5. The first line of the edit buffer

                6. The last line of the edit buffer if the last line of the
                   edit buffer is empty or if it is a ]]]] or }} command;
                   otherwise, the last non-<newline> of the last line of the
                   edit buffer

       _p_a_r_a_g_r_a_p_h_ _b_o_u_n_d_a_r_y
               A _p_a_r_a_g_r_a_p_h _b_o_u_n_d_a_r_y is one of the following:

                1. A section boundary

                2. A line whose first character is a <period> and whose second
                   and third characters match a two-character pair in the
                   ppaarraaggrraapphhss edit option (see _e_d)

                3. A line whose first character is a <period> and whose only
                   other character matches the first character of a two-
                   character pair in the _p_a_r_a_g_r_a_p_h_s edit option, where the
                   second character of the two-character pair is a <space>

                4. One or more sequential blank lines

       _r_e_m_e_m_b_e_r_e_d_ _s_e_a_r_c_h_ _d_i_r_e_c_t_i_o_n
               See the description of _r_e_m_e_m_b_e_r_e_d _s_e_a_r_c_h _d_i_r_e_c_t_i_o_n in _e_d.

       _s_e_n_t_e_n_c_e_ _b_o_u_n_d_a_r_y
               A _s_e_n_t_e_n_c_e _b_o_u_n_d_a_r_y is one of the following:

                1. A paragraph boundary

                2. The first non-<blank> that occurs after a paragraph
                   boundary

                3. The first non-<blank> that occurs after a <period> (''..''),
                   <exclamation-mark> (''!!''), or <question-mark> (''??''),
                   followed by two <space> characters or the end of a line;
                   any number of closing parenthesis (''))''), closing brackets
                   ('']]''), double-quote (''""''), or single-quote (<apostrophe>)
                   characters can appear between the punctuation mark and the
                   two <space> characters or end-of-line

       In the remainder of the description of the _v_i utility, the term
       ``buffer line'' refers to a line in the edit buffer and the term
       ``display line'' refers to the line or lines on the display screen used
       to display one buffer line. The term ``current line'' refers to a
       specific ``buffer line''.

       If there are display lines on the screen for which there are no
       corresponding buffer lines because they correspond to lines that would
       be after the end of the file, they shall be displayed as a single
       <tilde> (''~~'') character, plus the terminating <newline>.

       The last line of the screen shall be used to report errors or display
       informational messages. It shall also be used to display the input for
       ``line-oriented commands'' (//, ??, ::, and !!).  When a line-oriented
       command is executed, the editor shall enter text input mode on the last
       line on the screen, using the respective command characters as prompt
       characters. (In the case of the !!  command, the associated motion shall
       be entered by the user before the editor enters text input mode.) The
       line entered by the user shall be terminated by a <newline>, a
       non-<control>‐V-escaped <carriage-return>, or unescaped <ESC>.  It is
       unspecified if more characters than require a display width minus one
       column number of screen columns can be entered.

       If any command is executed that overwrites a portion of the screen
       other than the last line of the screen (for example, the _e_x ssuussppeenndd or
       !!  commands), other than the _e_x sshheellll command, the user shall be
       prompted for a character before the screen is refreshed and the edit
       session continued.

       <tab> characters shall take up the number of columns on the screen set
       by the ttaabbssttoopp edit option (see _e_d), unless there are less than that
       number of columns before the display margin that will cause the
       displayed line to be folded; in this case, they shall only take up the
       number of columns up to that boundary.

       The cursor shall be placed on the current line and relative to the
       current column as specified by each command described in the following
       sections.

       In open mode, if the current line is not already displayed, then it
       shall be displayed.

       In visual mode, if the current line is not displayed, then the lines
       that are displayed shall be expanded, scrolled, or redrawn to cause an
       unspecified portion of the current line to be displayed. If the screen
       is redrawn, no more than the number of display lines specified by the
       value of the wwiinnddooww edit option shall be displayed (unless the current
       line cannot be completely displayed in the number of display lines
       specified by the wwiinnddooww edit option) and the current line shall be
       positioned as close to the center of the displayed lines as possible
       (within the constraints imposed by the distance of the line from the
       beginning or end of the edit buffer). If the current line is before the
       first line in the display and the screen is scrolled, an unspecified
       portion of the current line shall be placed on the first line of the
       display. If the current line is after the last line in the display and
       the screen is scrolled, an unspecified portion of the current line
       shall be placed on the last line of the display.

       In visual mode, if a line from the edit buffer (other than the current
       line) does not entirely fit into the lines at the bottom of the display
       that are available for its presentation, the editor may choose not to
       display any portion of the line. The lines of the display that do not
       contain text from the edit buffer for this reason shall each consist of
       a single ''@@'' character.

       In visual mode, the editor may choose for unspecified reasons to not
       update lines in the display to correspond to the underlying edit buffer
       text. The lines of the display that do not correctly correspond to text
       from the edit buffer for this reason shall consist of a single ''@@''
       character (plus the terminating <newline>), and the <control>‐R command
       shall cause the editor to update the screen to correctly represent the
       edit buffer.

       Open and visual mode commands that set the current column set it to a
       column position in the display, and not a character position in the
       line. In this case, however, the column position in the display shall
       be calculated for an infinite width display; for example, the column
       related to a character that is part of a line that has been folded onto
       additional screen lines will be offset from the display line column
       where the buffer line begins, not from the beginning of a particular
       display line.

       The display cursor column in the display is based on the value of the
       current column, as follows, with each rule applied in turn:

        1. If the current column is after the last display line column used by
           the displayed line, the display cursor column shall be set to the
           last display line column occupied by the last non-<newline> in the
           current line; otherwise, the display cursor column shall be set to
           the current column.

        2. If the character of which some portion is displayed in the display
           line column specified by the display cursor column requires more
           than a single display line column:

            a. If in text input mode, the display cursor column shall be
               adjusted to the first display line column in which any portion
               of that character is displayed.

            b. Otherwise, the display cursor column shall be adjusted to the
               last display line column in which any portion of that character
               is displayed.

       The current column shall not be changed by these adjustments to the
       display cursor column.

       If an error occurs during the parsing or execution of a _v_i command:

        *  The terminal shall be alerted. Execution of the _v_i command shall
           stop, and the cursor (for example, the current line and column)
           shall not be further modified.

        *  Unless otherwise specified by the following command sections, it is
           unspecified whether an informational message shall be displayed.

        *  Any partially entered _v_i command shall be discarded.

        *  If the _v_i command resulted from a mmaapp expansion, all characters
           from that mmaapp expansion shall be discarded, except as otherwise
           specified by the mmaapp command (see _e_d).

        *  If the _v_i command resulted from the execution of a buffer, no
           further commands caused by the execution of the buffer shall be
           executed.

   PPaaggee BBaacckkwwaarrddss
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <control>-B

       If in open mode, the <control>‐B command shall behave identically to
       the zz command. Otherwise, if the current line is the first line of the
       edit buffer, it shall be an error.

       If the wwiinnddooww edit option is less than 3, display a screen where the
       last line of the display shall be some portion of:


           ((_c_u_r_r_e_n_t _f_i_r_s_t _l_i_n_e) −1

       otherwise, display a screen where the first line of the display shall
       be some portion of:


           ((_c_u_r_r_e_n_t _f_i_r_s_t _l_i_n_e) − _c_o_u_n_t x ((window edit option) −2)

       If this calculation would result in a line that is before the first
       line of the edit buffer, the first line of the display shall display
       some portion of the first line of the edit buffer.

       _C_u_r_r_e_n_t _l_i_n_e: If no lines from the previous display remain on the
       screen, set to the last line of the display; otherwise, set to (_l_i_n_e −
       the number of new lines displayed on this screen).

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   SSccrroollll FFoorrwwaarrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <control>-D

       If the current line is the last line of the edit buffer, it shall be an
       error.

       If no _c_o_u_n_t is specified, _c_o_u_n_t shall default to the _c_o_u_n_t associated
       with the previous <control>‐D or <control>‐U command. If there was no
       previous <control>‐D or <control>‐U command, _c_o_u_n_t shall default to the
       value of the ssccrroollll edit option.

       If in open mode, write lines starting with the line after the current
       line, until _c_o_u_n_t lines or the last line of the file have been written.

       _C_u_r_r_e_n_t _l_i_n_e: If the current line + _c_o_u_n_t is past the last line of the
       edit buffer, set to the last line of the edit buffer; otherwise, set to
       the current line + _c_o_u_n_t.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   SSccrroollll FFoorrwwaarrdd bbyy LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <control>-E

       Display the line count lines after the last line currently displayed.

       If the last line of the edit buffer is displayed, it shall be an error.
       If there is no line _c_o_u_n_t lines after the last line currently
       displayed, the last line of the display shall display some portion of
       the last line of the edit buffer.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged if the previous current character is displayed;
       otherwise, set to the first line displayed.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   PPaaggee FFoorrwwaarrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <control>-F

       If in open mode, the <control>‐F command shall behave identically to
       the zz command. Otherwise, if the current line is the last line of the
       edit buffer, it shall be an error.

       If the wwiinnddooww edit option is less than 3, display a screen where the
       first line of the display shall be some portion of:


           ((_c_u_r_r_e_n_t _l_a_s_t _l_i_n_e) +1

       otherwise, display a screen where the first line of the display shall
       be some portion of:


           ((_c_u_r_r_e_n_t _f_i_r_s_t _l_i_n_e) + _c_o_u_n_t x ((window edit option) −2)

       If this calculation would result in a line that is after the last line
       of the edit buffer, the last line of the display shall display some
       portion of the last line of the edit buffer.

       _C_u_r_r_e_n_t _l_i_n_e: If no lines from the previous display remain on the
       screen, set to the first line of the display; otherwise, set to (_l_i_n_e +
       the number of new lines displayed on this screen).

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   DDiissppllaayy IInnffoorrmmaattiioonn
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--GG

       This command shall be equivalent to the _e_x ffiillee command.

   MMoovvee CCuurrssoorr BBaacckkwwaarrddss
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <control>-H
                     [[_c_o_u_n_t]] h
                     the current _e_r_a_s_e character (see stty)

       If there are no characters before the current character on the current
       line, it shall be an error. If there are less than _c_o_u_n_t previous
       characters on the current line, _c_o_u_n_t shall be adjusted to the number
       of previous characters on the line.

       If used as a motion command:

        1. The text region shall be from the character before the starting
           cursor up to and including the _c_o_u_n_tth character before the
           starting cursor.

        2. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to (_c_o_l_u_m_n − the number of columns occupied by
       _c_o_u_n_t characters ending with the previous current column).

   MMoovvee DDoowwnn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <newline>
                     [[_c_o_u_n_t]] <control>-J
                     [[_c_o_u_n_t]] <control>-M
                     [[_c_o_u_n_t]] <control>-N
                     [[_c_o_u_n_t]] j
                     [[_c_o_u_n_t]] <carriage-return>
                     [[_c_o_u_n_t]] +

       If there are less than _c_o_u_n_t lines after the current line in the edit
       buffer, it shall be an error.

       If used as a motion command:

        1. The text region shall include the starting line and the next _c_o_u_n_t
           − 1 lines.

        2. Any text copied to a buffer shall be in line mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to _c_u_r_r_e_n_t _l_i_n_e+ _c_o_u_n_t.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank> for the <carriage-return>,
       <control>‐M, and ++ commands; otherwise, unchanged.

   CClleeaarr aanndd RReeddiissppllaayy
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--LL

       If in open mode, clear the screen and redisplay the current line.
       Otherwise, clear and redisplay the screen.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   MMoovvee UUpp
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <control>-P
                     [[_c_o_u_n_t]] k
                     [[_c_o_u_n_t]] −

       If there are less than _c_o_u_n_t lines before the current line in the edit
       buffer, it shall be an error.

       If used as a motion command:

        1. The text region shall include the starting line and the previous
           _c_o_u_n_t lines.

        2. Any text copied to a buffer shall be in line mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to _c_u_r_r_e_n_t _l_i_n_e − _c_o_u_n_t.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank> for the −− command; otherwise,
       unchanged.

   RReeddrraaww SSccrreeeenn
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--RR

       If any lines have been deleted from the display screen and flagged as
       deleted on the terminal using the @@ convention (see the beginning of
       the EXTENDED DESCRIPTION section), they shall be redisplayed to match
       the contents of the edit buffer.

       It is unspecified whether lines flagged with @@ because they do not fit
       on the terminal display shall be affected.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   SSccrroollll BBaacckkwwaarrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <control>-U

       If the current line is the first line of the edit buffer, it shall be
       an error.

       If no _c_o_u_n_t is specified, _c_o_u_n_t shall default to the _c_o_u_n_t associated
       with the previous <control>‐D or <control>‐U command. If there was no
       previous <control>‐D or <control>‐U command, _c_o_u_n_t shall default to the
       value of the ssccrroollll edit option.

       _C_u_r_r_e_n_t _l_i_n_e: If _c_o_u_n_t is greater than the current line, set to 1;
       otherwise, set to the current line − _c_o_u_n_t.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   SSccrroollll BBaacckkwwaarrdd bbyy LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <control>-Y

       Display the line _c_o_u_n_t lines before the first line currently displayed.

       If the current line is the first line of the edit buffer, it shall be
       an error. If this calculation would result in a line that is before the
       first line of the edit buffer, the first line of the display shall
       display some portion of the first line of the edit buffer.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged if the previous current character is displayed;
       otherwise, set to the first line displayed.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   EEddiitt tthhee AAlltteerrnnaattee FFiillee
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--^^

       This command shall be equivalent to the _e_x eeddiitt command, with the
       alternate pathname as its argument.

   TTeerrmmiinnaattee CCoommmmaanndd oorr IInnppuutt MMooddee
       _S_y_n_o_p_s_i_s:

                     <<EESSCC>>

       If a partial _v_i command (as defined by at least one, non-_c_o_u_n_t
       character) has been entered, discard the _c_o_u_n_t and the command
       character(s).

       Otherwise, if no command characters have been entered, and the <ESC>
       was the result of a map expansion, the terminal shall be alerted and
       the <ESC> character shall be discarded, but it shall not be an error.

       Otherwise, it shall be an error.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   SSeeaarrcchh ffoorr ttaaggssttrriinngg
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--]]

       If the current character is not a word or <blank>, it shall be an
       error.

       This command shall be equivalent to the _e_x ttaagg command, with the
       argument to that command defined as follows.

       If the current character is a <blank>:

        1. Skip all <blank> characters after the cursor up to the end of the
           line.

        2. If the end of the line is reached, it shall be an error.

       Then, the argument to the _e_x ttaagg command shall be the current character
       and all subsequent characters, up to the first non-word character or
       the end of the line.

   MMoovvee CCuurrssoorr FFoorrwwaarrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] <space>
                     [[_c_o_u_n_t]] l  (ell)

       If there are less than _c_o_u_n_t non-<newline> characters after the cursor
       on the current line, _c_o_u_n_t shall be adjusted to the number of
       non-<newline> characters after the cursor on the line.

       If used as a motion command:

        1. If the current or _c_o_u_n_tth character after the cursor is the last
           non-<newline> in the line, the text region shall be comprised of
           the current character up to and including the last non-<newline> in
           the line. Otherwise, the text region shall be from the current
           character up to, but not including, the _c_o_u_n_tth character after the
           cursor.

        2. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       If there are no non-<newline> characters after the current character on
       the current line, it shall be an error.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column that displays any portion of the
       _c_o_u_n_tth character after the current character.

   RReeppllaaccee TTeexxtt wwiitthh RReessuullttss ffrroomm SShheellll CCoommmmaanndd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] ! _m_o_t_i_o_n _s_h_e_l_l_-_c_o_m_m_a_n_d_s <newline>

       If the motion command is the !!  command repeated:

        1. If the edit buffer is empty and no _c_o_u_n_t was supplied, the command
           shall be the equivalent of the _e_x ::rreeaadd !!  command, with the text
           input, and no text shall be copied to any buffer.

        2. Otherwise:

            a. If there are less than _c_o_u_n_t −1 lines after the current line in
               the edit buffer, it shall be an error.

            b. The text region shall be from the current line up to and
               including the next _c_o_u_n_t −1 lines.

       Otherwise, the text region shall be the lines in which any character of
       the text region specified by the motion command appear.

       Any text copied to a buffer shall be in line mode.

       This command shall be equivalent to the _e_x !!  command for the specified
       lines.

   MMoovvee CCuurrssoorr ttoo EEnndd--ooff--LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] $

       It shall be an error if there are less than (_c_o_u_n_t −1) lines after the
       current line in the edit buffer.

       If used as a motion command:

        1. If _c_o_u_n_t is 1:

            a. It shall be an error if the line is empty.

            b. Otherwise, the text region shall consist of all characters from
               the starting cursor to the last non-<newline> in the line,
               inclusive, and any text copied to a buffer shall be in
               character mode.

        2. Otherwise, if the starting cursor position is at or before the
           first non-<blank> in the line, the text region shall consist of the
           current and the next _c_o_u_n_t −1 lines, and any text saved to a buffer
           shall be in line mode.

        3. Otherwise, the text region shall consist of all characters from the
           starting cursor to the last non-<newline> in the line that is _c_o_u_n_t
           −1 lines forward from the current line, and any text copied to a
           buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the _c_u_r_r_e_n_t _l_i_n_e + _c_o_u_n_t−1.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: The current column is set to the last display line
       column of the last non-<newline> in the line, or column position 1 if
       the line is empty.

       The current column shall be adjusted to be on the last display line
       column of the last non-<newline> of the current line as subsequent
       commands change the current line, until a command changes the current
       column.

   MMoovvee ttoo MMaattcchhiinngg CChhaarraacctteerr
       _S_y_n_o_p_s_i_s:

                     %%

       If the character at the current position is not a parenthesis, bracket,
       or curly brace, search forward in the line to the first one of those
       characters. If no such character is found, it shall be an error.

       The matching character shall be the parenthesis, bracket, or curly
       brace matching the parenthesis, bracket, or curly brace, respectively,
       that was at the current position or that was found on the current line.

       Matching shall be determined as follows, for an open parenthesis:

        1. Set a counter to 1.

        2. Search forwards until a parenthesis is found or the end of the edit
           buffer is reached.

        3. If the end of the edit buffer is reached, it shall be an error.

        4. If an open parenthesis is found, increment the counter by 1.

        5. If a close parenthesis is found, decrement the counter by 1.

        6. If the counter is zero, the current character is the matching
           character.

       Matching for a close parenthesis shall be equivalent, except that the
       search shall be backwards, from the starting character to the beginning
       of the buffer, a close parenthesis shall increment the counter by 1,
       and an open parenthesis shall decrement the counter by 1.

       Matching for brackets and curly braces shall be equivalent, except that
       searching shall be done for open and close brackets or open and close
       curly braces. It is implementation-defined whether other characters are
       searched for and matched as well.

       If used as a motion command:

        1. If the matching cursor was after the starting cursor in the edit
           buffer, and the starting cursor position was at or before the first
           non-<blank> non-<newline> in the starting line, and the matching
           cursor position was at or after the last non-<blank> non-<newline>
           in the matching line, the text region shall consist of the current
           line to the matching line, inclusive, and any text copied to a
           buffer shall be in line mode.

        2. If the matching cursor was before the starting cursor in the edit
           buffer, and the starting cursor position was at or after the last
           non-<blank> non-<newline> in the starting line, and the matching
           cursor position was at or before the first non-<blank>
           non-<newline> in the matching line, the text region shall consist
           of the current line to the matching line, inclusive, and any text
           copied to a buffer shall be in line mode.

        3. Otherwise, the text region shall consist of the starting character
           to the matching character, inclusive, and any text copied to a
           buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line where the matching character is located.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column where any portion of the
       matching character is displayed.

   RReeppeeaatt SSuubbssttiittuuttiioonn
       _S_y_n_o_p_s_i_s:

                     &&

       Repeat the previous substitution command. This command shall be
       equivalent to the _e_x && command with the current line as its addresses,
       and without _o_p_t_i_o_n_s, _c_o_u_n_t, or _f_l_a_g_s.

   RReettuurrnn ttoo PPrreevviioouuss CCoonntteexxtt aatt BBeeggiinnnniinngg ooff LLiinnee
       _S_y_n_o_p_s_i_s:

                     '' _c_h_a_r_a_c_t_e_r

       It shall be an error if there is no line in the edit buffer marked by
       _c_h_a_r_a_c_t_e_r.

       If used as a motion command:

        1. If the starting cursor is after the marked cursor, then the
           locations of the starting cursor and the marked cursor in the edit
           buffer shall be logically swapped.

        2. The text region shall consist of the starting line up to and
           including the marked line, and any text copied to a buffer shall be
           in line mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line referenced by the mark.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   RReettuurrnn ttoo PPrreevviioouuss CCoonntteexxtt
       _S_y_n_o_p_s_i_s:

                     `` _c_h_a_r_a_c_t_e_r

       It shall be an error if the marked line is no longer in the edit
       buffer. If the marked line no longer contains a character in the saved
       numbered character position, it shall be as if the marked position is
       the first non-<blank>.

       If used as a motion command:

        1. It shall be an error if the marked cursor references the same
           character in the edit buffer as the starting cursor.

        2. If the starting cursor is after the marked cursor, then the
           locations of the starting cursor and the marked cursor in the edit
           buffer shall be logically swapped.

        3. If the starting line is empty or the starting cursor is at or
           before the first non-<blank> non-<newline> of the starting line,
           and the marked cursor line is empty or the marked cursor references
           the first character of the marked cursor line, the text region
           shall consist of all lines containing characters from the starting
           cursor to the line before the marked cursor line, inclusive, and
           any text copied to a buffer shall be in line mode.

        4. Otherwise, if the marked cursor line is empty or the marked cursor
           references a character at or before the first non-<blank>
           non-<newline> of the marked cursor line, the region of text shall
           be from the starting cursor to the last non-<newline> of the line
           before the marked cursor line, inclusive, and any text copied to a
           buffer shall be in character mode.

        5. Otherwise, the region of text shall be from the starting cursor
           (inclusive), to the marked cursor (exclusive), and any text copied
           to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line referenced by the mark.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       character referenced by the mark is displayed.

   RReettuurrnn ttoo PPrreevviioouuss SSeeccttiioonn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] [[

       Move the cursor backward through the edit buffer to the first character
       of the previous section boundary, _c_o_u_n_t times.

       If used as a motion command:

        1. If the starting cursor was at the first character of the starting
           line or the starting line was empty, and the first character of the
           boundary was the first character of the boundary line, the text
           region shall consist of the current line up to and including the
           line where the _c_o_u_n_tth next boundary starts, and any text copied to
           a buffer shall be in line mode.

        2. If the boundary was the last line of the edit buffer or the last
           non-<newline> of the last line of the edit buffer, the text region
           shall consist of the last character in the edit buffer up to and
           including the starting character, and any text saved to a buffer
           shall be in character mode.

        3. Otherwise, the text region shall consist of the starting character
           up to but not including the first character in the _c_o_u_n_tth next
           boundary, and any text copied to a buffer shall be in character
           mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line where the _c_o_u_n_tth next boundary in the
       edit buffer starts.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       first character of the _c_o_u_n_tth next boundary is displayed, or column
       position 1 if the line is empty.

   MMoovvee ttoo NNeexxtt SSeeccttiioonn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] ]]

       Move the cursor forward through the edit buffer to the first character
       of the next section boundary, _c_o_u_n_t times.

       If used as a motion command:

        1. If the starting cursor was at the first character of the starting
           line or the starting line was empty, and the first character of the
           boundary was the first character of the boundary line, the text
           region shall consist of the current line up to and including the
           line where the _c_o_u_n_tth previous boundary starts, and any text
           copied to a buffer shall be in line mode.

        2. If the boundary was the first line of the edit buffer, the text
           region shall consist of the first character in the edit buffer up
           to but not including the starting character, and any text copied to
           a buffer shall be in character mode.

        3. Otherwise, the text region shall consist of the first character in
           the _c_o_u_n_tth previous section boundary up to but not including the
           starting character, and any text copied to a buffer shall be in
           character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line where the _c_o_u_n_tth previous boundary in
       the edit buffer starts.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       first character of the _c_o_u_n_tth previous boundary is displayed, or
       column position 1 if the line is empty.

   MMoovvee ttoo FFiirrsstt NNoonn--<<bbllaannkk>> PPoossiittiioonn oonn CCuurrrreenntt LLiinnee
       _S_y_n_o_p_s_i_s:

                     ^^

       If used as a motion command:

        1. If the line has no non-<blank> non-<newline> characters, or if the
           cursor is at the first non-<blank> non-<newline> of the line, it
           shall be an error.

        2. If the cursor is before the first non-<blank> non-<newline> of the
           line, the text region shall be comprised of the current character,
           up to, but not including, the first non-<blank> non-<newline> of
           the line.

        3. If the cursor is after the first non-<blank> non-<newline> of the
           line, the text region shall be from the character before the
           starting cursor up to and including the first non-<blank>
           non-<newline> of the line.

        4. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   CCuurrrreenntt aanndd LLiinnee AAbboovvee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] _

       If there are less than _c_o_u_n_t −1 lines after the current line in the
       edit buffer, it shall be an error.

       If used as a motion command:

        1. If _c_o_u_n_t is less than 2, the text region shall be the current line.

        2. Otherwise, the text region shall include the starting line and the
           next _c_o_u_n_t −1 lines.

        3. Any text copied to a buffer shall be in line mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to current line + _c_o_u_n_t −1.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   MMoovvee BBaacckk ttoo BBeeggiinnnniinngg ooff SSeenntteennccee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] (

       Move backward to the beginning of a sentence. This command shall be
       equivalent to the [[[[ command, with the exception that sentence
       boundaries shall be used instead of section boundaries.

   MMoovvee FFoorrwwaarrdd ttoo BBeeggiinnnniinngg ooff SSeenntteennccee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] )

       Move forward to the beginning of a sentence. This command shall be
       equivalent to the ]]]] command, with the exception that sentence
       boundaries shall be used instead of section boundaries.

   MMoovvee BBaacckk ttoo PPrreecceeddiinngg PPaarraaggrraapphh
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] {

       Move back to the beginning of the preceding paragraph. This command
       shall be equivalent to the [[[[ command, with the exception that
       paragraph boundaries shall be used instead of section boundaries.

   MMoovvee FFoorrwwaarrdd ttoo NNeexxtt PPaarraaggrraapphh
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] }

       Move forward to the beginning of the next paragraph. This command shall
       be equivalent to the ]]]] command, with the exception that paragraph
       boundaries shall be used instead of section boundaries.

   MMoovvee ttoo SSppeecciiffiicc CCoolluummnn PPoossiittiioonn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] |

       For the purposes of this command, lines that are too long for the
       current display and that have been folded shall be treated as having a
       single, 1−based, number of columns.

       If there are less than _c_o_u_n_t columns in which characters from the
       current line are displayed on the screen, _c_o_u_n_t shall be adjusted to be
       the last column in which any portion of the line is displayed on the
       screen.

       If used as a motion command:

        1. If the line is empty, or the cursor character is the same as the
           character on the _c_o_u_n_tth column of the line, it shall be an error.

        2. If the cursor is before the _c_o_u_n_tth column of the line, the text
           region shall be comprised of the current character, up to but not
           including the character on the _c_o_u_n_tth column of the line.

        3. If the cursor is after the _c_o_u_n_tth column of the line, the text
           region shall be from the character before the starting cursor up to
           and including the character on the _c_o_u_n_tth column of the line.

        4. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       character that is displayed in the _c_o_u_n_t column of the line is
       displayed.

   RReevveerrssee FFiinndd CChhaarraacctteerr
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] ,

       If the last FF, ff, TT, or tt command was FF, ff, TT, or tt, this command shall
       be equivalent to an ff, FF, tt, or TT command, respectively, with the
       specified _c_o_u_n_t and the same search character.

       If there was no previous FF, ff, TT, or tt command, it shall be an error.

   RReeppeeaatt
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] .

       Repeat the last !!, <<, >>, AA, CC, DD, II, JJ, OO, PP, RR, SS, XX, YY, aa, cc, dd, ii,
       oo, pp, rr, ss, xx, yy, or ~~ command. It shall be an error if none of these
       commands have been executed. Commands (other than commands that enter
       text input mode) executed as a result of map expansions, shall not
       change the value of the last repeatable command.

       Repeated commands with associated motion commands shall repeat the
       motion command as well; however, any specified _c_o_u_n_t shall replace the
       _c_o_u_n_t(s) that were originally specified to the repeated command or its
       associated motion command.

       If the motion component of the repeated command is ff, FF, tt, or TT, the
       repeated command shall not set the remembered search character for the
       ;; and ,, commands.

       If the repeated command is pp or PP, and the buffer associated with that
       command was a numeric buffer named with a number less than 9, the
       buffer associated with the repeated command shall be set to be the
       buffer named by the name of the previous buffer logically incremented
       by 1.

       If the repeated character is a text input command, the input text
       associated with that command is repeated literally:

        *  Input characters are neither macro or abbreviation-expanded.

        *  Input characters are not interpreted in any special way with the
           exception that <newline>, <carriage-return>, and <control>‐T behave
           as described in _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i.

       _C_u_r_r_e_n_t _l_i_n_e: Set as described for the repeated command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set as described for the repeated command.

   FFiinndd RReegguullaarr EExxpprreessssiioonn
       _S_y_n_o_p_s_i_s:

                     //

       If the input line contains no non-<newline> characters, it shall be
       equivalent to a line containing only the last regular expression
       encountered. The enhanced regular expressions supported by _v_i are
       described in _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s _i_n _e_x.

       Otherwise, the line shall be interpreted as one or more regular
       expressions, optionally followed by an address offset or a _v_i zz
       command.

       If the regular expression is not the last regular expression on the
       line, or if a line offset or zz command is specified, the regular
       expression shall be terminated by an unescaped ''//'' character, which
       shall not be used as part of the regular expression.  If the regular
       expression is not the first regular expression on the line, it shall be
       preceded by zero or more <blank> characters, a <semicolon>, zero or
       more <blank> characters, and a leading ''//'' character, which shall not
       be interpreted as part of the regular expression. It shall be an error
       to precede any regular expression with any characters other than these.

       Each search shall begin from the character after the first character of
       the last match (or, if it is the first search, after the cursor). If
       the wwrraappssccaann edit option is set, the search shall continue to the
       character before the starting cursor character; otherwise, to the end
       of the edit buffer. It shall be an error if any search fails to find a
       match, and an informational message to this effect shall be displayed.

       An optional address offset (see _A_d_d_r_e_s_s_i_n_g _i_n _e_x) can be specified
       after the last regular expression by including a trailing ''//'' character
       after the regular expression and specifying the address offset. This
       offset will be from the line containing the match for the last regular
       expression specified. It shall be an error if the line offset would
       indicate a line address less than 1 or greater than the last line in
       the edit buffer. An address offset of zero shall be supported. It shall
       be an error to follow the address offset with any other characters than
       <blank> characters.

       If not used as a motion command, an optional zz command (see _R_e_d_r_a_w
       _W_i_n_d_o_w) can be specified after the last regular expression by including
       a trailing ''//'' character after the regular expression, zero or more
       <blank> characters, a ''zz'', zero or more <blank> characters, an optional
       new wwiinnddooww edit option value, zero or more <blank> characters, and a
       location character. The effect shall be as if the zz command was
       executed after the // command. It shall be an error to follow the zz
       command with any other characters than <blank> characters.

       The remembered search direction shall be set to forward.

       If used as a motion command:

        1. It shall be an error if the last match references the same
           character in the edit buffer as the starting cursor.

        2. If any address offset is specified, the last match shall be
           adjusted by the specified offset as described previously.

        3. If the starting cursor is after the last match, then the locations
           of the starting cursor and the last match in the edit buffer shall
           be logically swapped.

        4. If any address offset is specified, the text region shall consist
           of all lines containing characters from the starting cursor to the
           last match line, inclusive, and any text copied to a buffer shall
           be in line mode.

        5. Otherwise, if the starting line is empty or the starting cursor is
           at or before the first non-<blank> non-<newline> of the starting
           line, and the last match line is empty or the last match starts at
           the first character of the last match line, the text region shall
           consist of all lines containing characters from the starting cursor
           to the line before the last match line, inclusive, and any text
           copied to a buffer shall be in line mode.

        6. Otherwise, if the last match line is empty or the last match begins
           at a character at or before the first non-<blank> non-<newline> of
           the last match line, the region of text shall be from the current
           cursor to the last non-<newline> of the line before the last match
           line, inclusive, and any text copied to a buffer shall be in
           character mode.

        7. Otherwise, the region of text shall be from the current cursor
           (inclusive), to the first character of the last match (exclusive),
           and any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: If a match is found, set to the last matched line plus
       the address offset, if any; otherwise, unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column on which any portion of the
       first character in the last matched string is displayed, if a match is
       found; otherwise, unchanged.

   MMoovvee ttoo FFiirrsstt CChhaarraacctteerr iinn LLiinnee
       _S_y_n_o_p_s_i_s:

                     00  (zero)

       Move to the first character on the current line. The character ''00''
       shall not be interpreted as a command if it is immediately preceded by
       a digit.

       If used as a motion command:

        1. If the cursor character is the first character in the line, it
           shall be an error.

        2. The text region shall be from the character before the cursor
           character up to and including the first character in the line.

        3. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: The last column in which any portion of the first
       character in the line is displayed, or if the line is empty, unchanged.

   EExxeeccuuttee aann eexx CCoommmmaanndd
       _S_y_n_o_p_s_i_s:

                     ::

       Execute one or more _e_x commands.

       If any portion of the screen other than the last line of the screen was
       overwritten by any _e_x command (except sshheellll), _v_i shall display a
       message indicating that it is waiting for an input from the user, and
       shall then read a character. This action may also be taken for other,
       unspecified reasons.

       If the next character entered is a ''::'', another _e_x command shall be
       accepted and executed. Any other character shall cause the screen to be
       refreshed and _v_i shall return to command mode.

       _C_u_r_r_e_n_t _l_i_n_e: As specified for the _e_x command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: As specified for the _e_x command.

   RReeppeeaatt FFiinndd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] ;

       This command shall be equivalent to the last FF, ff, TT, or tt command,
       with the specified _c_o_u_n_t, and with the same search character used for
       the last FF, ff, TT, or tt command. If there was no previous FF, ff, TT, or tt
       command, it shall be an error.

   SShhiifftt LLeefftt
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] < _m_o_t_i_o_n

       If the motion command is the << command repeated:

        1. If there are less than _c_o_u_n_t −1 lines after the current line in the
           edit buffer, it shall be an error.

        2. The text region shall be from the current line, up to and including
           the next _c_o_u_n_t −1 lines.

       Shift any line in the text region specified by the _c_o_u_n_t and motion
       command one shiftwidth (see the _e_x sshhiiffttwwiiddtthh option) toward the start
       of the line, as described by the _e_x << command. The unshifted lines
       shall be copied to the unnamed buffer in line mode.

       _C_u_r_r_e_n_t _l_i_n_e: If the motion was from the current cursor position toward
       the end of the edit buffer, unchanged. Otherwise, set to the first line
       in the edit buffer that is part of the text region specified by the
       motion command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   SShhiifftt RRiigghhtt
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] > _m_o_t_i_o_n

       If the motion command is the >> command repeated:

        1. If there are less than _c_o_u_n_t −1 lines after the current line in the
           edit buffer, it shall be an error.

        2. The text region shall be from the current line, up to and including
           the next _c_o_u_n_t −1 lines.

       Shift any line with characters in the text region specified by the
       _c_o_u_n_t and motion command one shiftwidth (see the _e_x sshhiiffttwwiiddtthh option)
       away from the start of the line, as described by the _e_x >> command. The
       unshifted lines shall be copied into the unnamed buffer in line mode.

       _C_u_r_r_e_n_t _l_i_n_e: If the motion was from the current cursor position toward
       the end of the edit buffer, unchanged. Otherwise, set to the first line
       in the edit buffer that is part of the text region specified by the
       motion command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   SSccaann BBaacckkwwaarrddss ffoorr RReegguullaarr EExxpprreessssiioonn
       _S_y_n_o_p_s_i_s:

                     ??

       Scan backwards; the ??  command shall be equivalent to the // command
       (see _F_i_n_d _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n) with the following exceptions:

        1. The input prompt shall be a ''??''.

        2. Each search shall begin from the character before the first
           character of the last match (or, if it is the first search, the
           character before the cursor character).

        3. The search direction shall be from the cursor toward the beginning
           of the edit buffer, and the wwrraappssccaann edit option shall affect
           whether the search wraps to the end of the edit buffer and
           continues.

        4. The remembered search direction shall be set to backward.

   EExxeeccuuttee
       _S_y_n_o_p_s_i_s:

                     @@_b_u_f_f_e_r

       If the _b_u_f_f_e_r is specified as @@, the last buffer executed shall be
       used. If no previous buffer has been executed, it shall be an error.

       Behave as if the contents of the named buffer were entered as standard
       input. After each line of a line-mode buffer, and all but the last line
       of a character mode buffer, behave as if a <newline> were entered as
       standard input.

       If an error occurs during this process, an error message shall be
       written, and no more characters resulting from the execution of this
       command shall be processed.

       If a _c_o_u_n_t is specified, behave as if that count were entered as user
       input before the characters from the @@ buffer were entered.

       _C_u_r_r_e_n_t _l_i_n_e: As specified for the individual commands.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: As specified for the individual commands.

   RReevveerrssee CCaassee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] ~

       Reverse the case of the current character and the next _c_o_u_n_t −1
       characters, such that lowercase characters that have uppercase
       counterparts shall be changed to uppercase characters, and uppercase
       characters that have lowercase counterparts shall be changed to
       lowercase characters, as prescribed by the current locale. No other
       characters shall be affected by this command.

       If there are less than _c_o_u_n_t −1 characters after the cursor in the edit
       buffer, _c_o_u_n_t shall be adjusted to the number of characters after the
       cursor in the edit buffer minus 1.

       For the purposes of this command, the next character after the last
       non-<newline> on the line shall be the next character in the edit
       buffer.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line including the (_c_o_u_n_t−1)th character after
       the cursor.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       (_c_o_u_n_t−1)th character after the cursor is displayed.

   AAppppeenndd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] a

       Enter text input mode after the current cursor position. No characters
       already in the edit buffer shall be affected by this command. A _c_o_u_n_t
       shall cause the input text to be appended _c_o_u_n_t −1 more times to the
       end of the input.

       _C_u_r_r_e_n_t _l_i_n_e_/_c_o_l_u_m_n: As specified for the text input commands (see
       _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i).

   AAppppeenndd aatt EEnndd--ooff--LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] A

       This command shall be equivalent to the _v_i command:


           $ [[ _c_o_u_n_t ]] a

       (see _A_p_p_e_n_d).

   MMoovvee BBaacckkwwaarrdd ttoo PPrreecceeddiinngg WWoorrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] b

       With the exception that words are used as the delimiter instead of
       bigwords, this command shall be equivalent to the BB command.

   MMoovvee BBaacckkwwaarrdd ttoo PPrreecceeddiinngg BBiiggwwoorrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] B

       If the edit buffer is empty or the cursor is on the first character of
       the edit buffer, it shall be an error. If less than _c_o_u_n_t bigwords
       begin between the cursor and the start of the edit buffer, _c_o_u_n_t shall
       be adjusted to the number of bigword beginnings between the cursor and
       the start of the edit buffer.

       If used as a motion command:

        1. The text region shall be from the first character of the _c_o_u_n_tth
           previous bigword beginning up to but not including the cursor
           character.

        2. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line containing the _c_u_r_r_e_n_t _c_o_l_u_m_n.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column upon which any part of the first
       character of the _c_o_u_n_tth previous bigword is displayed.

   CChhaannggee
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] c _m_o_t_i_o_n

       If the motion command is the cc command repeated:

        1. The buffer text shall be in line mode.

        2. If there are less than _c_o_u_n_t −1 lines after the current line in the
           edit buffer, it shall be an error.

        3. The text region shall be from the current line up to and including
           the next _c_o_u_n_t −1 lines.

       Otherwise, the buffer text mode and text region shall be as specified
       by the motion command.

       The replaced text shall be copied into _b_u_f_f_e_r, if specified, and into
       the unnamed buffer. If the text to be replaced contains characters from
       more than a single line, or the buffer text is in line mode, the
       replaced text shall be copied into the numeric buffers as well.

       If the buffer text is in line mode:

        1. Any lines that contain characters in the region shall be deleted,
           and the editor shall enter text input mode at the beginning of a
           new line which shall replace the first line deleted.

        2. If the aauuttooiinnddeenntt edit option is set, aauuttooiinnddeenntt characters equal
           to the aauuttooiinnddeenntt characters on the first line deleted shall be
           inserted as if entered by the user.

       Otherwise, if characters from more than one line are in the region of
       text:

        1. The text shall be deleted.

        2. Any text remaining in the last line in the text region shall be
           appended to the first line in the region, and the last line in the
           region shall be deleted.

        3. The editor shall enter text input mode after the last character not
           deleted from the first line in the text region, if any; otherwise,
           on the first column of the first line in the region.

       Otherwise:

        1. If the glyph for ''$$'' is smaller than the region, the end of the
           region shall be marked with a ''$$''.

        2. The editor shall enter text input mode, overwriting the region of
           text.

       _C_u_r_r_e_n_t _l_i_n_e_/_c_o_l_u_m_n: As specified for the text input commands (see
       _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i).

   CChhaannggee ttoo EEnndd--ooff--LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] C

       This command shall be equivalent to the _v_i command:


           [[_b_u_f_f_e_r]][[_c_o_u_n_t]] c$

       See the cc command.

   DDeelleettee
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] d _m_o_t_i_o_n

       If the motion command is the dd command repeated:

        1. The buffer text shall be in line mode.

        2. If there are less than _c_o_u_n_t −1 lines after the current line in the
           edit buffer, it shall be an error.

        3. The text region shall be from the current line up to and including
           the next _c_o_u_n_t −1 lines.

       Otherwise, the buffer text mode and text region shall be as specified
       by the motion command.

       If in open mode, and the current line is deleted, and the line remains
       on the display, an ''@@'' character shall be displayed as the first glyph
       of that line.

       Delete the region of text into _b_u_f_f_e_r, if specified, and into the
       unnamed buffer. If the text to be deleted contains characters from more
       than a single line, or the buffer text is in line mode, the deleted
       text shall be copied into the numeric buffers, as well.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the first text region line that appears in the
       edit buffer, unless that line has been deleted, in which case it shall
       be set to the last line in the edit buffer, or line 1 if the edit
       buffer is empty.

       _C_u_r_r_e_n_t _c_o_l_u_m_n:

        1. If the line is empty, set to column position 1.

        2. Otherwise, if the buffer text is in line mode or the motion was
           from the cursor toward the end of the edit buffer:

            a. If a character from the current line is displayed in the
               current column, set to the last column that displays any
               portion of that character.

            b. Otherwise, set to the last column in which any portion of any
               character in the line is displayed.

        3. Otherwise, if a character is displayed in the column that began the
           text region, set to the last column that displays any portion of
           that character.

        4. Otherwise, set to the last column in which any portion of any
           character in the line is displayed.

   DDeelleettee ttoo EEnndd--ooff--LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]] D

       Delete the text from the current position to the end of the current
       line; equivalent to the _v_i command:


           [[_b_u_f_f_e_r]] d$

   MMoovvee ttoo EEnndd--ooff--WWoorrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] e

       With the exception that words are used instead of bigwords as the
       delimiter, this command shall be equivalent to the EE command.

   MMoovvee ttoo EEnndd--ooff--BBiiggwwoorrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] E

       If the edit buffer is empty it shall be an error. If less than _c_o_u_n_t
       bigwords end between the cursor and the end of the edit buffer, _c_o_u_n_t
       shall be adjusted to the number of bigword endings between the cursor
       and the end of the edit buffer.

       If used as a motion command:

        1. The text region shall be from the last character of the _c_o_u_n_tth
           next bigword up to and including the cursor character.

        2. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line containing the current column.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column upon which any part of the last
       character of the _c_o_u_n_tth next bigword is displayed.

   FFiinndd CChhaarraacctteerr iinn CCuurrrreenntt LLiinnee ((FFoorrwwaarrdd))
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] f _c_h_a_r_a_c_t_e_r

       It shall be an error if _c_o_u_n_t occurrences of the character do not occur
       after the cursor in the line.

       If used as a motion command:

        1. The text range shall be from the cursor character up to and
           including the _c_o_u_n_tth occurrence of the specified character after
           the cursor.

        2. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       _c_o_u_n_tth occurrence of the specified character after the cursor appears
       in the line.

   FFiinndd CChhaarraacctteerr iinn CCuurrrreenntt LLiinnee ((RReevveerrssee))
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] F _c_h_a_r_a_c_t_e_r

       It shall be an error if _c_o_u_n_t occurrences of the character do not occur
       before the cursor in the line.

       If used as a motion command:

        1. The text region shall be from the _c_o_u_n_tth occurrence of the
           specified character before the cursor, up to, but not including the
           cursor character.

        2. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       _c_o_u_n_tth occurrence of the specified character before the cursor appears
       in the line.

   MMoovvee ttoo LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] G

       If _c_o_u_n_t is not specified, it shall default to the last line of the
       edit buffer.  If _c_o_u_n_t is greater than the last line of the edit
       buffer, it shall be an error.

       If used as a motion command:

        1. The text region shall be from the cursor line up to and including
           the specified line.

        2. Any text copied to a buffer shall be in line mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Set to _c_o_u_n_t if _c_o_u_n_t is specified; otherwise, the last
       line.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   MMoovvee ttoo TToopp ooff SSccrreeeenn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] H

       If the beginning of the line _c_o_u_n_t greater than the first line of which
       any portion appears on the display does not exist, it shall be an
       error.

       If used as a motion command:

        1. If in open mode, the text region shall be the current line.

        2. Otherwise, the text region shall be from the starting line up to
           and including (the first line of the display + _c_o_u_n_t −1).

        3. Any text copied to a buffer shall be in line mode.

       If not used as a motion command:

       If in open mode, this command shall set the current column to
       non-<blank> and do nothing else.

       Otherwise, it shall set the current line and current column as follows.

       _C_u_r_r_e_n_t _l_i_n_e: Set to (the first line of the display + _c_o_u_n_t −1).

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   IInnsseerrtt BBeeffoorree CCuurrssoorr
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] i

       Enter text input mode before the current cursor position. No characters
       already in the edit buffer shall be affected by this command. A _c_o_u_n_t
       shall cause the input text to be appended _c_o_u_n_t −1 more times to the
       end of the input.

       _C_u_r_r_e_n_t _l_i_n_e_/_c_o_l_u_m_n: As specified for the text input commands (see
       _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i).

   IInnsseerrtt aatt BBeeggiinnnniinngg ooff LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] I

       This command shall be equivalent to the _v_i command ^[_c_o_u_n_t]ii.

   JJooiinn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] J

       If the current line is the last line in the edit buffer, it shall be an
       error.

       This command shall be equivalent to the _e_x jjooiinn command with no
       addresses, and an _e_x command _c_o_u_n_t value of 1 if _c_o_u_n_t was not
       specified or if a _c_o_u_n_t of 1 was specified, and an _e_x command _c_o_u_n_t
       value of _c_o_u_n_t −1 for any other value of _c_o_u_n_t, except that the current
       line and column shall be set as follows.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: The last column in which any portion of the character
       following the last character in the initial line is displayed, or the
       last non-<newline> in the line if no characters were appended.

   MMoovvee ttoo BBoottttoomm ooff SSccrreeeenn
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] L

       If the beginning of the line _c_o_u_n_t less than the last line of which any
       portion appears on the display does not exist, it shall be an error.

       If used as a motion command:

        1. If in open mode, the text region shall be the current line.

        2. Otherwise, the text region shall include all lines from the
           starting cursor line to (the last line of the display −(_c_o_u_n_t −1)).

        3. Any text copied to a buffer shall be in line mode.

       If not used as a motion command:

        1. If in open mode, this command shall set the current column to
           non-<blank> and do nothing else.

        2. Otherwise, it shall set the current line and current column as
           follows.

       _C_u_r_r_e_n_t _l_i_n_e: Set to (the last line of the display −(_c_o_u_n_t −1)).

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   MMaarrkk PPoossiittiioonn
       _S_y_n_o_p_s_i_s:

                     mm _l_e_t_t_e_r

       This command shall be equivalent to the _e_x mmaarrkk command with the
       specified character as an argument.

   MMoovvee ttoo MMiiddddllee ooff SSccrreeeenn
       _S_y_n_o_p_s_i_s:

                     MM

       The middle line of the display shall be calculated as follows:


           ((tthhee ttoopp lliinnee ooff tthhee ddiissppllaayy)) ++ ((((((nnuummbbeerr ooff lliinneess ddiissppllaayyeedd)) ++11)) //22)) −−11

       If used as a motion command:

        1. If in open mode, the text region shall be the current line.

        2. Otherwise, the text region shall include all lines from the
           starting cursor line up to and including the middle line of the
           display.

        3. Any text copied to a buffer shall be in line mode.

       If not used as a motion command:

       If in open mode, this command shall set the current column to
       non-<blank> and do nothing else.

       Otherwise, it shall set the current line and current column as follows.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the middle line of the display.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   RReeppeeaatt RReegguullaarr EExxpprreessssiioonn FFiinndd ((FFoorrwwaarrdd))
       _S_y_n_o_p_s_i_s:

                     nn

       If the remembered search direction was forward, the nn command shall be
       equivalent to the _v_i // command with no characters entered by the user.
       Otherwise, it shall be equivalent to the _v_i ??  command with no
       characters entered by the user.

       If the nn command is used as a motion command for the !!  command, the
       editor shall not enter text input mode on the last line on the screen,
       and shall behave as if the user entered a single ''!!'' character as the
       text input.

   RReeppeeaatt RReegguullaarr EExxpprreessssiioonn FFiinndd ((RReevveerrssee))
       _S_y_n_o_p_s_i_s:

                     NN

       Scan for the next match of the last pattern given to // or ??, but in the
       reverse direction; this is the reverse of nn.

       If the remembered search direction was forward, the NN command shall be
       equivalent to the _v_i ??  command with no characters entered by the user.
       Otherwise, it shall be equivalent to the _v_i // command with no
       characters entered by the user. If the NN command is used as a motion
       command for the !!  command, the editor shall not enter text input mode
       on the last line on the screen, and shall behave as if the user entered
       a single !!  character as the text input.

   IInnsseerrtt EEmmppttyy LLiinnee BBeellooww
       _S_y_n_o_p_s_i_s:

                     oo

       Enter text input mode in a new line appended after the current line. A
       _c_o_u_n_t shall cause the input text to be appended _c_o_u_n_t −1 more times to
       the end of the already added text, each time starting on a new,
       appended line.

       _C_u_r_r_e_n_t _l_i_n_e_/_c_o_l_u_m_n: As specified for the text input commands (see
       _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i).

   IInnsseerrtt EEmmppttyy LLiinnee AAbboovvee
       _S_y_n_o_p_s_i_s:

                     OO

       Enter text input mode in a new line inserted before the current line. A
       _c_o_u_n_t shall cause the input text to be appended _c_o_u_n_t −1 more times to
       the end of the already added text, each time starting on a new,
       appended line.

       _C_u_r_r_e_n_t _l_i_n_e_/_c_o_l_u_m_n: As specified for the text input commands (see
       _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i).

   PPuutt ffrroomm BBuuffffeerr FFoolllloowwiinngg
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]] p

       If no _b_u_f_f_e_r is specified, the unnamed buffer shall be used.

       If the buffer text is in line mode, the text shall be appended below
       the current line, and each line of the buffer shall become a new line
       in the edit buffer. A _c_o_u_n_t shall cause the buffer text to be appended
       _c_o_u_n_t −1 more times to the end of the already added text, each time
       starting on a new, appended line.

       If the buffer text is in character mode, the text shall be appended
       into the current line after the cursor, and each line of the buffer
       other than the first and last shall become a new line in the edit
       buffer. A _c_o_u_n_t shall cause the buffer text to be appended _c_o_u_n_t −1
       more times to the end of the already added text, each time starting
       after the last added character.

       _C_u_r_r_e_n_t _l_i_n_e: If the buffer text is in line mode, set the line to line
       +1; otherwise, unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: If the buffer text is in line mode:

        1. If there is a non-<blank> in the first line of the buffer, set to
           the last column on which any portion of the first non-<blank> in
           the line is displayed.

        2. If there is no non-<blank> in the first line of the buffer, set to
           the last column on which any portion of the last non-<newline> in
           the first line of the buffer is displayed.

       If the buffer text is in character mode:

        1. If the text in the buffer is from more than a single line, then set
           to the last column on which any portion of the first character from
           the buffer is displayed.

        2. Otherwise, if the buffer is the unnamed buffer, set to the last
           column on which any portion of the last character from the buffer
           is displayed.

        3. Otherwise, set to the first column on which any portion of the
           first character from the buffer is displayed.

   PPuutt ffrroomm BBuuffffeerr BBeeffoorree
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]] P

       If no _b_u_f_f_e_r is specified, the unnamed buffer shall be used.

       If the buffer text is in line mode, the text shall be inserted above
       the current line, and each line of the buffer shall become a new line
       in the edit buffer. A _c_o_u_n_t shall cause the buffer text to be appended
       _c_o_u_n_t −1 more times to the end of the already added text, each time
       starting on a new, appended line.

       If the buffer text is in character mode, the text shall be inserted
       into the current line before the cursor, and each line of the buffer
       other than the first and last shall become a new line in the edit
       buffer. A _c_o_u_n_t shall cause the buffer text to be appended _c_o_u_n_t −1
       more times to the end of the already added text, each time starting
       after the last added character.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: If the buffer text is in line mode:

        1. If there is a non-<blank> in the first line of the buffer, set to
           the last column on which any portion of that character is
           displayed.

        2. If there is no non-<blank> in the first line of the buffer, set to
           the last column on which any portion of the last non-<newline> in
           the first line of the buffer is displayed.

       If the buffer text is in character mode:

        1. If the text in the buffer is from more than a single line, then set
           to the last column on which any portion of the first character from
           the buffer is displayed.

        2. Otherwise, if the buffer is the unnamed buffer, set to the last
           column on which any portion of the last character from the buffer
           is displayed.

        3. Otherwise, set to the first column on which any portion of the
           first character from the buffer is displayed.

   EEnntteerr eexx MMooddee
       _S_y_n_o_p_s_i_s:

                     QQ

       Leave visual or open mode and enter _e_x command mode.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   RReeppllaaccee CChhaarraacctteerr
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] r _c_h_a_r_a_c_t_e_r

       Replace the _c_o_u_n_t characters at and after the cursor with the specified
       character. If there are less than _c_o_u_n_t non-<newline> characters at and
       after the cursor on the line, it shall be an error.

       If character is <control>‐V, any next character other than the
       <newline> shall be stripped of any special meaning and used as a
       literal character.

       If character is <ESC>, no replacement shall be made and the current
       line and current column shall be unchanged.

       If character is <carriage-return> or <newline>, _c_o_u_n_t new lines shall
       be appended to the current line. All but the last of these lines shall
       be empty.  _c_o_u_n_t characters at and after the cursor shall be discarded,
       and any remaining characters after the cursor in the current line shall
       be moved to the last of the new lines. If the aauuttooiinnddeenntt edit option is
       set, they shall be preceded by the same number of aauuttooiinnddeenntt characters
       found on the line from which the command was executed.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged unless the replacement character is a
       <carriage-return> or <newline>, in which case it shall be set to line +
       _c_o_u_n_t.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column position on which a portion of
       the last replaced character is displayed, or if the replacement
       character caused new lines to be created, set to non-<blank>.

   RReeppllaaccee CChhaarraacctteerrss
       _S_y_n_o_p_s_i_s:

                     RR

       Enter text input mode at the current cursor position possibly replacing
       text on the current line. A _c_o_u_n_t shall cause the input text to be
       appended _c_o_u_n_t −1 more times to the end of the input.

       _C_u_r_r_e_n_t _l_i_n_e_/_c_o_l_u_m_n: As specified for the text input commands (see
       _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i).

   SSuubbssttiittuuttee CChhaarraacctteerr
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] s

       This command shall be equivalent to the _v_i command:


           [[_b_u_f_f_e_r]][[_c_o_u_n_t]] c<space>

   SSuubbssttiittuuttee LLiinneess
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] S

       This command shall be equivalent to the _v_i command:


           [[_b_u_f_f_e_r]][[_c_o_u_n_t]] c_

   MMoovvee CCuurrssoorr ttoo BBeeffoorree CChhaarraacctteerr ((FFoorrwwaarrdd))
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] t _c_h_a_r_a_c_t_e_r

       It shall be an error if _c_o_u_n_t occurrences of the character do not occur
       after the cursor in the line.

       If used as a motion command:

        1. The text region shall be from the cursor up to but not including
           the _c_o_u_n_tth occurrence of the specified character after the cursor.

        2. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       character before the _c_o_u_n_tth occurrence of the specified character
       after the cursor appears in the line.

   MMoovvee CCuurrssoorr ttoo AAfftteerr CChhaarraacctteerr ((RReevveerrssee))
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] T _c_h_a_r_a_c_t_e_r

       It shall be an error if _c_o_u_n_t occurrences of the character do not occur
       before the cursor in the line.

       If used as a motion command:

        1. If the character before the cursor is the specified character, it
           shall be an error.

        2. The text region shall be from the character before the cursor up to
           but not including the _c_o_u_n_tth occurrence of the specified character
           before the cursor.

        3. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any portion of the
       character after the _c_o_u_n_tth occurrence of the specified character
       before the cursor appears in the line.

   UUnnddoo
       _S_y_n_o_p_s_i_s:

                     uu

       This command shall be equivalent to the _e_x uunnddoo command except that the
       current line and current column shall be set as follows:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the first line added or changed if any; otherwise,
       move to the line preceding any deleted text if one exists; otherwise,
       move to line 1.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: If undoing an _e_x command, set to the first non-<blank>.

       Otherwise, if undoing a text input command:

        1. If the command was a CC, cc, OO, oo, RR, SS, or ss command, the current
           column shall be set to the value it held when the text input
           command was entered.

        2. Otherwise, set to the last column in which any portion of the first
           character after the deleted text is displayed, or, if no
           non-<newline> characters follow the text deleted from this line,
           set to the last column in which any portion of the last
           non-<newline> in the line is displayed, or 1 if the line is empty.

       Otherwise, if a single line was modified (that is, not added or
       deleted) by the uu command:

        1. If text was added or changed, set to the last column in which any
           portion of the first character added or changed is displayed.

        2. If text was deleted, set to the last column in which any portion of
           the first character after the deleted text is displayed, or, if no
           non-<newline> characters follow the deleted text, set to the last
           column in which any portion of the last non-<newline> in the line
           is displayed, or 1 if the line is empty.

       Otherwise, set to non-<blank>.

   UUnnddoo CCuurrrreenntt LLiinnee
       _S_y_n_o_p_s_i_s:

                     UU

       Restore the current line to its state immediately before the most
       recent time that it became the current line.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the first column in the line in which any
       portion of the first character in the line is displayed.

   MMoovvee ttoo BBeeggiinnnniinngg ooff WWoorrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] w

       With the exception that words are used as the delimiter instead of
       bigwords, this command shall be equivalent to the WW command.

   MMoovvee ttoo BBeeggiinnnniinngg ooff BBiiggwwoorrdd
       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] W

       If the edit buffer is empty, it shall be an error. If there are less
       than _c_o_u_n_t bigwords between the cursor and the end of the edit buffer,
       _c_o_u_n_t shall be adjusted to move the cursor to the last bigword in the
       edit buffer.

       If used as a motion command:

        1. If the associated command is cc, _c_o_u_n_t is 1, and the cursor is on a
           <blank>, the region of text shall be the current character and no
           further action shall be taken.

        2. If there are less than _c_o_u_n_t bigwords between the cursor and the
           end of the edit buffer, then the command shall succeed, and the
           region of text shall include the last character of the edit buffer.

        3. If there are <blank> characters or an end-of-line that precede the
           _c_o_u_n_tth bigword, and the associated command is cc, the region of
           text shall be up to and including the last character before the
           preceding <blank> characters or end-of-line.

        4. If there are <blank> characters or an end-of-line that precede the
           bigword, and the associated command is dd or yy, the region of text
           shall be up to and including the last <blank> before the start of
           the bigword or end-of-line.

        5. Any text copied to a buffer shall be in character mode.

       If not used as a motion command:

        1. If the cursor is on the last character of the edit buffer, it shall
           be an error.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line containing the current column.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the last column in which any part of the first
       character of the _c_o_u_n_tth next bigword is displayed.

   DDeelleettee CChhaarraacctteerr aatt CCuurrssoorr
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] x

       Delete the _c_o_u_n_t characters at and after the current character into
       _b_u_f_f_e_r, if specified, and into the unnamed buffer.

       If the line is empty, it shall be an error. If there are less than
       _c_o_u_n_t non-<newline> characters at and after the cursor on the current
       line, _c_o_u_n_t shall be adjusted to the number of non-<newline> characters
       at and after the cursor.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: If the line is empty, set to column position 1.
       Otherwise, if there were _c_o_u_n_t or less non-<newline> characters at and
       after the cursor on the current line, set to the last column that
       displays any part of the last non-<newline> of the line. Otherwise,
       unchanged.

   DDeelleettee CChhaarraacctteerr BBeeffoorree CCuurrssoorr
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] X

       Delete the _c_o_u_n_t characters before the current character into _b_u_f_f_e_r,
       if specified, and into the unnamed buffer.

       If there are no characters before the current character on the current
       line, it shall be an error. If there are less than _c_o_u_n_t previous
       characters on the current line, _c_o_u_n_t shall be adjusted to the number
       of previous characters on the line.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to (current column − the width of the deleted
       characters).

   YYaannkk
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] y _m_o_t_i_o_n

       Copy (yank) the region of text into _b_u_f_f_e_r, if specified, and into the
       unnamed buffer.

       If the motion command is the yy command repeated:

        1. The buffer shall be in line mode.

        2. If there are less than _c_o_u_n_t −1 lines after the current line in the
           edit buffer, it shall be an error.

        3. The text region shall be from the current line up to and including
           the next _c_o_u_n_t −1 lines.

       Otherwise, the buffer text mode and text region shall be as specified
       by the motion command.

       _C_u_r_r_e_n_t _l_i_n_e: If the motion was from the current cursor position toward
       the end of the edit buffer, unchanged. Otherwise, set to the first line
       in the edit buffer that is part of the text region specified by the
       motion command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n:

        1. If the motion was from the current cursor position toward the end
           of the edit buffer, unchanged.

        2. Otherwise, if the current line is empty, set to column position 1.

        3. Otherwise, set to the last column that displays any part of the
           first character in the file that is part of the text region
           specified by the motion command.

   YYaannkk CCuurrrreenntt LLiinnee
       _S_y_n_o_p_s_i_s:

                     [[_b_u_f_f_e_r]][[_c_o_u_n_t]] Y

       This command shall be equivalent to the _v_i command:


           [[_b_u_f_f_e_r]][[_c_o_u_n_t]] y_

   RReeddrraaww WWiinnddooww
       If in open mode, the zz command shall have the Synopsis:

       _S_y_n_o_p_s_i_s:

                     [[_c_o_u_n_t]] z

       If _c_o_u_n_t is not specified, it shall default to the wwiinnddooww edit option
       −1. The zz command shall be equivalent to the _e_x zz command, with a type
       character of == and a _c_o_u_n_t of _c_o_u_n_t −2, except that the current line
       and current column shall be set as follows, and the wwiinnddooww edit option
       shall not be affected. If the calculation for the _c_o_u_n_t argument would
       result in a negative number, the _c_o_u_n_t argument to the _e_x zz command
       shall be zero. A blank line shall be written after the last line is
       written.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

       If not in open mode, the zz command shall have the following Synopsis:

       _S_y_n_o_p_s_i_s:

                     [[_l_i_n_e]] z [[_c_o_u_n_t]] _c_h_a_r_a_c_t_e_r

       If _l_i_n_e is not specified, it shall default to the current line. If _l_i_n_e
       is specified, but is greater than the number of lines in the edit
       buffer, it shall default to the number of lines in the edit buffer.

       If _c_o_u_n_t is specified, the value of the wwiinnddooww edit option shall be set
       to _c_o_u_n_t (as described in the _e_x wwiinnddooww command), and the screen shall
       be redrawn.

       _l_i_n_e shall be placed as specified by the following characters:

       <newline>, <carriage-return>
             Place the beginning of the line on the first line of the display.

       .     Place the beginning of the line in the center of the display. The
             middle line of the display shall be calculated as described for
             the MM command.

       −     Place an unspecified portion of the line on the last line of the
             display.

       +     If _l_i_n_e was specified, equivalent to the <newline> case. If _l_i_n_e
             was not specified, display a screen where the first line of the
             display shall be (current last line) +1. If there are no lines
             after the last line in the display, it shall be an error.

       ^     If _l_i_n_e was specified, display a screen where the last line of
             the display shall contain an unspecified portion of the first
             line of a display that had an unspecified portion of the
             specified line on the last line of the display. If this
             calculation results in a line before the beginning of the edit
             buffer, display the first screen of the edit buffer.

             Otherwise, display a screen where the last line of the display
             shall contain an unspecified portion of (current first line −1).
             If this calculation results in a line before the beginning of the
             edit buffer, it shall be an error.

       _C_u_r_r_e_n_t _l_i_n_e: If _l_i_n_e and the ''^^'' character were specified:

        1. If the first screen was displayed as a result of the command
           attempting to display lines before the beginning of the edit
           buffer: if the first screen was already displayed, unchanged;
           otherwise, set to (current first line −1).

        2. Otherwise, set to the last line of the display.

       If _l_i_n_e and the ''++'' character were specified, set to the first line of
       the display.

       Otherwise, if _l_i_n_e was specified, set to _l_i_n_e.

       Otherwise, unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   EExxiitt
       _S_y_n_o_p_s_i_s:

                     ZZZZ

       This command shall be equivalent to the _e_x xxiitt command with no
       addresses, trailing !!, or filename (see the _e_x xxiitt command).

   IInnppuutt MMooddee CCoommmmaannddss iinn vvii
       In text input mode, the current line shall consist of zero or more of
       the following categories, plus the terminating <newline>:

        1. Characters preceding the text input entry point

           Characters in this category shall not be modified during text input
           mode.

        2. aauuttooiinnddeenntt characters

           aauuttooiinnddeenntt characters shall be automatically inserted into each
           line that is created in text input mode, either as a result of
           entering a <newline> or <carriage-return> while in text input mode,
           or as an effect of the command itself; for example, OO or oo (see the
           _e_x aauuttooiinnddeenntt command), as if entered by the user.

           It shall be possible to erase aauuttooiinnddeenntt characters with the
           <control>‐D command; it is unspecified whether they can be erased
           by <control>‐H, <control>‐U, and <control>‐W characters. Erasing
           any aauuttooiinnddeenntt character turns the glyph into erase-columns and
           deletes the character from the edit buffer, but does not change its
           representation on the screen.

        3. Text input characters

           Text input characters are the characters entered by the user.
           Erasing any text input character turns the glyph into erase-columns
           and deletes the character from the edit buffer, but does not change
           its representation on the screen.

           Each text input character entered by the user (that does not have a
           special meaning) shall be treated as follows:

            a. The text input character shall be appended to the last
               character in the edit buffer from the first, second, or third
               categories.

            b. If there are no erase-columns on the screen, the text input
               command was the RR command, and characters in the fifth category
               from the original line follow the cursor, the next such
               character shall be deleted from the edit buffer. If the
               sslloowwooppeenn edit option is not set, the corresponding glyph on the
               screen shall become erase-columns.

            c. If there are erase-columns on the screen, as many columns as
               they occupy, or as are necessary, shall be overwritten to
               display the text input character. (If only part of a multi-
               column glyph is overwritten, the remainder shall be left on the
               screen, and continue to be treated as erase-columns; it is
               unspecified whether the remainder of the glyph is modified in
               any way.)

            d. If additional display line columns are needed to display the
               text input character:

                i.  If the sslloowwooppeenn edit option is set, the text input
                    characters shall be displayed on subsequent display line
                    columns, overwriting any characters displayed in those
                    columns.

               ii.  Otherwise, any characters currently displayed on or after
                    the column on the display line where the text input
                    character is to be displayed shall be pushed ahead the
                    number of display line columns necessary to display the
                    rest of the text input character.

        4. Erase-columns

           Erase-columns are not logically part of the edit buffer, appearing
           only on the screen, and may be overwritten on the screen by
           subsequent text input characters. When text input mode ends, all
           erase-columns shall no longer appear on the screen.

           Erase-columns are initially the region of text specified by the cc
           command (see _C_h_a_n_g_e); however, erasing aauuttooiinnddeenntt or text input
           characters causes the glyphs of the erased characters to be treated
           as erase-columns.

        5. Characters following the text region for the cc command, or the text
           input entry point for all other commands

           Characters in this category shall not be modified during text input
           mode, except as specified in category 3.b. for the RR text input
           command, or as <blank> characters deleted when a <newline> or
           <carriage-return> is entered.

       It is unspecified whether it is an error to attempt to erase past the
       beginning of a line that was created by the entry of a <newline> or
       <carriage-return> during text input mode. If it is not an error, the
       editor shall behave as if the erasing character was entered immediately
       after the last text input character entered on the previous line, and
       all of the non-<newline> characters on the current line shall be
       treated as erase-columns.

       When text input mode is entered, or after a text input mode character
       is entered (except as specified for the special characters below), the
       cursor shall be positioned as follows:

        1. On the first column that displays any part of the first erase-
           column, if one exists

        2. Otherwise, if the sslloowwooppeenn edit option is set, on the first display
           line column after the last character in the first, second, or third
           categories, if one exists

        3. Otherwise, the first column that displays any part of the first
           character in the fifth category, if one exists

        4. Otherwise, the display line column after the last character in the
           first, second, or third categories, if one exists

        5. Otherwise, on column position 1

       The characters that are updated on the screen during text input mode
       are unspecified, other than that the last text input character shall
       always be updated, and, if the sslloowwooppeenn edit option is not set, the
       current cursor character shall always be updated.

       The following specifications are for command characters entered during
       text input mode.

   NNUULL
       _S_y_n_o_p_s_i_s:

                     NNUULL

       If the first character of the text input is a NUL, the most recently
       input text shall be input as if entered by the user, and then text
       input mode shall be exited. The text shall be input literally; that is,
       characters are neither macro or abbreviation expanded, nor are any
       characters interpreted in any special manner. It is unspecified whether
       implementations shall support more than 256 bytes of remembered input
       text.

   <<ccoonnttrrooll>>--DD
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--DD

       The <control>‐D character shall have no special meaning when in text
       input mode for a line-oriented command (see _C_o_m_m_a_n_d _D_e_s_c_r_i_p_t_i_o_n_s _i_n
       _v_i).

       This command need not be supported on block-mode terminals.

       If the cursor does not follow an aauuttooiinnddeenntt character, or an aauuttooiinnddeenntt
       character and a ''00'' or ''^^'' character:

        1. If the cursor is in column position 1, the <control>‐D character
           shall be discarded and no further action taken.

        2. Otherwise, the <control>‐D character shall have no special meaning.

       If the last input character was a ''00'', the cursor shall be moved to
       column position 1.

       Otherwise, if the last input character was a ''^^'', the cursor shall be
       moved to column position 1. In addition, the aauuttooiinnddeenntt level for the
       next input line shall be derived from the same line from which the
       aauuttooiinnddeenntt level for the current input line was derived.

       Otherwise, the cursor shall be moved back to the column after the
       previous shiftwidth (see the _e_x sshhiiffttwwiiddtthh command) boundary.

       All of the glyphs on columns between the starting cursor position and
       (inclusively) the ending cursor position shall become erase-columns as
       described in _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to 1 if the <control>‐D was preceded by a ''^^'' or
       ''00''; otherwise, set to (column −1) −((column −2) % sshhiiffttwwiiddtthh).

   <<ccoonnttrrooll>>--HH
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--HH

       If in text input mode for a line-oriented command, and there are no
       characters to erase, text input mode shall be terminated, no further
       action shall be done for this command, and the current line and column
       shall be unchanged.

       If there are characters other than aauuttooiinnddeenntt characters that have been
       input on the current line before the cursor, the cursor shall move back
       one character.

       Otherwise, if there are aauuttooiinnddeenntt characters on the current line
       before the cursor, it is implementation-defined whether the <control>‐H
       command is an error or if the cursor moves back one aauuttooiinnddeenntt
       character.

       Otherwise, if the cursor is in column position 1 and there are previous
       lines that have been input, it is implementation-defined whether the
       <control>‐H command is an error or if it is equivalent to entering
       <control>‐H after the last input character on the previous input line.

       Otherwise, it shall be an error.

       All of the glyphs on columns between the starting cursor position and
       (inclusively) the ending cursor position shall become erase-columns as
       described in _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i.

       The current erase character (see _s_t_t_y) shall cause an equivalent action
       to the <control>‐H command, unless the previously inserted character
       was a <backslash>, in which case it shall be as if the literal current
       erase character had been inserted instead of the <backslash>.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged, unless previously input lines are erased, in
       which case it shall be set to line −1.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the first column that displays any portion of
       the character backed up over.

   <<nneewwlliinnee>>
       _S_y_n_o_p_s_i_s:

                     <<nneewwlliinnee>>
                     <<ccaarrrriiaaggee--rreettuurrnn>>
                     <<ccoonnttrrooll>>--JJ
                     <<ccoonnttrrooll>>--MM

       If input was part of a line-oriented command, text input mode shall be
       terminated and the command shall continue execution with the input
       provided.

       Otherwise, terminate the current line. If there are no characters other
       than aauuttooiinnddeenntt characters on the line, all characters on the line
       shall be discarded.  Otherwise, it is unspecified whether the
       aauuttooiinnddeenntt characters in the line are modified by entering these
       characters.

       Continue text input mode on a new line appended after the current line.
       If the sslloowwooppeenn edit option is set, the lines on the screen below the
       current line shall not be pushed down, but the first of them shall be
       cleared and shall appear to be overwritten. Otherwise, the lines of the
       screen below the current line shall be pushed down.

       If the aauuttooiinnddeenntt edit option is set, an appropriate number of
       aauuttooiinnddeenntt characters shall be added as a prefix to the line as
       described by the _e_x aauuttooiinnddeenntt edit option.

       All columns after the cursor that are erase-columns (as described in
       _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i) shall be discarded.

       If the aauuttooiinnddeenntt edit option is set, all <blank> characters
       immediately following the cursor shall be discarded.

       All remaining characters after the cursor shall be transferred to the
       new line, positioned after any aauuttooiinnddeenntt characters.

       _C_u_r_r_e_n_t _l_i_n_e: Set to current line +1.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the first column that displays any portion of
       the first character after the aauuttooiinnddeenntt characters on the new line, if
       any, or the first column position after the last aauuttooiinnddeenntt character,
       if any, or column position 1.

   <<ccoonnttrrooll>>--TT
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--TT

       The <control>‐T character shall have no special meaning when in text
       input mode for a line-oriented command (see _C_o_m_m_a_n_d _D_e_s_c_r_i_p_t_i_o_n_s _i_n
       _v_i).

       This command need not be supported on block-mode terminals.

       Behave as if the user entered the minimum number of <blank> characters
       necessary to move the cursor forward to the column position after the
       next sshhiiffttwwiiddtthh (see the _e_x sshhiiffttwwiiddtthh command) boundary.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to _c_o_l_u_m_n + sshhiiffttwwiiddtthh − ((column −1) %
       sshhiiffttwwiiddtthh).

   <<ccoonnttrrooll>>--UU
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--UU

       If there are characters other than aauuttooiinnddeenntt characters that have been
       input on the current line before the cursor, the cursor shall move to
       the first character input after the aauuttooiinnddeenntt characters.

       Otherwise, if there are aauuttooiinnddeenntt characters on the current line
       before the cursor, it is implementation-defined whether the <control>‐U
       command is an error or if the cursor moves to the first column position
       on the line.

       Otherwise, if the cursor is in column position 1 and there are previous
       lines that have been input, it is implementation-defined whether the
       <control>‐U command is an error or if it is equivalent to entering
       <control>‐U after the last input character on the previous input line.

       Otherwise, it shall be an error.

       All of the glyphs on columns between the starting cursor position and
       (inclusively) the ending cursor position shall become erase-columns as
       described in _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i.

       The current _k_i_l_l character (see _s_t_t_y) shall cause an equivalent action
       to the <control>‐U command, unless the previously inserted character
       was a <backslash>, in which case it shall be as if the literal current
       _k_i_l_l character had been inserted instead of the <backslash>.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged, unless previously input lines are erased, in
       which case it shall be set to line −1.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the first column that displays any portion of
       the last character backed up over.

   <<ccoonnttrrooll>>--VV
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--VV
                     <<ccoonnttrrooll>>--QQ

       Allow the entry of any subsequent character, other than <control>‐J or
       the <newline>, as a literal character, removing any special meaning
       that it may have to the editor in text input mode. If a <control>‐V or
       <control>‐Q is entered before a <control>‐J or <newline>, the
       <control>‐V or <control>‐Q character shall be discarded, and the
       <control>‐J or <newline> shall behave as described in the <newline>
       command character during input mode.

       For purposes of the display only, the editor shall behave as if a ''^^''
       character was entered, and the cursor shall be positioned as if
       overwriting the ''^^'' character. When a subsequent character is entered,
       the editor shall behave as if that character was entered instead of the
       original <control>‐V or <control>‐Q character.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   <<ccoonnttrrooll>>--WW
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--WW

       If there are characters other than aauuttooiinnddeenntt characters that have been
       input on the current line before the cursor, the cursor shall move back
       over the last word preceding the cursor (including any <blank>
       characters between the end of the last word and the current cursor);
       the cursor shall not move to before the first character after the end
       of any aauuttooiinnddeenntt characters.

       Otherwise, if there are aauuttooiinnddeenntt characters on the current line
       before the cursor, it is implementation-defined whether the <control>‐W
       command is an error or if the cursor moves to the first column position
       on the line.

       Otherwise, if the cursor is in column position 1 and there are previous
       lines that have been input, it is implementation-defined whether the
       <control>‐W command is an error or if it is equivalent to entering
       <control>‐W after the last input character on the previous input line.

       Otherwise, it shall be an error.

       All of the glyphs on columns between the starting cursor position and
       (inclusively) the ending cursor position shall become erase-columns as
       described in _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged, unless previously input lines are erased, in
       which case it shall be set to line −1.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to the first column that displays any portion of
       the last character backed up over.

   <<EESSCC>>
       _S_y_n_o_p_s_i_s:

                     <<EESSCC>>

       If input was part of a line-oriented command:

        1. If _i_n_t_e_r_r_u_p_t was entered, text input mode shall be terminated and
           the editor shall return to command mode. The terminal shall be
           alerted.

        2. If <ESC> was entered, text input mode shall be terminated and the
           command shall continue execution with the input provided.

       Otherwise, terminate text input mode and return to command mode.

       Any aauuttooiinnddeenntt characters entered on newly created lines that have no
       other non-<newline> characters shall be deleted.

       Any leading aauuttooiinnddeenntt and <blank> characters on newly created lines
       shall be rewritten to be the minimum number of <blank> characters
       possible.

       The screen shall be redisplayed as necessary to match the contents of
       the edit buffer.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n:

        1. If there are text input characters on the current line, the column
           shall be set to the last column where any portion of the last text
           input character is displayed.

        2. Otherwise, if a character is displayed in the current column,
           unchanged.

        3. Otherwise, set to column position 1.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       When any error is encountered and the standard input is not a terminal
       device file, _v_i shall not write the file or return to command or text
       input mode, and shall terminate with a non-zero exit status.

       Otherwise, when an unrecoverable error is encountered it shall be
       equivalent to a SIGHUP asynchronous event.

       Otherwise, when an error is encountered, the editor shall behave as
       specified in _C_o_m_m_a_n_d _D_e_s_c_r_i_p_t_i_o_n_s _i_n _v_i.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       None.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       See the RATIONALE for _e_x for more information on _v_i.  Major portions of
       the _v_i utility specification point to _e_x to avoid inadvertent
       divergence. While _e_x and _v_i have historically been implemented as a
       single utility, this is not required by POSIX.1‐2008.

       It is recognized that portions of _v_i would be difficult, if not
       impossible, to implement satisfactorily on a block-mode terminal, or a
       terminal without any form of cursor addressing, thus it is not a
       mandatory requirement that such features should work on all terminals.
       It is the intention, however, that a _v_i implementation should provide
       the full set of capabilities on all terminals capable of supporting
       them.

       Historically, _v_i exited immediately if the standard input was not a
       terminal. POSIX.1‐2008 permits, but does not require, this behavior. An
       end-of-file condition is not equivalent to an end-of-file character. A
       common end-of-file character, <control>‐D, is historically a _v_i
       command.

       The text in the STDOUT section reflects the usage of the verb _d_i_s_p_l_a_y
       in this section; some implementations of _v_i use standard output to
       write to the terminal, but POSIX.1‐2008 does not require that to be the
       case.

       Historically, implementations reverted to open mode if the terminal was
       incapable of supporting full visual mode. POSIX.1‐2008 requires this
       behavior. Historically, the open mode of _v_i behaved roughly
       equivalently to the visual mode, with the exception that only a single
       line from the edit buffer (one ``buffer line'') was kept current at any
       time. This line was normally displayed on the next-to-last line of a
       terminal with cursor addressing (and the last line performed its normal
       visual functions for line-oriented commands and messages). In addition,
       some few commands behaved differently in open mode than in visual mode.
       POSIX.1‐2008 requires conformance to historical practice.

       Historically, _e_x and _v_i implementations have expected text to proceed
       in the usual European/Latin order of left to right, top to bottom.
       There is no requirement in POSIX.1‐2008 that this be the case. The
       specification was deliberately written using words like ``before'',
       ``after'', ``first'', and ``last'' in order to permit implementations
       to support the natural text order of the language.

       Historically, lines past the end of the edit buffer were marked with
       single <tilde> (''~~'') characters; that is, if the one-based display was
       20 lines in length, and the last line of the file was on line one, then
       lines 2-20 would contain only a single ''~~'' character.

       Historically, the _v_i editor attempted to display only complete lines at
       the bottom of the screen (it did display partial lines at the top of
       the screen). If a line was too long to fit in its entirety at the
       bottom of the screen, the screen lines where the line would have been
       displayed were displayed as single ''@@'' characters, instead of
       displaying part of the line. POSIX.1‐2008 permits, but does not
       require, this behavior. Implementations are encouraged to attempt
       always to display a complete line at the bottom of the screen when
       doing scrolling or screen positioning by buffer lines.

       Historically, lines marked with ''@@'' were also used to minimize output
       to dumb terminals over slow lines; that is, changes local to the cursor
       were updated, but changes to lines on the screen that were not close to
       the cursor were simply marked with an ''@@'' sign instead of being updated
       to match the current text. POSIX.1‐2008 permits, but does not require
       this feature because it is used ever less frequently as terminals
       become smarter and connections are faster.

   IInniittiiaalliizzaattiioonn iinn eexx aanndd vvii
       Historically, _v_i always had a line in the edit buffer, even if the edit
       buffer was ``empty''. For example:

        1. The _e_x command == executed from visual mode wrote ``1'' when the
           buffer was empty.

        2. Writes from visual mode of an empty edit buffer wrote files of a
           single character (a <newline>), while writes from _e_x mode of an
           empty edit buffer wrote empty files.

        3. Put and read commands into an empty edit buffer left an empty line
           at the top of the edit buffer.

       For consistency, POSIX.1‐2008 does not permit any of these behaviors.

       Historically, _v_i did not always return the terminal to its original
       modes; for example, ICRNL was modified if it was not originally set.
       POSIX.1‐2008 does not permit this behavior.

   CCoommmmaanndd DDeessccrriippttiioonnss iinn vvii
       Motion commands are among the most complicated aspects of _v_i to
       describe. With some exceptions, the text region and buffer type effect
       of a motion command on a _v_i command are described on a case-by-case
       basis. The descriptions of text regions in POSIX.1‐2008 are not
       intended to imply direction; that is, an inclusive region from line _n
       to line _n+5 is identical to a region from line _n+5 to line _n.  This is
       of more than academic interest—movements to marks can be in either
       direction, and, if the wwrraappssccaann option is set, so can movements to
       search points. Historically, lines are always stored into buffers in
       text order; that is, from the start of the edit buffer to the end.
       POSIX.1‐2008 requires conformance to historical practice.

       Historically, command counts were applied to any associated motion, and
       were multiplicative to any supplied motion count. For example, 22ccww is
       the same as cc22ww, and 22cc33ww is the same as cc66ww.  POSIX.1‐2008 requires
       this behavior. Historically, _v_i commands that used bigwords, words,
       paragraphs, and sentences as objects treated groups of empty lines, or
       lines that contained only <blank> characters, inconsistently. Some
       commands treated them as a single entity, while others treated each
       line separately. For example, the ww, WW, and BB commands treated groups
       of empty lines as individual words; that is, the command would move the
       cursor to each new empty line. The ee and EE commands treated groups of
       empty lines as a single word; that is, the first use would move past
       the group of lines. The bb command would just beep at the user, or if
       done from the start of the line as a motion command, fail in unexpected
       ways. If the lines contained only (or ended with) <blank> characters,
       the ww and WW commands would just beep at the user, the EE and ee commands
       would treat the group as a single word, and the BB and bb commands would
       treat the lines as individual words. For consistency and simplicity of
       specification, POSIX.1‐2008 requires that all _v_i commands treat groups
       of empty or blank lines as a single entity, and that movement through
       lines ending with <blank> characters be consistent with other
       movements.

       Historically, _v_i documentation indicated that any number of double-
       quotes were skipped after punctuation marks at sentence boundaries;
       however, implementations only skipped single-quotes. POSIX.1‐2008
       requires both to be skipped.

       Historically, the first and last characters in the edit buffer were
       word boundaries. This historical practice is required by POSIX.1‐2008.

       Historically, _v_i attempted to update the minimum number of columns on
       the screen possible, which could lead to misleading information being
       displayed.  POSIX.1‐2008 makes no requirements other than that the
       current character being entered is displayed correctly, leaving all
       other decisions in this area up to the implementation.

       Historically, lines were arbitrarily folded between columns of any
       characters that required multiple column positions on the screen, with
       the exception of tabs, which terminated at the right-hand margin.
       POSIX.1‐2008 permits the former and requires the latter.
       Implementations that do not arbitrarily break lines between columns of
       characters that occupy multiple column positions should not permit the
       cursor to rest on a column that does not contain any part of a
       character.

       The historical _v_i had a problem in that all movements were by buffer
       lines, not by display or screen lines. This is often the right thing to
       do; for example, single line movements, such as jj or kk, should work on
       buffer lines. Commands like ddjj, or jj.., where ..  is a change command,
       only make sense for buffer lines. It is not, however, the right thing
       to do for screen motion or scrolling commands like <control>‐D,
       <control>‐F, and HH.  If the window is fairly small, using buffer lines
       in these cases can result in completely random motion; for example,
       11<control>‐‐DD can result in a completely changed screen, without any
       overlap. This is clearly not what the user wanted. The problem is even
       worse in the case of the HH, LL, and MM commands—as they position the
       cursor at the first non-<blank> of the line, they may all refer to the
       same location in large lines, and will result in no movement at all.

       In addition, if the line is larger than the screen, using buffer lines
       can make it impossible to display parts of the line—there are not any
       commands that do not display the beginning of the line in historical
       _v_i, and if both the beginning and end of the line cannot be on the
       screen at the same time, the user suffers. Finally, the page and half-
       page scrolling commands historically moved to the first non-<blank> in
       the new line. If the line is approximately the same size as the screen,
       this is inadequate because the cursor before and after a <control>‐D
       command will refer to the same location on the screen.

       Implementations of _e_x and _v_i exist that do not have these problems
       because the relevant commands (<control>‐B, <control>‐D, <control>‐F,
       <control>‐U, <control>‐Y, <control>‐E, HH, LL, and MM)) operate on display
       (screen) lines, not (edit) buffer lines.

       POSIX.1‐2008 does not permit this behavior by default because the
       standard developers believed that users would find it too confusing.
       However, historical practice has been relaxed. For example, _e_x and _v_i
       historically attempted, albeit sometimes unsuccessfully, to never put
       part of a line on the last lines of a screen; for example, if a line
       would not fit in its entirety, no part of the line was displayed, and
       the screen lines corresponding to the line contained single ''@@''
       characters. This behavior is permitted, but not required by
       POSIX.1‐2008, so that it is possible for implementations to support
       long lines in small screens more reasonably without changing the
       commands to be oriented to the display (instead of oriented to the
       buffer). POSIX.1‐2008 also permits implementations to refuse to edit
       any edit buffer containing a line that will not fit on the screen in
       its entirety.

       The display area (for example, the value of the wwiinnddooww edit option) has
       historically been ``grown'', or expanded, to display new text when
       local movements are done in displays where the number of lines
       displayed is less than the maximum possible. Expansion has historically
       been the first choice, when the target line is less than the maximum
       possible expansion value away. Scrolling has historically been the next
       choice, done when the target line is less than half a display away, and
       otherwise, the screen was redrawn. There were exceptions, however, in
       that _e_x commands generally always caused the screen to be redrawn.
       POSIX.1‐2008 does not specify a standard behavior because there may be
       external issues, such as connection speed, the number of characters
       necessary to redraw as opposed to scroll, or terminal capabilities that
       implementations will have to accommodate.

       The current line in POSIX.1‐2008 maps one-to-one to a buffer line in
       the file. The current column does not. There are two different column
       values that are described by POSIX.1‐2008. The first is the current
       column value as set by many of the _v_i commands. This value is
       remembered for the lifetime of the editor. The second column value is
       the actual position on the screen where the cursor rests. The two are
       not always the same. For example, when the cursor is backed by a multi-
       column character, the actual cursor position on the screen has
       historically been the last column of the character in command mode, and
       the first column of the character in input mode.

       Commands that set the current line, but that do not set the current
       cursor value (for example, jj and kk) attempt to get as close as possible
       to the remembered column position, so that the cursor tends to restrict
       itself to a vertical column as the user moves around in the edit
       buffer. POSIX.1‐2008 requires conformance to historical practice,
       requiring that the display location of the cursor on the display line
       be adjusted from the current column value as necessary to support this
       historical behavior.

       Historically, only a single line (and for some terminals, a single line
       minus 1 column) of characters could be entered by the user for the
       line-oriented commands; that is, ::, !!, //, or ??.  POSIX.1‐2008 permits,
       but does not require, this limitation.

       Historically, ``soft'' errors in _v_i caused the terminal to be alerted,
       but no error message was displayed.  As a general rule, no error
       message was displayed for errors in command execution in _v_i, when the
       error resulted from the user attempting an invalid or impossible
       action, or when a searched-for object was not found.  Examples of soft
       errors included hh at the left margin, <control>‐B or [[[[ at the
       beginning of the file, 22GG at the end of the file, and so on. In
       addition, errors such as %%, ]]]], }}, )), NN, nn, ff, FF, tt, and TT failing to
       find the searched-for object were soft as well. Less consistently, //
       and ??  displayed an error message if the pattern was not found, //, ??,
       NN, and nn displayed an error message if no previous regular expression
       had been specified, and ;; did not display an error message if no
       previous ff, FF, tt, or TT command had occurred. Also, behavior in this
       area might reasonably be based on a runtime evaluation of the speed of
       a network connection.  Finally, some implementations have provided
       error messages for soft errors in order to assist naive users, based on
       the value of a verbose edit option. POSIX.1‐2008 does not list specific
       errors for which an error message shall be displayed. Implementations
       should conform to historical practice in the absence of any strong
       reason to diverge.

   PPaaggee BBaacckkwwaarrddss
       The <control>‐B and <control>‐F commands historically considered it an
       error to attempt to page past the beginning or end of the file, whereas
       the <control>‐D and <control>‐U commands simply moved to the beginning
       or end of the file. For consistency, POSIX.1‐2008 requires the latter
       behavior for all four commands.  All four commands still consider it an
       error if the current line is at the beginning (<control>‐B,
       <control>‐U) or end (<control>‐F, <control>‐D) of the file.
       Historically, the <control>‐B and <control>‐F commands skip two lines
       in order to include overlapping lines when a single command is entered.
       This makes less sense in the presence of a _c_o_u_n_t, as there will be, by
       definition, no overlapping lines. The actual calculation used by
       historical implementations of the _v_i editor for <control>‐B was:


           ((((ccuurrrreenntt ffiirrsstt lliinnee)) −− ccoouunntt xx ((wwiinnddooww eeddiitt ooppttiioonn)))) ++22

       and for <control>‐F was:


           ((((ccuurrrreenntt ffiirrsstt lliinnee)) ++ ccoouunntt xx ((wwiinnddooww eeddiitt ooppttiioonn)))) −−22

       This calculation does not work well when intermixing commands with and
       without counts; for example, 33<control>‐F is not equivalent to entering
       the <control>‐F command three times, and is not reversible by entering
       the <control>‐B command three times. For consistency with other _v_i
       commands that take counts, POSIX.1‐2008 requires a different
       calculation.

   SSccrroollll FFoorrwwaarrdd
       The 4BSD and System V implementations of _v_i differed on the initial
       value used by the ssccrroollll command. 4BSD used:


           ((((wwiinnddooww eeddiitt ooppttiioonn)) ++11)) //22

       while System V used the value of the ssccrroollll edit option. The System V
       version is specified by POSIX.1‐2008 because the standard developers
       believed that it was more intuitive and permitted the user a method of
       setting the scroll value initially without also setting the number of
       lines that are displayed.

   SSccrroollll FFoorrwwaarrdd bbyy LLiinnee
       Historically, the <control>‐E and <control>‐Y commands considered it an
       error if the last and first lines, respectively, were already on the
       screen. POSIX.1‐2008 requires conformance to historical practice.
       Historically, the <control>‐E and <control>‐Y commands had no effect in
       open mode. For simplicity and consistency of specification,
       POSIX.1‐2008 requires that they behave as usual, albeit with a single
       line screen.

   CClleeaarr aanndd RReeddiissppllaayy
       The historical <control>‐L command refreshed the screen exactly as it
       was supposed to be currently displayed, replacing any ''@@'' characters
       for lines that had been deleted but not updated on the screen with
       refreshed ''@@'' characters. The intent of the <control>‐L command is to
       refresh when the screen has been accidentally overwritten; for example,
       by a wwrriittee command from another user, or modem noise.

   RReeddrraaww SSccrreeeenn
       The historical <control>‐R command redisplayed only when necessary to
       update lines that had been deleted but not updated on the screen and
       that were flagged with ''@@'' characters. There is no requirement that the
       screen be in any way refreshed if no lines of this form are currently
       displayed. POSIX.1‐2008 permits implementations to extend this command
       to refresh lines on the screen flagged with ''@@'' characters because they
       are too long to be displayed in the current framework; however, the
       current line and column need not be modified.

   SSeeaarrcchh ffoorr ttaaggssttrriinngg
       Historically, the first non-<blank> at or after the cursor was the
       first character, and all subsequent characters that were word
       characters, up to the end of the line, were included. For example, with
       the cursor on the leading <space> or on the ''##'' character in the text
       ""##bbaarr@@"", the tag was ""##bbaarr"".  On the character ''bb'' it was ""bbaarr"", and on
       the ''aa'' it was ""aarr"".  POSIX.1‐2008 requires this behavior.

   RReeppllaaccee TTeexxtt wwiitthh RReessuullttss ffrroomm SShheellll CCoommmmaanndd
       Historically, the <<, >>, and !!  commands considered most cursor motions
       other than line-oriented motions an error; for example, the command
       >>//ffoooo<<CCRR>> succeeded, while the command >>ll failed, even though the text
       region described by the two commands might be identical. For
       consistency, all three commands only consider entire lines and not
       partial lines, and the region is defined as any line that contains a
       character that was specified by the motion.

   MMoovvee ttoo MMaattcchhiinngg CChhaarraacctteerr
       Other matching characters have been left implementation-defined in
       order to allow extensions such as matching ''<<'' and ''>>'' for searching
       HTML, or ##iiffddeeff, ##eellssee, and ##eennddiiff for searching C source.

   RReeppeeaatt SSuubbssttiittuuttiioonn
       POSIX.1‐2008 requires that any cc and gg flags specified to the previous
       substitute command be ignored; however, the rr flag may still apply, if
       supported by the implementation.

   RReettuurrnn ttoo PPrreevviioouuss ((CCoonntteexxtt oorr SSeeccttiioonn))
       The [[[[, ]]]], ((, )), {{, and }} commands are all affected by ``section
       boundaries'', but in some historical implementations not all of the
       commands recognize the same section boundaries. This is a bug, not a
       feature, and a unique section-boundary algorithm was not described for
       each command. One special case that is preserved is that the sentence
       command moves to the end of the last line of the edit buffer while the
       other commands go to the beginning, in order to preserve the
       traditional character cut semantics of the sentence command.
       Historically, _v_i section boundaries at the beginning and end of the
       edit buffer were the first non-<blank> on the first and last lines of
       the edit buffer if one exists; otherwise, the last character of the
       first and last lines of the edit buffer if one exists. To increase
       consistency with other section locations, this has been simplified by
       POSIX.1‐2008 to the first character of the first and last lines of the
       edit buffer, or the first and the last lines of the edit buffer if they
       are empty.

       Sentence boundaries were problematic in the historical _v_i.  They were
       not only the boundaries as defined for the section and paragraph
       commands, but they were the first non-<blank> that occurred after those
       boundaries, as well. Historically, the _v_i section commands were
       documented as taking an optional window size as a _c_o_u_n_t preceding the
       command. This was not implemented in historical versions, so
       POSIX.1‐2008 requires that the _c_o_u_n_t repeat the command, for
       consistency with other _v_i commands.

   RReeppeeaatt
       Historically, mapped commands other than text input commands could not
       be repeated using the ppeerriioodd command. POSIX.1‐2008 requires conformance
       to historical practice.

       The restrictions on the interpretation of special characters (for
       example, <control>‐H) in the repetition of text input mode commands is
       intended to match historical practice. For example, given the input
       sequence:


           iiaabb<<ccoonnttrrooll>>--HH<<ccoonnttrrooll>>--HH<<ccoonnttrrooll>>--HHddeeff<<eessccaappee>>

       the user should be informed of an error when the sequence is first
       entered, but not during a command repetition. The character <control>‐T
       is specifically exempted from this restriction. Historical
       implementations of _v_i ignored <control>‐T characters that were input in
       the original command during command repetition. POSIX.1‐2008 prohibits
       this behavior.

   FFiinndd RReegguullaarr EExxpprreessssiioonn
       Historically, commands did not affect the line searched to or from if
       the motion command was a search (//, ??, NN, nn) and the final position was
       the start/end of the line. There were some special cases and _v_i was not
       consistent. POSIX.1‐2008 does not permit this behavior, for
       consistency. Historical implementations permitted but were unable to
       handle searches as motion commands that wrapped (that is, due to the
       edit option wwrraappssccaann) to the original location. POSIX.1‐2008 requires
       that this behavior be treated as an error.

       Historically, the syntax ""//RREE//00"" was used to force the command to cut
       text in line mode. POSIX.1‐2008 requires conformance to historical
       practice.

       Historically, in open mode, a zz specified to a search command
       redisplayed the current line instead of displaying the current screen
       with the current line highlighted. For consistency and simplicity of
       specification, POSIX.1‐2008 does not permit this behavior.

       Historically, trailing zz commands were permitted and ignored if entered
       as part of a search used as a motion command. For consistency and
       simplicity of specification, POSIX.1‐2008 does not permit this
       behavior.

   EExxeeccuuttee aann eexx CCoommmmaanndd
       Historically, _v_i implementations restricted the commands that could be
       entered on the colon command line (for example, aappppeenndd and cchhaannggee), and
       some other commands were known to cause them to fail catastrophically.
       For consistency, POSIX.1‐2008 does not permit these restrictions. When
       executing an _e_x command by entering ::, it is not possible to enter a
       <newline> as part of the command because it is considered the end of
       the command.  A different approach is to enter _e_x command mode by using
       the _v_i QQ command (and later resuming visual mode with the _e_x vvii
       command). In _e_x command mode, the single-line limitation does not
       exist. So, for example, the following is valid:


           QQ
           ss//bbrreeaakk hheerree//bbrreeaakk\\
           hheerree//
           vvii

       POSIX.1‐2008 requires that, if the _e_x command overwrites any part of
       the screen that would be erased by a refresh, _v_i pauses for a character
       from the user. Historically, this character could be any character; for
       example, a character input by the user before the message appeared, or
       even a mapped character. This is probably a bug, but implementations
       that have tried to be more rigorous by requiring that the user enter a
       specific character, or that the user enter a character after the
       message was displayed, have been forced by user indignation back into
       historical behavior. POSIX.1‐2008 requires conformance to historical
       practice.

   SShhiifftt LLeefftt ((RRiigghhtt))
       Refer to the Rationale for the !!  and // commands. Historically, the <<
       and >> commands sometimes moved the cursor to the first non-<blank> (for
       example if the command was repeated or with __ as the motion command),
       and sometimes left it unchanged. POSIX.1‐2008 does not permit this
       inconsistency, requiring instead that the cursor always move to the
       first non-<blank>.  Historically, the << and >> commands did not support
       buffer arguments, although some implementations allow the specification
       of an optional buffer. This behavior is neither required nor disallowed
       by POSIX.1‐2008.

   EExxeeccuuttee
       Historically, buffers could execute other buffers, and loops, infinite
       and otherwise, were possible. POSIX.1‐2008 requires conformance to
       historical practice. The *_b_u_f_f_e_r syntax of _e_x is not required in _v_i,
       because it is not historical practice and has been used in some _v_i
       implementations to support additional scripting languages.

   RReevveerrssee CCaassee
       Historically, the ~~ command ignored any associated _c_o_u_n_t, and acted
       only on the characters in the current line. For consistency with other
       _v_i commands, POSIX.1‐2008 requires that an associated _c_o_u_n_t act on the
       next _c_o_u_n_t characters, and that the command move to subsequent lines if
       warranted by _c_o_u_n_t, to make it possible to modify large pieces of text
       in a reasonably efficient manner. There exist _v_i implementations that
       optionally require an associated motion command for the ~~ command.
       Implementations supporting this functionality are encouraged to base it
       on the ttiillddeeddoopp edit option and handle the text regions and cursor
       positioning identically to the yyaannkk command.

   AAppppeenndd
       Historically, _c_o_u_n_ts specified to the AA, aa, II, and ii commands repeated
       the input of the first line _c_o_u_n_t times, and did not repeat the
       subsequent lines of the input text. POSIX.1‐2008 requires that the
       entire text input be repeated _c_o_u_n_t times.

   MMoovvee BBaacckkwwaarrdd ttoo PPrreecceeddiinngg WWoorrdd
       Historically, _v_i became confused if word commands were used as motion
       commands in empty files. POSIX.1‐2008 requires that this be an error.
       Historical implementations of _v_i had a large number of bugs in the word
       movement commands, and they varied greatly in behavior in the presence
       of empty lines, ``words'' made up of a single character, and lines
       containing only <blank> characters. For consistency and simplicity of
       specification, POSIX.1‐2008 does not permit this behavior.

   CChhaannggee ttoo EEnndd--ooff--LLiinnee
       Some historical implementations of the CC command did not behave as
       described by POSIX.1‐2008 when the $$ key was remapped because they were
       implemented by pushing the $$ key onto the input queue and reprocessing
       it. POSIX.1‐2008 does not permit this behavior. Historically, the CC, SS,
       and ss commands did not copy replaced text into the numeric buffers. For
       consistency and simplicity of specification, POSIX.1‐2008 requires that
       they behave like their respective cc commands in all respects.

   DDeelleettee
       Historically, lines in open mode that were deleted were scrolled up,
       and an @@ glyph written over the beginning of the line. In the case of
       terminals that are incapable of the necessary cursor motions, the
       editor erased the deleted line from the screen. POSIX.1‐2008 requires
       conformance to historical practice; that is, if the terminal cannot
       display the ''@@'' character, the line cannot remain on the screen.

   DDeelleettee ttoo EEnndd--ooff--LLiinnee
       Some historical implementations of the DD command did not behave as
       described by POSIX.1‐2008 when the $$ key was remapped because they were
       implemented by pushing the $$ key onto the input queue and reprocessing
       it. POSIX.1‐2008 does not permit this behavior.

   JJooiinn
       An historical oddity of _v_i is that the commands JJ, 11JJ, and 22JJ are all
       equivalent. POSIX.1‐2008 requires conformance to historical practice.
       The _v_i JJ command is specified in terms of the _e_x jjooiinn command with an
       _e_x command _c_o_u_n_t value. The address correction for a _c_o_u_n_t that is past
       the end of the edit buffer is necessary for historical compatibility
       for both _e_x and _v_i.

   MMaarrkk PPoossiittiioonn
       Historical practice is that only lowercase letters, plus backquote and
       single-quote, could be used to mark a cursor position. POSIX.1‐2008
       requires conformance to historical practice, but encourages
       implementations to support other characters as marks as well.

   RReeppeeaatt RReegguullaarr EExxpprreessssiioonn FFiinndd ((FFoorrwwaarrdd aanndd RReevveerrssee))
       Historically, the NN and nn commands could not be used as motion
       components for the cc command. With the exception of the ccNN command,
       which worked if the search crossed a line boundary, the text region
       would be discarded, and the user would not be in text input mode. For
       consistency and simplicity of specification, POSIX.1‐2008 does not
       permit this behavior.

   IInnsseerrtt EEmmppttyy LLiinnee ((BBeellooww aanndd AAbboovvee))
       Historically, counts to the OO and oo commands were used as the number of
       physical lines to open, if the terminal was dumb and the sslloowwooppeenn
       option was not set. This was intended to minimize traffic over slow
       connections and repainting for dumb terminals. POSIX.1‐2008 does not
       permit this behavior, requiring that a _c_o_u_n_t to the open command behave
       as for other text input commands. This change to historical practice
       was made for consistency, and because a superset of the functionality
       is provided by the sslloowwooppeenn edit option.

   PPuutt ffrroomm BBuuffffeerr ((FFoolllloowwiinngg aanndd BBeeffoorree))
       Historically, _c_o_u_n_ts to the pp and PP commands were ignored if the buffer
       was a line mode buffer, but were (mostly) implemented as described in
       POSIX.1‐2008 if the buffer was a character mode buffer. Because
       implementations exist that do not have this limitation, and because
       pasting lines multiple times is generally useful, POSIX.1‐2008 requires
       that _c_o_u_n_t be supported for all pp and PP commands.

       Historical implementations of _v_i were widely known to have major
       problems in the pp and PP commands, particularly when unusual regions of
       text were copied into the edit buffer. The standard developers viewed
       these as bugs, and they are not permitted for consistency and
       simplicity of specification.

       Historically, a PP or pp command (or an _e_x ppuutt command executed from open
       or visual mode) executed in an empty file, left an empty line as the
       first line of the file. For consistency and simplicity of
       specification, POSIX.1‐2008 does not permit this behavior.

   RReeppllaaccee CChhaarraacctteerr
       Historically, the rr command did not correctly handle the _e_r_a_s_e and _w_o_r_d
       _e_r_a_s_e characters as arguments, nor did it handle an associated _c_o_u_n_t
       greater than 1 with a <carriage-return> argument, for which it replaced
       _c_o_u_n_t characters with a single <newline>.  POSIX.1‐2008 does not permit
       these inconsistencies.

       Historically, the rr command permitted the <control>‐V escaping of
       entered characters, such as <ESC> and the <carriage-return>; however,
       it required two leading <control>‐V characters instead of one.
       POSIX.1‐2008 requires that this be changed for consistency with the
       other text input commands of _v_i.

       Historically, it is an error to enter the rr command if there are less
       than _c_o_u_n_t characters at or after the cursor in the line. While a
       reasonable and unambiguous extension would be to permit the rr command
       on empty lines, it would require that too large a _c_o_u_n_t be adjusted to
       match the number of characters at or after the cursor for consistency,
       which is sufficiently different from historical practice to be avoided.
       POSIX.1‐2008 requires conformance to historical practice.

   RReeppllaaccee CChhaarraacctteerrss
       Historically, if there were aauuttooiinnddeenntt characters in the line on which
       the RR command was run, and aauuttooiinnddeenntt was set, the first <newline>
       would be properly indented and no characters would be replaced by the
       <newline>.  Each additional <newline> would replace _n characters, where
       _n was the number of characters that were needed to indent the rest of
       the line to the proper indentation level. This behavior is a bug and is
       not permitted by POSIX.1‐2008.

   UUnnddoo
       Historical practice for cursor positioning after undoing commands was
       mixed. In most cases, when undoing commands that affected a single
       line, the cursor was moved to the start of added or changed text, or
       immediately after deleted text. However, if the user had moved from the
       line being changed, the column was either set to the first non-<blank>,
       returned to the origin of the command, or remained unchanged. When
       undoing commands that affected multiple lines or entire lines, the
       cursor was moved to the first character in the first line restored. As
       an example of how inconsistent this was, a search, followed by an oo
       text input command, followed by an uunnddoo would return the cursor to the
       location where the oo command was entered, but a ccww command followed by
       an oo command followed by an uunnddoo would return the cursor to the first
       non-<blank> of the line. POSIX.1‐2008 requires the most useful of these
       behaviors, and discards the least useful, in the interest of
       consistency and simplicity of specification.

   YYaannkk
       Historically, the yyaannkk command did not move to the end of the motion if
       the motion was in the forward direction. It moved to the end of the
       motion if the motion was in the backward direction, except for the __
       command, or for the GG and '' commands when the end of the motion was on
       the current line. This was further complicated by the fact that for a
       number of motion commands, the yyaannkk command moved the cursor but did
       not update the screen; for example, a subsequent command would move the
       cursor from the end of the motion, even though the cursor on the screen
       had not reflected the cursor movement for the yyaannkk command.
       POSIX.1‐2008 requires that all yyaannkk commands associated with backward
       motions move the cursor to the end of the motion for consistency, and
       specifically, to make '' commands as motions consistent with search
       patterns as motions.

   YYaannkk CCuurrrreenntt LLiinnee
       Some historical implementations of the YY command did not behave as
       described by POSIX.1‐2008 when the ''__'' key was remapped because they
       were implemented by pushing the ''__'' key onto the input queue and
       reprocessing it. POSIX.1‐2008 does not permit this behavior.

   RReeddrraaww WWiinnddooww
       Historically, the zz command always redrew the screen. This is permitted
       but not required by POSIX.1‐2008, because of the frequent use of the zz
       command in macros such as mmaapp nn nnzz..  for screen positioning, instead of
       its use to change the screen size.  The standard developers believed
       that expanding or scrolling the screen offered a better interface for
       users. The ability to redraw the screen is preserved if the optional
       new window size is specified, and in the <control>‐L and <control>‐R
       commands.

       The semantics of zz^^ are confusing at best. Historical practice is that
       the screen before the screen that ended with the specified line is
       displayed. POSIX.1‐2008 requires conformance to historical practice.

       Historically, the zz command would not display a partial line at the top
       or bottom of the screen. If the partial line would normally have been
       displayed at the bottom of the screen, the command worked, but the
       partial line was replaced with ''@@'' characters. If the partial line
       would normally have been displayed at the top of the screen, the
       command would fail. For consistency and simplicity of specification,
       POSIX.1‐2008 does not permit this behavior.

       Historically, the zz command with a line specification of 1 ignored the
       command. For consistency and simplicity of specification, POSIX.1‐2008
       does not permit this behavior.

       Historically, the zz command did not set the cursor column to the first
       non-<blank> for the character if the first screen was to be displayed,
       and was already displayed. For consistency and simplicity of
       specification, POSIX.1‐2008 does not permit this behavior.

   IInnppuutt MMooddee CCoommmmaannddss iinn vvii
       Historical implementations of _v_i did not permit the user to erase more
       than a single line of input, or to use normal erase characters such as
       _l_i_n_e _e_r_a_s_e, _w_o_r_d_e_r_a_s_e, and _e_r_a_s_e to erase aauuttooiinnddeenntt characters. As
       there exist implementations of _v_i that do not have these limitations,
       both behaviors are permitted, but only historical practice is required.
       In the case of these extensions, _v_i is required to pause at the
       aauuttooiinnddeenntt and previous line boundaries.

       Historical implementations of _v_i updated only the portion of the screen
       where the current cursor character was displayed. For example, consider
       the _v_i input keystrokes:


           iiaabbccdd<<eessccaappee>>00CC<<ttaabb>>

       Historically, the <tab> would overwrite the characters ""aabbccdd"" when it
       was displayed. Other implementations replace only the ''aa'' character
       with the <tab>, and then push the rest of the characters ahead of the
       cursor. Both implementations have problems. The historical
       implementation is probably visually nicer for the above example;
       however, for the keystrokes:


           iiaabbccdd<<EESSCC>>00RR<<ttaabb>><<EESSCC>>

       the historical implementation results in the string ""bbccdd"" disappearing
       and then magically reappearing when the <ESC> character is entered.
       POSIX.1‐2008 requires the former behavior when overwriting erase-
       columns—that is, overwriting characters that are no longer logically
       part of the edit buffer—and the latter behavior otherwise.

       Historical implementations of _v_i discarded the <control>‐D and
       <control>‐T characters when they were entered at places where their
       command functionality was not appropriate. POSIX.1‐2008 requires that
       the <control>‐T functionality always be available, and that <control>‐D
       be treated as any other key when not operating on aauuttooiinnddeenntt
       characters.

   NNUULL
       Some historical implementations of _v_i limited the number of characters
       entered using the NUL input character to 256 bytes. POSIX.1‐2008
       permits this limitation; however, implementations are encouraged to
       remove this limit.

   <<ccoonnttrrooll>>‐‐DD
       See also Rationale for the input mode command <newline>.  The hidden
       assumptions in the <control>‐D command (and in the _v_i aauuttooiinnddeenntt
       specification in general) is that <space> characters take up a single
       column on the screen and that <tab> characters are comprised of an
       integral number of <space> characters.

   <<nneewwlliinnee>>
       Implementations are permitted to rewrite aauuttooiinnddeenntt characters in the
       line when <newline>, <carriage-return>, <control>‐D, and <control>‐T
       are entered, or when the sshhiifftt commands are used, because historical
       implementations have both done so and found it necessary to do so. For
       example, a <control>‐D when the cursor is preceded by a single <tab>,
       with ttaabbssttoopp set to 8, and sshhiiffttwwiiddtthh set to 3, will result in the
       <tab> being replaced by several <space> characters.

   <<ccoonnttrrooll>>‐‐TT
       See also the Rationale for the input mode command <newline>.
       Historically, <control>‐T only worked if no non-<blank> characters had
       yet been input in the current input line. In addition, the characters
       inserted by <control>‐T were treated as aauuttooiinnddeenntt characters, and
       could not be erased using normal user erase characters.  Because
       implementations exist that do not have these limitations, and as moving
       to a column boundary is generally useful, POSIX.1‐2008 requires that
       both limitations be removed.

   <<ccoonnttrrooll>>‐‐VV
       Historically, _v_i used ^^VV, regardless of the value of the literal-next
       character of the terminal.  POSIX.1‐2008 requires conformance to
       historical practice.

       The uses described for <control>‐V can also be accomplished with
       <control>‐Q, which is useful on terminals that use <control>‐V for the
       down-arrow function. However, most historical implementations use
       <control>‐Q for the _t_e_r_m_i_o_s START character, so the editor will
       generally not receive the <control>‐Q unless ssttttyy iixxoonn mode is set to
       off. (In addition, some historical implementations of _v_i explicitly set
       iixxoonn mode to on, so it was difficult for the user to set it to off.)
       Any of the command characters described in POSIX.1‐2008 can be made
       ineffective by their selection as _t_e_r_m_i_o_s control characters, using the
       _s_t_t_y utility or other methods described in the System Interfaces volume
       of POSIX.1‐2008.

   <<EESSCC>>
       Historically, SIGINT alerted the terminal when used to end input mode.
       This behavior is permitted, but not required, by POSIX.1‐2008.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _e_d, _e_x, _s_t_t_y

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y
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



IEEE/The Open Group                  2013                               VI(1P)
