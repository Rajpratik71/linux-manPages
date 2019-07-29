ID(1P)                     POSIX Programmer's Manual                    ID(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       id — return user identity

SSYYNNOOPPSSIISS
       id [[_u_s_e_r]]

       id −G [[−n]] [[_u_s_e_r]]

       id −g [[−nr]] [[_u_s_e_r]]

       id −u [[−nr]] [[_u_s_e_r]]

DDEESSCCRRIIPPTTIIOONN
       If no _u_s_e_r operand is provided, the _i_d utility shall write the user and
       group IDs and the corresponding user and group names of the invoking
       process to standard output. If the effective and real IDs do not match,
       both shall be written. If multiple groups are supported by the
       underlying system (see the description of {NGROUPS_MAX} in the System
       Interfaces volume of POSIX.1‐2008), the supplementary group
       affiliations of the invoking process shall also be written.

       If a _u_s_e_r operand is provided and the process has appropriate
       privileges, the user and group IDs of the selected user shall be
       written. In this case, effective IDs shall be assumed to be identical
       to real IDs. If the selected user has more than one allowable group
       membership listed in the group database, these shall be written in the
       same manner as the supplementary groups described in the preceding
       paragraph.

OOPPTTIIOONNSS
       The _i_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−GG        Output all different group IDs (effective, real, and
                 supplementary) only, using the format ""%%uu\\nn"".  If there is
                 more than one distinct group affiliation, output each such
                 affiliation, using the format ""  %%uu"", before the <newline> is
                 output.

       −−gg        Output only the effective group ID, using the format ""%%uu\\nn"".

       −−nn        Output the name in the format ""%%ss"" instead of the numeric ID
                 using the format ""%%uu"".

       −−rr        Output the real ID instead of the effective ID.

       −−uu        Output only the effective user ID, using the format ""%%uu\\nn"".

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _u_s_e_r      The login name for which information is to be written.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _i_d:

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
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The following formats shall be used when the _L_C___M_E_S_S_A_G_E_S locale
       category specifies the POSIX locale. In other locales, the strings _u_i_d,
       _g_i_d, _e_u_i_d, _e_g_i_d, and _g_r_o_u_p_s may be replaced with more appropriate
       strings corresponding to the locale.


           ""uuiidd==%%uu((%%ss)) ggiidd==%%uu((%%ss))\\nn"",, <<_r_e_a_l _u_s_e_r _I_D>, <_u_s_e_r_-_n_a_m_e>,
               <_r_e_a_l _g_r_o_u_p _I_D>, <_g_r_o_u_p_-_n_a_m_e>

       If the effective and real user IDs do not match, the following shall be
       inserted immediately before the ''\\nn'' character in the previous format:


           "" eeuuiidd==%%uu((%%ss))""

       with the following arguments added at the end of the argument list:


           <<_e_f_f_e_c_t_i_v_e _u_s_e_r _I_D>, <_e_f_f_e_c_t_i_v_e _u_s_e_r_-_n_a_m_e>

       If the effective and real group IDs do not match, the following shall
       be inserted directly before the ''\\nn'' character in the format string
       (and after any addition resulting from the effective and real user IDs
       not matching):


           "" eeggiidd==%%uu((%%ss))""

       with the following arguments added at the end of the argument list:


           <<_e_f_f_e_c_t_i_v_e _g_r_o_u_p_-_I_D>, <_e_f_f_e_c_t_i_v_e _g_r_o_u_p _n_a_m_e>

       If the process has supplementary group affiliations or the selected
       user is allowed to belong to multiple groups, the first shall be added
       directly before the <newline> in the format string:


           "" ggrroouuppss==%%uu((%%ss))""

       with the following arguments added at the end of the argument list:


           <<_s_u_p_p_l_e_m_e_n_t_a_r_y _g_r_o_u_p _I_D>, <_s_u_p_p_l_e_m_e_n_t_a_r_y _g_r_o_u_p _n_a_m_e>

       and the necessary number of the following added after that for any
       remaining supplementary group IDs:


           "",,%%uu((%%ss))""

       and the necessary number of the following arguments added at the end of
       the argument list:


           <<_s_u_p_p_l_e_m_e_n_t_a_r_y _g_r_o_u_p _I_D>, <_s_u_p_p_l_e_m_e_n_t_a_r_y _g_r_o_u_p _n_a_m_e>

       If any of the user ID, group ID, effective user ID, effective group ID,
       or supplementary/multiple group IDs cannot be mapped by the system into
       printable user or group names, the corresponding ""((%%ss))"" and _n_a_m_e
       argument shall be omitted from the corresponding format string.

       When any of the options are specified, the output format shall be as
       described in the OPTIONS section.

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
       Output produced by the −−GG option and by the default case could
       potentially produce very long lines on systems that support large
       numbers of supplementary groups.  (On systems with user and group IDs
       that are 32-bit integers and with group names with a maximum of 8 bytes
       per name, 93 supplementary groups plus distinct effective and real
       group and user IDs could theoretically overflow the 2048-byte
       {LINE_MAX} text file line limit on the default output case. It would
       take about 186 supplementary groups to overflow the 2048-byte barrier
       using _i_d −−GG).  This is not expected to be a problem in practice, but in
       cases where it is a concern, applications should consider using _f_o_l_d −−ss
       before post-processing the output of _i_d.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The functionality provided by the 4 BSD _g_r_o_u_p_s utility can be simulated
       using:


           iidd −−GGnn [[ uusseerr ]]

       The 4 BSD command _g_r_o_u_p_s was considered, but it was not included
       because it did not provide the functionality of the _i_d utility of the
       SVID. Also, it was thought that it would be easier to modify _i_d to
       provide the additional functionality necessary to systems with multiple
       groups than to invent another command.

       The options −−uu, −−gg, −−nn, and −−rr were added to ease the use of _i_d with
       shell commands substitution. Without these options it is necessary to
       use some preprocessor such as _s_e_d to select the desired piece of
       information. Since output such as that produced by:


           iidd −−uu −−nn

       is frequently wanted, it seemed desirable to add the options.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _f_o_l_d, _l_o_g_n_a_m_e, _w_h_o

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _g_e_t_g_i_d(), _g_e_t_g_r_o_u_p_s(),
       _g_e_t_u_i_d()

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



IEEE/The Open Group                  2013                               ID(1P)
