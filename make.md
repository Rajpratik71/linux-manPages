MAKE(1P)                   POSIX Programmer's Manual                  MAKE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       make — maintain, update, and regenerate groups of programs
       (DDEEVVEELLOOPPMMEENNTT)

SSYYNNOOPPSSIISS
       make [[−einpqrst]] [[−f _m_a_k_e_f_i_l_e]]... [[−k|−S]] [[_m_a_c_r_o=_v_a_l_u_e...]]
           [[_t_a_r_g_e_t___n_a_m_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _m_a_k_e utility shall update files that are derived from other files.
       A typical case is one where object files are derived from the
       corresponding source files. The _m_a_k_e utility examines time
       relationships and shall update those derived files (called targets)
       that have modified times earlier than the modified times of the files
       (called prerequisites) from which they are derived.  A description file
       (makefile) contains a description of the relationships between files,
       and the commands that need to be executed to update the targets to
       reflect changes in their prerequisites. Each specification, or rule,
       shall consist of a target, optional prerequisites, and optional
       commands to be executed when a prerequisite is newer than the target.
       There are two types of rule:

        1. _I_n_f_e_r_e_n_c_e _r_u_l_e_s, which have one target name with at least one
           <period> (''..'') and no <slash> (''//'')

        2. _T_a_r_g_e_t _r_u_l_e_s, which can have more than one target name

       In addition, _m_a_k_e shall have a collection of built-in macros and
       inference rules that infer prerequisite relationships to simplify
       maintenance of programs.

       To receive exactly the behavior described in this section, the user
       shall ensure that a portable makefile shall:

        *  Include the special target ..PPOOSSIIXX

        *  Omit any special target reserved for implementations (a leading
           period followed by uppercase letters) that has not been specified
           by this section

       The behavior of _m_a_k_e is unspecified if either or both of these
       conditions are not met.

OOPPTTIIOONNSS
       The _m_a_k_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except for
       Guideline 9.

       The following options shall be supported:

       −−ee        Cause environment variables, including those with null
                 values, to override macro assignments within makefiles.

       −−ff  _m_a_k_e_f_i_l_e
                 Specify a different makefile. The argument _m_a_k_e_f_i_l_e is a
                 pathname of a description file, which is also referred to as
                 the _m_a_k_e_f_i_l_e.  A pathname of ''−−'' shall denote the standard
                 input. There can be multiple instances of this option, and
                 they shall be processed in the order specified. The effect of
                 specifying the same option-argument more than once is
                 unspecified.

       −−ii        Ignore error codes returned by invoked commands. This mode is
                 the same as if the special target ..IIGGNNOORREE were specified
                 without prerequisites.

       −−kk        Continue to update other targets that do not depend on the
                 current target if a non-ignored error occurs while executing
                 the commands to bring a target up-to-date.

       −−nn        Write commands that would be executed on standard output, but
                 do not execute them. However, lines with a <plus-sign> (''++'')
                 prefix shall be executed. In this mode, lines with an at-sign
                 (''@@'') character prefix shall be written to standard output.

       −−pp        Write to standard output the complete set of macro
                 definitions and target descriptions. The output format is
                 unspecified.

       −−qq        Return a zero exit value if the target file is up-to-date;
                 otherwise, return an exit value of 1. Targets shall not be
                 updated if this option is specified. However, a makefile
                 command line (associated with the targets) with a <plus-sign>
                 (''++'') prefix shall be executed.

       −−rr        Clear the suffix list and do not use the built-in rules.

       −−SS        Terminate _m_a_k_e if an error occurs while executing the
                 commands to bring a target up-to-date. This shall be the
                 default and the opposite of −−kk.

       −−ss        Do not write makefile command lines or touch messages (see
                 −−tt) to standard output before executing. This mode shall be
                 the same as if the special target ..SSIILLEENNTT were specified
                 without prerequisites.

       −−tt        Update the modification time of each target as though a _t_o_u_c_h
                 _t_a_r_g_e_t had been executed. Targets that have prerequisites but
                 no commands (see _T_a_r_g_e_t _R_u_l_e_s), or that are already up-to-
                 date, shall not be touched in this manner.  Write messages to
                 standard output for each target file indicating the name of
                 the file and that it was touched. Normally, the _m_a_k_e_f_i_l_e
                 command lines associated with each target are not executed.
                 However, a command line with a <plus-sign> (''++'') prefix shall
                 be executed.

       Any options specified in the _M_A_K_E_F_L_A_G_S environment variable shall be
       evaluated before any options specified on the _m_a_k_e utility command
       line. If the −−kk and −−SS options are both specified on the _m_a_k_e utility
       command line or by the _M_A_K_E_F_L_A_G_S environment variable, the last option
       specified shall take precedence.  If the −−ff or −−pp options appear in the
       _M_A_K_E_F_L_A_G_S environment variable, the result is undefined.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _t_a_r_g_e_t___n_a_m_e
                 Target names, as defined in the EXTENDED DESCRIPTION section.
                 If no target is specified, while _m_a_k_e is processing the
                 makefiles, the first target that _m_a_k_e encounters that is not
                 a special target or an inference rule shall be used.

       _m_a_c_r_o=_v_a_l_u_e
                 Macro definitions, as defined in _M_a_c_r_o_s.

       If the _t_a_r_g_e_t___n_a_m_e and _m_a_c_r_o=_v_a_l_u_e operands are intermixed on the _m_a_k_e
       utility command line, the results are unspecified.

SSTTDDIINN
       The standard input shall be used only if the _m_a_k_e_f_i_l_e option-argument
       is ''−−''.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input file, otherwise known as the makefile, is a text file
       containing rules, macro definitions, and comments. See the EXTENDED
       DESCRIPTION section.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _m_a_k_e:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _M_A_K_E_F_L_A_G_S
                 This variable shall be interpreted as a character string
                 representing a series of option characters to be used as the
                 default options. The implementation shall accept both of the
                 following formats (but need not accept them when intermixed):

                  *  The characters are option letters without the leading
                     <hyphen> characters or <blank> separation used on a _m_a_k_e
                     utility command line.

                  *  The characters are formatted in a manner similar to a
                     portion of the _m_a_k_e utility command line: options are
                     preceded by <hyphen> characters and <blank>-separated as
                     described in the Base Definitions volume of POSIX.1‐2008,
                     _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.  The _m_a_c_r_o=_v_a_l_u_e
                     macro definition operands can also be included. The
                     difference between the contents of _M_A_K_E_F_L_A_G_S and the _m_a_k_e
                     utility command line is that the contents of the variable
                     shall not be subjected to the word expansions (see
                     _S_e_c_t_i_o_n _2_._6, _W_o_r_d _E_x_p_a_n_s_i_o_n_s) associated with parsing the
                     command line values.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _P_R_O_J_E_C_T_D_I_R
                 Provide a directory to be used to search for SCCS files not
                 found in the current directory. In all of the following
                 cases, the search for SCCS files is made in the directory
                 SSCCCCSS in the identified directory. If the value of _P_R_O_J_E_C_T_D_I_R
                 begins with a <slash>, it shall be considered an absolute
                 pathname; otherwise, the value of _P_R_O_J_E_C_T_D_I_R is treated as a
                 user name and that user's initial working directory shall be
                 examined for a subdirectory ssrrcc or ssoouurrccee.  If such a
                 directory is found, it shall be used. Otherwise, the value is
                 used as a relative pathname.

                 If _P_R_O_J_E_C_T_D_I_R is not set or has a null value, the search for
                 SCCS files shall be made in the directory SSCCCCSS in the current
                 directory.

                 The setting of _P_R_O_J_E_C_T_D_I_R affects all files listed in the
                 remainder of this utility description for files with a
                 component named SSCCCCSS.

       The value of the _S_H_E_L_L environment variable shall not be used as a
       macro and shall not be modified by defining the SSHHEELLLL macro in a
       makefile or on the command line. All other environment variables,
       including those with null values, shall be used as macros, as defined
       in _M_a_c_r_o_s.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       If not already ignored, _m_a_k_e shall trap SIGHUP, SIGTERM, SIGINT, and
       SIGQUIT and remove the current target unless the target is a directory
       or the target is a prerequisite of the special target ..PPRREECCIIOOUUSS or
       unless one of the −−nn, −−pp, or −−qq options was specified. Any targets
       removed in this manner shall be reported in diagnostic messages of
       unspecified format, written to standard error. After this cleanup
       process, if any, _m_a_k_e shall take the standard action for all other
       signals.

SSTTDDOOUUTT
       The _m_a_k_e utility shall write all commands to be executed to standard
       output unless the −−ss option was specified, the command is prefixed with
       an at-sign, or the special target ..SSIILLEENNTT has either the current target
       as a prerequisite or has no prerequisites. If _m_a_k_e is invoked without
       any work needing to be done, it shall write a message to standard
       output indicating that no action was taken. If the −−tt option is present
       and a file is touched, _m_a_k_e shall write to standard output a message of
       unspecified format indicating that the file was touched, including the
       filename of the file.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       Files can be created when the −−tt option is present. Additional files
       can also be created by the utilities invoked by _m_a_k_e.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       The _m_a_k_e utility attempts to perform the actions required to ensure
       that the specified targets are up-to-date. A target is considered out-
       of-date if it is older than any of its prerequisites or if it does not
       exist.  The _m_a_k_e utility shall treat all prerequisites as targets
       themselves and recursively ensure that they are up-to-date, processing
       them in the order in which they appear in the rule. The _m_a_k_e utility
       shall use the modification times of files to determine whether the
       corresponding targets are out-of-date.

       After _m_a_k_e has ensured that all of the prerequisites of a target are
       up-to-date and if the target is out-of-date, the commands associated
       with the target entry shall be executed. If there are no commands
       listed for the target, the target shall be treated as up-to-date.

   MMaakkeeffiillee SSyynnttaaxx
       A makefile can contain rules, macro definitions (see _M_a_c_r_o_s), include
       lines, and comments. There are two kinds of rules: _i_n_f_e_r_e_n_c_e _r_u_l_e_s and
       _t_a_r_g_e_t _r_u_l_e_s.  The _m_a_k_e utility shall contain a set of built-in
       inference rules. If the −−rr option is present, the built-in rules shall
       not be used and the suffix list shall be cleared. Additional rules of
       both types can be specified in a makefile. If a rule is defined more
       than once, the value of the rule shall be that of the last one
       specified. Macros can also be defined more than once, and the value of
       the macro is specified in _M_a_c_r_o_s.  Comments start with a <number-sign>
       (''##'') and continue until an unescaped <newline> is reached.

       By default, the following files shall be tried in sequence: ..//mmaakkeeffiillee
       and ..//MMaakkeeffiillee.  If neither ..//mmaakkeeffiillee or ..//MMaakkeeffiillee are found, other
       implementation-defined files may also be tried.  On XSI-conformant
       systems, the additional files ..//ss..mmaakkeeffiillee, SSCCCCSS//ss..mmaakkeeffiillee,
       ..//ss..MMaakkeeffiillee, and SSCCCCSS//ss..MMaakkeeffiillee shall also be tried.

       The −−ff option shall direct _m_a_k_e to ignore any of these default files
       and use the specified argument as a makefile instead. If the ''−−''
       argument is specified, standard input shall be used.

       The term _m_a_k_e_f_i_l_e is used to refer to any rules provided by the user,
       whether in ..//mmaakkeeffiillee or its variants, or specified by the −−ff option.

       The rules in makefiles shall consist of the following types of lines:
       target rules, including special targets (see _T_a_r_g_e_t _R_u_l_e_s), inference
       rules (see _I_n_f_e_r_e_n_c_e _R_u_l_e_s), macro definitions (see _M_a_c_r_o_s), empty
       lines, and comments.

       Target and Inference Rules may contain _c_o_m_m_a_n_d _l_i_n_e_s.  Command lines
       can have a prefix that shall be removed before execution (see _M_a_k_e_f_i_l_e
       _E_x_e_c_u_t_i_o_n).

       When an escaped <newline> (one preceded by a <backslash>) is found
       anywhere in the makefile except in a command line, an include line, or
       a line immediately preceding an include line, it shall be replaced,
       along with any leading white space on the following line, with a single
       <space>.  When an escaped <newline> is found in a command line in a
       makefile, the command line shall contain the <backslash>, the
       <newline>, and the next line, except that the first character of the
       next line shall not be included if it is a <tab>.  When an escaped
       <newline> is found in an include line or in a line immediately
       preceding an include line, the behavior is unspecified.

   IInncclluuddee LLiinneess
       If the word iinncclluuddee appears at the beginning of a line and is followed
       by one or more <blank> characters, the string formed by the remainder
       of the line shall be processed as follows to produce a pathname:

        *  The trailing <newline> and any comment shall be discarded. If the
           resulting string contains any double-quote characters (''""'') the
           behavior is unspecified.

        *  The resulting string shall be processed for macro expansion (see
           _M_a_c_r_o_s.

        *  Any <blank> characters that appear after the first non-<blank>
           shall be used as separators to divide the macro-expanded string
           into fields. It is unspecified whether any other white-space
           characters are also used as separators. It is unspecified whether
           pathname expansion (see _S_e_c_t_i_o_n _2_._1_3, _P_a_t_t_e_r_n _M_a_t_c_h_i_n_g _N_o_t_a_t_i_o_n) is
           also performed.

        *  If the processing of separators and optional pathname expansion
           results in either zero or two or more non-empty fields, the
           behavior is unspecified. If it results in one non-empty field, that
           field is taken as the pathname.

       If the pathname does not begin with a ''//'' it shall be treated as
       relative to the current working directory of the process, not relative
       to the directory containing the makefile.  If the file does not exist
       in this location, it is unspecified whether additional directories are
       searched.

       The contents of the file specified by the pathname shall be read and
       processed as if they appeared in the makefile in place of the include
       line. If the file ends with an escaped <newline> the behavior is
       unspecified.

       The file may itself contain further include lines. Implementations
       shall support nesting of include files up to a depth of at least 16.

   MMaakkeeffiillee EExxeeccuuttiioonn
       Makefile command lines shall be processed one at a time.

       Makefile command lines can have one or more of the following prefixes:
       a <hyphen> (''--''), an at-sign (''@@''), or a <plus-sign> (''++'').  These
       shall modify the way in which _m_a_k_e processes the command.

       −     If the command prefix contains a <hyphen>, or the −−ii option is
             present, or the special target ..IIGGNNOORREE has either the current
             target as a prerequisite or has no prerequisites, any error found
             while executing the command shall be ignored.

       @     If the command prefix contains an at-sign and the _m_a_k_e utility
             command line −−nn option is not specified, or the −−ss option is
             present, or the special target ..SSIILLEENNTT has either the current
             target as a prerequisite or has no prerequisites, the command
             shall not be written to standard output before it is executed.

       +     If the command prefix contains a <plus-sign>, this indicates a
             makefile command line that shall be executed even if −−nn, −−qq, or
             −−tt is specified.

       An _e_x_e_c_u_t_i_o_n _l_i_n_e is built from the command line by removing any prefix
       characters. Except as described under the at-sign prefix, the execution
       line shall be written to the standard output, optionally preceded by a
       <tab>.  The execution line shall then be executed by a shell as if it
       were passed as the argument to the _s_y_s_t_e_m() interface, except that if
       errors are not being ignored then the shell −−ee option shall also be in
       effect. If errors are being ignored for the command (as a result of the
       −−ii option, a ''−−'' command prefix, or a ..IIGGNNOORREE special target), the
       shell −−ee option shall not be in effect. The environment for the command
       being executed shall contain all of the variables in the environment of
       _m_a_k_e.

       By default, when _m_a_k_e receives a non-zero status from the execution of
       a command, it shall terminate with an error message to standard error.

   TTaarrggeett RRuulleess
       Target rules are formatted as follows:


           _t_a_r_g_e_t [[_t_a_r_g_e_t...]]: [[_p_r_e_r_e_q_u_i_s_i_t_e...]][[;;_c_o_m_m_a_n_d]]
           [[<tab>_c_o_m_m_a_n_d
           <tab>_c_o_m_m_a_n_d
           ...]]

           _l_i_n_e _t_h_a_t _d_o_e_s _n_o_t _b_e_g_i_n _w_i_t_h <tab>

       Target entries are specified by a <blank>-separated, non-null list of
       targets, then a <colon>, then a <blank>-separated, possibly empty list
       of prerequisites. Text following a <semicolon>, if any, and all
       following lines that begin with a <tab>, are makefile command lines to
       be executed to update the target. The first non-empty line that does
       not begin with a <tab> or ''##'' shall begin a new entry. An empty or
       blank line, or a line beginning with ''##'', may begin a new entry.

       Applications shall select target names from the set of characters
       consisting solely of periods, underscores, digits, and alphabetics from
       the portable character set (see the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _6_._1, _P_o_r_t_a_b_l_e _C_h_a_r_a_c_t_e_r _S_e_t).  Implementations
       may allow other characters in target names as extensions. The
       interpretation of targets containing the characters ''%%'' and ''""'' is
       implementation-defined.

       A target that has prerequisites, but does not have any commands, can be
       used to add to the prerequisite list for that target. Only one target
       rule for any given target can contain commands.

       Lines that begin with one of the following are called _s_p_e_c_i_a_l _t_a_r_g_e_t_s
       and control the operation of _m_a_k_e:

       ..DDEEFFAAUULLTT  If the makefile uses this special target, the application
                 shall ensure that it is specified with commands, but without
                 prerequisites. The commands shall be used by _m_a_k_e if there
                 are no other rules available to build a target.

       ..IIGGNNOORREE   Prerequisites of this special target are targets themselves;
                 this shall cause errors from commands associated with them to
                 be ignored in the same manner as specified by the −−ii option.
                 Subsequent occurrences of ..IIGGNNOORREE shall add to the list of
                 targets ignoring command errors. If no prerequisites are
                 specified, _m_a_k_e shall behave as if the −−ii option had been
                 specified and errors from all commands associated with all
                 targets shall be ignored.

       ..PPOOSSIIXX    The application shall ensure that this special target is
                 specified without prerequisites or commands. If it appears as
                 the first non-comment line in the makefile, _m_a_k_e shall
                 process the makefile as specified by this section; otherwise,
                 the behavior of _m_a_k_e is unspecified.

       ..PPRREECCIIOOUUSS Prerequisites of this special target shall not be removed if
                 _m_a_k_e receives one of the asynchronous events explicitly
                 described in the ASYNCHRONOUS EVENTS section. Subsequent
                 occurrences of ..PPRREECCIIOOUUSS shall add to the list of precious
                 files. If no prerequisites are specified, all targets in the
                 makefile shall be treated as if specified with ..PPRREECCIIOOUUSS.

       ..SSCCCCSS__GGEETT The application shall ensure that this special target is
                 specified without prerequisites. If this special target is
                 included in a makefile, the commands specified with this
                 target shall replace the default commands associated with
                 this special target (see _D_e_f_a_u_l_t _R_u_l_e_s).  The commands
                 specified with this target are used to get all SCCS files
                 that are not found in the current directory.

                 When source files are named in a dependency list, _m_a_k_e shall
                 treat them just like any other target. Because the source
                 file is presumed to be present in the directory, there is no
                 need to add an entry for it to the makefile. When a target
                 has no dependencies, but is present in the directory, _m_a_k_e
                 shall assume that that file is up-to-date. If, however, an
                 SCCS file named SSCCCCSS//ss.._s_o_u_r_c_e___f_i_l_e is found for a target
                 _s_o_u_r_c_e___f_i_l_e, _m_a_k_e compares the timestamp of the target file
                 with that of the SSCCCCSS//ss..ssoouurrccee__ffiillee to ensure the target is
                 up-to-date. If the target is missing, or if the SCCS file is
                 newer, _m_a_k_e shall automatically issue the commands specified
                 for the ..SSCCCCSS__GGEETT special target to retrieve the most recent
                 version. However, if the target is writable by anyone, _m_a_k_e
                 shall not retrieve a new version.

       ..SSIILLEENNTT   Prerequisites of this special target are targets themselves;
                 this shall cause commands associated with them not to be
                 written to the standard output before they are executed.
                 Subsequent occurrences of ..SSIILLEENNTT shall add to the list of
                 targets with silent commands. If no prerequisites are
                 specified, _m_a_k_e shall behave as if the −−ss option had been
                 specified and no commands or touch messages associated with
                 any target shall be written to standard output.

       ..SSUUFFFFIIXXEESS Prerequisites of ..SSUUFFFFIIXXEESS shall be appended to the list of
                 known suffixes and are used in conjunction with the inference
                 rules (see _I_n_f_e_r_e_n_c_e _R_u_l_e_s).  If ..SSUUFFFFIIXXEESS does not have any
                 prerequisites, the list of known suffixes shall be cleared.

       The special targets ..IIGGNNOORREE, ..PPOOSSIIXX, ..PPRREECCIIOOUUSS, ..SSIILLEENNTT, and ..SSUUFFFFIIXXEESS
       shall be specified without commands.

       Targets with names consisting of a leading <period> followed by the
       uppercase letters ""PPOOSSIIXX"" and then any other characters are reserved
       for future standardization.  Targets with names consisting of a leading
       <period> followed by one or more uppercase letters are reserved for
       implementation extensions.

   MMaaccrrooss
       Macro definitions are in the form:


           _s_t_r_i_n_g_1 = [[_s_t_r_i_n_g_2]]

       The macro named _s_t_r_i_n_g_1 is defined as having the value of _s_t_r_i_n_g_2,
       where _s_t_r_i_n_g_2 is defined as all characters, if any, after the <equals-
       sign>, up to a comment character (''##'') or an unescaped <newline>.  Any
       <blank> characters immediately before or after the <equals-sign> shall
       be ignored.

       Applications shall select macro names from the set of characters
       consisting solely of periods, underscores, digits, and alphabetics from
       the portable character set (see the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _6_._1, _P_o_r_t_a_b_l_e _C_h_a_r_a_c_t_e_r _S_e_t).  A macro name shall
       not contain an <equals-sign>.  Implementations may allow other
       characters in macro names as extensions.

       Macros can appear anywhere in the makefile. Macro expansions using the
       forms $(_s_t_r_i_n_g_1) or ${_s_t_r_i_n_g_1} shall be replaced by _s_t_r_i_n_g_2, as
       follows:

        *  Macros in target lines shall be evaluated when the target line is
           read.

        *  Macros in makefile command lines shall be evaluated when the
           command is executed.

        *  Macros in the string before the <equals-sign> in a macro definition
           shall be evaluated when the macro assignment is made.

        *  Macros after the <equals-sign> in a macro definition shall not be
           evaluated until the defined macro is used in a rule or command, or
           before the <equals-sign> in a macro definition.

       The parentheses or braces are optional if _s_t_r_i_n_g_1 is a single
       character. The macro $$ shall be replaced by the single character ''$$''.
       If _s_t_r_i_n_g_1 in a macro expansion contains a macro expansion, the results
       are unspecified.

       Macro expansions using the forms $(_s_t_r_i_n_g_1[[::_s_u_b_s_t_1==[[_s_u_b_s_t_2]]]]) or
       ${_s_t_r_i_n_g_1[[::_s_u_b_s_t_1==[[_s_u_b_s_t_2]]]]} can be used to replace all occurrences of
       _s_u_b_s_t_1 with _s_u_b_s_t_2 when the macro substitution is performed. The _s_u_b_s_t_1
       to be replaced shall be recognized when it is a suffix at the end of a
       word in _s_t_r_i_n_g_1 (where a _w_o_r_d, in this context, is defined to be a
       string delimited by the beginning of the line, a <blank>, or a
       <newline>).  If _s_t_r_i_n_g_1 in a macro expansion contains a macro
       expansion, the results are unspecified.

       Macro expansions in _s_t_r_i_n_g_1 of macro definition lines shall be
       evaluated when read. Macro expansions in _s_t_r_i_n_g_2 of macro definition
       lines shall be performed when the macro identified by _s_t_r_i_n_g_1 is
       expanded in a rule or command.

       Macro definitions shall be taken from the following sources, in the
       following logical order, before the makefile(s) are read.

        1. Macros specified on the _m_a_k_e utility command line, in the order
           specified on the command line. It is unspecified whether the
           internal macros defined in _I_n_t_e_r_n_a_l _M_a_c_r_o_s are accepted from this
           source.

        2. Macros defined by the _M_A_K_E_F_L_A_G_S environment variable, in the order
           specified in the environment variable. It is unspecified whether
           the internal macros defined in _I_n_t_e_r_n_a_l _M_a_c_r_o_s are accepted from
           this source.

        3. The contents of the environment, excluding the _M_A_K_E_F_L_A_G_S and _S_H_E_L_L
           variables and including the variables with null values.

        4. Macros defined in the inference rules built into _m_a_k_e.

       Macro definitions from these sources shall not override macro
       definitions from a lower-numbered source. Macro definitions from a
       single source (for example, the _m_a_k_e utility command line, the
       _M_A_K_E_F_L_A_G_S environment variable, or the other environment variables)
       shall override previous macro definitions from the same source.

       Macros defined in the makefile(s) shall override macro definitions that
       occur before them in the makefile(s) and macro definitions from source
       4. If the −−ee option is not specified, macros defined in the makefile(s)
       shall override macro definitions from source 3. Macros defined in the
       makefile(s) shall not override macro definitions from source 1 or
       source 2.

       Before the makefile(s) are read, all of the _m_a_k_e utility command line
       options (except −−ff and −−pp) and _m_a_k_e utility command line macro
       definitions (except any for the _M_A_K_E_F_L_A_G_S macro), not already included
       in the _M_A_K_E_F_L_A_G_S macro, shall be added to the _M_A_K_E_F_L_A_G_S macro, quoted
       in an implementation-defined manner such that when _M_A_K_E_F_L_A_G_S is read by
       another instance of the _m_a_k_e command, the original macro's value is
       recovered. Other implementation-defined options and macros may also be
       added to the _M_A_K_E_F_L_A_G_S macro. If this modifies the value of the
       _M_A_K_E_F_L_A_G_S macro, or, if the _M_A_K_E_F_L_A_G_S macro is modified at any
       subsequent time, the _M_A_K_E_F_L_A_G_S environment variable shall be modified
       to match the new value of the _M_A_K_E_F_L_A_G_S macro. The result of setting
       _M_A_K_E_F_L_A_G_S in the Makefile is unspecified.

       Before the makefile(s) are read, all of the _m_a_k_e utility command line
       macro definitions (except the _M_A_K_E_F_L_A_G_S macro or the _S_H_E_L_L macro) shall
       be added to the environment of _m_a_k_e.  Other implementation-defined
       variables may also be added to the environment of _m_a_k_e.

       The SSHHEELLLL macro shall be treated specially. It shall be provided by
       _m_a_k_e and set to the pathname of the shell command language interpreter
       (see _s_h).  The _S_H_E_L_L environment variable shall not affect the value of
       the SSHHEELLLL macro. If SSHHEELLLL is defined in the makefile or is specified on
       the command line, it shall replace the original value of the SSHHEELLLL
       macro, but shall not affect the _S_H_E_L_L environment variable. Other
       effects of defining SSHHEELLLL in the makefile or on the command line are
       implementation-defined.

   IInnffeerreennccee RRuulleess
       Inference rules are formatted as follows:


           _t_a_r_g_e_t:
           <tab>_c_o_m_m_a_n_d
           [[<tab>_c_o_m_m_a_n_d]]
           ...

           _l_i_n_e _t_h_a_t _d_o_e_s _n_o_t _b_e_g_i_n _w_i_t_h <tab> _o_r #

       The application shall ensure that the _t_a_r_g_e_t portion is a valid target
       name (see _T_a_r_g_e_t _R_u_l_e_s) of the form ..ss22 or ..ss11..ss22 (where ..ss11 and ..ss22
       are suffixes that have been given as prerequisites of the ..SSUUFFFFIIXXEESS
       special target and _s_1 and _s_2 do not contain any <slash> or <period>
       characters.) If there is only one <period> in the target, it is a
       single-suffix inference rule. Targets with two periods are double-
       suffix inference rules. Inference rules can have only one target before
       the <colon>.

       The application shall ensure that the makefile does not specify
       prerequisites for inference rules; no characters other than white space
       shall follow the <colon> in the first line, except when creating the
       _e_m_p_t_y _r_u_l_e_, described below. Prerequisites are inferred, as described
       below.

       Inference rules can be redefined. A target that matches an existing
       inference rule shall overwrite the old inference rule. An empty rule
       can be created with a command consisting of simply a <semicolon> (that
       is, the rule still exists and is found during inference rule search,
       but since it is empty, execution has no effect). The empty rule can
       also be formatted as follows:


           _r_u_l_e: ;

       where zero or more <blank> characters separate the <colon> and
       <semicolon>.

       The _m_a_k_e utility uses the suffixes of targets and their prerequisites
       to infer how a target can be made up-to-date. A list of inference rules
       defines the commands to be executed. By default, _m_a_k_e contains a built-
       in set of inference rules. Additional rules can be specified in the
       makefile.

       The special target ..SSUUFFFFIIXXEESS contains as its prerequisites a list of
       suffixes that shall be used by the inference rules. The order in which
       the suffixes are specified defines the order in which the inference
       rules for the suffixes are used. New suffixes shall be appended to the
       current list by specifying a ..SSUUFFFFIIXXEESS special target in the makefile.
       A ..SSUUFFFFIIXXEESS target with no prerequisites shall clear the list of
       suffixes. An empty ..SSUUFFFFIIXXEESS target followed by a new ..SSUUFFFFIIXXEESS list is
       required to change the order of the suffixes.

       Normally, the user would provide an inference rule for each suffix.
       The inference rule to update a target with a suffix ..ss11 from a
       prerequisite with a suffix ..ss22 is specified as a target ..ss22..ss11.  The
       internal macros provide the means to specify general inference rules
       (see _I_n_t_e_r_n_a_l _M_a_c_r_o_s).

       When no target rule is found to update a target, the inference rules
       shall be checked. The suffix of the target (..ss11) to be built is
       compared to the list of suffixes specified by the ..SSUUFFFFIIXXEESS special
       targets. If the ..ss11 suffix is found in ..SSUUFFFFIIXXEESS, the inference rules
       shall be searched in the order defined for the first ..ss22..ss11 rule whose
       prerequisite file ($$**..ss22) exists. If the target is out-of-date with
       respect to this prerequisite, the commands for that inference rule
       shall be executed.

       If the target to be built does not contain a suffix and there is no
       rule for the target, the single suffix inference rules shall be
       checked. The single-suffix inference rules define how to build a target
       if a file is found with a name that matches the target name with one of
       the single suffixes appended. A rule with one suffix ..ss22 is the
       definition of how to build _t_a_r_g_e_t from ttaarrggeett..ss22.  The other suffix
       (..ss11) is treated as null.

       A <tilde> (''~~'') in the above rules refers to an SCCS file in the
       current directory.  Thus, the rule ..cc~~..oo would transform an SCCS C-
       language source file into an object file (..oo).  Because the ss..  of the
       SCCS files is a prefix, it is incompatible with _m_a_k_e's suffix point of
       view. Hence, the ''~~'' is a way of changing any file reference into an
       SCCS file reference.

   LLiibbrraarriieess
       If a target or prerequisite contains parentheses, it shall be treated
       as a member of an archive library. For the _l_i_b(_m_e_m_b_e_r..oo) expression _l_i_b
       refers to the name of the archive library and _m_e_m_b_e_r..oo to the member
       name. The application shall ensure that the member is an object file
       with the ..oo suffix. The modification time of the expression is the
       modification time for the member as kept in the archive library; see
       _a_r.  The ..aa suffix shall refer to an archive library. The ..ss22..aa rule
       shall be used to update a member in the library from a file with a
       suffix ..ss22.

   IInntteerrnnaall MMaaccrrooss
       The _m_a_k_e utility shall maintain five internal macros that can be used
       in target and inference rules. In order to clearly define the meaning
       of these macros, some clarification of the terms _t_a_r_g_e_t _r_u_l_e, _i_n_f_e_r_e_n_c_e
       _r_u_l_e, _t_a_r_g_e_t, and _p_r_e_r_e_q_u_i_s_i_t_e is necessary.

       Target rules are specified by the user in a makefile for a particular
       target. Inference rules are user-specified or _m_a_k_e-specified rules for
       a particular class of target name. Explicit prerequisites are those
       prerequisites specified in a makefile on target lines.  Implicit
       prerequisites are those prerequisites that are generated when inference
       rules are used. Inference rules are applied to implicit prerequisites
       or to explicit prerequisites that do not have target rules defined for
       them in the makefile. Target rules are applied to targets specified in
       the makefile.

       Before any target in the makefile is updated, each of its prerequisites
       (both explicit and implicit) shall be updated. This shall be
       accomplished by recursively processing each prerequisite. Upon
       recursion, each prerequisite shall become a target itself. Its
       prerequisites in turn shall be processed recursively until a target is
       found that has no prerequisites, at which point the recursion stops.
       The recursion shall then back up, updating each target as it goes.

       In the definitions that follow, the word _t_a_r_g_e_t refers to one of:

        *  A target specified in the makefile

        *  An explicit prerequisite specified in the makefile that becomes the
           target when _m_a_k_e processes it during recursion

        *  An implicit prerequisite that becomes a target when _m_a_k_e processes
           it during recursion

       In the definitions that follow, the word _p_r_e_r_e_q_u_i_s_i_t_e refers to one of
       the following:

        *  An explicit prerequisite specified in the makefile for a particular
           target

        *  An implicit prerequisite generated as a result of locating an
           appropriate inference rule and corresponding file that matches the
           suffix of the target

       The five internal macros are:

       $@      The $@ shall evaluate to the full target name of the current
               target, or the archive filename part of a library archive
               target. It shall be evaluated for both target and inference
               rules.

               For example, in the ..cc..aa inference rule, $@ represents the out-
               of-date ..aa file to be built. Similarly, in a makefile target
               rule to build lliibb..aa from ffiillee..cc, $@ represents the out-of-date
               lliibb..aa.

       $%      The $% macro shall be evaluated only when the current target is
               an archive library member of the form _l_i_b_n_a_m_e(_m_e_m_b_e_r..oo).  In
               these cases, $@ shall evaluate to _l_i_b_n_a_m_e and $% shall evaluate
               to _m_e_m_b_e_r..oo.  The $% macro shall be evaluated for both target
               and inference rules.

               For example, in a makefile target rule to build lliibb..aa(ffiillee..oo),
               $% represents ffiillee..oo, as opposed to $@, which represents lliibb..aa.

       $?      The $? macro shall evaluate to the list of prerequisites that
               are newer than the current target. It shall be evaluated for
               both target and inference rules.

               For example, in a makefile target rule to build _p_r_o_g from
               ffiillee11..oo, ffiillee22..oo, and ffiillee33..oo, and where _p_r_o_g is not out-of-
               date with respect to ffiillee11..oo, but is out-of-date with respect
               to ffiillee22..oo and ffiillee33..oo, $? represents ffiillee22..oo and ffiillee33..oo.

       $<      In an inference rule, the $< macro shall evaluate to the
               filename whose existence allowed the inference rule to be
               chosen for the target.  In the ..DDEEFFAAUULLTT rule, the $< macro
               shall evaluate to the current target name. The meaning of the
               $< macro shall be otherwise unspecified.

               For example, in the ..cc..aa inference rule, $< represents the
               prerequisite ..cc file.

       $*      The $* macro shall evaluate to the current target name with its
               suffix deleted. It shall be evaluated at least for inference
               rules.

               For example, in the ..cc..aa inference rule, $*.o represents the
               out-of-date ..oo file that corresponds to the prerequisite ..cc
               file.

       Each of the internal macros has an alternative form. When an uppercase
       ''DD'' or ''FF'' is appended to any of the macros, the meaning shall be
       changed to the _d_i_r_e_c_t_o_r_y _p_a_r_t for ''DD'' and _f_i_l_e_n_a_m_e _p_a_r_t for ''FF''.  The
       directory part is the path prefix of the file without a trailing
       <slash>; for the current directory, the directory part is ''..''.  When
       the $? macro contains more than one prerequisite filename, the $(?D)
       and $(?F) (or ${?D} and ${?F}) macros expand to a list of directory
       name parts and filename parts respectively.

       For the target _l_i_b(_m_e_m_b_e_r..oo) and the ss22..aa rule, the internal macros
       shall be defined as:

       $<      _m_e_m_b_e_r..ss22

       $*      _m_e_m_b_e_r

       $@      _l_i_b

       $?      _m_e_m_b_e_r..ss22

       $%      _m_e_m_b_e_r..oo

   DDeeffaauulltt RRuulleess
       The default rules for _m_a_k_e shall achieve results that are the same as
       if the following were used.  Implementations that do not support the C-
       Language Development Utilities option may omit CCCC, CCFFLLAAGGSS, YYAACCCC,
       YYFFLLAAGGSS, LLEEXX, LLFFLLAAGGSS, LLDDFFLLAAGGSS, and the ..cc, ..yy, and ..ll inference rules.
       Implementations that do not support FORTRAN may omit FFCC, FFFFLLAAGGSS, and
       the ..ff inference rules. Implementations may provide additional macros
       and rules.


           _S_P_E_C_I_A_L _T_A_R_G_E_T_S

           .SCCS_GET: sccs $(SCCSFLAGS) get $(SCCSGETFLAGS) $@

           .SUFFIXES: .o .c .y .l .a .sh .f .c~ .y~ .l~ .sh~ .f~

           _M_A_C_R_O_S

           MAKE=make
           AR=ar
           ARFLAGS=−rv
           YACC=yacc
           YFLAGS=
           LEX=lex
           LFLAGS=
           LDFLAGS=
           CC=c99
           CFLAGS=−O
           FC=fort77
           FFLAGS=−O 1
           GET=get
           GFLAGS=
           SCCSFLAGS=
           SCCSGETFLAGS=−s

           _S_I_N_G_L_E _S_U_F_F_I_X _R_U_L_E_S

           .c:
               $(CC) $(CFLAGS) $(LDFLAGS) −o $@ $<

           .f:
               $(FC) $(FFLAGS) $(LDFLAGS) −o $@ $<

           .sh:
               cp $< $@
               chmod a+x $@

           .c~:
               $(GET) $(GFLAGS) −p $< > $*.c
               $(CC) $(CFLAGS) $(LDFLAGS) −o $@ $*.c

           .f~:
               $(GET) $(GFLAGS) −p $< > $*.f
               $(FC) $(FFLAGS) $(LDFLAGS) −o $@ $*.f

           .sh~:
               $(GET) $(GFLAGS) −p $< > $*.sh
               cp $*.sh $@
               chmod a+x $@

           _D_O_U_B_L_E _S_U_F_F_I_X _R_U_L_E_S

           .c.o:
               $(CC) $(CFLAGS) −c $<

           .f.o:
               $(FC) $(FFLAGS) −c $<

           .y.o:
               $(YACC) $(YFLAGS) $<
               $(CC) $(CFLAGS) −c y.tab.c
               rm −f y.tab.c
               mv y.tab.o $@

           .l.o:
               $(LEX) $(LFLAGS) $<
               $(CC) $(CFLAGS) −c lex.yy.c
               rm −f lex.yy.c
               mv lex.yy.o $@

           .y.c:
               $(YACC) $(YFLAGS) $<
               mv y.tab.c $@

           .l.c:
               $(LEX) $(LFLAGS) $<
               mv lex.yy.c $@

           .c~.o:
               $(GET) $(GFLAGS) −p $< > $*.c
               $(CC) $(CFLAGS) −c $*.c

           .f~.o:
               $(GET) $(GFLAGS) −p $< > $*.f
               $(FC) $(FFLAGS) −c $*.f

           .y~.o:
               $(GET) $(GFLAGS) −p $< > $*.y
               $(YACC) $(YFLAGS) $*.y
               $(CC) $(CFLAGS) −c y.tab.c
               rm −f y.tab.c
               mv y.tab.o $@

           .l~.o:
               $(GET) $(GFLAGS) −p $< > $*.l
               $(LEX) $(LFLAGS) $*.l
               $(CC) $(CFLAGS) −c lex.yy.c
               rm −f lex.yy.c
               mv lex.yy.o $@

           .y~.c:
               $(GET) $(GFLAGS) −p $< > $*.y
               $(YACC) $(YFLAGS) $*.y
               mv y.tab.c $@

           .l~.c:
               $(GET) $(GFLAGS) −p $< > $*.l
               $(LEX) $(LFLAGS) $*.l
               mv lex.yy.c $@

           .c.a:
               $(CC) −c $(CFLAGS) $<
               $(AR) $(ARFLAGS) $@ $*.o
               rm −f $*.o

           .f.a:
               $(FC) −c $(FFLAGS) $<
               $(AR) $(ARFLAGS) $@ $*.o
               rm −f $*.o

EEXXIITT SSTTAATTUUSS
       When the −−qq option is specified, the _m_a_k_e utility shall exit with one
       of the following values:

        0    Successful completion.

        1    The target was not up-to-date.

       >1    An error occurred.

       When the −−qq option is not specified, the _m_a_k_e utility shall exit with
       one of the following values:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       If there is a source file (such as ..//ssoouurrccee..cc) and there are two SCCS
       files corresponding to it (..//ss..ssoouurrccee..cc and ..//SSCCCCSS//ss..ssoouurrccee..cc), on XSI-
       conformant systems _m_a_k_e uses the SCCS file in the current directory.
       However, users are advised to use the underlying SCCS utilities (_a_d_m_i_n,
       _d_e_l_t_a, _g_e_t, and so on) or the _s_c_c_s utility for all source files in a
       given directory. If both forms are used for a given source file, future
       developers are very likely to be confused.

       It is incumbent upon portable makefiles to specify the ..PPOOSSIIXX special
       target in order to guarantee that they are not affected by local
       extensions.

       The −−kk and −−SS options are both present so that the relationship between
       the command line, the _M_A_K_E_F_L_A_G_S variable, and the makefile can be
       controlled precisely. If the kk flag is passed in _M_A_K_E_F_L_A_G_S and a
       command is of the form:


           $$((MMAAKKEE)) −−SS ffoooo

       then the default behavior is restored for the child _m_a_k_e.

       When the −−nn option is specified, it is always added to _M_A_K_E_F_L_A_G_S.  This
       allows a recursive _m_a_k_e −−nn _t_a_r_g_e_t to be used to see all of the action
       that would be taken to update _t_a_r_g_e_t.

       Because of widespread historical practice, interpreting a <number-sign>
       (''##'') inside a variable as the start of a comment has the unfortunate
       side-effect of making it impossible to place a <number-sign> in a
       variable, thus forbidding something like:


           CCFFLLAAGGSS == ""−−DD CCOOMMMMEENNTT__CCHHAARR==''##''""

       Many historical _m_a_k_e utilities stop chaining together inference rules
       when an intermediate target is nonexistent. For example, it might be
       possible for a _m_a_k_e to determine that both ..yy..cc and ..cc..oo could be used
       to convert a ..yy to a ..oo.  Instead, in this case, _m_a_k_e requires the use
       of a ..yy..oo rule.

       The best way to provide portable makefiles is to include all of the
       rules needed in the makefile itself. The rules provided use only
       features provided by other parts of this volume of POSIX.1‐2008. The
       default rules include rules for optional commands in this volume of
       POSIX.1‐2008. Only rules pertaining to commands that are provided are
       needed in an implementation's default set.

       Macros used within other macros are evaluated when the new macro is
       used rather than when the new macro is defined. Therefore:


           MMAACCRROO == _v_a_l_u_e_1
           NNEEWW   == $$((MMAACCRROO))
           MMAACCRROO == _v_a_l_u_e_2

           target:
               echo $(NEW)

       would produce _v_a_l_u_e_2 and not _v_a_l_u_e_1 since NNEEWW was not expanded until it
       was needed in the _e_c_h_o command line.

       Some historical applications have been known to intermix _t_a_r_g_e_t___n_a_m_e
       and _m_a_c_r_o_=_n_a_m_e operands on the command line, expecting that all of the
       macros are processed before any of the targets are dealt with.
       Conforming applications do not do this, although some backwards-
       compatibility support may be included in some implementations.

       The following characters in filenames may give trouble: ''=='', ''::'', ''``'',
       single-quote, and ''@@''.  In include filenames, pattern matching
       characters and ''""'' should also be avoided, as they may be treated as
       special by some implementations.

       For inference rules, the description of $< and $? seem similar.
       However, an example shows the minor difference. In a makefile
       containing:


           ffoooo..oo:: ffoooo..hh

       if ffoooo..hh is newer than ffoooo..oo, yet ffoooo..cc is older than ffoooo..oo, the built-
       in rule to make ffoooo..oo from ffoooo..cc is used, with $< equal to ffoooo..cc and $?
       equal to ffoooo..hh.  If ffoooo..cc is also newer than ffoooo..oo, $< is equal to
       ffoooo..cc and $? is equal to ffoooo..hh ffoooo..cc.

EEXXAAMMPPLLEESS
        1. The following command:


               mmaakkee

           makes the first target found in the makefile.

        2. The following command:


               mmaakkee jjuunnkk

           makes the target jjuunnkk.

        3. The following makefile says that ppggmm depends on two files, aa..oo and
           bb..oo, and that they in turn depend on their corresponding source
           files (aa..cc and bb..cc), and a common file iinnccll..hh:


               ppggmm:: aa..oo bb..oo
                   cc9999 aa..oo bb..oo −−oo ppggmm
               aa..oo:: iinnccll..hh aa..cc
                   cc9999 −−cc aa..cc
               bb..oo:: iinnccll..hh bb..cc
                   cc9999 −−cc bb..cc

        4. An example for making optimized ..oo files from ..cc files is:


               ..cc..oo::
                   cc9999 −−cc −−OO $$**..cc

           or:


               ..cc..oo::
                   cc9999 −−cc −−OO $$<<

        5. The most common use of the archive interface follows. Here, it is
           assumed that the source files are all C-language source:


               lliibb:: lliibb((ffiillee11..oo)) lliibb((ffiillee22..oo)) lliibb((ffiillee33..oo))
                   @@eecchhoo lliibb iiss nnooww uupp--ttoo--ddaattee

           The ..cc..aa rule is used to make ffiillee11..oo, ffiillee22..oo, and ffiillee33..oo and
           insert them into lliibb.

           The treatment of escaped <newline> characters throughout the
           makefile is historical practice. For example, the inference rule:


               ..cc..oo\\
               ::

           works, and the macro:


               ff==  bbaarr bbaazz\\
                   bbiizz
               aa::
                   eecchhoo ====$$ff====

           echoes ""====bbaarr  bbaazz  bbiizz===="".

           If $? were:


               //uussrr//iinncclluuddee//ssttddiioo..hh //uussrr//iinncclluuddee//uunniissttdd..hh ffoooo..hh

           then $(?D) would be:


               //uussrr//iinncclluuddee //uussrr//iinncclluuddee ..

           and $(?F) would be:


               ssttddiioo..hh uunniissttdd..hh ffoooo..hh

        6. The contents of the built-in rules can be viewed by running:


               mmaakkee −−pp −−ff //ddeevv//nnuullll 22>>//ddeevv//nnuullll

RRAATTIIOONNAALLEE
       The _m_a_k_e utility described in this volume of POSIX.1‐2008 is intended
       to provide the means for changing portable source code into executables
       that can be run on an POSIX.1‐2008-conforming system. It reflects the
       most common features present in System V and BSD _m_a_k_es.

       Historically, the _m_a_k_e utility has been an especially fertile ground
       for vendor and research organization-specific syntax modifications and
       extensions. Examples include:

        *  Syntax supporting parallel execution (such as from various multi-
           processor vendors, GNU, and others)

        *  Additional ``operators'' separating targets and their prerequisites
           (System V, BSD, and others)

        *  Specifying that command lines containing the strings ""$${{MMAAKKEE}}"" and
           ""$$((MMAAKKEE))"" are executed when the −−nn option is specified (GNU and
           System V)

        *  Modifications of the meaning of internal macros when referencing
           libraries (BSD and others)

        *  Using a single instance of the shell for all of the command lines
           of the target (BSD and others)

        *  Allowing <space> characters as well as <tab> characters to delimit
           command lines (BSD)

        *  Adding C preprocessor-style ``include'' and ``ifdef'' constructs
           (System V, GNU, BSD, and others)

        *  Remote execution of command lines (Sprite and others)

        *  Specifying additional special targets (BSD, System V, and most
           others)

       Additionally, many vendors and research organizations have rethought
       the basic concepts of _m_a_k_e, creating vastly extended, as well as
       completely new, syntaxes. Each of these versions of _m_a_k_e fulfills the
       needs of a different community of users; it is unreasonable for this
       volume of POSIX.1‐2008 to require behavior that would be incompatible
       (and probably inferior) to historical practice for such a community.

       In similar circumstances, when the industry has enough sufficiently
       incompatible formats as to make them irreconcilable, this volume of
       POSIX.1‐2008 has followed one or both of two courses of action.
       Commands have been renamed (_c_k_s_u_m, _e_c_h_o, and _p_a_x) and/or command line
       options have been provided to select the desired behavior (_g_r_e_p, _o_d,
       and _p_a_x).

       Because the syntax specified for the _m_a_k_e utility is, by and large, a
       subset of the syntaxes accepted by almost all versions of _m_a_k_e, it was
       decided that it would be counter-productive to change the name.  And
       since the makefile itself is a basic unit of portability, it would not
       be completely effective to reserve a new option letter, such as _m_a_k_e
       −−PP, to achieve the portable behavior. Therefore, the special target
       ..PPOOSSIIXX was added to the makefile, allowing users to specify
       ``standard'' behavior. This special target does not preclude extensions
       in the _m_a_k_e utility, nor does it preclude such extensions being used by
       the makefile specifying the target; it does, however, preclude any
       extensions from being applied that could alter the behavior of
       previously valid syntax; such extensions must be controlled via command
       line options or new special targets. It is incumbent upon portable
       makefiles to specify the ..PPOOSSIIXX special target in order to guarantee
       that they are not affected by local extensions.

       The portable version of _m_a_k_e described in this reference page is not
       intended to be the state-of-the-art software generation tool and, as
       such, some newer and more leading-edge features have not been included.
       An attempt has been made to describe the portable makefile in a manner
       that does not preclude such extensions as long as they do not disturb
       the portable behavior described here.

       When the −−nn option is specified, it is always added to _M_A_K_E_F_L_A_G_S.  This
       allows a recursive _m_a_k_e −−nn _t_a_r_g_e_t to be used to see all of the action
       that would be taken to update _t_a_r_g_e_t.

       The definition of _M_A_K_E_F_L_A_G_S allows both the System V letter string and
       the BSD command line formats. The two formats are sufficiently
       different to allow implementations to support both without ambiguity.

       Early proposals stated that an ``unquoted'' <number-sign> was treated
       as the start of a comment. The _m_a_k_e utility does not pay any attention
       to quotes. A <number-sign> starts a comment regardless of its
       surroundings.

       The text about ``other implementation-defined pathnames may also be
       tried'' in addition to ..//mmaakkeeffiillee and ..//MMaakkeeffiillee is to allow such
       extensions as SSCCCCSS//ss..MMaakkeeffiillee and other variations. It was made an
       implementation-defined requirement (as opposed to unspecified behavior)
       to highlight surprising implementations that might select something
       unexpected like //eettcc//MMaakkeeffiillee.  XSI-conformant systems also try
       ..//ss..mmaakkeeffiillee, SSCCCCSS//ss..mmaakkeeffiillee, ..//ss..MMaakkeeffiillee, and SSCCCCSS//ss..MMaakkeeffiillee.

       Early proposals contained the macro NNPPRROOCC as a means of specifying that
       _m_a_k_e should use _n processes to do the work required. While this feature
       is a valuable extension for many systems, it is not common usage and
       could require other non-trivial extensions to makefile syntax. This
       extension is not required by this volume of POSIX.1‐2008, but could be
       provided as a compatible extension. The macro PPAARRAALLLLEELL is used by some
       historical systems with essentially the same meaning (but without using
       a name that is a common system limit value). It is suggested that
       implementors recognize the existing use of NNPPRROOCC and/or PPAARRAALLLLEELL as
       extensions to _m_a_k_e.

       The default rules are based on System V. The default CCCC== value is _c_9_9
       instead of _c_c because this volume of POSIX.1‐2008 does not standardize
       the utility named _c_c.  Thus, every conforming application would be
       required to define CCCC==_c_9_9 to expect to run. There is no advantage
       conferred by the hope that the makefile might hit the ``preferred''
       compiler because this cannot be guaranteed to work. Also, since the
       portable makescript can only use the _c_9_9 options, no advantage is
       conferred in terms of what the script can do.  It is a quality-of-
       implementation issue as to whether _c_9_9 is as valuable as _c_c.

       The −−dd option to _m_a_k_e is frequently used to produce debugging
       information, but is too implementation-defined to add to this volume of
       POSIX.1‐2008.

       The −−pp option is not passed in _M_A_K_E_F_L_A_G_S on most historical
       implementations and to change this would cause many implementations to
       break without sufficiently increased portability.

       Commands that begin with a <plus-sign> (''++'') are executed even if the
       −−nn option is present. Based on the GNU version of _m_a_k_e, the behavior of
       −−nn when the <plus-sign> prefix is encountered has been extended to
       apply to −−qq and −−tt as well. However, the System V convention of forcing
       command execution with −−nn when the command line of a target contains
       either of the strings ""$$((MMAAKKEE))"" or ""$${{MMAAKKEE}}"" has not been adopted. This
       functionality appeared in early proposals, but the danger of this
       approach was pointed out with the following example of a portion of a
       makefile:


           ssuubbddiirr::
               ccdd ssuubbddiirr;; rrmm aallll__tthhee__ffiilleess;; $$((MMAAKKEE))

       The loss of the System V behavior in this case is well-balanced by the
       safety afforded to other makefiles that were not aware of this
       situation. In any event, the command line <plus-sign> prefix can
       provide the desired functionality.

       The double <colon> in the target rule format is supported in BSD
       systems to allow more than one target line containing the same target
       name to have commands associated with it. Since this is not
       functionality described in the SVID or XPG3 it has been allowed as an
       extension, but not mandated.

       The default rules are provided with text specifying that the built-in
       rules shall be the same as if the listed set were used. The intent is
       that implementations should be able to use the rules without change,
       but will be allowed to alter them in ways that do not affect the
       primary behavior.

       The best way to provide portable makefiles is to include all of the
       rules needed in the makefile itself. The rules provided use only
       features provided by other portions of this volume of POSIX.1‐2008. The
       default rules include rules for optional commands in this volume of
       POSIX.1‐2008. Only rules pertaining to commands that are provided are
       needed in the default set of an implementation.

       One point of discussion was whether to drop the default rules list from
       this volume of POSIX.1‐2008. They provide convenience, but do not
       enhance portability of applications. The prime benefit is in
       portability of users who wish to type _m_a_k_e _c_o_m_m_a_n_d and have the command
       build from a ccoommmmaanndd..cc file.

       The historical _M_A_K_E_S_H_E_L_L feature was omitted. In some implementations
       it is used to let a user override the shell to be used to run _m_a_k_e
       commands. This was confusing; for a portable _m_a_k_e, the shell should be
       chosen by the makefile writer or specified on the _m_a_k_e command line and
       not by a user running _m_a_k_e.

       The _m_a_k_e utilities in most historical implementations process the
       prerequisites of a target in left-to-right order, and the makefile
       format requires this. It supports the standard idiom used in many
       makefiles that produce _y_a_c_c programs; for example:


           ffoooo:: yy..ttaabb..oo lleexx..oo mmaaiinn..oo
               $$((CCCC)) $$((CCFFLLAAGGSS)) −−oo $$@ tt..ttaabb..oo lleexx..oo mmaaiinn..oo

       In this example, if _m_a_k_e chose any arbitrary order, the lleexx..oo might not
       be made with the correct yy..ttaabb..hh.  Although there may be better ways to
       express this relationship, it is widely used historically.
       Implementations that desire to update prerequisites in parallel should
       require an explicit extension to _m_a_k_e or the makefile format to
       accomplish it, as described previously.

       The algorithm for determining a new entry for target rules is partially
       unspecified. Some historical _m_a_k_es allow blank, empty, or comment lines
       within the collection of commands marked by leading <tab> characters. A
       conforming makefile must ensure that each command starts with a <tab>,
       but implementations are free to ignore blank, empty, and comment lines
       without triggering the start of a new entry.

       The ASYNCHRONOUS EVENTS section includes having SIGTERM and SIGHUP,
       along with the more traditional SIGINT and SIGQUIT, remove the current
       target unless directed not to do so. SIGTERM and SIGHUP were added to
       parallel other utilities that have historically cleaned up their work
       as a result of these signals. When _m_a_k_e receives any signal other than
       SIGQUIT, it is required to resend itself the signal it received so that
       it exits with a status that reflects the signal. The results from
       SIGQUIT are partially unspecified because, on systems that create ccoorree
       files upon receipt of SIGQUIT, the ccoorree from _m_a_k_e would conflict with a
       ccoorree file from the command that was running when the SIGQUIT arrived.
       The main concern was to prevent damaged files from appearing up-to-date
       when _m_a_k_e is rerun.

       The ..PPRREECCIIOOUUSS special target was extended to affect all targets
       globally (by specifying no prerequisites). The ..IIGGNNOORREE and ..SSIILLEENNTT
       special targets were extended to allow prerequisites; it was judged to
       be more useful in some cases to be able to turn off errors or echoing
       for a list of targets than for the entire makefile. These extensions to
       _m_a_k_e in System V were made to match historical practice from the BSD
       _m_a_k_e.

       Macros are not exported to the environment of commands to be run. This
       was never the case in any historical _m_a_k_e and would have serious
       consequences. The environment is the same as the environment to _m_a_k_e
       except that _M_A_K_E_F_L_A_G_S and macros defined on the _m_a_k_e command line are
       added.

       Some implementations do not use _s_y_s_t_e_m() for all command lines, as
       required by the portable makefile format; as a performance enhancement,
       they select lines without shell metacharacters for direct execution by
       _e_x_e_c_v_e().  There is no requirement that _s_y_s_t_e_m() be used specifically,
       but merely that the same results be achieved.  The metacharacters
       typically used to bypass the direct _e_x_e_c_v_e() execution have been any
       of:


           ==  ||  ^^  ((  ))  ;;  &&  <<  >>  **  ??  [[  ]]  ::  $$  ``  ''  ""  \\  \\nn

       The default in some advanced versions of _m_a_k_e is to group all the
       command lines for a target and execute them using a single shell
       invocation; the System V method is to pass each line individually to a
       separate shell. The single-shell method has the advantages in
       performance and the lack of a requirement for many continued lines.
       However, converting to this newer method has caused portability
       problems with many historical makefiles, so the behavior with the POSIX
       makefile is specified to be the same as that of System V. It is
       suggested that the special target ..OONNEESSHHEELLLL be used as an
       implementation extension to achieve the single-shell grouping for a
       target or group of targets.

       Novice users of _m_a_k_e have had difficulty with the historical need to
       start commands with a <tab>.  Since it is often difficult to discern
       differences between <tab> and <space> characters on terminals or
       printed listings, confusing bugs can arise. In early proposals, an
       attempt was made to correct this problem by allowing leading <blank>
       characters instead of <tab> characters. However, implementors reported
       many makefiles that failed in subtle ways following this change, and it
       is difficult to implement a _m_a_k_e that unambiguously can differentiate
       between macro and command lines.  There is extensive historical
       practice of allowing leading <space> characters before macro
       definitions. Forcing macro lines into column 1 would be a significant
       backwards-compatibility problem for some makefiles.  Therefore,
       historical practice was restored.

       There is substantial variation in the handling of include lines by
       different implementations. However, there is enough commonality for the
       standard to be able to specify a minimum set of requirements that allow
       the feature to be used portably. Known variations have been explicitly
       called out as unspecified behavior in the description.

       The System V dynamic dependency feature was not included. It would
       support:


           ccaatt:: $$$$@@..cc

       that would expand to;


           ccaatt:: ccaatt..cc

       This feature exists only in the new version of System V _m_a_k_e and, while
       useful, is not in wide usage. This means that macros are expanded twice
       for prerequisites: once at makefile parse time and once at target
       update time.

       Consideration was given to adding metarules to the POSIX _m_a_k_e.  This
       would make %%..oo::  %%..cc the same as ..cc..oo::.  This is quite useful and
       available from some vendors, but it would cause too many changes to
       this _m_a_k_e to support. It would have introduced rule chaining and new
       substitution rules. However, the rules for target names have been set
       to reserve the ''%%'' and ''""'' characters. These are traditionally used to
       implement metarules and quoting of target names, respectively.
       Implementors are strongly encouraged to use these characters only for
       these purposes.

       A request was made to extend the suffix delimiter character from a
       <period> to any character. The metarules feature in newer _m_a_k_es solves
       this problem in a more general way. This volume of POSIX.1‐2008 is
       staying with the more conservative historical definition.

       The standard output format for the −−pp option is not described because
       it is primarily a debugging option and because the format is not
       generally useful to programs. In historical implementations the output
       is not suitable for use in generating makefiles. The −−pp format has been
       variable across historical implementations. Therefore, the definition
       of −−pp was only to provide a consistently named option for obtaining
       _m_a_k_e script debugging information.

       Some historical implementations have not cleared the suffix list with
       −−rr.

       Implementations should be aware that some historical applications have
       intermixed _t_a_r_g_e_t___n_a_m_e and _m_a_c_r_o=_v_a_l_u_e operands on the command line,
       expecting that all of the macros are processed before any of the
       targets are dealt with. Conforming applications do not do this, but
       some backwards-compatibility support may be warranted.

       Empty inference rules are specified with a <semicolon> command rather
       than omitting all commands, as described in an early proposal. The
       latter case has no traditional meaning and is reserved for
       implementation extensions, such as in GNU _m_a_k_e.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e, _a_r, _c_9_9, _g_e_t, _l_e_x, _s_c_c_s, _s_h, _y_a_c_c

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _6_._1, _P_o_r_t_a_b_l_e
       _C_h_a_r_a_c_t_e_r _S_e_t, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y
       _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _e_x_e_c, _s_y_s_t_e_m()

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



IEEE/The Open Group                  2013                             MAKE(1P)
