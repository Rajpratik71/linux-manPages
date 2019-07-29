NICE(1P)                   POSIX Programmer's Manual                  NICE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       nice — invoke a utility with an altered nice value

SSYYNNOOPPSSIISS
       nice [[−n _i_n_c_r_e_m_e_n_t]] _u_t_i_l_i_t_y [[_a_r_g_u_m_e_n_t...]]

DDEESSCCRRIIPPTTIIOONN
       The _n_i_c_e utility shall invoke a utility, requesting that it be run with
       a different nice value (see the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_4_0, _N_i_c_e _V_a_l_u_e).  With no options, the
       executed utility shall be run with a nice value that is some
       implementation-defined quantity greater than or equal to the nice value
       of the current process. If the user lacks appropriate privileges to
       affect the nice value in the requested manner, the _n_i_c_e utility shall
       not affect the nice value; in this case, a warning message may be
       written to standard error, but this shall not prevent the invocation of
       _u_t_i_l_i_t_y or affect the exit status.

OOPPTTIIOONNSS
       The _n_i_c_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option is supported:

       −−nn  _i_n_c_r_e_m_e_n_t
                 A positive or negative decimal integer which shall have the
                 same effect on the execution of the utility as if the utility
                 had called the _n_i_c_e() function with the numeric value of the
                 _i_n_c_r_e_m_e_n_t option-argument.

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
       The following environment variables shall affect the execution of _n_i_c_e:

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

       _P_A_T_H      Determine the search path used to locate the utility to be
                 invoked.  See the Base Definitions volume of POSIX.1‐2008,
                 _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s.

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
       If _u_t_i_l_i_t_y is invoked, the exit status of _n_i_c_e shall be the exit status
       of _u_t_i_l_i_t_y; otherwise, the _n_i_c_e utility shall exit with one of the
       following values:

       1‐125   An error occurred in the _n_i_c_e utility.

         126   The utility specified by _u_t_i_l_i_t_y was found but could not be
               invoked.

         127   The utility specified by _u_t_i_l_i_t_y could not be found.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The only guaranteed portable uses of this utility are:

       _n_i_c_e_ _u_t_i_l_i_t_y
             Run _u_t_i_l_i_t_y with the default higher or equal nice value.

       _n_i_c_e_ −−nn  <_p_o_s_i_t_i_v_e_ _i_n_t_e_g_e_r>_ _u_t_i_l_i_t_y
             Run _u_t_i_l_i_t_y with a higher nice value.

       On some implementations they have no discernible effect on the invoked
       utility and on some others they are exactly equivalent.

       Historical systems have frequently supported the <_p_o_s_i_t_i_v_e _i_n_t_e_g_e_r> up
       to 20. Since there is no error penalty associated with guessing a
       number that is too high, users without access to the system conformance
       document (to see what limits are actually in place) could use the
       historical 1 to 20 range or attempt to use very large numbers if the
       job should be truly low priority.

       The nice value of a process can be displayed using the command:


           ppss −−oo nniiccee

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
       None.

RRAATTIIOONNAALLEE
       The 4.3 BSD version of _n_i_c_e does not check whether _i_n_c_r_e_m_e_n_t is a valid
       decimal integer. The command _n_i_c_e −−xx _u_t_i_l_i_t_y, for example, would be
       treated the same as the command _n_i_c_e −−−−11 _u_t_i_l_i_t_y.  If the user does not
       have appropriate privileges, this results in a ``permission denied''
       error.  This is considered a bug.

       When a user without appropriate privileges gives a negative _i_n_c_r_e_m_e_n_t,
       System V treats it like the command _n_i_c_e −−00 _u_t_i_l_i_t_y, while 4.3 BSD
       writes a ``permission denied'' message and does not run the utility.
       The standard specifies the System V behavior together with an optional
       BSD-style ``permission denied'' message.

       The C shell has a built-in version of _n_i_c_e that has a different
       interface from the one described in this volume of POSIX.1‐2008.

       The term ``utility'' is used, rather than ``command'', to highlight the
       fact that shell compound commands, pipelines, and so on, cannot be
       used. Special built-ins also cannot be used.  However, ``utility''
       includes user application programs and shell scripts, not just
       utilities defined in this volume of POSIX.1‐2008.

       Historical implementations of _n_i_c_e provide a nice value range of 40 or
       41 discrete steps, with the default nice value being the midpoint of
       that range. By default, they raise the nice value of the executed
       utility by 10.

       Some historical documentation states that the _i_n_c_r_e_m_e_n_t value must be
       within a fixed range. This is misleading; the valid _i_n_c_r_e_m_e_n_t values on
       any invocation are determined by the current process nice value, which
       is not always the default.

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

       Earlier versions of this standard allowed a −−_i_n_c_r_e_m_e_n_t option. This
       form is no longer specified by POSIX.1‐2008 but may be present in some
       implementations.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e, _r_e_n_i_c_e

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_4_0, _N_i_c_e _V_a_l_u_e,
       _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
       _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _n_i_c_e()

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



IEEE/The Open Group                  2013                             NICE(1P)
