TRUE(1P)                   POSIX Programmer's Manual                  TRUE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       true — return true value

SSYYNNOOPPSSIISS
       true

DDEESSCCRRIIPPTTIIOONN
       The _t_r_u_e utility shall return with exit code zero.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       None.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       None.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Not used.

SSTTDDEERRRR
       Not used.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       Zero.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       None.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       This utility is typically used in shell scripts, as shown in the
       EXAMPLES section. The special built-in utility :: is sometimes more
       efficient than _t_r_u_e.

EEXXAAMMPPLLEESS
       This command is executed forever:


           wwhhiillee ttrruuee
           ddoo
               ccoommmmaanndd
           ddoonnee

RRAATTIIOONNAALLEE
       The _t_r_u_e utility has been retained in this volume of POSIX.1‐2008, even
       though the shell special built-in :: provides similar functionality,
       because _t_r_u_e is widely used in historical scripts and is less cryptic
       to novice script readers.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _2_._9, _S_h_e_l_l _C_o_m_m_a_n_d_s, _f_a_l_s_e

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



IEEE/The Open Group                  2013                             TRUE(1P)
