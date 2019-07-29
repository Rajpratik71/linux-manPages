NEWGRP(1P)                 POSIX Programmer's Manual                NEWGRP(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       newgrp — change to a new group

SSYYNNOOPPSSIISS
       newgrp [[−l]] [[_g_r_o_u_p]]

DDEESSCCRRIIPPTTIIOONN
       The _n_e_w_g_r_p utility shall create a new shell execution environment with
       a new real and effective group identification. Of the attributes listed
       in _S_e_c_t_i_o_n _2_._1_2, _S_h_e_l_l _E_x_e_c_u_t_i_o_n _E_n_v_i_r_o_n_m_e_n_t, the new shell execution
       environment shall retain the working directory, file creation mask, and
       exported variables from the previous environment (that is, open files,
       traps, unexported variables, alias definitions, shell functions, and
       _s_e_t options may be lost). All other aspects of the process environment
       that are preserved by the _e_x_e_c family of functions defined in the
       System Interfaces volume of POSIX.1‐2008 shall also be preserved by
       _n_e_w_g_r_p; whether other aspects are preserved is unspecified.

       A failure to assign the new group identifications (for example, for
       security or password-related reasons) shall not prevent the new shell
       execution environment from being created.

       The _n_e_w_g_r_p utility shall affect the supplemental groups for the process
       as follows:

        *  On systems where the effective group ID is normally in the
           supplementary group list (or whenever the old effective group ID
           actually is in the supplementary group list):

           --  If the new effective group ID is also in the supplementary
               group list, _n_e_w_g_r_p shall change the effective group ID.

           --  If the new effective group ID is not in the supplementary group
               list, _n_e_w_g_r_p shall add the new effective group ID to the list,
               if there is room to add it.

        *  On systems where the effective group ID is not normally in the
           supplementary group list (or whenever the old effective group ID is
           not in the supplementary group list):

           --  If the new effective group ID is in the supplementary group
               list, _n_e_w_g_r_p shall delete it.

           --  If the old effective group ID is not in the supplementary list,
               _n_e_w_g_r_p shall add it if there is room.

       NNoottee::     The System Interfaces volume of POSIX.1‐2008 does not specify
                 whether the effective group ID of a process is included in
                 its supplementary group list.

       With no operands, _n_e_w_g_r_p shall change the effective group back to the
       groups identified in the user's user entry, and shall set the list of
       supplementary groups to that set in the user's group database entries.

       If the first argument is ''−−'', the results are unspecified.

       If a password is required for the specified group, and the user is not
       listed as a member of that group in the group database, the user shall
       be prompted to enter the correct password for that group. If the user
       is listed as a member of that group, no password shall be requested.
       If no password is required for the specified group, it is
       implementation-defined whether users not listed as members of that
       group can change to that group. Whether or not a password is required,
       implementation-defined system accounting or security mechanisms may
       impose additional authorization restrictions that may cause _n_e_w_g_r_p to
       write a diagnostic message and suppress the changing of the group
       identification.

OOPPTTIIOONNSS
       The _n_e_w_g_r_p utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except for the
       unspecified usage of ''−−''.

       The following option shall be supported:

       −−ll        (The letter ell.) Change the environment to what would be
                 expected if the user actually logged in again.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _g_r_o_u_p     A group name from the group database or a non-negative
                 numeric group ID. Specifies the group ID to which the real
                 and effective group IDs shall be set. If _g_r_o_u_p is a non-
                 negative numeric string and exists in the group database as a
                 group name (see _g_e_t_g_r_n_a_m()), the numeric group ID associated
                 with that group name shall be used as the group ID.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       The file //ddeevv//ttttyy shall be used to read a single line of text for
       password checking, when one is required.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _n_e_w_g_r_p:

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
       The standard error shall be used for diagnostic messages and a prompt
       string for a password, if one is required. Diagnostic messages may be
       written in cases where the exit status is not available. See the EXIT
       STATUS section.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       If _n_e_w_g_r_p succeeds in creating a new shell execution environment,
       whether or not the group identification was changed successfully, the
       exit status shall be the exit status of the shell. Otherwise, the
       following exit value shall be returned:

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       The invoking shell may terminate.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       There is no convenient way to enter a password into the group database.
       Use of group passwords is not encouraged, because by their very nature
       they encourage poor security practices. Group passwords may disappear
       in the future.

       A common implementation of _n_e_w_g_r_p is that the current shell uses _e_x_e_c
       to overlay itself with _n_e_w_g_r_p, which in turn overlays itself with a new
       shell after changing group.  On some implementations, however, this may
       not occur and _n_e_w_g_r_p may be invoked as a subprocess.

       The _n_e_w_g_r_p command is intended only for use from an interactive
       terminal. It does not offer a useful interface for the support of
       applications.

       The exit status of _n_e_w_g_r_p is generally inapplicable. If _n_e_w_g_r_p is used
       in a script, in most cases it successfully invokes a new shell and the
       rest of the original shell script is bypassed when the new shell exits.
       Used interactively, _n_e_w_g_r_p displays diagnostic messages to indicate
       problems. But usage such as:


           nneewwggrrpp ffoooo
           eecchhoo $$??

       is not useful because the new shell might not have access to any status
       _n_e_w_g_r_p may have generated (and most historical systems do not provide
       this status). A zero status echoed here does not necessarily indicate
       that the user has changed to the new group successfully. Following
       _n_e_w_g_r_p with the _i_d command provides a portable means of determining
       whether the group change was successful or not.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Most historical implementations use one of the _e_x_e_c functions to
       implement the behavior of _n_e_w_g_r_p.  Errors detected before the _e_x_e_c
       leave the environment unchanged, while errors detected after the _e_x_e_c
       leave the user in a changed environment. While it would be useful to
       have _n_e_w_g_r_p issue a diagnostic message to tell the user that the
       environment changed, it would be inappropriate to require this change
       to some historical implementations.

       The password mechanism is allowed in the group database, but how this
       would be implemented is not specified.

       The _n_e_w_g_r_p utility was retained in this volume of POSIX.1‐2008, even
       given the existence of the multiple group permissions feature in the
       System Interfaces volume of POSIX.1‐2008, for several reasons. First,
       in some implementations, the group ownership of a newly created file is
       determined by the group of the directory in which the file is created,
       as allowed by the System Interfaces volume of POSIX.1‐2008; on other
       implementations, the group ownership of a newly created file is
       determined by the effective group ID. On implementations of the latter
       type, _n_e_w_g_r_p allows files to be created with a specific group
       ownership. Finally, many implementations use the real group ID in
       accounting, and on such systems, _n_e_w_g_r_p allows the accounting identity
       of the user to be changed.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e, _s_h

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _e_x_e_c, _g_e_t_g_r_n_a_m()

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



IEEE/The Open Group                  2013                           NEWGRP(1P)
