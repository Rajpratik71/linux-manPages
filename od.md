OD(1P)                     POSIX Programmer's Manual                    OD(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       od — dump files in various formats

SSYYNNOOPPSSIISS
       od [[−v]] [[−A _a_d_d_r_e_s_s___b_a_s_e]] [[−j _s_k_i_p]] [[−N _c_o_u_n_t]] [[−t _t_y_p_e___s_t_r_i_n_g]]...
           [[_f_i_l_e...]]

       od [[−bcdosx]] [[_f_i_l_e]] [[[[+]]_o_f_f_s_e_t[[.]][[b]]]]

DDEESSCCRRIIPPTTIIOONN
       The _o_d utility shall write the contents of its input files to standard
       output in a user-specified format.

OOPPTTIIOONNSS
       The _o_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that the
       order of presentation of the −−tt options and the −−bbccddoossxx options is
       significant.

       The following options shall be supported:

       −−AA  _a_d_d_r_e_s_s___b_a_s_e
                 Specify the input offset base. See the EXTENDED DESCRIPTION
                 section.  The application shall ensure that the _a_d_d_r_e_s_s___b_a_s_e
                 option-argument is a character. The characters ''dd'', ''oo'', and
                 ''xx'' specify that the offset base shall be written in decimal,
                 octal, or hexadecimal, respectively. The character ''nn''
                 specifies that the offset shall not be written.

       −−bb        Interpret bytes in octal. This shall be equivalent to −−tt  oo11.

       −−cc        Interpret bytes as characters specified by the current
                 setting of the _L_C___C_T_Y_P_E category. Certain non-graphic
                 characters appear as C escapes: ""NNUULL==\\00"", ""BBSS==\\bb"", ""FFFF==\\ff"",
                 ""NNLL==\\nn"", ""CCRR==\\rr"", ""HHTT==\\tt""; others appear as 3-digit octal
                 numbers.

       −−dd        Interpret _w_o_r_ds (two-byte units) in unsigned decimal. This
                 shall be equivalent to −−tt  uu22.

       −−jj  _s_k_i_p   Jump over _s_k_i_p bytes from the beginning of the input. The _o_d
                 utility shall read or seek past the first _s_k_i_p bytes in the
                 concatenated input files. If the combined input is not at
                 least _s_k_i_p bytes long, the _o_d utility shall write a
                 diagnostic message to standard error and exit with a non-zero
                 exit status.

                 By default, the _s_k_i_p option-argument shall be interpreted as
                 a decimal number. With a leading 0x or 0X, the offset shall
                 be interpreted as a hexadecimal number; otherwise, with a
                 leading ''00'', the offset shall be interpreted as an octal
                 number. Appending the character ''bb'', ''kk'', or ''mm'' to offset
                 shall cause it to be interpreted as a multiple of 512, 1024,
                 or 1048576 bytes, respectively. If the _s_k_i_p number is
                 hexadecimal, any appended ''bb'' shall be considered to be the
                 final hexadecimal digit.

       −−NN  _c_o_u_n_t  Format no more than _c_o_u_n_t bytes of input. By default, _c_o_u_n_t
                 shall be interpreted as a decimal number. With a leading 0x
                 or 0X, _c_o_u_n_t shall be interpreted as a hexadecimal number;
                 otherwise, with a leading ''00'', it shall be interpreted as an
                 octal number. If _c_o_u_n_t bytes of input (after successfully
                 skipping, if −−jj _s_k_i_p is specified) are not available, it
                 shall not be considered an error; the _o_d utility shall format
                 the input that is available.

       −−oo        Interpret _w_o_r_ds (two-byte units) in octal. This shall be
                 equivalent to −−tt  oo22.

       −−ss        Interpret _w_o_r_ds (two-byte units) in signed decimal. This
                 shall be equivalent to −−tt  dd22.

       −−tt  _t_y_p_e___s_t_r_i_n_g
                 Specify one or more output types. See the EXTENDED
                 DESCRIPTION section. The application shall ensure that the
                 _t_y_p_e___s_t_r_i_n_g option-argument is a string specifying the types
                 to be used when writing the input data. The string shall
                 consist of the type specification characters aa, cc, dd, ff, oo,
                 uu, and xx, specifying named character, character, signed
                 decimal, floating point, octal, unsigned decimal, and
                 hexadecimal, respectively. The type specification characters
                 dd, ff, oo, uu, and xx can be followed by an optional unsigned
                 decimal integer that specifies the number of bytes to be
                 transformed by each instance of the output type. The type
                 specification character ff can be followed by an optional FF,
                 DD, or LL indicating that the conversion should be applied to
                 an item of type ffllooaatt, ddoouubbllee, or lloonngg ddoouubbllee, respectively.
                 The type specification characters dd, oo, uu, and xx can be
                 followed by an optional CC, SS, II, or LL indicating that the
                 conversion should be applied to an item of type cchhaarr, sshhoorrtt,
                 iinntt, or lloonngg, respectively. Multiple types can be
                 concatenated within the same _t_y_p_e___s_t_r_i_n_g and multiple −−tt
                 options can be specified. Output lines shall be written for
                 each type specified in the order in which the type
                 specification characters are specified.

       −−vv        Write all input data. Without the −−vv option, any number of
                 groups of output lines, which would be identical to the
                 immediately preceding group of output lines (except for the
                 byte offsets), shall be replaced with a line containing only
                 an <asterisk> (''**'').

       −−xx        Interpret _w_o_r_ds (two-byte units) in hexadecimal. This shall
                 be equivalent to −−tt  xx22.

       Multiple types can be specified by using multiple −−bbccddoossttxx options.
       Output lines are written for each type specified in the order in which
       the types are specified.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e      A pathname of a file to be read. If no _f_i_l_e operands are
                 specified, the standard input shall be used.

                 If there are no more than two operands, none of the −−AA, −−jj,
                 −−NN, −−tt, or −−vv options is specified, and either of the
                 following is true: the first character of the last operand is
                 a <plus-sign> (''++''), or there are two operands and the first
                 character of the last operand is numeric; the last operand
                 shall be interpreted as an offset operand on XSI-conformant
                 systems.  Under these conditions, the results are unspecified
                 on systems that are not XSI-conformant systems.

       [[++]]_o_f_f_s_e_t[[..]][[bb]]
                 The _o_f_f_s_e_t operand specifies the offset in the file where
                 dumping is to commence.  This operand is normally interpreted
                 as octal bytes. If ''..'' is appended, the offset shall be
                 interpreted in decimal. If ''bb'' is appended, the offset shall
                 be interpreted in units of 512 bytes.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operands are specified, and
       shall be used if a _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files can be any file type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _o_d:

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

       _L_C___N_U_M_E_R_I_C
                 Determine the locale for selecting the radix character used
                 when writing floating-point formatted output.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       See the EXTENDED DESCRIPTION section.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       The _o_d utility shall copy sequentially each input file to standard
       output, transforming the input data according to the output types
       specified by the −−tt option or the −−bbccddoossxx options.  If no output type
       is specified, the default output shall be as if −−tt  ooSS had been
       specified.

       The number of bytes transformed by the output type specifier cc may be
       variable depending on the _L_C___C_T_Y_P_E category.

       The default number of bytes transformed by output type specifiers dd, ff,
       oo, uu, and xx corresponds to the various C-language types as follows. If
       the _c_9_9 compiler is present on the system, these specifiers shall
       correspond to the sizes used by default in that compiler. Otherwise,
       these sizes may vary among systems that conform to POSIX.1‐2008.

        *  For the type specifier characters dd, oo, uu, and xx, the default
           number of bytes shall correspond to the size of the underlying
           implementation's basic integer type. For these specifier
           characters, the implementation shall support values of the optional
           number of bytes to be converted corresponding to the number of
           bytes in the C-language types cchhaarr, sshhoorrtt, iinntt, and lloonngg.  These
           numbers can also be specified by an application as the characters
           ''CC'', ''SS'', ''II'', and ''LL'', respectively. The implementation shall also
           support the values 1, 2, 4, and 8, even if it provides no C-
           Language types of those sizes. The implementation shall support the
           decimal value corresponding to the C-language type lloonngg lloonngg.  The
           byte order used when interpreting numeric values is implementation-
           defined, but shall correspond to the order in which a constant of
           the corresponding type is stored in memory on the system.

        *  For the type specifier character ff, the default number of bytes
           shall correspond to the number of bytes in the underlying
           implementation's basic double precision floating-point data type.
           The implementation shall support values of the optional number of
           bytes to be converted corresponding to the number of bytes in the
           C-language types ffllooaatt,, ddoouubbllee, and lloonngg ddoouubbllee.  These numbers can
           also be specified by an application as the characters ''FF'', ''DD'', and
           ''LL'', respectively.

       The type specifier character aa specifies that bytes shall be
       interpreted as named characters from the International Reference
       Version (IRV) of the ISO/IEC 646:1991 standard. Only the least
       significant seven bits of each byte shall be used for this type
       specification. Bytes with the values listed in the following table
       shall be written using the corresponding names for those characters.

                            TTaabbllee:: NNaammeedd CChhaarraacctteerrss iinn _o_d

          +-------------+--------------+-------------------+--------------+
          |VVaalluuee   NNaammee | VVaalluuee   NNaammee | VVaalluuee     NNaammee    | VVaalluuee   NNaammee |
          +-------------+--------------+-------------------+--------------+
          |\000    nnuull  | \001    ssoohh  | \002    ssttxx       | \003    eettxx  |
          |\004    eeoott  | \005    eennqq  | \006    aacckk       | \007    bbeell  |
          |\010    bbss   | \011    hhtt   | \012    llff or nnll** | \013    vvtt   |
          |\014    ffff   | \015    ccrr   | \016    ssoo        | \017    ssii   |
          |\020    ddllee  | \021    ddcc11  | \022    ddcc22       | \023    ddcc33  |
          |\024    ddcc44  | \025    nnaakk  | \026    ssyynn       | \027    eettbb  |
          |\030    ccaann  | \031    eemm   | \032    ssuubb       | \033    eesscc  |
          |\034    ffss   | \035    ggss   | \036    rrss        | \037    uuss   |
          |\040    sspp   | \177    ddeell  |                   |              |
          +-------------+--------------+-------------------+--------------+
       NNoottee::     The ""\\001122"" value may be written either as llff or nnll.

       The type specifier character cc specifies that bytes shall be
       interpreted as characters specified by the current setting of the
       _L_C___C_T_Y_P_E locale category. Characters listed in the table in the Base
       Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t _N_o_t_a_t_i_o_n
       (''\\\\'', ''\\aa'', ''\\bb'', ''\\ff'', ''\\nn'', ''\\rr'', ''\\tt'', ''\\vv'') shall be written as
       the corresponding escape sequences, except that <backslash> shall be
       written as a single <backslash> and a NUL shall be written as ''\\00''.
       Other non-printable characters shall be written as one three-digit
       octal number for each byte in the character. Printable multi-byte
       characters shall be written in the area corresponding to the first byte
       of the character; the two-character sequence ""****"" shall be written in
       the area corresponding to each remaining byte in the character, as an
       indication that the character is continued. When either the −−jj _s_k_i_p or
       −−NN _c_o_u_n_t option is specified along with the cc type specifier, and this
       results in an attempt to start or finish in the middle of a multi-byte
       character, the result is implementation-defined.

       The input data shall be manipulated in blocks, where a block is defined
       as a multiple of the least common multiple of the number of bytes
       transformed by the specified output types. If the least common multiple
       is greater than 16, the results are unspecified. Each input block shall
       be written as transformed by each output type, one per written line, in
       the order that the output types were specified. If the input block size
       is larger than the number of bytes transformed by the output type, the
       output type shall sequentially transform the parts of the input block,
       and the output from each of the transformations shall be separated by
       one or more <blank> characters.

       If, as a result of the specification of the −−NN option or end-of-file
       being reached on the last input file, input data only partially
       satisfies an output type, the input shall be extended sufficiently with
       null bytes to write the last byte of the input.

       Unless −−AA  nn is specified, the first output line produced for each input
       block shall be preceded by the input offset, cumulative across input
       files, of the next byte to be written. The format of the input offset
       is unspecified; however, it shall not contain any <blank> characters,
       shall start at the first character of the output line, and shall be
       followed by one or more <blank> characters. In addition, the offset of
       the byte following the last byte written shall be written after all the
       input data has been processed, but shall not be followed by any <blank>
       characters.

       If no −−AA option is specified, the input offset base is unspecified.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input files were processed successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       XSI-conformant applications are warned not to use filenames starting
       with ''++'' or a first operand starting with a numeric character so that
       the old functionality can be maintained by implementations, unless they
       specify one of the −−AA, −−jj, or −−NN options. To guarantee that one of
       these filenames is always interpreted as a filename, an application
       could always specify the address base format with the −−AA option.

EEXXAAMMPPLLEESS
       If a file containing 128 bytes with decimal values zero to 127, in
       increasing order, is supplied as standard input to the command:


           oodd −−AA dd −−tt aa

       on an implementation using an input block size of 16 bytes, the
       standard output, independent of the current locale setting, would be
       similar to:


           00000000000000 nnuull ssoohh ssttxx eettxx eeoott eennqq aacckk bbeell  bbss  hhtt  nnll  vvtt  ffff  ccrr  ssoo  ssii
           00000000001166 ddllee ddcc11 ddcc22 ddcc33 ddcc44 nnaakk ssyynn eettbb ccaann  eemm ssuubb eesscc  ffss  ggss  rrss  uuss
           00000000003322  sspp   !!   ""   ##   $$   %%   &&   ''   ((   ))   **   ++   ,,   −−   ..  //
           00000000004488   00   11   22   33   44   55   66   77   88   99   ::   ;;   <<   ==   >>   ??
           00000000006644   @@   AA   BB   CC   DD   EE   FF   GG   HH   II   JJ   KK   LL   MM   NN   OO
           00000000008800   PP   QQ   RR   SS   TT   UU   VV   WW   XX   YY   ZZ   [[   \\   ]]   ^^   __
           00000000009966   ``   aa   bb   cc   dd   ee   ff   gg   hh   ii   jj   kk   ll   mm   nn   oo
           00000000111122   pp   qq   rr   ss   tt   uu   vv   ww   xx   yy   zz   {{   ||   }}   ~~ ddeell
           00000000112288

       Note that this volume of POSIX.1‐2008 allows nnll or llff to be used as the
       name for the ISO/IEC 646:1991 standard IRV character with decimal value
       10. The IRV names this character llff (line feed), but traditional
       implementations have referred to this character as newline (nnll) and the
       POSIX locale character set symbolic name for the corresponding
       character is a <newline>.

       The command:


           oodd −−AA oo −−tt oo22xx22xx −−NN 1188

       on a system with 32-bit words and an implementation using an input
       block size of 16 bytes could write 18 bytes in approximately the
       following format:


           00000000000000 003322005566 003311444400 004411112233 004422004400 005522551166 004444553300 002200004433 003311446644
                     334422ee   33332200   44225533   44442200   555544ee   44995588   22002233   33333344
                        334422ee33332200      4422553344442200      555544ee44995588      2200223333333344
           00000000002200 003322447722
                     335533aa
                        335533aa00000000
           00000000002222

       The command:


           oodd −−AA dd −−tt ff −−tt oo44 −−tt xx44 −−NN 2244 −−jj 00xx1155

       on a system with 64-bit doubles (for example, IEEE Std 754‐1985 double
       precision floating-point format) would skip 21 bytes of input data and
       then write 24 bytes in approximately the following format:


           00000000000000    11..0000000000000000000000000000ee++0000    11..5577335500000000000000000000ee++0011
                   0077777744000000000000 0000000000000000000000 1100001133667744112211 3355334411221177227700
                      33ffff0000000000    0000000000000000    440022ff33885511    eebb885511eebb88
           00000000001166    11..4400666688223300000000000000ee++0022
                   1100003300331122554422 0044337700330033223300
                      4400661199556622    2233ee1188669988
           00000000002244

RRAATTIIOONNAALLEE
       The _o_d utility went through several names in early proposals, including
       _h_d, _x_d, and most recently _h_e_x_d_u_m_p.  There were several objections to
       all of these based on the following reasons:

        *  The _h_d and _x_d names conflicted with historical utilities that
           behaved differently.

        *  The _h_e_x_d_u_m_p description was much more complex than needed for a
           simple dump utility.

        *  The _o_d utility has been available on all historical implementations
           and there was no need to create a new name for a utility so similar
           to the historical _o_d utility.

       The original reasons for not standardizing historical _o_d were also
       fairly widespread. Those reasons are given below along with rationale
       explaining why the standard developers believe that this version does
       not suffer from the indicated problem:

        *  The BSD and System V versions of _o_d have diverged, and the
           intersection of features provided by both does not meet the needs
           of the user community. In fact, the System V version only provides
           a mechanism for dumping octal bytes and sshhoorrtts, signed and unsigned
           decimal sshhoorrtts, hexadecimal sshhoorrtts, and ASCII characters. BSD added
           the ability to dump ffllooaatts, ddoouubbllees, named ASCII characters, and
           octal, signed decimal, unsigned decimal, and hexadecimal lloonnggs.
           The version presented here provides more normalized forms for
           dumping bytes, sshhoorrtts, iinntts, and lloonnggs in octal, signed decimal,
           unsigned decimal, and hexadecimal; ffllooaatt, ddoouubbllee, and lloonngg ddoouubbllee;
           and named ASCII as well as current locale characters.

        *  It would not be possible to come up with a compatible superset of
           the BSD and System V flags that met the requirements of the
           standard developers. The historical default _o_d output is the
           specified default output of this utility. None of the option
           letters chosen for this version of _o_d conflict with any of the
           options to historical versions of _o_d.

        *  On systems with different sizes for sshhoorrtt, iinntt, and lloonngg, there was
           no way to ask for dumps of iinntts, even in the BSD version. Because
           of the way options are named, the name space could not be extended
           to solve these problems. This is why the −−tt option was added (with
           type specifiers more closely matched to the _p_r_i_n_t_f() formats used
           in the rest of this volume of POSIX.1‐2008) and the optional field
           sizes were added to the dd, ff, oo, uu, and xx type specifiers. It is
           also one of the reasons why the historical practice was not
           mandated as a required obsolescent form of _o_d.  (Although the old
           versions of _o_d are not listed as an obsolescent form,
           implementations are urged to continue to recognize the older forms
           for several more years.) The aa, cc, ff, oo, and xx types match the
           meaning of the corresponding format characters in the historical
           implementations of _o_d except for the default sizes of the fields
           converted. The dd format is signed in this volume of POSIX.1‐2008 to
           match the _p_r_i_n_t_f() notation. (Historical versions of _o_d used dd as a
           synonym for uu in this version. The System V implementation uses ss
           for signed decimal; BSD uses ii for signed decimal and ss for null-
           terminated strings.) Other than dd and uu, all of the type specifiers
           match format characters in the historical BSD version of oodd.

           The sizes of the C-language types cchhaarr, sshhoorrtt, iinntt, lloonngg, ffllooaatt,
           ddoouubbllee, and lloonngg ddoouubbllee are used even though it is recognized that
           there may be zero or more than one compiler for the C language on
           an implementation and that they may use different sizes for some of
           these types. (For example, one compiler might use 2 bytes sshhoorrtts, 2
           bytes iinntts, and 4 bytes lloonnggs, while another compiler (or an option
           to the same compiler) uses 2 bytes sshhoorrtts, 4 bytes iinntts, and 4
           bytes lloonnggs.)  Nonetheless, there has to be a basic size known by
           the implementation for these types, corresponding to the values
           reported by invocations of the _g_e_t_c_o_n_f utility when called with
           _s_y_s_t_e_m___v_a_r operands {UCHAR_MAX}, {USHORT_MAX}, {UINT_MAX}, and
           {ULONG_MAX} for the types cchhaarr, sshhoorrtt, iinntt, and lloonngg, respectively.
           There are similar constants required by the ISO C standard, but not
           required by the System Interfaces volume of POSIX.1‐2008 or this
           volume of POSIX.1‐2008. They are {FLT_MANT_DIG}, {DBL_MANT_DIG},
           and {LDBL_MANT_DIG} for the types ffllooaatt, ddoouubbllee, and lloonngg ddoouubbllee,
           respectively. If the optional _c_9_9 utility is provided by the
           implementation and used as specified by this volume of
           POSIX.1‐2008, these are the sizes that would be provided. If an
           option is used that specifies different sizes for these types,
           there is no guarantee that the _o_d utility is able to interpret
           binary data output by such a program correctly.

           This volume of POSIX.1‐2008 requires that the numeric values of
           these lengths be recognized by the _o_d utility and that symbolic
           forms also be recognized. Thus, a conforming application can always
           look at an array of uunnssiiggnneedd lloonngg data elements using _o_d −−tt _u_L.

        *  The method of specifying the format for the address field based on
           specifying a starting offset in a file unnecessarily tied the two
           together. The −−AA option now specifies the address base and the −−SS
           option specifies a starting offset.

        *  It would be difficult to break the dependence on US ASCII to
           achieve an internationalized utility. It does not seem to be any
           harder for _o_d to dump characters in the current locale than it is
           for the _e_d or _s_e_d ll commands. The cc type specifier does this
           without difficulty and is completely compatible with the historical
           implementations of the cc format character when the current locale
           uses a superset of the ISO/IEC 646:1991 standard as a codeset. The
           aa type specifier (from the BSD aa format character) was left as a
           portable means to dump ASCII (or more correctly ISO/IEC 646:1991
           standard (IRV)) so that headers produced by _p_a_x could be deciphered
           even on systems that do not use the ISO/IEC 646:1991 standard as a
           subset of their base codeset.

       The use of ""****"" as an indication of continuation of a multi-byte
       character in cc specifier output was chosen based on seeing an
       implementation that uses this method. The continuation bytes have to be
       marked in a way that is not ambiguous with another single-byte or
       multi-byte character.

       An early proposal used −−SS and −−nn, respectively, for the −−jj and −−NN
       options eventually selected. These were changed to avoid conflicts with
       historical implementations.

       The original standard specified −−tt oo22 as the default when no output
       type was given. This was changed to −−tt ooSS (the length of a sshhoorrtt) to
       accommodate a supercomputer implementation that historically used 64
       bits as its default (and that defined shorts as 64 bits). This change
       should not affect conforming applications. The requirement to support
       lengths of 1, 2, and 4 was added at the same time to address an
       historical implementation that had no two-byte data types in its C
       compiler.

       The use of a basic integer data type is intended to allow the
       implementation to choose a word size commonly used by applications on
       that architecture.

       Earlier versions of this standard allowed for implementations with
       bytes other than eight bits, but this has been modified in this
       version.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       All option and operand interfaces marked XSI may be removed in a future
       version.

SSEEEE AALLSSOO
       _c_9_9, _s_e_d

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t
       _N_o_t_a_t_i_o_n, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y
       _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

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



IEEE/The Open Group                  2013                               OD(1P)
