ENV(1P)                    POSIX Programmer's Manual                   ENV(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       env — set the environment for command invocation

SSYYNNOOPPSSIISS
       env [[−i]] [[_n_a_m_e=_v_a_l_u_e]]... [[_u_t_i_l_i_t_y [[_a_r_g_u_m_e_n_t...]]]]

DDEESSCCRRIIPPTTIIOONN
       The _e_n_v utility shall obtain the current environment, modify it
       according to its arguments, then invoke the utility named by the
       _u_t_i_l_i_t_y operand with the modified environment.

       Optional arguments shall be passed to _u_t_i_l_i_t_y.

       If no _u_t_i_l_i_t_y operand is specified, the resulting environment shall be
       written to the standard output, with one _n_a_m_e=_v_a_l_u_e pair per line.

       If the first argument is ''−−'', the results are unspecified.

OOPPTTIIOONNSS
       The _e_n_v utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except for the
       unspecified usage of ''−−''.

       The following options shall be supported:

       −−ii        Invoke _u_t_i_l_i_t_y with exactly the environment specified by the
                 arguments; the inherited environment shall be ignored
                 completely.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _n_a_m_e=_v_a_l_u_e
                 Arguments of the form _n_a_m_e=_v_a_l_u_e shall modify the execution
                 environment, and shall be placed into the inherited
                 environment before the _u_t_i_l_i_t_y is invoked.

       _u_t_i_l_i_t_y   The name of the utility to be invoked. If the _u_t_i_l_i_t_y operand
                 names any of the special built-in utilities in _S_e_c_t_i_o_n _2_._1_4,
                 _S_p_e_c_i_a_l _B_u_i_l_t_-_I_n _U_t_i_l_i_t_i_e_s, the results are undefined.

       _a_r_g_u_m_e_n_t  A string to pass as an argument for the invoked utility.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _e_n_v:

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

       _P_A_T_H      Determine the location of the _u_t_i_l_i_t_y, as described in the
                 Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8,
                 _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s.  If _P_A_T_H is specified as a _n_a_m_e=_v_a_l_u_e
                 operand to _e_n_v, the _v_a_l_u_e given shall be used in the search
                 for _u_t_i_l_i_t_y.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       If no _u_t_i_l_i_t_y operand is specified, each _n_a_m_e=_v_a_l_u_e pair in the
       resulting environment shall be written in the form:


           ""%%ss==%%ss\\nn"",, <<_n_a_m_e>, <_v_a_l_u_e>

       If the _u_t_i_l_i_t_y operand is specified, the _e_n_v utility shall not write to
       standard output.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       If _u_t_i_l_i_t_y is invoked, the exit status of _e_n_v shall be the exit status
       of _u_t_i_l_i_t_y; otherwise, the _e_n_v utility shall exit with one of the
       following values:

           0   The _e_n_v utility completed successfully.

       1−125   An error occurred in the _e_n_v utility.

         126   The utility specified by _u_t_i_l_i_t_y was found but could not be
               invoked.

         127   The utility specified by _u_t_i_l_i_t_y could not be found.

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

       Historical implementations of the _e_n_v utility use the _e_x_e_c_v_p() or
       _e_x_e_c_l_p() functions defined in the System Interfaces volume of
       POSIX.1‐2008 to invoke the specified utility; this provides better
       performance and keeps users from having to escape characters with
       special meaning to the shell. Therefore, shell functions, special
       built-ins, and built-ins that are only provided by the shell are not
       found.

EEXXAAMMPPLLEESS
       The following command:


           eennvv −−ii PPAATTHH==//mmyybbiinn::""$$PPAATTHH"" $$((ggeettccoonnff VV77__EENNVV)) mmyyggrreepp xxyyzz mmyyffiillee

       invokes the command _m_y_g_r_e_p with a new _P_A_T_H value as the only entry in
       its environment other than any variables required by the implementation
       for conformance. In this case, _P_A_T_H is used to locate _m_y_g_r_e_p, which is
       expected to reside in //mmyybbiinn.

RRAATTIIOONNAALLEE
       As with all other utilities that invoke other utilities, this volume of
       POSIX.1‐2008 only specifies what _e_n_v does with standard input, standard
       output, standard error, input files, and output files. If a utility is
       executed, it is not constrained by the specification of input and
       output by _e_n_v.

       The −−ii option was added to allow the functionality of the removed −−
       option in a manner compatible with the Utility Syntax Guidelines. It is
       possible to create a non-conforming environment using the −−ii option, as
       it may remove environment variables required by the implementation for
       conformance. The following will preserve these environment variables as
       well as preserve the _P_A_T_H for conforming utilities:


           IIFFSS==''
           ''
           ## TThhee pprreecceeddiinngg vvaalluuee sshhoouulldd bbee <<ssppaaccee>><<ttaabb>><<nneewwlliinnee>>..
           ## SSeett IIFFSS ttoo iittss ddeeffaauulltt vvaalluuee..

           set −f
           # disable pathname expansion

           \unalias −a
           # Unset all possible aliases.
           # Note that unalias is escaped to prevent an alias
           # being used for unalias.
           # This step is not strictly necessary, since aliases are not inherited,
           # and the ENV environment variable is only used by interactive shells,
           # the only way any aliases can exist in a script is if it defines them
           # itself.

           unset −f env getconf
           # Ensure env and getconf are not user functions.

           env −i $(getconf V7_ENV) PATH="$(getconf PATH)" command

       Some have suggested that _e_n_v is redundant since the same effect is
       achieved by:


           nnaammee==vvaalluuee ...... uuttiilliittyy [[ argument ... ]]

       The example is equivalent to _e_n_v when an environment variable is being
       added to the environment of the command, but not when the environment
       is being set to the given value.  The _e_n_v utility also writes out the
       current environment if invoked without arguments. There is sufficient
       functionality beyond what the example provides to justify inclusion of
       _e_n_v.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _2_._1_4, _S_p_e_c_i_a_l _B_u_i_l_t_-_I_n _U_t_i_l_i_t_i_e_s, _S_e_c_t_i_o_n _2_._5, _P_a_r_a_m_e_t_e_r_s _a_n_d
       _V_a_r_i_a_b_l_e_s

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



IEEE/The Open Group                  2013                              ENV(1P)
