UNAME(1P)                  POSIX Programmer's Manual                 UNAME(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       uname — return system name

SSYYNNOOPPSSIISS
       uname [[−amnrsv]]

DDEESSCCRRIIPPTTIIOONN
       By default, the _u_n_a_m_e utility shall write the operating system name to
       standard output. When options are specified, symbols representing one
       or more system characteristics shall be written to the standard output.
       The format and contents of the symbols are implementation-defined. On
       systems conforming to the System Interfaces volume of POSIX.1‐2008, the
       symbols written shall be those supported by the _u_n_a_m_e() function as
       defined in the System Interfaces volume of POSIX.1‐2008.

OOPPTTIIOONNSS
       The _u_n_a_m_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−aa        Behave as though all of the options −−mmnnrrssvv were specified.

       −−mm        Write the name of the hardware type on which the system is
                 running to standard output.

       −−nn        Write the name of this node within an implementation-defined
                 communications network.

       −−rr        Write the current release level of the operating system
                 implementation.

       −−ss        Write the name of the implementation of the operating system.

       −−vv        Write the current version level of this release of the
                 operating system implementation.

       If no options are specified, the _u_n_a_m_e utility shall write the
       operating system name, as if the −−ss option had been specified.

OOPPEERRAANNDDSS
       None.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _u_n_a_m_e:

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
       By default, the output shall be a single line of the following form:


           ""%%ss\\nn"",, <<_s_y_s_n_a_m_e>

       If the −−aa option is specified, the output shall be a single line of the
       following form:


           ""%%ss %%ss %%ss %%ss %%ss\\nn"",, <<_s_y_s_n_a_m_e>, <_n_o_d_e_n_a_m_e>, <_r_e_l_e_a_s_e>,
               <_v_e_r_s_i_o_n>, <_m_a_c_h_i_n_e>

       Additional implementation-defined symbols may be written; all such
       symbols shall be written at the end of the line of output before the
       <newline>.

       If options are specified to select different combinations of the
       symbols, only those symbols shall be written, in the order shown above
       for the −−aa option. If a symbol is not selected for writing, its
       corresponding trailing <blank> characters also shall not be written.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The requested information was successfully written.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Note that any of the symbols could include embedded <space> characters,
       which may affect parsing algorithms if multiple options are selected
       for output.

       The node name is typically a name that the system uses to identify
       itself for inter-system communication addressing.

EEXXAAMMPPLLEESS
       The following command:


           uunnaammee −−ssrr

       writes the operating system name and release level, separated by one or
       more <blank> characters.

RRAATTIIOONNAALLEE
       It was suggested that this utility cannot be used portably since the
       format of the symbols is implementation-defined. The POSIX.1 working
       group could not achieve consensus on defining these formats in the
       underlying _u_n_a_m_e() function, and there was no expectation that this
       volume of POSIX.1‐2008 would be any more successful. Some applications
       may still find this historical utility of value. For example, the
       symbols could be used for system log entries or for comparison with
       operator or user input.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _u_n_a_m_e()

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



IEEE/The Open Group                  2013                            UNAME(1P)
