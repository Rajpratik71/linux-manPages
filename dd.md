DD(1P)                     POSIX Programmer's Manual                    DD(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       dd — convert and copy a file

SSYYNNOOPPSSIISS
       dd [[_o_p_e_r_a_n_d...]]

DDEESSCCRRIIPPTTIIOONN
       The _d_d utility shall copy the specified input file to the specified
       output file with possible conversions using specific input and output
       block sizes. It shall read the input one block at a time, using the
       specified input block size; it shall then process the block of data
       actually returned, which could be smaller than the requested block
       size. It shall apply any conversions that have been specified and write
       the resulting data to the output in blocks of the specified output
       block size. If the bbss=_e_x_p_r operand is specified and no conversions
       other than ssyynncc, nnooeerrrroorr, or nnoottrruunncc are requested, the data returned
       from each input block shall be written as a separate output block; if
       the read returns less than a full block and the ssyynncc conversion is not
       specified, the resulting output block shall be the same size as the
       input block. If the bbss=_e_x_p_r operand is not specified, or a conversion
       other than ssyynncc, nnooeerrrroorr, or nnoottrruunncc is requested, the input shall be
       processed and collected into full-sized output blocks until the end of
       the input is reached.

       The processing order shall be as follows:

        1. An input block is read.

        2. If the input block is shorter than the specified input block size
           and the ssyynncc conversion is specified, null bytes shall be appended
           to the input data up to the specified size. (If either bblloocckk or
           uunnbblloocckk is also specified, <space> characters shall be appended
           instead of null bytes.) The remaining conversions and output shall
           include the pad characters as if they had been read from the input.

        3. If the bbss=_e_x_p_r operand is specified and no conversion other than
           ssyynncc or nnooeerrrroorr is requested, the resulting data shall be written
           to the output as a single block, and the remaining steps are
           omitted.

        4. If the sswwaabb conversion is specified, each pair of input data bytes
           shall be swapped. If there is an odd number of bytes in the input
           block, the last byte in the input record shall not be swapped.

        5. Any remaining conversions (bblloocckk, uunnbblloocckk, llccaassee, and uuccaassee) shall
           be performed. These conversions shall operate on the input data
           independently of the input blocking; an input or output fixed-
           length record may span block boundaries.

        6. The data resulting from input or conversion or both shall be
           aggregated into output blocks of the specified size. After the end
           of input is reached, any remaining output shall be written as a
           block without padding if ccoonnvv=ssyynncc is not specified; thus, the
           final output block may be shorter than the output block size.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       All of the operands shall be processed before any input is read.  The
       following operands shall be supported:

       iiff=_f_i_l_e   Specify the input pathname; the default is standard input.

       ooff=_f_i_l_e   Specify the output pathname; the default is standard output.
                 If the sseeeekk=_e_x_p_r conversion is not also specified, the output
                 file shall be truncated before the copy begins if an explicit
                 ooff=_f_i_l_e operand is specified, unless ccoonnvv=nnoottrruunncc is
                 specified. If sseeeekk=_e_x_p_r is specified, but ccoonnvv=nnoottrruunncc is
                 not, the effect of the copy shall be to preserve the blocks
                 in the output file over which _d_d seeks, but no other portion
                 of the output file shall be preserved. (If the size of the
                 seek plus the size of the input file is less than the
                 previous size of the output file, the output file shall be
                 shortened by the copy. If the input file is empty and either
                 the size of the seek is greater than the previous size of the
                 output file or the output file did not previously exist, the
                 size of the output file shall be set to the file offset after
                 the seek.)

       iibbss=_e_x_p_r  Specify the input block size, in bytes, by _e_x_p_r (default is
                 512).

       oobbss=_e_x_p_r  Specify the output block size, in bytes, by _e_x_p_r (default is
                 512).

       bbss=_e_x_p_r   Set both input and output block sizes to _e_x_p_r bytes,
                 superseding iibbss= and oobbss=.  If no conversion other than ssyynncc,
                 nnooeerrrroorr, and nnoottrruunncc is specified, each input block shall be
                 copied to the output as a single block without aggregating
                 short blocks.

       ccbbss=_e_x_p_r  Specify the conversion block size for bblloocckk and uunnbblloocckk in
                 bytes by _e_x_p_r (default is zero). If ccbbss= is omitted or given
                 a value of zero, using bblloocckk or uunnbblloocckk produces unspecified
                 results.

                 The application shall ensure that this operand is also
                 specified if the ccoonnvv= operand is specified with a value of
                 aasscciiii, eebbccddiicc, or iibbmm.  For a ccoonnvv= operand with an aasscciiii
                 value, the input is handled as described for the uunnbblloocckk
                 value, except that characters are converted to ASCII before
                 any trailing <space> characters are deleted. For ccoonnvv=
                 operands with eebbccddiicc or iibbmm values, the input is handled as
                 described for the bblloocckk value except that the characters are
                 converted to EBCDIC or IBM EBCDIC, respectively, after any
                 trailing <space> characters are added.

       sskkiipp=_n    Skip _n input blocks (using the specified input block size)
                 before starting to copy. On seekable files, the
                 implementation shall read the blocks or seek past them; on
                 non-seekable files, the blocks shall be read and the data
                 shall be discarded.

       sseeeekk=_n    Skip _n blocks (using the specified output block size) from
                 the beginning of the output file before copying. On non-
                 seekable files, existing blocks shall be read and space from
                 the current end-of-file to the specified offset, if any,
                 filled with null bytes; on seekable files, the implementation
                 shall seek to the specified offset or read the blocks as
                 described for non-seekable files.

       ccoouunntt=_n   Copy only _n input blocks.

       ccoonnvv=_v_a_l_u_e[[,_v_a_l_u_e ...]]
                 Where _v_a_l_u_es are <comma>-separated symbols from the following
                 list:

                 aasscciiii    Convert EBCDIC to ASCII; see _T_a_b_l_e _4_-_7_, _A_S_C_I_I _t_o
                          _E_B_C_D_I_C _C_o_n_v_e_r_s_i_o_n.

                 eebbccddiicc   Convert ASCII to EBCDIC; see _T_a_b_l_e _4_-_7_, _A_S_C_I_I _t_o
                          _E_B_C_D_I_C _C_o_n_v_e_r_s_i_o_n.

                 iibbmm      Convert ASCII to a different EBCDIC set; see _T_a_b_l_e
                          _4_-_8_, _A_S_C_I_I _t_o _I_B_M _E_B_C_D_I_C _C_o_n_v_e_r_s_i_o_n.

                 The aasscciiii, eebbccddiicc, and iibbmm values are mutually-exclusive.

                 bblloocckk    Treat the input as a sequence of
                          <newline>-terminated or end-of-file-terminated
                          variable-length records independent of the input
                          block boundaries. Each record shall be converted to
                          a record with a fixed length specified by the
                          conversion block size. Any <newline> shall be
                          removed from the input line; <space> characters
                          shall be appended to lines that are shorter than
                          their conversion block size to fill the block. Lines
                          that are longer than the conversion block size shall
                          be truncated to the largest number of characters
                          that fit into that size; the number of truncated
                          lines shall be reported (see the STDERR section).

                          The bblloocckk and uunnbblloocckk values are mutually-exclusive.

                 uunnbblloocckk  Convert fixed-length records to variable length.
                          Read a number of bytes equal to the conversion block
                          size (or the number of bytes remaining in the input,
                          if less than the conversion block size), delete all
                          trailing <space> characters, and append a <newline>.

                 llccaassee    Map uppercase characters specified by the _L_C___C_T_Y_P_E
                          keyword ttoolloowweerr to the corresponding lowercase
                          character. Characters for which no mapping is
                          specified shall not be modified by this conversion.

                          The llccaassee and uuccaassee symbols are mutually-exclusive.

                 uuccaassee    Map lowercase characters specified by the _L_C___C_T_Y_P_E
                          keyword ttoouuppppeerr to the corresponding uppercase
                          character. Characters for which no mapping is
                          specified shall not be modified by this conversion.

                 sswwaabb     Swap every pair of input bytes.

                 nnooeerrrroorr  Do not stop processing on an input error. When an
                          input error occurs, a diagnostic message shall be
                          written on standard error, followed by the current
                          input and output block counts in the same format as
                          used at completion (see the STDERR section). If the
                          ssyynncc conversion is specified, the missing input
                          shall be replaced with null bytes and processed
                          normally; otherwise, the input block shall be
                          omitted from the output.

                 nnoottrruunncc  Do not truncate the output file. Preserve blocks in
                          the output file not explicitly written by this
                          invocation of the _d_d utility. (See also the
                          preceding ooff=_f_i_l_e operand.)

                 ssyynncc     Pad every input block to the size of the iibbss=
                          buffer, appending null bytes. (If either bblloocckk or
                          uunnbblloocckk is also specified, append <space>
                          characters, rather than null bytes.)

       The behavior is unspecified if operands other than ccoonnvv= are specified
       more than once.

       For the bbss=, ccbbss=, iibbss=, and oobbss= operands, the application shall
       supply an expression specifying a size in bytes. The expression, _e_x_p_r,
       can be:

        1. A positive decimal number

        2. A positive decimal number followed by _k, specifying multiplication
           by 1024

        3. A positive decimal number followed by _b, specifying multiplication
           by 512

        4. Two or more positive decimal numbers (with or without _k or _b)
           separated by _x, specifying the product of the indicated values

       All of the operands are processed before any input is read.

       The following two tables display the octal number character values used
       for the aasscciiii and eebbccddiicc conversions (first table) and for the iibbmm
       conversion (second table). In both tables, the ASCII values are the row
       and column headers and the EBCDIC values are found at their
       intersections. For example, ASCII 0012 (LF) is the second row, third
       column, yielding 0045 in EBCDIC. The inverted tables (for EBCDIC to
       ASCII conversion) are not shown, but are in one-to-one correspondence
       with these tables. The differences between the two tables are
       highlighted by small boxes drawn around five entries.

                        TTaabbllee 44--77:: AASSCCIIII ttoo EEBBCCDDIICC CCoonnvveerrssiioonn


                      TTaabbllee 44--88:: AASSCCIIII ttoo IIBBMM EEBBCCDDIICC CCoonnvveerrssiioonn

SSTTDDIINN
       If no iiff= operand is specified, the standard input shall be used. See
       the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input file can be any file type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _d_d:

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
                 files), the classification of characters as uppercase or
                 lowercase, and the mapping of characters from one case to the
                 other.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       For SIGINT, the _d_d utility shall interrupt its current processing,
       write status information to standard error, and exit as though
       terminated by SIGINT. It shall take the standard action for all other
       signals; see the ASYNCHRONOUS EVENTS section in _S_e_c_t_i_o_n _1_._4, _U_t_i_l_i_t_y
       _D_e_s_c_r_i_p_t_i_o_n _D_e_f_a_u_l_t_s.

SSTTDDOOUUTT
       If no ooff= operand is specified, the standard output shall be used. The
       nature of the output depends on the operands selected.

SSTTDDEERRRR
       On completion, _d_d shall write the number of input and output blocks to
       standard error. In the POSIX locale the following formats shall be
       used:


           ""%%uu++%%uu rreeccoorrddss iinn\\nn"",, <<_n_u_m_b_e_r _o_f _w_h_o_l_e _i_n_p_u_t _b_l_o_c_k_s>,
               <_n_u_m_b_e_r _o_f _p_a_r_t_i_a_l _i_n_p_u_t _b_l_o_c_k_s>

           "%u+%u records out\n", <_n_u_m_b_e_r _o_f _w_h_o_l_e _o_u_t_p_u_t _b_l_o_c_k_s>,
               <_n_u_m_b_e_r _o_f _p_a_r_t_i_a_l _o_u_t_p_u_t _b_l_o_c_k_s>

       A partial input block is one for which _r_e_a_d() returned less than the
       input block size. A partial output block is one that was written with
       fewer bytes than specified by the output block size.

       In addition, when there is at least one truncated block, the number of
       truncated blocks shall be written to standard error. In the POSIX
       locale, the format shall be:


           ""%%uu ttrruunnccaatteedd %%ss\\nn"",, <<_n_u_m_b_e_r _o_f _t_r_u_n_c_a_t_e_d _b_l_o_c_k_s>, "record" (if
               <_n_u_m_b_e_r _o_f _t_r_u_n_c_a_t_e_d _b_l_o_c_k_s> is one) "records" (otherwise)

       Diagnostic messages may also be written to standard error.

OOUUTTPPUUTT FFIILLEESS
       If the ooff= operand is used, the output shall be the same as described
       in the STDOUT section.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The input file was copied successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If an input error is detected and the nnooeerrrroorr conversion has not been
       specified, any partial output block shall be written to the output
       file, a diagnostic message shall be written, and the copy operation
       shall be discontinued. If some other error is detected, a diagnostic
       message shall be written and the copy operation shall be discontinued.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The input and output block size can be specified to take advantage of
       raw physical I/O.

       There are many different versions of the EBCDIC codesets. The ASCII and
       EBCDIC conversions specified for the _d_d utility perform conversions for
       the version specified by the tables.

EEXXAAMMPPLLEESS
       The following command:


           dddd iiff==//ddeevv//rrmmtt00hh  ooff==//ddeevv//rrmmtt11hh

       copies from tape drive 0 to tape drive 1, using a common historical
       device naming convention.

       The following command:


           dddd iibbss==1100  sskkiipp==11

       strips the first 10 bytes from standard input.

       This example reads an EBCDIC tape blocked ten 80-byte EBCDIC card
       images per block into the ASCII file xx:


           dddd iiff==//ddeevv//ttaappee ooff==xx iibbss==880000 ccbbss==8800 ccoonnvv==aasscciiii,,llccaassee

RRAATTIIOONNAALLEE
       The OPTIONS section is listed as ``None'' because there are no options
       recognized by historical _d_d utilities. Certainly, many of the operands
       could have been designed to use the Utility Syntax Guidelines, which
       would have resulted in the classic hyphenated option letters. In this
       version of this volume of POSIX.1‐2008, _d_d retains its curious JCL-like
       syntax due to the large number of applications that depend on the
       historical implementation.

       A suggested implementation technique for ccoonnvv=nnooeerrrroorr,ssyynncc is to zero
       (or <space>-fill, if bblloocckking or uunnbblloocckking) the input buffer before
       each read and to write the contents of the input buffer to the output
       even after an error. In this manner, any data transferred to the input
       buffer before the error was detected is preserved. Another point is
       that a failed read on a regular file or a disk generally does not
       increment the file offset, and _d_d must then seek past the block on
       which the error occurred; otherwise, the input error occurs
       repetitively. When the input is a magnetic tape, however, the tape
       normally has passed the block containing the error when the error is
       reported, and thus no seek is necessary.

       The default iibbss= and oobbss= sizes are specified as 512 bytes because
       there are historical (largely portable) scripts that assume these
       values. If they were left unspecified, unusual results could occur if
       an implementation chose an odd block size.

       Historical implementations of _d_d used _c_r_e_a_t() when processing ooff=_f_i_l_e.
       This makes the sseeeekk= operand unusable except on special files. The
       ccoonnvv=nnoottrruunncc feature was added because more recent BSD-based
       implementations use _o_p_e_n() (without O_TRUNC) instead of _c_r_e_a_t(), but
       they fail to delete output file contents after the data copied.

       The _w multiplier (historically meaning _w_o_r_d), is used in System V to
       mean 2 and in 4.2 BSD to mean 4. Since _w_o_r_d is inherently non-portable,
       its use is not supported by this volume of POSIX.1‐2008.

       Standard EBCDIC does not have the characters ''[['' and '']]''.  The values
       used in the table are taken from a common print train that does contain
       them. Other than those characters, the print train values are not
       filled in, but appear to provide some of the motivation for the
       historical choice of translations reflected here.

       The Standard EBCDIC table provides a 1:1 translation for all 256 bytes.

       The IBM EBCDIC table does not provide such a translation. The marked
       cells in the tables differ in such a way that:

        1. EBCDIC 0112 (''¢¢'') and 0152 (broken pipe) do not appear in the
           table.

        2. EBCDIC 0137 (''¬¬'') translates to/from ASCII 0236 (''^^'').  In the
           standard table, EBCDIC 0232 (no graphic) is used.

        3. EBCDIC 0241 (''~~'') translates to/from ASCII 0176 (''~~'').  In the
           standard table, EBCDIC 0137 (''¬¬'') is used.

        4. 0255 (''[['') and 0275 ('']]'') appear twice, once in the same place as
           for the standard table and once in place of 0112 (''¢¢'') and 0241
           (''~~'').

       In net result:

              EBCDIC 0275 ('']]'') displaced EBCDIC 0241 (''~~'') in cell 0345.

                  That displaced EBCDIC 0137 (''¬¬'') in cell 0176.

                  That displaced EBCDIC 0232 (no graphic) in cell 0136.

                  That replaced EBCDIC 0152 (broken pipe) in cell 0313.

              EBCDIC 0255 (''[['') replaced EBCDIC 0112 (''¢¢'').

       This translation, however, reflects historical practice that (ASCII)
       ''~~'' and ''¬¬'' were often mapped to each other, as were ''[['' and ''¢¢''; and
       '']]'' and (EBCDIC) ''~~''.

       The ccbbss operand is required if any of the aasscciiii, eebbccddiicc, or iibbmm
       operands are specified. For the aasscciiii operand, the input is handled as
       described for the uunnbblloocckk operand except that characters are converted
       to ASCII before the trailing <space> characters are deleted. For the
       eebbccddiicc and iibbmm operands, the input is handled as described for the
       bblloocckk operand except that the characters are converted to EBCDIC or IBM
       EBCDIC after the trailing <space> characters are added.

       The bblloocckk and uunnbblloocckk keywords are from historical BSD practice.

       The consistent use of the word rreeccoorrdd in standard error messages
       matches most historical practice. An earlier version of System V used
       bblloocckk, but this has been updated in more recent releases.

       Early proposals only allowed two numbers separated by xx to be used in a
       product when specifying bbss=, ccbbss=, iibbss=, and oobbss= sizes. This was
       changed to reflect the historical practice of allowing multiple numbers
       in the product as provided by Version 7 and all releases of System V
       and BSD.

       A change to the sswwaabb conversion is required to match historical
       practice and is the result of IEEE PASC Interpretations 1003.2 #03 and
       #04, submitted for the ISO POSIX‐2:1993 standard.

       A change to the handling of SIGINT is required to match historical
       practice and is the result of IEEE PASC Interpretation 1003.2 #06
       submitted for the ISO POSIX‐2:1993 standard.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _1_._4, _U_t_i_l_i_t_y _D_e_s_c_r_i_p_t_i_o_n _D_e_f_a_u_l_t_s, _s_e_d, _t_r

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



IEEE/The Open Group                  2013                               DD(1P)
