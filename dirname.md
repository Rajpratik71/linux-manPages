DIRNAME(1P)                POSIX Programmer's Manual               DIRNAME(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       dirname — return the directory portion of a pathname

SSYYNNOOPPSSIISS
       dirname _s_t_r_i_n_g

DDEESSCCRRIIPPTTIIOONN
       The _s_t_r_i_n_g operand shall be treated as a pathname, as defined in the
       Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_6_7, _P_a_t_h_n_a_m_e.  The
       string _s_t_r_i_n_g shall be converted to the name of the directory
       containing the filename corresponding to the last pathname component in
       _s_t_r_i_n_g, performing actions equivalent to the following steps in order:

        1. If _s_t_r_i_n_g is ////, skip steps 2 to 5.

        2. If _s_t_r_i_n_g consists entirely of <slash> characters, _s_t_r_i_n_g shall be
           set to a single <slash> character. In this case, skip steps 3 to 8.

        3. If there are any trailing <slash> characters in _s_t_r_i_n_g, they shall
           be removed.

        4. If there are no <slash> characters remaining in _s_t_r_i_n_g, _s_t_r_i_n_g
           shall be set to a single <period> character. In this case, skip
           steps 5 to 8.

        5. If there are any trailing non-<slash> characters in _s_t_r_i_n_g, they
           shall be removed.

        6. If the remaining _s_t_r_i_n_g is ////, it is implementation-defined whether
           steps 7 and 8 are skipped or processed.

        7. If there are any trailing <slash> characters in _s_t_r_i_n_g, they shall
           be removed.

        8. If the remaining _s_t_r_i_n_g is empty, _s_t_r_i_n_g shall be set to a single
           <slash> character.

       The resulting string shall be written to standard output.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _s_t_r_i_n_g    A string.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _d_i_r_n_a_m_e:

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
       The _d_i_r_n_a_m_e utility shall write a line to the standard output in the
       following format:


           ""%%ss\\nn"",, <<_r_e_s_u_l_t_i_n_g _s_t_r_i_n_g>

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
       The definition of _p_a_t_h_n_a_m_e specifies implementation-defined behavior
       for pathnames starting with two <slash> characters. Therefore,
       applications shall not arbitrarily add <slash> characters to the
       beginning of a pathname unless they can ensure that there are more or
       less than two or are prepared to deal with the implementation-defined
       consequences.

EEXXAAMMPPLLEESS

                          +-----------------+-------------+
                          |    CCoommmmaanndd      |   RReessuullttss   |
                          +-----------------+-------------+
                          |_d_i_r_n_a_m_e /        | /           |
                          |_d_i_r_n_a_m_e //       | / or //     |
                          |_d_i_r_n_a_m_e /_a/_b/    | /_a          |
                          |_d_i_r_n_a_m_e //_a//_b// | //_a         |
                          |_d_i_r_n_a_m_e          | Unspecified |
                          |_d_i_r_n_a_m_e _a        | . ($? = 0)  |
                          |_d_i_r_n_a_m_e ""       | . ($? = 0)  |
                          |_d_i_r_n_a_m_e /_a       | /           |
                          |_d_i_r_n_a_m_e /_a/_b     | /_a          |
                          |_d_i_r_n_a_m_e _a/_b      | _a           |
                          +-----------------+-------------+
       See also the examples for the _b_a_s_e_n_a_m_e utility.

RRAATTIIOONNAALLEE
       The _d_i_r_n_a_m_e utility originated in System III. It has evolved through
       the System V releases to a version that matches the requirements
       specified in this description in System V Release 3. 4.3 BSD and
       earlier versions did not include _d_i_r_n_a_m_e.

       The behaviors of _b_a_s_e_n_a_m_e and _d_i_r_n_a_m_e in this volume of POSIX.1‐2008
       have been coordinated so that when _s_t_r_i_n_g is a valid pathname:


           $$((bbaasseennaammee ---- ""_s_t_r_i_n_g""))

       would be a valid filename for the file in the directory:


           $$((ddiirrnnaammee ---- ""_s_t_r_i_n_g""))

       This would not work for the versions of these utilities in early
       proposals due to the way processing of trailing <slash> characters was
       specified. Consideration was given to leaving processing unspecified if
       there were trailing <slash> characters, but this cannot be done; the
       Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_6_7, _P_a_t_h_n_a_m_e allows
       trailing <slash> characters. The _b_a_s_e_n_a_m_e and _d_i_r_n_a_m_e utilities have to
       specify consistent handling for all valid pathnames.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _2_._5, _P_a_r_a_m_e_t_e_r_s _a_n_d _V_a_r_i_a_b_l_e_s, _b_a_s_e_n_a_m_e

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _3_._2_6_7, _P_a_t_h_n_a_m_e,
       _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s

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



IEEE/The Open Group                  2013                          DIRNAME(1P)
