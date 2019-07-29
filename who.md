WHO(1P)                    POSIX Programmer's Manual                   WHO(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       who — display who is on the system

SSYYNNOOPPSSIISS
       who [[−mTu]] [[−abdHlprt]] [[_f_i_l_e]]

       who [[−mu]] −s [[−bHlprt]] [[_f_i_l_e]]

       who −q [[_f_i_l_e]]

       who am i

       who am I

DDEESSCCRRIIPPTTIIOONN
       The _w_h_o utility shall list various pieces of information about
       accessible users. The domain of accessibility is implementation-
       defined.

       Based on the options given, _w_h_o can also list the user's name, terminal
       line, login time, elapsed time since activity occurred on the line, and
       the process ID of the command interpreter for each current system user.

OOPPTTIIOONNSS
       The _w_h_o utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported. The metavariables, such as
       <_l_i_n_e>, refer to fields described in the STDOUT section.

       −−aa        Process the implementation-defined database or named file
                 with the −−bb, −−dd, −−ll, −−pp, −−rr, −−tt, −−TT and −−uu options turned on.

       −−bb        Write the time and date of the last system reboot. The system
                 reboot time is the time at which the implementation is able
                 to commence running processes.

       −−dd        Write a list of all processes that have expired and not been
                 respawned by the _i_n_i_t system process. The <_e_x_i_t> field shall
                 appear for dead processes and contain the termination and
                 exit values of the dead process. This can be useful in
                 determining why a process terminated.

       −−HH        Write column headings above the regular output.

       −−ll        (The letter ell.) List only those lines on which the system
                 is waiting for someone to login. The <_n_a_m_e> field shall be
                 LLOOGGIINN in such cases. Other fields shall be the same as for
                 user entries except that the <_s_t_a_t_e> field does not exist.

       −−mm        Output only information about the current terminal.

       −−pp        List any other process that is currently active and has been
                 previously spawned by _i_n_i_t.

       −−qq        (Quick.) List only the names and the number of users
                 currently logged on. When this option is used, all other
                 options shall be ignored.

       −−rr        Write the current _r_u_n_-_l_e_v_e_l of the _i_n_i_t process.

       −−ss        List only the <_n_a_m_e>, <_l_i_n_e>, and <_t_i_m_e> fields.  This is the
                 default case.

       −−tt        Indicate the last change to the system clock.

       −−TT        Show the state of each terminal, as described in the STDOUT
                 section.

       −−uu        Write ``idle time'' for each displayed user in addition to
                 any other information. The idle time is the time since any
                 activity occurred on the user's terminal. The method of
                 determining this is unspecified.  This option shall list only
                 those users who are currently logged in.  The <_n_a_m_e> is the
                 user's login name. The <_l_i_n_e> is the name of the line as
                 found in the directory //ddeevv.  The <_t_i_m_e> is the time that the
                 user logged in. The <_a_c_t_i_v_i_t_y> is the number of hours and
                 minutes since activity last occurred on that particular line.
                 A dot indicates that the terminal has seen activity in the
                 last minute and is therefore ``current''. If more than
                 twenty-four hours have elapsed or the line has not been used
                 since boot time, the entry shall be marked <_o_l_d>. This field
                 is useful when trying to determine whether a person is
                 working at the terminal or not. The <_p_i_d> is the process ID
                 of the user's login process.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       aamm  ii, aamm  II
                 In the POSIX locale, limit the output to describing the
                 invoking user, equivalent to the −−mm option. The aamm and ii or II
                 must be separate arguments.

       _f_i_l_e      Specify a pathname of a file to substitute for the
                 implementation-defined database of logged-on users that _w_h_o
                 uses by default.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _w_h_o:

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

       _L_C___T_I_M_E   Determine the locale used for the format and contents of the
                 date and time strings.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone used when writing date and time
                 information. If _T_Z is unset or null, an unspecified default
                 timezone shall be used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The _w_h_o utility shall write its default format to the standard output
       in an implementation-defined format, subject only to the requirement of
       containing the information described above.

       XSI-conformant systems shall write the default information to the
       standard output in the following general format:


           <<_n_a_m_e>[[<_s_t_a_t_e>]]<_l_i_n_e><_t_i_m_e>[[<_a_c_t_i_v_i_t_y>]][[<_p_i_d>]][[<_c_o_m_m_e_n_t>]][[<_e_x_i_t>]]

       For the −−bb option, <_l_i_n_e> shall be ""ssyysstteemmboot"..  The <_n_a_m_e> is
       unspecified.

       The following format shall be used for the −−TT option:


           ""%%ss %%cc %%ss %%ss\\nn"" <<_n_a_m_e>, <_t_e_r_m_i_n_a_l _s_t_a_t_e>, <_t_e_r_m_i_n_a_l _n_a_m_e>,
               <_t_i_m_e _o_f _l_o_g_i_n>

       where <_t_e_r_m_i_n_a_l_ _s_t_a_t_e> is one of the following characters:

       +       The terminal allows write access to other users.

       −       The terminal denies write access to other users.

       ?       The terminal write-access state cannot be determined.

       <space> This entry is not associated with a terminal.

       In the POSIX locale, the <_t_i_m_e_ _o_f_ _l_o_g_i_n> shall be equivalent in format
       to the output of:


           ddaattee ++""%%bb %%ee %%HH::%%MM""

       If the −−uu option is used with −−TT, the idle time shall be added to the
       end of the previous format in an unspecified format.

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
       The name _i_n_i_t used for the system process is the most commonly used on
       historical systems, but it may vary.

       The ``domain of accessibility'' referred to is a broad concept that
       permits interpretation either on a very secure basis or even to allow a
       network-wide implementation like the historical _r_w_h_o.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Due to differences between historical implementations, the base options
       provided were a compromise to allow users to work with those functions.
       The standard developers also considered removing all the options, but
       felt that these options offered users valuable functionality.
       Additional options to match historical systems are available on XSI-
       conformant systems.

       It is recognized that the _w_h_o command may be of limited usefulness,
       especially in a multi-level secure environment. The standard developers
       considered, however, that having some standard method of determining
       the ``accessibility'' of other users would aid user portability.

       No format was specified for the default _w_h_o output for systems not
       supporting the XSI option. In such a user-oriented command, designed
       only for human use, this was not considered to be a deficiency.

       The format of the terminal name is unspecified, but the descriptions of
       _p_s, _t_a_l_k, and _w_r_i_t_e require that they use the same format.

       It is acceptable for an implementation to produce no output for an
       invocation of _w_h_o mmiill.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _m_e_s_g

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                              WHO(1P)
