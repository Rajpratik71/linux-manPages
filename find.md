FIND(1P)                   POSIX Programmer's Manual                  FIND(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       find — find files

SSYYNNOOPPSSIISS
       find [[−H|−L]] _p_a_t_h... [[_o_p_e_r_a_n_d___e_x_p_r_e_s_s_i_o_n...]]

DDEESSCCRRIIPPTTIIOONN
       The _f_i_n_d utility shall recursively descend the directory hierarchy from
       each file specified by _p_a_t_h, evaluating a Boolean expression composed
       of the primaries described in the OPERANDS section for each file
       encountered. Each _p_a_t_h operand shall be evaluated unaltered as it was
       provided, including all trailing <slash> characters; all pathnames for
       other files encountered in the hierarchy shall consist of the
       concatenation of the current _p_a_t_h operand, a <slash> if the current
       _p_a_t_h operand did not end in one, and the filename relative to the _p_a_t_h
       operand. The relative portion shall contain no dot or dot-dot
       components, no trailing <slash> characters, and only single <slash>
       characters between pathname components.

       The _f_i_n_d utility shall be able to descend to arbitrary depths in a file
       hierarchy and shall not fail due to path length limitations (unless a
       _p_a_t_h operand specified by the application exceeds {PATH_MAX}
       requirements).

       The _f_i_n_d utility shall detect infinite loops; that is, entering a
       previously visited directory that is an ancestor of the last file
       encountered.  When it detects an infinite loop, _f_i_n_d shall write a
       diagnostic message to standard error and shall either recover its
       position in the hierarchy or terminate.

       If a file is removed from or added to the directory hierarchy being
       searched it is unspecified whether or not _f_i_n_d includes that file in
       its search.

OOPPTTIIOONNSS
       The _f_i_n_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported by the implementation:

       −−HH        Cause the file information and file type evaluated for each
                 symbolic link encountered as a _p_a_t_h operand on the command
                 line to be those of the file referenced by the link, and not
                 the link itself. If the referenced file does not exist, the
                 file information and type shall be for the link itself. File
                 information and type for symbolic links encountered during
                 the traversal of a file hierarchy shall be that of the link
                 itself.

       −−LL        Cause the file information and file type evaluated for each
                 symbolic link encountered as a _p_a_t_h operand on the command
                 line or encountered during the traversal of a file hierarchy
                 to be those of the file referenced by the link, and not the
                 link itself. If the referenced file does not exist, the file
                 information and type shall be for the link itself.

       Specifying more than one of the mutually-exclusive options −−HH and −−LL
       shall not be considered an error. The last option specified shall
       determine the behavior of the utility. If neither the −−HH nor the −−LL
       option is specified, then the file information and type for symbolic
       links encountered as a _p_a_t_h operand on the command line or encountered
       during the traversal of a file hierarchy shall be that of the link
       itself.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       The first operand and subsequent operands up to but not including the
       first operand that starts with a ''−−'', or is a ''!!'' or a ''(('', shall be
       interpreted as _p_a_t_h operands. If the first operand starts with a ''−−'',
       or is a ''!!'' or a ''(('', the behavior is unspecified. Each _p_a_t_h operand is
       a pathname of a starting point in the file hierarchy.

       The first operand that starts with a ''−−'', or is a ''!!'' or a ''(('', and all
       subsequent arguments shall be interpreted as an _e_x_p_r_e_s_s_i_o_n made up of
       the following primaries and operators. In the descriptions, wherever _n
       is used as a primary argument, it shall be interpreted as a decimal
       integer optionally preceded by a plus (''++'') or minus-sign (''−−'') sign,
       as follows:

       +_n        More than _n.

       _n         Exactly _n.

       −_n        Less than _n.

       The following primaries shall be supported:

       −−nnaammee  _p_a_t_t_e_r_n
                 The primary shall evaluate as true if the basename of the
                 current pathname matches _p_a_t_t_e_r_n using the pattern matching
                 notation described in _S_e_c_t_i_o_n _2_._1_3, _P_a_t_t_e_r_n _M_a_t_c_h_i_n_g
                 _N_o_t_a_t_i_o_n.  The additional rules in _S_e_c_t_i_o_n _2_._1_3_._3, _P_a_t_t_e_r_n_s
                 _U_s_e_d _f_o_r _F_i_l_e_n_a_m_e _E_x_p_a_n_s_i_o_n do not apply as this is a
                 matching operation, not an expansion.

       −−ppaatthh  _p_a_t_t_e_r_n
                 The primary shall evaluate as true if the current pathname
                 matches _p_a_t_t_e_r_n using the pattern matching notation described
                 in _S_e_c_t_i_o_n _2_._1_3, _P_a_t_t_e_r_n _M_a_t_c_h_i_n_g _N_o_t_a_t_i_o_n.  The additional
                 rules in _S_e_c_t_i_o_n _2_._1_3_._3, _P_a_t_t_e_r_n_s _U_s_e_d _f_o_r _F_i_l_e_n_a_m_e _E_x_p_a_n_s_i_o_n
                 do not apply as this is a matching operation, not an
                 expansion.

       −−nnoouusseerr   The primary shall evaluate as true if the file belongs to a
                 user ID for which the _g_e_t_p_w_u_i_d() function defined in the
                 System Interfaces volume of POSIX.1‐2008 (or equivalent)
                 returns NULL.

       −−nnooggrroouupp  The primary shall evaluate as true if the file belongs to a
                 group ID for which the _g_e_t_g_r_g_i_d() function defined in the
                 System Interfaces volume of POSIX.1‐2008 (or equivalent)
                 returns NULL.

       −−xxddeevv     The primary shall always evaluate as true; it shall cause
                 _f_i_n_d not to continue descending past directories that have a
                 different device ID (_s_t___d_e_v, see the _s_t_a_t() function defined
                 in the System Interfaces volume of POSIX.1‐2008). If any
                 −−xxddeevv primary is specified, it shall apply to the entire
                 expression even if the −−xxddeevv primary would not normally be
                 evaluated.

       −−pprruunnee    The primary shall always evaluate as true; it shall cause
                 _f_i_n_d not to descend the current pathname if it is a
                 directory. If the −−ddeepptthh primary is specified, the −−pprruunnee
                 primary shall have no effect.

       −−ppeerrmm  [[−−]]_m_o_d_e
                 The _m_o_d_e argument is used to represent file mode bits. It
                 shall be identical in format to the _s_y_m_b_o_l_i_c___m_o_d_e operand
                 described in _c_h_m_o_d, and shall be interpreted as follows. To
                 start, a template shall be assumed with all file mode bits
                 cleared. An _o_p symbol of ''++'' shall set the appropriate mode
                 bits in the template; ''−−'' shall clear the appropriate bits;
                 ''=='' shall set the appropriate mode bits, without regard to
                 the contents of the file mode creation mask of the process.
                 The _o_p symbol of ''−−'' cannot be the first character of _m_o_d_e;
                 this avoids ambiguity with the optional leading <hyphen>.
                 Since the initial mode is all bits off, there are not any
                 symbolic modes that need to use ''−−'' as the first character.

                 If the <hyphen> is omitted, the primary shall evaluate as
                 true when the file permission bits exactly match the value of
                 the resulting template.

                 Otherwise, if _m_o_d_e is prefixed by a <hyphen>, the primary
                 shall evaluate as true if at least all the bits in the
                 resulting template are set in the file permission bits.

       −−ppeerrmm  [[−−]]_o_n_u_m
                 If the <hyphen> is omitted, the primary shall evaluate as
                 true when the file mode bits exactly match the value of the
                 octal number _o_n_u_m (see the description of the octal _m_o_d_e in
                 _c_h_m_o_d).  Otherwise, if _o_n_u_m is prefixed by a <hyphen>, the
                 primary shall evaluate as true if at least all of the bits
                 specified in _o_n_u_m are set. In both cases, the behavior is
                 unspecified when _o_n_u_m exceeds 07777.

       −−ttyyppee  _c   The primary shall evaluate as true if the type of the file is
                 _c, where _c is ''bb'', ''cc'', ''dd'', ''ll'', ''pp'', ''ff'', or ''ss'' for block
                 special file, character special file, directory, symbolic
                 link, FIFO, regular file, or socket, respectively.

       −−lliinnkkss  _n  The primary shall evaluate as true if the file has _n links.

       −−uusseerr  _u_n_a_m_e
                 The primary shall evaluate as true if the file belongs to the
                 user _u_n_a_m_e_.  If _u_n_a_m_e is a decimal integer and the _g_e_t_p_w_n_a_m()
                 (or equivalent) function does not return a valid user name,
                 _u_n_a_m_e shall be interpreted as a user ID.

       −−ggrroouupp  _g_n_a_m_e
                 The primary shall evaluate as true if the file belongs to the
                 group _g_n_a_m_e.  If _g_n_a_m_e is a decimal integer and the
                 _g_e_t_g_r_n_a_m() (or equivalent) function does not return a valid
                 group name, _g_n_a_m_e shall be interpreted as a group ID.

       −−ssiizzee  _n[[cc]]
                 The primary shall evaluate as true if the file size in bytes,
                 divided by 512 and rounded up to the next integer, is _n.  If
                 _n is followed by the character ''cc'', the size shall be in
                 bytes.

       −−aattiimmee  _n  The primary shall evaluate as true if the file access time
                 subtracted from the initialization time, divided by 86400
                 (with any remainder discarded), is _n.

       −−ccttiimmee  _n  The primary shall evaluate as true if the time of last change
                 of file status information subtracted from the initialization
                 time, divided by 86400 (with any remainder discarded), is _n.

       −−mmttiimmee  _n  The primary shall evaluate as true if the file modification
                 time subtracted from the initialization time, divided by
                 86400 (with any remainder discarded), is _n.

       −−eexxeecc  _u_t_i_l_i_t_y___n_a_m_e_ [[_a_r_g_u_m_e_n_t ...]]  ;;

       −−eexxeecc  _u_t_i_l_i_t_y___n_a_m_e_ [[_a_r_g_u_m_e_n_t ...]]    {} +
                 The end of the primary expression shall be punctuated by a
                 <semicolon> or by a <plus-sign>.  Only a <plus-sign> that
                 immediately follows an argument containing only the two
                 characters ""{{}}"" shall punctuate the end of the primary
                 expression. Other uses of the <plus-sign> shall not be
                 treated as special.

                 If the primary expression is punctuated by a <semicolon>, the
                 utility _u_t_i_l_i_t_y___n_a_m_e shall be invoked once for each pathname
                 and the primary shall evaluate as true if the utility returns
                 a zero value as exit status. A _u_t_i_l_i_t_y___n_a_m_e or _a_r_g_u_m_e_n_t
                 containing only the two characters ""{{}}"" shall be replaced by
                 the current pathname. If a _u_t_i_l_i_t_y___n_a_m_e or _a_r_g_u_m_e_n_t string
                 contains the two characters ""{{}}"", but not just the two
                 characters ""{{}}"", it is implementation-defined whether _f_i_n_d
                 replaces those two characters or uses the string without
                 change.

                 If the primary expression is punctuated by a <plus-sign>, the
                 primary shall always evaluate as true, and the pathnames for
                 which the primary is evaluated shall be aggregated into sets.
                 The utility _u_t_i_l_i_t_y___n_a_m_e shall be invoked once for each set
                 of aggregated pathnames. Each invocation shall begin after
                 the last pathname in the set is aggregated, and shall be
                 completed before the _f_i_n_d utility exits and before the first
                 pathname in the next set (if any) is aggregated for this
                 primary, but it is otherwise unspecified whether the
                 invocation occurs before, during, or after the evaluations of
                 other primaries. If any invocation returns a non-zero value
                 as exit status, the _f_i_n_d utility shall return a non-zero exit
                 status. An argument containing only the two characters ""{{}}""
                 shall be replaced by the set of aggregated pathnames, with
                 each pathname passed as a separate argument to the invoked
                 utility in the same order that it was aggregated. The size of
                 any set of two or more pathnames shall be limited such that
                 execution of the utility does not cause the system's
                 {ARG_MAX} limit to be exceeded. If more than one argument
                 containing the two characters ""{{}}"" is present, the behavior
                 is unspecified.

                 The current directory for the invocation of _u_t_i_l_i_t_y___n_a_m_e
                 shall be the same as the current directory when the _f_i_n_d
                 utility was started. If the _u_t_i_l_i_t_y___n_a_m_e names any of the
                 special built-in utilities (see _S_e_c_t_i_o_n _2_._1_4, _S_p_e_c_i_a_l
                 _B_u_i_l_t_-_I_n _U_t_i_l_i_t_i_e_s), the results are undefined.

       −−ookk  _u_t_i_l_i_t_y___n_a_m_e_ [[_a_r_g_u_m_e_n_t ...]]  ;;
                 The −−ookk primary shall be equivalent to −−eexxeecc, except that the
                 use of a <plus-sign> to punctuate the end of the primary
                 expression need not be supported, and _f_i_n_d shall request
                 affirmation of the invocation of _u_t_i_l_i_t_y___n_a_m_e using the
                 current file as an argument by writing to standard error as
                 described in the STDERR section. If the response on standard
                 input is affirmative, the utility shall be invoked.
                 Otherwise, the command shall not be invoked and the value of
                 the −−ookk operand shall be false.

       −−pprriinntt    The primary shall always evaluate as true; it shall cause the
                 current pathname to be written to standard output.

       −−nneewweerr  _f_i_l_e
                 The primary shall evaluate as true if the modification time
                 of the current file is more recent than the modification time
                 of the file named by the pathname _f_i_l_e.

       −−ddeepptthh    The primary shall always evaluate as true; it shall cause
                 descent of the directory hierarchy to be done so that all
                 entries in a directory are acted on before the directory
                 itself. If a −−ddeepptthh primary is not specified, all entries in
                 a directory shall be acted on after the directory itself. If
                 any −−ddeepptthh primary is specified, it shall apply to the entire
                 expression even if the −−ddeepptthh primary would not normally be
                 evaluated.

       The primaries can be combined using the following operators (in order
       of decreasing precedence):

       ( _e_x_p_r_e_s_s_i_o_n )
                 True if _e_x_p_r_e_s_s_i_o_n is true.

       !!  _e_x_p_r_e_s_s_i_o_n
                 Negation of a primary; the unary NOT operator.

       _e_x_p_r_e_s_s_i_o_n_ [[−−aa]]  _e_x_p_r_e_s_s_i_o_n
                 Conjunction of primaries; the AND operator is implied by the
                 juxtaposition of two primaries or made explicit by the
                 optional −−aa operator. The second expression shall not be
                 evaluated if the first expression is false.

       _e_x_p_r_e_s_s_i_o_n_ −−oo  _e_x_p_r_e_s_s_i_o_n
                 Alternation of primaries; the OR operator. The second
                 expression shall not be evaluated if the first expression is
                 true.

       If no _e_x_p_r_e_s_s_i_o_n is present, −−pprriinntt shall be used as the expression.
       Otherwise, if the given expression does not contain any of the
       primaries −−eexxeecc, −−ookk, or −−pprriinntt, the given expression shall be
       effectively replaced by:


           (( _g_i_v_e_n___e_x_p_r_e_s_s_i_o_n )) −−pprriinntt

       The −−uusseerr, −−ggrroouupp, and −−nneewweerr primaries each shall evaluate their
       respective arguments only once.

       When the file type evaluated for the current file is a symbolic link,
       the results of evaluating the −−ppeerrmm primary are implementation-defined.

SSTTDDIINN
       If the −−ookk primary is used, the response shall be read from the
       standard input.  An entire line shall be read as the response.
       Otherwise, the standard input shall not be used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _f_i_n_d:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for the behavior of ranges, equivalence
                 classes, and multi-character collating elements used in the
                 pattern matching notation for the −−nn option and in the
                 extended regular expression defined for the yyeesseexxpprr locale
                 keyword in the _L_C___M_E_S_S_A_G_E_S category.

       _L_C___C_T_Y_P_E  This variable determines the locale for the interpretation of
                 sequences of bytes of text data as characters (for example,
                 single-byte as opposed to multi-byte characters in
                 arguments), the behavior of character classes within the
                 pattern matching notation used for the −−nn option, and the
                 behavior of character classes within regular expressions used
                 in the extended regular expression defined for the yyeesseexxpprr
                 locale keyword in the _L_C___M_E_S_S_A_G_E_S category.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale used to process affirmative responses,
                 and the locale used to affect the format and contents of
                 diagnostic messages and prompts written to standard error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _P_A_T_H      Determine the location of the _u_t_i_l_i_t_y___n_a_m_e for the −−eexxeecc and
                 −−ookk primaries, as described in the Base Definitions volume of
                 POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The −−pprriinntt primary shall cause the current pathnames to be written to
       standard output. The format shall be:


           ""%%ss\\nn"",, <<_p_a_t_h>

SSTTDDEERRRR
       The −−ookk primary shall write a prompt to standard error containing at
       least the _u_t_i_l_i_t_y___n_a_m_e to be invoked and the current pathname. In the
       POSIX locale, the last non-<blank> in the prompt shall be ''??''.  The
       exact format used is unspecified.

       Otherwise, the standard error shall be used only for diagnostic
       messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All _p_a_t_h operands were traversed successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       When used in operands, pattern matching notation, <semicolon>, <left-
       parenthesis>, and <right-parenthesis> characters are special to the
       shell and must be quoted (see _S_e_c_t_i_o_n _2_._2, _Q_u_o_t_i_n_g).

       The bit that is traditionally used for sticky (historically 01000) is
       specified in the −−ppeerrmm primary using the octal number argument form.
       Since this bit is not defined by this volume of POSIX.1‐2008,
       applications must not assume that it actually refers to the traditional
       sticky bit.

EEXXAAMMPPLLEESS
        1. The following commands are equivalent:


               ffiinndd ..
               ffiinndd .. −−pprriinntt

           They both write out the entire directory hierarchy from the current
           directory.

        2. The following command:


               ffiinndd // \\(( −−nnaammee ttmmpp −−oo −−nnaammee ''**..xxxx'' \\)) −−aattiimmee ++77 −−eexxeecc rrmm {{}} \\;;

           removes all files named ttmmpp or ending in ..xxxx that have not been
           accessed for seven or more 24-hour periods.

        3. The following command:


               ffiinndd .. −−ppeerrmm −−oo++ww,,++ss

           prints (−−pprriinntt is assumed) the names of all files in or below the
           current directory, with all of the file permission bits S_ISUID,
           S_ISGID, and S_IWOTH set.

        4. The following command:


               ffiinndd .. −−nnaammee SSCCCCSS −−pprruunnee −−oo −−pprriinntt

           recursively prints pathnames of all files in the current directory
           and below, but skips directories named SCCS and files in them.

        5. The following command:


               ffiinndd .. −−pprriinntt −−nnaammee SSCCCCSS −−pprruunnee

           behaves as in the previous example, but prints the names of the
           SCCS directories.

        6. The following command is roughly equivalent to the −−nntt extension to
           _t_e_s_t:


               iiff [[ −−nn ""$$((ffiinndd ffiillee11 −−pprruunnee −−nneewweerr ffiillee22))"" ]];; tthheenn
                   pprriinnttff %%ss\\\\nn ""ffiillee11 iiss nneewweerr tthhaann ffiillee22""
               ffii

        7. The descriptions of −−aattiimmee, −−ccttiimmee, and −−mmttiimmee use the terminology
           _n ``86400 second periods (days)''. For example, a file accessed at
           23:59 is selected by:


               ffiinndd .. −−aattiimmee −−11 −−pprriinntt

           at 00:01 the next day (less than 24 hours later, not more than one
           day ago); the midnight boundary between days has no effect on the
           24-hour calculation.

        8. The following command:


               ffiinndd .. !! −−nnaammee .. −−pprruunnee −−nnaammee ''**..oolldd'' −−eexxeecc \\
                   sshh −−cc ''mmvv ""$$@@"" ....//oolldd//'' sshh {{}} ++

           performs the same task as:


               mmvv ..//**..oolldd ..//..oolldd ..//..**..oolldd ....//oolldd//

           while avoiding an ``Argument list too long'' error if there are a
           large number of files ending with ..oolldd and without running _m_v if
           there are no such files (and avoiding ``No such file or directory''
           errors if ..//..oolldd does not exist or no files match ..//**..oolldd or
           ..//..**..oolldd).

           The alternative:


               ffiinndd .. !! −−nnaammee .. −−pprruunnee −−nnaammee ''**..oolldd'' −−eexxeecc mmvv {{}} ....//oolldd// \\;;

           is less efficient if there are many files to move because it
           executes one _m_v command per file.

        9. On systems configured to mount removable media on directories under
           //mmeeddiiaa, the following command searches the file hierarchy for files
           larger than 100000 KB without searching any mounted removable
           media:


               ffiinndd // −−ppaatthh //mmeeddiiaa −−pprruunnee −−oo −−ssiizzee ++220000000000 −−pprriinntt

       10. Except for the root directory, and ""////"" on implementations where
           ""////"" does not refer to the root directory, no pattern given to
           −−nnaammee will match a <slash>, because trailing <slash> characters are
           ignored when computing the basename of the file under evaluation.
           Given two empty directories named ffoooo and bbaarr, the following
           command:


               ffiinndd ffoooo////// bbaarr////// −−nnaammee ffoooo −−oo −−nnaammee ''bbaarr??**''

           prints only the line ""ffoooo//////"".

RRAATTIIOONNAALLEE
       The −−aa operator was retained as an optional operator for compatibility
       with historical shell scripts, even though it is redundant with
       expression concatenation.

       The descriptions of the ''−−'' modifier on the _m_o_d_e and _o_n_u_m arguments to
       the −−ppeerrmm primary agree with historical practice on BSD and System V
       implementations. System V and BSD documentation both describe it in
       terms of checking additional bits; in fact, it uses the same bits, but
       checks for having at least all of the matching bits set instead of
       having exactly the matching bits set.

       The exact format of the interactive prompts is unspecified. Only the
       general nature of the contents of prompts are specified because:

        *  Implementations may desire more descriptive prompts than those used
           on historical implementations.

        *  Since the historical prompt strings do not terminate with <newline>
           characters, there is no portable way for another program to
           interact with the prompts of this utility via pipes.

       Therefore, an application using this prompting option relies on the
       system to provide the most suitable dialog directly with the user,
       based on the general guidelines specified.

       The −−nnaammee _f_i_l_e operand was changed to use the shell pattern matching
       notation so that _f_i_n_d is consistent with other utilities using pattern
       matching.

       The −−ssiizzee operand refers to the size of a file, rather than the number
       of blocks it may occupy in the file system. The intent is that the
       _s_t___s_i_z_e field defined in the System Interfaces volume of POSIX.1‐2008
       should be used, not the _s_t___b_l_o_c_k_s found in historical implementations.
       There are at least two reasons for this:

        1. In both System V and BSD, _f_i_n_d only uses _s_t___s_i_z_e in size
           calculations for the operands specified by this volume of
           POSIX.1‐2008. (BSD uses _s_t___b_l_o_c_k_s only when processing the −−llss
           primary.)

        2. Users usually think of file size in terms of bytes, which is also
           the unit used by the _l_s utility for the output from the −−ll option.
           (In both System V and BSD, _l_s uses _s_t___s_i_z_e for the −−ll option size
           field and uses _s_t___b_l_o_c_k_s for the _l_s −−ss calculations. This volume of
           POSIX.1‐2008 does not specify _l_s −−ss.)

       The descriptions of −−aattiimmee, −−ccttiimmee, and −−mmttiimmee were changed from the
       SVID description of _n ``days'' to _n being the result of the integer
       division of the time difference in seconds by 86400. The description is
       also different in terms of the exact timeframe for the _n case (_v_e_r_s_u_s
       the _+_n or _−_n), but it matches all known historical implementations. It
       refers to one 86400 second period in the past, not any time from the
       beginning of that period to the current time. For example, −−aattiimmee 2 is
       true if the file was accessed any time in the period from 72 hours to
       48 hours ago.

       Historical implementations do not modify ""{{}}"" when it appears as a
       substring of an −−eexxeecc or −−ookk _u_t_i_l_i_t_y___n_a_m_e or argument string. There
       have been numerous user requests for this extension, so this volume of
       POSIX.1‐2008 allows the desired behavior. At least one recent
       implementation does support this feature, but encountered several
       problems in managing memory allocation and dealing with multiple
       occurrences of ""{{}}"" in a string while it was being developed, so it is
       not yet required behavior.

       Assuming the presence of −−pprriinntt was added to correct a historical
       pitfall that plagues novice users, it is entirely upwards-compatible
       from the historical System V _f_i_n_d utility. In its simplest form (_f_i_n_d
       _d_i_r_e_c_t_o_r_y), it could be confused with the historical BSD fast _f_i_n_d.
       The BSD developers agreed that adding −−pprriinntt as a default expression
       was the correct decision and have added the fast _f_i_n_d functionality
       within a new utility called _l_o_c_a_t_e.

       Historically, the −−LL option was implemented using the primary −−ffoollllooww.
       The −−HH and −−LL options were added for two reasons. First, they offer a
       finer granularity of control and consistency with other programs that
       walk file hierarchies. Second, the −−ffoollllooww primary always evaluated to
       true. As they were historically really global variables that took
       effect before the traversal began, some valid expressions had
       unexpected results. An example is the expression −−pprriinntt −−oo −−ffoollllooww.
       Because −−pprriinntt always evaluates to true, the standard order of
       evaluation implies that −−ffoollllooww would never be evaluated. This was
       never the case. Historical practice for the −−ffoollllooww primary, however,
       is not consistent. Some implementations always follow symbolic links on
       the command line whether −−ffoollllooww is specified or not. Others follow
       symbolic links on the command line only if −−ffoollllooww is specified. Both
       behaviors are provided by the −−HH and −−LL options, but scripts using the
       current −−ffoollllooww primary would be broken if the −−ffoollllooww option is
       specified to work either way.

       Since the −−LL option resolves all symbolic links and the −−ttyyppee _l primary
       is true for symbolic links that still exist after symbolic links have
       been resolved, the command:


           ffiinndd −−LL .. −−ttyyppee ll

       prints a list of symbolic links reachable from the current directory
       that do not resolve to accessible files.

       A feature of SVR4's _f_i_n_d utility was the −−eexxeecc primary's ++ terminator.
       This allowed filenames containing special characters (especially
       <newline> characters) to be grouped together without the problems that
       occur if such filenames are piped to _x_a_r_g_s.  Other implementations have
       added other ways to get around this problem, notably a −−pprriinntt00 primary
       that wrote filenames with a null byte terminator. This was considered
       here, but not adopted. Using a null terminator meant that any utility
       that was going to process _f_i_n_d's −−pprriinntt00 output had to add a new option
       to parse the null terminators it would now be reading.

       The ""−−eexxeecc...{{}}+" syntax adopted was a result of IEEE PASC
       Interpretation 1003.2 #210. It should be noted that this is an
       incompatible change to IEEE Std 1003.2‐1992. For example, the following
       command printed all files with a ''−−'' after their name if they are
       regular files, and a ''++'' otherwise:


           ffiinndd // −−ttyyppee ff −−eexxeecc eecchhoo {{}} −− '';;'' −−oo −−eexxeecc eecchhoo {{}} ++ '';;''

       The change invalidates usage like this. Even though the previous
       standard stated that this usage would work, in practice many did not
       support it and the standard developers felt it better to now state that
       this was not allowable.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _2_._2, _Q_u_o_t_i_n_g, _S_e_c_t_i_o_n _2_._1_3, _P_a_t_t_e_r_n _M_a_t_c_h_i_n_g _N_o_t_a_t_i_o_n, _S_e_c_t_i_o_n
       _2_._1_4, _S_p_e_c_i_a_l _B_u_i_l_t_-_I_n _U_t_i_l_i_t_i_e_s, _c_h_m_o_d, _m_v, _p_a_x, _s_h, _t_e_s_t

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _f_s_t_a_t_a_t(), _g_e_t_g_r_g_i_d(),
       _g_e_t_p_w_u_i_d()

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



IEEE/The Open Group                  2013                             FIND(1P)
