DF(1P)                     POSIX Programmer's Manual                    DF(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       df — report free disk space

SSYYNNOOPPSSIISS
       df [[−k]] [[−P|−t]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _d_f utility shall write the amount of available space and file slots
       for file systems on which the invoking user has appropriate read
       access. File systems shall be specified by the _f_i_l_e operands; when none
       are specified, information shall be written for all file systems. The
       format of the default output from _d_f is unspecified, but all space
       figures are reported in 512-byte units, unless the −−kk option is
       specified. This output shall contain at least the file system names,
       amount of available space on each of these file systems, and, if no
       options other than −−tt are specified, the number of free file slots, or
       _i_n_o_d_es, available; when −−tt is specified, the output shall contain the
       total allocated space as well.

OOPPTTIIOONNSS
       The _d_f utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−kk        Use 1024-byte units, instead of the default 512-byte units,
                 when writing space figures.

       −−PP        Produce output in the format described in the STDOUT section.

       −−tt        Include total allocated-space figures in the output.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a file within the hierarchy of the desired file
                 system.  If a file other than a FIFO, a regular file, a
                 directory, or a special file representing the device
                 containing the file system (for example, //ddeevv//ddsskk//00ss11) is
                 specified, the results are unspecified. If the _f_i_l_e operand
                 names a file other than a special file containing a file
                 system, _d_f shall write the amount of free space in the file
                 system containing the specified _f_i_l_e operand.  Otherwise, _d_f
                 shall write the amount of free space in that file system.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _d_f:

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
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       When both the −−kk and −−PP options are specified, the following header
       line shall be written (in the POSIX locale):


           ""FFiilleessyysstteemm 11002244--bblloocckkss UUsseedd AAvvaaiillaabbllee CCaappaacciittyy MMoouunntteedd oonn\\nn""

       When the −−PP option is specified without the −−kk option, the following
       header line shall be written (in the POSIX locale):


           ""FFiilleessyysstteemm 551122--bblloocckkss UUsseedd AAvvaaiillaabbllee CCaappaacciittyy MMoouunntteedd oonn\\nn""

       The implementation may adjust the spacing of the header line and the
       individual data lines so that the information is presented in orderly
       columns.

       The remaining output with −−PP shall consist of one line of information
       for each specified file system. These lines shall be formatted as
       follows:


           ""%%ss %%dd %%dd %%dd %%dd%%%% %%ss\\nn"",, <<_f_i_l_e _s_y_s_t_e_m _n_a_m_e>, <_t_o_t_a_l _s_p_a_c_e>,
               <_s_p_a_c_e _u_s_e_d>, <_s_p_a_c_e _f_r_e_e>, <_p_e_r_c_e_n_t_a_g_e _u_s_e_d>,
               <_f_i_l_e _s_y_s_t_e_m _r_o_o_t>

       In the following list, all quantities expressed in 512-byte units
       (1024-byte when −−kk is specified) shall be rounded up to the next higher
       unit. The fields are:

       <_f_i_l_e_ _s_y_s_t_e_m_ _n_a_m_e>
                 The name of the file system, in an implementation-defined
                 format.

       <_t_o_t_a_l_ _s_p_a_c_e>
                 The total size of the file system in 512-byte units. The
                 exact meaning of this figure is implementation-defined, but
                 should include <_s_p_a_c_e_ _u_s_e_d>, <_s_p_a_c_e_ _f_r_e_e>, plus any space
                 reserved by the system not normally available to a user.

       <_s_p_a_c_e_ _u_s_e_d>
                 The total amount of space allocated to existing files in the
                 file system, in 512-byte units.

       <_s_p_a_c_e_ _f_r_e_e>
                 The total amount of space available within the file system
                 for the creation of new files by unprivileged users, in
                 512-byte units. When this figure is less than or equal to
                 zero, it shall not be possible to create any new files on the
                 file system without first deleting others, unless the process
                 has appropriate privileges. The figure written may be less
                 than zero.

       <_p_e_r_c_e_n_t_a_g_e_ _u_s_e_d>
                 The percentage of the normally available space that is
                 currently allocated to all files on the file system. This
                 shall be calculated using the fraction:


                     <<_s_p_a_c_e _u_s_e_d>/( <_s_p_a_c_e _u_s_e_d>+ <_s_p_a_c_e _f_r_e_e>)

                 expressed as a percentage. This percentage may be greater
                 than 100 if <_s_p_a_c_e_ _f_r_e_e> is less than zero. The percentage
                 value shall be expressed as a positive integer, with any
                 fractional result causing it to be rounded to the next
                 highest integer.

       <_f_i_l_e_ _s_y_s_t_e_m_ _r_o_o_t>
                 The directory below which the file system hierarchy appears.

       The output format is unspecified when −−tt is used.

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
       On most systems, the ``name of the file system, in an implementation-
       defined format'' is the special file on which the file system is
       mounted.

       On large file systems, the calculation specified for percentage used
       can create huge rounding errors.

EEXXAAMMPPLLEESS
        1. The following example writes portable information about the //uussrr
           file system:


               ddff −−PP //uussrr

        2. Assuming that //uussrr//ssrrcc is part of the //uussrr file system, the
           following produces the same output as the previous example:


               ddff −−PP //uussrr//ssrrcc

RRAATTIIOONNAALLEE
       The behavior of _d_f with the −−PP option is the default action of the 4.2
       BSD _d_f utility. The uppercase −−PP was selected to avoid collision with a
       known industry extension using −−pp.

       Historical _d_f implementations vary considerably in their default
       output. It was therefore necessary to describe the default output in a
       loose manner to accommodate all known historical implementations and to
       add a portable option (−−PP) to provide information in a portable format.

       The use of 512-byte units is historical practice and maintains
       compatibility with _l_s and other utilities in this volume of
       POSIX.1‐2008. This does not mandate that the file system itself be
       based on 512-byte blocks. The −−kk option was added as a compromise
       measure. It was agreed by the standard developers that 512 bytes was
       the best default unit because of its complete historical consistency on
       System V (_v_e_r_s_u_s the mixed 512/1024-byte usage on BSD systems), and
       that a −−kk option to switch to 1024-byte units was a good compromise.
       Users who prefer the more logical 1024-byte quantity can easily alias
       _d_f to _d_f −−kk without breaking many historical scripts relying on the
       512-byte units.

       It was suggested that _d_f and the various related utilities be modified
       to access a _B_L_O_C_K_S_I_Z_E environment variable to achieve consistency and
       user acceptance. Since this is not historical practice on any system,
       it is left as a possible area for system extensions and will be re-
       evaluated in a future version if it is widely implemented.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _f_i_n_d

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



IEEE/The Open Group                  2013                               DF(1P)
