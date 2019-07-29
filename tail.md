TAIL(1P)                   POSIX Programmer's Manual                  TAIL(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       tail — copy the last part of a file

SSYYNNOOPPSSIISS
       tail [[−f]] [[−c _n_u_m_b_e_r|−n _n_u_m_b_e_r]] [[_f_i_l_e]]

DDEESSCCRRIIPPTTIIOONN
       The _t_a_i_l utility shall copy its input file to the standard output
       beginning at a designated place.

       Copying shall begin at the point in the file indicated by the −−cc _n_u_m_b_e_r
       or −−nn _n_u_m_b_e_r options. The option-argument _n_u_m_b_e_r shall be counted in
       units of lines or bytes, according to the options −−nn and −−cc.  Both line
       and byte counts start from 1.

       Tails relative to the end of the file may be saved in an internal
       buffer, and thus may be limited in length. Such a buffer, if any, shall
       be no smaller than {LINE_MAX}*10 bytes.

OOPPTTIIOONNSS
       The _t_a_i_l utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that ''++''
       may be recognized as an option delimiter as well as ''−−''.

       The following options shall be supported:

       −−cc  _n_u_m_b_e_r The application shall ensure that the _n_u_m_b_e_r option-argument
                 is a decimal integer, optionally including a sign.  The sign
                 shall affect the location in the file, measured in bytes, to
                 begin the copying:

                        +-----+----------------------------------------+
                        |SSiiggnn |             CCooppyyiinngg SSttaarrttss             |
                        +-----+----------------------------------------+
                        | +   | Relative to the beginning of the file. |
                        | −   | Relative to the end of the file.       |
                        |_n_o_n_e | Relative to the end of the file.       |
                        +-----+----------------------------------------+
                 The application shall ensure that if the sign of the _n_u_m_b_e_r
                 option-argument is ''++'', the _n_u_m_b_e_r option-argument is a non-
                 zero decimal integer.

                 The origin for counting shall be 1; that is, −−cc +1 represents
                 the first byte of the file, −−cc −1 the last.

       −−ff        If the input file is a regular file or if the _f_i_l_e operand
                 specifies a FIFO, do not terminate after the last line of the
                 input file has been copied, but read and copy further bytes
                 from the input file when they become available. If no _f_i_l_e
                 operand is specified and standard input is a pipe or FIFO,
                 the −−ff option shall be ignored. If the input file is not a
                 FIFO, pipe, or regular file, it is unspecified whether or not
                 the −−ff option shall be ignored.

       −−nn  _n_u_m_b_e_r This option shall be equivalent to −−cc _n_u_m_b_e_r, except the
                 starting location in the file shall be measured in lines
                 instead of bytes. The origin for counting shall be 1; that
                 is, −−nn +1 represents the first line of the file, −−nn −1 the
                 last.

       If neither −−cc nor −−nn is specified, −−nn 10 shall be assumed.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of an input file. If no _f_i_l_e operand is specified,
                 the standard input shall be used.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operand is specified, and
       shall be used if the _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       If the −−cc option is specified, the input file can contain arbitrary
       data; otherwise, the input file shall be a text file.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _t_a_i_l:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The designated portion of the input file shall be written to standard
       output.

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
       The −−cc option should be used with caution when the input is a text file
       containing multi-byte characters; it may produce output that does not
       start on a character boundary.

       Although the input file to _t_a_i_l can be any type, the results might not
       be what would be expected on some character special device files or on
       file types not described by the System Interfaces volume of
       POSIX.1‐2008. Since this volume of POSIX.1‐2008 does not specify the
       block size used when doing input, _t_a_i_l need not read all of the data
       from devices that only perform block transfers.

EEXXAAMMPPLLEESS
       The −−ff option can be used to monitor the growth of a file that is being
       written by some other process. For example, the command:


           ttaaiill −−ff ffrreedd

       prints the last ten lines of the file ffrreedd, followed by any lines that
       are appended to ffrreedd between the time _t_a_i_l is initiated and killed. As
       another example, the command:


           ttaaiill −−ff −−cc 1155 ffrreedd

       prints the last 15 bytes of the file ffrreedd, followed by any bytes that
       are appended to ffrreedd between the time _t_a_i_l is initiated and killed.

RRAATTIIOONNAALLEE
       This version of _t_a_i_l was created to allow conformance to the Utility
       Syntax Guidelines. The historical −−bb option was omitted because of the
       general non-portability of block-sized units of text. The −−cc option
       historically meant ``characters'', but this volume of POSIX.1‐2008
       indicates that it means ``bytes''. This was selected to allow
       reasonable implementations when multi-byte characters are possible; it
       was not named −−bb to avoid confusion with the historical −−bb.

       The origin of counting both lines and bytes is 1, matching all
       widespread historical implementations. Hence _t_a_i_l −−nn +0 is not
       conforming usage because it attempts to output line zero; but note that
       _t_a_i_l −−nn 0 does conform, and outputs nothing.

       Earlier versions of this standard allowed the following forms in the
       SYNOPSIS:


           ttaaiill −−[[number]][[b|c|l]][[f]] [[_f_i_l_e]]
           tail +[[number]][[b|c|l]][[f]] [[_f_i_l_e]]

       These forms are no longer specified by POSIX.1‐2008, but may be present
       in some implementations.

       The restriction on the internal buffer is a compromise between the
       historical System V implementation of 4096 bytes and the BSD 32768
       bytes.

       The −−ff option has been implemented as a loop that sleeps for 1 second
       and copies any bytes that are available. This is sufficient, but if
       more efficient methods of determining when new data are available are
       developed, implementations are encouraged to use them.

       Historical documentation indicates that _t_a_i_l ignores the −−ff option if
       the input file is a pipe (pipe and FIFO on systems that support FIFOs).
       On BSD-based systems, this has been true; on System V-based systems,
       this was true when input was taken from standard input, but it did not
       ignore the −−ff flag if a FIFO was named as the _f_i_l_e operand. Since the
       −−ff option is not useful on pipes and all historical implementations
       ignore −−ff if no _f_i_l_e operand is specified and standard input is a pipe,
       this volume of POSIX.1‐2008 requires this behavior. However, since the
       −−ff option is useful on a FIFO, this volume of POSIX.1‐2008 also
       requires that if a FIFO is named, the −−ff option shall not be ignored.
       Earlier versions of this standard did not state any requirement for the
       case where no _f_i_l_e operand is specified and standard input is a FIFO.
       The standard has been updated to reflect current practice which is to
       treat this case the same as a pipe on standard input.  Although
       historical behavior does not ignore the −−ff option for other file types,
       this is unspecified so that implementations are allowed to ignore the
       −−ff option if it is known that the file cannot be extended.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _h_e_a_d

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



IEEE/The Open Group                  2013                             TAIL(1P)
