KILL(1P)                   POSIX Programmer's Manual                  KILL(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       kill — terminate or signal processes

SSYYNNOOPPSSIISS
       kill −s _s_i_g_n_a_l___n_a_m_e _p_i_d...

       kill −l [[_e_x_i_t___s_t_a_t_u_s]]

       kill [[−_s_i_g_n_a_l___n_a_m_e]] _p_i_d...

       kill [[−_s_i_g_n_a_l___n_u_m_b_e_r]] _p_i_d...

DDEESSCCRRIIPPTTIIOONN
       The _k_i_l_l utility shall send a signal to the process or processes
       specified by each _p_i_d operand.

       For each _p_i_d operand, the _k_i_l_l utility shall perform actions equivalent
       to the _k_i_l_l() function defined in the System Interfaces volume of
       POSIX.1‐2008 called with the following arguments:

        *  The value of the _p_i_d operand shall be used as the _p_i_d argument.

        *  The _s_i_g argument is the value specified by the −−ss option,
           −−_s_i_g_n_a_l___n_u_m_b_e_r option, or the −−_s_i_g_n_a_l___n_a_m_e option, or by SIGTERM,
           if none of these options is specified.

OOPPTTIIOONNSS
       The _k_i_l_l utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that in
       the last two SYNOPSIS forms, the −−_s_i_g_n_a_l___n_u_m_b_e_r and −−_s_i_g_n_a_l___n_a_m_e
       options are usually more than a single character.

       The following options shall be supported:

       −−ll        (The letter ell.) Write all values of _s_i_g_n_a_l___n_a_m_e supported
                 by the implementation, if no operand is given. If an
                 _e_x_i_t___s_t_a_t_u_s operand is given and it is a value of the ''??''
                 shell special parameter (see _S_e_c_t_i_o_n _2_._5_._2, _S_p_e_c_i_a_l
                 _P_a_r_a_m_e_t_e_r_s and _w_a_i_t) corresponding to a process that was
                 terminated by a signal, the _s_i_g_n_a_l___n_a_m_e corresponding to the
                 signal that terminated the process shall be written. If an
                 _e_x_i_t___s_t_a_t_u_s operand is given and it is the unsigned decimal
                 integer value of a signal number, the _s_i_g_n_a_l___n_a_m_e (the
                 symbolic constant name without the SSIIGG prefix defined in the
                 Base Definitions volume of POSIX.1‐2008) corresponding to
                 that signal shall be written. Otherwise, the results are
                 unspecified.

       −−ss  _s_i_g_n_a_l___n_a_m_e
                 Specify the signal to send, using one of the symbolic names
                 defined in the _<_s_i_g_n_a_l_._h_> header. Values of _s_i_g_n_a_l___n_a_m_e shall
                 be recognized in a case-independent fashion, without the SSIIGG
                 prefix. In addition, the symbolic name 0 shall be recognized,
                 representing the signal value zero. The corresponding signal
                 shall be sent instead of SIGTERM.

       −−_s_i_g_n_a_l___n_a_m_e
                 Equivalent to −−ss _s_i_g_n_a_l___n_a_m_e.

       −−_s_i_g_n_a_l___n_u_m_b_e_r
                 Specify a non-negative decimal integer, _s_i_g_n_a_l___n_u_m_b_e_r,
                 representing the signal to be used instead of SIGTERM, as the
                 _s_i_g argument in the effective call to _k_i_l_l().  The
                 correspondence between integer values and the _s_i_g value used
                 is shown in the following list.

                 The effects of specifying any _s_i_g_n_a_l___n_u_m_b_e_r other than those
                 listed below are undefined.

                 0     0

                 1     SIGHUP

                 2     SIGINT

                 3     SIGQUIT

                 6     SIGABRT

                 9     SIGKILL

                 14    SIGALRM

                 15    SIGTERM

                 If the first argument is a negative integer, it shall be
                 interpreted as a −−_s_i_g_n_a_l___n_u_m_b_e_r option, not as a negative _p_i_d
                 operand specifying a process group.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _p_i_d       One of the following:

                  1. A decimal integer specifying a process or process group
                     to be signaled.  The process or processes selected by
                     positive, negative, and zero values of the _p_i_d operand
                     shall be as described for the _k_i_l_l() function. If process
                     number 0 is specified, all processes in the current
                     process group shall be signaled. For the effects of
                     negative _p_i_d numbers, see the _k_i_l_l() function defined in
                     the System Interfaces volume of POSIX.1‐2008. If the
                     first _p_i_d operand is negative, it should be preceded by
                     ""−−−−"" to keep it from being interpreted as an option.

                  2. A job control job ID (see the Base Definitions volume of
                     POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_0_4, _J_o_b _C_o_n_t_r_o_l _J_o_b _I_D) that
                     identifies a background process group to be signaled. The
                     job control job ID notation is applicable only for
                     invocations of _k_i_l_l in the current shell execution
                     environment; see _S_e_c_t_i_o_n _2_._1_2, _S_h_e_l_l _E_x_e_c_u_t_i_o_n
                     _E_n_v_i_r_o_n_m_e_n_t.

       _e_x_i_t___s_t_a_t_u_s
                 A decimal integer specifying a signal number or the exit
                 status of a process terminated by a signal.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _k_i_l_l:

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
       When the −−ll option is not specified, the standard output shall not be
       used.

       When the −−ll option is specified, the symbolic name of each signal shall
       be written in the following format:


           ""%%ss%%cc"",, <<_s_i_g_n_a_l___n_a_m_e>, <_s_e_p_a_r_a_t_o_r>

       where the <_s_i_g_n_a_l___n_a_m_e> is in uppercase, without the SSIIGG prefix, and
       the <_s_e_p_a_r_a_t_o_r> shall be either a <newline> or a <space>.  For the last
       signal written, <_s_e_p_a_r_a_t_o_r> shall be a <newline>.

       When both the −−ll option and _e_x_i_t___s_t_a_t_u_s operand are specified, the
       symbolic name of the corresponding signal shall be written in the
       following format:


           ""%%ss\\nn"",, <<_s_i_g_n_a_l___n_a_m_e>

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    At least one matching process was found for each _p_i_d operand, and
             the specified signal was successfully processed for at least one
             matching process.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Process numbers can be found by using _p_s.

       The job control job ID notation is not required to work as expected
       when _k_i_l_l is operating in its own utility execution environment. In
       either of the following examples:


           nnoohhuupp kkiillll %%11 &&
           ssyysstteemm((""kkiillll %%11""));;

       the _k_i_l_l operates in a different environment and does not share the
       shell's understanding of job numbers.

EEXXAAMMPPLLEESS
       Any of the commands:


           kkiillll −−99 110000 −−116655
           kkiillll −−ss kkiillll 110000 −−116655
           kkiillll −−ss KKIILLLL 110000 −−116655

       sends the SIGKILL signal to the process whose process ID is 100 and to
       all processes whose process group ID is 165, assuming the sending
       process has permission to send that signal to the specified processes,
       and that they exist.

       The System Interfaces volume of POSIX.1‐2008 and this volume of
       POSIX.1‐2008 do not require specific signal numbers for any
       _s_i_g_n_a_l___n_a_m_e_s.  Even the −−_s_i_g_n_a_l___n_u_m_b_e_r option provides symbolic
       (although numeric) names for signals. If a process is terminated by a
       signal, its exit status indicates the signal that killed it, but the
       exact values are not specified. The _k_i_l_l −−ll option, however, can be
       used to map decimal signal numbers and exit status values into the name
       of a signal. The following example reports the status of a terminated
       job:


           jjoobb
           ssttaatt==$$??
           iiff [[ $$ssttaatt −−eeqq 00 ]]
           tthheenn
               eecchhoo jjoobb ccoommpplleetteedd ssuucccceessssffuullllyy..
           eelliiff [[ $$ssttaatt −−ggtt 112288 ]]
           tthheenn
               eecchhoo jjoobb tteerrmmiinnaatteedd bbyy ssiiggnnaall SSIIGG$$((kkiillll −−ll $$ssttaatt))..
           eellssee
               eecchhoo jjoobb tteerrmmiinnaatteedd wwiitthh eerrrroorr ccooddee $$ssttaatt..
           ffii

       To send the default signal to a process group (say 123), an application
       should use a command similar to one of the following:


           kkiillll −−TTEERRMM −−112233
           kkiillll −−−− −−112233

RRAATTIIOONNAALLEE
       The −−ll option originated from the C shell, and is also implemented in
       the KornShell. The C shell output can consist of multiple output lines
       because the signal names do not always fit on a single line on some
       terminal screens. The KornShell output also included the
       implementation-defined signal numbers and was considered by the
       standard developers to be too difficult for scripts to parse
       conveniently. The specified output format is intended not only to
       accommodate the historical C shell output, but also to permit an
       entirely vertical or entirely horizontal listing on systems for which
       this is appropriate.

       An early proposal invented the name SIGNULL as a _s_i_g_n_a_l___n_a_m_e for signal
       0 (used by the System Interfaces volume of POSIX.1‐2008 to test for the
       existence of a process without sending it a signal). Since the
       _s_i_g_n_a_l___n_a_m_e 0 can be used in this case unambiguously, SIGNULL has been
       removed.

       An early proposal also required symbolic _s_i_g_n_a_l___n_a_m_es to be recognized
       with or without the SSIIGG prefix. Historical versions of _k_i_l_l have not
       written the SSIIGG prefix for the −−ll option and have not recognized the
       SSIIGG prefix on _s_i_g_n_a_l___n_a_m_es.  Since neither applications portability nor
       ease-of-use would be improved by requiring this extension, it is no
       longer required.

       To avoid an ambiguity of an initial negative number argument specifying
       either a signal number or a process group, POSIX.1‐2008 mandates that
       it is always considered the former by implementations that support the
       XSI option. It also requires that conforming applications always use
       the ""−−−−"" options terminator argument when specifying a process group,
       unless an option is also specified.

       The −−ss option was added in response to international interest in
       providing some form of _k_i_l_l that meets the Utility Syntax Guidelines.

       The job control job ID notation is not required to work as expected
       when _k_i_l_l is operating in its own utility execution environment. In
       either of the following examples:


           nnoohhuupp kkiillll %%11 &&
           ssyysstteemm((""kkiillll %%11""));;

       the _k_i_l_l operates in a different environment and does not understand
       how the shell has managed its job numbers.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e, _p_s, _w_a_i_t

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_0_4, _J_o_b _C_o_n_t_r_o_l
       _J_o_b _I_D, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
       _G_u_i_d_e_l_i_n_e_s, <<ssiiggnnaall..hh>>

       The System Interfaces volume of POSIX.1‐2008, _k_i_l_l()

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



IEEE/The Open Group                  2013                             KILL(1P)
