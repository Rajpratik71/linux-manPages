RENICE(1P)                 POSIX Programmer's Manual                RENICE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       renice — set nice values of running processes

SSYYNNOOPPSSIISS
       renice [[−g|−p|−u]] −n _i_n_c_r_e_m_e_n_t _I_D...

DDEESSCCRRIIPPTTIIOONN
       The _r_e_n_i_c_e utility shall request that the nice values (see the Base
       Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_4_0, _N_i_c_e _V_a_l_u_e) of one
       or more running processes be changed. By default, the applicable
       processes are specified by their process IDs. When a process group is
       specified (see −−gg), the request shall apply to all processes in the
       process group.

       The nice value shall be bounded in an implementation-defined manner.
       If the requested _i_n_c_r_e_m_e_n_t would raise or lower the nice value of the
       executed utility beyond implementation-defined limits, then the limit
       whose value was exceeded shall be used.

       When a user is _r_e_n_i_c_ed, the request applies to all processes whose
       saved set-user-ID matches the user ID corresponding to the user.

       Regardless of which options are supplied or any other factor, _r_e_n_i_c_e
       shall not alter the nice values of any process unless the user
       requesting such a change has appropriate privileges to do so for the
       specified process. If the user lacks appropriate privileges to perform
       the requested action, the utility shall return an error status.

       The saved set-user-ID of the user's process shall be checked instead of
       its effective user ID when _r_e_n_i_c_e attempts to determine the user ID of
       the process in order to determine whether the user has appropriate
       privileges.

OOPPTTIIOONNSS
       The _r_e_n_i_c_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except for
       Guideline 9.

       The following options shall be supported:

       −−gg        Interpret the following operands as unsigned decimal integer
                 process group IDs.

       −−nn  _i_n_c_r_e_m_e_n_t
                 Specify how the nice value of the specified process or
                 processes is to be adjusted. The _i_n_c_r_e_m_e_n_t option-argument is
                 a positive or negative decimal integer that shall be used to
                 modify the nice value of the specified process or processes.

                 Positive _i_n_c_r_e_m_e_n_t values shall cause a lower nice value.
                 Negative _i_n_c_r_e_m_e_n_t values may require appropriate privileges
                 and shall cause a higher nice value.

       −−pp        Interpret the following operands as unsigned decimal integer
                 process IDs. The −−pp option is the default if no options are
                 specified.

       −−uu        Interpret the following operands as users. If a user exists
                 with a user name equal to the operand, then the user ID of
                 that user is used in further processing. Otherwise, if the
                 operand represents an unsigned decimal integer, it shall be
                 used as the numeric user ID of the user.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _I_D        A process ID, process group ID, or user name/user ID,
                 depending on the option selected.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _r_e_n_i_c_e:

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

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       None.

EEXXAAMMPPLLEESS
        1. Adjust the nice value so that process IDs 987 and 32 would have a
           lower nice value:


               rreenniiccee −−nn 55 −−pp 998877 3322

        2. Adjust the nice value so that group IDs 324 and 76 would have a
           higher nice value, if the user has appropriate privileges to do so:


               rreenniiccee −−nn −−44 −−gg 332244 7766

        3. Adjust the nice value so that numeric user ID 8 and user ssaass would
           have a lower nice value:


               rreenniiccee −−nn 44 −−uu 88 ssaass

       Useful nice value increments on historical systems include 19 or 20
       (the affected processes run only when nothing else in the system
       attempts to run) and any negative number (to make processes run
       faster).

RRAATTIIOONNAALLEE
       The _g_i_d, _p_i_d, and _u_s_e_r specifications do not fit either the definition
       of operand or option-argument. However, for clarity, they have been
       included in the OPTIONS section, rather than the OPERANDS section.

       The definition of nice value is not intended to suggest that all
       processes in a system have priorities that are comparable. Scheduling
       policy extensions such as the realtime priorities in the System
       Interfaces volume of POSIX.1‐2008 make the notion of a single
       underlying priority for all scheduling policies problematic. Some
       implementations may implement the _n_i_c_e-related features to affect all
       processes on the system, others to affect just the general time-sharing
       activities implied by this volume of POSIX.1‐2008, and others may have
       no effect at all. Because of the use of ``implementation-defined'' in
       _n_i_c_e and _r_e_n_i_c_e, a wide range of implementation strategies are
       possible.

       Originally, this utility was written in the historical manner, using
       the term ``nice value''. This was always a point of concern with users
       because it was never intuitively obvious what this meant. With a newer
       version of _r_e_n_i_c_e, which used the term ``system scheduling priority'',
       it was hoped that novice users could better understand what this
       utility was meant to do. Also, it would be easier to document what the
       utility was meant to do. Unfortunately, the addition of the POSIX
       realtime scheduling capabilities introduced the concepts of process and
       thread scheduling priorities that were totally unaffected by the
       _n_i_c_e/_r_e_n_i_c_e utilities or the _n_i_c_e()/_s_e_t_p_r_i_o_r_i_t_y() functions. Continuing
       to use the term ``system scheduling priority'' would have incorrectly
       suggested that these utilities and functions were indeed affecting
       these realtime priorities. It was decided to revert to the historical
       term ``nice value'' to reference this unrelated process attribute.

       Although this utility has use by system administrators (and in fact
       appears in the system administration portion of the BSD documentation),
       the standard developers considered that it was very useful for
       individual end users to control their own processes.

       Earlier versions of this standard allowed the following forms in the
       SYNOPSIS:


           rreenniiccee _n_i_c_e___v_a_l_u_e[[−p]] _p_i_d...[[−g _g_i_d...]][[−p _p_i_d...]][[−u _u_s_e_r...]]
           renice _n_i_c_e___v_a_l_u_e _−_g _g_i_d...[[−g _g_i_d...]]−p _p_i_d...]][[−u _u_s_e_r...]]
           renice _n_i_c_e___v_a_l_u_e _−_u _u_s_e_r...[[−g _g_i_d...]]−p _p_i_d...]][[−u _u_s_e_r...]]

       These forms are no longer specified by POSIX.1‐2008 but may be present
       in some implementations.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _n_i_c_e

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_4_0, _N_i_c_e _V_a_l_u_e,
       _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
       _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                           RENICE(1P)
