UUENCODE(1P)               POSIX Programmer's Manual              UUENCODE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       uuencode — encode a binary file

SSYYNNOOPPSSIISS
       uuencode [[−m]] [[_f_i_l_e]] _d_e_c_o_d_e___p_a_t_h_n_a_m_e

DDEESSCCRRIIPPTTIIOONN
       The _u_u_e_n_c_o_d_e utility shall write an encoded version of the named input
       file, or standard input if no _f_i_l_e is specified, to standard output.
       The output shall be encoded using one of the algorithms described in
       the STDOUT section and shall include the file access permission bits
       (in _c_h_m_o_d octal or symbolic notation) of the input file and the
       _d_e_c_o_d_e___p_a_t_h_n_a_m_e, for re-creation of the file on another system that
       conforms to this volume of POSIX.1‐2008.

OOPPTTIIOONNSS
       The _u_u_e_n_c_o_d_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported by the implementation:

       −−mm        Encode the output using the MIME Base64 algorithm described
                 in STDOUT.  If −−mm is not specified, the historical algorithm
                 described in STDOUT shall be used.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _d_e_c_o_d_e___p_a_t_h_n_a_m_e
                 The pathname of the file into which the _u_u_d_e_c_o_d_e utility
                 shall place the decoded file. Specifying a _d_e_c_o_d_e___p_a_t_h_n_a_m_e
                 operand of //ddeevv//ssttddoouutt shall indicate that _u_u_d_e_c_o_d_e is to use
                 standard output. If there are characters in _d_e_c_o_d_e___p_a_t_h_n_a_m_e
                 that are not in the portable filename character set the
                 results are unspecified.

       _f_i_l_e      A pathname of the file to be encoded.

SSTTDDIINN
       See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       Input files can be files of any type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _u_u_e_n_c_o_d_e:

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
   uuuueennccooddee BBaassee6644 AAllggoorriitthhmm
       The standard output shall be a text file (encoded in the character set
       of the current locale) that begins with the line:


           ""bbeeggiinn--bbaassee6644 %%ss %%ss\\nn"",, <<_m_o_d_e>, <_d_e_c_o_d_e___p_a_t_h_n_a_m_e>

       and ends with the line:


           ""========\\nn""

       In both cases, the lines shall have no preceding or trailing <blank>
       characters.

       The encoding process represents 24-bit groups of input bits as output
       strings of four encoded characters. Proceeding from left to right, a
       24-bit input group shall be formed by concatenating three 8-bit input
       groups. Each 24-bit input group then shall be treated as four
       concatenated 6-bit groups, each of which shall be translated into a
       single digit in the Base64 alphabet. When encoding a bit stream via the
       Base64 encoding, the bit stream shall be presumed to be ordered with
       the most-significant bit first. That is, the first bit in the stream
       shall be the high-order bit in the first byte, and the eighth bit shall
       be the low-order bit in the first byte, and so on. Each 6-bit group is
       used as an index into an array of 64 printable characters, as shown in
       _T_a_b_l_e _4_-_2_2_, _u_u_e_n_c_o_d_e _B_a_s_e_6_4 _V_a_l_u_e_s.

                         TTaabbllee 44--2222:: uuuueennccooddee BBaassee6644 VVaalluueess

+---------+----------++---------+----------++---------+----------++------------+----------+
| VVaalluuee   | EEnnccooddiinngg || VVaalluuee   | EEnnccooddiinngg || VVaalluuee   | EEnnccooddiinngg ||   VVaalluuee    | EEnnccooddiinngg |
+---------+----------++---------+----------++---------+----------++------------+----------+
| 0       |    A     ||17       |    R     ||34       |    i     ||   51       |    z     |
| 1       |    B     ||18       |    S     ||35       |    j     ||   52       |    0     |
| 2       |    C     ||19       |    T     ||36       |    k     ||   53       |    1     |
| 3       |    D     ||20       |    U     ||37       |    l     ||   54       |    2     |
| 4       |    E     ||21       |    V     ||38       |    m     ||   55       |    3     |
| 5       |    F     ||22       |    W     ||39       |    n     ||   56       |    4     |
| 6       |    G     ||23       |    X     ||40       |    o     ||   57       |    5     |
| 7       |    H     ||24       |    Y     ||41       |    p     ||   58       |    6     |
| 8       |    I     ||25       |    Z     ||42       |    q     ||   59       |    7     |
| 9       |    J     ||26       |    a     ||43       |    r     ||   60       |    8     |
|10       |    K     ||27       |    b     ||44       |    s     ||   61       |    9     |
|11       |    L     ||28       |    c     ||45       |    t     ||   62       |    +     |
|12       |    M     ||29       |    d     ||46       |    u     ||   63       |    /     |
|13       |    N     ||30       |    e     ||47       |    v     ||            |          |
|14       |    O     ||31       |    f     ||48       |    w     ||(pad)       |    =     |
|15       |    P     ||32       |    g     ||49       |    x     ||            |          |
|16       |    Q     ||33       |    h     ||50       |    y     ||            |          |
+---------+----------++---------+----------++---------+----------++------------+----------+
       The character referenced by the index shall be placed in the output
       string.

       The output stream (encoded bytes) shall be represented in lines of no
       more than 76 characters each. All line breaks or other characters not
       found in the table shall be ignored by decoding software (see
       _u_u_d_e_c_o_d_e).

       Special processing shall be performed if fewer than 24 bits are
       available at the end of a message or encapsulated part of a message. A
       full encoding quantum shall always be completed at the end of a
       message. When fewer than 24 input bits are available in an input group,
       zero bits shall be added (on the right) to form an integral number of
       6-bit groups. Output character positions that are not required to
       represent actual input data shall be set to the character ''==''.  Since
       all Base64 input is an integral number of octets, only the following
       cases can arise:

        1. The final quantum of encoding input is an integral multiple of 24
           bits; here, the final unit of encoded output shall be an integral
           multiple of 4 characters with no ''=='' padding.

        2. The final quantum of encoding input is exactly 16 bits; here, the
           final unit of encoded output shall be three characters followed by
           one ''=='' padding character.

        3. The final quantum of encoding input is exactly 8 bits; here, the
           final unit of encoded output shall be two characters followed by
           two ''=='' padding characters.

       A terminating ""========"" evaluates to nothing and denotes the end of the
       encoded data.

   uuuueennccooddee HHiissttoorriiccaall AAllggoorriitthhmm
       The standard output shall be a text file (encoded in the character set
       of the current locale) that begins with the line:


           ""bbeeggiinn %%ss %%ss\\nn"" <<_m_o_d_e>, <_d_e_c_o_d_e___p_a_t_h_n_a_m_e>

       and ends with the line:


           ""eenndd\\nn""

       In both cases, the lines shall have no preceding or trailing <blank>
       characters.

       The algorithm that shall be used for lines in between bbeeggiinn and eenndd
       takes three octets as input and writes four characters of output by
       splitting the input at six-bit intervals into four octets, containing
       data in the lower six bits only. These octets shall be converted to
       characters by adding a value of 0x20 to each octet, so that each octet
       is in the range [0x20,0x5f], and then it shall be assumed to represent
       a printable character in the ISO/IEC 646:1991 standard encoded
       character set. It then shall be translated into the corresponding
       character codes for the codeset in use in the current locale. (For
       example, the octet 0x41, representing ''AA'', would be translated to ''AA''
       in the current codeset, such as 0xc1 if it were EBCDIC.)

       Where the bits of two octets are combined, the least significant bits
       of the first octet shall be shifted left and combined with the most
       significant bits of the second octet shifted right. Thus the three
       octets _A, _B, _C shall be converted into the four octets:


           00xx2200 ++ (((( AA >>>> 22                    )) && 00xx33FF))
           00xx2200 ++ ((((((AA <<<< 44)) || ((((BB >>>> 44)) && 00xxFF)))) && 00xx33FF))
           00xx2200 ++ ((((((BB <<<< 22)) || ((((CC >>>> 66)) && 00xx33)))) && 00xx33FF))
           00xx2200 ++ (((( CC                         )) && 00xx33FF))

       These octets then shall be translated into the local character set.

       Each encoded line contains a length character, equal to the number of
       characters to be decoded plus 0x20 translated to the local character
       set as described above, followed by the encoded characters. The maximum
       number of octets to be encoded on each line shall be 45.

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
       The file is expanded by 35 percent (each three octets become four, plus
       control information) causing it to take longer to transmit.

       Since this utility is intended to create files to be used for data
       interchange between systems with possibly different codesets, and to
       represent binary data as a text file, the ISO/IEC 646:1991 standard was
       chosen for a midpoint in the algorithm as a known reference point. The
       output from _u_u_e_n_c_o_d_e is a text file on the local system. If the output
       were in the ISO/IEC 646:1991 standard codeset, it might not be a text
       file (at least because the <newline> characters might not match), and
       the goal of creating a text file would be defeated. If this text file
       was then carried to another machine with the same codeset, it would be
       perfectly compatible with that system's _u_u_d_e_c_o_d_e.  If it was
       transmitted over a mail system or sent to a machine with a different
       codeset, it is assumed that, as for every other text file, some
       translation mechanism would convert it (by the time it reached a user
       on the other system) into an appropriate codeset. This translation only
       makes sense from the local codeset, not if the file has been put into a
       ISO/IEC 646:1991 standard representation first. Similarly, files
       processed by _u_u_e_n_c_o_d_e can be placed in _p_a_x archives, intermixed with
       other text files in the same codeset.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       A new algorithm was added at the request of the international community
       to parallel work in RFC 2045 (MIME). As with the historical _u_u_e_n_c_o_d_e
       format, the Base64 Content-Transfer-Encoding is designed to represent
       arbitrary sequences of octets in a form that is not humanly readable. A
       65-character subset of the ISO/IEC 646:1991 standard is used, enabling
       6 bits to be represented per printable character. (The extra 65th
       character, ''=='', is used to signify a special processing function.)

       This subset has the important property that it is represented
       identically in all versions of the ISO/IEC 646:1991 standard, including
       US ASCII, and all characters in the subset are also represented
       identically in all versions of EBCDIC. The historical _u_u_e_n_c_o_d_e
       algorithm does not share this property, which is the reason that a
       second algorithm was added to the ISO POSIX‐2 standard.

       The string ""========"" was used for the termination instead of the end used
       in the original format because the latter is a string that could be
       valid encoded input.

       In an early draft, the −−mm option was named −−bb (for Base64), but it was
       renamed to reflect its relationship to the RFC 2045. A −−uu was also
       present to invoke the default algorithm, but since this was not
       historical practice, it was omitted as being unnecessary.

       See the RATIONALE section in _u_u_d_e_c_o_d_e for the derivation of the
       //ddeevv//ssttddoouutt symbol.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_h_m_o_d, _m_a_i_l_x, _u_u_d_e_c_o_d_e

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



IEEE/The Open Group                  2013                         UUENCODE(1P)
