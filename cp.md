CP(1P)                     POSIX Programmer's Manual                    CP(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       cp — copy files

SSYYNNOOPPSSIISS
       cp [[−Pfip]] _s_o_u_r_c_e___f_i_l_e _t_a_r_g_e_t___f_i_l_e

       cp [[−Pfip]] _s_o_u_r_c_e___f_i_l_e... _t_a_r_g_e_t

       cp −R [[−H|−L|−P]] [[−fip]] _s_o_u_r_c_e___f_i_l_e... _t_a_r_g_e_t

DDEESSCCRRIIPPTTIIOONN
       The first synopsis form is denoted by two operands, neither of which
       are existing files of type directory. The _c_p utility shall copy the
       contents of _s_o_u_r_c_e___f_i_l_e (or, if _s_o_u_r_c_e___f_i_l_e is a file of type symbolic
       link, the contents of the file referenced by _s_o_u_r_c_e___f_i_l_e) to the
       destination path named by _t_a_r_g_e_t___f_i_l_e_.

       The second synopsis form is denoted by two or more operands where the
       −−RR option is not specified and the first synopsis form is not
       applicable. It shall be an error if any _s_o_u_r_c_e___f_i_l_e is a file of type
       directory, if _t_a_r_g_e_t does not exist, or if _t_a_r_g_e_t does not name a
       directory. The _c_p utility shall copy the contents of each _s_o_u_r_c_e___f_i_l_e
       (or, if _s_o_u_r_c_e___f_i_l_e is a file of type symbolic link, the contents of
       the file referenced by _s_o_u_r_c_e___f_i_l_e) to the destination path named by
       the concatenation of _t_a_r_g_e_t, a single <slash> character if _t_a_r_g_e_t did
       not end in a <slash>, and the last component of _s_o_u_r_c_e___f_i_l_e.

       The third synopsis form is denoted by two or more operands where the −−RR
       option is specified. The _c_p utility shall copy each file in the file
       hierarchy rooted in each _s_o_u_r_c_e___f_i_l_e to a destination path named as
       follows:

        *  If _t_a_r_g_e_t exists and names an existing directory, the name of the
           corresponding destination path for each file in the file hierarchy
           shall be the concatenation of _t_a_r_g_e_t, a single <slash> character if
           _t_a_r_g_e_t did not end in a <slash>, and the pathname of the file
           relative to the directory containing _s_o_u_r_c_e___f_i_l_e.

        *  If _t_a_r_g_e_t does not exist and two operands are specified, the name
           of the corresponding destination path for _s_o_u_r_c_e___f_i_l_e shall be
           _t_a_r_g_e_t; the name of the corresponding destination path for all
           other files in the file hierarchy shall be the concatenation of
           _t_a_r_g_e_t, a <slash> character, and the pathname of the file relative
           to _s_o_u_r_c_e___f_i_l_e.

       It shall be an error if _t_a_r_g_e_t does not exist and more than two
       operands are specified, or if _t_a_r_g_e_t exists and does not name a
       directory.

       In the following description, the term _d_e_s_t___f_i_l_e refers to the file
       named by the destination path. The term _s_o_u_r_c_e___f_i_l_e refers to the file
       that is being copied, whether specified as an operand or a file in a
       file hierarchy rooted in a _s_o_u_r_c_e___f_i_l_e operand. If _s_o_u_r_c_e___f_i_l_e is a
       file of type symbolic link:

        *  If the −−RR option was not specified, _c_p shall take actions based on
           the type and contents of the file referenced by the symbolic link,
           and not by the symbolic link itself, unless the −−PP option was
           specified.

        *  If the −−RR option was specified:

           --  If none of the options −−HH, −−LL, nor −−PP were specified, it is
               unspecified which of −−HH, −−LL, or −−PP will be used as a default.

           --  If the −−HH option was specified, _c_p shall take actions based on
               the type and contents of the file referenced by any symbolic
               link specified as a _s_o_u_r_c_e___f_i_l_e operand.

           --  If the −−LL option was specified, _c_p shall take actions based on
               the type and contents of the file referenced by any symbolic
               link specified as a _s_o_u_r_c_e___f_i_l_e operand or any symbolic links
               encountered during traversal of a file hierarchy.

           --  If the −−PP option was specified, _c_p shall copy any symbolic link
               specified as a _s_o_u_r_c_e___f_i_l_e operand and any symbolic links
               encountered during traversal of a file hierarchy, and shall not
               follow any symbolic links.

       For each _s_o_u_r_c_e___f_i_l_e, the following steps shall be taken:

        1. If _s_o_u_r_c_e___f_i_l_e references the same file as _d_e_s_t___f_i_l_e, _c_p may write
           a diagnostic message to standard error; it shall do nothing more
           with _s_o_u_r_c_e___f_i_l_e and shall go on to any remaining files.

        2. If _s_o_u_r_c_e___f_i_l_e is of type directory, the following steps shall be
           taken:

            a. If the −−RR option was not specified, _c_p shall write a diagnostic
               message to standard error, do nothing more with _s_o_u_r_c_e___f_i_l_e,
               and go on to any remaining files.

            b. If _s_o_u_r_c_e___f_i_l_e was not specified as an operand and _s_o_u_r_c_e___f_i_l_e
               is dot or dot-dot, _c_p shall do nothing more with _s_o_u_r_c_e___f_i_l_e
               and go on to any remaining files.

            c. If _d_e_s_t___f_i_l_e exists and it is a file type not specified by the
               System Interfaces volume of POSIX.1‐2008, the behavior is
               implementation-defined.

            d. If _d_e_s_t___f_i_l_e exists and it is not of type directory, _c_p shall
               write a diagnostic message to standard error, do nothing more
               with _s_o_u_r_c_e___f_i_l_e or any files below _s_o_u_r_c_e___f_i_l_e in the file
               hierarchy, and go on to any remaining files.

            e. If the directory _d_e_s_t___f_i_l_e does not exist, it shall be created
               with file permission bits set to the same value as those of
               _s_o_u_r_c_e___f_i_l_e, modified by the file creation mask of the user if
               the −−pp option was not specified, and then bitwise-inclusively
               OR'ed with S_IRWXU. If _d_e_s_t___f_i_l_e cannot be created, _c_p shall
               write a diagnostic message to standard error, do nothing more
               with _s_o_u_r_c_e___f_i_l_e, and go on to any remaining files. It is
               unspecified if _c_p attempts to copy files in the file hierarchy
               rooted in _s_o_u_r_c_e___f_i_l_e.

            f. The files in the directory _s_o_u_r_c_e___f_i_l_e shall be copied to the
               directory _d_e_s_t___f_i_l_e, taking the four steps (1 to 4) listed here
               with the files as _s_o_u_r_c_e___f_i_l_es.

            g. If _d_e_s_t___f_i_l_e was created, its file permission bits shall be
               changed (if necessary) to be the same as those of _s_o_u_r_c_e___f_i_l_e,
               modified by the file creation mask of the user if the −−pp option
               was not specified.

            h. The _c_p utility shall do nothing more with _s_o_u_r_c_e___f_i_l_e and go on
               to any remaining files.

        3. If _s_o_u_r_c_e___f_i_l_e is of type regular file, the following steps shall
           be taken:

            a. The behavior is unspecified if _d_e_s_t___f_i_l_e exists and was written
               by a previous step. Otherwise, if _d_e_s_t___f_i_l_e exists, the
               following steps shall be taken:

                i.  If the −−ii option is in effect, the _c_p utility shall write
                    a prompt to the standard error and read a line from the
                    standard input. If the response is not affirmative, _c_p
                    shall do nothing more with _s_o_u_r_c_e___f_i_l_e and go on to any
                    remaining files.

               ii.  A file descriptor for _d_e_s_t___f_i_l_e shall be obtained by
                    performing actions equivalent to the _o_p_e_n() function
                    defined in the System Interfaces volume of POSIX.1‐2008
                    called using _d_e_s_t___f_i_l_e as the _p_a_t_h argument, and the
                    bitwise-inclusive OR of O_WRONLY and O_TRUNC as the _o_f_l_a_g
                    argument.

               iii. If the attempt to obtain a file descriptor fails and the
                    −−ff option is in effect, _c_p shall attempt to remove the
                    file by performing actions equivalent to the _u_n_l_i_n_k()
                    function defined in the System Interfaces volume of
                    POSIX.1‐2008 called using _d_e_s_t___f_i_l_e as the _p_a_t_h argument.
                    If this attempt succeeds, _c_p shall continue with step 3b.

            b. If _d_e_s_t___f_i_l_e does not exist, a file descriptor shall be
               obtained by performing actions equivalent to the _o_p_e_n()
               function defined in the System Interfaces volume of
               POSIX.1‐2008 called using _d_e_s_t___f_i_l_e as the _p_a_t_h argument, and
               the bitwise-inclusive OR of O_WRONLY and O_CREAT as the _o_f_l_a_g
               argument. The file permission bits of _s_o_u_r_c_e___f_i_l_e shall be the
               _m_o_d_e argument.

            c. If the attempt to obtain a file descriptor fails, _c_p shall
               write a diagnostic message to standard error, do nothing more
               with _s_o_u_r_c_e___f_i_l_e, and go on to any remaining files.

            d. The contents of _s_o_u_r_c_e___f_i_l_e shall be written to the file
               descriptor. Any write errors shall cause _c_p to write a
               diagnostic message to standard error and continue to step 3e.

            e. The file descriptor shall be closed.

            f. The _c_p utility shall do nothing more with _s_o_u_r_c_e___f_i_l_e.  If a
               write error occurred in step 3d, it is unspecified if _c_p
               continues with any remaining files. If no write error occurred
               in step 3d, _c_p shall go on to any remaining files.

        4. Otherwise, the −−RR option was specified, and the following steps
           shall be taken:

            a. The _d_e_s_t___f_i_l_e shall be created with the same file type as
               _s_o_u_r_c_e___f_i_l_e.

            b. If _s_o_u_r_c_e___f_i_l_e is a file of type FIFO, the file permission bits
               shall be the same as those of _s_o_u_r_c_e___f_i_l_e_, modified by the file
               creation mask of the user if the −−pp option was not specified.
               Otherwise, the permissions, owner ID, and group ID of _d_e_s_t___f_i_l_e
               are implementation-defined.

               If this creation fails for any reason, _c_p shall write a
               diagnostic message to standard error, do nothing more with
               _s_o_u_r_c_e___f_i_l_e, and go on to any remaining files.

            c. If _s_o_u_r_c_e___f_i_l_e is a file of type symbolic link, and the options
               require the symbolic link itself to be acted upon, the pathname
               contained in _d_e_s_t___f_i_l_e shall be the same as the pathname
               contained in _s_o_u_r_c_e___f_i_l_e.

               If this fails for any reason, _c_p shall write a diagnostic
               message to standard error, do nothing more with _s_o_u_r_c_e___f_i_l_e,
               and go on to any remaining files.

       If the implementation provides additional or alternate access control
       mechanisms (see the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n
       _4_._4, _F_i_l_e _A_c_c_e_s_s _P_e_r_m_i_s_s_i_o_n_s), their effect on copies of files is
       implementation-defined.

OOPPTTIIOONNSS
       The _c_p utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−ff        If a file descriptor for a destination file cannot be
                 obtained, as described in step 3.a.ii., attempt to unlink the
                 destination file and proceed.

       −−HH        Take actions based on the type and contents of the file
                 referenced by any symbolic link specified as a _s_o_u_r_c_e___f_i_l_e
                 operand.

       −−ii        Write a prompt to standard error before copying to any
                 existing non-directory destination file. If the response from
                 the standard input is affirmative, the copy shall be
                 attempted; otherwise, it shall not.

       −−LL        Take actions based on the type and contents of the file
                 referenced by any symbolic link specified as a _s_o_u_r_c_e___f_i_l_e
                 operand or any symbolic links encountered during traversal of
                 a file hierarchy.

       −−PP        Take actions on any symbolic link specified as a _s_o_u_r_c_e___f_i_l_e
                 operand or any symbolic link encountered during traversal of
                 a file hierarchy.

       −−pp        Duplicate the following characteristics of each source file
                 in the corresponding destination file:

                  1. The time of last data modification and time of last
                     access. If this duplication fails for any reason, _c_p
                     shall write a diagnostic message to standard error.

                  2. The user ID and group ID. If this duplication fails for
                     any reason, it is unspecified whether _c_p writes a
                     diagnostic message to standard error.

                  3. The file permission bits and the S_ISUID and S_ISGID
                     bits. Other, implementation-defined, bits may be
                     duplicated as well. If this duplication fails for any
                     reason, _c_p shall write a diagnostic message to standard
                     error.

                 If the user ID or the group ID cannot be duplicated, the file
                 permission bits S_ISUID and S_ISGID shall be cleared. If
                 these bits are present in the source file but are not
                 duplicated in the destination file, it is unspecified whether
                 _c_p writes a diagnostic message to standard error.

                 The order in which the preceding characteristics are
                 duplicated is unspecified. The _d_e_s_t___f_i_l_e shall not be deleted
                 if these characteristics cannot be preserved.

       −−RR        Copy file hierarchies.

       Specifying more than one of the mutually-exclusive options −−HH, −−LL, and
       −−PP shall not be considered an error. The last option specified shall
       determine the behavior of the utility.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _s_o_u_r_c_e___f_i_l_e
                 A pathname of a file to be copied. If a _s_o_u_r_c_e___f_i_l_e operand
                 is ''−−'', it shall refer to a file named −−; implementations
                 shall not treat it as meaning standard input.

       _t_a_r_g_e_t___f_i_l_e
                 A pathname of an existing or nonexistent file, used for the
                 output when a single file is copied. If a _t_a_r_g_e_t___f_i_l_e operand
                 is ''−−'', it shall refer to a file named −−; implementations
                 shall not treat it as meaning standard output.

       _t_a_r_g_e_t    A pathname of a directory to contain the copied files.

SSTTDDIINN
       The standard input shall be used to read an input line in response to
       each prompt specified in the STDERR section. Otherwise, the standard
       input shall not be used.

IINNPPUUTT FFIILLEESS
       The input files specified as operands may be of any file type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _c_p:

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
                 extended regular expression defined for the yyeesseexxpprr locale
                 keyword in the _L_C___M_E_S_S_A_G_E_S category.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files) and the behavior of character classes used in the
                 extended regular expression defined for the yyeesseexxpprr locale
                 keyword in the _L_C___M_E_S_S_A_G_E_S category.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale used to process affirmative responses,
                 and the locale used to affect the format and contents of
                 diagnostic messages and prompts written to standard error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Not used.

SSTTDDEERRRR
       A prompt shall be written to standard error under the conditions
       specified in the DESCRIPTION section. The prompt shall contain the
       destination pathname, but its format is otherwise unspecified.
       Otherwise, the standard error shall be used only for diagnostic
       messages.

OOUUTTPPUUTT FFIILLEESS
       The output files may be of any type.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All files were copied successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If _c_p is prematurely terminated by a signal or error, files or file
       hierarchies may be only partially copied and files and directories may
       have incorrect permissions or access and modification times.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The set-user-ID and set-group-ID bits are explicitly cleared when files
       are created. This is to prevent users from creating programs that are
       set-user-ID or set-group-ID to them when copying files or to make set-
       user-ID or set-group-ID files accessible to new groups of users.  For
       example, if a file is set-user-ID and the copy has a different group ID
       than the source, a new group of users has execute permission to a set-
       user-ID program than did previously. In particular, this is a problem
       for superusers copying users' trees.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The −−ii option exists on BSD systems, giving applications and users a
       way to avoid accidentally removing files when copying. Although the 4.3
       BSD version does not prompt if the standard input is not a terminal,
       the standard developers decided that use of −−ii is a request for
       interaction, so when the destination path exists, the utility takes
       instructions from whatever responds on standard input.

       The exact format of the interactive prompts is unspecified. Only the
       general nature of the contents of prompts are specified because
       implementations may desire more descriptive prompts than those used on
       historical implementations. Therefore, an application using the −−ii
       option relies on the system to provide the most suitable dialog
       directly with the user, based on the behavior specified.

       The −−pp option is historical practice on BSD systems, duplicating the
       time of last data modification and time of last access. This volume of
       POSIX.1‐2008 extends it to preserve the user and group IDs, as well as
       the file permissions. This requirement has obvious problems in that the
       directories are almost certainly modified after being copied. This
       volume of POSIX.1‐2008 requires that the modification times be
       preserved. The statement that the order in which the characteristics
       are duplicated is unspecified is to permit implementations to provide
       the maximum amount of security for the user.  Implementations should
       take into account the obvious security issues involved in setting the
       owner, group, and mode in the wrong order or creating files with an
       owner, group, or mode different from the final value.

       It is unspecified whether _c_p writes diagnostic messages when the user
       and group IDs cannot be set due to the widespread practice of users
       using −−pp to duplicate some portion of the file characteristics,
       indifferent to the duplication of others. Historic implementations only
       write diagnostic messages on errors other than [[EEPPEERRMM]].

       Earlier versions of this standard included support for the −−rr option to
       copy file hierarchies. The −−rr option is historical practice on BSD and
       BSD-derived systems. This option is no longer specified by POSIX.1‐2008
       but may be present in some implementations. The −−RR option was added as
       a close synonym to the −−rr option, selected for consistency with all
       other options in this volume of POSIX.1‐2008 that do recursive
       directory descent.

       The difference between −−RR and the removed −−rr option is in the treatment
       by _c_p of file types other than regular and directory. It was
       implementation-defined how the −− option treated special files to allow
       both historical implementations and those that chose to support −−rr with
       the same abilities as −−RR defined by this volume of POSIX.1‐2008. The
       original −−rr flag, for historic reasons, did not handle special files
       any differently from regular files, but always read the file and copied
       its contents. This had obvious problems in the presence of special file
       types; for example, character devices, FIFOs, and sockets.

       When a failure occurs during the copying of a file hierarchy, _c_p is
       required to attempt to copy files that are on the same level in the
       hierarchy or above the file where the failure occurred. It is
       unspecified if _c_p shall attempt to copy files below the file where the
       failure occurred (which cannot succeed in any case).

       Permissions, owners, and groups of created special file types have been
       deliberately left as implementation-defined. This is to allow systems
       to satisfy special requirements (for example, allowing users to create
       character special devices, but requiring them to be owned by a certain
       group). In general, it is strongly suggested that the permissions,
       owner, and group be the same as if the user had run the historical
       _m_k_n_o_d, _l_n, or other utility to create the file. It is also probable
       that additional privileges are required to create block, character, or
       other implementation-defined special file types.

       Additionally, the −−pp option explicitly requires that all set-user-ID
       and set-group-ID permissions be discarded if any of the owner or group
       IDs cannot be set. This is to keep users from unintentionally giving
       away special privilege when copying programs.

       When creating regular files, historical versions of _c_p use the mode of
       the source file as modified by the file mode creation mask. Other
       choices would have been to use the mode of the source file unmodified
       by the creation mask or to use the same mode as would be given to a new
       file created by the user (plus the execution bits of the source file)
       and then modify it by the file mode creation mask. In the absence of
       any strong reason to change historic practice, it was in large part
       retained.

       When creating directories, historical versions of _c_p use the mode of
       the source directory, plus read, write, and search bits for the owner,
       as modified by the file mode creation mask. This is done so that _c_p can
       copy trees where the user has read permission, but the owner does not.
       A side-effect is that if the file creation mask denies the owner
       permissions, _c_p fails. Also, once the copy is done, historical versions
       of _c_p set the permissions on the created directory to be the same as
       the source directory, unmodified by the file creation mask.

       This behavior has been modified so that _c_p is always able to create the
       contents of the directory, regardless of the file creation mask. After
       the copy is done, the permissions are set to be the same as the source
       directory, as modified by the file creation mask. This latter change
       from historical behavior is to prevent users from accidentally creating
       directories with permissions beyond those they would normally set and
       for consistency with the behavior of _c_p in creating files.

       It is not a requirement that _c_p detect attempts to copy a file to
       itself; however, implementations are strongly encouraged to do so.
       Historical implementations have detected the attempt in most cases.

       There are two methods of copying subtrees in this volume of
       POSIX.1‐2008. The other method is described as part of the _p_a_x utility
       (see _p_a_x).  Both methods are historical practice. The _c_p utility
       provides a simpler, more intuitive interface, while _p_a_x offers a finer
       granularity of control. Each provides additional functionality to the
       other; in particular, _p_a_x maintains the hard-link structure of the
       hierarchy, while _c_p does not. It is the intention of the standard
       developers that the results be similar (using appropriate option
       combinations in both utilities). The results are not required to be
       identical; there seemed insufficient gain to applications to balance
       the difficulty of implementations having to guarantee that the results
       would be exactly identical.

       The wording allowing _c_p to copy a directory to implementation-defined
       file types not specified by the System Interfaces volume of
       POSIX.1‐2008 is provided so that implementations supporting symbolic
       links are not required to prohibit copying directories to symbolic
       links. Other extensions to the System Interfaces volume of POSIX.1‐2008
       file types may need to use this loophole as well.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _m_v, _f_i_n_d, _l_n, _p_a_x

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _4_._4, _F_i_l_e _A_c_c_e_s_s
       _P_e_r_m_i_s_s_i_o_n_s, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y
       _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _o_p_e_n(), _u_n_l_i_n_k()

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



IEEE/The Open Group                  2013                               CP(1P)
