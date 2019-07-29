MV(1P)                     POSIX Programmer's Manual                    MV(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       mv — move files

SSYYNNOOPPSSIISS
       mv [[−if]] _s_o_u_r_c_e___f_i_l_e _t_a_r_g_e_t___f_i_l_e

       mv [[−if]] _s_o_u_r_c_e___f_i_l_e... _t_a_r_g_e_t___d_i_r

DDEESSCCRRIIPPTTIIOONN
       In the first synopsis form, the _m_v utility shall move the file named by
       the _s_o_u_r_c_e___f_i_l_e operand to the destination specified by the
       _t_a_r_g_e_t___f_i_l_e.  This first synopsis form is assumed when the final
       operand does not name an existing directory and is not a symbolic link
       referring to an existing directory. In this case, if _s_o_u_r_c_e___f_i_l_e names
       a non-directory file and _t_a_r_g_e_t___f_i_l_e ends with a trailing <slash>
       character, _m_v shall treat this as an error and no _s_o_u_r_c_e___f_i_l_e operands
       will be processed.

       In the second synopsis form, _m_v shall move each file named by a
       _s_o_u_r_c_e___f_i_l_e operand to a destination file in the existing directory
       named by the _t_a_r_g_e_t___d_i_r operand, or referenced if _t_a_r_g_e_t___d_i_r is a
       symbolic link referring to an existing directory. The destination path
       for each _s_o_u_r_c_e___f_i_l_e shall be the concatenation of the target
       directory, a single <slash> character if the target did not end in a
       <slash>, and the last pathname component of the _s_o_u_r_c_e___f_i_l_e.  This
       second form is assumed when the final operand names an existing
       directory.

       If any operand specifies an existing file of a type not specified by
       the System Interfaces volume of POSIX.1‐2008, the behavior is
       implementation-defined.

       For each _s_o_u_r_c_e___f_i_l_e the following steps shall be taken:

        1. If the destination path exists, the −−ff option is not specified, and
           either of the following conditions is true:

            a. The permissions of the destination path do not permit writing
               and the standard input is a terminal.

            b. The −−ii option is specified.

           the _m_v utility shall write a prompt to standard error and read a
           line from standard input. If the response is not affirmative, _m_v
           shall do nothing more with the current _s_o_u_r_c_e___f_i_l_e and go on to any
           remaining _s_o_u_r_c_e___f_i_l_es.

        2. If the _s_o_u_r_c_e___f_i_l_e operand and destination path name the same
           existing file, then the destination path shall not be removed, and
           one of the following shall occur:

            a. No change is made to _s_o_u_r_c_e___f_i_l_e, no error occurs, and no
               diagnostic is issued.

            b. No change is made to _s_o_u_r_c_e___f_i_l_e, a diagnostic is issued to
               standard error identifying the two names, and the exit status
               is affected.

            c. If the _s_o_u_r_c_e___f_i_l_e operand and destination path name distinct
               directory entries, then the _s_o_u_r_c_e___f_i_l_e operand is removed, no
               error occurs, and no diagnostic is issued.

           The _m_v utility shall do nothing more with the current _s_o_u_r_c_e___f_i_l_e,
           and go on to any remaining _s_o_u_r_c_e___f_i_l_es.

        3. The _m_v utility shall perform actions equivalent to the _r_e_n_a_m_e()
           function defined in the System Interfaces volume of POSIX.1‐2008,
           called with the following arguments:

            a. The _s_o_u_r_c_e___f_i_l_e operand is used as the _o_l_d argument.

            b. The destination path is used as the _n_e_w argument.

           If this succeeds, _m_v shall do nothing more with the current
           _s_o_u_r_c_e___f_i_l_e and go on to any remaining _s_o_u_r_c_e___f_i_l_es.  If this fails
           for any reasons other than those described for the _e_r_r_n_o [[EEXXDDEEVV]] in
           the System Interfaces volume of POSIX.1‐2008, _m_v shall write a
           diagnostic message to standard error, do nothing more with the
           current _s_o_u_r_c_e___f_i_l_e, and go on to any remaining _s_o_u_r_c_e___f_i_l_es.

        4. If the destination path exists, and it is a file of type directory
           and _s_o_u_r_c_e___f_i_l_e is not a file of type directory, or it is a file
           not of type directory and _s_o_u_r_c_e___f_i_l_e is a file of type directory,
           _m_v shall write a diagnostic message to standard error, do nothing
           more with the current _s_o_u_r_c_e___f_i_l_e, and go on to any remaining
           _s_o_u_r_c_e___f_i_l_es.  If the destination path exists and was created by a
           previous step, it is unspecified whether this will treated as an
           error or the destination path will be overwritten.

        5. If the destination path exists, _m_v shall attempt to remove it. If
           this fails for any reason, _m_v shall write a diagnostic message to
           standard error, do nothing more with the current _s_o_u_r_c_e___f_i_l_e, and
           go on to any remaining _s_o_u_r_c_e___f_i_l_es.

        6. The file hierarchy rooted in _s_o_u_r_c_e___f_i_l_e shall be duplicated as a
           file hierarchy rooted in the destination path. If _s_o_u_r_c_e___f_i_l_e or
           any of the files below it in the hierarchy are symbolic links, the
           links themselves shall be duplicated, including their contents,
           rather than any files to which they refer. The following
           characteristics of each file in the file hierarchy shall be
           duplicated:

            *  The time of last data modification and time of last access

            *  The user ID and group ID

            *  The file mode

           If the user ID, group ID, or file mode of a regular file cannot be
           duplicated, the file mode bits S_ISUID and S_ISGID shall not be
           duplicated.

           When files are duplicated to another file system, the
           implementation may require that the process invoking _m_v has read
           access to each file being duplicated.

           If files being duplicated to another file system have hard links to
           other files, it is unspecified whether the files copied to the new
           file system have the hard links preserved or separate copies are
           created for the linked files.

           If the duplication of the file hierarchy fails for any reason, _m_v
           shall write a diagnostic message to standard error, do nothing more
           with the current _s_o_u_r_c_e___f_i_l_e, and go on to any remaining
           _s_o_u_r_c_e___f_i_l_es.

           If the duplication of the file characteristics fails for any
           reason, _m_v shall write a diagnostic message to standard error, but
           this failure shall not cause _m_v to modify its exit status.

        7. The file hierarchy rooted in _s_o_u_r_c_e___f_i_l_e shall be removed. If this
           fails for any reason, _m_v shall write a diagnostic message to the
           standard error, do nothing more with the current _s_o_u_r_c_e___f_i_l_e, and
           go on to any remaining _s_o_u_r_c_e___f_i_l_es.

OOPPTTIIOONNSS
       The _m_v utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−ff        Do not prompt for confirmation if the destination path
                 exists. Any previous occurrence of the −−ii option is ignored.

       −−ii        Prompt for confirmation if the destination path exists. Any
                 previous occurrence of the −−ff option is ignored.

       Specifying more than one of the −−ff or −−ii options shall not be
       considered an error. The last option specified shall determine the
       behavior of _m_v.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _s_o_u_r_c_e___f_i_l_e
                 A pathname of a file or directory to be moved.

       _t_a_r_g_e_t___f_i_l_e
                 A new pathname for the file or directory being moved.

       _t_a_r_g_e_t___d_i_r
                 A pathname of an existing directory into which to move the
                 input files.

SSTTDDIINN
       The standard input shall be used to read an input line in response to
       each prompt specified in the STDERR section. Otherwise, the standard
       input shall not be used.

IINNPPUUTT FFIILLEESS
       The input files specified by each _s_o_u_r_c_e___f_i_l_e operand can be of any
       file type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _m_v:

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
                 files), the behavior of character classes used in the
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
       Prompts shall be written to the standard error under the conditions
       specified in the DESCRIPTION section. The prompts shall contain the
       destination pathname, but their format is otherwise unspecified.
       Otherwise, the standard error shall be used only for diagnostic
       messages.

OOUUTTPPUUTT FFIILLEESS
       The output files may be of any file type.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input files were moved successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If the copying or removal of _s_o_u_r_c_e___f_i_l_e is prematurely terminated by a
       signal or error, _m_v may leave a partial copy of _s_o_u_r_c_e___f_i_l_e at the
       source or destination. The _m_v utility shall not modify both _s_o_u_r_c_e___f_i_l_e
       and the destination path simultaneously; termination at any point shall
       leave either _s_o_u_r_c_e___f_i_l_e or the destination path complete.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Some implementations mark for update the last file status change
       timestamp of renamed files and some do not. Applications which make use
       of the last file status change timestamp may behave differently with
       respect to renamed files unless they are designed to allow for either
       behavior.

       The specification ensures that _m_v aa aa will not alter the contents of
       file aa, and allows the implementation to issue an error that a file
       cannot be moved onto itself. Likewise, when aa and bb are hard links to
       the same file, _m_v aa bb will not alter bb, but if a diagnostic is not
       issued, then it is unspecified whether aa is left untouched (as it would
       be by the _r_e_n_a_m_e() function) or unlinked (reducing the link count of
       bb).

EEXXAAMMPPLLEESS
       If the current directory contains only files aa (of any type defined by
       the System Interfaces volume of POSIX.1‐2008), bb (also of any type),
       and a directory cc:


           mmvv aa bb cc
           mmvv cc dd

       results with the original files aa and bb residing in the directory dd in
       the current directory.

RRAATTIIOONNAALLEE
       Early proposals diverged from the SVID and BSD historical practice in
       that they required that when the destination path exists, the −−ff option
       is not specified, and input is not a terminal, _m_v fails. This was done
       for compatibility with _c_p.  The current text returns to historical
       practice. It should be noted that this is consistent with the _r_e_n_a_m_e()
       function defined in the System Interfaces volume of POSIX.1‐2008, which
       does not require write permission on the target.

       For absolute clarity, paragraph (1), describing the behavior of _m_v when
       prompting for confirmation, should be interpreted in the following
       manner:


           iiff ((eexxiissttss AANNDD ((NNOOTT ff__ooppttiioonn)) AANNDD
               ((((nnoott__wwrriittaabbllee AANNDD iinnppuutt__iiss__tteerrmmiinnaall)) OORR ii__ooppttiioonn))))

       The −−ii option exists on BSD systems, giving applications and users a
       way to avoid accidentally unlinking files when moving others. When the
       standard input is not a terminal, the 4.3 BSD _m_v deletes all existing
       destination paths without prompting, even when −−ii is specified; this is
       inconsistent with the behavior of the 4.3 BSD _c_p utility, which always
       generates an error when the file is unwritable and the standard input
       is not a terminal. The standard developers decided that use of −−ii is a
       request for interaction, so when the destination path exists, the
       utility takes instructions from whatever responds to standard input.

       The _r_e_n_a_m_e() function is able to move directories within the same file
       system. Some historical versions of _m_v have been able to move
       directories, but not to a different file system.  The standard
       developers considered that this was an annoying inconsistency, so this
       volume of POSIX.1‐2008 requires directories to be able to be moved even
       across file systems. There is no −−RR option to confirm that moving a
       directory is actually intended, since such an option was not required
       for moving directories in historical practice. Requiring the
       application to specify it sometimes, depending on the destination,
       seemed just as inconsistent. The semantics of the _r_e_n_a_m_e() function
       were preserved as much as possible. For example, _m_v is not permitted to
       ``rename'' files to or from directories, even though they might be
       empty and removable.

       Historic implementations of _m_v did not exit with a non-zero exit status
       if they were unable to duplicate any file characteristics when moving a
       file across file systems, nor did they write a diagnostic message for
       the user. The former behavior has been preserved to prevent scripts
       from breaking; a diagnostic message is now required, however, so that
       users are alerted that the file characteristics have changed.

       The exact format of the interactive prompts is unspecified. Only the
       general nature of the contents of prompts are specified because
       implementations may desire more descriptive prompts than those used on
       historical implementations. Therefore, an application not using the −−ff
       option or using the −−ii option relies on the system to provide the most
       suitable dialog directly with the user, based on the behavior
       specified.

       When _m_v is dealing with a single file system and _s_o_u_r_c_e___f_i_l_e is a
       symbolic link, the link itself is moved as a consequence of the
       dependence on the _r_e_n_a_m_e() functionality, per the DESCRIPTION. Across
       file systems, this has to be made explicit.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_p, _l_n

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _r_e_n_a_m_e()

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



IEEE/The Open Group                  2013                               MV(1P)
