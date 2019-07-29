RMDIR(1P)                  POSIX Programmer's Manual                 RMDIR(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       rmdir — remove directories

SSYYNNOOPPSSIISS
       rmdir [[−p]] _d_i_r...

DDEESSCCRRIIPPTTIIOONN
       The _r_m_d_i_r utility shall remove the directory entry specified by each
       _d_i_r operand.

       For each _d_i_r operand, the _r_m_d_i_r utility shall perform actions
       equivalent to the _r_m_d_i_r() function called with the _d_i_r operand as its
       only argument.

       Directories shall be processed in the order specified. If a directory
       and a subdirectory of that directory are specified in a single
       invocation of the _r_m_d_i_r utility, the application shall specify the
       subdirectory before the parent directory so that the parent directory
       will be empty when the _r_m_d_i_r utility tries to remove it.

OOPPTTIIOONNSS
       The _r_m_d_i_r utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−pp        Remove all directories in a pathname. For each _d_i_r operand:

                  1. The directory entry it names shall be removed.

                  2. If the _d_i_r operand includes more than one pathname
                     component, effects equivalent to the following command
                     shall occur:


                         rrmmddiirr −−pp $$((ddiirrnnaammee _d_i_r))

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _d_i_r       A pathname of an empty directory to be removed.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _r_m_d_i_r:

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

        0    Each directory entry specified by a _d_i_r operand was removed
             successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The definition of an empty directory is one that contains, at most,
       directory entries for dot and dot-dot.

EEXXAAMMPPLLEESS
       If a directory aa in the current directory is empty except it contains a
       directory bb and aa//bb is empty except it contains a directory cc:


           rrmmddiirr −−pp aa//bb//cc

       removes all three directories.

RRAATTIIOONNAALLEE
       On historical System V systems, the −−pp option also caused a message to
       be written to the standard output. The message indicated whether the
       whole path was removed or whether part of the path remained for some
       reason. The STDERR section requires this diagnostic when the entire
       path specified by a _d_i_r operand is not removed, but does not allow the
       status message reporting success to be written as a diagnostic.

       The _r_m_d_i_r utility on System V also included a −−ss option that suppressed
       the informational message output by the −−pp option. This option has been
       omitted because the informational message is not specified by this
       volume of POSIX.1‐2008.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _r_m

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



IEEE/The Open Group                  2013                            RMDIR(1P)
