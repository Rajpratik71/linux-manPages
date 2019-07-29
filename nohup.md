NOHUP(1P)                  POSIX Programmer's Manual                 NOHUP(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       nohup — invoke a utility immune to hangups

SSYYNNOOPPSSIISS
       nohup _u_t_i_l_i_t_y [[_a_r_g_u_m_e_n_t...]]

DDEESSCCRRIIPPTTIIOONN
       The _n_o_h_u_p utility shall invoke the utility named by the _u_t_i_l_i_t_y operand
       with arguments supplied as the _a_r_g_u_m_e_n_t operands. At the time the named
       _u_t_i_l_i_t_y is invoked, the SIGHUP signal shall be set to be ignored.

       If standard input is associated with a terminal, the _n_o_h_u_p utility may
       redirect standard input from an unspecified file.

       If the standard output is a terminal, all output written by the named
       _u_t_i_l_i_t_y to its standard output shall be appended to the end of the file
       nnoohhuupp..oouutt in the current directory. If nnoohhuupp..oouutt cannot be created or
       opened for appending, the output shall be appended to the end of the
       file nnoohhuupp..oouutt in the directory specified by the _H_O_M_E environment
       variable. If neither file can be created or opened for appending,
       _u_t_i_l_i_t_y shall not be invoked. If a file is created, the file's
       permission bits shall be set to S_IRUSR | S_IWUSR.

       If standard error is a terminal and standard output is open but is not
       a terminal, all output written by the named utility to its standard
       error shall be redirected to the same open file description as the
       standard output. If standard error is a terminal and standard output
       either is a terminal or is closed, the same output shall instead be
       appended to the end of the nnoohhuupp..oouutt file as described above.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _u_t_i_l_i_t_y   The name of a utility that is to be invoked. If the _u_t_i_l_i_t_y
                 operand names any of the special built-in utilities in
                 _S_e_c_t_i_o_n _2_._1_4, _S_p_e_c_i_a_l _B_u_i_l_t_-_I_n _U_t_i_l_i_t_i_e_s, the results are
                 undefined.

       _a_r_g_u_m_e_n_t  Any string to be supplied as an argument when invoking the
                 utility named by the _u_t_i_l_i_t_y operand.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _n_o_h_u_p:

       _H_O_M_E      Determine the pathname of the user's home directory: if the
                 output file nnoohhuupp..oouutt cannot be created in the current
                 directory, the _n_o_h_u_p utility shall use the directory named by
                 _H_O_M_E to create the file.

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

       _P_A_T_H      Determine the search path that is used to locate the utility
                 to be invoked. See the Base Definitions volume of
                 POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       The _n_o_h_u_p utility shall take the standard action for all signals except
       that SIGHUP shall be ignored.

SSTTDDOOUUTT
       If the standard output is not a terminal, the standard output of _n_o_h_u_p
       shall be the standard output generated by the execution of the _u_t_i_l_i_t_y
       specified by the operands. Otherwise, nothing shall be written to the
       standard output.

SSTTDDEERRRR
       If the standard output is a terminal, a message shall be written to the
       standard error, indicating the name of the file to which the output is
       being appended. The name of the file shall be either nnoohhuupp..oouutt or
       $$HHOOMMEE//nnoohhuupp..oouutt.

OOUUTTPPUUTT FFIILLEESS
       Output written by the named utility is appended to the file nnoohhuupp..oouutt
       (or $$HHOOMMEE//nnoohhuupp..oouutt), if the conditions hold as described in the
       DESCRIPTION.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

       126     The utility specified by _u_t_i_l_i_t_y was found but could not be
               invoked.

       127     An error occurred in the _n_o_h_u_p utility or the utility specified
               by _u_t_i_l_i_t_y could not be found.

       Otherwise, the exit status of _n_o_h_u_p shall be that of the utility
       specified by the _u_t_i_l_i_t_y operand.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The _c_o_m_m_a_n_d, _e_n_v, _n_i_c_e, _n_o_h_u_p, _t_i_m_e, and _x_a_r_g_s utilities have been
       specified to use exit code 127 if an error occurs so that applications
       can distinguish ``failure to find a utility'' from ``invoked utility
       exited with an error indication''. The value 127 was chosen because it
       is not commonly used for other meanings; most utilities use small
       values for ``normal error conditions'' and the values above 128 can be
       confused with termination due to receipt of a signal. The value 126 was
       chosen in a similar manner to indicate that the utility could be found,
       but not invoked. Some scripts produce meaningful error messages
       differentiating the 126 and 127 cases. The distinction between exit
       codes 126 and 127 is based on KornShell practice that uses 127 when all
       attempts to _e_x_e_c the utility fail with [[EENNOOEENNTT]], and uses 126 when any
       attempt to _e_x_e_c the utility fails for any other reason.

EEXXAAMMPPLLEESS
       It is frequently desirable to apply _n_o_h_u_p to pipelines or lists of
       commands. This can be done by placing pipelines and command lists in a
       single file; this file can then be invoked as a utility, and the _n_o_h_u_p
       applies to everything in the file.

       Alternatively, the following command can be used to apply _n_o_h_u_p to a
       complex command:


           nnoohhuupp sshh −−cc ''_c_o_m_p_l_e_x_-_c_o_m_m_a_n_d_-_l_i_n_e'' <<//ddeevv//nnuullll

RRAATTIIOONNAALLEE
       The 4.3 BSD version ignores SIGTERM and SIGHUP, and if ..//nnoohhuupp..oouutt
       cannot be used, it fails instead of trying to use $$HHOOMMEE//nnoohhuupp..oouutt.

       The _c_s_h utility has a built-in version of _n_o_h_u_p that acts differently
       from the _n_o_h_u_p defined in this volume of POSIX.1‐2008.

       The term _u_t_i_l_i_t_y is used, rather than _c_o_m_m_a_n_d, to highlight the fact
       that shell compound commands, pipelines, special built-ins, and so on,
       cannot be used directly.  However, _u_t_i_l_i_t_y includes user application
       programs and shell scripts, not just the standard utilities.

       Historical versions of the _n_o_h_u_p utility use default file creation
       semantics. Some more recent versions use the permissions specified here
       as an added security precaution.

       Some historical implementations ignore SIGQUIT in addition to SIGHUP;
       others ignore SIGTERM. An early proposal allowed, but did not require,
       SIGQUIT to be ignored. Several reviewers objected that _n_o_h_u_p should
       only modify the handling of SIGHUP as required by this volume of
       POSIX.1‐2008.

       Historical versions of _n_o_h_u_p did not affect standard input, but that
       causes problems in the common scenario where the user logs into a
       system, types the command:


           nnoohhuupp mmaakkee &&

       at the prompt, and then logs out. If standard input is not affected by
       _n_o_h_u_p, the login session may not terminate for quite some time, since
       standard input remains open until _m_a_k_e exits. To avoid this problem,
       POSIX.1‐2008 allows implementations to redirect standard input if it is
       a terminal. Since the behavior is implementation-defined, portable
       applications that may run into the problem should redirect standard
       input themselves. For example, instead of:


           nnoohhuupp mmaakkee &&

       an application can invoke:


           nnoohhuupp mmaakkee <<//ddeevv//nnuullll &&

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e, _s_h

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s

       The System Interfaces volume of POSIX.1‐2008, _s_i_g_n_a_l()

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



IEEE/The Open Group                  2013                            NOHUP(1P)
