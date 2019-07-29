FUSER(1P)                  POSIX Programmer's Manual                 FUSER(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       fuser — list process IDs of all processes that have one or more files
       open

SSYYNNOOPPSSIISS
       fuser [[−cfu]] _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _f_u_s_e_r utility shall write to standard output the process IDs of
       processes running on the local system that have one or more named files
       open.  For block special devices, all processes using any file on that
       device are listed.

       The _f_u_s_e_r utility shall write to standard error additional information
       about the named files indicating how the file is being used.

       Any output for processes running on remote systems that have a named
       file open is unspecified.

       A user may need appropriate privileges to invoke the _f_u_s_e_r utility.

OOPPTTIIOONNSS
       The _f_u_s_e_r utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−cc        The file is treated as a mount point and the utility shall
                 report on any files open in the file system.

       −−ff        The report shall be only for the named files.

       −−uu        The user name, in parentheses, associated with each process
                 ID written to standard output shall be written to standard
                 error.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname on which the file or file system is to be
                 reported.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       The user database.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _f_u_s_e_r:

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
       The _f_u_s_e_r utility shall write the process ID for each process using
       each file given as an operand to standard output in the following
       format:


           ""%%dd"",, <<_p_r_o_c_e_s_s___i_d>

SSTTDDEERRRR
       The _f_u_s_e_r utility shall write diagnostic messages to standard error.

       The _f_u_s_e_r utility also shall write the following to standard error:

        *  The pathname of each named file is written followed immediately by
           a <colon>.

        *  For each process ID written to standard output, the character ''cc''
           shall be written to standard error if the process is using the file
           as its current directory and the character ''rr'' shall be written to
           standard error if the process is using the file as its root
           directory. Implementations may write other alphabetic characters to
           indicate other uses of files.

        *  When the −−uu option is specified, characters indicating the use of
           the file shall be followed immediately by the user name, in
           parentheses, corresponding to the real user ID of the process. If
           the user name cannot be resolved from the real user ID of the
           process, the real user ID of the process shall be written instead
           of the user name.

       When standard output and standard error are directed to the same file,
       the output shall be interleaved so that the filename appears at the
       start of each line, followed by the process ID and characters
       indicating the use of the file. Then, if the −−uu option is specified,
       the user name or user ID for each process using that file shall be
       written.

       A <newline> shall be written to standard error after the last output
       described above for each _f_i_l_e operand.

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
       None.

EEXXAAMMPPLLEESS
       The command:


           ffuusseerr −−ffuu ..

       writes to standard output the process IDs of processes that are using
       the current directory and writes to standard error an indication of how
       those processes are using the directory and the user names associated
       with the processes that are using the current directory.


           ffuusseerr −−cc <<_m_o_u_n_t _p_o_i_n_t>

       writes to standard output the process IDs of processes that are using
       any file in the file system which is mounted on <_m_o_u_n_t _p_o_i_n_t> and
       writes to standard error an indication of how those processes are using
       the files.


           ffuusseerr <<_m_o_u_n_t _p_o_i_n_t>

       writes to standard output the process IDs of processes that are using
       the file which is named by <_m_o_u_n_t _p_o_i_n_t> and writes to standard error
       an indication of how those processes are using the file.


           ffuusseerr <<_b_l_o_c_k _d_e_v_i_c_e>

       writes to standard output the process IDs of processes that are using
       any file which is on the device named by <_b_l_o_c_k _d_e_v_i_c_e> and writes to
       standard error an indication of how those processes are using the file.


           ffuusseerr −−ff <<_b_l_o_c_k _d_e_v_i_c_e>

       writes to standard output the process IDs of processes that are using
       the file <_b_l_o_c_k _d_e_v_i_c_e> itself and writes to standard error an
       indication of how those processes are using the file.

RRAATTIIOONNAALLEE
       The definition of the _f_u_s_e_r utility follows existing practice.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
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



IEEE/The Open Group                  2013                            FUSER(1P)
