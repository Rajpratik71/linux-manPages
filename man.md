MAN(1P)                    POSIX Programmer's Manual                   MAN(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       man — display system documentation

SSYYNNOOPPSSIISS
       man [[−k]] _n_a_m_e...

DDEESSCCRRIIPPTTIIOONN
       The _m_a_n utility shall write information about each of the _n_a_m_e
       operands. If _n_a_m_e is the name of a standard utility, _m_a_n at a minimum
       shall write a message describing the syntax used by the standard
       utility, its options, and operands. If more information is available,
       the _m_a_n utility shall provide it in an implementation-defined manner.

       An implementation may provide information for values of _n_a_m_e other than
       the standard utilities. Standard utilities that are listed as optional
       and that are not supported by the implementation either shall cause a
       brief message indicating that fact to be displayed or shall cause a
       full display of information as described previously.

OOPPTTIIOONNSS
       The _m_a_n utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−kk      Interpret _n_a_m_e operands as keywords to be used in searching a
               utilities summary database that contains a brief purpose entry
               for each standard utility and write lines from the summary
               database that match any of the keywords. The keyword search
               shall produce results that are the equivalent of the output of
               the following command:


                   ggrreepp −−EEii ''
                   _n_a_m_e
                   _n_a_m_e
                   ......
                   '' _s_u_m_m_a_r_y_-_d_a_t_a_b_a_s_e

               This assumes that the _s_u_m_m_a_r_y_-_d_a_t_a_b_a_s_e is a text file with a
               single entry per line; this organization is not required and
               the example using _g_r_e_p −−EEii is merely illustrative of the type
               of search intended. The purpose entry to be included in the
               database shall consist of a terse description of the purpose of
               the utility.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _n_a_m_e      A keyword or the name of a standard utility. When −−kk is not
                 specified and _n_a_m_e does not represent one of the standard
                 utilities, the results are unspecified.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _m_a_n:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and in the
                 summary database). The value of _L_C___C_T_Y_P_E need not affect the
                 format of the information written about the _n_a_m_e operands.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _P_A_G_E_R     Determine an output filtering command for writing the output
                 to a terminal. Any string acceptable as a _c_o_m_m_a_n_d___s_t_r_i_n_g
                 operand to the _s_h −−cc command shall be valid. When standard
                 output is a terminal device, the reference page output shall
                 be piped through the command. If the _P_A_G_E_R variable is null
                 or not set, the command shall be either _m_o_r_e or another
                 paginator utility documented in the system documentation.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The _m_a_n utility shall write text describing the syntax of the utility
       _n_a_m_e, its options and its operands, or, when −−kk is specified, lines
       from the summary database. The format of this text is implementation-
       defined.

SSTTDDEERRRR
       The standard error shall be used for diagnostic messages, and may also
       be used for informational messages of unspecified format.

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
       It is recognized that the _m_a_n utility is only of minimal usefulness as
       specified. The opinion of the standard developers was strongly divided
       as to how much or how little information _m_a_n should be required to
       provide. They considered, however, that the provision of some portable
       way of accessing documentation would aid user portability. The
       arguments against a fuller specification were:

        *  Large quantities of documentation should not be required on a
           system that does not have excess disk space.

        *  The current manual system does not present information in a manner
           that greatly aids user portability.

        *  A ``better help system'' is currently an area in which vendors feel
           that they can add value to their POSIX implementations.

       The −−ff option was considered, but due to implementation differences, it
       was not included in this volume of POSIX.1‐2008.

       The description was changed to be more specific about what has to be
       displayed for a utility. The standard developers considered it
       insufficient to allow a display of only the synopsis without giving a
       short description of what each option and operand does.

       The ``purpose'' entry to be included in the database can be similar to
       the section title (less the numeric prefix) from this volume of
       POSIX.1‐2008 for each utility.  These titles are similar to those used
       in historical systems for this purpose.

       See _m_a_i_l_x for rationale concerning the default paginator.

       The caveat in the _L_C___C_T_Y_P_E description was added because it is not a
       requirement that an implementation provide reference pages for all of
       its supported locales on each system; changing _L_C___C_T_Y_P_E does not
       necessarily translate the reference page into another language. This is
       equivalent to the current state of _L_C___M_E_S_S_A_G_E_S in POSIX.1‐2008—locale-
       specific messages are not yet a requirement.

       The historical _M_A_N_P_A_T_H variable is not included in POSIX because no
       attempt is made to specify naming conventions for reference page files,
       nor even to mandate that they are files at all. On some implementations
       they could be a true database, a hypertext file, or even fixed strings
       within the _m_a_n executable. The standard developers considered the
       portability of reference pages to be outside their scope of work.
       However, users should be aware that _M_A_N_P_A_T_H is implemented on a number
       of historical systems and that it can be used to tailor the search
       pattern for reference pages from the various categories (utilities,
       functions, file formats, and so on) when the system administrator
       reveals the location and conventions for reference pages on the system.

       The keyword search can rely on at least the text of the section titles
       from these utility descriptions, and the implementation may add more
       keywords. The term ``section titles'' refers to the strings such as:


           mmaann —— DDiissppllaayy ssyysstteemm ddooccuummeennttaattiioonn
           ppss —— RReeppoorrtt pprroocceessss ssttaattuuss

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _m_o_r_e

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



IEEE/The Open Group                  2013                              MAN(1P)
