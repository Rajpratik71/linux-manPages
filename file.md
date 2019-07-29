FILE(1P)                   POSIX Programmer's Manual                  FILE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       file — determine file type

SSYYNNOOPPSSIISS
       file [[−dh]] [[−M _f_i_l_e]] [[−m _f_i_l_e]] _f_i_l_e...

       file −i [[−h]] _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _f_i_l_e utility shall perform a series of tests in sequence on each
       specified _f_i_l_e in an attempt to classify it:

        1. If _f_i_l_e does not exist, cannot be read, or its file status could
           not be determined, the output shall indicate that the file was
           processed, but that its type could not be determined.

        2. If the file is not a regular file, its file type shall be
           identified.  The file types directory, FIFO, socket, block special,
           and character special shall be identified as such. Other
           implementation-defined file types may also be identified. If _f_i_l_e
           is a symbolic link, by default the link shall be resolved and _f_i_l_e
           shall test the type of file referenced by the symbolic link. (See
           the −−hh and −−ii options below.)

        3. If the length of _f_i_l_e is zero, it shall be identified as an empty
           file.

        4. The _f_i_l_e utility shall examine an initial segment of _f_i_l_e and shall
           make a guess at identifying its contents based on position-
           sensitive tests. (The answer is not guaranteed to be correct; see
           the −−dd, −−MM, and −−mm options below.)

        5. The _f_i_l_e utility shall examine _f_i_l_e and make a guess at identifying
           its contents based on context-sensitive default system tests. (The
           answer is not guaranteed to be correct.)

        6. The file shall be identified as a data file.

       If _f_i_l_e does not exist, cannot be read, or its file status could not be
       determined, the output shall indicate that the file was processed, but
       that its type could not be determined.

       If _f_i_l_e is a symbolic link, by default the link shall be resolved and
       _f_i_l_e shall test the type of file referenced by the symbolic link.

OOPPTTIIOONNSS
       The _f_i_l_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that the
       order of the −−mm, −−dd, and −−MM options shall be significant.

       The following options shall be supported by the implementation:

       −−dd        Apply any position-sensitive default system tests and
                 context-sensitive default system tests to the file. This is
                 the default if no −−MM or −−mm option is specified.

       −−hh        When a symbolic link is encountered, identify the file as a
                 symbolic link. If −−hh is not specified and _f_i_l_e is a symbolic
                 link that refers to a nonexistent file, _f_i_l_e shall identify
                 the file as a symbolic link, as if −−hh had been specified.

       −−ii        If a file is a regular file, do not attempt to classify the
                 type of the file further, but identify the file as specified
                 in the STDOUT section.

       −−MM  _f_i_l_e   Specify the name of a file containing position-sensitive
                 tests that shall be applied to a file in order to classify it
                 (see the EXTENDED DESCRIPTION). No position-sensitive default
                 system tests nor context-sensitive default system tests shall
                 be applied unless the −−dd option is also specified.

       −−mm  _f_i_l_e   Specify the name of a file containing position-sensitive
                 tests that shall be applied to a file in order to classify it
                 (see the EXTENDED DESCRIPTION).

       If the −−mm option is specified without specifying the −−dd option or the
       −−MM option, position-sensitive default system tests shall be applied
       after the position-sensitive tests specified by the −−mm option. If the
       −−MM option is specified with the −−dd option, the −−mm option, or both, or
       the −−mm option is specified with the −−dd option, the concatenation of the
       position-sensitive tests specified by these options shall be applied in
       the order specified by the appearance of these options. If a −−MM or −−mm
       _f_i_l_e option-argument is −−, the results are unspecified.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a file to be tested.

SSTTDDIINN
       The standard input shall be used if a _f_i_l_e operand is ''−−'' and the
       implementation treats the ''−−'' as meaning standard input.  Otherwise,
       the standard input shall not be used.

IINNPPUUTT FFIILLEESS
       The _f_i_l_e can be any file type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _f_i_l_e:

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
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       In the POSIX locale, the following format shall be used to identify
       each operand, _f_i_l_e specified:


           ""%%ss:: %%ss\\nn"",, <<_f_i_l_e>, <_t_y_p_e>

       The values for <_t_y_p_e> are unspecified, except that in the POSIX locale,
       if _f_i_l_e is identified as one of the types listed in the following
       table, <_t_y_p_e> shall contain (but is not limited to) the corresponding
       string, unless the file is identified by a position-sensitive test
       specified by a −−MM or −−mm option. Each <space> shown in the strings shall
       be exactly one <space>.

                       TTaabbllee 44--99:: FFiillee UUttiilliittyy OOuuttppuutt SSttrriinnggss

+---------------------------------------------+----------------------------------+-------+
|                IIff _f_i_l_e iiss::                  | <<_t_y_p_e>> sshhaallll ccoonnttaaiinn tthhee ssttrriinngg:: | NNootteess |
+---------------------------------------------+----------------------------------+-------+
|Nonexistent                                  | cannot open                      |       |
|                                             |                                  |       |
|Block special                                | block special                    | 1     |
|Character special                            | character special                | 1     |
|Directory                                    | directory                        | 1     |
|FIFO                                         | fifo                             | 1     |
|Socket                                       | socket                           | 1     |
|Symbolic link                                | symbolic link to                 | 1     |
|Regular file                                 | regular file                     | 1,2   |
|Empty regular file                           | empty                            | 3     |
|Regular file that cannot be read             | cannot open                      | 3     |
|                                             |                                  |       |
|Executable binary                            | executable                       | 3,4,6 |
|_a_r archive library (see _a_r)                  | archive                          | 3,4,6 |
|Extended _c_p_i_o format (see _p_a_x)               | cpio archive                     | 3,4,6 |
|Extended _t_a_r format (see uussttaarr in _p_a_x)       | tar archive                      | 3,4,6 |
|                                             |                                  |       |
|Shell script                                 | commands text                    | 3,5,6 |
|C-language source                            | c program text                   | 3,5,6 |
|FORTRAN source                               | fortran program text             | 3,5,6 |
|                                             |                                  |       |
|Regular file whose type cannot be determined | data                             | 3     |
+---------------------------------------------+----------------------------------+-------+
       NNootteess::

                  1. This is a file type test.

                  2. This test is applied only if the −−ii option is specified.

                  3. This test is applied only if the −−ii option is not
                     specified.

                  4. This is a position-sensitive default system test.

                  5. This is a context-sensitive default system test.

                  6. Position-sensitive default system tests and context-
                     sensitive default system tests are not applied if the −−MM
                     option is specified unless the −−dd option is also
                     specified.

       In the POSIX locale, if _f_i_l_e is identified as a symbolic link (see the
       −−hh option), the following alternative output format shall be used:


           ""%%ss:: %%ss %%ss\\nn"",, <<_f_i_l_e>, <_t_y_p_e>, <_c_o_n_t_e_n_t_s _o_f _l_i_n_k>"

       If the file named by the _f_i_l_e operand does not exist, cannot be read,
       or the type of the file named by the _f_i_l_e operand cannot be determined,
       this shall not be considered an error that affects the exit status.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       A file specified as an option-argument to the −−mm or −−MM options shall
       contain one position-sensitive test per line, which shall be applied to
       the file. If the test succeeds, the message field of the line shall be
       printed and no further tests shall be applied, with the exception that
       tests on immediately following lines beginning with a single ''>>''
       character shall be applied.

       Each line shall be composed of the following four <tab>-separated
       fields. (Implementations may allow any combination of one or more
       white-space characters other than <newline> to act as field
       separators.)

       _o_f_f_s_e_t    An unsigned number (optionally preceded by a single ''>>''
                 character) specifying the _o_f_f_s_e_t, in bytes, of the value in
                 the file that is to be compared against the _v_a_l_u_e field of
                 the line. If the file is shorter than the specified offset,
                 the test shall fail.

                 If the _o_f_f_s_e_t begins with the character ''>>'', the test
                 contained in the line shall not be applied to the file unless
                 the test on the last line for which the _o_f_f_s_e_t did not begin
                 with a ''>>'' was successful. By default, the _o_f_f_s_e_t shall be
                 interpreted as an unsigned decimal number. With a leading 0x
                 or 0X, the _o_f_f_s_e_t shall be interpreted as a hexadecimal
                 number; otherwise, with a leading 0, the _o_f_f_s_e_t shall be
                 interpreted as an octal number.

       _t_y_p_e      The type of the value in the file to be tested. The type
                 shall consist of the type specification characters dd, ss, and
                 uu, specifying signed decimal, string, and unsigned decimal,
                 respectively.

                 The _t_y_p_e string shall be interpreted as the bytes from the
                 file starting at the specified _o_f_f_s_e_t and including the same
                 number of bytes specified by the _v_a_l_u_e field. If insufficient
                 bytes remain in the file past the _o_f_f_s_e_t to match the _v_a_l_u_e
                 field, the test shall fail.

                 The type specification characters dd and uu can be followed by
                 an optional unsigned decimal integer that specifies the
                 number of bytes represented by the type. The type
                 specification characters dd and uu can be followed by an
                 optional CC, SS, II, or LL, indicating that the value is of type
                 cchhaarr, sshhoorrtt, iinntt, or lloonngg, respectively.

                 The default number of bytes represented by the type
                 specifiers dd, ff, and uu shall correspond to their respective
                 C-language types as follows. If the system claims conformance
                 to the C-Language Development Utilities option, those
                 specifiers shall correspond to the default sizes used in the
                 _c_9_9 utility. Otherwise, the default sizes shall be
                 implementation-defined.

                 For the type specifier characters dd and uu, the default number
                 of bytes shall correspond to the size of a basic integer type
                 of the implementation. For these specifier characters, the
                 implementation shall support values of the optional number of
                 bytes to be converted corresponding to the number of bytes in
                 the C-language types cchhaarr, sshhoorrtt, iinntt, or lloonngg.  These
                 numbers can also be specified by an application as the
                 characters CC, SS, II, and LL, respectively. The byte order used
                 when interpreting numeric values is implementation-defined,
                 but shall correspond to the order in which a constant of the
                 corresponding type is stored in memory on the system.

                 All type specifiers, except for ss, can be followed by a mask
                 specifier of the form &_n_u_m_b_e_r. The mask value shall be AND'ed
                 with the value of the input file before the comparison with
                 the _v_a_l_u_e field of the line is made. By default, the mask
                 shall be interpreted as an unsigned decimal number. With a
                 leading 0x or 0X, the mask shall be interpreted as an
                 unsigned hexadecimal number; otherwise, with a leading 0, the
                 mask shall be interpreted as an unsigned octal number.

                 The strings bbyyttee, sshhoorrtt, lloonngg, and ssttrriinngg shall also be
                 supported as type fields, being interpreted as ddCC, ddSS, ddLL,
                 and ss, respectively.

       _v_a_l_u_e     The _v_a_l_u_e to be compared with the value from the file.

                 If the specifier from the type field is ss or ssttrriinngg, then
                 interpret the value as a string. Otherwise, interpret it as a
                 number. If the value is a string, then the test shall succeed
                 only when a string value exactly matches the bytes from the
                 file.

                 If the _v_a_l_u_e is a string, it can contain the following
                 sequences:

                 \_c_h_a_r_a_c_t_e_r  The <backslash>-escape sequences as specified in
                             the Base Definitions volume of POSIX.1‐2008,
                             _T_a_b_l_e _5_-_1, _E_s_c_a_p_e _S_e_q_u_e_n_c_e_s _a_n_d _A_s_s_o_c_i_a_t_e_d
                             _A_c_t_i_o_n_s (''\\\\'', ''\\aa'', ''\\bb'', ''\\ff'', ''\\nn'', ''\\rr'',
                             ''\\tt'', ''\\vv'').  In addition, the escape sequence
                             ''\\  '' (the <backslash> character followed by a
                             <space> character) shall be recognized to
                             represent a <space> character. The results of
                             using any other character, other than an octal
                             digit, following the <backslash> are unspecified.

                 \_o_c_t_a_l      Octal sequences that can be used to represent
                             characters with specific coded values. An octal
                             sequence shall consist of a <backslash> followed
                             by the longest sequence of one, two, or three
                             octal-digit characters (01234567).

                 By default, any value that is not a string shall be
                 interpreted as a signed decimal number. Any such value, with
                 a leading 0x or 0X, shall be interpreted as an unsigned
                 hexadecimal number; otherwise, with a leading zero, the value
                 shall be interpreted as an unsigned octal number.

                 If the value is not a string, it can be preceded by a
                 character indicating the comparison to be performed.
                 Permissible characters and the comparisons they specify are
                 as follows:

                 =     The test shall succeed if the value from the file
                       equals the _v_a_l_u_e field.

                 <     The test shall succeed if the value from the file is
                       less than the _v_a_l_u_e field.

                 >     The test shall succeed if the value from the file is
                       greater than the _v_a_l_u_e field.

                 &     The test shall succeed if all of the set bits in the
                       _v_a_l_u_e field are set in the value from the file.

                 ^     The test shall succeed if at least one of the set bits
                       in the _v_a_l_u_e field is not set in the value from the
                       file.

                 x     The test shall succeed if the file is large enough to
                       contain a value of the type specified starting at the
                       offset specified.

       _m_e_s_s_a_g_e   The _m_e_s_s_a_g_e to be printed if the test succeeds. The _m_e_s_s_a_g_e
                 shall be interpreted using the notation for the _p_r_i_n_t_f
                 formatting specification; see _p_r_i_n_t_f.  If the _v_a_l_u_e field was
                 a string, then the value from the file shall be the argument
                 for the _p_r_i_n_t_f formatting specification; otherwise, the value
                 from the file shall be the argument.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The _f_i_l_e utility can only be required to guess at many of the file
       types because only exhaustive testing can determine some types with
       certainty. For example, binary data on some implementations might match
       the initial segment of an executable or a _t_a_r archive.

       Note that the table indicates that the output contains the stated
       string. Systems may add text before or after the string. For
       executables, as an example, the machine architecture and various facts
       about how the file was link-edited may be included. Note also that on
       systems that recognize shell script files starting with ""##!!"" as
       executable files, these may be identified as executable binary files
       rather than as shell scripts.

EEXXAAMMPPLLEESS
       Determine whether an argument is a binary executable file:


           ffiillee −−−− ""$$11"" || ggrreepp −−qq ''::..**eexxeeccuuttaabbllee'' &&&&
               pprriinnttff ""%%ss iiss eexxeeccuuttaabbllee..\\nn$$11""

RRAATTIIOONNAALLEE
       The −−ff option was omitted because the same effect can (and should) be
       obtained using the _x_a_r_g_s utility.

       Historical versions of the _f_i_l_e utility attempt to identify the
       following types of files: symbolic link, directory, character special,
       block special, socket, _t_a_r archive, _c_p_i_o archive, SCCS archive, archive
       library, empty, _c_o_m_p_r_e_s_s output, _p_a_c_k output, binary data, C source,
       FORTRAN source, assembler source, _n_r_o_f_f/_t_r_o_f_f/_e_q_n/_t_b_l source _t_r_o_f_f
       output, shell script, C shell script, English text, ASCII text, various
       executables, APL workspace, compiled terminfo entries, and CURSES
       screen images. Only those types that are reasonably well specified in
       POSIX or are directly related to POSIX utilities are listed in the
       table.

       Historical systems have used a ``magic file'' named //eettcc//mmaaggiicc to help
       identify file types. Because it is generally useful for users and
       scripts to be able to identify special file types, the −−mm flag and a
       portable format for user-created magic files has been specified. No
       requirement is made that an implementation of _f_i_l_e use this method of
       identifying files, only that users be permitted to add their own
       classifying tests.

       In addition, three options have been added to historical practice. The
       −−dd flag has been added to permit users to cause their tests to follow
       any default system tests. The −−ii flag has been added to permit users to
       test portably for regular files in shell scripts. The −−MM flag has been
       added to permit users to ignore any default system tests.

       The POSIX.1‐2008 description of default system tests and the
       interaction between the −−dd, −−MM, and −−mm options did not clearly indicate
       that there were two types of ``default system tests''. The ``position-
       sensitive tests'' determine file types by looking for certain string or
       binary values at specific offsets in the file being examined. These
       position-sensitive tests were implemented in historical systems using
       the magic file described above.  Some of these tests are now built into
       the _f_i_l_e utility itself on some implementations so the output can
       provide more detail than can be provided by magic files. For example, a
       magic file can easily identify a ccoorree file on most implementations, but
       cannot name the program file that dropped the core. A magic file could
       produce output such as:


           //hhoommee//ddwwcc//ccoorree:: EELLFF 3322--bbiitt MMSSBB ccoorree ffiillee SSPPAARRCC VVeerrssiioonn 11

       but by building the test into the _f_i_l_e utility, you could get output
       such as:


           //hhoommee//ddwwcc//ccoorree:: EELLFF 3322--bbiitt MMSSBB ccoorree ffiillee SSPPAARRCC VVeerrssiioonn 11,, ffrroomm ''tteessttpprroogg''

       These extended built-in tests are still to be treated as position-
       sensitive default system tests even if they are not listed in
       //eettcc//mmaaggiicc or any other magic file.

       The context-sensitive default system tests were always built into the
       _f_i_l_e utility. These tests looked for language constructs in text files
       trying to identify shell scripts, C, FORTRAN, and other computer
       language source files, and even plain text files. With the addition of
       the −−mm and −−MM options the distinction between position-sensitive and
       context-sensitive default system tests became important because the
       order of testing is important. The context-sensitive system default
       tests should never be applied before any position-sensitive tests even
       if the −−dd option is specified before a −−mm option or −−MM option due to
       the high probability that the context-sensitive system default tests
       will incorrectly identify arbitrary text files as text files before
       position-sensitive tests specified by the −−mm or −−MM option would be
       applied to give a more accurate identification.

       Leaving the meaning of −−MM −− and −−mm −− unspecified allows an existing
       prototype of these options to continue to work in a backwards-
       compatible manner. (In that implementation, −−MM −− was roughly equivalent
       to −−dd in POSIX.1‐2008.)

       The historical −−cc option was omitted as not particularly useful to
       users or portable shell scripts. In addition, a reasonable
       implementation of the _f_i_l_e utility would report any errors found each
       time the magic file is read.

       The historical format of the magic file was the same as that specified
       by the Rationale in the ISO POSIX‐2:1993 standard for the _o_f_f_s_e_t,
       _v_a_l_u_e, and _m_e_s_s_a_g_e fields; however, it used less precise type fields
       than the format specified by the current normative text. The new type
       field values are a superset of the historical ones.

       The following is an example magic file:


           00  sshhoorrtt     007700770077              ccppiioo aarrcchhiivvee
           00  sshhoorrtt     00114433556611             BByyttee--sswwaappppeedd ccppiioo aarrcchhiivvee
           00  ssttrriinngg    007700770077              AASSCCIIII ccppiioo aarrcchhiivvee
           00  lloonngg      00117777555555             VVeerryy oolldd aarrcchhiivvee
           00  sshhoorrtt     00117777554455             OOlldd aarrcchhiivvee
           00  sshhoorrtt     001177443377              OOlldd ppaacckkeedd ddaattaa
           00  ssttrriinngg    \\003377\\003366            PPaacckkeedd ddaattaa
           00  ssttrriinngg    \\337777\\003377            CCoommppaacctteedd ddaattaa
           00  ssttrriinngg    \\003377\\223355            CCoommpprreesssseedd ddaattaa
           >>22 bbyyttee&&00xx8800 >>00                  BBlloocckk ccoommpprreesssseedd
           >>22 bbyyttee&&00xx11ff xx                   %%dd bbiittss
           00  ssttrriinngg    \\003322\\000011            CCoommppiilleedd TTeerrmmiinnffoo EEnnttrryy
           00  sshhoorrtt     00443333                CCuurrsseess ssccrreeeenn iimmaaggee
           00  sshhoorrtt     00443344                CCuurrsseess ssccrreeeenn iimmaaggee
           00  ssttrriinngg    <<aarr>>                SSyysstteemm VV RReelleeaassee 11 aarrcchhiivvee
           00  ssttrriinngg    !!<<aarrcchh>>\\nn____..SSYYMMDDEEFF  AArrcchhiivvee rraannddoomm lliibbrraarryy
           00  ssttrriinngg    !!<<aarrcchh>>             AArrcchhiivvee
           00  ssttrriinngg    AARRFF__BBEEGGAARRFF          PPHHIIGGSS cclleeaarr tteexxtt aarrcchhiivvee
           00  lloonngg      00xx113377AA22995500          SSccaallaabbllee OOppeennFFoonntt bbiinnaarryy
           00  lloonngg      00xx113377AA22995511          EEnnccrryypptteedd ssccaallaabbllee OOppeennFFoonntt bbiinnaarryy

       The use of a basic integer data type is intended to allow the
       implementation to choose a word size commonly used by applications on
       that architecture.

       Earlier versions of this standard allowed for implementations with
       bytes other than eight bits, but this has been modified in this
       version.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _a_r, _l_s, _p_a_x, _p_r_i_n_t_f

       The Base Definitions volume of POSIX.1‐2008, _T_a_b_l_e _5_-_1, _E_s_c_a_p_e
       _S_e_q_u_e_n_c_e_s _a_n_d _A_s_s_o_c_i_a_t_e_d _A_c_t_i_o_n_s, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s,
       _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                             FILE(1P)
