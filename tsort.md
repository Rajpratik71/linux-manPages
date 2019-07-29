TSORT(1P)                  POSIX Programmer's Manual                 TSORT(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       tsort — topological sort

SSYYNNOOPPSSIISS
       tsort [[_f_i_l_e]]

DDEESSCCRRIIPPTTIIOONN
       The _t_s_o_r_t utility shall write to standard output a totally ordered list
       of items consistent with a partial ordering of items contained in the
       input.

       The application shall ensure that the input consists of pairs of items
       (non-empty strings) separated by <blank> characters. Pairs of different
       items indicate ordering. Pairs of identical items indicate presence,
       but not ordering.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a text file to order. If no _f_i_l_e operand is
                 given, the standard input shall be used.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operand is specified, and
       shall be used if the _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input file shall be a text file.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _t_s_o_r_t:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The standard output shall be a text file consisting of the order list
       produced from the partially ordered input.

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
       The _L_C___C_O_L_L_A_T_E variable need not affect the actions of _t_s_o_r_t.  The
       output ordering is not lexicographic, but depends on the pairs of items
       given as input.

EEXXAAMMPPLLEESS
       The command:


           ttssoorrtt <<<<EEOOFF
           aa bb cc cc dd ee
           gg gg
           ff gg ee ff
           hh hh
           EEOOFF

       produces the output:


           aa
           bb
           cc
           dd
           ee
           ff
           gg
           hh

RRAATTIIOONNAALLEE
       None.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s

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



IEEE/The Open Group                  2013                            TSORT(1P)
