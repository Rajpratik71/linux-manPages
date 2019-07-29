LN(1P)                     POSIX Programmer's Manual                    LN(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       ln — link files

SSYYNNOOPPSSIISS
       ln [[−fs]] [[−L|−P]] _s_o_u_r_c_e___f_i_l_e _t_a_r_g_e_t___f_i_l_e

       ln [[−fs]] [[−L|−P]] _s_o_u_r_c_e___f_i_l_e... _t_a_r_g_e_t___d_i_r

DDEESSCCRRIIPPTTIIOONN
       In the first synopsis form, the _l_n utility shall create a new directory
       entry (link) at the destination path specified by the _t_a_r_g_e_t___f_i_l_e
       operand. If the −−ss option is specified, a symbolic link shall be
       created for the file specified by the _s_o_u_r_c_e___f_i_l_e operand. This first
       synopsis form shall be assumed when the final operand does not name an
       existing directory; if more than two operands are specified and the
       final is not an existing directory, an error shall result.

       In the second synopsis form, the _l_n utility shall create a new
       directory entry (link), or if the −−ss option is specified a symbolic
       link, for each file specified by a _s_o_u_r_c_e___f_i_l_e operand, at a
       destination path in the existing directory named by _t_a_r_g_e_t___d_i_r.

       If the last operand specifies an existing file of a type not specified
       by the System Interfaces volume of POSIX.1‐2008, the behavior is
       implementation-defined.

       The corresponding destination path for each _s_o_u_r_c_e___f_i_l_e shall be the
       concatenation of the target directory pathname, a <slash> character if
       the target directory pathname did not end in a <slash>, and the last
       pathname component of the _s_o_u_r_c_e___f_i_l_e.  The second synopsis form shall
       be assumed when the final operand names an existing directory.

       For each _s_o_u_r_c_e___f_i_l_e:

        1. If the destination path exists and was created by a previous step,
           it is unspecified whether _l_n shall write a diagnostic message to
           standard error, do nothing more with the current _s_o_u_r_c_e___f_i_l_e, and
           go on to any remaining _s_o_u_r_c_e___f_i_l_es; or will continue processing
           the current _s_o_u_r_c_e___f_i_l_e.  If the destination path exists:

            a. If the −−ff option is not specified, _l_n shall write a diagnostic
               message to standard error, do nothing more with the current
               _s_o_u_r_c_e___f_i_l_e, and go on to any remaining _s_o_u_r_c_e___f_i_l_es.

            b. If _d_e_s_t_i_n_a_t_i_o_n names the same directory entry as the current
               _s_o_u_r_c_e___f_i_l_e _l_n shall write a diagnostic message to standard
               error, do nothing more with the current _s_o_u_r_c_e___f_i_l_e, and go on
               to any remaining _s_o_u_r_c_e___f_i_l_es_.

            c. Actions shall be performed equivalent to the _u_n_l_i_n_k() function
               defined in the System Interfaces volume of POSIX.1‐2008, called
               using _d_e_s_t_i_n_a_t_i_o_n as the _p_a_t_h argument. If this fails for any
               reason, _l_n shall write a diagnostic message to standard error,
               do nothing more with the current _s_o_u_r_c_e___f_i_l_e, and go on to any
               remaining _s_o_u_r_c_e___f_i_l_es.

        2. If the −−ss option is specified, actions shall be performed
           equivalent to the _s_y_m_l_i_n_k() function with _s_o_u_r_c_e___f_i_l_e as the _p_a_t_h_1
           argument and the destination path as the _p_a_t_h_2 argument. The _l_n
           utility shall do nothing more with _s_o_u_r_c_e___f_i_l_e and shall go on to
           any remaining files.

        3. If _s_o_u_r_c_e___f_i_l_e is a symbolic link:

            a. If the −−PP option is in effect, actions shall be performed
               equivalent to the _l_i_n_k_a_t() function with _s_o_u_r_c_e___f_i_l_e as the
               _p_a_t_h_1 argument, the destination path as the _p_a_t_h_2 argument,
               AT_FDCWD as the _f_d_1 and _f_d_2 arguments, and zero as the _f_l_a_g
               argument.

            b. If the −−LL option is in effect, actions shall be performed
               equivalent to the _l_i_n_k_a_t() function with _s_o_u_r_c_e___f_i_l_e as the
               _p_a_t_h_1 argument, the destination path as the _p_a_t_h_2 argument,
               AT_FDCWD as the _f_d_1 and _f_d_2 arguments, and AT_SYMLINK_FOLLOW as
               the _f_l_a_g argument.

           The _l_n utility shall do nothing more with _s_o_u_r_c_e___f_i_l_e and shall go
           on to any remaining files.

        4. Actions shall be performed equivalent to the _l_i_n_k() function
           defined in the System Interfaces volume of POSIX.1‐2008 using
           _s_o_u_r_c_e___f_i_l_e as the _p_a_t_h_1 argument, and the destination path as the
           _p_a_t_h_2 argument.

OOPPTTIIOONNSS
       The _l_n utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−ff        Force existing destination pathnames to be removed to allow
                 the link.

       −−LL        For each _s_o_u_r_c_e___f_i_l_e operand that names a file of type
                 symbolic link, create a (hard) link to the file referenced by
                 the symbolic link.

       −−PP        For each _s_o_u_r_c_e___f_i_l_e operand that names a file of type
                 symbolic link, create a (hard) link to the symbolic link
                 itself.

       −−ss        Create symbolic links instead of hard links. If the −−ss option
                 is specified, the −−LL and −−PP options shall be silently
                 ignored.

       Specifying more than one of the mutually-exclusive options −−LL and −−PP
       shall not be considered an error. The last option specified shall
       determine the behavior of the utility (unless the −−ss option causes it
       to be ignored).

       If the −−ss option is not specified and neither a −−LL nor a −−PP option is
       specified, it is implementation-defined which of the −−LL and −−PP options
       will be used as the default.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _s_o_u_r_c_e___f_i_l_e
                 A pathname of a file to be linked. If the −−ss option is
                 specified, no restrictions on the type of file or on its
                 existence shall be made. If the −−ss option is not specified,
                 whether a directory can be linked is implementation-defined.

       _t_a_r_g_e_t___f_i_l_e
                 The pathname of the new directory entry to be created.

       _t_a_r_g_e_t___d_i_r
                 A pathname of an existing directory in which the new
                 directory entries are created.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _l_n:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Not used.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All the specified files were linked successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       None.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The CONSEQUENCES OF ERRORS section does not require _l_n −−ff _a _b to remove
       _b if a subsequent link operation would fail.

       Some historic versions of _l_n (including the one specified by the SVID)
       unlink the destination file, if it exists, by default. If the mode does
       not permit writing, these versions prompt for confirmation before
       attempting the unlink. In these versions the −−ff option causes _l_n not to
       attempt to prompt for confirmation.

       This allows _l_n to succeed in creating links when the target file
       already exists, even if the file itself is not writable (although the
       directory must be).  Early proposals specified this functionality.

       This volume of POSIX.1‐2008 does not allow the _l_n utility to unlink
       existing destination paths by default for the following reasons:

        *  The _l_n utility has historically been used to provide locking for
           shell applications, a usage that is incompatible with _l_n unlinking
           the destination path by default. There was no corresponding
           technical advantage to adding this functionality.

        *  This functionality gave _l_n the ability to destroy the link
           structure of files, which changes the historical behavior of _l_n.

        *  This functionality is easily replicated with a combination of _r_m
           and _l_n.

        *  It is not historical practice in many systems; BSD and BSD-derived
           systems do not support this behavior. Unfortunately, whichever
           behavior is selected can cause scripts written expecting the other
           behavior to fail.

        *  It is preferable that _l_n perform in the same manner as the _l_i_n_k()
           function, which does not permit the target to exist already.

       This volume of POSIX.1‐2008 retains the −−ff option to provide support
       for shell scripts depending on the SVID semantics. It seems likely that
       shell scripts would not be written to handle prompting by _l_n and would
       therefore have specified the −−ff option.

       The −−ff option is an undocumented feature of many historical versions of
       the _l_n utility, allowing linking to directories. These versions require
       modification.

       Early proposals of this volume of POSIX.1‐2008 also required a −−ii
       option, which behaved like the −−ii options in _c_p and _m_v, prompting for
       confirmation before unlinking existing files. This was not historical
       practice for the _l_n utility and has been omitted.

       The −−LL and −−PP options allow for implementing both common behaviors of
       the _l_n utility. Earlier versions of this standard did not specify these
       options and required the behavior now described for the −−LL option. Many
       systems by default or as an alternative provided a non-conforming _l_n
       utility with the behavior now described for the −−PP option. Since
       applications could not rely on _l_n following links in practice, the −−LL
       and −−PP options were added to specify the desired behavior for the
       application.

       The −−LL and −−PP options are ignored when −−ss is specified in order to
       allow an alias to be created to alter the default behavior when
       creating hard links (for example, _a_l_i_a_s _l_n='_l_n −−LL').  They serve no
       purpose when −−ss is specified, since _s_o_u_r_c_e___f_i_l_e is then just a string
       to be used as the contents of the created symbolic link and need not
       exist as a file.

       The specification ensures that _l_n aa aa with or without the −−ff option
       will not unlink the file aa.  Earlier versions of this standard were
       unclear in this case.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_h_m_o_d, _f_i_n_d, _p_a_x, _r_m

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _l_i_n_k(), _u_n_l_i_n_k()

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



IEEE/The Open Group                  2013                               LN(1P)
