STRIP(1P)                  POSIX Programmer's Manual                 STRIP(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       strip — remove unnecessary information from strippable files
       (DDEEVVEELLOOPPMMEENNTT)

SSYYNNOOPPSSIISS
       strip _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       A strippable file is defined as a relocatable, object, or executable
       file.  On XSI-conformant systems, a strippable file can also be an
       archive of object or relocatable files.

       The _s_t_r_i_p utility shall remove from strippable files named by the _f_i_l_e
       operands any information the implementor deems unnecessary for
       execution of those files. The nature of that information is
       unspecified. The effect of _s_t_r_i_p on object and executable files shall
       be similar to the use of the −−ss option to _c_9_9 or _f_o_r_t_7_7.  The effect of
       _s_t_r_i_p on an archive of object files shall be similar to the use of the
       −−ss option to _c_9_9 or _f_o_r_t_7_7 for each object file in the archive.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname referring to a strippable file.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       The input files shall be in the form of strippable files successfully
       produced by any compiler defined by this volume of POSIX.1‐2008 or
       produced by creating or updating an archive of such files using the _a_r
       utility.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _s_t_r_i_p:

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
       Not used.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       The _s_t_r_i_p utility shall produce strippable files of unspecified format.

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
       None.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Historically, this utility has been used to remove the symbol table
       from a strippable file. It was included since it is known that the
       amount of symbolic information can amount to several megabytes; the
       ability to remove it in a portable manner was deemed important,
       especially for smaller systems.

       The behavior of _s_t_r_i_p on object and executable files is said to be the
       same as the −−ss option to a compiler. While the end result is
       essentially the same, it is not required to be identical.

       XSI-conformant systems support use of _s_t_r_i_p on archive files containing
       object files or relocatable files.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _a_r, _c_9_9, _f_o_r_t_7_7

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



IEEE/The Open Group                  2013                            STRIP(1P)
