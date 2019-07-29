LOGGER(1P)                 POSIX Programmer's Manual                LOGGER(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       logger — log messages

SSYYNNOOPPSSIISS
       logger _s_t_r_i_n_g...

DDEESSCCRRIIPPTTIIOONN
       The _l_o_g_g_e_r utility saves a message, in an unspecified manner and
       format, containing the _s_t_r_i_n_g operands provided by the user. The
       messages are expected to be evaluated later by personnel performing
       system administration tasks.

       It is implementation-defined whether messages written in locales other
       than the POSIX locale are effective.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _s_t_r_i_n_g    One of the string arguments whose contents are concatenated
                 together, in the order specified, separated by single <space>
                 characters.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _l_o_g_g_e_r:

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
                 error. (This means diagnostics from _l_o_g_g_e_r to the user or
                 application, not diagnostic messages that the user is sending
                 to the system administrator.)

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Not used.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       Unspecified.

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
       This utility allows logging of information for later use by a system
       administrator or programmer in determining why non-interactive
       utilities have failed. The locations of the saved messages, their
       format, and retention period are all unspecified. There is no method
       for a conforming application to read messages, once written.

EEXXAAMMPPLLEESS
       A batch application, running non-interactively, tries to read a
       configuration file and fails; it may attempt to notify the system
       administrator with:


           llooggggeerr mmyynnaammee:: uunnaabbllee ttoo rreeaadd ffiillee ffoooo.. [[ttiimmeessttaammpp]]

RRAATTIIOONNAALLEE
       The standard developers believed strongly that some method of alerting
       administrators to errors was necessary. The obvious example is a batch
       utility, running non-interactively, that is unable to read its
       configuration files or that is unable to create or write its results
       file. However, the standard developers did not wish to define the
       format or delivery mechanisms as they have historically been (and will
       probably continue to be) very system-specific, as well as involving
       functionality clearly outside the scope of this volume of POSIX.1‐2008.

       The text with _L_C___M_E_S_S_A_G_E_S about diagnostic messages means diagnostics
       from _l_o_g_g_e_r to the user or application, not diagnostic messages that
       the user is sending to the system administrator.

       Multiple _s_t_r_i_n_g arguments are allowed, similar to _e_c_h_o, for ease-of-
       use.

       Like the utilities _m_a_i_l_x and _l_p, _l_o_g_g_e_r is admittedly difficult to
       test. This was not deemed sufficient justification to exclude these
       utilities from this volume of POSIX.1‐2008. It is also arguable that
       they are, in fact, testable, but that the tests themselves are not
       portable.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _l_p, _m_a_i_l_x, _w_r_i_t_e

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



IEEE/The Open Group                  2013                           LOGGER(1P)
