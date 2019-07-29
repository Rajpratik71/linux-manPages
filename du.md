DU(1P)                     POSIX Programmer's Manual                    DU(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       du — estimate file space usage

SSYYNNOOPPSSIISS
       du [[−a|−s]] [[−kx]] [[−H|−L]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       By default, the _d_u utility shall write to standard output the size of
       the file space allocated to, and the size of the file space allocated
       to each subdirectory of, the file hierarchy rooted in each of the
       specified files. By default, when a symbolic link is encountered on the
       command line or in the file hierarchy, _d_u shall count the size of the
       symbolic link (rather than the file referenced by the link), and shall
       not follow the link to another portion of the file hierarchy. The size
       of the file space allocated to a file of type directory shall be
       defined as the sum total of space allocated to all files in the file
       hierarchy rooted in the directory plus the space allocated to the
       directory itself.

       When _d_u cannot _s_t_a_t() files or _s_t_a_t() or read directories, it shall
       report an error condition and the final exit status is affected. Files
       with multiple links shall be counted and written for only one entry.
       The directory entry that is selected in the report is unspecified. By
       default, file sizes shall be written in 512-byte units, rounded up to
       the next 512-byte unit.

OOPPTTIIOONNSS
       The _d_u utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−aa        In addition to the default output, report the size of each
                 file not of type directory in the file hierarchy rooted in
                 the specified file.  Regardless of the presence of the −−aa
                 option, non-directories given as _f_i_l_e operands shall always
                 be listed.

       −−HH        If a symbolic link is specified on the command line, _d_u shall
                 count the size of the file or file hierarchy referenced by
                 the link.

       −−kk        Write the files sizes in units of 1024 bytes, rather than the
                 default 512-byte units.

       −−LL        If a symbolic link is specified on the command line or
                 encountered during the traversal of a file hierarchy, _d_u
                 shall count the size of the file or file hierarchy referenced
                 by the link.

       −−ss        Instead of the default output, report only the total sum for
                 each of the specified files.

       −−xx        When evaluating file sizes, evaluate only those files that
                 have the same device as the file specified by the _f_i_l_e
                 operand.

       Specifying more than one of the mutually-exclusive options −−HH and −−LL
       shall not be considered an error. The last option specified shall
       determine the behavior of the utility.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      The pathname of a file whose size is to be written. If no
                 _f_i_l_e is specified, the current directory shall be used.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _d_u:

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
       The output from _d_u shall consist of the amount of space allocated to a
       file and the name of the file, in the following format:


           ""%%dd %%ss\\nn"",, <<_s_i_z_e>, <_p_a_t_h_n_a_m_e>

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
       None.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The use of 512-byte units is historical practice and maintains
       compatibility with _l_s and other utilities in this volume of
       POSIX.1‐2008. This does not mandate that the file system itself be
       based on 512-byte blocks. The −−kk option was added as a compromise
       measure. It was agreed by the standard developers that 512 bytes was
       the best default unit because of its complete historical consistency on
       System V (_v_e_r_s_u_s the mixed 512/1024-byte usage on BSD systems), and
       that a −−kk option to switch to 1024-byte units was a good compromise.
       Users who prefer the 1024-byte quantity can easily alias _d_u to _d_u −−kk
       without breaking the many historical scripts relying on the 512-byte
       units.

       The −−bb option was added to an early proposal to provide a resolution to
       the situation where System V and BSD systems give figures for file
       sizes in _b_l_o_c_k_s, which is an implementation-defined concept. (In common
       usage, the block size is 512 bytes for System V and 1024 bytes for BSD
       systems.)  However, −−bb was later deleted, since the default was
       eventually decided as 512-byte units.

       Historical file systems provided no way to obtain exact figures for the
       space allocation given to files. There are two known areas of
       inaccuracies in historical file systems: cases of _i_n_d_i_r_e_c_t _b_l_o_c_k_s being
       used by the file system or _s_p_a_r_s_e files yielding incorrectly high
       values. An indirect block is space used by the file system in the
       storage of the file, but that need not be counted in the space
       allocated to the file. A _s_p_a_r_s_e file is one in which an _l_s_e_e_k() call
       has been made to a position beyond the end of the file and data has
       subsequently been written at that point. A file system need not
       allocate all the intervening zero-filled blocks to such a file. It is
       up to the implementation to define exactly how accurate its methods
       are.

       The −−aa and −−ss options were mutually-exclusive in the original version
       of _d_u.  The POSIX Shell and Utilities description is implied by the
       language in the SVID where −−ss is described as causing ``only the grand
       total'' to be reported. Some systems may produce output for −−ssaa, but a
       Strictly Conforming POSIX Shell and Utilities Application cannot use
       that combination.

       The −−aa and −−ss options were adopted from the SVID except that the System
       V behavior of not listing non-directories explicitly given as operands,
       unless the −−aa option is specified, was considered a bug; the BSD-based
       behavior (report for all operands) is mandated. The default behavior of
       _d_u in the SVID with regard to reporting the failure to read files (it
       produces no messages) was considered counter-intuitive, and thus it was
       specified that the POSIX Shell and Utilities default behavior shall be
       to produce such messages. These messages can be turned off with shell
       redirection to achieve the System V behavior.

       The −−xx option is historical practice on recent BSD systems. It has been
       adopted by this volume of POSIX.1‐2008 because there was no other
       historical method of limiting the _d_u search to a single file hierarchy.
       This limitation of the search is necessary to make it possible to
       obtain file space usage information about a file system on which other
       file systems are mounted, without having to resort to a lengthy _f_i_n_d
       and _a_w_k script.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _l_s

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _f_s_t_a_t_a_t()

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



IEEE/The Open Group                  2013                               DU(1P)
