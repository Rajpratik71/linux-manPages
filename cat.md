CAT(1P)                    POSIX Programmer's Manual                   CAT(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       cat — concatenate and print files

SSYYNNOOPPSSIISS
       cat [[−u]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _c_a_t utility shall read files in sequence and shall write their
       contents to the standard output in the same sequence.

OOPPTTIIOONNSS
       The _c_a_t utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−uu        Write bytes from the input file to the standard output
                 without delay as each is read.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of an input file. If no _f_i_l_e operands are
                 specified, the standard input shall be used. If a _f_i_l_e is
                 ''−−'', the _c_a_t utility shall read from the standard input at
                 that point in the sequence. The _c_a_t utility shall not close
                 and reopen standard input when it is referenced in this way,
                 but shall accept multiple occurrences of ''−−'' as a _f_i_l_e
                 operand.

SSTTDDIINN
       The standard input shall be used only if no _f_i_l_e operands are
       specified, or if a _f_i_l_e operand is ''−−''.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files can be any file type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _c_a_t:

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
       The standard output shall contain the sequence of bytes read from the
       input files. Nothing else shall be written to the standard output.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input files were output successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The −−uu option has value in prototyping non-blocking reads from FIFOs.
       The intent is to support the following sequence:


           mmkkffiiffoo ffoooo
           ccaatt −−uu ffoooo >> //ddeevv//ttttyy1133 &&
           ccaatt −−uu >> ffoooo

       It is unspecified whether standard output is or is not buffered in the
       default case. This is sometimes of interest when standard output is
       associated with a terminal, since buffering may delay the output. The
       presence of the −−uu option guarantees that unbuffered I/O is available.
       It is implementation-defined whether the _c_a_t utility buffers output if
       the −−uu option is not specified. Traditionally, the −−uu option is
       implemented using the equivalent of the _s_e_t_v_b_u_f() function defined in
       the System Interfaces volume of POSIX.1‐2008.

EEXXAAMMPPLLEESS
       The following command:


           ccaatt mmyyffiillee

       writes the contents of the file mmyyffiillee to standard output.

       The following command:


           ccaatt ddoocc11 ddoocc22 >> ddoocc..aallll

       concatenates the files ddoocc11 and ddoocc22 and writes the result to ddoocc..aallll.

       Because of the shell language mechanism used to perform output
       redirection, a command such as this:


           ccaatt ddoocc ddoocc..eenndd >> ddoocc

       causes the original data in ddoocc to be lost.

       The command:


           ccaatt ssttaarrtt −− mmiiddddllee −− eenndd >> ffiillee

       when standard input is a terminal, gets two arbitrary pieces of input
       from the terminal with a single invocation of _c_a_t.  Note, however, that
       if standard input is a regular file, this would be equivalent to the
       command:


           ccaatt ssttaarrtt −− mmiiddddllee //ddeevv//nnuullll eenndd >> ffiillee

       because the entire contents of the file would be consumed by _c_a_t the
       first time ''−−'' was used as a _f_i_l_e operand and an end-of-file condition
       would be detected immediately when ''−−'' was referenced the second time.

RRAATTIIOONNAALLEE
       Historical versions of the _c_a_t utility include the −−ee, −−tt, and −−vv,
       options which permit the ends of lines, <tab> characters, and invisible
       characters, respectively, to be rendered visible in the output. The
       standard developers omitted these options because they provide too fine
       a degree of control over what is made visible, and similar output can
       be obtained using a command such as:


           sseedd −−nn ll ppaatthhnnaammee

       The latter also has the advantage that its output is unambiguous,
       whereas the output of historical _c_a_t −−eettvv is not.

       The −−ss option was omitted because it corresponds to different functions
       in BSD and System V-based systems. The BSD −−ss option to squeeze blank
       lines can be accomplished by the shell script shown in the following
       example:


           sseedd −−nn ''
           ## WWrriittee nnoonn--eemmppttyy lliinneess..
           //..//   {{
                 pp
                 dd
                 }}
           ## WWrriittee aa ssiinnggllee eemmppttyy lliinnee,, tthheenn llooookk ffoorr mmoorree eemmppttyy lliinneess..
           //^^$$//  pp
           ## GGeett nneexxtt lliinnee,, ddiissccaarrdd tthhee hheelldd <<nneewwlliinnee>> ((eemmppttyy lliinnee)),,
           ## aanndd llooookk ffoorr mmoorree eemmppttyy lliinneess..
           ::EEmmppttyy
           //^^$$//  {{
                 NN
                 ss//..////
                 bb EEmmppttyy
                 }}
           ## WWrriittee tthhee nnoonn--eemmppttyy lliinnee bbeeffoorree ggooiinngg bbaacckk ttoo sseeaarrcchh
           ## ffoorr tthhee ffiirrsstt iinn aa sseett ooff eemmppttyy lliinneess..
                 pp
           ''

       The System V −−ss option to silence error messages can be accomplished by
       redirecting the standard error. Note that the BSD documentation for _c_a_t
       uses the term ``blank line'' to mean the same as the POSIX ``empty
       line'': a line consisting only of a <newline>.

       The BSD −−nn option was omitted because similar functionality can be
       obtained from the −−nn option of the _p_r utility.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _m_o_r_e

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _s_e_t_v_b_u_f()

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



IEEE/The Open Group                  2013                              CAT(1P)
