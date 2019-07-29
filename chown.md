CHOWN(1P)                  POSIX Programmer's Manual                 CHOWN(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       chown — change the file ownership

SSYYNNOOPPSSIISS
       chown [[−h]] _o_w_n_e_r[[:_g_r_o_u_p]] _f_i_l_e...

       chown −R [[−H|−L|−P]] _o_w_n_e_r[[:_g_r_o_u_p]] _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _c_h_o_w_n utility shall set the user ID of the file named by each _f_i_l_e
       operand to the user ID specified by the _o_w_n_e_r operand.

       For each _f_i_l_e operand, or, if the −−RR option is used, each file
       encountered while walking the directory trees specified by the _f_i_l_e
       operands, the _c_h_o_w_n utility shall perform actions equivalent to the
       _c_h_o_w_n() function defined in the System Interfaces volume of
       POSIX.1‐2008, called with the following arguments:

        1. The _f_i_l_e operand shall be used as the _p_a_t_h argument.

        2. The user ID indicated by the _o_w_n_e_r portion of the first operand
           shall be used as the _o_w_n_e_r argument.

        3. If the _g_r_o_u_p portion of the first operand is given, the group ID
           indicated by it shall be used as the _g_r_o_u_p argument; otherwise, the
           group ownership shall not be changed.

       Unless _c_h_o_w_n is invoked by a process with appropriate privileges, the
       set-user-ID and set-group-ID bits of a regular file shall be cleared
       upon successful completion; the set-user-ID and set-group-ID bits of
       other file types may be cleared.

OOPPTTIIOONNSS
       The _c_h_o_w_n utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported by the implementation:

       −−hh        For each file operand that names a file of type symbolic
                 link, _c_h_o_w_n shall attempt to set the user ID of the symbolic
                 link. If a group ID was specified, for each file operand that
                 names a file of type symbolic link, _c_h_o_w_n shall attempt to
                 set the group ID of the symbolic link.

       −−HH        If the −−RR option is specified and a symbolic link referencing
                 a file of type directory is specified on the command line,
                 _c_h_o_w_n shall change the user ID (and group ID, if specified)
                 of the directory referenced by the symbolic link and all
                 files in the file hierarchy below it.

       −−LL        If the −−RR option is specified and a symbolic link referencing
                 a file of type directory is specified on the command line or
                 encountered during the traversal of a file hierarchy, _c_h_o_w_n
                 shall change the user ID (and group ID, if specified) of the
                 directory referenced by the symbolic link and all files in
                 the file hierarchy below it.

       −−PP        If the −−RR option is specified and a symbolic link is
                 specified on the command line or encountered during the
                 traversal of a file hierarchy, _c_h_o_w_n shall change the owner
                 ID (and group ID, if specified) of the symbolic link. The
                 _c_h_o_w_n utility shall not follow the symbolic link to any other
                 part of the file hierarchy.

       −−RR        Recursively change file user and group IDs. For each _f_i_l_e
                 operand that names a directory, _c_h_o_w_n shall change the user
                 ID (and group ID, if specified) of the directory and all
                 files in the file hierarchy below it. Unless a −−HH, −−LL, or −−PP
                 option is specified, it is unspecified which of these options
                 will be used as the default.

       Specifying more than one of the mutually-exclusive options −−HH, −−LL, and
       −−PP shall not be considered an error. The last option specified shall
       determine the behavior of the utility.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _o_w_n_e_r[[:_g_r_o_u_p]]
                 A user ID and optional group ID to be assigned to _f_i_l_e.  The
                 _o_w_n_e_r portion of this operand shall be a user name from the
                 user database or a numeric user ID. Either specifies a user
                 ID which shall be given to each file named by one of the _f_i_l_e
                 operands. If a numeric _o_w_n_e_r operand exists in the user
                 database as a user name, the user ID number associated with
                 that user name shall be used as the user ID. Similarly, if
                 the _g_r_o_u_p portion of this operand is present, it shall be a
                 group name from the group database or a numeric group ID.
                 Either specifies a group ID which shall be given to each
                 file. If a numeric group operand exists in the group database
                 as a group name, the group ID number associated with that
                 group name shall be used as the group ID.

       _f_i_l_e      A pathname of a file whose user ID is to be modified.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _c_h_o_w_n:

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

        0    The utility executed successfully and all requested changes were
             made.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Only the owner of a file or the user with appropriate privileges may
       change the owner or group of a file.

       Some implementations restrict the use of _c_h_o_w_n to a user with
       appropriate privileges.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The System V and BSD versions use different exit status codes. Some
       implementations used the exit status as a count of the number of errors
       that occurred; this practice is unworkable since it can overflow the
       range of valid exit status values. These are masked by specifying only
       0 and >0 as exit values.

       The functionality of _c_h_o_w_n is described substantially through
       references to functions in the System Interfaces volume of
       POSIX.1‐2008. In this way, there is no duplication of effort required
       for describing the interactions of permissions, multiple groups, and so
       on.

       The 4.3 BSD method of specifying both owner and group was included in
       this volume of POSIX.1‐2008 because:

        *  There are cases where the desired end condition could not be
           achieved using the _c_h_g_r_p and _c_h_o_w_n (that only changed the user ID)
           utilities. (If the current owner is not a member of the desired
           group and the desired owner is not a member of the current group,
           the _c_h_o_w_n() function could fail unless both owner and group are
           changed at the same time.)

        *  Even if they could be changed independently, in cases where both
           are being changed, there is a 100% performance penalty caused by
           being forced to invoke both utilities.

       The BSD syntax _u_s_e_r[._g_r_o_u_p] was changed to _u_s_e_r[:_g_r_o_u_p] in this volume
       of POSIX.1‐2008 because the <period> is a valid character in login
       names (as specified by the Base Definitions volume of POSIX.1‐2008,
       login names consist of characters in the portable filename character
       set). The <colon> character was chosen as the replacement for the
       <period> character because it would never be allowed as a character in
       a user name or group name on historical implementations.

       The −−RR option is considered by some observers as an undesirable
       departure from the historical UNIX system tools approach; since a tool,
       _f_i_n_d, already exists to recurse over directories, there seemed to be no
       good reason to require other tools to have to duplicate that
       functionality.  However, the −−RR option was deemed an important user
       convenience, is far more efficient than forking a separate process for
       each element of the directory hierarchy, and is in widespread
       historical use.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_h_g_r_p, _c_h_m_o_d

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _c_h_o_w_n()

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



IEEE/The Open Group                  2013                            CHOWN(1P)
