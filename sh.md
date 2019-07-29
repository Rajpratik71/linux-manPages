SH(1P)                     POSIX Programmer's Manual                    SH(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       sh — shell, the standard command language interpreter

SSYYNNOOPPSSIISS
       sh [[−abCefhimnuvx]] [[−o _o_p_t_i_o_n]]... [[+abCefhimnuvx]] [[+o _o_p_t_i_o_n]]...
           [[_c_o_m_m_a_n_d___f_i_l_e [[_a_r_g_u_m_e_n_t...]]]]

       sh −c [[−abCefhimnuvx]] [[−o _o_p_t_i_o_n]]... [[+abCefhimnuvx]] [[+o _o_p_t_i_o_n]]...
           _c_o_m_m_a_n_d___s_t_r_i_n_g [[_c_o_m_m_a_n_d___n_a_m_e [[_a_r_g_u_m_e_n_t...]]]]

       sh −s [[−abCefhimnuvx]] [[−o _o_p_t_i_o_n]]... [[+abCefhimnuvx]] [[+o _o_p_t_i_o_n]]...
           [[_a_r_g_u_m_e_n_t...]]

DDEESSCCRRIIPPTTIIOONN
       The _s_h utility is a command language interpreter that shall execute
       commands read from a command line string, the standard input, or a
       specified file. The application shall ensure that the commands to be
       executed are expressed in the language described in _C_h_a_p_t_e_r _2, _S_h_e_l_l
       _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e.

       Pathname expansion shall not fail due to the size of a file.

       Shell input and output redirections have an implementation-defined
       offset maximum that is established in the open file description.

OOPPTTIIOONNSS
       The _s_h utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, with an
       extension for support of a leading <plus-sign> (''++'') as noted below.

       The −−aa, −−bb, −−CC, −−ee, −−ff, −−mm, −−nn, −−oo _o_p_t_i_o_n, −−uu, −−vv, and −−xx options are
       described as part of the _s_e_t utility in _S_e_c_t_i_o_n _2_._1_4, _S_p_e_c_i_a_l _B_u_i_l_t_-_I_n
       _U_t_i_l_i_t_i_e_s.  The option letters derived from the _s_e_t special built-in
       shall also be accepted with a leading <plus-sign> (''++'') instead of a
       leading <hyphen> (meaning the reverse case of the option as described
       in this volume of POSIX.1‐2008).

       The following additional options shall be supported:

       −−cc        Read commands from the _c_o_m_m_a_n_d___s_t_r_i_n_g operand. Set the value
                 of special parameter 0 (see _S_e_c_t_i_o_n _2_._5_._2, _S_p_e_c_i_a_l
                 _P_a_r_a_m_e_t_e_r_s) from the value of the _c_o_m_m_a_n_d___n_a_m_e operand and
                 the positional parameters ($1, $2, and so on) in sequence
                 from the remaining _a_r_g_u_m_e_n_t operands. No commands shall be
                 read from the standard input.

       −−ii        Specify that the shell is _i_n_t_e_r_a_c_t_i_v_e; see below. An
                 implementation may treat specifying the −−ii option as an error
                 if the real user ID of the calling process does not equal the
                 effective user ID or if the real group ID does not equal the
                 effective group ID.

       −−ss        Read commands from the standard input.

       If there are no operands and the −−cc option is not specified, the −−ss
       option shall be assumed.

       If the −−ii option is present, or if there are no operands and the
       shell's standard input and standard error are attached to a terminal,
       the shell is considered to be _i_n_t_e_r_a_c_t_i_v_e.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       −         A single <hyphen> shall be treated as the first operand and
                 then ignored. If both ''−−'' and ""−−−−"" are given as arguments, or
                 if other operands precede the single <hyphen>, the results
                 are undefined.

       _a_r_g_u_m_e_n_t  The positional parameters ($1, $2, and so on) shall be set to
                 _a_r_g_u_m_e_n_t_s, if any.

       _c_o_m_m_a_n_d___f_i_l_e
                 The pathname of a file containing commands. If the pathname
                 contains one or more <slash> characters, the implementation
                 attempts to read that file; the file need not be executable.
                 If the pathname does not contain a <slash> character:

                  *  The implementation shall attempt to read that file from
                     the current working directory; the file need not be
                     executable.

                  *  If the file is not in the current working directory, the
                     implementation may perform a search for an executable
                     file using the value of _P_A_T_H, as described in _S_e_c_t_i_o_n
                     _2_._9_._1_._1, _C_o_m_m_a_n_d _S_e_a_r_c_h _a_n_d _E_x_e_c_u_t_i_o_n.

                 Special parameter 0 (see _S_e_c_t_i_o_n _2_._5_._2, _S_p_e_c_i_a_l _P_a_r_a_m_e_t_e_r_s)
                 shall be set to the value of _c_o_m_m_a_n_d___f_i_l_e.  If _s_h is called
                 using a synopsis form that omits _c_o_m_m_a_n_d___f_i_l_e, special
                 parameter 0 shall be set to the value of the first argument
                 passed to _s_h from its parent (for example, _a_r_g_v[0] for a C
                 program), which is normally a pathname used to execute the _s_h
                 utility.

       _c_o_m_m_a_n_d___n_a_m_e
                 A string assigned to special parameter 0 when executing the
                 commands in _c_o_m_m_a_n_d___s_t_r_i_n_g.  If _c_o_m_m_a_n_d___n_a_m_e is not
                 specified, special parameter 0 shall be set to the value of
                 the first argument passed to _s_h from its parent (for example,
                 _a_r_g_v[0] for a C program), which is normally a pathname used
                 to execute the _s_h utility.

       _c_o_m_m_a_n_d___s_t_r_i_n_g
                 A string that shall be interpreted by the shell as one or
                 more commands, as if the string were the argument to the
                 _s_y_s_t_e_m() function defined in the System Interfaces volume of
                 POSIX.1‐2008. If the _c_o_m_m_a_n_d___s_t_r_i_n_g operand is an empty
                 string, _s_h shall exit with a zero exit status.

SSTTDDIINN
       The standard input shall be used only if one of the following is true:

        *  The −−ss option is specified.

        *  The −−cc option is not specified and no operands are specified.

        *  The script executes one or more commands that require input from
           standard input (such as a _r_e_a_d command that does not redirect its
           input).

       See the INPUT FILES section.

       When the shell is using standard input and it invokes a command that
       also uses standard input, the shell shall ensure that the standard
       input file pointer points directly after the command it has read when
       the command begins execution. It shall not read ahead in such a manner
       that any characters intended to be read by the invoked command are
       consumed by the shell (whether interpreted by the shell or not) or that
       characters that are not read by the invoked command are not seen by the
       shell. When the command expecting to read standard input is started
       asynchronously by an interactive shell, it is unspecified whether
       characters are read by the command or interpreted by the shell.

       If the standard input to _s_h is a FIFO or terminal device and is set to
       non-blocking reads, then _s_h shall enable blocking reads on standard
       input. This shall remain in effect when the command completes.

IINNPPUUTT FFIILLEESS
       The input file shall be a text file, except that line lengths shall be
       unlimited. If the input file is empty or consists solely of blank lines
       or comments, or both, _s_h shall exit with a zero exit status.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _s_h:

       _E_N_V       This variable, when and only when an interactive shell is
                 invoked, shall be subjected to parameter expansion (see
                 _S_e_c_t_i_o_n _2_._6_._2, _P_a_r_a_m_e_t_e_r _E_x_p_a_n_s_i_o_n) by the shell, and the
                 resulting value shall be used as a pathname of a file
                 containing shell commands to execute in the current
                 environment.  The file need not be executable. If the
                 expanded value of _E_N_V is not an absolute pathname, the
                 results are unspecified.  _E_N_V shall be ignored if the real
                 and effective user IDs or real and effective group IDs of the
                 process are different.

       _F_C_E_D_I_T    This variable, when expanded by the shell, shall determine
                 the default value for the −−ee _e_d_i_t_o_r option's _e_d_i_t_o_r option-
                 argument. If _F_C_E_D_I_T is null or unset, _e_d shall be used as the
                 editor.

       _H_I_S_T_F_I_L_E  Determine a pathname naming a command history file. If the
                 _H_I_S_T_F_I_L_E variable is not set, the shell may attempt to access
                 or create a file ..sshh__hhiissttoorryy in the directory referred to by
                 the _H_O_M_E environment variable. If the shell cannot obtain
                 both read and write access to, or create, the history file,
                 it shall use an unspecified mechanism that allows the history
                 to operate properly.  (References to history ``file'' in this
                 section shall be understood to mean this unspecified
                 mechanism in such cases.) An implementation may choose to
                 access this variable only when initializing the history file;
                 this initialization shall occur when _f_c or _s_h first attempt
                 to retrieve entries from, or add entries to, the file, as the
                 result of commands issued by the user, the file named by the
                 _E_N_V variable, or implementation-defined system start-up
                 files.  Implementations may choose to disable the history
                 list mechanism for users with appropriate privileges who do
                 not set _H_I_S_T_F_I_L_E; the specific circumstances under which this
                 occurs are implementation-defined. If more than one instance
                 of the shell is using the same history file, it is
                 unspecified how updates to the history file from those shells
                 interact. As entries are deleted from the history file, they
                 shall be deleted oldest first. It is unspecified when history
                 file entries are physically removed from the history file.

       _H_I_S_T_S_I_Z_E  Determine a decimal number representing the limit to the
                 number of previous commands that are accessible. If this
                 variable is unset, an unspecified default greater than or
                 equal to 128 shall be used. The maximum number of commands in
                 the history list is unspecified, but shall be at least 128.
                 An implementation may choose to access this variable only
                 when initializing the history file, as described under
                 _H_I_S_T_F_I_L_E.  Therefore, it is unspecified whether changes made
                 to _H_I_S_T_S_I_Z_E after the history file has been initialized are
                 effective.

       _H_O_M_E      Determine the pathname of the user's home directory. The
                 contents of _H_O_M_E are used in tilde expansion as described in
                 _S_e_c_t_i_o_n _2_._6_._1, _T_i_l_d_e _E_x_p_a_n_s_i_o_n.

       _I_F_S       A string treated as a list of characters that is used for
                 field splitting and to split lines into fields with the _r_e_a_d
                 command.

                 If _I_F_S is not set, it shall behave as normal for an unset
                 variable, except that field splitting by the shell and line
                 splitting by the _r_e_a_d command shall be performed as if the
                 value of _I_F_S is <space><tab><newline>; see _S_e_c_t_i_o_n _2_._6_._5,
                 _F_i_e_l_d _S_p_l_i_t_t_i_n_g.

                 Implementations may ignore the value of _I_F_S in the
                 environment, or the absence of _I_F_S from the environment, at
                 the time the shell is invoked, in which case the shell shall
                 set _I_F_S to <space><tab><newline> when it is invoked.

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the behavior of range expressions, equivalence
                 classes, and multi-character collating elements within
                 pattern matching.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files), which characters are defined as letters (character
                 class aallpphhaa), and the behavior of character classes within
                 pattern matching.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _M_A_I_L      Determine a pathname of the user's mailbox file for purposes
                 of incoming mail notification. If this variable is set, the
                 shell shall inform the user if the file named by the variable
                 is created or if its modification time has changed. Informing
                 the user shall be accomplished by writing a string of
                 unspecified format to standard error prior to the writing of
                 the next primary prompt string. Such check shall be performed
                 only after the completion of the interval defined by the
                 _M_A_I_L_C_H_E_C_K variable after the last such check. The user shall
                 be informed only if _M_A_I_L is set and _M_A_I_L_P_A_T_H is not set.

       _M_A_I_L_C_H_E_C_K
                 Establish a decimal integer value that specifies how often
                 (in seconds) the shell shall check for the arrival of mail in
                 the files specified by the _M_A_I_L_P_A_T_H or _M_A_I_L variables. The
                 default value shall be 600 seconds. If set to zero, the shell
                 shall check before issuing each primary prompt.

       _M_A_I_L_P_A_T_H  Provide a list of pathnames and optional messages separated
                 by <colon> characters. If this variable is set, the shell
                 shall inform the user if any of the files named by the
                 variable are created or if any of their modification times
                 change. (See the preceding entry for _M_A_I_L for descriptions of
                 mail arrival and user informing.) Each pathname can be
                 followed by ''%%'' and a string that shall be subjected to
                 parameter expansion and written to standard error when the
                 modification time changes. If a ''%%'' character in the pathname
                 is preceded by a <backslash>, it shall be treated as a
                 literal ''%%'' in the pathname. The default message is
                 unspecified.

                 The _M_A_I_L_P_A_T_H environment variable takes precedence over the
                 _M_A_I_L variable.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _P_A_T_H      Establish a string formatted as described in the Base
                 Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
                 _V_a_r_i_a_b_l_e_s, used to effect command interpretation; see _S_e_c_t_i_o_n
                 _2_._9_._1_._1, _C_o_m_m_a_n_d _S_e_a_r_c_h _a_n_d _E_x_e_c_u_t_i_o_n.

       _P_W_D       This variable shall represent an absolute pathname of the
                 current working directory. Assignments to this variable may
                 be ignored.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       The _s_h utility shall take the standard action for all signals (see
       _S_e_c_t_i_o_n _1_._4, _U_t_i_l_i_t_y _D_e_s_c_r_i_p_t_i_o_n _D_e_f_a_u_l_t_s) with the following
       exceptions.

       If the shell is interactive, SIGINT signals received during command
       line editing shall be handled as described in the EXTENDED DESCRIPTION,
       and SIGINT signals received at other times shall be caught but no
       action performed.

       If the shell is interactive:

        *  SIGQUIT and SIGTERM signals shall be ignored.

        *  If the −−mm option is in effect, SIGTTIN, SIGTTOU, and SIGTSTP
           signals shall be ignored.

        *  If the −−mm option is not in effect, it is unspecified whether
           SIGTTIN, SIGTTOU, and SIGTSTP signals are ignored, set to the
           default action, or caught.  If they are caught, the shell shall, in
           the signal-catching function, set the signal to the default action
           and raise the signal (after taking any appropriate steps, such as
           restoring terminal settings).

       The standard actions, and the actions described above for interactive
       shells, can be overridden by use of the _t_r_a_p special built-in utility
       (see _t_r_a_p and _S_e_c_t_i_o_n _2_._1_1, _S_i_g_n_a_l_s _a_n_d _E_r_r_o_r _H_a_n_d_l_i_n_g).

SSTTDDOOUUTT
       See the STDERR section.

SSTTDDEERRRR
       Except as otherwise stated (by the descriptions of any invoked
       utilities or in interactive mode), standard error shall be used only
       for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       See _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e.  The functionality described in
       the rest of the EXTENDED DESCRIPTION section shall be provided on
       implementations that support the User Portability Utilities option (and
       the rest of this section is not further shaded for this option).

   CCoommmmaanndd HHiissttoorryy LLiisstt
       When the _s_h utility is being used interactively, it shall maintain a
       list of commands previously entered from the terminal in the file named
       by the _H_I_S_T_F_I_L_E environment variable. The type, size, and internal
       format of this file are unspecified. Multiple _s_h processes can share
       access to the file for a user, if file access permissions allow this;
       see the description of the _H_I_S_T_F_I_L_E environment variable.

   CCoommmmaanndd LLiinnee EEddiittiinngg
       When _s_h is being used interactively from a terminal, the current
       command and the command history (see _f_c) can be edited using _v_i-mode
       command line editing. This mode uses commands, described below, similar
       to a subset of those described in the _v_i utility. Implementations may
       offer other command line editing modes corresponding to other editing
       utilities.

       The command _s_e_t −−oo _v_i shall enable _v_i-mode editing and place _s_h into _v_i
       insert mode (see _C_o_m_m_a_n_d _L_i_n_e _E_d_i_t_i_n_g _(_v_i_-_m_o_d_e_)).  This command also
       shall disable any other editing mode that the implementation may
       provide. The command _s_e_t ++oo _v_i disables _v_i-mode editing.

       Certain block-mode terminals may be unable to support shell command
       line editing. If a terminal is unable to provide either edit mode, it
       need not be possible to _s_e_t −−oo _v_i when using the shell on this
       terminal.

       In the following sections, the characters _e_r_a_s_e, _i_n_t_e_r_r_u_p_t, _k_i_l_l, and
       _e_n_d_-_o_f_-_f_i_l_e are those set by the _s_t_t_y utility.

   CCoommmmaanndd LLiinnee EEddiittiinngg ((vvii--mmooddee))
       In _v_i editing mode, there shall be a distinguished line, the edit line.
       All the editing operations which modify a line affect the edit line.
       The edit line is always the newest line in the command history buffer.

       With _v_i-mode enabled, _s_h can be switched between insert mode and
       command mode.

       When in insert mode, an entered character shall be inserted into the
       command line, except as noted in _v_i _L_i_n_e _E_d_i_t_i_n_g _I_n_s_e_r_t _M_o_d_e.  Upon
       entering _s_h and after termination of the previous command, _s_h shall be
       in insert mode.

       Typing an escape character shall switch _s_h into command mode (see _v_i
       _L_i_n_e _E_d_i_t_i_n_g _C_o_m_m_a_n_d _M_o_d_e).  In command mode, an entered character
       shall either invoke a defined operation, be used as part of a multi-
       character operation, or be treated as an error. A character that is not
       recognized as part of an editing command shall terminate any specific
       editing command and shall alert the terminal. If _s_h receives a SIGINT
       signal in command mode (whether generated by typing the _i_n_t_e_r_r_u_p_t
       character or by other means), it shall terminate command line editing
       on the current command line, reissue the prompt on the next line of the
       terminal, and reset the command history (see _f_c) so that the most
       recently executed command is the previous command (that is, the command
       that was being edited when it was interrupted is not re-entered into
       the history).

       In the following sections, the phrase ``move the cursor to the
       beginning of the word'' shall mean ``move the cursor to the first
       character of the current word'' and the phrase ``move the cursor to the
       end of the word'' shall mean ``move the cursor to the last character of
       the current word''. The phrase ``beginning of the command line''
       indicates the point between the end of the prompt string issued by the
       shell (or the beginning of the terminal line, if there is no prompt
       string) and the first character of the command text.

   vvii LLiinnee EEddiittiinngg IInnsseerrtt MMooddee
       While in insert mode, any character typed shall be inserted in the
       current command line, unless it is from the following set.

       <newline> Execute the current command line. If the current command line
                 is not empty, this line shall be entered into the command
                 history (see _f_c).

       _e_r_a_s_e     Delete the character previous to the current cursor position
                 and move the current cursor position back one character. In
                 insert mode, characters shall be erased from both the screen
                 and the buffer when backspacing.

       _i_n_t_e_r_r_u_p_t If _s_h receives a SIGINT signal in insert mode (whether
                 generated by typing the _i_n_t_e_r_r_u_p_t character or by other
                 means), it shall terminate command line editing with the same
                 effects as described for interrupting command mode; see
                 _C_o_m_m_a_n_d _L_i_n_e _E_d_i_t_i_n_g _(_v_i_-_m_o_d_e_).

       _k_i_l_l      Clear all the characters from the input line.

       <control>‐V
                 Insert the next character input, even if the character is
                 otherwise a special insert mode character.

       <control>‐W
                 Delete the characters from the one preceding the cursor to
                 the preceding word boundary. The word boundary in this case
                 is the closer to the cursor of either the beginning of the
                 line or a character that is in neither the bbllaannkk nor ppuunncctt
                 character classification of the current locale.

       _e_n_d_-_o_f_-_f_i_l_e
                 Interpreted as the end of input in _s_h.  This interpretation
                 shall occur only at the beginning of an input line. If
                 _e_n_d_-_o_f_-_f_i_l_e is entered other than at the beginning of the
                 line, the results are unspecified.

       <ESC>     Place _s_h into command mode.

   vvii LLiinnee EEddiittiinngg CCoommmmaanndd MMooddee
       In command mode for the command line editing feature, decimal digits
       not beginning with 0 that precede a command letter shall be remembered.
       Some commands use these decimal digits as a count number that affects
       the operation.

       The term _m_o_t_i_o_n _c_o_m_m_a_n_d represents one of the commands:


           <<ssppaaccee>>  00  bb  FF  ll  WW  ^^  $$  ;;  EE  ff  TT  ww  ||  ,,  BB  ee  hh  tt

       If the current line is not the edit line, any command that modifies the
       current line shall cause the content of the current line to replace the
       content of the edit line, and the current line shall become the edit
       line. This replacement cannot be undone (see the uu and UU commands
       below). The modification requested shall then be performed to the edit
       line. When the current line is the edit line, the modification shall be
       done directly to the edit line.

       Any command that is preceded by _c_o_u_n_t shall take a count (the numeric
       value of any preceding decimal digits). Unless otherwise noted, this
       count shall cause the specified operation to repeat by the number of
       times specified by the count.  Also unless otherwise noted, a _c_o_u_n_t
       that is out of range is considered an error condition and shall alert
       the terminal, but neither the cursor position, nor the command line,
       shall change.

       The terms _w_o_r_d and _b_i_g_w_o_r_d are used as defined in the _v_i description.
       The term _s_a_v_e _b_u_f_f_e_r corresponds to the term _u_n_n_a_m_e_d _b_u_f_f_e_r in _v_i.

       The following commands shall be recognized in command mode:

       <newline> Execute the current command line. If the current command line
                 is not empty, this line shall be entered into the command
                 history (see _f_c).

       <control>‐L
                 Redraw the current command line. Position the cursor at the
                 same location on the redrawn line.

       ##         Insert the character ''##'' at the beginning of the current
                 command line and treat the resulting edit line as a comment.
                 This line shall be entered into the command history; see _f_c.

       ==         Display the possible shell word expansions (see _S_e_c_t_i_o_n _2_._6,
                 _W_o_r_d _E_x_p_a_n_s_i_o_n_s) of the bigword at the current command line
                 position.

                 NNoottee::     This does not modify the content of the current
                           line, and therefore does not cause the current line
                           to become the edit line.

                 These expansions shall be displayed on subsequent terminal
                 lines. If the bigword contains none of the characters ''??'',
                 ''**'', or ''[['', an <asterisk> (''**'') shall be implicitly assumed
                 at the end. If any directories are matched, these expansions
                 shall have a ''//'' character appended. After the expansion, the
                 line shall be redrawn, the cursor repositioned at the current
                 cursor position, and _s_h shall be placed in command mode.

       \\         Perform pathname expansion (see _S_e_c_t_i_o_n _2_._6_._6, _P_a_t_h_n_a_m_e
                 _E_x_p_a_n_s_i_o_n) on the current bigword, up to the largest set of
                 characters that can be matched uniquely. If the bigword
                 contains none of the characters ''??'', ''**'', or ''[['', an
                 <asterisk> (''**'') shall be implicitly assumed at the end. This
                 maximal expansion then shall replace the original bigword in
                 the command line, and the cursor shall be placed after this
                 expansion. If the resulting bigword completely and uniquely
                 matches a directory, a ''//'' character shall be inserted
                 directly after the bigword. If some other file is completely
                 matched, a single <space> shall be inserted after the
                 bigword. After this operation, _s_h shall be placed in insert
                 mode.

       **         Perform pathname expansion on the current bigword and insert
                 all expansions into the command to replace the current
                 bigword, with each expansion separated by a single <space>.
                 If at the end of the line, the current cursor position shall
                 be moved to the first column position following the
                 expansions and _s_h shall be placed in insert mode. Otherwise,
                 the current cursor position shall be the last column position
                 of the first character after the expansions and _s_h shall be
                 placed in insert mode. If the current bigword contains none
                 of the characters ''??'', ''**'', or ''[['', before the operation, an
                 <asterisk> (''**'') shall be implicitly assumed at the end.

       @@_l_e_t_t_e_r   Insert the value of the alias named ___l_e_t_t_e_r.  The symbol
                 _l_e_t_t_e_r represents a single alphabetic character from the
                 portable character set; implementations may support
                 additional characters as an extension. If the alias ___l_e_t_t_e_r
                 contains other editing commands, these commands shall be
                 performed as part of the insertion. If no alias ___l_e_t_t_e_r is
                 enabled, this command shall have no effect.

       [[_c_o_u_n_t]]~~  Convert, if the current character is a lowercase letter, to
                 the equivalent uppercase letter and _v_i_c_e _v_e_r_s_a, as prescribed
                 by the current locale. The current cursor position then shall
                 be advanced by one character. If the cursor was positioned on
                 the last character of the line, the case conversion shall
                 occur, but the cursor shall not advance. If the ''~~'' command
                 is preceded by a _c_o_u_n_t, that number of characters shall be
                 converted, and the cursor shall be advanced to the character
                 position after the last character converted.  If the _c_o_u_n_t is
                 larger than the number of characters after the cursor, this
                 shall not be considered an error; the cursor shall advance to
                 the last character on the line.

       [[_c_o_u_n_t]]..  Repeat the most recent non-motion command, even if it was
                 executed on an earlier command line. If the previous command
                 was preceded by a _c_o_u_n_t, and no count is given on the ''..''
                 command, the count from the previous command shall be
                 included as part of the repeated command. If the ''..'' command
                 is preceded by a _c_o_u_n_t, this shall override any _c_o_u_n_t
                 argument to the previous command. The _c_o_u_n_t specified in the
                 ''..'' command shall become the count for subsequent ''..''
                 commands issued without a count.

       [[_n_u_m_b_e_r]]vv Invoke the _v_i editor to edit the current command line in a
                 temporary file. When the editor exits, the commands in the
                 temporary file shall be executed and placed in the command
                 history. If a _n_u_m_b_e_r is included, it specifies the command
                 number in the command history to be edited, rather than the
                 current command line.

       [[_c_o_u_n_t]]ll   (ell)

       [[_c_o_u_n_t]]<space>
                 Move the current cursor position to the next character
                 position. If the cursor was positioned on the last character
                 of the line, the terminal shall be alerted and the cursor
                 shall not be advanced. If the _c_o_u_n_t is larger than the number
                 of characters after the cursor, this shall not be considered
                 an error; the cursor shall advance to the last character on
                 the line.

       [[_c_o_u_n_t]]hh  Move the current cursor position to the _c_o_u_n_tth (default 1)
                 previous character position. If the cursor was positioned on
                 the first character of the line, the terminal shall be
                 alerted and the cursor shall not be moved. If the count is
                 larger than the number of characters before the cursor, this
                 shall not be considered an error; the cursor shall move to
                 the first character on the line.

       [[_c_o_u_n_t]]ww  Move to the start of the next word. If the cursor was
                 positioned on the last character of the line, the terminal
                 shall be alerted and the cursor shall not be advanced. If the
                 _c_o_u_n_t is larger than the number of words after the cursor,
                 this shall not be considered an error; the cursor shall
                 advance to the last character on the line.

       [[_c_o_u_n_t]]WW  Move to the start of the next bigword. If the cursor was
                 positioned on the last character of the line, the terminal
                 shall be alerted and the cursor shall not be advanced. If the
                 _c_o_u_n_t is larger than the number of bigwords after the cursor,
                 this shall not be considered an error; the cursor shall
                 advance to the last character on the line.

       [[_c_o_u_n_t]]ee  Move to the end of the current word. If at the end of a word,
                 move to the end of the next word. If the cursor was
                 positioned on the last character of the line, the terminal
                 shall be alerted and the cursor shall not be advanced. If the
                 _c_o_u_n_t is larger than the number of words after the cursor,
                 this shall not be considered an error; the cursor shall
                 advance to the last character on the line.

       [[_c_o_u_n_t]]EE  Move to the end of the current bigword. If at the end of a
                 bigword, move to the end of the next bigword. If the cursor
                 was positioned on the last character of the line, the
                 terminal shall be alerted and the cursor shall not be
                 advanced. If the _c_o_u_n_t is larger than the number of bigwords
                 after the cursor, this shall not be considered an error; the
                 cursor shall advance to the last character on the line.

       [[_c_o_u_n_t]]bb  Move to the beginning of the current word. If at the
                 beginning of a word, move to the beginning of the previous
                 word. If the cursor was positioned on the first character of
                 the line, the terminal shall be alerted and the cursor shall
                 not be moved. If the _c_o_u_n_t is larger than the number of words
                 preceding the cursor, this shall not be considered an error;
                 the cursor shall return to the first character on the line.

       [[_c_o_u_n_t]]BB  Move to the beginning of the current bigword. If at the
                 beginning of a bigword, move to the beginning of the previous
                 bigword. If the cursor was positioned on the first character
                 of the line, the terminal shall be alerted and the cursor
                 shall not be moved. If the _c_o_u_n_t is larger than the number of
                 bigwords preceding the cursor, this shall not be considered
                 an error; the cursor shall return to the first character on
                 the line.

       ^^         Move the current cursor position to the first character on
                 the input line that is not a <blank>.

       $$         Move to the last character position on the current command
                 line.

       00         (Zero.) Move to the first character position on the current
                 command line.

       [[_c_o_u_n_t]]||  Move to the _c_o_u_n_tth character position on the current command
                 line. If no number is specified, move to the first position.
                 The first character position shall be numbered 1. If the
                 count is larger than the number of characters on the line,
                 this shall not be considered an error; the cursor shall be
                 placed on the last character on the line.

       [[_c_o_u_n_t]]ff_c Move to the first occurrence of the character ''cc'' that occurs
                 after the current cursor position. If the cursor was
                 positioned on the last character of the line, the terminal
                 shall be alerted and the cursor shall not be advanced. If the
                 character ''cc'' does not occur in the line after the current
                 cursor position, the terminal shall be alerted and the cursor
                 shall not be moved.

       [[_c_o_u_n_t]]FF_c Move to the first occurrence of the character ''cc'' that occurs
                 before the current cursor position. If the cursor was
                 positioned on the first character of the line, the terminal
                 shall be alerted and the cursor shall not be moved. If the
                 character ''cc'' does not occur in the line before the current
                 cursor position, the terminal shall be alerted and the cursor
                 shall not be moved.

       [[_c_o_u_n_t]]tt_c Move to the character before the first occurrence of the
                 character ''cc'' that occurs after the current cursor position.
                 If the cursor was positioned on the last character of the
                 line, the terminal shall be alerted and the cursor shall not
                 be advanced. If the character ''cc'' does not occur in the line
                 after the current cursor position, the terminal shall be
                 alerted and the cursor shall not be moved.

       [[_c_o_u_n_t]]TT_c Move to the character after the first occurrence of the
                 character ''cc'' that occurs before the current cursor position.
                 If the cursor was positioned on the first character of the
                 line, the terminal shall be alerted and the cursor shall not
                 be moved. If the character ''cc'' does not occur in the line
                 before the current cursor position, the terminal shall be
                 alerted and the cursor shall not be moved.

       [[_c_o_u_n_t]];;  Repeat the most recent ff, FF, tt, or TT command. Any number
                 argument on that previous command shall be ignored. Errors
                 are those described for the repeated command.

       [[_c_o_u_n_t]],,  Repeat the most recent ff, FF, tt, or TT command. Any number
                 argument on that previous command shall be ignored. However,
                 reverse the direction of that command.

       aa         Enter insert mode after the current cursor position.
                 Characters that are entered shall be inserted before the next
                 character.

       AA         Enter insert mode after the end of the current command line.

       ii         Enter insert mode at the current cursor position. Characters
                 that are entered shall be inserted before the current
                 character.

       II         Enter insert mode at the beginning of the current command
                 line.

       RR         Enter insert mode, replacing characters from the command line
                 beginning at the current cursor position.

       [[_c_o_u_n_t]]cc_m_o_t_i_o_n
                 Delete the characters between the current cursor position and
                 the cursor position that would result from the specified
                 motion command. Then enter insert mode before the first
                 character following any deleted characters. If _c_o_u_n_t is
                 specified, it shall be applied to the motion command. A _c_o_u_n_t
                 shall be ignored for the following motion commands:


                     00    ^^    $$    cc

                 If the motion command is the character ''cc'', the current
                 command line shall be cleared and insert mode shall be
                 entered. If the motion command would move the current cursor
                 position toward the beginning of the command line, the
                 character under the current cursor position shall not be
                 deleted. If the motion command would move the current cursor
                 position toward the end of the command line, the character
                 under the current cursor position shall be deleted.  If the
                 _c_o_u_n_t is larger than the number of characters between the
                 current cursor position and the end of the command line
                 toward which the motion command would move the cursor, this
                 shall not be considered an error; all of the remaining
                 characters in the aforementioned range shall be deleted and
                 insert mode shall be entered. If the motion command is
                 invalid, the terminal shall be alerted, the cursor shall not
                 be moved, and no text shall be deleted.

       CC         Delete from the current character to the end of the line and
                 enter insert mode at the new end-of-line.

       SS         Clear the entire edit line and enter insert mode.

       [[_c_o_u_n_t]]rr_c Replace the current character with the character ''cc''.  With a
                 number _c_o_u_n_t, replace the current and the following _c_o_u_n_t−1
                 characters. After this command, the current cursor position
                 shall be on the last character that was changed. If the _c_o_u_n_t
                 is larger than the number of characters after the cursor,
                 this shall not be considered an error; all of the remaining
                 characters shall be changed.

       [[_c_o_u_n_t]]__  Append a <space> after the current character position and
                 then append the last bigword in the previous input line after
                 the <space>.  Then enter insert mode after the last character
                 just appended. With a number _c_o_u_n_t, append the _c_o_u_n_tth
                 bigword in the previous line.

       [[_c_o_u_n_t]]xx  Delete the character at the current cursor position and place
                 the deleted characters in the save buffer. If the cursor was
                 positioned on the last character of the line, the character
                 shall be deleted and the cursor position shall be moved to
                 the previous character (the new last character). If the _c_o_u_n_t
                 is larger than the number of characters after the cursor,
                 this shall not be considered an error; all the characters
                 from the cursor to the end of the line shall be deleted.

       [[_c_o_u_n_t]]XX  Delete the character before the current cursor position and
                 place the deleted characters in the save buffer. The
                 character under the current cursor position shall not change.
                 If the cursor was positioned on the first character of the
                 line, the terminal shall be alerted, and the XX command shall
                 have no effect. If the line contained a single character, the
                 XX command shall have no effect. If the line contained no
                 characters, the terminal shall be alerted and the cursor
                 shall not be moved. If the _c_o_u_n_t is larger than the number of
                 characters before the cursor, this shall not be considered an
                 error; all the characters from before the cursor to the
                 beginning of the line shall be deleted.

       [[_c_o_u_n_t]]dd_m_o_t_i_o_n
                 Delete the characters between the current cursor position and
                 the character position that would result from the motion
                 command. A number _c_o_u_n_t repeats the motion command _c_o_u_n_t
                 times. If the motion command would move toward the beginning
                 of the command line, the character under the current cursor
                 position shall not be deleted. If the motion command is dd,
                 the entire current command line shall be cleared. If the
                 _c_o_u_n_t is larger than the number of characters between the
                 current cursor position and the end of the command line
                 toward which the motion command would move the cursor, this
                 shall not be considered an error; all of the remaining
                 characters in the aforementioned range shall be deleted. The
                 deleted characters shall be placed in the save buffer.

       DD         Delete all characters from the current cursor position to the
                 end of the line. The deleted characters shall be placed in
                 the save buffer.

       [[_c_o_u_n_t]]yy_m_o_t_i_o_n
                 Yank (that is, copy) the characters from the current cursor
                 position to the position resulting from the motion command
                 into the save buffer. A number _c_o_u_n_t shall be applied to the
                 motion command. If the motion command would move toward the
                 beginning of the command line, the character under the
                 current cursor position shall not be included in the set of
                 yanked characters. If the motion command is yy, the entire
                 current command line shall be yanked into the save buffer.
                 The current cursor position shall be unchanged. If the _c_o_u_n_t
                 is larger than the number of characters between the current
                 cursor position and the end of the command line toward which
                 the motion command would move the cursor, this shall not be
                 considered an error; all of the remaining characters in the
                 aforementioned range shall be yanked.

       YY         Yank the characters from the current cursor position to the
                 end of the line into the save buffer. The current character
                 position shall be unchanged.

       [[_c_o_u_n_t]]pp  Put a copy of the current contents of the save buffer after
                 the current cursor position. The current cursor position
                 shall be advanced to the last character put from the save
                 buffer. A _c_o_u_n_t shall indicate how many copies of the save
                 buffer shall be put.

       [[_c_o_u_n_t]]PP  Put a copy of the current contents of the save buffer before
                 the current cursor position. The current cursor position
                 shall be moved to the last character put from the save
                 buffer. A _c_o_u_n_t shall indicate how many copies of the save
                 buffer shall be put.

       uu         Undo the last command that changed the edit line. This
                 operation shall not undo the copy of any command line to the
                 edit line.

       UU         Undo all changes made to the edit line. This operation shall
                 not undo the copy of any command line to the edit line.

       [[_c_o_u_n_t]]kk

       [[_c_o_u_n_t]]−−  Set the current command line to be the _c_o_u_n_tth previous
                 command line in the shell command history. If _c_o_u_n_t is not
                 specified, it shall default to 1. The cursor shall be
                 positioned on the first character of the new command. If a kk
                 or −− command would retreat past the maximum number of
                 commands in effect for this shell (affected by the _H_I_S_T_S_I_Z_E
                 environment variable), the terminal shall be alerted, and the
                 command shall have no effect.

       [[_c_o_u_n_t]]jj

       [[_c_o_u_n_t]]++  Set the current command line to be the _c_o_u_n_tth next command
                 line in the shell command history. If _c_o_u_n_t is not specified,
                 it shall default to 1. The cursor shall be positioned on the
                 first character of the new command. If a jj or ++ command
                 advances past the edit line, the current command line shall
                 be restored to the edit line and the terminal shall be
                 alerted.

       [[_n_u_m_b_e_r]]GG Set the current command line to be the oldest command line
                 stored in the shell command history. With a number _n_u_m_b_e_r,
                 set the current command line to be the command line _n_u_m_b_e_r in
                 the history. If command line _n_u_m_b_e_r does not exist, the
                 terminal shall be alerted and the command line shall not be
                 changed.

       //_p_a_t_t_e_r_n<newline>
                 Move backwards through the command history, searching for the
                 specified pattern, beginning with the previous command line.
                 Patterns use the pattern matching notation described in
                 _S_e_c_t_i_o_n _2_._1_3, _P_a_t_t_e_r_n _M_a_t_c_h_i_n_g _N_o_t_a_t_i_o_n, except that the ''^^''
                 character shall have special meaning when it appears as the
                 first character of _p_a_t_t_e_r_n.  In this case, the ''^^'' is
                 discarded and the characters after the ''^^'' shall be matched
                 only at the beginning of a line. Commands in the command
                 history shall be treated as strings, not as filenames. If the
                 pattern is not found, the current command line shall be
                 unchanged and the terminal is alerted. If it is found in a
                 previous line, the current command line shall be set to that
                 line and the cursor shall be set to the first character of
                 the new command line.

                 If _p_a_t_t_e_r_n is empty, the last non-empty pattern provided to //
                 or ??  shall be used. If there is no previous non-empty
                 pattern, the terminal shall be alerted and the current
                 command line shall remain unchanged.

       ??_p_a_t_t_e_r_n<newline>
                 Move forwards through the command history, searching for the
                 specified pattern, beginning with the next command line.
                 Patterns use the pattern matching notation described in
                 _S_e_c_t_i_o_n _2_._1_3, _P_a_t_t_e_r_n _M_a_t_c_h_i_n_g _N_o_t_a_t_i_o_n, except that the ''^^''
                 character shall have special meaning when it appears as the
                 first character of _p_a_t_t_e_r_n.  In this case, the ''^^'' is
                 discarded and the characters after the ''^^'' shall be matched
                 only at the beginning of a line. Commands in the command
                 history shall be treated as strings, not as filenames. If the
                 pattern is not found, the current command line shall be
                 unchanged and the terminal alerted. If it is found in a
                 following line, the current command line shall be set to that
                 line and the cursor shall be set to the fist character of the
                 new command line.

                 If _p_a_t_t_e_r_n is empty, the last non-empty pattern provided to //
                 or ??  shall be used. If there is no previous non-empty
                 pattern, the terminal shall be alerted and the current
                 command line shall remain unchanged.

       nn         Repeat the most recent // or ??  command. If there is no
                 previous // or ??, the terminal shall be alerted and the
                 current command line shall remain unchanged.

       NN         Repeat the most recent // or ??  command, reversing the
                 direction of the search. If there is no previous // or ??, the
                 terminal shall be alerted and the current command line shall
                 remain unchanged.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

           0   The script to be executed consisted solely of zero or more
               blank lines or comments, or both.

       1‐125   A non-interactive shell detected an error other than
               _c_o_m_m_a_n_d___f_i_l_e not found, including but not limited to syntax,
               redirection, or variable assignment errors.

         127   A specified _c_o_m_m_a_n_d___f_i_l_e could not be found by a non-
               interactive shell.

       Otherwise, the shell shall return the exit status of the last command
       it invoked or attempted to invoke (see also the _e_x_i_t utility in _S_e_c_t_i_o_n
       _2_._1_4, _S_p_e_c_i_a_l _B_u_i_l_t_-_I_n _U_t_i_l_i_t_i_e_s).

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       See _S_e_c_t_i_o_n _2_._8_._1, _C_o_n_s_e_q_u_e_n_c_e_s _o_f _S_h_e_l_l _E_r_r_o_r_s.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Standard input and standard error are the files that determine whether
       a shell is interactive when −−ii is not specified. For example:


           sshh >> ffiillee

       and:


           sshh 22>> ffiillee

       create interactive and non-interactive shells, respectively. Although
       both accept terminal input, the results of error conditions are
       different, as described in _S_e_c_t_i_o_n _2_._8_._1, _C_o_n_s_e_q_u_e_n_c_e_s _o_f _S_h_e_l_l _E_r_r_o_r_s;
       in the second example a redirection error encountered by a special
       built-in utility aborts the shell.

       A conforming application must protect its first operand, if it starts
       with a <plus-sign>, by preceding it with the ""−−−−"" argument that denotes
       the end of the options.

       Applications should note that the standard _P_A_T_H to the shell cannot be
       assumed to be either //bbiinn//sshh or //uussrr//bbiinn//sshh, and should be determined
       by interrogation of the _P_A_T_H returned by _g_e_t_c_o_n_f _P_A_T_H, ensuring that
       the returned pathname is an absolute pathname and not a shell built-in.

       For example, to determine the location of the standard _s_h utility:


           ccoommmmaanndd −−vv sshh

       On some implementations this might return:


           //uussrr//xxppgg44//bbiinn//sshh

       Furthermore, on systems that support executable scripts (the ""##!!""
       construct), it is recommended that applications using executable
       scripts install them using _g_e_t_c_o_n_f _P_A_T_H to determine the shell pathname
       and update the ""##!!"" script appropriately as it is being installed (for
       example, with _s_e_d).  For example:


           ##
           ## IInnssttaallllaattiioonn ttiimmee ssccrriipptt ttoo iinnssttaallll ccoorrrreecctt PPOOSSIIXX sshheellll ppaatthhnnaammee
           ##
           ## GGeett lliisstt ooff ppaatthhss ttoo cchheecckk
           ##
           SSiiffss==$$IIFFSS
           SSiiffss__sseett==$${{IIFFSS++yy}}
           IIFFSS==::
           sseett −−−− $$((ggeettccoonnff PPAATTHH))
           iiff [[ ""$$SSiiffss__sseett"" == yy ]]
           tthheenn
               IIFFSS==$$SSiiffss
           eellssee
               uunnsseett IIFFSS
           ffii
           ##
           ## CChheecckk eeaacchh ppaatthh ffoorr ''sshh''
           ##
           ffoorr ii
           ddoo
               iiff [[ −−xx ""$${{ii}}""//sshh ]]
               tthheenn
                   PPsshheellll==$${{ii}}//sshh
               ffii
           ddoonnee
           ##
           ## TThhiiss iiss tthhee lliisstt ooff ssccrriippttss ttoo uuppddaattee.. TThheeyy sshhoouulldd bbee ooff tthhee
           ## ffoorrmm ''$${{nnaammee}}..ssoouurrccee'' aanndd wwiillll bbee ttrraannssffoorrmmeedd ttoo ''$${{nnaammee}}''..
           ## EEaacchh ssccrriipptt sshhoouulldd bbeeggiinn::
           ##
           ## ##!!IINNSSTTAALLLLSSHHEELLLLPPAATTHH
           ##
           ssccrriippttss==""aa bb cc""
           ##
           ## TTrraannssffoorrmm eeaacchh ssccrriipptt
           ##
           ffoorr ii iinn $${{ssccrriippttss}}
           ddoo
               sseedd −−ee ""ss||IINNSSTTAALLLLSSHHEELLLLPPAATTHH||$${{PPsshheellll}}||"" << $${{ii}}..ssoouurrccee >> $${{ii}}
           ddoonnee

EEXXAAMMPPLLEESS
        1. Execute a shell command from a string:


               sshh −−cc ""ccaatt mmyyffiillee""

        2. Execute a shell script from a file in the current directory:


               sshh mmyy__sshheellll__ccmmddss

RRAATTIIOONNAALLEE
       The _s_h utility and the _s_e_t special built-in utility share a common set
       of options.

       The name _I_F_S was originally an abbreviation of ``Input Field
       Separators''; however, this name is misleading as the _I_F_S characters
       are actually used as field terminators. The KornShell ignores the
       contents of _I_F_S upon entry to the script. A conforming application
       cannot rely on importing _I_F_S.  One justification for this, beyond
       security considerations, is to assist possible future shell compilers.
       Allowing _I_F_S to be imported from the environment prevents many
       optimizations that might otherwise be performed via dataflow analysis
       of the script itself.

       The text in the STDIN section about non-blocking reads concerns an
       instance of _s_h that has been invoked, probably by a C-language program,
       with standard input that has been opened using the O_NONBLOCK flag; see
       _o_p_e_n() in the System Interfaces volume of POSIX.1‐2008. If the shell
       did not reset this flag, it would immediately terminate because no
       input data would be available yet and that would be considered the same
       as end-of-file.

       The options associated with a _r_e_s_t_r_i_c_t_e_d _s_h_e_l_l (command name _r_s_h and
       the −−rr option) were excluded because the standard developers considered
       that the implied level of security could not be achieved and they did
       not want to raise false expectations.

       On systems that support set-user-ID scripts, a historical trapdoor has
       been to link a script to the name −−ii.  When it is called by a sequence
       such as:


           sshh −−

       or by:


           ##!!  uussrr//bbiinn//sshh  −−

       the historical systems have assumed that no option letters follow.
       Thus, this volume of POSIX.1‐2008 allows the single <hyphen> to mark
       the end of the options, in addition to the use of the regular ""−−−−""
       argument, because it was considered that the older practice was so
       pervasive. An alternative approach is taken by the KornShell, where
       real and effective user/group IDs must match for an interactive shell;
       this behavior is specifically allowed by this volume of POSIX.1‐2008.

       NNoottee::     There are other problems with set-user-ID scripts that the
                 two approaches described here do not resolve.

       The initialization process for the history file can be dependent on the
       system start-up files, in that they may contain commands that
       effectively preempt the user's settings of _H_I_S_T_F_I_L_E and _H_I_S_T_S_I_Z_E.  For
       example, function definition commands are recorded in the history file,
       unless the _s_e_t −−oo _n_o_l_o_g option is set. If the system administrator
       includes function definitions in some system start-up file called
       before the _E_N_V file, the history file is initialized before the user
       gets a chance to influence its characteristics. In some historical
       shells, the history file is initialized just after the _E_N_V file has
       been processed. Therefore, it is implementation-defined whether changes
       made to _H_I_S_T_F_I_L_E after the history file has been initialized are
       effective.

       The default messages for the various _M_A_I_L-related messages are
       unspecified because they vary across implementations.  Typical messages
       are:


           ""yyoouu hhaavvee mmaaiill\\nn""

       or:


           ""yyoouu hhaavvee nneeww mmaaiill\\nn""

       It is important that the descriptions of command line editing refer to
       the same shell as that in POSIX.1‐2008 so that interactive users can
       also be application programmers without having to deal with
       programmatic differences in their two environments. It is also
       essential that the utility name _s_h be specified because this explicit
       utility name is too firmly rooted in historical practice of application
       programs for it to change.

       Consideration was given to mandating a diagnostic message when
       attempting to set _v_i-mode on terminals that do not support command line
       editing. However, it is not historical practice for the shell to be
       cognizant of all terminal types and thus be able to detect
       inappropriate terminals in all cases.  Implementations are encouraged
       to supply diagnostics in this case whenever possible, rather than
       leaving the user in a state where editing commands work incorrectly.

       In early proposals, the KornShell-derived _e_m_a_c_s mode of command line
       editing was included, even though the _e_m_a_c_s editor itself was not. The
       community of _e_m_a_c_s proponents was adamant that the full _e_m_a_c_s editor
       not be standardized because they were concerned that an attempt to
       standardize this very powerful environment would encourage vendors to
       ship strictly conforming versions lacking the extensibility required by
       the community. The author of the original _e_m_a_c_s program also expressed
       his desire to omit the program. Furthermore, there were a number of
       historical systems that did not include _e_m_a_c_s, or included it without
       supporting it, but there were very few that did not include and support
       _v_i.  The shell _e_m_a_c_s command line editing mode was finally omitted
       because it became apparent that the KornShell version and the editor
       being distributed with the GNU system had diverged in some respects.
       The author of _e_m_a_c_s requested that the POSIX _e_m_a_c_s mode either be
       deleted or have a significant number of unspecified conditions.
       Although the KornShell author agreed to consider changes to bring the
       shell into alignment, the standard developers decided to defer
       specification at that time. At the time, it was assumed that
       convergence on an acceptable definition would occur for a subsequent
       draft, but that has not happened, and there appears to be no impetus to
       do so. In any case, implementations are free to offer additional
       command line editing modes based on the exact models of editors their
       users are most comfortable with.

       Early proposals had the following list entry in _v_i _L_i_n_e _E_d_i_t_i_n_g _I_n_s_e_r_t
       _M_o_d_e:

       \     If followed by the _e_r_a_s_e or _k_i_l_l character, that character shall
             be inserted into the input line.  Otherwise, the <backslash>
             itself shall be inserted into the input line.

       However, this is not actually a feature of _s_h command line editing
       insert mode, but one of some historical terminal line drivers. Some
       conforming implementations continue to do this when the _s_t_t_y iieexxtteenn
       flag is set.

       In interactive shells, SIGTERM is ignored so that _k_i_l_l _0 does not kill
       the shell, and SIGINT is caught so that _w_a_i_t is interruptible. If the
       shell does not ignore SIGTTIN, SIGTTOU, and SIGTSTP signals when it is
       interactive and the −−mm option is not in effect, these signals suspend
       the shell if it is not a session leader. If it is a session leader, the
       signals are discarded if they would stop the process, as required by
       the System Interfaces volume of POSIX.1‐2008, _S_e_c_t_i_o_n _2_._4_._3, _S_i_g_n_a_l
       _A_c_t_i_o_n_s for orphaned process groups.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e, _c_d, _e_c_h_o, _e_x_i_t, _f_c, _p_w_d, _i_n_v_a_l_i_d,
       _s_e_t, _s_t_t_y, _t_e_s_t, _t_r_a_p, _u_m_a_s_k, _v_i

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _d_u_p(), _e_x_e_c, _e_x_i_t(),
       _f_o_r_k(), _o_p_e_n(), _p_i_p_e(), _s_i_g_n_a_l(), _s_y_s_t_e_m(), _u_l_i_m_i_t(), _u_m_a_s_k(), _w_a_i_t()

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



IEEE/The Open Group                  2013                               SH(1P)
