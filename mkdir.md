MKDIR(1P)                  POSIX Programmer's Manual                 MKDIR(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       mkdir — make directories

SSYYNNOOPPSSIISS
       mkdir [[−p]] [[−m _m_o_d_e]] _d_i_r...

DDEESSCCRRIIPPTTIIOONN
       The _m_k_d_i_r utility shall create the directories specified by the
       operands, in the order specified.

       For each _d_i_r operand, the _m_k_d_i_r utility shall perform actions
       equivalent to the _m_k_d_i_r() function defined in the System Interfaces
       volume of POSIX.1‐2008, called with the following arguments:

        1. The _d_i_r operand is used as the _p_a_t_h argument.

        2. The value of the bitwise-inclusive OR of S_IRWXU, S_IRWXG, and
           S_IRWXO is used as the _m_o_d_e argument. (If the −−mm option is
           specified, the value of the _m_k_d_i_r() _m_o_d_e argument is unspecified,
           but the directory shall at no time have permissions less
           restrictive than the −−mm _m_o_d_e option-argument.)

OOPPTTIIOONNSS
       The _m_k_d_i_r utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−mm  _m_o_d_e   Set the file permission bits of the newly-created directory
                 to the specified _m_o_d_e value. The _m_o_d_e option-argument shall
                 be the same as the _m_o_d_e operand defined for the _c_h_m_o_d
                 utility. In the _s_y_m_b_o_l_i_c___m_o_d_e strings, the _o_p characters ''++''
                 and ''−−'' shall be interpreted relative to an assumed initial
                 mode of _a=_r_w_x; ''++'' shall add permissions to the default mode,
                 ''−−'' shall delete permissions from the default mode.

       −−pp        Create any missing intermediate pathname components.

                 For each _d_i_r operand that does not name an existing
                 directory, before performing the actions described in the
                 DESCRIPTION above, the _m_k_d_i_r utility shall create any
                 pathname components of the path prefix of _d_i_r that do not
                 name an existing directory by performing actions equivalent
                 to first calling the _m_k_d_i_r() function with the following
                 arguments:

                  1. A pathname naming the missing pathname component, ending
                     with a trailing <slash> character, as the _p_a_t_h argument

                  2. The value zero as the _m_o_d_e argument

                 and then calling the _c_h_m_o_d() function with the following
                 arguments:

                  1. The same _p_a_t_h argument as in the _m_k_d_i_r() call

                  2. The value _(_S___I_W_U_S_R_|_S___I_X_U_S_R_|_~_f_i_l_e_m_a_s_k_)_&_0_7_7_7 as the _m_o_d_e
                     argument, where _f_i_l_e_m_a_s_k is the file mode creation mask
                     of the process (see the System Interfaces volume of
                     POSIX.1‐2008, _u_m_a_s_k())

                 Each _d_i_r operand that names an existing directory shall be
                 ignored without error.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _d_i_r       A pathname of a directory to be created.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _m_k_d_i_r:

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
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All the specified directories were created successfully or the −−pp
             option was specified and all the specified directories now exist.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The default file mode for directories is _a=_r_w_x (777 on most systems)
       with selected permissions removed in accordance with the file mode
       creation mask. For intermediate pathname components created by _m_k_d_i_r,
       the mode is the default modified by _u+_w_x so that the subdirectories can
       always be created regardless of the file mode creation mask; if
       different ultimate permissions are desired for the intermediate
       directories, they can be changed afterwards with _c_h_m_o_d.

       Note that some of the requested directories may have been created even
       if an error occurs.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The System V −−mm option was included to control the file mode.

       The System V −−pp option was included to create any needed intermediate
       directories and to complement the functionality provided by _r_m_d_i_r for
       removing directories in the path prefix as they become empty.  Because
       no error is produced if any path component already exists, the −−pp
       option is also useful to ensure that a particular directory exists.

       The functionality of _m_k_d_i_r is described substantially through a
       reference to the _m_k_d_i_r() function in the System Interfaces volume of
       POSIX.1‐2008. For example, by default, the mode of the directory is
       affected by the file mode creation mask in accordance with the
       specified behavior of the _m_k_d_i_r() function. In this way, there is less
       duplication of effort required for describing details of the directory
       creation.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_h_m_o_d, _r_m, _r_m_d_i_r, _u_m_a_s_k

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _m_k_d_i_r(), _u_m_a_s_k()

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



IEEE/The Open Group                  2013                            MKDIR(1P)
