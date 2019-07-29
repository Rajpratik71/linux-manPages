EX(1P)                     POSIX Programmer's Manual                    EX(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       ex — text editor

SSYYNNOOPPSSIISS
       ex [[−rR]] [[−s|−v]] [[−c _c_o_m_m_a_n_d]] [[−t _t_a_g_s_t_r_i_n_g]] [[−w _s_i_z_e]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _e_x utility is a line-oriented text editor. There are two other
       modes of the editor—open and visual—in which screen-oriented editing is
       available. This is described more fully by the _e_x ooppeenn and vviissuuaall
       commands and in _v_i.

       If an operand is ''−−'', the results are unspecified.

       This section uses the term _e_d_i_t _b_u_f_f_e_r to describe the current working
       text. No specific implementation is implied by this term. All editing
       changes are performed on the edit buffer, and no changes to it shall
       affect any file until an editor command writes the file.

       Certain terminals do not have all the capabilities necessary to support
       the complete _e_x definition, such as the full-screen editing commands
       (_v_i_s_u_a_l _m_o_d_e or _o_p_e_n _m_o_d_e).  When these commands cannot be supported on
       such terminals, this condition shall not produce an error message such
       as ``not an editor command'' or report a syntax error. The
       implementation may either accept the commands and produce results on
       the screen that are the result of an unsuccessful attempt to meet the
       requirements of this volume of POSIX.1‐2008 or report an error
       describing the terminal-related deficiency.

OOPPTTIIOONNSS
       The _e_x utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except for the
       unspecified usage of ''−−'', and that ''++'' may be recognized as an option
       delimiter as well as ''−−''.

       The following options shall be supported:

       −−cc  _c_o_m_m_a_n_d
                 Specify an initial command to be executed in the first edit
                 buffer loaded from an existing file (see the EXTENDED
                 DESCRIPTION section).  Implementations may support more than
                 a single −−cc option. In such implementations, the specified
                 commands shall be executed in the order specified on the
                 command line.

       −−rr        Recover the named files (see the EXTENDED DESCRIPTION
                 section).  Recovery information for a file shall be saved
                 during an editor or system crash (for example, when the
                 editor is terminated by a signal which the editor can catch),
                 or after the use of an _e_x pprreesseerrvvee command.

                 A _c_r_a_s_h in this context is an unexpected failure of the
                 system or utility that requires restarting the failed system
                 or utility. A system crash implies that any utilities running
                 at the time also crash. In the case of an editor or system
                 crash, the number of changes to the edit buffer (since the
                 most recent pprreesseerrvvee command) that will be recovered is
                 unspecified.

                 If no _f_i_l_e operands are given and the −−tt option is not
                 specified, all other options, the _E_X_I_N_I_T variable, and any
                 ..eexxrrcc files shall be ignored; a list of all recoverable files
                 available to the invoking user shall be written, and the
                 editor shall exit normally without further action.

       −−RR        Set rreeaaddoonnllyy edit option.

       −−ss        Prepare _e_x for batch use by taking the following actions:

                  *  Suppress writing prompts and informational (but not
                     diagnostic) messages.

                  *  Ignore the value of _T_E_R_M and any implementation default
                     terminal type and assume the terminal is a type incapable
                     of supporting open or visual modes; see the vviissuuaall
                     command and the description of _v_i.

                  *  Suppress the use of the _E_X_I_N_I_T environment variable and
                     the reading of any ..eexxrrcc file; see the EXTENDED
                     DESCRIPTION section.

                  *  Suppress autoindentation, ignoring the value of the
                     aauuttooiinnddeenntt edit option.

       −−tt  _t_a_g_s_t_r_i_n_g
                 Edit the file containing the specified _t_a_g_s_t_r_i_n_g; see _c_t_a_g_s.
                 The tags feature represented by −−tt _t_a_g_s_t_r_i_n_g and the ttaagg
                 command is optional. It shall be provided on any system that
                 also provides a conforming implementation of _c_t_a_g_s;
                 otherwise, the use of −−tt produces undefined results. On any
                 system, it shall be an error to specify more than a single −−tt
                 option.

       −−vv        Begin in visual mode (see _v_i).

       −−ww  _s_i_z_e   Set the value of the _w_i_n_d_o_w editor option to _s_i_z_e.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a file to be edited.

SSTTDDIINN
       The standard input consists of a series of commands and input text, as
       described in the EXTENDED DESCRIPTION section. The implementation may
       limit each line of standard input to a length of {LINE_MAX}.

       If the standard input is not a terminal device, it shall be as if the
       −−ss option had been specified.

       If a read from the standard input returns an error, or if the editor
       detects an end-of-file condition from the standard input, it shall be
       equivalent to a SIGHUP asynchronous event.

IINNPPUUTT FFIILLEESS
       Input files shall be text files or files that would be text files
       except for an incomplete last line that is not longer than {LINE_MAX}−1
       bytes in length and contains no NUL characters. By default, any
       incomplete last line shall be treated as if it had a trailing
       <newline>.  The editing of other forms of files may optionally be
       allowed by _e_x implementations.

       The ..eexxrrcc files and source files shall be text files consisting of _e_x
       commands; see the EXTENDED DESCRIPTION section.

       By default, the editor shall read lines from the files to be edited
       without interpreting any of those lines as any form of editor command.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _e_x:

       _C_O_L_U_M_N_S   Override the system-selected horizontal screen size. See the
                 Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8,
                 _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s for valid values and results when it is
                 unset or null.

       _E_X_I_N_I_T    Determine a list of _e_x commands that are executed on editor
                 start-up. See the EXTENDED DESCRIPTION section for more
                 details of the initialization phase.

       _H_O_M_E      Determine a pathname of a directory that shall be searched
                 for an editor start-up file named ..eexxrrcc; see the EXTENDED
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
                 files), the behavior of character classes within regular
                 expressions, the classification of characters as uppercase or
                 lowercase letters, the case conversion of letters, and the
                 detection of word boundaries.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _L_I_N_E_S     Override the system-selected vertical screen size, used as
                 the number of lines in a screenful and the vertical screen
                 size in visual mode.  See the Base Definitions volume of
                 POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s for valid
                 values and results when it is unset or null.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _P_A_T_H      Determine the search path for the shell command specified in
                 the _e_x editor commands !!, sshheellll, rreeaadd, and wwrriittee, and the
                 open and visual mode command !!; see the description of
                 command search and execution in _S_e_c_t_i_o_n _2_._9_._1_._1, _C_o_m_m_a_n_d
                 _S_e_a_r_c_h _a_n_d _E_x_e_c_u_t_i_o_n.

       _S_H_E_L_L     Determine the preferred command line interpreter for use as
                 the default value of the sshheellll edit option.

       _T_E_R_M      Determine the name of the terminal type. If this variable is
                 unset or null, an unspecified default terminal type shall be
                 used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       The following term is used in this and following sections to specify
       command and asynchronous event actions:

       _c_o_m_p_l_e_t_e_ _w_r_i_t_e
                 A complete write is a write of the entire contents of the
                 edit buffer to a file of a type other than a terminal device,
                 or the saving of the edit buffer caused by the user executing
                 the _e_x pprreesseerrvvee command. Writing the contents of the edit
                 buffer to a temporary file that will be removed when the
                 editor exits shall not be considered a complete write.

       The following actions shall be taken upon receipt of signals:

       SIGINT    If the standard input is not a terminal device, _e_x shall not
                 write the file or return to command or text input mode, and
                 shall exit with a non-zero exit status.

                 Otherwise, if executing an open or visual text input mode
                 command, _e_x in receipt of SIGINT shall behave identically to
                 its receipt of the <ESC> character.

                 Otherwise:

                  1. If executing an _e_x text input mode command, all input
                     lines that have been completely entered shall be resolved
                     into the edit buffer, and any partially entered line
                     shall be discarded.

                  2. If there is a currently executing command, it shall be
                     aborted and a message displayed. Unless otherwise
                     specified by the _e_x or _v_i command descriptions, it is
                     unspecified whether any lines modified by the executing
                     command appear modified, or as they were before being
                     modified by the executing command, in the buffer.

                     If the currently executing command was a motion command,
                     its associated command shall be discarded.

                  3. If in open or visual command mode, the terminal shall be
                     alerted.

                  4. The editor shall then return to command mode.

       SIGCONT   The screen shall be refreshed if in open or visual mode.

       SIGHUP    If the edit buffer has been modified since the last complete
                 write, _e_x shall attempt to save the edit buffer so that it
                 can be recovered later using the −−rr option or the _e_x rreeccoovveerr
                 command. The editor shall not write the file or return to
                 command or text input mode, and shall terminate with a non-
                 zero exit status.

       SIGTERM   Refer to SIGHUP.

       The action taken for all other signals is unspecified.

SSTTDDOOUUTT
       The standard output shall be used only for writing prompts to the user,
       for informational messages, and for writing lines from the file.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       The output from _e_x shall be text files.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       Only the _e_x mode of the editor is described in this section. See _v_i for
       additional editing capabilities available in _e_x.

       When an error occurs, _e_x shall write a message. If the terminal
       supports a standout mode (such as inverse video), the message shall be
       written in standout mode. If the terminal does not support a standout
       mode, and the edit option eerrrroorrbbeellllss is set, an alert action shall
       precede the error message.

       By default, _e_x shall start in command mode, which shall be indicated by
       a :: prompt; see the pprroommpptt command. Text input mode can be entered by
       the aappppeenndd, iinnsseerrtt, or cchhaannggee commands; it can be exited (and command
       mode re-entered) by typing a <period> (''..'') alone at the beginning of a
       line.

   IInniittiiaalliizzaattiioonn iinn eexx aanndd vvii
       The following symbols are used in this and following sections to
       specify locations in the edit buffer:

       _a_l_t_e_r_n_a_t_e_ _a_n_d_ _c_u_r_r_e_n_t_ _p_a_t_h_n_a_m_e_s
             Two pathnames, named _c_u_r_r_e_n_t and _a_l_t_e_r_n_a_t_e, are maintained by the
             editor. Any _e_x commands that take filenames as arguments shall
             set them as follows:

              1. If a _f_i_l_e argument is specified to the _e_x eeddiitt, eexx, or
                 rreeccoovveerr commands, or if an _e_x ttaagg command replaces the
                 contents of the edit buffer.

                  a. If the command replaces the contents of the edit buffer,
                     the current pathname shall be set to the _f_i_l_e argument or
                     the file indicated by the tag, and the alternate pathname
                     shall be set to the previous value of the current
                     pathname.

                  b. Otherwise, the alternate pathname shall be set to the
                     _f_i_l_e argument.

              2. If a _f_i_l_e argument is specified to the _e_x nneexxtt command:

                  a. If the command replaces the contents of the edit buffer,
                     the current pathname shall be set to the first _f_i_l_e
                     argument, and the alternate pathname shall be set to the
                     previous value of the current pathname.

              3. If a _f_i_l_e argument is specified to the _e_x ffiillee command, the
                 current pathname shall be set to the _f_i_l_e argument, and the
                 alternate pathname shall be set to the previous value of the
                 current pathname.

              4. If a _f_i_l_e argument is specified to the _e_x rreeaadd and wwrriittee
                 commands (that is, when reading or writing a file, and not to
                 the program named by the sshheellll edit option), or a _f_i_l_e
                 argument is specified to the _e_x xxiitt command:

                  a. If the current pathname has no value, the current
                     pathname shall be set to the _f_i_l_e argument.

                  b. Otherwise, the alternate pathname shall be set to the
                     _f_i_l_e argument.

             If the alternate pathname is set to the previous value of the
             current pathname when the current pathname had no previous value,
             then the alternate pathname shall have no value as a result.

       _c_u_r_r_e_n_t_ _l_i_n_e
             The line of the edit buffer referenced by the cursor. Each
             command description specifies the current line after the command
             has been executed, as the _c_u_r_r_e_n_t _l_i_n_e _v_a_l_u_e.  When the edit
             buffer contains no lines, the current line shall be zero; see
             _A_d_d_r_e_s_s_i_n_g _i_n _e_x.

       _c_u_r_r_e_n_t_ _c_o_l_u_m_n
             The current display line column occupied by the cursor. (The
             columns shall be numbered beginning at 1.) Each command
             description specifies the current column after the command has
             been executed, as the _c_u_r_r_e_n_t _c_o_l_u_m_n value. This column is an
             _i_d_e_a_l column that is remembered over the lifetime of the editor.
             The actual display line column upon which the cursor rests may be
             different from the current column; see the cursor positioning
             discussion in _C_o_m_m_a_n_d _D_e_s_c_r_i_p_t_i_o_n_s _i_n _v_i.

       _s_e_t_ _t_o_ _n_o_n_-_<_b_l_a_n_k_>
             A description for a current column value, meaning that the
             current column shall be set to the last display line column on
             which is displayed any part of the first non-<blank> of the line.
             If the line has no non-<blank> non-<newline> characters, the
             current column shall be set to the last display line column on
             which is displayed any part of the last non-<newline> character
             in the line. If the line is empty, the current column shall be
             set to column position 1.

       The length of lines in the edit buffer may be limited to {LINE_MAX}
       bytes. In open and visual mode, the length of lines in the edit buffer
       may be limited to the number of characters that will fit in the
       display. If either limit is exceeded during editing, an error message
       shall be written. If either limit is exceeded by a line read in from a
       file, an error message shall be written and the edit session may be
       terminated.

       If the editor stops running due to any reason other than a user
       command, and the edit buffer has been modified since the last complete
       write, it shall be equivalent to a SIGHUP asynchronous event. If the
       system crashes, it shall be equivalent to a SIGHUP asynchronous event.

       During initialization (before the first file is copied into the edit
       buffer or any user commands from the terminal are processed) the
       following shall occur:

        1. If the environment variable _E_X_I_N_I_T is set, the editor shall execute
           the _e_x commands contained in that variable.

        2. If the _E_X_I_N_I_T variable is not set, and all of the following are
           true:

            a. The _H_O_M_E environment variable is not null and not empty.

            b. The file ..eexxrrcc in the directory referred to by the _H_O_M_E
               environment variable:

                i.  Exists

               ii.  Is owned by the same user ID as the real user ID of the
                    process or the process has appropriate privileges

               iii. Is not writable by anyone other than the owner

           the editor shall execute the _e_x commands contained in that file.

        3. If and only if all of the following are true:

            a. The current directory is not referred to by the _H_O_M_E
               environment variable.

            b. A command in the _E_X_I_N_I_T environment variable or a command in
               the ..eexxrrcc file in the directory referred to by the _H_O_M_E
               environment variable sets the editor option eexxrrcc.

            c. The ..eexxrrcc file in the current directory:

                i.  Exists

               ii.  Is owned by the same user ID as the real user ID of the
                    process, or by one of a set of implementation-defined user
                    IDs

               iii. Is not writable by anyone other than the owner

           the editor shall attempt to execute the _e_x commands contained in
           that file.

       Lines in any ..eexxrrcc file that are blank lines shall be ignored. If any
       ..eexxrrcc file exists, but is not read for ownership or permission reasons,
       it shall be an error.

       After the _E_X_I_N_I_T variable and any ..eexxrrcc files are processed, the first
       file specified by the user shall be edited, as follows:

        1. If the user specified the −−tt option, the effect shall be as if the
           _e_x ttaagg command was entered with the specified argument, with the
           exception that if tag processing does not result in a file to edit,
           the effect shall be as described in step 3. below.

        2. Otherwise, if the user specified any command line _f_i_l_e arguments,
           the effect shall be as if the _e_x eeddiitt command was entered with the
           first of those arguments as its _f_i_l_e argument.

        3. Otherwise, the effect shall be as if the _e_x eeddiitt command was
           entered with a nonexistent filename as its _f_i_l_e argument. It is
           unspecified whether this action shall set the current pathname. In
           an implementation where this action does not set the current
           pathname, any editor command using the current pathname shall fail
           until an editor command sets the current pathname.

       If the −−rr option was specified, the first time a file in the initial
       argument list or a file specified by the −−tt option is edited, if
       recovery information has previously been saved about it, that
       information shall be recovered and the editor shall behave as if the
       contents of the edit buffer have already been modified. If there are
       multiple instances of the file to be recovered, the one most recently
       saved shall be recovered, and an informational message that there are
       previous versions of the file that can be recovered shall be written.
       If no recovery information about a file is available, an informational
       message to this effect shall be written, and the edit shall proceed as
       usual.

       If the −−cc option was specified, the first time a file that already
       exists (including a file that might not exist but for which recovery
       information is available, when the −−rr option is specified) replaces or
       initializes the contents of the edit buffer, the current line shall be
       set to the last line of the edit buffer, the current column shall be
       set to non-<blank>, and the _e_x commands specified with the −−cc option
       shall be executed. In this case, the current line and current column
       shall not be set as described for the command associated with the
       replacement or initialization of the edit buffer contents. However, if
       the −−tt option or a ttaagg command is associated with this action, the −−cc
       option commands shall be executed and then the movement to the tag
       shall be performed.

       The current argument list shall initially be set to the filenames
       specified by the user on the command line. If no filenames are
       specified by the user, the current argument list shall be empty. If the
       −−tt option was specified, it is unspecified whether any filename
       resulting from tag processing shall be prepended to the current
       argument list. In the case where the filename is added as a prefix to
       the current argument list, the current argument list reference shall be
       set to that filename. In the case where the filename is not added as a
       prefix to the current argument list, the current argument list
       reference shall logically be located before the first of the filenames
       specified on the command line (for example, a subsequent _e_x nneexxtt
       command shall edit the first filename from the command line). If the −−tt
       option was not specified, the current argument list reference shall be
       to the first of the filenames on the command line.

   AAddddrreessssiinngg iinn eexx
       Addressing in _e_x relates to the current line and the current column;
       the address of a line is its 1-based line number, the address of a
       column is its 1-based count from the beginning of the line. Generally,
       the current line is the last line affected by a command. The current
       line number is the address of the current line. In each command
       description, the effect of the command on the current line number and
       the current column is described.

       Addresses are constructed as follows:

        1. The character ''..'' (period) shall address the current line.

        2. The character ''$$'' shall address the last line of the edit buffer.

        3. The positive decimal number _n shall address the _nth line of the
           edit buffer.

        4. The address ""''xx"" refers to the line marked with the mark name
           character ''xx'', which shall be a lowercase letter from the portable
           character set, the backquote character, or the single-quote
           character. It shall be an error if the line that was marked is not
           currently present in the edit buffer or the mark has not been set.
           Lines can be marked with the _e_x mmaarrkk or kk commands, or the _v_i mm
           command.

        5. A regular expression enclosed by <slash> characters (''//'') shall
           address the first line found by searching forwards from the line
           following the current line toward the end of the edit buffer and
           stopping at the first line for which the line excluding the
           terminating <newline> matches the regular expression. As stated in
           _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s _i_n _e_x, an address consisting of a null regular
           expression delimited by <slash> characters (""////"") shall address the
           next line for which the line excluding the terminating <newline>
           matches the last regular expression encountered. In addition, the
           second <slash> can be omitted at the end of a command line. If the
           wwrraappssccaann edit option is set, the search shall wrap around to the
           beginning of the edit buffer and continue up to and including the
           current line, so that the entire edit buffer is searched. Within
           the regular expression, the sequence ""\\//"" shall represent a literal
           <slash> instead of the regular expression delimiter.

        6. A regular expression enclosed in <question-mark> characters (''??'')
           shall address the first line found by searching backwards from the
           line preceding the current line toward the beginning of the edit
           buffer and stopping at the first line for which the line excluding
           the terminating <newline> matches the regular expression. An
           address consisting of a null regular expression delimited by
           <question-mark> characters (""????"") shall address the previous line
           for which the line excluding the terminating <newline> matches the
           last regular expression encountered. In addition, the second
           <question-mark> can be omitted at the end of a command line. If the
           wwrraappssccaann edit option is set, the search shall wrap around from the
           beginning of the edit buffer to the end of the edit buffer and
           continue up to and including the current line, so that the entire
           edit buffer is searched. Within the regular expression, the
           sequence ""\\??"" shall represent a literal <question-mark> instead of
           the RE delimiter.

        7. A <plus-sign> (''++'') or a minus-sign (''−−'') followed by a decimal
           number shall address the current line plus or minus the number. A
           ''++'' or ''−−'' not followed by a decimal number shall address the
           current line plus or minus 1.

       Addresses can be followed by zero or more address offsets, optionally
       <blank>-separated.  Address offsets are constructed as follows:

        1. A ''++'' or ''−−'' immediately followed by a decimal number shall add
           (subtract) the indicated number of lines to (from) the address. A
           ''++'' or ''−−'' not followed by a decimal number shall add (subtract) 1
           to (from) the address.

        2. A decimal number shall add the indicated number of lines to the
           address.

       It shall not be an error for an intermediate address value to be less
       than zero or greater than the last line in the edit buffer. It shall be
       an error for the final address value to be less than zero or greater
       than the last line in the edit buffer.

       Commands take zero, one, or two addresses; see the descriptions of
       _1_a_d_d_r and _2_a_d_d_r in _C_o_m_m_a_n_d _D_e_s_c_r_i_p_t_i_o_n_s _i_n _e_x.  If more than the
       required number of addresses are provided to a command that requires
       zero addresses, it shall be an error. Otherwise, if more than the
       required number of addresses are provided to a command, the addresses
       specified first shall be evaluated and then discarded until the maximum
       number of valid addresses remain.

       Addresses shall be separated from each other by a <comma> ('',,'') or a
       <semicolon> ('';;'').  If no address is specified before or after a
       <comma> or <semicolon> separator, it shall be as if the address of the
       current line was specified before or after the separator. In the case
       of a <semicolon> separator, the current line (''..'') shall be set to the
       first address, and only then will the next address be calculated. This
       feature can be used to determine the starting line for forwards and
       backwards searches (see rules 5. and 6.).

       A <percent-sign> (''%%'') shall be equivalent to entering the two
       addresses ""11,,$$"".

       Any delimiting <blank> characters between addresses, address
       separators, or address offsets shall be discarded.

   CCoommmmaanndd LLiinnee PPaarrssiinngg iinn eexx
       The following symbol is used in this and following sections to describe
       parsing behavior:

       _e_s_c_a_p_e    If a character is referred to as ``<backslash>-escaped'' or
                 ``<control>‐V-escaped'', it shall mean that the character
                 acquired or lost a special meaning by virtue of being
                 preceded, respectively, by a <backslash> or <control>‐V
                 character. Unless otherwise specified, the escaping character
                 shall be discarded at that time and shall not be further
                 considered for any purpose.

       Command-line parsing shall be done in the following steps. For each
       step, characters already evaluated shall be ignored; that is, the
       phrase ``leading character'' refers to the next character that has not
       yet been evaluated.

        1. Leading <colon> characters shall be skipped.

        2. Leading <blank> characters shall be skipped.

        3. If the leading character is a double-quote character, the
           characters up to and including the next non-<backslash>-escaped
           <newline> shall be discarded, and any subsequent characters shall
           be parsed as a separate command.

        4. Leading characters that can be interpreted as addresses shall be
           evaluated; see _A_d_d_r_e_s_s_i_n_g _i_n _e_x.

        5. Leading <blank> characters shall be skipped.

        6. If the next character is a <vertical-line> character or a
           <newline>:

            a. If the next character is a <newline>:

                i.  If _e_x is in open or visual mode, the current line shall be
                    set to the last address specified, if any.

               ii.  Otherwise, if the last command was terminated by a
                    <vertical-line> character, no action shall be taken; for
                    example, the command ""||||<<nneewwlliinnee>>"" shall execute two
                    implied commands, not three.

               iii. Otherwise, step 6.b. shall apply.

            b. Otherwise, the implied command shall be the pprriinntt command. The
               last ##, pp, and ll flags specified to any _e_x command shall be
               remembered and shall apply to this implied command.  Executing
               the _e_x nnuummbbeerr, pprriinntt, or lliisstt command shall set the remembered
               flags to ##, nothing, and ll, respectively, plus any other flags
               specified for that execution of the nnuummbbeerr, pprriinntt, or lliisstt
               command.

               If _e_x is not currently performing a gglloobbaall or vv command, and no
               address or count is specified, the current line shall be
               incremented by 1 before the command is executed. If
               incrementing the current line would result in an address past
               the last line in the edit buffer, the command shall fail, and
               the increment shall not happen.

            c. The <newline> or <vertical-line> character shall be discarded
               and any subsequent characters shall be parsed as a separate
               command.

        7. The command name shall be comprised of the next character (if the
           character is not alphabetic), or the next character and any
           subsequent alphabetic characters (if the character is alphabetic),
           with the following exceptions:

            a. Commands that consist of any prefix of the characters in the
               command name ddeelleettee, followed immediately by any of the
               characters ''ll'', ''pp'', ''++'', ''−−'', or ''##'' shall be interpreted as a
               ddeelleettee command, followed by a <blank>, followed by the
               characters that were not part of the prefix of the ddeelleettee
               command. The maximum number of characters shall be matched to
               the command name ddeelleettee; for example, ""ddeell"" shall not be
               treated as ""ddee"" followed by the flag ll.

            b. Commands that consist of the character ''kk'', followed by a
               character that can be used as the name of a mark, shall be
               equivalent to the mark command followed by a <blank>, followed
               by the character that followed the ''kk''.

            c. Commands that consist of the character ''ss'', followed by
               characters that could be interpreted as valid options to the ss
               command, shall be the equivalent of the ss command, without any
               pattern or replacement values, followed by a <blank>, followed
               by the characters after the ''ss''.

        8. The command name shall be matched against the possible command
           names, and a command name that contains a prefix matching the
           characters specified by the user shall be the executed command. In
           the case of commands where the characters specified by the user
           could be ambiguous, the executed command shall be as follows:

                         +---+--------++---+-------++---+-------+
                         |aa  | aappppeenndd ||nn  | nneexxtt  ||tt  | tt     |
                         |cc  | cchhaannggee ||pp  | pprriinntt ||uu  | uunnddoo  |
                         |cchh | cchhaannggee ||pprr | pprriinntt ||uunn | uunnddoo  |
                         |ee  | eeddiitt   ||rr  | rreeaadd  ||vv  | vv     |
                         |mm  | mmoovvee   ||rree | rreeaadd  ||ww  | wwrriittee |
                         |mmaa | mmaarrkk   ||ss  | ss     ||   |       |
                         +---+--------++---+-------++---+-------+
           Implementation extensions with names causing similar ambiguities
           shall not be checked for a match until all possible matches for
           commands specified by POSIX.1‐2008 have been checked.

        9. If the command is a !!  command, or if the command is a rreeaadd command
           followed by zero or more <blank> characters and a !!, or if the
           command is a wwrriittee command followed by one or more <blank>
           characters and a !!, the rest of the command shall include all
           characters up to a non-<backslash>-escaped <newline>.  The
           <newline> shall be discarded and any subsequent characters shall be
           parsed as a separate _e_x command.

       10. Otherwise, if the command is an eeddiitt, eexx, or nneexxtt command, or a
           vviissuuaall command while in open or visual mode, the next part of the
           command shall be parsed as follows:

            a. Any ''!!'' character immediately following the command shall be
               skipped and be part of the command.

            b. Any leading <blank> characters shall be skipped and be part of
               the command.

            c. If the next character is a ''++'', characters up to the first
               non-<backslash>-escaped <newline> or non-<backslash>-escaped
               <blank> shall be skipped and be part of the command.

            d. The rest of the command shall be determined by the steps
               specified in paragraph 12.

       11. Otherwise, if the command is a gglloobbaall, ooppeenn, ss, or vv command, the
           next part of the command shall be parsed as follows:

            a. Any leading <blank> characters shall be skipped and be part of
               the command.

            b. If the next character is not an alphanumeric, double-quote,
               <newline>, <backslash>, or <vertical-line> character:

                i.  The next character shall be used as a command delimiter.

               ii.  If the command is a gglloobbaall, ooppeenn, or vv command, characters
                    up to the first non-<backslash>-escaped <newline>, or
                    first non-<backslash>-escaped delimiter character, shall
                    be skipped and be part of the command.

               iii. If the command is an ss command, characters up to the first
                    non-<backslash>-escaped <newline>, or second
                    non-<backslash>-escaped delimiter character, shall be
                    skipped and be part of the command.

            c. If the command is a gglloobbaall or vv command, characters up to the
               first non-<backslash>-escaped <newline> shall be skipped and be
               part of the command.

            d. Otherwise, the rest of the command shall be determined by the
               steps specified in paragraph 12.

       12. Otherwise:

            a. If the command was a mmaapp, uunnmmaapp, aabbbbrreevviiaattee, or uunnaabbbbrreevviiaattee
               command, characters up to the first non-<control>‐V-escaped
               <newline>, <vertical-line>, or double-quote character shall be
               skipped and be part of the command.

            b. Otherwise, characters up to the first non-<backslash>-escaped
               <newline>, <vertical-line>, or double-quote character shall be
               skipped and be part of the command.

            c. If the command was an aappppeenndd, cchhaannggee, or iinnsseerrtt command, and
               the step 12.b. ended at a <vertical-line> character, any
               subsequent characters, up to the next non-<backslash>-escaped
               <newline> shall be used as input text to the command.

            d. If the command was ended by a double-quote character, all
               subsequent characters, up to the next non-<backslash>-escaped
               <newline>, shall be discarded.

            e. The terminating <newline> or <vertical-line> character shall be
               discarded and any subsequent characters shall be parsed as a
               separate _e_x command.

       Command arguments shall be parsed as described by the Synopsis and
       Description of each individual _e_x command. This parsing shall not be
       <blank>-sensitive, except for the !!  argument, which must follow the
       command name without intervening <blank> characters, and where it would
       otherwise be ambiguous. For example, _c_o_u_n_t and _f_l_a_g arguments need not
       be <blank>-separated because ""dd2222pp"" is not ambiguous, but _f_i_l_e
       arguments to the _e_x nneexxtt command must be separated by one or more
       <blank> characters. Any <blank> in command arguments for the
       aabbbbrreevviiaattee, uunnaabbbbrreevviiaattee, mmaapp, and uunnmmaapp commands can be <control>‐V-
       escaped, in which case the <blank> shall not be used as an argument
       delimiter. Any <blank> in the command argument for any other command
       can be <backslash>-escaped, in which case that <blank> shall not be
       used as an argument delimiter.

       Within command arguments for the aabbbbrreevviiaattee, uunnaabbbbrreevviiaattee, mmaapp, and
       uunnmmaapp commands, any character can be <control>‐V-escaped.  All such
       escaped characters shall be treated literally and shall have no special
       meaning. Within command arguments for all other _e_x commands that are
       not regular expressions or replacement strings, any character that
       would otherwise have a special meaning can be <backslash>-escaped.
       Escaped characters shall be treated literally, without special meaning
       as shell expansion characters or ''!!'', ''%%'', and ''##'' expansion
       characters. See _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s _i_n _e_x and _R_e_p_l_a_c_e_m_e_n_t _S_t_r_i_n_g_s _i_n _e_x
       for descriptions of command arguments that are regular expressions or
       replacement strings.

       Non-<backslash>-escaped ''%%'' characters appearing in _f_i_l_e arguments to
       any _e_x command shall be replaced by the current pathname; unescaped ''##''
       characters shall be replaced by the alternate pathname. It shall be an
       error if ''%%'' or ''##'' characters appear unescaped in an argument and
       their corresponding values are not set.

       Non-<backslash>-escaped ''!!'' characters in the arguments to either the
       _e_x !!  command or the open and visual mode !!  command, or in the
       arguments to the _e_x rreeaadd command, where the first non-<blank> after the
       command name is a ''!!'' character, or in the arguments to the _e_x wwrriittee
       command where the command name is followed by one or more <blank>
       characters and the first non-<blank> after the command name is a ''!!''
       character, shall be replaced with the arguments to the last of those
       three commands as they appeared after all unescaped ''%%'', ''##'', and ''!!''
       characters were replaced. It shall be an error if ''!!'' characters appear
       unescaped in one of these commands and there has been no previous
       execution of one of these commands.

       If an error occurs during the parsing or execution of an _e_x command:

        *  An informational message to this effect shall be written. Execution
           of the _e_x command shall stop, and the cursor (for example, the
           current line and column) shall not be further modified.

        *  If the _e_x command resulted from a map expansion, all characters
           from that map expansion shall be discarded, except as otherwise
           specified by the mmaapp command.

        *  Otherwise, if the _e_x command resulted from the processing of an
           _E_X_I_N_I_T environment variable, a ..eexxrrcc file, a ::ssoouurrccee command, a −−cc
           option, or a ++_c_o_m_m_a_n_d specified to an _e_x eeddiitt, eexx, nneexxtt, or vviissuuaall
           command, no further commands from the source of the commands shall
           be executed.

        *  Otherwise, if the _e_x command resulted from the execution of a
           buffer or a gglloobbaall or vv command, no further commands caused by the
           execution of the buffer or the gglloobbaall or vv command shall be
           executed.

        *  Otherwise, if the _e_x command was not terminated by a <newline>, all
           characters up to and including the next non-<backslash>-escaped
           <newline> shall be discarded.

   IInnppuutt EEddiittiinngg iinn eexx
       The following symbol is used in this and the following sections to
       specify command actions:

       _w_o_r_d      In the POSIX locale, a word consists of a maximal sequence of
                 letters, digits, and underscores, delimited at both ends by
                 characters other than letters, digits, or underscores, or by
                 the beginning or end of a line or the edit buffer.

       When accepting input characters from the user, in either _e_x command
       mode or _e_x text input mode, _e_x shall enable canonical mode input
       processing, as defined in the System Interfaces volume of POSIX.1‐2008.

       If in _e_x text input mode:

        1. If the nnuummbbeerr edit option is set, _e_x shall prompt for input using
           the line number that would be assigned to the line if it is
           entered, in the format specified for the _e_x nnuummbbeerr command.

        2. If the aauuttooiinnddeenntt edit option is set, _e_x shall prompt for input
           using aauuttooiinnddeenntt characters, as described by the aauuttooiinnddeenntt edit
           option.  aauuttooiinnddeenntt characters shall follow the line number, if
           any.

       If in _e_x command mode:

        1. If the pprroommpptt edit option is set, input shall be prompted for using
           a single ''::'' character; otherwise, there shall be no prompt.

       The input characters in the following sections shall have the following
       effects on the input line.

   SSccrroollll
       _S_y_n_o_p_s_i_s:

                     eeooff

       See the description of the _s_t_t_y _e_o_f character in _s_t_t_y.

       If in _e_x command mode:

              If the _e_o_f character is the first character entered on the line,
              the line shall be evaluated as if it contained two characters: a
              <control>‐D and a <newline>.

              Otherwise, the _e_o_f character shall have no special meaning.

       If in _e_x text input mode:

              If the cursor follows an aauuttooiinnddeenntt character, the aauuttooiinnddeenntt
              characters in the line shall be modified so that a part of the
              next text input character will be displayed on the first column
              in the line after the previous sshhiiffttwwiiddtthh edit option column
              boundary, and the user shall be prompted again for input for the
              same line.

              Otherwise, if the cursor follows a ''00'', which follows an
              aauuttooiinnddeenntt character, and the ''00'' was the previous text input
              character, the ''00'' and all aauuttooiinnddeenntt characters in the line
              shall be discarded, and the user shall be prompted again for
              input for the same line.

              Otherwise, if the cursor follows a ''^^'', which follows an
              aauuttooiinnddeenntt character, and the ''^^'' was the previous text input
              character, the ''^^'' and all aauuttooiinnddeenntt characters in the line
              shall be discarded, and the user shall be prompted again for
              input for the same line. In addition, the aauuttooiinnddeenntt level for
              the next input line shall be derived from the same line from
              which the aauuttooiinnddeenntt level for the current input line was
              derived.

              Otherwise, if there are no aauuttooiinnddeenntt or text input characters
              in the line, the _e_o_f character shall be discarded.

              Otherwise, the _e_o_f character shall have no special meaning.

   <<nneewwlliinnee>>
       _S_y_n_o_p_s_i_s:

                     <<nneewwlliinnee>>
                     <<ccoonnttrrooll>>--JJ

       If in _e_x command mode:

              Cause the command line to be parsed; <control>‐J shall be mapped
              to the <newline> for this purpose.

       If in _e_x text input mode:

              Terminate the current line. If there are no characters other
              than aauuttooiinnddeenntt characters on the line, all characters on the
              line shall be discarded.

              Prompt for text input on a new line after the current line. If
              the aauuttooiinnddeenntt edit option is set, an appropriate number of
              aauuttooiinnddeenntt characters shall be added as a prefix to the line as
              described by the _e_x aauuttooiinnddeenntt edit option.

   <<bbaacckkssllaasshh>>
       _S_y_n_o_p_s_i_s:

                     <<bbaacckkssllaasshh>>

       Allow the entry of a subsequent <newline> or <control>‐J as a literal
       character, removing any special meaning that it may have to the editor
       during text input mode. The <backslash> character shall be retained and
       evaluated when the command line is parsed, or retained and included
       when the input text becomes part of the edit buffer.

   <<ccoonnttrrooll>>‐‐VV
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--VV

       Allow the entry of any subsequent character as a literal character,
       removing any special meaning that it may have to the editor during text
       input mode. The <control>‐V character shall be discarded before the
       command line is parsed or the input text becomes part of the edit
       buffer.

       If the ``literal next'' functionality is performed by the underlying
       system, it is implementation-defined whether a character other than
       <control>‐V performs this function.

   <<ccoonnttrrooll>>‐‐WW
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--WW

       Discard the <control>‐W, and the word previous to it in the input line,
       including any <blank> characters following the word and preceding the
       <control>‐W.  If the ``word erase'' functionality is performed by the
       underlying system, it is implementation-defined whether a character
       other than <control>‐W performs this function.

   CCoommmmaanndd DDeessccrriippttiioonnss iinn eexx
       The following symbols are used in this section to represent command
       modifiers. Some of these modifiers can be omitted, in which case the
       specified defaults shall be used.

       _1_a_d_d_r     A single line address, given in any of the forms described in
                 _A_d_d_r_e_s_s_i_n_g _i_n _e_x; the default shall be the current line
                 (''..''), unless otherwise specified.

                 If the line address is zero, it shall be an error, unless
                 otherwise specified in the following command descriptions.

                 If the edit buffer is empty, and the address is specified
                 with a command other than ==, aappppeenndd, iinnsseerrtt, ooppeenn, ppuutt, rreeaadd,
                 or vviissuuaall, or the address is not zero, it shall be an error.

       _2_a_d_d_r     Two addresses specifying an inclusive range of lines. If no
                 addresses are specified, the default for _2_a_d_d_r shall be the
                 current line only (""..,,..""), unless otherwise specified in the
                 following command descriptions. If one address is specified,
                 _2_a_d_d_r shall specify that line only, unless otherwise
                 specified in the following command descriptions.

                 It shall be an error if the first address is greater than the
                 second address.

                 If the edit buffer is empty, and the two addresses are
                 specified with a command other than the !!, wwrriittee, wwqq, or xxiitt
                 commands, or either address is not zero, it shall be an
                 error.

       _c_o_u_n_t     A positive decimal number. If _c_o_u_n_t is specified, it shall be
                 equivalent to specifying an additional address to the
                 command, unless otherwise specified by the following command
                 descriptions. The additional address shall be equal to the
                 last address specified to the command (either explicitly or
                 by default) plus _c_o_u_n_t−1.

                 If this would result in an address greater than the last line
                 of the edit buffer, it shall be corrected to equal the last
                 line of the edit buffer.

       _f_l_a_g_s     One or more of the characters ''++'', ''−−'', ''##'', ''pp'', or ''ll''
                 (ell). The flag characters can be <blank>-separated, and in
                 any order or combination. The characters ''##'', ''pp'', and ''ll''
                 shall cause lines to be written in the format specified by
                 the pprriinntt command with the specified _f_l_a_g_s.

                 The lines to be written are as follows:

                  1. All edit buffer lines written during the execution of the
                     _e_x &&, ~~, lliisstt, nnuummbbeerr, ooppeenn, pprriinntt, ss, vviissuuaall, and zz
                     commands shall be written as specified by _f_l_a_g_s.

                  2. After the completion of an _e_x command with a flag as an
                     argument, the current line shall be written as specified
                     by _f_l_a_g_s, unless the current line was the last line
                     written by the command.

                 The characters ''++'' and ''−−'' cause the value of the current
                 line after the execution of the _e_x command to be adjusted by
                 the offset address as described in _A_d_d_r_e_s_s_i_n_g _i_n _e_x.  This
                 adjustment shall occur before the current line is written as
                 described in 2. above.

                 The default for _f_l_a_g_s shall be none.

       _b_u_f_f_e_r    One of a number of named areas for holding text. The named
                 buffers are specified by the alphanumeric characters of the
                 POSIX locale. There shall also be one ``unnamed'' buffer.
                 When no buffer is specified for editor commands that use a
                 buffer, the unnamed buffer shall be used.  Commands that
                 store text into buffers shall store the text as it was before
                 the command took effect, and shall store text occurring
                 earlier in the file before text occurring later in the file,
                 regardless of how the text region was specified. Commands
                 that store text into buffers shall store the text into the
                 unnamed buffer as well as any specified buffer.

                 In _e_x commands, buffer names are specified as the name by
                 itself. In open or visual mode commands the name is preceded
                 by a double-quote (''""'') character.

                 If the specified buffer name is an uppercase character, and
                 the buffer contents are to be modified, the buffer shall be
                 appended to rather than being overwritten. If the buffer is
                 not being modified, specifying the buffer name in lowercase
                 and uppercase shall have identical results.

                 There shall also be buffers named by the numbers 1 through 9.
                 In open and visual mode, if a region of text including
                 characters from more than a single line is being modified by
                 the _v_i cc or dd commands, the motion character associated with
                 the cc or dd commands specifies that the buffer text shall be
                 in line mode, or the commands %%, ``, //, ??, ((, )), NN, nn, {{, or }}
                 are used to define a region of text for the cc or dd commands,
                 the contents of buffers 1 through 8 shall be moved into the
                 buffer named by the next numerically greater value, the
                 contents of buffer 9 shall be discarded, and the region of
                 text shall be copied into buffer 1. This shall be in addition
                 to copying the text into a user-specified buffer or unnamed
                 buffer, or both. Numeric buffers can be specified as a source
                 buffer for open and visual mode commands; however, specifying
                 a numeric buffer as the write target of an open or visual
                 mode command shall have unspecified results.

                 The text of each buffer shall have the characteristic of
                 being in either line or character mode. Appending text to a
                 non-empty buffer shall set the mode to match the
                 characteristic of the text being appended. Appending text to
                 a buffer shall cause the creation of at least one additional
                 line in the buffer. All text stored into buffers by _e_x
                 commands shall be in line mode. The _e_x commands that use
                 buffers as the source of text specify individually how
                 buffers of different modes are handled. Each open or visual
                 mode command that uses buffers for any purpose specifies
                 individually the mode of the text stored into the buffer and
                 how buffers of different modes are handled.

       _f_i_l_e      Command text used to derive a pathname. The default shall be
                 the current pathname, as defined previously, in which case,
                 if no current pathname has yet been established it shall be
                 an error, except where specifically noted in the individual
                 command descriptions that follow.  If the command text
                 contains any of the characters ''~~'', ''{{'', ''[['', ''**'', ''??'', ''$$'',
                 ''""'', backquote, single-quote, and <backslash>, it shall be
                 subjected to the process of ``shell expansions'', as
                 described below; if more than a single pathname results and
                 the command expects only one, it shall be an error.

                 The process of shell expansions in the editor shall be done
                 as follows. The _e_x utility shall pass two arguments to the
                 program named by the shell edit option; the first shall be
                 −−cc, and the second shall be the string ""eecchhoo"" and the command
                 text as a single argument. The standard output and standard
                 error of that command shall replace the command text.

       !!         A character that can be appended to the command name to
                 modify its operation, as detailed in the individual command
                 descriptions. With the exception of the _e_x rreeaadd, wwrriittee, and !!
                 commands, the ''!!'' character shall only act as a modifier if
                 there are no <blank> characters between it and the command
                 name.

       _r_e_m_e_m_b_e_r_e_d_ _s_e_a_r_c_h_ _d_i_r_e_c_t_i_o_n
                 The _v_i commands NN and nn begin searching in a forwards or
                 backwards direction in the edit buffer based on a remembered
                 search direction, which is initially unset, and is set by the
                 _e_x gglloobbaall, vv, ss, and ttaagg commands, and the _v_i // and ??
                 commands.

   AAbbbbrreevviiaattee
       _S_y_n_o_p_s_i_s:

                     aabb[[_b_r_e_v_i_a_t_e]][[_l_h_s _r_h_s]]

       If _l_h_s and _r_h_s are not specified, write the current list of
       abbreviations and do nothing more.

       Implementations may restrict the set of characters accepted in _l_h_s or
       _r_h_s, except that printable characters and <blank> characters shall not
       be restricted. Additional restrictions shall be implementation-defined.

       In both _l_h_s and _r_h_s, any character may be escaped with a <control>‐V,
       in which case the character shall not be used to delimit _l_h_s from _r_h_s,
       and the escaping <control>‐V shall be discarded.

       In open and visual text input mode, if a non-word or <ESC> character
       that is not escaped by a <control>‐V character is entered after a word
       character, a check shall be made for a set of characters matching _l_h_s,
       in the text input entered during this command. If it is found, the
       effect shall be as if _r_h_s was entered instead of _l_h_s.

       The set of characters that are checked is defined as follows:

        1. If there are no characters inserted before the word and non-word or
           <ESC> characters that triggered the check, the set of characters
           shall consist of the word character.

        2. If the character inserted before the word and non-word or <ESC>
           characters that triggered the check is a word character, the set of
           characters shall consist of the characters inserted immediately
           before the triggering characters that are word characters, plus the
           triggering word character.

        3. If the character inserted before the word and non-word or <ESC>
           characters that triggered the check is not a word character, the
           set of characters shall consist of the characters that were
           inserted before the triggering characters that are neither <blank>
           characters nor word characters, plus the triggering word character.

       It is unspecified whether the _l_h_s argument entered for the _e_x
       aabbbbrreevviiaattee and uunnaabbbbrreevviiaattee commands is replaced in this fashion.
       Regardless of whether or not the replacement occurs, the effect of the
       command shall be as if the replacement had not occurred.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   AAppppeenndd
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] a[[ppend]][[!]]

       Enter _e_x text input mode; the input text shall be placed after the
       specified line. If line zero is specified, the text shall be placed at
       the beginning of the edit buffer.

       This command shall be affected by the nnuummbbeerr and aauuttooiinnddeenntt edit
       options; following the command name with ''!!'' shall cause the aauuttooiinnddeenntt
       edit option setting to be toggled for the duration of this command
       only.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last input line; if no lines were input, set
       to the specified line, or to the first line of the edit buffer if a
       line of zero was specified, or zero if the edit buffer is empty.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   AArrgguummeennttss
       _S_y_n_o_p_s_i_s:

                     aarr[[_g_s]]

       Write the current argument list, with the current argument-list entry,
       if any, between ''[['' and '']]'' characters.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   CChhaannggee
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] c[[hange]][[!]][[_c_o_u_n_t]]

       Enter _e_x text input mode; the input text shall replace the specified
       lines. The specified lines shall be copied into the unnamed buffer,
       which shall become a line mode buffer.

       This command shall be affected by the nnuummbbeerr and aauuttooiinnddeenntt edit
       options; following the command name with ''!!'' shall cause the aauuttooiinnddeenntt
       edit option setting to be toggled for the duration of this command
       only.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last input line; if no lines were input, set
       to the line before the first address, or to the first line of the edit
       buffer if there are no lines preceding the first address, or to zero if
       the edit buffer is empty.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   CChhaannggee DDiirreeccttoorryy
       _S_y_n_o_p_s_i_s:

                     cchhdd[[ir]][[!]][[_d_i_r_e_c_t_o_r_y]]
                     cd[[!]][[_d_i_r_e_c_t_o_r_y]]

       Change the current working directory to _d_i_r_e_c_t_o_r_y.

       If no _d_i_r_e_c_t_o_r_y argument is specified, and the _H_O_M_E environment
       variable is set to a non-null and non-empty value, _d_i_r_e_c_t_o_r_y shall
       default to the value named in the _H_O_M_E environment variable. If the
       _H_O_M_E environment variable is empty or is undefined, the default value
       of _d_i_r_e_c_t_o_r_y is implementation-defined.

       If no ''!!'' is appended to the command name, and the edit buffer has been
       modified since the last complete write, and the current pathname does
       not begin with a ''//'', it shall be an error.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   CCooppyy
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] co[[py]] _1_a_d_d_r [[_f_l_a_g_s]]
                     [[_2_a_d_d_r]] t _1_a_d_d_r [[_f_l_a_g_s]]

       Copy the specified lines after the specified destination line; line
       zero specifies that the lines shall be placed at the beginning of the
       edit buffer.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last line copied.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   DDeelleettee
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] d[[elete]][[_b_u_f_f_e_r]][[_c_o_u_n_t]][[_f_l_a_g_s]]

       Delete the specified lines into a buffer (defaulting to the unnamed
       buffer), which shall become a line-mode buffer.

       Flags can immediately follow the command name; see _C_o_m_m_a_n_d _L_i_n_e _P_a_r_s_i_n_g
       _i_n _e_x.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the line following the deleted lines, or to the
       last line in the edit buffer if that line is past the end of the edit
       buffer, or to zero if the edit buffer is empty.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   EEddiitt
       _S_y_n_o_p_s_i_s:

                     ee[[dit]][[!]][[+_c_o_m_m_a_n_d]][[_f_i_l_e]]
                     ex[[!]][[+_c_o_m_m_a_n_d]][[_f_i_l_e]]

       If no ''!!'' is appended to the command name, and the edit buffer has been
       modified since the last complete write, it shall be an error.

       If _f_i_l_e is specified, replace the current contents of the edit buffer
       with the current contents of _f_i_l_e, and set the current pathname to
       _f_i_l_e.  If _f_i_l_e is not specified, replace the current contents of the
       edit buffer with the current contents of the file named by the current
       pathname. If for any reason the current contents of the file cannot be
       accessed, the edit buffer shall be empty.

       The ++_c_o_m_m_a_n_d option shall be <blank>-delimited; <blank> characters
       within the ++_c_o_m_m_a_n_d can be escaped by preceding them with a <backslash>
       character. The ++_c_o_m_m_a_n_d shall be interpreted as an _e_x command
       immediately after the contents of the edit buffer have been replaced
       and the current line and column have been set.

       If the edit buffer is empty:

       _C_u_r_r_e_n_t _l_i_n_e: Set to 0.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to 1.

       Otherwise, if executed while in _e_x command mode or if the ++_c_o_m_m_a_n_d
       argument is specified:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last line of the edit buffer.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

       Otherwise, if _f_i_l_e is omitted or results in the current pathname:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the first line of the edit buffer.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

       Otherwise, if _f_i_l_e is the same as the last file edited, the line and
       column shall be set as follows; if the file was previously edited, the
       line and column may be set as follows:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last value held when that file was last
       edited. If this value is not a valid line in the new edit buffer, set
       to the first line of the edit buffer.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: If the current line was set to the last value held when
       the file was last edited, set to the last value held when the file was
       last edited.  Otherwise, or if the last value is not a valid column in
       the new edit buffer, set to non-<blank>.

       Otherwise:

       _C_u_r_r_e_n_t _l_i_n_e: Set to the first line of the edit buffer.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   FFiillee
       _S_y_n_o_p_s_i_s:

                     ff[[ile]][[_f_i_l_e]]

       If a _f_i_l_e argument is specified, the alternate pathname shall be set to
       the current pathname, and the current pathname shall be set to _f_i_l_e.

       Write an informational message. If the file has a current pathname, it
       shall be included in this message; otherwise, the message shall
       indicate that there is no current pathname. If the edit buffer contains
       lines, the current line number and the number of lines in the edit
       buffer shall be included in this message; otherwise, the message shall
       indicate that the edit buffer is empty. If the edit buffer has been
       modified since the last complete write, this fact shall be included in
       this message. If the rreeaaddoonnllyy edit option is set, this fact shall be
       included in this message. The message may contain other unspecified
       information.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   GGlloobbaall
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] g[[lobal]] /_p_a_t_t_e_r_n/ [[_c_o_m_m_a_n_d_s]]
                     [[_2_a_d_d_r]] v /_p_a_t_t_e_r_n/ [[_c_o_m_m_a_n_d_s]]

       The optional ''!!'' character after the gglloobbaall command shall be the same
       as executing the vv command.

       If _p_a_t_t_e_r_n is empty (for example, ""////"") or not specified, the last
       regular expression used in the editor command shall be used as the
       _p_a_t_t_e_r_n.  The _p_a_t_t_e_r_n can be delimited by <slash> characters (shown in
       the Synopsis), as well as any non-alphanumeric or non-<blank> other
       than <backslash>, <vertical-line>, <newline>, or double-quote.

       If no lines are specified, the lines shall default to the entire file.

       The gglloobbaall and vv commands are logically two-pass operations. First,
       mark the lines within the specified lines for which the line excluding
       the terminating <newline> matches (gglloobbaall) or does not match (vv or
       gglloobbaall!!) the specified pattern. Second, execute the _e_x commands given
       by _c_o_m_m_a_n_d_s, with the current line (''..'') set to each marked line. If an
       error occurs during this process, or the contents of the edit buffer
       are replaced (for example, by the _e_x ::eeddiitt command) an error message
       shall be written and no more commands resulting from the execution of
       this command shall be processed.

       Multiple _e_x commands can be specified by entering multiple commands on
       a single line using a <vertical-line> to delimit them, or one per line,
       by escaping each <newline> with a <backslash>.

       If no commands are specified:

        1. If in _e_x command mode, it shall be as if the pprriinntt command were
           specified.

        2. Otherwise, no command shall be executed.

       For the aappppeenndd, cchhaannggee, and iinnsseerrtt commands, the input text shall be
       included as part of the command, and the terminating <period> can be
       omitted if the command ends the list of commands. The ooppeenn and vviissuuaall
       commands can be specified as one of the commands, in which case each
       marked line shall cause the editor to enter open or visual mode. If
       open or visual mode is exited using the _v_i QQ command, the current line
       shall be set to the next marked line, and open or visual mode
       reentered, until the list of marked lines is exhausted.

       The gglloobbaall, vv, and uunnddoo commands cannot be used in _c_o_m_m_a_n_d_s.  Marked
       lines may be deleted by commands executed for lines occurring earlier
       in the file than the marked lines. In this case, no commands shall be
       executed for the deleted lines.

       If the remembered search direction is not set, the gglloobbaall and vv
       commands shall set it to forward.

       The aauuttoopprriinntt and aauuttooiinnddeenntt edit options shall be inhibited for the
       duration of the gg or vv command.

       _C_u_r_r_e_n_t _l_i_n_e: If no commands executed, set to the last marked line.
       Otherwise, as specified for the executed _e_x commands.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: If no commands are executed, set to non-<blank>;
       otherwise, as specified for the individual _e_x commands.

   IInnsseerrtt
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] i[[nsert]][[!]]

       Enter _e_x text input mode; the input text shall be placed before the
       specified line. If the line is zero or 1, the text shall be placed at
       the beginning of the edit buffer.

       This command shall be affected by the nnuummbbeerr and aauuttooiinnddeenntt edit
       options; following the command name with ''!!'' shall cause the aauuttooiinnddeenntt
       edit option setting to be toggled for the duration of this command
       only.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last input line; if no lines were input, set
       to the line before the specified line, or to the first line of the edit
       buffer if there are no lines preceding the specified line, or zero if
       the edit buffer is empty.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   JJooiinn
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] j[[oin]][[!]][[_c_o_u_n_t]][[_f_l_a_g_s]]

       If _c_o_u_n_t is specified:

              If no address was specified, the jjooiinn command shall behave as if
              _2_a_d_d_r were the current line and the current line plus _c_o_u_n_t (.,.
              + _c_o_u_n_t).

              If one address was specified, the jjooiinn command shall behave as
              if _2_a_d_d_r were the specified address and the specified address
              plus _c_o_u_n_t (_a_d_d_r,_a_d_d_r + _c_o_u_n_t).

              If two addresses were specified, the jjooiinn command shall behave
              as if an additional address, equal to the last address plus
              _c_o_u_n_t −1 (_a_d_d_r_1,_a_d_d_r_2,_a_d_d_r_2 + _c_o_u_n_t −1), was specified.

              If this would result in a second address greater than the last
              line of the edit buffer, it shall be corrected to be equal to
              the last line of the edit buffer.

       If no _c_o_u_n_t is specified:

              If no address was specified, the jjooiinn command shall behave as if
              _2_a_d_d_r were the current line and the next line (.,. +1).

              If one address was specified, the jjooiinn command shall behave as
              if _2_a_d_d_r were the specified address and the next line (_a_d_d_r,_a_d_d_r
              +1).

       Join the text from the specified lines together into a single line,
       which shall replace the specified lines.

       If a ''!!'' character is appended to the command name, the jjooiinn shall be
       without modification of any line, independent of the current locale.

       Otherwise, in the POSIX locale, set the current line to the first of
       the specified lines, and then, for each subsequent line, proceed as
       follows:

        1. Discard leading <space> characters from the line to be joined.

        2. If the line to be joined is now empty, delete it, and skip steps 3
           through 5.

        3. If the current line ends in a <blank>, or the first character of
           the line to be joined is a ''))'' character, join the lines without
           further modification.

        4. If the last character of the current line is a ''..'', join the lines
           with two <space> characters between them.

        5. Otherwise, join the lines with a single <space> between them.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the first line specified.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   LLiisstt
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] l[[ist]][[_c_o_u_n_t]][[_f_l_a_g_s]]

       This command shall be equivalent to the _e_x command:


           [[_2_a_d_d_r]] p[[rint]][[_c_o_u_n_t]] l[[_f_l_a_g_s]]

       See _P_r_i_n_t.

   MMaapp
       _S_y_n_o_p_s_i_s:

                     mmaapp[[!]][[_l_h_s _r_h_s]]

       If _l_h_s and _r_h_s are not specified:

        1. If ''!!'' is specified, write the current list of text input mode
           maps.

        2. Otherwise, write the current list of command mode maps.

        3. Do nothing more.

       Implementations may restrict the set of characters accepted in _l_h_s or
       _r_h_s, except that printable characters and <blank> characters shall not
       be restricted. Additional restrictions shall be implementation-defined.
       In both _l_h_s and _r_h_s, any character can be escaped with a <control>‐V,
       in which case the character shall not be used to delimit _l_h_s from _r_h_s,
       and the escaping <control>‐V shall be discarded.

       If the character ''!!'' is appended to the mmaapp command name, the mapping
       shall be effective during open or visual text input mode rather than
       ooppeenn or vviissuuaall command mode. This allows _l_h_s to have two different mmaapp
       definitions at the same time: one for command mode and one for text
       input mode.

       For command mode mappings:

              When the _l_h_s is entered as any part of a _v_i command in open or
              visual mode (but not as part of the arguments to the command),
              the action shall be as if the corresponding _r_h_s had been
              entered.

              If any character in the command, other than the first, is
              escaped using a <control>‐V character, that character shall not
              be part of a match to an _l_h_s.

              It is unspecified whether implementations shall support mmaapp
              commands where the _l_h_s is more than a single character in
              length, where the first character of the _l_h_s is printable.
              If _l_h_s contains more than one character and the first character
              is ''##'', followed by a sequence of digits corresponding to a
              numbered function key, then when this function key is typed it
              shall be mapped to _r_h_s.  Characters other than digits following
              a ''##'' character also represent the function key named by the
              characters in the _l_h_s following the ''##'' and may be mapped to
              _r_h_s.  It is unspecified how function keys are named or what
              function keys are supported.

       For text input mode mappings:

              When the _l_h_s is entered as any part of text entered in open or
              visual text input modes, the action shall be as if the
              corresponding _r_h_s had been entered.

              If any character in the input text is escaped using a
              <control>‐V character, that character shall not be part of a
              match to an _l_h_s.

              It is unspecified whether the _l_h_s text entered for subsequent
              mmaapp or uunnmmaapp commands is replaced with the _r_h_s text for the
              purposes of the screen display; regardless of whether or not the
              display appears as if the corresponding _r_h_s text was entered,
              the effect of the command shall be as if the _l_h_s text was
              entered.

       If only part of the _l_h_s is entered, it is unspecified how long the
       editor will wait for additional, possibly matching characters before
       treating the already entered characters as not matching the _l_h_s.

       The _r_h_s characters shall themselves be subject to remapping, unless
       otherwise specified by the rreemmaapp edit option, except that if the
       characters in _l_h_s occur as prefix characters in _r_h_s, those characters
       shall not be remapped.

       On block-mode terminals, the mapping need not occur immediately (for
       example, it may occur after the terminal transmits a group of
       characters to the system), but it shall achieve the same results as if
       it occurred immediately.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   MMaarrkk
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] ma[[rk]] _c_h_a_r_a_c_t_e_r
                     [[_1_a_d_d_r]] k _c_h_a_r_a_c_t_e_r

       Implementations shall support _c_h_a_r_a_c_t_e_r values of a single lowercase
       letter of the POSIX locale and the backquote and single-quote
       characters; support of other characters is implementation-defined.

       If executing the _v_i mm command, set the specified mark to the current
       line and 1-based numbered character referenced by the current column,
       if any; otherwise, column position 1.

       Otherwise, set the specified mark to the specified line and 1-based
       numbered first non-<blank> non-<newline> in the line, if any;
       otherwise, the last non-<newline> in the line, if any; otherwise,
       column position 1.

       The mark shall remain associated with the line until the mark is reset
       or the line is deleted. If a deleted line is restored by a subsequent
       uunnddoo command, any marks previously associated with the line, which have
       not been reset, shall be restored as well. Any use of a mark not
       associated with a current line in the edit buffer shall be an error.

       The marks `` and '' shall be set as described previously, immediately
       before the following events occur in the editor:

        1. The use of ''$$'' as an _e_x address

        2. The use of a positive decimal number as an _e_x address

        3. The use of a search command as an _e_x address

        4. The use of a mark reference as an _e_x address

        5. The use of the following open and visual mode commands:
           <control>‐], %%, ((, )), [[, ]], {{, }}

        6. The use of the following open and visual mode commands: '', GG, HH, LL,
           MM, zz if the current line will change as a result of the command

        7. The use of the open and visual mode commands: //, ??, NN, ``, nn if the
           current line or column will change as a result of the command

        8. The use of the _e_x mode commands: zz, uunnddoo, gglloobbaall, vv

       For rules 1., 2., 3., and 4., the `` and '' marks shall not be set if the
       _e_x command is parsed as specified by rule 6.a. in _C_o_m_m_a_n_d _L_i_n_e _P_a_r_s_i_n_g
       _i_n _e_x.

       For rules 5., 6., and 7., the `` and '' marks shall not be set if the
       commands are used as motion commands in open and visual mode.

       For rules 1., 2., 3., 4., 5., 6., 7., and 8., the `` and '' marks shall
       not be set if the command fails.

       The `` and '' marks shall be set as described previously, each time the
       contents of the edit buffer are replaced (including the editing of the
       initial buffer), if in open or visual mode, or if in eexx mode and the
       edit buffer is not empty, before any commands or movements (including
       commands or movements specified by the −−cc or −−tt options or the ++_c_o_m_m_a_n_d
       argument) are executed on the edit buffer. If in open or visual mode,
       the marks shall be set as if executing the _v_i mm command; otherwise, as
       if executing the _e_x mmaarrkk command.

       When changing from eexx mode to open or visual mode, if the `` and '' marks
       are not already set, the `` and '' marks shall be set as described
       previously.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   MMoovvee
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] m[[ove]] _1_a_d_d_r [[_f_l_a_g_s]]

       Move the specified lines after the specified destination line. A
       destination of line zero specifies that the lines shall be placed at
       the beginning of the edit buffer. It shall be an error if the
       destination line is within the range of lines to be moved.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last of the moved lines.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   NNeexxtt
       _S_y_n_o_p_s_i_s:

                     nn[[ext]][[!]][[+_c_o_m_m_a_n_d]][[_f_i_l_e ...]]

       If no ''!!'' is appended to the command name, and the edit buffer has been
       modified since the last complete write, it shall be an error, unless
       the file is successfully written as specified by the aauuttoowwrriittee option.

       If one or more files is specified:

        1. Set the argument list to the specified filenames.

        2. Set the current argument list reference to be the first entry in
           the argument list.

        3. Set the current pathname to the first filename specified.

       Otherwise:

        1. It shall be an error if there are no more filenames in the argument
           list after the filename currently referenced.

        2. Set the current pathname and the current argument list reference to
           the filename after the filename currently referenced in the
           argument list.

       Replace the contents of the edit buffer with the contents of the file
       named by the current pathname. If for any reason the contents of the
       file cannot be accessed, the edit buffer shall be empty.

       This command shall be affected by the aauuttoowwrriittee and wwrriitteeaannyy edit
       options.

       The ++_c_o_m_m_a_n_d option shall be <blank>-delimited; <blank> characters can
       be escaped by preceding them with a <backslash> character. The ++_c_o_m_m_a_n_d
       shall be interpreted as an _e_x command immediately after the contents of
       the edit buffer have been replaced and the current line and column have
       been set.

       _C_u_r_r_e_n_t _l_i_n_e: Set as described for the eeddiitt command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set as described for the eeddiitt command.

   NNuummbbeerr
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] nu[[mber]][[_c_o_u_n_t]][[_f_l_a_g_s]]
                     [[_2_a_d_d_r]] #[[_c_o_u_n_t]][[_f_l_a_g_s]]

       These commands shall be equivalent to the _e_x command:


           [[_2_a_d_d_r]] p[[rint]][[_c_o_u_n_t]] #[[_f_l_a_g_s]]

       See _P_r_i_n_t.

   OOppeenn
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] o[[pen]] /_p_a_t_t_e_r_n/ [[_f_l_a_g_s]]

       This command need not be supported on block-mode terminals or terminals
       with insufficient capabilities. If standard input, standard output, or
       standard error are not terminal devices, the results are unspecified.

       Enter open mode.

       The trailing delimiter can be omitted from _p_a_t_t_e_r_n at the end of the
       command line. If _p_a_t_t_e_r_n is empty (for example, ""////"") or not specified,
       the last regular expression used in the editor shall be used as the
       pattern. The pattern can be delimited by <slash> characters (shown in
       the Synopsis), as well as any alphanumeric, or non-<blank> other than
       <backslash>, <vertical-line>, <newline>, or double-quote.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the specified line.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   PPrreesseerrvvee
       _S_y_n_o_p_s_i_s:

                     pprree[[serve]]

       Save the edit buffer in a form that can later be recovered by using the
       −−rr option or by using the _e_x rreeccoovveerr command. After the file has been
       preserved, a mail message shall be sent to the user. This message shall
       be readable by invoking the _m_a_i_l_x utility. The message shall contain
       the name of the file, the time of preservation, and an _e_x command that
       could be used to recover the file. Additional information may be
       included in the mail message.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   PPrriinntt
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] p[[rint]][[_c_o_u_n_t]][[_f_l_a_g_s]]

       Write the addressed lines. The behavior is unspecified if the number of
       columns on the display is less than the number of columns required to
       write any single character in the lines being written.

       Non-printable characters, except for the <tab>, shall be written as
       implementation-defined multi-character sequences.

       If the ## flag is specified or the nnuummbbeerr edit option is set, each line
       shall be preceded by its line number in the following format:


           ""%%66dd  "",, <<_l_i_n_e _n_u_m_b_e_r>

       If the ll flag is specified or the lliisstt edit option is set:

        1. The characters listed in the Base Definitions volume of
           POSIX.1‐2008, _T_a_b_l_e _5_-_1, _E_s_c_a_p_e _S_e_q_u_e_n_c_e_s _a_n_d _A_s_s_o_c_i_a_t_e_d _A_c_t_i_o_n_s
           shall be written as the corresponding escape sequence.

        2. Non-printable characters not in the Base Definitions volume of
           POSIX.1‐2008, _T_a_b_l_e _5_-_1, _E_s_c_a_p_e _S_e_q_u_e_n_c_e_s _a_n_d _A_s_s_o_c_i_a_t_e_d _A_c_t_i_o_n_s
           shall be written as one three-digit octal number (with a preceding
           <backslash>) for each byte in the character (most significant byte
           first).

        3. The end of each line shall be marked with a ''$$'', and literal ''$$''
           characters within the line shall be written with a preceding
           <backslash>.

       Long lines shall be folded; the length at which folding occurs is
       unspecified, but should be appropriate for the output terminal,
       considering the number of columns of the terminal.

       If a line is folded, and the ll flag is not specified and the lliisstt edit
       option is not set, it is unspecified whether a multi-column character
       at the folding position is separated; it shall not be discarded.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last written line.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged if the current line is unchanged; otherwise,
       set to non-<blank>.

   PPuutt
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] pu[[t]][[_b_u_f_f_e_r]]

       Append text from the specified buffer (by default, the unnamed buffer)
       to the specified line; line zero specifies that the text shall be
       placed at the beginning of the edit buffer. Each portion of a line in
       the buffer shall become a new line in the edit buffer, regardless of
       the mode of the buffer.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last line entered into the edit buffer.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   QQuuiitt
       _S_y_n_o_p_s_i_s:

                     qq[[uit]][[!]]

       If no ''!!'' is appended to the command name:

        1. If the edit buffer has been modified since the last complete write,
           it shall be an error.

        2. If there are filenames in the argument list after the filename
           currently referenced, and the last command was not a qquuiitt, wwqq, xxiitt,
           or ZZZZ (see _E_x_i_t) command, it shall be an error.

       Otherwise, terminate the editing session.

   RReeaadd
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] r[[ead]][[!]][[_f_i_l_e]]

       If ''!!'' is not the first non-<blank> to follow the command name, a copy
       of the specified file shall be appended into the edit buffer after the
       specified line; line zero specifies that the copy shall be placed at
       the beginning of the edit buffer. The number of lines and bytes read
       shall be written. If no _f_i_l_e is named, the current pathname shall be
       the default. If there is no current pathname, then _f_i_l_e shall become
       the current pathname. If there is no current pathname or _f_i_l_e operand,
       it shall be an error. Specifying a _f_i_l_e that is not of type regular
       shall have unspecified results.

       Otherwise, if _f_i_l_e is preceded by ''!!'', the rest of the line after the
       ''!!'' shall have ''%%'', ''##'', and ''!!'' characters expanded as described in
       _C_o_m_m_a_n_d _L_i_n_e _P_a_r_s_i_n_g _i_n _e_x.

       The _e_x utility shall then pass two arguments to the program named by
       the shell edit option; the first shall be −−cc and the second shall be
       the expanded arguments to the rreeaadd command as a single argument. The
       standard input of the program shall be set to the standard input of the
       _e_x program when it was invoked. The standard error and standard output
       of the program shall be appended into the edit buffer after the
       specified line.

       Each line in the copied file or program output (as delimited by
       <newline> characters or the end of the file or output if it is not
       immediately preceded by a <newline>), shall be a separate line in the
       edit buffer. Any occurrences of <carriage-return> and <newline> pairs
       in the output shall be treated as single <newline> characters.

       The special meaning of the ''!!'' following the rreeaadd command can be
       overridden by escaping it with a <backslash> character.

       _C_u_r_r_e_n_t _l_i_n_e: If no lines are added to the edit buffer, unchanged.
       Otherwise, if in open or visual mode, set to the first line entered
       into the edit buffer. Otherwise, set to the last line entered into the
       edit buffer.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   RReeccoovveerr
       _S_y_n_o_p_s_i_s:

                     rreecc[[over]][[!]] _f_i_l_e

       If no ''!!'' is appended to the command name, and the edit buffer has been
       modified since the last complete write, it shall be an error.

       If no _f_i_l_e operand is specified, then the current pathname shall be
       used. If there is no current pathname or _f_i_l_e operand, it shall be an
       error.

       If no recovery information has previously been saved about _f_i_l_e, the
       rreeccoovveerr command shall behave identically to the eeddiitt command, and an
       informational message to this effect shall be written.

       Otherwise, set the current pathname to _f_i_l_e, and replace the current
       contents of the edit buffer with the recovered contents of _f_i_l_e.  If
       there are multiple instances of the file to be recovered, the one most
       recently saved shall be recovered, and an informational message that
       there are previous versions of the file that can be recovered shall be
       written. The editor shall behave as if the contents of the edit buffer
       have already been modified.

       _C_u_r_r_e_n_t _f_i_l_e: Set as described for the eeddiitt command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set as described for the eeddiitt command.

   RReewwiinndd
       _S_y_n_o_p_s_i_s:

                     rreeww[[ind]][[!]]

       If no ''!!'' is appended to the command name, and the edit buffer has been
       modified since the last complete write, it shall be an error, unless
       the file is successfully written as specified by the aauuttoowwrriittee option.

       If the argument list is empty, it shall be an error.

       The current argument list reference and the current pathname shall be
       set to the first filename in the argument list.

       Replace the contents of the edit buffer with the contents of the file
       named by the current pathname. If for any reason the contents of the
       file cannot be accessed, the edit buffer shall be empty.

       This command shall be affected by the aauuttoowwrriittee and wwrriitteeaannyy edit
       options.

       _C_u_r_r_e_n_t _l_i_n_e: Set as described for the eeddiitt command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set as described for the eeddiitt command.

   SSeett
       _S_y_n_o_p_s_i_s:

                     ssee[[t]][[_o_p_t_i_o_n[[=[[_v_a_l_u_e]]]] ...]][[no_o_p_t_i_o_n ...]][[_o_p_t_i_o_n? ...]][[all]]

       When no arguments are specified, write the value of the tteerrmm edit
       option and those options whose values have been changed from the
       default settings; when the argument _a_l_l is specified, write all of the
       option values.

       Giving an option name followed by the character ''??'' shall cause the
       current value of that option to be written. The ''??'' can be separated
       from the option name by zero or more <blank> characters. The ''??'' shall
       be necessary only for Boolean valued options. Boolean options can be
       given values by the form sseett _o_p_t_i_o_n to turn them on or sseett nnoo_o_p_t_i_o_n to
       turn them off; string and numeric options can be assigned by the form
       sseett _o_p_t_i_o_n=_v_a_l_u_e.  Any <blank> characters in strings can be included as
       is by preceding each <blank> with an escaping <backslash>.  More than
       one option can be set or listed by a single set command by specifying
       multiple arguments, each separated from the next by one or more <blank>
       characters.

       See _E_d_i_t _O_p_t_i_o_n_s _i_n _e_x for details about specific options.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   SShheellll
       _S_y_n_o_p_s_i_s:

                     sshh[[ell]]

       Invoke the program named in the sshheellll edit option with the single
       argument −−ii (interactive mode). Editing shall be resumed when the
       program exits.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   SSoouurrccee
       _S_y_n_o_p_s_i_s:

                     ssoo[[urce]] _f_i_l_e

       Read and execute _e_x commands from _f_i_l_e.  Lines in the file that are
       blank lines shall be ignored.

       _C_u_r_r_e_n_t _l_i_n_e: As specified for the individual _e_x commands.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: As specified for the individual _e_x commands.

   SSuubbssttiittuuttee
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] s[[ubstitute]][[/_p_a_t_t_e_r_n/_r_e_p_l/[[_o_p_t_i_o_n_s]][[_c_o_u_n_t]][[_f_l_a_g_s]]]]
                     [[_2_a_d_d_r]] &[[_o_p_t_i_o_n_s]][[_c_o_u_n_t]][[_f_l_a_g_s]]]]
                     [[_2_a_d_d_r]] ~[[_o_p_t_i_o_n_s]][[_c_o_u_n_t]][[_f_l_a_g_s]]]]

       Replace the first instance of the pattern _p_a_t_t_e_r_n by the string _r_e_p_l on
       each specified line. (See _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s _i_n _e_x and _R_e_p_l_a_c_e_m_e_n_t
       _S_t_r_i_n_g_s _i_n _e_x.) Any non-alphabetic, non-<blank> delimiter other than
       <backslash>, ''||'', <newline>, or double-quote can be used instead of
       ''//''.  <backslash> characters can be used to escape delimiters,
       <backslash> characters, and other special characters.

       The trailing delimiter can be omitted from _p_a_t_t_e_r_n or from _r_e_p_l at the
       end of the command line. If both _p_a_t_t_e_r_n and _r_e_p_l are not specified or
       are empty (for example, ""////""), the last ss command shall be repeated. If
       only _p_a_t_t_e_r_n is not specified or is empty, the last regular expression
       used in the editor shall be used as the pattern. If only _r_e_p_l is not
       specified or is empty, the pattern shall be replaced by nothing.  If
       the entire replacement pattern is ''%%'', the last replacement pattern to
       an ss command shall be used.

       Entering a <carriage-return> in _r_e_p_l (which requires an escaping
       <backslash> in _e_x mode and an escaping <control>‐V in open or _v_i mode)
       shall split the line at that point, creating a new line in the edit
       buffer. The <carriage-return> shall be discarded.

       If _o_p_t_i_o_n_s includes the letter ''gg'' (gglloobbaall), all non-overlapping
       instances of the pattern in the line shall be replaced.

       If _o_p_t_i_o_n_s includes the letter ''cc'' (ccoonnffiirrmm), then before each
       substitution the line shall be written; the written line shall reflect
       all previous substitutions. On the following line, <space> characters
       shall be written beneath the characters from the line that are before
       the _p_a_t_t_e_r_n to be replaced, and ''^^'' characters written beneath the
       characters included in the _p_a_t_t_e_r_n to be replaced. The _e_x utility shall
       then wait for a response from the user. An affirmative response shall
       cause the substitution to be done, while any other input shall not make
       the substitution. An affirmative response shall consist of a line with
       the affirmative response (as defined by the current locale) at the
       beginning of the line. This line shall be subject to editing in the
       same way as the _e_x command line.

       If interrupted (see the ASYNCHRONOUS EVENTS section), any modifications
       confirmed by the user shall be preserved in the edit buffer after the
       interrupt.

       If the remembered search direction is not set, the ss command shall set
       it to forward.

       In the second Synopsis, the && command shall repeat the previous
       substitution, as if the && command were replaced by:


           ss//_p_a_t_t_e_r_n/_r_e_p_l/

       where _p_a_t_t_e_r_n and _r_e_p_l are as specified in the previous ss, &&, or ~~
       command.

       In the third Synopsis, the ~~ command shall repeat the previous
       substitution, as if the ''~~'' were replaced by:


           ss//_p_a_t_t_e_r_n/_r_e_p_l/

       where _p_a_t_t_e_r_n shall be the last regular expression specified to the
       editor, and _r_e_p_l shall be from the previous substitution (including &&
       and ~~) command.

       These commands shall be affected by the _L_C___M_E_S_S_A_G_E_S environment
       variable.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last line in which a substitution occurred,
       or, unchanged if no substitution occurred.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   SSuussppeenndd
       _S_y_n_o_p_s_i_s:

                     ssuu[[spend]][[!]]
                     st[[op]][[!]]

       Allow control to return to the invoking process; _e_x shall suspend
       itself as if it had received the SIGTSTP signal. The suspension shall
       occur only if job control is enabled in the invoking shell (see the
       description of _s_e_t −−mm).

       These commands shall be affected by the aauuttoowwrriittee and wwrriitteeaannyy edit
       options.

       The current ssuusspp character (see _s_t_t_y) shall be equivalent to the
       ssuussppeenndd command.

   TTaagg
       _S_y_n_o_p_s_i_s:

                     ttaa[[g]][[!]] _t_a_g_s_t_r_i_n_g

       The results are unspecified if the format of a tags file is not as
       specified by the _c_t_a_g_s utility (see _c_t_a_g_s) description.

       The ttaagg command shall search for _t_a_g_s_t_r_i_n_g in the tag files referred to
       by the ttaagg edit option, in the order they are specified, until a
       reference to _t_a_g_s_t_r_i_n_g is found. Files shall be searched from beginning
       to end. If no reference is found, it shall be an error and an error
       message to this effect shall be written. If the reference is not found,
       or if an error occurs while processing a file referred to in the ttaagg
       edit option, it shall be an error, and an error message shall be
       written at the first occurrence of such an error.

       Otherwise, if the tags file contained a pattern, the pattern shall be
       treated as a regular expression used in the editor; for example, for
       the purposes of the ss command.

       If the _t_a_g_s_t_r_i_n_g is in a file with a different name than the current
       pathname, set the current pathname to the name of that file, and
       replace the contents of the edit buffer with the contents of that file.
       In this case, if no ''!!'' is appended to the command name, and the edit
       buffer has been modified since the last complete write, it shall be an
       error, unless the file is successfully written as specified by the
       aauuttoowwrriittee option.

       This command shall be affected by the aauuttoowwrriittee, ttaagg, ttaagglleennggtthh, and
       wwrriitteeaannyy edit options.

       _C_u_r_r_e_n_t _l_i_n_e: If the tags file contained a line number, set to that
       line number. If the line number is larger than the last line in the
       edit buffer, an error message shall be written and the current line
       shall be set as specified for the eeddiitt command.

       If the tags file contained a pattern, set to the first occurrence of
       the pattern in the file. If no matching pattern is found, an error
       message shall be written and the current line shall be set as specified
       for the eeddiitt command.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: If the tags file contained a line-number reference and
       that line-number was not larger than the last line in the edit buffer,
       or if the tags file contained a pattern and that pattern was found, set
       to non-<blank>.  Otherwise, set as specified for the eeddiitt command.

   UUnnaabbbbrreevviiaattee
       _S_y_n_o_p_s_i_s:

                     uunnaa[[bbrev]] _l_h_s

       If _l_h_s is not an entry in the current list of abbreviations (see
       _A_b_b_r_e_v_i_a_t_e), it shall be an error. Otherwise, delete _l_h_s from the list
       of abbreviations.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   UUnnddoo
       _S_y_n_o_p_s_i_s:

                     uu[[ndo]]

       Reverse the changes made by the last command that modified the contents
       of the edit buffer, including uunnddoo.  For this purpose, the gglloobbaall, vv,
       ooppeenn, and vviissuuaall commands, and commands resulting from buffer
       executions and mapped character expansions, are considered single
       commands.

       If no action that can be undone preceded the uunnddoo command, it shall be
       an error.

       If the uunnddoo command restores lines that were marked, the mark shall
       also be restored unless it was reset subsequent to the deletion of the
       lines.

       _C_u_r_r_e_n_t _l_i_n_e:

        1. If lines are added or changed in the file, set to the first line
           added or changed.

        2. Set to the line before the first line deleted, if it exists.

        3. Set to 1 if the edit buffer is not empty.

        4. Set to zero.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   UUnnmmaapp
       _S_y_n_o_p_s_i_s:

                     uunnmm[[ap]][[!]] _l_h_s

       If ''!!'' is appended to the command name, and if _l_h_s is not an entry in
       the list of text input mode map definitions, it shall be an error.
       Otherwise, delete _l_h_s from the list of text input mode map definitions.

       If no ''!!'' is appended to the command name, and if _l_h_s is not an entry
       in the list of command mode map definitions, it shall be an error.
       Otherwise, delete _l_h_s from the list of command mode map definitions.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   VVeerrssiioonn
       _S_y_n_o_p_s_i_s:

                     vvee[[rsion]]

       Write a message containing version information for the editor. The
       format of the message is unspecified.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   VViissuuaall
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] vi[[sual]][[_t_y_p_e]][[_c_o_u_n_t]][[_f_l_a_g_s]]

       If _e_x is currently in open or visual mode, the Synopsis and behavior of
       the visual command shall be the same as the eeddiitt command, as specified
       by _E_d_i_t.

       Otherwise, this command need not be supported on block-mode terminals
       or terminals with insufficient capabilities. If standard input,
       standard output, or standard error are not terminal devices, the
       results are unspecified.

       If _c_o_u_n_t is specified, the value of the wwiinnddooww edit option shall be set
       to _c_o_u_n_t (as described in _w_i_n_d_o_w).  If the ''^^'' type character was also
       specified, the wwiinnddooww edit option shall be set before being used by the
       type character.

       Enter visual mode. If _t_y_p_e is not specified, it shall be as if a _t_y_p_e
       of ''++'' was specified. The _t_y_p_e shall cause the following effects:

       +     Place the beginning of the specified line at the top of the
             display.

       -     Place the end of the specified line at the bottom of the display.

       .     Place the beginning of the specified line in the middle of the
             display.

       ^     If the specified line is less than or equal to the value of the
             wwiinnddooww edit option, set the line to 1; otherwise, decrement the
             line by the value of the wwiinnddooww edit option minus 1. Place the
             beginning of this line as close to the bottom of the displayed
             lines as possible, while still displaying the value of the wwiinnddooww
             edit option number of lines.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the specified line.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   WWrriittee
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] w[[rite]][[!]][[>>]][[_f_i_l_e]]
                     [[_2_a_d_d_r]] w[[rite]][[!]][[_f_i_l_e]]
                     [[_2_a_d_d_r]] wq[[!]][[>>]][[_f_i_l_e]]

       If no lines are specified, the lines shall default to the entire file.

       The command wwqq shall be equivalent to a wwrriittee command followed by a
       qquuiitt command; wwqq!!  shall be equivalent to wwrriittee!!  followed by qquuiitt.  In
       both cases, if the wwrriittee command fails, the qquuiitt shall not be
       attempted.

       If the command name is not followed by one or more <blank> characters,
       or _f_i_l_e is not preceded by a ''!!'' character, the wwrriittee shall be to a
       file.

        1. If the >>>> argument is specified, and the file already exists, the
           lines shall be appended to the file instead of replacing its
           contents. If the >>>> argument is specified, and the file does not
           already exist, it is unspecified whether the write shall proceed as
           if the >>>> argument had not been specified or if the write shall
           fail.

        2. If the rreeaaddoonnllyy edit option is set (see _r_e_a_d_o_n_l_y), the wwrriittee shall
           fail.

        3. If _f_i_l_e is specified, and is not the current pathname, and the file
           exists, the wwrriittee shall fail.

        4. If _f_i_l_e is not specified, the current pathname shall be used. If
           there is no current pathname, the wwrriittee command shall fail.

        5. If the current pathname is used, and the current pathname has been
           changed by the ffiillee or rreeaadd commands, and the file exists, the
           wwrriittee shall fail. If the wwrriittee is successful, subsequent wwrriittees
           shall not fail for this reason (unless the current pathname is
           changed again).

        6. If the whole edit buffer is not being written, and the file to be
           written exists, the wwrriittee shall fail.

       For rules 1., 2., 3., and 5., the wwrriittee can be forced by appending the
       character ''!!'' to the command name.

       For rules 2., 3., and 5., the wwrriittee can be forced by setting the
       wwrriitteeaannyy edit option.

       Additional, implementation-defined tests may cause the wwrriittee to fail.

       If the edit buffer is empty, a file without any contents shall be
       written.

       An informational message shall be written noting the number of lines
       and bytes written.

       Otherwise, if the command is followed by one or more <blank>
       characters, and the file is preceded by ''!!'', the rest of the line after
       the ''!!'' shall have ''%%'', ''##'', and ''!!'' characters expanded as described
       in _C_o_m_m_a_n_d _L_i_n_e _P_a_r_s_i_n_g _i_n _e_x.

       The _e_x utility shall then pass two arguments to the program named by
       the sshheellll edit option; the first shall be −−cc and the second shall be
       the expanded arguments to the wwrriittee command as a single argument. The
       specified lines shall be written to the standard input of the command.
       The standard error and standard output of the program, if any, shall be
       written as described for the pprriinntt command. If the last character in
       that output is not a <newline>, a <newline> shall be written at the end
       of the output.

       The special meaning of the ''!!'' following the wwrriittee command can be
       overridden by escaping it with a <backslash> character.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   WWrriittee aanndd EExxiitt
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] x[[it]][[!]][[_f_i_l_e]]

       If the edit buffer has not been modified since the last complete wwrriittee,
       xxiitt shall be equivalent to the qquuiitt command, or if a ''!!'' is appended to
       the command name, to qquuiitt!!.

       Otherwise, xxiitt shall be equivalent to the wwqq command, or if a ''!!'' is
       appended to the command name, to wwqq!!.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   YYaannkk
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] ya[[nk]][[_b_u_f_f_e_r]][[_c_o_u_n_t]]

       Copy the specified lines to the specified buffer (by default, the
       unnamed buffer), which shall become a line-mode buffer.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   AAddjjuusstt WWiinnddooww
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] z[[!]][[_t_y_p_e ...]][[_c_o_u_n_t]][[_f_l_a_g_s]]

       If no line is specified, the current line shall be the default; if _t_y_p_e
       is omitted as well, the current line value shall first be incremented
       by 1. If incrementing the current line would cause it to be greater
       than the last line in the edit buffer, it shall be an error.

       If there are <blank> characters between the _t_y_p_e argument and the
       preceding zz command name or optional ''!!'' character, it shall be an
       error.

       If _c_o_u_n_t is specified, the value of the wwiinnddooww edit option shall be set
       to _c_o_u_n_t (as described in _w_i_n_d_o_w).  If _c_o_u_n_t is omitted, it shall
       default to 2 times the value of the ssccrroollll edit option, or if !!  was
       specified, the number of lines in the display minus 1.

       If _t_y_p_e is omitted, then _c_o_u_n_t lines starting with the specified line
       shall be written. Otherwise, _c_o_u_n_t lines starting with the line
       specified by the _t_y_p_e argument shall be written.

       The _t_y_p_e argument shall change the lines to be written. The possible
       values of _t_y_p_e are as follows:

       −     The specified line shall be decremented by the following value:


                 ((((((nnuummbbeerr ooff ````−−'''' cchhaarraacctteerrss)) xx _c_o_u_n_t) −1)

             If the calculation would result in a number less than 1, it shall
             be an error. Write lines from the edit buffer, starting at the
             new value of line, until _c_o_u_n_t lines or the last line in the edit
             buffer has been written.

       +     The specified line shall be incremented by the following value:


                 ((((((nnuummbbeerr ooff ````++'''' cchhaarraacctteerrss)) −−11)) xx _c_o_u_n_t) +1

             If the calculation would result in a number greater than the last
             line in the edit buffer, it shall be an error. Write lines from
             the edit buffer, starting at the new value of line, until _c_o_u_n_t
             lines or the last line in the edit buffer has been written.

       =,.   If more than a single ''..'' or ''=='' is specified, it shall be an
             error. The following steps shall be taken:

              1. If _c_o_u_n_t is zero, nothing shall be written.

              2. Write as many of the _N lines before the current line in the
                 edit buffer as exist. If _c_o_u_n_t or ''!!'' was specified, _N shall
                 be:


                     ((_c_o_u_n_t −1) /2

                 Otherwise, _N shall be:


                     ((_c_o_u_n_t −−33)) //22

                 If _N is a number less than 3, no lines shall be written.

              3. If ''=='' was specified as the type character, write a line
                 consisting of the smaller of the number of columns in the
                 display divided by two, or 40 ''−−'' characters.

              4. Write the current line.

              5. Repeat step 3.

              6. Write as many of the _N lines after the current line in the
                 edit buffer as exist.  _N shall be defined as in step 2. If _N
                 is a number less than 3, no lines shall be written. If _c_o_u_n_t
                 is less than 3, no lines shall be written.

       ^     The specified line shall be decremented by the following value:


                 ((((((nnuummbbeerr ooff ````^^'''' cchhaarraacctteerrss)) ++11)) xx _c_o_u_n_t) −1

             If the calculation would result in a number less than 1, it shall
             be an error. Write lines from the edit buffer, starting at the
             new value of line, until _c_o_u_n_t lines or the last line in the edit
             buffer has been written.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last line written, unless the type is ==, in
       which case, set to the specified line.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   EEssccaappee
       _S_y_n_o_p_s_i_s:

                     !! _c_o_m_m_a_n_d
                     [[_a_d_d_r]]! _c_o_m_m_a_n_d

       The contents of the line after the ''!!'' shall have ''%%'', ''##'', and ''!!''
       characters expanded as described in _C_o_m_m_a_n_d _L_i_n_e _P_a_r_s_i_n_g _i_n _e_x.  If the
       expansion causes the text of the line to change, it shall be
       redisplayed, preceded by a single ''!!'' character.

       The _e_x utility shall execute the program named by the sshheellll edit
       option. It shall pass two arguments to the program; the first shall be
       −−cc, and the second shall be the expanded arguments to the !!  command as
       a single argument.

       If no lines are specified, the standard input, standard output, and
       standard error of the program shall be set to the standard input,
       standard output, and standard error of the _e_x program when it was
       invoked. In addition, a warning message shall be written if the edit
       buffer has been modified since the last complete write, and the wwaarrnn
       edit option is set.

       If lines are specified, they shall be passed to the program as standard
       input, and the standard output and standard error of the program shall
       replace those lines in the edit buffer. Each line in the program output
       (as delimited by <newline> characters or the end of the output if it is
       not immediately preceded by a <newline>), shall be a separate line in
       the edit buffer. Any occurrences of <carriage-return> and <newline>
       pairs in the output shall be treated as single <newline> characters.
       The specified lines shall be copied into the unnamed buffer before they
       are replaced, and the unnamed buffer shall become a line-mode buffer.

       If in _e_x mode, a single ''!!'' character shall be written when the program
       completes.

       This command shall be affected by the sshheellll and wwaarrnn edit options. If
       no lines are specified, this command shall be affected by the aauuttoowwrriittee
       and wwrriitteeaannyy edit options. If lines are specified, this command shall
       be affected by the aauuttoopprriinntt edit option.

       _C_u_r_r_e_n_t _l_i_n_e:

        1. If no lines are specified, unchanged.

        2. Otherwise, set to the last line read in, if any lines are read in.

        3. Otherwise, set to the line before the first line of the lines
           specified, if that line exists.

        4. Otherwise, set to the first line of the edit buffer if the edit
           buffer is not empty.

        5. Otherwise, set to zero.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: If no lines are specified, unchanged. Otherwise, set to
       non-<blank>.

   SShhiifftt LLeefftt
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] <[[< ...]][[_c_o_u_n_t]][[_f_l_a_g_s]]

       Shift the specified lines to the start of the line; the number of
       column positions to be shifted shall be the number of command
       characters times the value of the sshhiiffttwwiiddtthh edit option. Only leading
       <blank> characters shall be deleted or changed into other <blank>
       characters in shifting; other characters shall not be affected.

       Lines to be shifted shall be copied into the unnamed buffer, which
       shall become a line-mode buffer.

       This command shall be affected by the aauuttoopprriinntt edit option.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last line in the lines specified.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   SShhiifftt RRiigghhtt
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] >[[> ...]][[_c_o_u_n_t]][[_f_l_a_g_s]]

       Shift the specified lines away from the start of the line; the number
       of column positions to be shifted shall be the number of command
       characters times the value of the sshhiiffttwwiiddtthh edit option. The shift
       shall be accomplished by adding <blank> characters as a prefix to the
       line or changing leading <blank> characters into other <blank>
       characters. Empty lines shall not be changed.

       Lines to be shifted shall be copied into the unnamed buffer, which
       shall become a line-mode buffer.

       This command shall be affected by the aauuttoopprriinntt edit option.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last line in the lines specified.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   <<ccoonnttrrooll>>‐‐DD
       _S_y_n_o_p_s_i_s:

                     <<ccoonnttrrooll>>--DD

       Write the next _n lines, where _n is the minimum of the values of the
       ssccrroollll edit option and the number of lines after the current line in
       the edit buffer. If the current line is the last line of the edit
       buffer it shall be an error.

       _C_u_r_r_e_n_t _l_i_n_e: Set to the last line written.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Set to non-<blank>.

   WWrriittee LLiinnee NNuummbbeerr
       _S_y_n_o_p_s_i_s:

                     [[_1_a_d_d_r]] = [[_f_l_a_g_s]]

       If _l_i_n_e is not specified, it shall default to the last line in the edit
       buffer.  Write the line number of the specified line.

       _C_u_r_r_e_n_t _l_i_n_e: Unchanged.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: Unchanged.

   EExxeeccuuttee
       _S_y_n_o_p_s_i_s:

                     [[_2_a_d_d_r]] @ _b_u_f_f_e_r
                     [[_2_a_d_d_r]] * _b_u_f_f_e_r

       If no buffer is specified or is specified as ''@@'' or ''**'', the last
       buffer executed shall be used. If no previous buffer has been executed,
       it shall be an error.

       For each line specified by the addresses, set the current line (''..'') to
       the specified line, and execute the contents of the named _b_u_f_f_e_r (as
       they were at the time the @@ command was executed) as _e_x commands. For
       each line of a line-mode buffer, and all but the last line of a
       character-mode buffer, the _e_x command parser shall behave as if the
       line was terminated by a <newline>.

       If an error occurs during this process, or a line specified by the
       addresses does not exist when the current line would be set to it, or
       more than a single line was specified by the addresses, and the
       contents of the edit buffer are replaced (for example, by the _e_x ::eeddiitt
       command) an error message shall be written, and no more commands
       resulting from the execution of this command shall be processed.

       _C_u_r_r_e_n_t _l_i_n_e: As specified for the individual _e_x commands.

       _C_u_r_r_e_n_t _c_o_l_u_m_n: As specified for the individual _e_x commands.

   RReegguullaarr EExxpprreessssiioonnss iinn eexx
       The _e_x utility shall support regular expressions that are a superset of
       the basic regular expressions described in the Base Definitions volume
       of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s.  A null
       regular expression (""////"") shall be equivalent to the last regular
       expression encountered.

       Regular expressions can be used in addresses to specify lines and, in
       some commands (for example, the ssuubbssttiittuuttee command), to specify
       portions of a line to be substituted.

       The following constructs can be used to enhance the basic regular
       expressions:

       \<    Match the beginning of a _w_o_r_d.  (See the definition of _w_o_r_d at
             the beginning of _C_o_m_m_a_n_d _D_e_s_c_r_i_p_t_i_o_n_s _i_n _e_x.)

       \>    Match the end of a _w_o_r_d.

       ~     Match the replacement part of the last ssuubbssttiittuuttee command. The
             <tilde> (''~~'') character can be escaped in a regular expression to
             become a normal character with no special meaning. The
             <backslash> shall be discarded.

       When the editor option mmaaggiicc is not set, the only characters with
       special meanings shall be ''^^'' at the beginning of a pattern, ''$$'' at the
       end of a pattern, and <backslash>.  The characters ''..'', ''**'', ''[['', and
       ''~~'' shall be treated as ordinary characters unless preceded by a
       <backslash>; when preceded by a <backslash> they shall regain their
       special meaning, or in the case of <backslash>, be handled as a single
       <backslash>.  <backslash> characters used to escape other characters
       shall be discarded.

   RReeppllaacceemmeenntt SSttrriinnggss iinn eexx
       The character ''&&'' (''\\&&'' if the editor option mmaaggiicc is not set) in the
       replacement string shall stand for the text matched by the pattern to
       be replaced. The character ''~~'' (''\\~~'' if mmaaggiicc is not set) shall be
       replaced by the replacement part of the previous ssuubbssttiittuuttee command.
       The sequence ''\\nn'', where _n is an integer, shall be replaced by the text
       matched by the corresponding back-reference expression. If the
       corresponding back-reference expression does not match, then the
       characters ''\\nn'' shall be replaced by the empty string.

       The strings ''\\ll'', ''\\uu'', ''\\LL'', and ''\\UU'' can be used to modify the case
       of elements in the replacement string (using the ''\\&&'' or ""\\""digit)
       notation. The string ''\\ll'' (''\\uu'') shall cause the character that follows
       to be converted to lowercase (uppercase). The string ''\\LL'' (''\\UU'') shall
       cause all characters subsequent to it to be converted to lowercase
       (uppercase) as they are inserted by the substitution until the string
       ''\\ee'' or ''\\EE'', or the end of the replacement string, is encountered.

       Otherwise, any character following a <backslash> shall be treated as
       that literal character, and the escaping <backslash> shall be
       discarded.

       An example of case conversion with the ss command is as follows:


           ::p
           TThhee ccaatt ssaatt oonn tthhee mmaatt..
           ::s/\<.at\>/\u&/gp
           TThhee CCaatt SSaatt oonn tthhee MMaatt..
           ::s/S\(.*\)M/S\U\1\eM/p
           TThhee CCaatt SSAATT OONN TTHHEE MMaatt..

   EEddiitt OOppttiioonnss iinn eexx
       The _e_x utility has a number of options that modify its behavior. These
       options have default settings, which can be changed using the sseett
       command.

       Options are Boolean unless otherwise specified.

   aauuttooiinnddeenntt,, aaii
       [Default _u_n_s_e_t]

       If aauuttooiinnddeenntt is set, each line in input mode shall be indented (using
       first as many <tab> characters as possible, as determined by the editor
       option ttaabbssttoopp, and then using <space> characters) to align with
       another line, as follows:

        1. If in open or visual mode and the text input is part of a line-
           oriented command (see the EXTENDED DESCRIPTION in _v_i), align to the
           first column.

        2. Otherwise, if in open or visual mode, indentation for each line
           shall be set as follows:

            a. If a line was previously inserted as part of this command, it
               shall be set to the indentation of the last inserted line by
               default, or as otherwise specified for the <control>‐D
               character in _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n _v_i.

            b. Otherwise, it shall be set to the indentation of the previous
               current line, if any; otherwise, to the first column.

        3. For the _e_x aa, ii, and cc commands, indentation for each line shall be
           set as follows:

            a. If a line was previously inserted as part of this command, it
               shall be set to the indentation of the last inserted line by
               default, or as otherwise specified for the _e_o_f character in
               _S_c_r_o_l_l.

            b. Otherwise, if the command is the _e_x aa command, it shall be set
               to the line appended after, if any; otherwise to the first
               column.

            c. Otherwise, if the command is the _e_x ii command, it shall be set
               to the line inserted before, if any; otherwise to the first
               column.

            d. Otherwise, if the command is the _e_x cc command, it shall be set
               to the indentation of the line replaced.

   aauuttoopprriinntt,, aapp
       [Default _s_e_t]

       If aauuttoopprriinntt is set, the current line shall be written after each _e_x
       command that modifies the contents of the current edit buffer, and
       after each ttaagg command for which the tag search pattern was found or
       tag line number was valid, unless:

        1. The command was executed while in open or visual mode.

        2. The command was executed as part of a gglloobbaall or vv command or @@
           buffer execution.

        3. The command was the form of the rreeaadd command that reads a file into
           the edit buffer.

        4. The command was the aappppeenndd, cchhaannggee, or iinnsseerrtt command.

        5. The command was not terminated by a <newline>.

        6. The current line shall be written by a flag specified to the
           command; for example, ddeelleettee ## shall write the current line as
           specified for the flag modifier to the ddeelleettee command, and not as
           specified by the aauuttoopprriinntt edit option.

   aauuttoowwrriittee,, aaww
       [Default _u_n_s_e_t]

       If aauuttoowwrriittee is set, and the edit buffer has been modified since it was
       last completely written to any file, the contents of the edit buffer
       shall be written as if the _e_x wwrriittee command had been specified without
       arguments, before each command affected by the aauuttoowwrriittee edit option is
       executed. Appending the character ''!!'' to the command name of any of the
       _e_x commands except ''!!'' shall prevent the write. If the write fails, it
       shall be an error and the command shall not be executed.

   bbeeaauuttiiffyy,, bbff
       [Default _u_n_s_e_t]

       If bbeeaauuttiiffyy is set, all non-printable characters, other than <tab>,
       <newline>, and <form-feed> characters, shall be discarded from text
       read in from files.

   ddiirreeccttoorryy,, ddiirr
       [Default _i_m_p_l_e_m_e_n_t_a_t_i_o_n_-_d_e_f_i_n_e_d]

       The value of this option specifies the directory in which the editor
       buffer is to be placed. If this directory is not writable by the user,
       the editor shall quit.

   eeddccoommppaattiibbllee,, eedd
       [Default _u_n_s_e_t]

       Causes the presence of gg and cc suffixes on substitute commands to be
       remembered, and toggled by repeating the suffixes.

   eerrrroorrbbeellllss,, eebb
       [Default _u_n_s_e_t]

       If the editor is in _e_x mode, and the terminal does not support a
       standout mode (such as inverse video), and eerrrroorrbbeellllss is set, error
       messages shall be preceded by alerting the terminal.

   eexxrrcc
       [Default _u_n_s_e_t]

       If eexxrrcc is set, _e_x shall access any ..eexxrrcc file in the current
       directory, as described in _I_n_i_t_i_a_l_i_z_a_t_i_o_n _i_n _e_x _a_n_d _v_i.  If eexxrrcc is not
       set, _e_x shall ignore any ..eexxrrcc file in the current directory during
       initialization, unless the current directory is that named by the _H_O_M_E
       environment variable.

   iiggnnoorreeccaassee,, iicc
       [Default _u_n_s_e_t]

       If iiggnnoorreeccaassee is set, characters that have uppercase and lowercase
       representations shall have those representations considered as
       equivalent for purposes of regular expression comparison.

       The iiggnnoorreeccaassee edit option shall affect all remembered regular
       expressions; for example, unsetting the iiggnnoorreeccaassee edit option shall
       cause a subsequent _v_i nn command to search for the last basic regular
       expression in a case-sensitive fashion.

   lliisstt
       [Default _u_n_s_e_t]

       If lliisstt is set, edit buffer lines written while in _e_x command mode
       shall be written as specified for the pprriinntt command with the ll flag
       specified. In open or visual mode, each edit buffer line shall be
       displayed as specified for the _e_x pprriinntt command with the ll flag
       specified. In open or visual text input mode, when the cursor does not
       rest on any character in the line, it shall rest on the ''$$'' marking the
       end of the line.

   mmaaggiicc
       [Default _s_e_t]

       If mmaaggiicc is set, modify the interpretation of characters in regular
       expressions and substitution replacement strings (see _R_e_g_u_l_a_r
       _E_x_p_r_e_s_s_i_o_n_s _i_n _e_x and _R_e_p_l_a_c_e_m_e_n_t _S_t_r_i_n_g_s _i_n _e_x).

   mmeessgg
       [Default _s_e_t]

       If mmeessgg is set, the permission for others to use the wwrriittee or ttaallkk
       commands to write to the terminal shall be turned on while in open or
       visual mode. The shell-level command _m_e_s_g nn shall take precedence over
       any setting of the _e_x mmeessgg option; that is, if mmeessgg yy was issued before
       the editor started (or in a shell escape), such as:


           ::!!mmeessgg yy

       the mmeessgg option in _e_x shall suppress incoming messages, but the mmeessgg
       option shall not enable incoming messages if mmeessgg nn was issued.

   nnuummbbeerr,, nnuu
       [Default _u_n_s_e_t]

       If nnuummbbeerr is set, edit buffer lines written while in _e_x command mode
       shall be written with line numbers, in the format specified by the
       pprriinntt command with the ## flag specified. In _e_x text input mode, each
       line shall be preceded by the line number it will have in the file.

       In open or visual mode, each edit buffer line shall be displayed with a
       preceding line number, in the format specified by the _e_x pprriinntt command
       with the ## flag specified. This line number shall not be considered
       part of the line for the purposes of evaluating the current column;
       that is, column position 1 shall be the first column position after the
       format specified by the pprriinntt command.

   ppaarraaggrraapphhss,, ppaarraa
       [Default in the POSIX locale IPLPPPQPP LIpplpipbp]

       The ppaarraaggrraapphhss edit option shall define additional paragraph boundaries
       for the open and visual mode commands. The ppaarraaggrraapphhss edit option can
       be set to a character string consisting of zero or more character
       pairs. It shall be an error to set it to an odd number of characters.

   pprroommpptt
       [Default _s_e_t]

       If pprroommpptt is set, _e_x command mode input shall be prompted for with a
       <colon> (''::''); when unset, no prompt shall be written.

   rreeaaddoonnllyy
       [Default _s_e_e _t_e_x_t]

       If the rreeaaddoonnllyy edit option is set, read-only mode shall be enabled
       (see _W_r_i_t_e).  The rreeaaddoonnllyy edit option shall be initialized to set if
       either of the following conditions are true:

        *  The command-line option −R was specified.

        *  Performing actions equivalent to the _a_c_c_e_s_s() function called with
           the following arguments indicates that the file lacks write
           permission:

            1. The current pathname is used as the _p_a_t_h argument.

            2. The constant WW__OOKK is used as the _a_m_o_d_e argument.

       The rreeaaddoonnllyy edit option may be initialized to set for other,
       implementation-defined reasons. The rreeaaddoonnllyy edit option shall not be
       initialized to unset based on any special privileges of the user or
       process. The rreeaaddoonnllyy edit option shall be reinitialized each time that
       the contents of the edit buffer are replaced (for example, by an eeddiitt
       or nneexxtt command) unless the user has explicitly set it, in which case
       it shall remain set until the user explicitly unsets it. Once unset, it
       shall again be reinitialized each time that the contents of the edit
       buffer are replaced.

   rreeddrraaww
       [Default _u_n_s_e_t]

       The editor simulates an intelligent terminal on a dumb terminal.
       (Since this is likely to require a large amount of output to the
       terminal, it is useful only at high transmission speeds.)

   rreemmaapp
       [Default _s_e_t]

       If rreemmaapp is set, map translation shall allow for maps defined in terms
       of other maps; translation shall continue until a final product is
       obtained. If unset, only a one-step translation shall be done.

   rreeppoorrtt
       [Default 5]

       The value of this rreeppoorrtt edit option specifies what number of lines
       being added, copied, deleted, or modified in the edit buffer will cause
       an informational message to be written to the user. The following
       conditions shall cause an informational message. The message shall
       contain the number of lines added, copied, deleted, or modified, but is
       otherwise unspecified.

        *  An _e_x or _v_i editor command, other than ooppeenn, uunnddoo, or vviissuuaall, that
           modifies at least the value of the rreeppoorrtt edit option number of
           lines, and which is not part of an _e_x gglloobbaall or vv command, or _e_x or
           _v_i buffer execution, shall cause an informational message to be
           written.

        *  An _e_x yyaannkk or _v_i yy or YY command, that copies at least the value of
           the rreeppoorrtt edit option plus 1 number of lines, and which is not
           part of an _e_x gglloobbaall or vv command, or _e_x or _v_i buffer execution,
           shall cause an informational message to be written.

        *  An _e_x gglloobbaall, vv, ooppeenn, uunnddoo, or vviissuuaall command or _e_x or _v_i buffer
           execution, that adds or deletes a total of at least the value of
           the rreeppoorrtt edit option number of lines, and which is not part of an
           _e_x gglloobbaall or vv command, or _e_x or _v_i buffer execution, shall cause
           an informational message to be written.  (For example, if 3 lines
           were added and 8 lines deleted during an _e_x vviissuuaall command, 5 would
           be the number compared against the rreeppoorrtt edit option after the
           command completed.)

   ssccrroollll,, ssccrr
       [Default (number of lines in the display −1)/2]

       The value of the ssccrroollll edit option shall determine the number of lines
       scrolled by the _e_x <control>‐D and zz commands. For the _v_i <control>‐D
       and <control>‐U commands, it shall be the initial number of lines to
       scroll when no previous <control>‐D or <control>‐U command has been
       executed.

   sseeccttiioonnss
       [Default in the POSIX locale NHSHH HUnhsh]

       The sseeccttiioonnss edit option shall define additional section boundaries for
       the open and visual mode commands. The sseeccttiioonnss edit option can be set
       to a character string consisting of zero or more character pairs; it
       shall be an error to set it to an odd number of characters.

   sshheellll,, sshh
       [Default from the environment variable _S_H_E_L_L]

       The value of this option shall be a string. The default shall be taken
       from the _S_H_E_L_L environment variable. If the _S_H_E_L_L environment variable
       is null or empty, the _s_h (see _s_h) utility shall be the default.

   sshhiiffttwwiiddtthh,, ssww
       [Default 8]

       The value of this option shall give the width in columns of an
       indentation level used during autoindentation and by the shift commands
       (<< and >>).

   sshhoowwmmaattcchh,, ssmm
       [Default _u_n_s_e_t]

       The functionality described for the sshhoowwmmaattcchh edit option need not be
       supported on block-mode terminals or terminals with insufficient
       capabilities.

       If sshhoowwmmaattcchh is set, in open or visual mode, when a ''))'' or ''}}'' is
       typed, if the matching ''(('' or ''{{'' is currently visible on the display,
       the matching ''(('' or ''{{'' shall be flagged moving the cursor to its
       location for an unspecified amount of time.

   sshhoowwmmooddee
       [Default _u_n_s_e_t]

       If sshhoowwmmooddee is set, in open or visual mode, the current mode that the
       editor is in shall be displayed on the last line of the display.
       Command mode and text input mode shall be differentiated; other
       unspecified modes and implementation-defined information may be
       displayed.

   sslloowwooppeenn
       [Default _u_n_s_e_t]

       If sslloowwooppeenn is set during open and visual text input modes, the editor
       shall not update portions of the display other than those display line
       columns that display the characters entered by the user (see _I_n_p_u_t _M_o_d_e
       _C_o_m_m_a_n_d_s _i_n _v_i).

   ttaabbssttoopp,, ttss
       [Default 8]

       The value of this edit option shall specify the column boundary used by
       a <tab> in the display (see _a_u_t_o_p_r_i_n_t, _a_p and _I_n_p_u_t _M_o_d_e _C_o_m_m_a_n_d_s _i_n
       _v_i).

   ttaagglleennggtthh,, ttll
       [Default zero]

       The value of this edit option shall specify the maximum number of
       characters that are considered significant in the user-specified tag
       name and in the tag name from the tags file. If the value is zero, all
       characters in both tag names shall be significant.

   ttaaggss
       [Default _s_e_e _t_e_x_t]

       The value of this edit option shall be a string of <blank>-delimited
       pathnames of files used by the ttaagg command. The default value is
       unspecified.

   tteerrmm
       [Default from the environment variable _T_E_R_M]

       The value of this edit option shall be a string. The default shall be
       taken from the _T_E_R_M variable in the environment. If the _T_E_R_M
       environment variable is empty or null, the default is unspecified. The
       editor shall use the value of this edit option to determine the type of
       the display device.

       The results are unspecified if the user changes the value of the term
       edit option after editor initialization.

   tteerrssee
       [Default _u_n_s_e_t]

       If tteerrssee is set, error messages may be less verbose. However, except
       for this caveat, error messages are unspecified. Furthermore, not all
       error messages need change for different settings of this option.

   wwaarrnn
       [Default _s_e_t]

       If wwaarrnn is set, and the contents of the edit buffer have been modified
       since they were last completely written, the editor shall write a
       warning message before certain !!  commands (see _E_s_c_a_p_e).

   wwiinnddooww
       [Default _s_e_e _t_e_x_t]

       A value used in open and visual mode, by the <control>‐B and
       <control>‐F commands, and, in visual mode, to specify the number of
       lines displayed when the screen is repainted.

       If the −−ww command-line option is not specified, the default value shall
       be set to the value of the _L_I_N_E_S environment variable. If the _L_I_N_E_S
       environment variable is empty or null, the default shall be the number
       of lines in the display minus 1.

       Setting the wwiinnddooww edit option to zero or to a value greater than the
       number of lines in the display minus 1 (either explicitly or based on
       the −−ww option or the _L_I_N_E_S environment variable) shall cause the wwiinnddooww
       edit option to be set to the number of lines in the display minus 1.

       The baud rate of the terminal line may change the default in an
       implementation-defined manner.

   wwrraappmmaarrggiinn,, wwmm
       [Default 0]

       If the value of this edit option is zero, it shall have no effect.

       If not in the POSIX locale, the effect of this edit option is
       implementation-defined.

       Otherwise, it shall specify a number of columns from the ending margin
       of the terminal.

       During open and visual text input modes, for each character for which
       any part of the character is displayed in a column that is less than
       wwrraappmmaarrggiinn columns from the ending margin of the display line, the
       editor shall behave as follows:

        1. If the character triggering this event is a <blank>, it, and all
           immediately preceding <blank> characters on the current line
           entered during the execution of the current text input command,
           shall be discarded, and the editor shall behave as if the user had
           entered a single <newline> instead. In addition, if the next user-
           entered character is a <space>, it shall be discarded as well.

        2. Otherwise, if there are one or more <blank> characters on the
           current line immediately preceding the last group of inserted
           non-<blank> characters which was entered during the execution of
           the current text input command, the <blank> characters shall be
           replaced as if the user had entered a single <newline> instead.

       If the aauuttooiinnddeenntt edit option is set, and the events described in 1. or
       2. are performed, any <blank> characters at or after the cursor in the
       current line shall be discarded.

       The ending margin shall be determined by the system or overridden by
       the user, as described for _C_O_L_U_M_N_S in the ENVIRONMENT VARIABLES section
       and the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s.

   wwrraappssccaann,, wwss
       [Default _s_e_t]

       If wwrraappssccaann is set, searches (the _e_x // or ??  addresses, or open and
       visual mode //, ??, NN, and nn commands) shall wrap around the beginning or
       end of the edit buffer; when unset, searches shall stop at the
       beginning or end of the edit buffer.

   wwrriitteeaannyy,, wwaa
       [Default _u_n_s_e_t]

       If wwrriitteeaannyy is set, some of the checks performed when executing the _e_x
       wwrriittee commands shall be inhibited, as described in editor option
       aauuttoowwrriittee.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       When any error is encountered and the standard input is not a terminal
       device file, _e_x shall not write the file or return to command or text
       input mode, and shall terminate with a non-zero exit status.

       Otherwise, when an unrecoverable error is encountered, it shall be
       equivalent to a SIGHUP asynchronous event.

       Otherwise, when an error is encountered, the editor shall behave as
       specified in _C_o_m_m_a_n_d _L_i_n_e _P_a_r_s_i_n_g _i_n _e_x.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       If a SIGSEGV signal is received while _e_x is saving a file, the file
       might not be successfully saved.

       The nneexxtt command can accept more than one file, so usage such as:


           nneexxtt ``llss [[aabbcc]]**``

       is valid; it would not be valid for the eeddiitt or rreeaadd commands, for
       example, because they expect only one file and unspecified results
       occur.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The _e_x/_v_i specification is based on the historical practice found in
       the 4 BSD and System V implementations of _e_x and _v_i.

       A _r_e_s_t_r_i_c_t_e_d _e_d_i_t_o_r (both the historical _r_e_d utility and modifications
       to _e_x) were considered and rejected for inclusion. Neither option
       provided the level of security that users might expect.

       It is recognized that _e_x visual mode and related features would be
       difficult, if not impossible, to implement satisfactorily on a block-
       mode terminal, or a terminal without any form of cursor addressing;
       thus, it is not a mandatory requirement that such features should work
       on all terminals. It is the intention, however, that an _e_x
       implementation should provide the full set of capabilities on all
       terminals capable of supporting them.

   OOppttiioonnss
       The −−cc replacement for ++_c_o_m_m_a_n_d was inspired by the −−ee option of _s_e_d.
       Historically, all such commands (see eeddiitt and nneexxtt as well) were
       executed from the last line of the edit buffer. This meant, for
       example, that ""++//ppaatttteerrnn"" would fail unless the wwrraappssccaann option was
       set. POSIX.1‐2008 requires conformance to historical practice. The
       ++_c_o_m_m_a_n_d option is no longer specified by POSIX.1‐2008 but may be
       present in some implementations. Historically, some implementations
       restricted the _e_x commands that could be listed as part of the command
       line arguments.  For consistency, POSIX.1‐2008 does not permit these
       restrictions.

       In historical implementations of the editor, the −−RR option (and the
       rreeaaddoonnllyy edit option) only prevented overwriting of files; appending to
       files was still permitted, mapping loosely into the _c_s_h nnoocclloobbbbeerr
       variable. Some implementations, however, have not followed this
       semantic, and rreeaaddoonnllyy does not permit appending either. POSIX.1‐2008
       follows the latter practice, believing that it is a more obvious and
       intuitive meaning of rreeaaddoonnllyy.

       The −−ss option suppresses all interactive user feedback and is useful
       for editing scripts in batch jobs. The list of specific effects is
       historical practice. The terminal type ``incapable of supporting open
       and visual modes'' has historically been named ``dumb''.

       The −−tt option was required because the _c_t_a_g_s utility appears in
       POSIX.1‐2008 and the option is available in all historical
       implementations of _e_x.

       Historically, the _e_x and _v_i utilities accepted a −−xx option, which did
       encryption based on the algorithm found in the historical _c_r_y_p_t
       utility. The −−xx option for encryption, and the associated _c_r_y_p_t
       utility, were omitted because the algorithm used was not specifiable
       and the export control laws of some nations make it difficult to export
       cryptographic technology. In addition, it did not historically provide
       the level of security that users might expect.

   SSttaannddaarrdd IInnppuutt
       An end-of-file condition is not equivalent to an end-of-file character.
       A common end-of-file character, <control>‐D, is historically an _e_x
       command.

       There was no maximum line length in historical implementations of _e_x.
       Specifically, as it was parsed in chunks, the addresses had a different
       maximum length than the filenames. Further, the maximum line buffer
       size was declared as BUFSIZ, which was different lengths on different
       systems. This version selected the value of {LINE_MAX} to impose a
       reasonable restriction on portable usage of _e_x and to aid test suite
       writers in their development of realistic tests that exercise this
       limit.

   IInnppuutt FFiilleess
       It was an explicit decision by the standard developers that a <newline>
       be added to any file lacking one. It was believed that this feature of
       _e_x and _v_i was relied on by users in order to make text files lacking a
       trailing <newline> more portable. It is recognized that this will
       require a user-specified option or extension for implementations that
       permit _e_x and _v_i to edit files of type other than text if such files
       are not otherwise identified by the system. It was agreed that the
       ability to edit files of arbitrary type can be useful, but it was not
       considered necessary to mandate that an _e_x or _v_i implementation be
       required to handle files other than text files.

       The paragraph in the INPUT FILES section, ``By default, ...'', is
       intended to close a long-standing security problem in _e_x and _v_i; that
       of the ``modeline'' or ``modelines'' edit option. This feature allows
       any line in the first or last five lines of the file containing the
       strings ""eexx::"" or ""vvii::"" (and, apparently, ""eeii::"" or ""vvxx::"") to be a line
       containing editor commands, and _e_x interprets all the text up to the
       next ''::'' or <newline> as a command. Consider the consequences, for
       example, of an unsuspecting user using _e_x or _v_i as the editor when
       replying to a mail message in which a line such as:


           eexx::!! rrmm −−rrff ::

       appeared in the signature lines. The standard developers believed
       strongly that an editor should not by default interpret any lines of a
       file. Vendors are strongly urged to delete this feature from their
       implementations of _e_x and _v_i.

   AAssyynncchhrroonnoouuss EEvveennttss
       The intention of the phrase ``complete write'' is that the entire edit
       buffer be written to stable storage. The note regarding temporary files
       is intended for implementations that use temporary files to back edit
       buffers unnamed by the user.

       Historically, SIGQUIT was ignored by _e_x, but was the equivalent of the
       QQ command in visual mode; that is, it exited visual mode and entered _e_x
       mode. POSIX.1‐2008 permits, but does not require, this behavior.
       Historically, SIGINT was often used by _v_i users to terminate text input
       mode (<control>‐C is often easier to enter than <ESC>).  Some
       implementations of _v_i alerted the terminal on this event, and some did
       not. POSIX.1‐2008 requires that SIGINT behave identically to <ESC>, and
       that the terminal not be alerted.

       Historically, suspending the _e_x editor during text input mode was
       similar to SIGINT, as completed lines were retained, but any partial
       line discarded, and the editor returned to command mode. POSIX.1‐2008
       is silent on this issue; implementations are encouraged to follow
       historical practice, where possible.

       Historically, the _v_i editor did not treat SIGTSTP as an asynchronous
       event, and it was therefore impossible to suspend the editor in visual
       text input mode.  There are two major reasons for this. The first is
       that SIGTSTP is a broadcast signal on UNIX systems, and the chain of
       events where the shell _e_x_e_cs an application that then _e_x_e_cs _v_i usually
       caused confusion for the terminal state if SIGTSTP was delivered to the
       process group in the default manner. The second was that most
       implementations of the UNIX _c_u_r_s_e_s package did not handle SIGTSTP
       safely, and the receipt of SIGTSTP at the wrong time would cause them
       to crash. POSIX.1‐2008 is silent on this issue; implementations are
       encouraged to treat suspension as an asynchronous event if possible.

       Historically, modifications to the edit buffer made before SIGINT
       interrupted an operation were retained; that is, anywhere from zero to
       all of the lines to be modified might have been modified by the time
       the SIGINT arrived. These changes were not discarded by the arrival of
       SIGINT. POSIX.1‐2008 permits this behavior, noting that the uunnddoo
       command is required to be able to undo these partially completed
       commands.

       The action taken for signals other than SIGINT, SIGCONT, SIGHUP, and
       SIGTERM is unspecified because some implementations attempt to save the
       edit buffer in a useful state when other signals are received.

   SSttaannddaarrdd EErrrroorr
       For _e_x/_v_i, diagnostic messages are those messages reported as a result
       of a failed attempt to invoke _e_x or _v_i, such as invalid options or
       insufficient resources, or an abnormal termination condition.
       Diagnostic messages should not be confused with the error messages
       generated by inappropriate or illegal user commands.

   IInniittiiaalliizzaattiioonn iinn eexx aanndd vvii
       If an _e_x command (other than ccdd, cchhddiirr, or ssoouurrccee) has a filename
       argument, one or both of the alternate and current pathnames will be
       set. Informally, they are set as follows:

        1. If the _e_x command is one that replaces the contents of the edit
           buffer, and it succeeds, the current pathname will be set to the
           filename argument (the first filename argument in the case of the
           nneexxtt command) and the alternate pathname will be set to the
           previous current pathname, if there was one.

        2. In the case of the file read/write forms of the rreeaadd and wwrriittee
           commands, if there is no current pathname, the current pathname
           will be set to the filename argument.

        3. Otherwise, the alternate pathname will be set to the filename
           argument.

       For example, ::eeddiitt ffoooo and ::rreeccoovveerr ffoooo, when successful, set the
       current pathname, and, if there was a previous current pathname, the
       alternate pathname. The commands ::wwrriittee, !!ccoommmmaanndd, and ::eeddiitt set
       neither the current or alternate pathnames. If the ::eeddiitt ffoooo command
       were to fail for some reason, the alternate pathname would be set. The
       rreeaadd and wwrriittee commands set the alternate pathname to their _f_i_l_e
       argument, unless the current pathname is not set, in which case they
       set the current pathname to their _f_i_l_e arguments. The alternate
       pathname was not historically set by the ::ssoouurrccee command. POSIX.1‐2008
       requires conformance to historical practice.  Implementations adding
       commands that take filenames as arguments are encouraged to set the
       alternate pathname as described here.

       Historically, _e_x and _v_i read the ..eexxrrcc file in the _$_H_O_M_E directory
       twice, if the editor was executed in the _$_H_O_M_E directory. POSIX.1‐2008
       prohibits this behavior.

       Historically, the 4 BSD _e_x and _v_i read the _$_H_O_M_E and local ..eexxrrcc files
       if they were owned by the real ID of the user, or the ssoouurrcceeaannyy option
       was set, regardless of other considerations. This was a security
       problem because it is possible to put normal UNIX system commands
       inside a ..eexxrrcc file. POSIX.1‐2008 does not specify the ssoouurrcceeaannyy
       option, and historical implementations are encouraged to delete it.

       The ..eexxrrcc files must be owned by the real ID of the user, and not
       writable by anyone other than the owner. The appropriate privileges
       exception is intended to permit users to acquire special privileges,
       but continue to use the ..eexxrrcc files in their home directories.

       System V Release 3.2 and later _v_i implementations added the option
       [[nnoo]]eexxrrcc.  The behavior is that local ..eexxrrcc files are read-only if the
       eexxrrcc option is set. The default for the eexxrrcc option was off, so by
       default, local ..eexxrrcc files were not read. The problem this was intended
       to solve was that System V permitted users to give away files, so there
       is no possible ownership or writeability test to ensure that the file
       is safe. This is still a security problem on systems where users can
       give away files, but there is nothing additional that POSIX.1‐2008 can
       do. The implementation-defined exception is intended to permit groups
       to have local ..eexxrrcc files that are shared by users, by creating pseudo-
       users to own the shared files.

       POSIX.1‐2008 does not mention system-wide _e_x and _v_i start-up files.
       While they exist in several implementations of _e_x and _v_i, they are not
       present in any implementations considered historical practice by
       POSIX.1‐2008. Implementations that have such files should use them only
       if they are owned by the real user ID or an appropriate user (for
       example, root on UNIX systems) and if they are not writable by any user
       other than their owner. System-wide start-up files should be read
       before the _E_X_I_N_I_T variable, $$HHOOMMEE//..eexxrrcc, or local ..eexxrrcc files are
       evaluated.

       Historically, any _e_x command could be entered in the _E_X_I_N_I_T variable or
       the ..eexxrrcc file, although ones requiring that the edit buffer already
       contain lines of text generally caused historical implementations of
       the editor to drop ccoorree.  POSIX.1‐2008 requires that any _e_x command be
       permitted in the _E_X_I_N_I_T variable and ..eexxrrcc files, for simplicity of
       specification and consistency, although many of them will obviously
       fail under many circumstances.

       The initialization of the contents of the edit buffer uses the phrase
       ``the effect shall be'' with regard to various _e_x commands. The intent
       of this phrase is that edit buffer contents loaded during the
       initialization phase not be lost; that is, loading the edit buffer
       should fail if the ..eexxrrcc file read in the contents of a file and did
       not subsequently write the edit buffer. An additional intent of this
       phrase is to specify that the initial current line and column is set as
       specified for the individual _e_x commands.

       Historically, the −−tt option behaved as if the tag search were a
       ++_c_o_m_m_a_n_d; that is, it was executed from the last line of the file
       specified by the tag. This resulted in the search failing if the
       pattern was a forward search pattern and the wwrraappssccaann edit option was
       not set. POSIX.1‐2008 does not permit this behavior, requiring that the
       search for the tag pattern be performed on the entire file, and, if not
       found, that the current line be set to a more reasonable location in
       the file.

       Historically, the empty edit buffer presented for editing when a file
       was not specified by the user was unnamed. This is permitted by
       POSIX.1‐2008; however, implementations are encouraged to provide users
       a temporary filename for this buffer because it permits them the use of
       _e_x commands that use the current pathname during temporary edit
       sessions.

       Historically, the file specified using the −−tt option was not part of
       the current argument list. This practice is permitted by POSIX.1‐2008;
       however, implementations are encouraged to include its name in the
       current argument list for consistency.

       Historically, the −−cc command was generally not executed until a file
       that already exists was edited. POSIX.1‐2008 requires conformance to
       this historical practice.  Commands that could cause the −−cc command to
       be executed include the _e_x commands eeddiitt, nneexxtt, rreeccoovveerr, rreewwiinndd, and
       ttaagg, and the _v_i commands <control>‐^ and <control>‐].  Historically,
       reading a file into an edit buffer did not cause the −−cc command to be
       executed (even though it might set the current pathname) with the
       exception that it did cause the −−cc command to be executed if: the
       editor was in _e_x mode, the edit buffer had no current pathname, the
       edit buffer was empty, and no read commands had yet been attempted. For
       consistency and simplicity of specification, POSIX.1‐2008 does not
       permit this behavior.

       Historically, the −−rr option was the same as a normal edit session if
       there was no recovery information available for the file. This allowed
       users to enter:


           vvii −−rr **..cc

       and recover whatever files were recoverable. In some implementations,
       recovery was attempted only on the first file named, and the file was
       not entered into the argument list; in others, recovery was attempted
       for each file named. In addition, some historical implementations
       ignored −−rr if −−tt was specified or did not support command line _f_i_l_e
       arguments with the −−tt option. For consistency and simplicity of
       specification, POSIX.1‐2008 disallows these special cases, and requires
       that recovery be attempted the first time each file is edited.

       Historically, _v_i initialized the `` and '' marks, but _e_x did not. This
       meant that if the first command in _e_x mode was vviissuuaall or if an _e_x
       command was executed first (for example, _v_i +10 _f_i_l_e), _v_i was entered
       without the marks being initialized. Because the standard developers
       believed the marks to be generally useful, and for consistency and
       simplicity of specification, POSIX.1‐2008 requires that they always be
       initialized if in open or visual mode, or if in _e_x mode and the edit
       buffer is not empty. Not initializing it in _e_x mode if the edit buffer
       is empty is historical practice; however, it has always been possible
       to set (and use) marks in empty edit buffers in open and visual mode
       edit sessions.

   AAddddrreessssiinngg
       Historically, _e_x and _v_i accepted the additional addressing forms ''\\//''
       and ''\\??''.  They were equivalent to ""////"" and ""????"", respectively. They
       are not required by POSIX.1‐2008, mostly because nobody can remember
       whether they ever did anything different historically.

       Historically, _e_x and _v_i permitted an address of zero for several
       commands, and permitted the %% address in empty files for others. For
       consistency, POSIX.1‐2008 requires support for the former in the few
       commands where it makes sense, and disallows it otherwise. In addition,
       because POSIX.1‐2008 requires that %% be logically equivalent to ""11,,$$"",
       it is also supported where it makes sense and disallowed otherwise.

       Historically, the %% address could not be followed by further addresses.
       For consistency and simplicity of specification, POSIX.1‐2008 requires
       that additional addresses be supported.

       All of the following are valid _a_d_d_r_e_s_s_e_s:

       +++       Three lines after the current line.

       /_r_e/−     One line before the next occurrence of _r_e.

       −2        Two lines before the current line.

       3 −−−− 2  Line one (note intermediate negative address).

       1 2 3     Line six.

       Any number of addresses can be provided to commands taking addresses;
       for example, ""11,,22,,33,,44,,55pp"" prints lines 4 and 5, because two is the
       greatest valid number of addresses accepted by the pprriinntt command. This,
       in combination with the <semicolon> delimiter, permits users to create
       commands based on ordered patterns in the file. For example, the
       command 33;;//ffoooo//;;++22pprriinntt will display the first line after line 3 that
       contains the pattern _f_o_o, plus the next two lines. Note that the
       address 33;; must be evaluated before being discarded because the search
       origin for the //ffoooo// command depends on this.

       Historically, values could be added to addresses by including them
       after one or more <blank> characters; for example, 33  −−  55pp wrote the
       seventh line of the file, and //ffoooo//  55 was the same as //ffoooo//++55.
       However, only absolute values could be added; for example, 55  //ffoooo// was
       an error. POSIX.1‐2008 requires conformance to historical practice.
       Address offsets are separately specified from addresses because they
       could historically be provided to visual mode search commands.

       Historically, any missing addresses defaulted to the current line. This
       was true for leading and trailing <comma>-delimited addresses, and for
       trailing <semicolon>-delimited addresses. For consistency, POSIX.1‐2008
       requires it for leading <semicolon> addresses as well.

       Historically, _e_x and _v_i accepted the ''^^'' character as both an address
       and as a flag offset for commands. In both cases it was identical to
       the ''−−'' character. POSIX.1‐2008 does not require or prohibit this
       behavior.

       Historically, the enhancements to basic regular expressions could be
       used in addressing; for example, ''~~'', ''\\<<'', and ''\\>>''.  POSIX.1‐2008
       requires conformance to historical practice; that is, that regular
       expression usage be consistent, and that regular expression
       enhancements be supported wherever regular expressions are used.

   CCoommmmaanndd LLiinnee PPaarrssiinngg iinn eexx
       Historical _e_x command parsing was even more complex than that described
       here. POSIX.1‐2008 requires the subset of the command parsing that the
       standard developers believed was documented and that users could
       reasonably be expected to use in a portable fashion, and that was
       historically consistent between implementations. (The discarded
       functionality is obscure, at best.)  Historical implementations will
       require changes in order to comply with POSIX.1‐2008; however, users
       are not expected to notice any of these changes.  Most of the
       complexity in _e_x parsing is to handle three special termination cases:

        1. The !!, gglloobbaall, vv, and the filter versions of the rreeaadd and wwrriittee
           commands are delimited by <newline> characters (they can contain
           <vertical-line> characters that are usually shell pipes).

        2. The eexx, eeddiitt, nneexxtt, and vviissuuaall in open and visual mode commands all
           take _e_x commands, optionally containing <vertical-line> characters,
           as their first arguments.

        3. The ss command takes a regular expression as its first argument, and
           uses the delimiting characters to delimit the command.

       Historically, <vertical-line> characters in the ++_c_o_m_m_a_n_d argument of
       the eexx, eeddiitt, nneexxtt, vvii, and vviissuuaall commands, and in the _p_a_t_t_e_r_n and
       _r_e_p_l_a_c_e_m_e_n_t parts of the ss command, did not delimit the command, and in
       the filter cases for rreeaadd and wwrriittee, and the !!, gglloobbaall, and vv commands,
       they did not delimit the command at all. For example, the following
       commands are all valid:


           ::edit +25 | s/abc/ABC/ file.c
           ::s/ | /PIPE/
           ::read !spell % | columnate
           ::global/pattern/p | l
           ::s/a/b/ | s/c/d | set

       Historically, empty or <blank> filled lines in ..eexxrrcc files and ssoouurrcceed
       files (as well as _E_X_I_N_I_T variables and _e_x command scripts) were treated
       as default commands; that is, pprriinntt commands. POSIX.1‐2008 specifically
       requires that they be ignored when encountered in ..eexxrrcc and ssoouurrcceed
       files to eliminate a common source of new user error.

       Historically, _e_x commands with multiple adjacent (or <blank>-separated)
       vertical lines were handled oddly when executed from _e_x mode. For
       example, the command |||||| <carriage-return>, when the cursor was on line
       1, displayed lines 2, 3, and 5 of the file.  In addition, the command ||
       would only display the line after the next line, instead of the next
       two lines. The former worked more logically when executed from _v_i mode,
       and displayed lines 2, 3, and 4. POSIX.1‐2008 requires the _v_i behavior;
       that is, a single default command and line number increment for each
       command separator, and trailing <newline> characters after <vertical-
       line> separators are discarded.

       Historically, _e_x permitted a single extra <colon> as a leading command
       character; for example, ::gg//ppaatttteerrnn//::pp was a valid command. POSIX.1‐2008
       generalizes this to require that any number of leading <colon>
       characters be stripped.

       Historically, any prefix of the ddeelleettee command could be followed
       without intervening <blank> characters by a flag character because in
       the command dd  pp, _p is interpreted as the buffer _p.  POSIX.1‐2008
       requires conformance to historical practice.

       Historically, the kk command could be followed by the mark name without
       intervening <blank> characters. POSIX.1‐2008 requires conformance to
       historical practice.

       Historically, the ss command could be immediately followed by flag and
       option characters; for example, ss//ee//EE//||ss||ssggcc33pp was a valid command.
       However, flag characters could not stand alone; for example, the
       commands sspp and ss  ll would fail, while the command ssggpp and ss  ggll would
       succeed. (Obviously, the ''##'' flag character was used as a delimiter
       character if it followed the command.) Another issue was that option
       characters had to precede flag characters even when the command was
       fully specified; for example, the command ss//ee//EE//ppgg would fail, while
       the command ss//ee//EE//ggpp would succeed. POSIX.1‐2008 requires conformance
       to historical practice.

       Historically, the first command name that had a prefix matching the
       input from the user was the executed command; for example, vvee, vveerr, and
       vveerrss all executed the vveerrssiioonn command. Commands were in a specific
       order, however, so that aa matched aappppeenndd, not aabbbbrreevviiaattee.  POSIX.1‐2008
       requires conformance to historical practice. The restriction on command
       search order for implementations with extensions is to avoid the
       addition of commands such that the historical prefixes would fail to
       work portably.

       Historical implementations of _e_x and _v_i did not correctly handle
       multiple _e_x commands, separated by <vertical-line> characters, that
       entered or exited visual mode or the editor. Because implementations of
       _v_i exist that do not exhibit this failure mode, POSIX.1‐2008 does not
       permit it.

       The requirement that alphabetic command names consist of all following
       alphabetic characters up to the next non-alphabetic character means
       that alphabetic command names must be separated from their arguments by
       one or more non-alphabetic characters, normally a <blank> or ''!!''
       character, except as specified for the exceptions, the ddeelleettee, kk, and ss
       commands.

       Historically, the repeated execution of the _e_x default pprriinntt commands
       (<control>‐D, _e_o_f, <newline>, <carriage-return>) erased any prompting
       character and displayed the next lines without scrolling the terminal;
       that is, immediately below any previously displayed lines. This
       provided a cleaner presentation of the lines in the file for the user.
       POSIX.1‐2008 does not require this behavior because it may be
       impossible in some situations; however, implementations are strongly
       encouraged to provide this semantic if possible.

       Historically, it was possible to change files in the middle of a
       command, and have the rest of the command executed in the new file; for
       example:


           ::eeddiitt ++2255 ffiillee..cc || ss//aabbcc//AABBCC// || 11

       was a valid command, and the substitution was attempted in the newly
       edited file. POSIX.1‐2008 requires conformance to historical practice.
       The following commands are examples that exercise the _e_x parser:


           eecchhoo ''ffoooo || bbaarr'' >> ffiillee11;; eecchhoo ''ffoooo//bbaarr'' >> ffiillee22;;
           vvii
           ::eeddiitt ++11 || ss//||//PPIIPPEE// || ww ffiillee11 || ee ffiillee22 || 11 || ss//\\////SSLLAASSHH// || wwqq

       Historically, there was no protection in editor implementations to
       avoid _e_x gglloobbaall, vv, @@, or ** commands changing edit buffers during
       execution of their associated commands. Because this would almost
       invariably result in catastrophic failure of the editor, and
       implementations exist that do exhibit these problems, POSIX.1‐2008
       requires that changing the edit buffer during a gglloobbaall or vv command, or
       during a @@ or ** command for which there will be more than a single
       execution, be an error. Implementations supporting multiple edit
       buffers simultaneously are strongly encouraged to apply the same
       semantics to switching between buffers as well.

       The _e_x command quoting required by POSIX.1‐2008 is a superset of the
       quoting in historical implementations of the editor. For example, it
       was not historically possible to escape a <blank> in a filename; for
       example, ::eeddiitt  ffoooo\\\\\\  bbaarr would report that too many filenames had been
       entered for the edit command, and there was no method of escaping a
       <blank> in the first argument of an eeddiitt, eexx, nneexxtt, or vviissuuaall command
       at all. POSIX.1‐2008 extends historical practice, requiring that
       quoting behavior be made consistent across all _e_x commands, except for
       the mmaapp, uunnmmaapp, aabbbbrreevviiaattee, and uunnaabbbbrreevviiaattee commands, which
       historically used <control>‐V instead of <backslash> characters for
       quoting. For those four commands, POSIX.1‐2008 requires conformance to
       historical practice.

       Backslash quoting in _e_x is non-intuitive.  <backslash>-escapes are
       ignored unless they escape a special character; for example, when
       performing _f_i_l_e argument expansion, the string ""\\\\%%"" is equivalent to
       ''\\%%'', not "\<_c_u_r_r_e_n_t_ _p_a_t_h_n_a_m_e>".  This can be confusing for users
       because <backslash> is usually one of the characters that causes shell
       expansion to be performed, and therefore shell quoting rules must be
       taken into consideration. Generally, quoting characters are only
       considered if they escape a special character, and a quoting character
       must be provided for each layer of parsing for which the character is
       special. As another example, only a single <backslash> is necessary for
       the ''\\ll'' sequence in substitute replacement patterns, because the
       character ''ll'' is not special to any parsing layer above it.

       <control>‐V quoting in _e_x is slightly different from backslash quoting.
       In the four commands where <control>‐V quoting applies (aabbbbrreevviiaattee,
       uunnaabbbbrreevviiaattee, mmaapp, and uunnmmaapp), any character may be escaped by a
       <control>‐V whether it would have a special meaning or not.
       POSIX.1‐2008 requires conformance to historical practice.

       Historical implementations of the editor did not require delimiters
       within character classes to be escaped; for example, the command
       ::ss//[[//]]//// on the string ""xxxxxx//yyyyyy"" would delete the ''//'' from the string.
       POSIX.1‐2008 disallows this historical practice for consistency and
       because it places a large burden on implementations by requiring that
       knowledge of regular expressions be built into the editor parser.

       Historically, quoting <newline> characters in _e_x commands was handled
       inconsistently. In most cases, the <newline> character always
       terminated the command, regardless of any preceding escape character,
       because <backslash> characters did not escape <newline> characters for
       most _e_x commands. However, some _e_x commands (for example, ss, mmaapp, and
       aabbbbrreevviiaattiioonn) permitted <newline> characters to be escaped (although in
       the case of mmaapp and aabbbbrreevviiaattiioonn, <control>‐V characters escaped them
       instead of <backslash> characters). This was true in not only the
       command line, but also ..eexxrrcc and ssoouurrcceed files. For example, the
       command:


           mmaapp == ffoooo<<ccoonnttrrooll--VV>><<nneewwlliinnee>>bbaarr

       would succeed, although it was sometimes difficult to get the
       <control>‐V and the inserted <newline> passed to the _e_x parser. For
       consistency and simplicity of specification, POSIX.1‐2008 requires that
       it be possible to escape <newline> characters in _e_x commands at all
       times, using <backslash> characters for most _e_x commands, and using
       <control>‐V characters for the mmaapp and aabbbbrreevviiaattiioonn commands. For
       example, the command pprriinntt<newline>lliisstt is required to be parsed as the
       single command pprriinntt<newline>lliisstt.  While this differs from historical
       practice, POSIX.1‐2008 developers believed it unlikely that any script
       or user depended on the historical behavior.

       Historically, an error in a command specified using the −−cc option did
       not cause the rest of the −−cc commands to be discarded. POSIX.1‐2008
       disallows this for consistency with mapped keys, the @@, gglloobbaall, ssoouurrccee,
       and vv commands, the _E_X_I_N_I_T environment variable, and the ..eexxrrcc files.

   IInnppuutt EEddiittiinngg iinn eexx
       One of the common uses of the historical _e_x editor is over slow network
       connections. Editors that run in canonical mode can require far less
       traffic to and from, and far less processing on, the host machine, as
       well as more easily supporting block-mode terminals. For these reasons,
       POSIX.1‐2008 requires that _e_x be implemented using canonical mode input
       processing, as was done historically.

       POSIX.1‐2008 does not require the historical 4 BSD input editing
       characters ``word erase'' or ``literal next''. For this reason, it is
       unspecified how they are handled by _e_x, although they must have the
       required effect. Implementations that resolve them after the line has
       been ended using a <newline> or <control>‐M character, and
       implementations that rely on the underlying system terminal support for
       this processing, are both conforming.  Implementations are strongly
       urged to use the underlying system functionality, if at all possible,
       for compatibility with other system text input interfaces.

       Historically, when the _e_o_f character was used to decrement the
       aauuttooiinnddeenntt level, the cursor moved to display the new end of the
       aauuttooiinnddeenntt characters, but did not move the cursor to a new line, nor
       did it erase the <control>‐D character from the line. POSIX.1‐2008 does
       not specify that the cursor remain on the same line or that the rest of
       the line is erased; however, implementations are strongly encouraged to
       provide the best possible user interface; that is, the cursor should
       remain on the same line, and any <control>‐D character on the line
       should be erased.

       POSIX.1‐2008 does not require the historical 4 BSD input editing
       character ``reprint'', traditionally <control>‐R, which redisplayed the
       current input from the user. For this reason, and because the
       functionality cannot be implemented after the line has been terminated
       by the user, POSIX.1‐2008 makes no requirements about this
       functionality. Implementations are strongly urged to make this
       historical functionality available, if possible.

       Historically, <control>‐Q did not perform a literal next function in
       _e_x, as it did in _v_i.  POSIX.1‐2008 requires conformance to historical
       practice to avoid breaking historical _e_x scripts and ..eexxrrcc files.

   eeooff
       Whether the _e_o_f character immediately modifies the aauuttooiinnddeenntt
       characters in the prompt is left unspecified so that implementations
       can conform in the presence of systems that do not support this
       functionality. Implementations are encouraged to modify the line and
       redisplay it immediately, if possible.

       The specification of the handling of the _e_o_f character differs from
       historical practice only in that _e_o_f characters are not discarded if
       they follow normal characters in the text input. Historically, they
       were always discarded.

   CCoommmmaanndd DDeessccrriippttiioonnss iinn eexx
       Historically, several commands (for example, gglloobbaall, vv, vviissuuaall, ss,
       wwrriittee, wwqq, yyaannkk, !!, <<, >>, &&, and ~~) were executable in empty files
       (that is, the default address(es) were 0), or permitted explicit
       addresses of 0 (for example, 0 was a valid address, or 0,0 was a valid
       range). Addresses of 0, or command execution in an empty file, make
       sense only for commands that add new text to the edit buffer or write
       commands (because users may wish to write empty files). POSIX.1‐2008
       requires this behavior for such commands and disallows it otherwise,
       for consistency and simplicity of specification.

       A count to an _e_x command has been historically corrected to be no
       greater than the last line in a file; for example, in a five-line file,
       the command 11,,66pprriinntt would fail, but the command 11pprriinntt330000 would
       succeed. POSIX.1‐2008 requires conformance to historical practice.

       Historically, the use of flags in _e_x commands could be obscure. General
       historical practice was as described by POSIX.1‐2008, but there were
       some special cases. For instance, the lliisstt, nnuummbbeerr, and pprriinntt commands
       ignored trailing address offsets; for example, 33pp  ++++++## would display
       line 3, and 3 would be the current line after the execution of the
       command. The ooppeenn and vviissuuaall commands ignored both the trailing offsets
       and the trailing flags.  Also, flags specified to the ooppeenn and vviissuuaall
       commands interacted badly with the lliisstt edit option, and setting and
       then unsetting it during the open/visual session would cause _v_i to stop
       displaying lines in the specified format. For consistency and
       simplicity of specification, POSIX.1‐2008 does not permit any of these
       exceptions to the general rule.

       POSIX.1‐2008 uses the word _c_o_p_y in several places when discussing
       buffers. This is not intended to imply implementation.

       Historically, _e_x users could not specify numeric buffers because of the
       ambiguity this would cause; for example, in the command 33  ddeelleettee  22, it
       is unclear whether 2 is a buffer name or a _c_o_u_n_t.  POSIX.1‐2008
       requires conformance to historical practice by default, but does not
       preclude extensions.

       Historically, the contents of the unnamed buffer were frequently
       discarded after commands that did not explicitly affect it; for
       example, when using the eeddiitt command to switch files. For consistency
       and simplicity of specification, POSIX.1‐2008 does not permit this
       behavior.

       The _e_x utility did not historically have access to the numeric buffers,
       and, furthermore, deleting lines in _e_x did not modify their contents.
       For example, if, after doing a delete in _v_i, the user switched to _e_x,
       did another delete, and then switched back to _v_i, the contents of the
       numeric buffers would not have changed. POSIX.1‐2008 requires
       conformance to historical practice. Numeric buffers are described in
       the _e_x utility in order to confine the description of buffers to a
       single location in POSIX.1‐2008.

       The metacharacters that trigger shell expansion in _f_i_l_e arguments match
       historical practice, as does the method for doing shell expansion.
       Implementations wishing to provide users with the flexibility to alter
       the set of metacharacters are encouraged to provide a sshheellllmmeettaa string
       edit option.

       Historically, _e_x commands executed from _v_i refreshed the screen when it
       did not strictly need to do so; for example, ::!!ddaattee  >>  //ddeevv//nnuullll does
       not require a screen refresh because the output of the UNIX _d_a_t_e
       command requires only a single line of the screen. POSIX.1‐2008
       requires that the screen be refreshed if it has been overwritten, but
       makes no requirements as to how an implementation should make that
       determination. Implementations may prompt and refresh the screen
       regardless.

   AAbbbbrreevviiaattee
       Historical practice was that characters that were entered as part of an
       abbreviation replacement were subject to mmaapp expansions, the sshhoowwmmaattcchh
       edit option, further abbreviation expansions, and so on; that is, they
       were logically pushed onto the terminal input queue, and were not a
       simple replacement. POSIX.1‐2008 requires conformance to historical
       practice.  Historical practice was that whenever a non-word character
       (that had not been escaped by a <control>‐V) was entered after a word
       character, _v_i would check for abbreviations. The check was based on the
       type of the character entered before the word character of the
       word/non-word pair that triggered the check. The word character of the
       word/non-word pair that triggered the check and all characters entered
       before the trigger pair that were of that type were included in the
       check, with the exception of <blank> characters, which always delimited
       the abbreviation.

       This means that, for the abbreviation to work, the _l_h_s must end with a
       word character, there can be no transitions from word to non-word
       characters (or _v_i_c_e _v_e_r_s_a) other than between the last and next-to-last
       characters in the _l_h_s, and there can be no <blank> characters in the
       _l_h_s.  In addition, because of the historical quoting rules, it was
       impossible to enter a literal <control>‐V in the _l_h_s.  POSIX.1‐2008
       requires conformance to historical practice. Historical implementations
       did not inform users when abbreviations that could never be used were
       entered; implementations are strongly encouraged to do so.

       For example, the following abbreviations will work:


           ::aabb ((pp  RREEPPLLAACCEE
           ::aabb pp   RREEPPLLAACCEE
           ::aabb ((((pp RREEPPLLAACCEE

       The following abbreviations will not work:


           ::aabb ((   RREEPPLLAACCEE
           ::aabb ((pppp RREEPPLLAACCEE

       Historical practice is that words on the _v_i colon command line were
       subject to abbreviation expansion, including the arguments to the
       aabbbbrreevv (and more interestingly) the uunnaabbbbrreevv command. Because there are
       implementations that do not do abbreviation expansion for the first
       argument to those commands, this is permitted, but not required, by
       POSIX.1‐2008. However, the following sequence:


           ::aabb ffoooo bbaarr
           ::aabb ffoooo bbaazz

       resulted in the addition of an abbreviation of ""bbaazz"" for the string
       ""bbaarr"" in historical _e_x/_v_i, and the sequence:


           ::aabb ffoooo11 bbaarr
           ::aabb ffoooo22 bbaarr
           ::uunnaabbbbrreevviiaattee ffoooo22

       deleted the abbreviation ""ffoooo11"", not ""ffoooo22"".  These behaviors are not
       permitted by POSIX.1‐2008 because they clearly violate the expectations
       of the user.

       It was historical practice that <control>‐V, not <backslash>,
       characters be interpreted as escaping subsequent characters in the
       aabbbbrreevviiaattee command. POSIX.1‐2008 requires conformance to historical
       practice; however, it should be noted that an abbreviation containing a
       <blank> will never work.

   AAppppeenndd
       Historically, any text following a <vertical-line> command separator
       after an aappppeenndd, cchhaannggee, or iinnsseerrtt command became part of the insert
       text. For example, in the command:


           ::gg//ppaatttteerrnn//aappppeenndd||ssttuuffff11

       a line containing the text ""ssttuuffff11"" would be appended to each line
       matching pattern. It was also historically valid to enter:


           ::aappppeenndd||ssttuuffff11
           ssttuuffff22
           ..

       and the text on the _e_x command line would be appended along with the
       text inserted after it.  There was an historical bug, however, that the
       user had to enter two terminating lines (the ''..'' lines) to terminate
       text input mode in this case. POSIX.1‐2008 requires conformance to
       historical practice, but disallows the historical need for multiple
       terminating lines.

   CChhaannggee
       See the RATIONALE for the aappppeenndd command. Historical practice for
       cursor positioning after the change command when no text is input, is
       as described in POSIX.1‐2008. However, one System V implementation is
       known to have been modified such that the cursor is positioned on the
       first address specified, and not on the line before the first address.
       POSIX.1‐2008 disallows this modification for consistency.

       Historically, the cchhaannggee command did not support buffer arguments,
       although some implementations allow the specification of an optional
       buffer. This behavior is neither required nor disallowed by
       POSIX.1‐2008.

   CChhaannggee DDiirreeccttoorryy
       A common extension in _e_x implementations is to use the elements of a
       ccddppaatthh edit option as prefix directories for _p_a_t_h arguments to cchhddiirr
       that are relative pathnames and that do not have ''..'' or ""...."" as their
       first component. Elements in the ccddppaatthh edit option are
       <colon>-separated.  The initial value of the ccddppaatthh edit option is the
       value of the shell _C_D_P_A_T_H environment variable. This feature was not
       included in POSIX.1‐2008 because it does not exist in any of the
       implementations considered historical practice.

   CCooppyy
       Historical implementations of _e_x permitted copies to lines inside of
       the specified range; for example, ::22,,55ccooppyy33 was a valid command.
       POSIX.1‐2008 requires conformance to historical practice.

   DDeelleettee
       POSIX.1‐2008 requires support for the historical parsing of a ddeelleettee
       command followed by flags, without any intervening <blank> characters.
       For example:

       11ddpp     Deletes the first line and prints the line that was second.

       11ddeelleepp  As for 11ddpp.

       11dd      Deletes the first line, saving it in buffer _p.

       11dd  pp11ll  (Pee-one-ell.) Deletes the first line, saving it in buffer _p,
               and listing the line that was second.

   EEddiitt
       Historically, any _e_x command could be entered as a ++_c_o_m_m_a_n_d argument to
       the eeddiitt command, although some (for example, iinnsseerrtt and aappppeenndd) were
       known to confuse historical implementations. For consistency and
       simplicity of specification, POSIX.1‐2008 requires that any command be
       supported as an argument to the eeddiitt command.

       Historically, the command argument was executed with the current line
       set to the last line of the file, regardless of whether the eeddiitt
       command was executed from visual mode or not. POSIX.1‐2008 requires
       conformance to historical practice.

       Historically, the ++_c_o_m_m_a_n_d specified to the eeddiitt and nneexxtt commands was
       delimited by the first <blank>, and there was no way to quote them. For
       consistency, POSIX.1‐2008 requires that the usual _e_x backslash quoting
       be provided.

       Historically, specifying the ++_c_o_m_m_a_n_d argument to the edit command
       required a filename to be specified as well; for example, ::eeddiitt  ++110000
       would always fail. For consistency and simplicity of specification,
       POSIX.1‐2008 does not permit this usage to fail for that reason.

       Historically, only the cursor position of the last file edited was
       remembered by the editor. POSIX.1‐2008 requires that this be supported;
       however, implementations are permitted to remember and restore the
       cursor position for any file previously edited.

   FFiillee
       Historical versions of the _e_x editor ffiillee command displayed a current
       line and number of lines in the edit buffer of 0 when the file was
       empty, while the _v_i <control>‐G command displayed a current line and
       number of lines in the edit buffer of 1 in the same situation.
       POSIX.1‐2008 does not permit this discrepancy, instead requiring that a
       message be displayed indicating that the file is empty.

   GGlloobbaall
       The two-pass operation of the gglloobbaall and vv commands is not intended to
       imply implementation, only the required result of the operation.

       The current line and column are set as specified for the individual _e_x
       commands. This requirement is cumulative; that is, the current line and
       column must track across all the commands executed by the gglloobbaall or vv
       commands.

   IInnsseerrtt
       See the RATIONALE for the aappppeenndd command.

       Historically, iinnsseerrtt could not be used with an address of zero; that
       is, not when the edit buffer was empty. POSIX.1‐2008 requires that this
       command behave consistently with the aappppeenndd command.

   JJooiinn
       The action of the jjooiinn command in relation to the special characters is
       only defined for the POSIX locale because the correct amount of white
       space after a period varies; in Japanese none is required, in French
       only a single space, and so on.

   LLiisstt
       The historical output of the lliisstt command was potentially ambiguous.
       The standard developers believed correcting this to be more important
       than adhering to historical practice, and POSIX.1‐2008 requires
       unambiguous output.

   MMaapp
       Historically, command mode maps only applied to command names; for
       example, if the character ''xx'' was mapped to ''yy'', the command ffxx
       searched for the ''xx'' character, not the ''yy'' character. POSIX.1‐2008
       requires this behavior. Historically, entering <control>‐V as the first
       character of a _v_i command was an error. Several implementations have
       extended the semantics of _v_i such that <control>‐V means that the
       subsequent command character is not mapped. This is permitted, but not
       required, by POSIX.1‐2008. Regardless, using <control>‐V to escape the
       second or later character in a sequence of characters that might match
       a mmaapp command, or any character in text input mode, is historical
       practice, and stops the entered keys from matching a map. POSIX.1‐2008
       requires conformance to historical practice.

       Historical implementations permitted digits to be used as a mmaapp command
       _l_h_s, but then ignored the map. POSIX.1‐2008 requires that the mapped
       digits not be ignored.

       The historical implementation of the mmaapp command did not permit mmaapp
       commands that were more than a single character in length if the first
       character was printable. This behavior is permitted, but not required,
       by POSIX.1‐2008.

       Historically, mapped characters were remapped unless the rreemmaapp edit
       option was not set, or the prefix of the mapped characters matched the
       mapping characters; for example, in the mmaapp:


           ::mmaapp aabb aabbccdd

       the characters ""aabb"" were used as is and were not remapped, but the
       characters ""ccdd"" were mapped if appropriate. This can cause infinite
       loops in the _v_i mapping mechanisms. POSIX.1‐2008 requires conformance
       to historical practice, and that such loops be interruptible.

       Text input maps had the same problems with expanding the _l_h_s for the _e_x
       mmaapp!!  and uunnmmaapp!!  command as did the _e_x aabbbbrreevviiaattee and uunnaabbbbrreevviiaattee
       commands. See the RATIONALE for the _e_x aabbbbrreevviiaattee command. POSIX.1‐2008
       requires similar modification of some historical practice for the mmaapp
       and uunnmmaapp commands, as described for the aabbbbrreevviiaattee and uunnaabbbbrreevviiaattee
       commands.

       Historically, mmaapps that were subsets of other mmaapps behaved differently
       depending on the order in which they were defined.  For example:


           ::mmaapp!! aabb     sshhoorrtt
           ::mmaapp!! aabbcc    lloonngg

       would always translate the characters ""aabb"" to ""sshhoorrtt"", regardless of
       how fast the characters ""aabbcc"" were entered. If the entry order was
       reversed:


           ::mmaapp!! aabbcc    lloonngg
           ::mmaapp!! aabb     sshhoorrtt

       the characters ""aabb"" would cause the editor to pause, waiting for the
       completing ''cc'' character, and the characters might never be mapped to
       ""sshhoorrtt"".  For consistency and simplicity of specification, POSIX.1‐2008
       requires that the shortest match be used at all times.

       The length of time the editor spends waiting for the characters to
       complete the _l_h_s is unspecified because the timing capabilities of
       systems are often inexact and variable, and it may depend on other
       factors such as the speed of the connection. The time should be long
       enough for the user to be able to complete the sequence, but not long
       enough for the user to have to wait. Some implementations of _v_i have
       added a kkeeyyttiimmee option, which permits users to set the number of 0,1
       seconds the editor waits for the completing characters. Because mapped
       terminal function and cursor keys tend to start with an <ESC>
       character, and <ESC> is the key ending _v_i text input mode, mmaapps
       starting with <ESC> characters are generally exempted from this timeout
       period, or, at least timed out differently.

   MMaarrkk
       Historically, users were able to set the ``previous context'' marks
       explicitly. In addition, the _e_x commands '''' and ''`` and the _v_i commands
       '''', ````, ``'', and ''`` all referred to the same mark. In addition, the
       previous context marks were not set if the command, with which the
       address setting the mark was associated, failed. POSIX.1‐2008 requires
       conformance to historical practice. Historically, if marked lines were
       deleted, the mark was also deleted, but would reappear if the change
       was undone. POSIX.1‐2008 requires conformance to historical practice.

       The description of the special events that set the `` and '' marks
       matches historical practice. For example, historically the command
       //aa//,,//bb// did not set the `` and '' marks, but the command //aa//,,//bb//ddeelleettee
       did.

   NNeexxtt
       Historically, any _e_x command could be entered as a ++_c_o_m_m_a_n_d argument to
       the nneexxtt command, although some (for example, iinnsseerrtt and aappppeenndd) were
       known to confuse historical implementations. POSIX.1‐2008 requires that
       any command be permitted and that it behave as specified. The nneexxtt
       command can accept more than one file, so usage such as:


           nneexxtt ``llss [[aabbcc]] ``

       is valid; it need not be valid for the eeddiitt or rreeaadd commands, for
       example, because they expect only one filename.

       Historically, the nneexxtt command behaved differently from the ::rreewwiinndd
       command in that it ignored the force flag if the aauuttoowwrriittee flag was
       set. For consistency, POSIX.1‐2008 does not permit this behavior.

       Historically, the nneexxtt command positioned the cursor as if the file had
       never been edited before, regardless. POSIX.1‐2008 does not permit this
       behavior, for consistency with the eeddiitt command.

       Implementations wanting to provide a counterpart to the nneexxtt command
       that edited the previous file have used the command pprreevv[[iioouuss]],, which
       takes no _f_i_l_e argument. POSIX.1‐2008 does not require this command.

   OOppeenn
       Historically, the ooppeenn command would fail if the ooppeenn edit option was
       not set. POSIX.1‐2008 does not mention the ooppeenn edit option and does
       not require this behavior. Some historical implementations do not
       permit entering open mode from open or visual mode, only from _e_x mode.
       For consistency, POSIX.1‐2008 does not permit this behavior.

       Historically, entering open mode from the command line (that is, _v_i
       ++ooppeenn) resulted in anomalous behaviors; for example, the _e_x file and
       _s_e_t commands, and the _v_i command <control>‐G did not work. For
       consistency, POSIX.1‐2008 does not permit this behavior.

       Historically, the ooppeenn command only permitted ''//'' characters to be used
       as the search pattern delimiter. For consistency, POSIX.1‐2008 requires
       that the search delimiters used by the ss, gglloobbaall, and vv commands be
       accepted as well.

   PPrreesseerrvvee
       The pprreesseerrvvee command does not historically cause the file to be
       considered unmodified for the purposes of future commands that may exit
       the editor. POSIX.1‐2008 requires conformance to historical practice.

       Historical documentation stated that mail was not sent to the user when
       preserve was executed; however, historical implementations did send
       mail in this case. POSIX.1‐2008 requires conformance to the historical
       implementations.

   PPrriinntt
       The writing of NUL by the pprriinntt command is not specified as a special
       case because the standard developers did not want to require _e_x to
       support NUL characters. Historically, characters were displayed using
       the ARPA standard mappings, which are as follows:

        1. Printable characters are left alone.

        2. Control characters less than \177 are represented as ''^^'' followed
           by the character offset from the ''@@'' character in the ASCII map;
           for example, \007 is represented as ''^^GG''.

        3. \177 is represented as ''^^'' followed by ''??''.

       The display of characters having their eighth bit set was less
       standard. Existing implementations use hex (0x00), octal (\000), and a
       meta-bit display. (The latter displayed bytes that had their eighth bit
       set as the two characters ""MM−−"" followed by the seven-bit display as
       described above.) The latter probably has the best claim to historical
       practice because it was used for the −−vv option of 4 BSD and 4 BSD-
       derived versions of the _c_a_t utility since 1980.

       No specific display format is required by POSIX.1‐2008.

       Explicit dependence on the ASCII character set has been avoided where
       possible, hence the use of the phrase an ``implementation-defined
       multi-character sequence'' for the display of non-printable characters
       in preference to the historical usage of, for instance, ""^^II"" for the
       <tab>.  Implementations are encouraged to conform to historical
       practice in the absence of any strong reason to diverge.

       Historically, all _e_x commands beginning with the letter ''pp'' could be
       entered using capitalized versions of the commands; for example,
       PP[[rriinntt]], PPrree[[sseerrvvee]], and PPuu[[tt]] were all valid command names.
       POSIX.1‐2008 permits, but does not require, this historical practice
       because capital forms of the commands are used by some implementations
       for other purposes.

   PPuutt
       Historically, an _e_x ppuutt command, executed from open or visual mode, was
       the same as the open or visual mode PP command, if the buffer was named
       and was cut in character mode, and the same as the pp command if the
       buffer was named and cut in line mode. If the unnamed buffer was the
       source of the text, the entire line from which the text was taken was
       usually ppuutt, and the buffer was handled as if in line mode, but it was
       possible to get extremely anomalous behavior. In addition, using the QQ
       command to switch into _e_x mode, and then doing a ppuutt often resulted in
       errors as well, such as appending text that was unrelated to the
       (supposed) contents of the buffer. For consistency and simplicity of
       specification, POSIX.1‐2008 does not permit these behaviors. All _e_x ppuutt
       commands are required to operate in line mode, and the contents of the
       buffers are not altered by changing the mode of the editor.

   RReeaadd
       Historically, an _e_x rreeaadd command executed from open or visual mode,
       executed in an empty file, left an empty line as the first line of the
       file. For consistency and simplicity of specification, POSIX.1‐2008
       does not permit this behavior.  Historically, a rreeaadd in open or visual
       mode from a program left the cursor at the last line read in, not the
       first. For consistency, POSIX.1‐2008 does not permit this behavior.

       Historical implementations of _e_x were unable to undo rreeaadd commands that
       read from the output of a program. For consistency, POSIX.1‐2008 does
       not permit this behavior.

       Historically, the _e_x and _v_i message after a successful rreeaadd or wwrriittee
       command specified ``characters'', not ``bytes''. POSIX.1‐2008 requires
       that the number of bytes be displayed, not the number of characters,
       because it may be difficult in multi-byte implementations to determine
       the number of characters read. Implementations are encouraged to
       clarify the message displayed to the user.

       Historically, reads were not permitted on files other than type
       regular, except that FIFO files could be read (probably only because
       they did not exist when _e_x and _v_i were originally written). Because the
       historical _e_x evaluated rreeaadd!!  and rreeaadd  !!  equivalently, there can be
       no optional way to force the read. POSIX.1‐2008 permits, but does not
       require, this behavior.

   RReeccoovveerr
       Some historical implementations of the editor permitted users to
       recover the edit buffer contents from a previous edit session, and then
       exit without saving those contents (or explicitly discarding them). The
       intent of POSIX.1‐2008 in requiring that the edit buffer be treated as
       already modified is to prevent this user error.

   RReewwiinndd
       Historical implementations supported the rreewwiinndd command when the user
       was editing the first file in the list; that is, the file that the
       rreewwiinndd command would edit. POSIX.1‐2008 requires conformance to
       historical practice.

   SSuubbssttiittuuttee
       Historically, _e_x accepted an rr option to the ss command. The effect of
       the rr option was to use the last regular expression used in any command
       as the pattern, the same as the ~~ command. The rr option is not required
       by POSIX.1‐2008. Historically, the cc and gg options were toggled; for
       example, the command ::ss//aabbcc//ddeeff// was the same as ss//aabbcc//ddeeff//ccccccccgggggggg.
       For simplicity of specification, POSIX.1‐2008 does not permit this
       behavior.

       The tilde command is often used to replace the last search RE. For
       example, in the sequence:


           ss//rreedd//bblluuee//
           //ggrreeeenn
           ~~

       the ~~ command is equivalent to:


           ss//ggrreeeenn//bblluuee//

       Historically, _e_x accepted all of the following forms:


           ss//aabbcc//ddeeff//
           ss//aabbcc//ddeeff
           ss//aabbcc//
           ss//aabbcc

       POSIX.1‐2008 requires conformance to this historical practice.

       The ss command presumes that the ''^^'' character only occupies a single
       column in the display. Much of the _e_x and _v_i specification presumes
       that the <space> only occupies a single column in the display. There
       are no known character sets for which this is not true.

       Historically, the final column position for the substitute commands was
       based on previous column movements; a search for a pattern followed by
       a substitution would leave the column position unchanged, while a 0
       command followed by a substitution would change the column position to
       the first non-<blank>.  For consistency and simplicity of
       specification, POSIX.1‐2008 requires that the final column position
       always be set to the first non-<blank>.

   SSeett
       Historical implementations redisplayed all of the options for each
       occurrence of the aallll keyword. POSIX.1‐2008 permits, but does not
       require, this behavior.

   TTaagg
       No requirement is made as to where _e_x and _v_i shall look for the file
       referenced by the tag entry. Historical practice has been to look for
       the path found in the ttaaggss file, based on the current directory. A
       useful extension found in some implementations is to look based on the
       directory containing the tags file that held the entry, as well. No
       requirement is made as to which reference for the tag in the tags file
       is used. This is deliberate, in order to permit extensions such as
       multiple entries in a tags file for a tag.

       Because users often specify many different tags files, some of which
       need not be relevant or exist at any particular time, POSIX.1‐2008
       requires that error messages about problem tags files be displayed only
       if the requested tag is not found, and then, only once for each time
       that the ttaagg edit option is changed.

       The requirement that the current edit buffer be unmodified is only
       necessary if the file indicated by the tag entry is not the same as the
       current file (as defined by the current pathname). Historically, the
       file would be reloaded if the filename had changed, as well as if the
       filename was different from the current pathname. For consistency and
       simplicity of specification, POSIX.1‐2008 does not permit this
       behavior, requiring that the name be the only factor in the decision.

       Historically, _v_i only searched for tags in the current file from the
       current cursor to the end of the file, and therefore, if the wwrraappssccaann
       option was not set, tags occurring before the current cursor were not
       found. POSIX.1‐2008 considers this a bug, and implementations are
       required to search for the first occurrence in the file, regardless.

   UUnnddoo
       The uunnddoo description deliberately uses the word ``modified''. The uunnddoo
       command is not intended to undo commands that replace the contents of
       the edit buffer, such as eeddiitt, nneexxtt, ttaagg, or rreeccoovveerr.

       Cursor positioning after the uunnddoo command was inconsistent in the
       historical _v_i, sometimes attempting to restore the original cursor
       position (gglloobbaall, uunnddoo, and vv commands), and sometimes, in the presence
       of maps, placing the cursor on the last line added or changed instead
       of the first. POSIX.1‐2008 requires a simplified behavior for
       consistency and simplicity of specification.

   VVeerrssiioonn
       The vveerrssiioonn command cannot be exactly specified since there is no
       widely-accepted definition of what the version information should
       contain.  Implementations are encouraged to do something reasonably
       intelligent.

   WWrriittee
       Historically, the _e_x and _v_i message after a successful rreeaadd or wwrriittee
       command specified ``characters'', not ``bytes''. POSIX.1‐2008 requires
       that the number of bytes be displayed, not the number of characters
       because it may be difficult in multi-byte implementations to determine
       the number of characters written. Implementations are encouraged to
       clarify the message displayed to the user.

       Implementation-defined tests are permitted so that implementations can
       make additional checks; for example, for locks or file modification
       times.

       Historically, attempting to append to a nonexistent file caused an
       error. It has been left unspecified in POSIX.1‐2008 to permit
       implementations to let the wwrriittee succeed, so that the append semantics
       are similar to those of the historical _c_s_h.

       Historical _v_i permitted empty edit buffers to be written. However,
       since the way _v_i got around dealing with ``empty'' files was to always
       have a line in the edit buffer, no matter what, it wrote them as files
       of a single, empty line. POSIX.1‐2008 does not permit this behavior.

       Historically, _e_x restored standard output and standard error to their
       values as of when _e_x was invoked, before writes to programs were
       performed. This could disturb the terminal configuration as well as be
       a security issue for some terminals. POSIX.1‐2008 does not permit this,
       requiring that the program output be captured and displayed as if by
       the _e_x pprriinntt command.

   AAddjjuusstt WWiinnddooww
       Historically, the line count was set to the value of the ssccrroollll option
       if the type character was end-of-file. This feature was broken on most
       historical implementations long ago, however, and is not documented
       anywhere. For this reason, POSIX.1‐2008 is resolutely silent.

       Historically, the zz command was <blank>-sensitive and zz  ++ and zz  −− did
       different things than zz++ and zz−− because the type could not be
       distinguished from a flag. (The commands zz  ..  and zz  == were historically
       invalid.) POSIX.1‐2008 requires conformance to this historical
       practice.

       Historically, the zz command was further <blank>-sensitive in that the
       _c_o_u_n_t could not be <blank>-delimited; for example, the commands zz==  55
       and zz−−  55 were also invalid. Because the _c_o_u_n_t is not ambiguous with
       respect to either the type character or the flags, this is not
       permitted by POSIX.1‐2008.

   EEssccaappee
       Historically, _e_x filter commands only read the standard output of the
       commands, letting standard error appear on the terminal as usual. The
       _v_i utility, however, read both standard output and standard error.
       POSIX.1‐2008 requires the latter behavior for both _e_x and _v_i, for
       consistency.

   SShhiifftt LLeefftt aanndd SShhiifftt RRiigghhtt
       Historically, it was possible to add shift characters to increase the
       effect of the command; for example, <<<<<< outdented (or >>>>>> indented) the
       lines 3 levels of indentation instead of the default 1.  POSIX.1‐2008
       requires conformance to historical practice.

   <<ccoonnttrrooll>>‐‐DD
       Historically, the <control>‐D command erased the prompt, providing the
       user with an unbroken presentation of lines from the edit buffer. This
       is not required by POSIX.1‐2008; implementations are encouraged to
       provide it if possible.  Historically, the <control>‐D command took,
       and then ignored, a _c_o_u_n_t.  POSIX.1‐2008 does not permit this behavior.

   WWrriittee LLiinnee NNuummbbeerr
       Historically, the _e_x == command, when executed in _e_x mode in an empty
       edit buffer, reported 0, and from open or visual mode, reported 1. For
       consistency and simplicity of specification, POSIX.1‐2008 does not
       permit this behavior.

   EExxeeccuuttee
       Historically, _e_x did not correctly handle the inclusion of text input
       commands (that is, aappppeenndd, iinnsseerrtt, and cchhaannggee) in executed buffers.
       POSIX.1‐2008 does not permit this exclusion for consistency.

       Historically, the logical contents of the buffer being executed did not
       change if the buffer itself were modified by the commands being
       executed; that is, buffer execution did not support self-modifying
       code. POSIX.1‐2008 requires conformance to historical practice.

       Historically, the @@ command took a range of lines, and the @@ buffer was
       executed once per line, with the current line (''..'') set to each
       specified line. POSIX.1‐2008 requires conformance to historical
       practice.

       Some historical implementations did not notice if errors occurred
       during buffer execution. This, coupled with the ability to specify a
       range of lines for the _e_x @@ command, makes it trivial to cause them to
       drop ccoorree.  POSIX.1‐2008 requires that implementations stop buffer
       execution if any error occurs, if the specified line doesn't exist, or
       if the contents of the edit buffer itself are replaced (for example,
       the buffer executes the _e_x ::eeddiitt command).

   RReegguullaarr EExxpprreessssiioonnss iinn eexx
       Historical practice is that the characters in the replacement part of
       the last ss command—that is, those matched by entering a ''~~'' in the
       regular expression—were not further expanded by the regular expression
       engine. So, if the characters contained the string ""aa..,,"" they would
       match ''aa'' followed by ""..,,"" and not ''aa'' followed by any character.
       POSIX.1‐2008 requires conformance to historical practice.

   EEddiitt OOppttiioonnss iinn eexx
       The following paragraphs describe the historical behavior of some edit
       options that were not, for whatever reason, included in POSIX.1‐2008.
       Implementations are strongly encouraged to only use these names if the
       functionality described here is fully supported.

       eexxtteennddeedd  The eexxtteennddeedd edit option has been used in some
                 implementations of _v_i to provide extended regular expressions
                 instead of basic regular expressions This option was omitted
                 from POSIX.1‐2008 because it is not widespread historical
                 practice.

       ffllaasshh     The ffllaasshh edit option historically caused the screen to flash
                 instead of beeping on error. This option was omitted from
                 POSIX.1‐2008 because it is not found in some historical
                 implementations.

       hhaarrddttaabbss  The hhaarrddttaabbss edit option historically defined the number of
                 columns between hardware tab settings. This option was
                 omitted from POSIX.1‐2008 because it was believed to no
                 longer be generally useful.

       mmooddeelliinnee  The mmooddeelliinnee (sometimes named mmooddeelliinneess) edit option
                 historically caused _e_x or _v_i to read the five first and last
                 lines of the file for editor commands.  This option is a
                 security problem, and vendors are strongly encouraged to
                 delete it from historical implementations.

       ooppeenn      The ooppeenn edit option historically disallowed the _e_x ooppeenn and
                 vviissuuaall commands. This edit option was omitted because these
                 commands are required by POSIX.1‐2008.

       ooppttiimmiizzee  The ooppttiimmiizzee edit option historically expedited text
                 throughput by setting the terminal to not do automatic
                 <carriage-return> characters when printing more than one
                 logical line of output. This option was omitted from
                 POSIX.1‐2008 because it was intended for terminals without
                 addressable cursors, which are rarely, if ever, still used.

       rruulleerr     The rruulleerr edit option has been used in some implementations
                 of _v_i to present a current row/column ruler for the user.
                 This option was omitted from POSIX.1‐2008 because it is not
                 widespread historical practice.

       ssoouurrcceeaannyy The ssoouurrcceeaannyy edit option historically caused _e_x or _v_i to
                 source start-up files that were owned by users other than the
                 user running the editor. This option is a security problem,
                 and vendors are strongly encouraged to remove it from their
                 implementations.

       ttiimmeeoouutt   The ttiimmeeoouutt edit option historically enabled the (now
                 standard) feature of only waiting for a short period before
                 returning keys that could be part of a macro. This feature
                 was omitted from POSIX.1‐2008 because its behavior is now
                 standard, it is not widely useful, and it was rarely
                 documented.

       vveerrbboossee   The vveerrbboossee edit option has been used in some implementations
                 of _v_i to cause _v_i to output error messages for common errors;
                 for example, attempting to move the cursor past the beginning
                 or end of the line instead of only alerting the screen. (The
                 historical _v_i only alerted the terminal and presented no
                 message for such errors. The historical editor option tteerrssee
                 did not select when to present error messages, it only made
                 existing error messages more or less verbose.) This option
                 was omitted from POSIX.1‐2008 because it is not widespread
                 historical practice; however, implementors are encouraged to
                 use it if they wish to provide error messages for naive
                 users.

       wwrraapplleenn   The wwrraapplleenn edit option has been used in some implementations
                 of _v_i to specify an automatic margin measured from the left
                 margin instead of from the right margin. This is useful when
                 multiple screen sizes are being used to edit a single file.
                 This option was omitted from POSIX.1‐2008 because it is not
                 widespread historical practice; however, implementors are
                 encouraged to use it if they add this functionality.

   aauuttooiinnddeenntt,, aaii
       Historically, the command 00aa did not do any autoindentation, regardless
       of the current indentation of line 1. POSIX.1‐2008 requires that any
       indentation present in line 1 be used.

   aauuttoopprriinntt,, aapp
       Historically, the aauuttoopprriinntt edit option was not completely consistent
       or based solely on modifications to the edit buffer. Exceptions were
       the rreeaadd command (when reading from a file, but not from a filter), the
       aappppeenndd, cchhaannggee, iinnsseerrtt, gglloobbaall, and vv commands, all of which were not
       affected by aauuttoopprriinntt, and the ttaagg command, which was affected by
       aauuttoopprriinntt.  POSIX.1‐2008 requires conformance to historical practice.

       Historically, the aauuttoopprriinntt option only applied to the last of multiple
       commands entered using <vertical-line> delimiters; for example, ddeelleettee
       <newline> was affected by aauuttoopprriinntt, but ddeelleettee||vveerrssiioonn <newline> was
       not. POSIX.1‐2008 requires conformance to historical practice.

   aauuttoowwrriittee,, aaww
       Appending the ''!!'' character to the _e_x nneexxtt command to avoid performing
       an automatic write was not supported in historical implementations.
       POSIX.1‐2008 requires that the behavior match the other _e_x commands for
       consistency.

   iiggnnoorreeccaassee,, iicc
       Historical implementations of case-insensitive matching (the iiggnnoorreeccaassee
       edit option) lead to counter-intuitive situations when uppercase
       characters were used in range expressions. Historically, the process
       was as follows:

        1. Take a line of text from the edit buffer.

        2. Convert uppercase to lowercase in text line.

        3. Convert uppercase to lowercase in regular expressions, except in
           character class specifications.

        4. Match regular expressions against text.

       This would mean that, with iiggnnoorreeccaassee in effect, the text:


           TThhee ccaatt ssaatt oonn tthhee mmaatt

       would be matched by


           //^^tthhee//

       but not by:


           //^^[[AA−−ZZ]]hhee//

       For consistency with other commands implementing regular expressions,
       POSIX.1‐2008 does not permit this behavior.

   ppaarraaggrraapphhss,, ppaarraa
       The ISO POSIX‐2:1993 standard made the default ppaarraaggrraapphhss and sseeccttiioonnss
       edit options implementation-defined, arguing they were historically
       oriented to the UNIX system _t_r_o_f_f text formatter, and a ``portable
       user'' could use the {{, }}, [[[[, ]]]], ((, and )) commands in open or visual
       mode and have the cursor stop in unexpected places. POSIX.1‐2008
       specifies their values in the POSIX locale because the unusual grouping
       (they only work when grouped into two characters at a time) means that
       they cannot be used for general-purpose movement, regardless.

   rreeaaddoonnllyy
       Implementations are encouraged to provide the best possible information
       to the user as to the read-only status of the file, with the exception
       that they should not consider the current special privileges of the
       process. This provides users with a safety net because they must force
       the overwrite of read-only files, even when running with additional
       privileges.

       The rreeaaddoonnllyy edit option specification largely conforms to historical
       practice. The only difference is that historical implementations did
       not notice that the user had set the rreeaaddoonnllyy edit option in cases
       where the file was already marked read-only for some reason, and would
       therefore reinitialize the rreeaaddoonnllyy edit option the next time the
       contents of the edit buffer were replaced. This behavior is disallowed
       by POSIX.1‐2008.

   rreeppoorrtt
       The requirement that lines copied to a buffer interact differently than
       deleted lines is historical practice. For example, if the rreeppoorrtt edit
       option is set to 3, deleting 3 lines will cause a report to be written,
       but 4 lines must be copied before a report is written.

       The requirement that the _e_x gglloobbaall, vv, ooppeenn, uunnddoo, and vviissuuaall commands
       present reports based on the total number of lines added or deleted
       during the command execution, and that commands executed by the gglloobbaall
       and vv commands not present reports, is historical practice.
       POSIX.1‐2008 extends historical practice by requiring that buffer
       execution be treated similarly. The reasons for this are two-fold.
       Historically, only the report by the last command executed from the
       buffer would be seen by the user, as each new report would overwrite
       the last. In addition, the standard developers believed that buffer
       execution had more in common with gglloobbaall and vv commands than it did
       with other _e_x commands, and should behave similarly, for consistency
       and simplicity of specification.

   sshhoowwmmaattcchh,, ssmm
       The length of time the cursor spends on the matching character is
       unspecified because the timing capabilities of systems are often
       inexact and variable. The time should be long enough for the user to
       notice, but not long enough for the user to become annoyed. Some
       implementations of _v_i have added a mmaattcchhttiimmee option that permits users
       to set the number of 0,1 second intervals the cursor pauses on the
       matching character.

   sshhoowwmmooddee
       The sshhoowwmmooddee option has been used in some historical implementations of
       _e_x and _v_i to display the current editing mode when in open or visual
       mode. The editing modes have generally included ``command'' and
       ``input'', and sometimes other modes such as ``replace'' and
       ``change''. The string was usually displayed on the bottom line of the
       screen at the far right-hand corner. In addition, a preceding ''**''
       character often denoted whether the contents of the edit buffer had
       been modified. The latter display has sometimes been part of the
       sshhoowwmmooddee option, and sometimes based on another option. This option was
       not available in the 4 BSD historical implementation of _v_i, but was
       viewed as generally useful, particularly to novice users, and is
       required by POSIX.1‐2008.

       The ssmmdd shorthand for the sshhoowwmmooddee option was not present in all
       historical implementations of the editor.  POSIX.1‐2008 requires it,
       for consistency.

       Not all historical implementations of the editor displayed a mode
       string for command mode, differentiating command mode from text input
       mode by the absence of a mode string. POSIX.1‐2008 permits this
       behavior for consistency with historical practice, but implementations
       are encouraged to provide a display string for both modes.

   sslloowwooppeenn
       Historically, the sslloowwooppeenn option was automatically set if the terminal
       baud rate was less than 1200 baud, or if the baud rate was 1200 baud
       and the rreeddrraaww option was not set. The sslloowwooppeenn option had two effects.
       First, when inserting characters in the middle of a line, characters
       after the cursor would not be pushed ahead, but would appear to be
       overwritten. Second, when creating a new line of text, lines after the
       current line would not be scrolled down, but would appear to be
       overwritten. In both cases, ending text input mode would cause the
       screen to be refreshed to match the actual contents of the edit buffer.
       Finally, terminals that were sufficiently intelligent caused the editor
       to ignore the sslloowwooppeenn option. POSIX.1‐2008 permits most historical
       behavior, extending historical practice to require sslloowwooppeenn behaviors
       if the edit option is set by the user.

   ttaaggss
       The default path for tags files is left unspecified as implementations
       may have their own ttaaggss implementations that do not correspond to the
       historical ones. The default ttaaggss option value should probably at least
       include the file ..//ttaaggss.

   tteerrmm
       Historical implementations of _e_x and _v_i ignored changes to the tteerrmm
       edit option after the initial terminal information was loaded. This is
       permitted by POSIX.1‐2008; however, implementations are encouraged to
       permit the user to modify their terminal type at any time.

   tteerrssee
       Historically, the tteerrssee edit option optionally provided a shorter, less
       descriptive error message, for some error messages. This is permitted,
       but not required, by POSIX.1‐2008. Historically, most common visual
       mode errors (for example, trying to move the cursor past the end of a
       line) did not result in an error message, but simply alerted the
       terminal. Implementations wishing to provide messages for novice users
       are urged to do so based on the eeddiitt option vveerrbboossee, and not tteerrssee.

   wwiinnddooww
       In historical implementations, the default for the wwiinnddooww edit option
       was based on the baud rate as follows:

        1. If the baud rate was less than 1200, the eeddiitt option ww330000 set the
           window value; for example, the line:


               sseett ww330000==1122

           would set the window option to 12 if the baud rate was less than
           1200.

        2. If the baud rate was equal to 1200, the eeddiitt option ww11220000 set the
           window value.

        3. If the baud rate was greater than 1200, the eeddiitt option ww99660000 set
           the window value.

       The ww330000, ww11220000, and ww99660000 options do not appear in POSIX.1‐2008
       because of their dependence on specific baud rates.

       In historical implementations, the size of the window displayed by
       various commands was related to, but not necessarily the same as, the
       wwiinnddooww edit option. For example, the size of the window was set by the
       _e_x command vviissuuaall 1100, but it did not change the value of the wwiinnddooww
       edit option. However, changing the value of the wwiinnddooww edit option did
       change the number of lines that were displayed when the screen was
       repainted. POSIX.1‐2008 does not permit this behavior in the interests
       of consistency and simplicity of specification, and requires that all
       commands that change the number of lines that are displayed do it by
       setting the value of the wwiinnddooww edit option.

   wwrraappmmaarrggiinn,, wwmm
       Historically, the wwrraappmmaarrggiinn option did not affect maps inserting
       characters that also had associated _c_o_u_n_ts; for example
       ::mmaapp  KK  55aaAABBCC  DDEEFF.  Unfortunately, there are widely used maps that
       depend on this behavior.  For consistency and simplicity of
       specification, POSIX.1‐2008 does not permit this behavior.

       Historically, wwrraappmmaarrggiinn was calculated using the column display width
       of all characters on the screen. For example, an implementation using
       ""^^II"" to represent <tab> characters when the lliisstt edit option was set,
       where ''^^'' and ''II'' each took up a single column on the screen, would
       calculate the wwrraappmmaarrggiinn based on a value of 2 for each <tab>.  The
       nnuummbbeerr edit option similarly changed the effective length of the line
       as well.  POSIX.1‐2008 requires conformance to historical practice.

       Earlier versions of this standard allowed for implementations with
       bytes other than eight bits, but this has been modified in this
       version.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _2_._9_._1_._1, _C_o_m_m_a_n_d _S_e_a_r_c_h _a_n_d _E_x_e_c_u_t_i_o_n, _c_t_a_g_s, _e_d, _s_e_d, _s_h,
       _s_t_t_y, _v_i

       The Base Definitions volume of POSIX.1‐2008, _T_a_b_l_e _5_-_1, _E_s_c_a_p_e
       _S_e_q_u_e_n_c_e_s _a_n_d _A_s_s_o_c_i_a_t_e_d _A_c_t_i_o_n_s, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s,
       _S_e_c_t_i_o_n _9_._3, _B_a_s_i_c _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
       _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _a_c_c_e_s_s()

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



IEEE/The Open Group                  2013                               EX(1P)
