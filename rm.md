RM(1P)                     POSIX Programmer's Manual                    RM(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       rm — remove directory entries

SSYYNNOOPPSSIISS
       rm [[−fiRr]] _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _r_m utility shall remove the directory entry specified by each _f_i_l_e
       argument.

       If either of the files dot or dot-dot are specified as the basename
       portion of an operand (that is, the final pathname component) or if an
       operand resolves to the root directory, _r_m shall write a diagnostic
       message to standard error and do nothing more with such operands.

       For each _f_i_l_e the following steps shall be taken:

        1. If the _f_i_l_e does not exist:

            a. If the −−ff option is not specified, _r_m shall write a diagnostic
               message to standard error.

            b. Go on to any remaining _f_i_l_e_s.

        2. If _f_i_l_e is of type directory, the following steps shall be taken:

            a. If neither the −−RR option nor the −−rr option is specified, _r_m
               shall write a diagnostic message to standard error, do nothing
               more with _f_i_l_e, and go on to any remaining files.

            b. If the −−ff option is not specified, and either the permissions
               of _f_i_l_e do not permit writing and the standard input is a
               terminal or the −−ii option is specified, _r_m shall write a prompt
               to standard error and read a line from the standard input. If
               the response is not affirmative, _r_m shall do nothing more with
               the current file and go on to any remaining files.

            c. For each entry contained in _f_i_l_e, other than dot or dot-dot,
               the four steps listed here (1 to 4) shall be taken with the
               entry as if it were a _f_i_l_e operand. The _r_m utility shall not
               traverse directories by following symbolic links into other
               parts of the hierarchy, but shall remove the links themselves.

            d. If the −−ii option is specified, _r_m shall write a prompt to
               standard error and read a line from the standard input. If the
               response is not affirmative, _r_m shall do nothing more with the
               current file, and go on to any remaining files.

        3. If _f_i_l_e is not of type directory, the −−ff option is not specified,
           and either the permissions of _f_i_l_e do not permit writing and the
           standard input is a terminal or the −−ii option is specified, _r_m
           shall write a prompt to the standard error and read a line from the
           standard input. If the response is not affirmative, _r_m shall do
           nothing more with the current file and go on to any remaining
           files.

        4. If the current file is a directory, _r_m shall perform actions
           equivalent to the _r_m_d_i_r() function defined in the System Interfaces
           volume of POSIX.1‐2008 called with a pathname of the current file
           used as the _p_a_t_h argument. If the current file is not a directory,
           _r_m shall perform actions equivalent to the _u_n_l_i_n_k() function
           defined in the System Interfaces volume of POSIX.1‐2008 called with
           a pathname of the current file used as the _p_a_t_h argument.

           If this fails for any reason, _r_m shall write a diagnostic message
           to standard error, do nothing more with the current file, and go on
           to any remaining files.

       The _r_m utility shall be able to descend to arbitrary depths in a file
       hierarchy, and shall not fail due to path length limitations (unless an
       operand specified by the user exceeds system limitations).

OOPPTTIIOONNSS
       The _r_m utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−ff        Do not prompt for confirmation. Do not write diagnostic
                 messages or modify the exit status in the case of nonexistent
                 operands. Any previous occurrences of the −−ii option shall be
                 ignored.

       −−ii        Prompt for confirmation as described previously. Any previous
                 occurrences of the −−ff option shall be ignored.

       −−RR        Remove file hierarchies. See the DESCRIPTION.

       −−rr        Equivalent to −−RR.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a directory entry to be removed.

SSTTDDIINN
       The standard input shall be used to read an input line in response to
       each prompt specified in the STDOUT section. Otherwise, the standard
       input shall not be used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _r_m:

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
                 opposed to multi-byte characters in arguments) and the
                 behavior of character classes within regular expressions used
                 in the extended regular expression defined for the yyeesseexxpprr
                 locale keyword in the _L_C___M_E_S_S_A_G_E_S category.

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
       Prompts shall be written to standard error under the conditions
       specified in the DESCRIPTION and OPTIONS sections. The prompts shall
       contain the _f_i_l_e pathname, but their format is otherwise unspecified.
       The standard error also shall be used for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Each directory entry was successfully removed, unless its removal
             was canceled by a non-affirmative response to a prompt for
             confirmation.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The _r_m utility is forbidden to remove the names dot and dot-dot in
       order to avoid the consequences of inadvertently doing something like:


           rrmm −−rr ..**

       Some implementations do not permit the removal of the last link to an
       executable binary file that is being executed; see the [[EEBBUUSSYY]] error in
       the _u_n_l_i_n_k() function defined in the System Interfaces volume of
       POSIX.1‐2008. Thus, the _r_m utility can fail to remove such files.

       The −−ii option causes _r_m to prompt and read the standard input even if
       the standard input is not a terminal, but in the absence of −−ii the mode
       prompting is not done when the standard input is not a terminal.

EEXXAAMMPPLLEESS
        1. The following command:


               rrmm aa..oouutt ccoorree

           removes the directory entries: aa..oouutt and ccoorree.

        2. The following command:


               rrmm −−RRff jjuunnkk

           removes the directory jjuunnkk and all its contents, without prompting.

RRAATTIIOONNAALLEE
       For absolute clarity, paragraphs (2b) and (3) in the DESCRIPTION of _r_m
       describing the behavior when prompting for confirmation, should be
       interpreted in the following manner:


           iiff ((((NNOOTT ff__ooppttiioonn)) AANNDD
               ((((nnoott__wwrriittaabbllee AANNDD iinnppuutt__iiss__tteerrmmiinnaall)) OORR ii__ooppttiioonn))))

       The exact format of the interactive prompts is unspecified. Only the
       general nature of the contents of prompts are specified because
       implementations may desire more descriptive prompts than those used on
       historical implementations. Therefore, an application not using the −−ff
       option, or using the −−ii option, relies on the system to provide the
       most suitable dialog directly with the user, based on the behavior
       specified.

       The −−rr option is historical practice on all known systems. The synonym
       −−RR option is provided for consistency with the other utilities in this
       volume of POSIX.1‐2008 that provide options requesting recursive
       descent through the file hierarchy.

       The behavior of the −−ff option in historical versions of _r_m is
       inconsistent. In general, along with ``forcing'' the unlink without
       prompting for permission, it always causes diagnostic messages to be
       suppressed and the exit status to be unmodified for nonexistent
       operands and files that cannot be unlinked. In some versions, however,
       the −−ff option suppresses usage messages and system errors as well.
       Suppressing such messages is not a service to either shell scripts or
       users.

       It is less clear that error messages regarding files that cannot be
       unlinked (removed) should be suppressed. Although this is historical
       practice, this volume of POSIX.1‐2008 does not permit the −−ff option to
       suppress such messages.

       When given the −−rr and −−ii options, historical versions of _r_m prompt the
       user twice for each directory, once before removing its contents and
       once before actually attempting to delete the directory entry that
       names it. This allows the user to ``prune'' the file hierarchy walk.
       Historical versions of _r_m were inconsistent in that some did not do the
       former prompt for directories named on the command line and others had
       obscure prompting behavior when the −−ii option was specified and the
       permissions of the file did not permit writing. The POSIX Shell and
       Utilities _r_m differs little from historic practice, but does require
       that prompts be consistent. Historical versions of _r_m were also
       inconsistent in that prompts were done to both standard output and
       standard error. This volume of POSIX.1‐2008 requires that prompts be
       done to standard error, for consistency with _c_p and _m_v, and to allow
       historical extensions to _r_m that provide an option to list deleted
       files on standard output.

       The _r_m utility is required to descend to arbitrary depths so that any
       file hierarchy may be deleted. This means, for example, that the _r_m
       utility cannot run out of file descriptors during its descent (that is,
       if the number of file descriptors is limited, _r_m cannot be implemented
       in the historical fashion where one file descriptor is used per
       directory level). Also, _r_m is not permitted to fail because of path
       length restrictions, unless an operand specified by the user is longer
       than {PATH_MAX}.

       The _r_m utility removes symbolic links themselves, not the files they
       refer to, as a consequence of the dependence on the _u_n_l_i_n_k()
       functionality, per the DESCRIPTION. When removing hierarchies with −−rr
       or −−RR, the prohibition on following symbolic links has to be made
       explicit.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _r_m_d_i_r

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _r_e_m_o_v_e(), _r_m_d_i_r(),
       _u_n_l_i_n_k()

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



IEEE/The Open Group                  2013                               RM(1P)
