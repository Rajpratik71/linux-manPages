CAL(1P)                    POSIX Programmer's Manual                   CAL(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       cal — print a calendar

SSYYNNOOPPSSIISS
       cal [[[[_m_o_n_t_h]] _y_e_a_r]]

DDEESSCCRRIIPPTTIIOONN
       The _c_a_l utility shall write a calendar to standard output using the
       Julian calendar for dates from January 1, 1 through September 2, 1752
       and the Gregorian calendar for dates from September 14, 1752 through
       December 31, 9999 as though the Gregorian calendar had been adopted on
       September 14, 1752.

       If no operands are given, _c_a_l shall produce a one-month calendar for
       the current month in the current year. If only the _y_e_a_r operand is
       given, _c_a_l shall produce a calendar for all twelve months in the given
       calendar year. If both _m_o_n_t_h and _y_e_a_r operands are given, _c_a_l shall
       produce a one-month calendar for the given month in the given year.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _m_o_n_t_h     Specify the month to be displayed, represented as a decimal
                 integer from 1 (January) to 12 (December).

       _y_e_a_r      Specify the year for which the calendar is displayed,
                 represented as a decimal integer from 1 to 9999.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _c_a_l:

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
                 error, and informative messages written to standard output.

       _L_C___T_I_M_E   Determine the format and contents of the calendar.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone used to calculate the value of the
                 current month.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The standard output shall be used to display the calendar, in an
       unspecified format.

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
       Note that:


           ccaall 8833

       refers to A.D. 83, not 1983.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Earlier versions of this standard incorrectly required that the
       command:


           ccaall 22000000

       write a one-month calendar for the current calendar month (no matter
       what the current year is) in the year 2000 to standard output. This did
       not match historic practice in any known version of the _c_a_l utility.
       The description has been updated to match historic practice.  When only
       the _y_e_a_r operand is given, _c_a_l writes a twelve-month calendar for the
       specified year.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       A future version of this standard may support locale-specific
       recognition of the date of adoption of the Gregorian calendar.

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



IEEE/The Open Group                  2013                              CAL(1P)
