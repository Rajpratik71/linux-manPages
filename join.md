JOIN(1P)                   POSIX Programmer's Manual                  JOIN(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       join — relational database operator

SSYYNNOOPPSSIISS
       join [[−a _f_i_l_e___n_u_m_b_e_r|−v _f_i_l_e___n_u_m_b_e_r]] [[−e _s_t_r_i_n_g]] [[−o _l_i_s_t]] [[−t _c_h_a_r]]
           [[−1 _f_i_e_l_d]] [[−2 _f_i_e_l_d]] _f_i_l_e_1 _f_i_l_e_2

DDEESSCCRRIIPPTTIIOONN
       The _j_o_i_n utility shall perform an equality join on the files _f_i_l_e_1 and
       _f_i_l_e_2.  The joined files shall be written to the standard output.

       The join field is a field in each file on which the files are compared.
       The _j_o_i_n utility shall write one line in the output for each pair of
       lines in _f_i_l_e_1 and _f_i_l_e_2 that have identical join fields. The output
       line by default shall consist of the join field, then the remaining
       fields from _f_i_l_e_1, then the remaining fields from _f_i_l_e_2.  This format
       can be changed by using the −−oo option (see below). The −−aa option can be
       used to add unmatched lines to the output. The −−vv option can be used to
       output only unmatched lines.

       The files _f_i_l_e_1 and _f_i_l_e_2 shall be ordered in the collating sequence of
       _s_o_r_t −−bb on the fields on which they shall be joined, by default the
       first in each line. All selected output shall be written in the same
       collating sequence.

       The default input field separators shall be <blank> characters. In this
       case, multiple separators shall count as one field separator, and
       leading separators shall be ignored. The default output field separator
       shall be a <space>.

       The field separator and collating sequence can be changed by using the
       −−tt option (see below).

       If the same key appears more than once in either file, all combinations
       of the set of remaining fields in _f_i_l_e_1 and the set of remaining fields
       in _f_i_l_e_2 are output in the order of the lines encountered.

       If the input files are not in the appropriate collating sequence, the
       results are unspecified.

OOPPTTIIOONNSS
       The _j_o_i_n utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−aa  _f_i_l_e___n_u_m_b_e_r
                 Produce a line for each unpairable line in file _f_i_l_e___n_u_m_b_e_r,
                 where _f_i_l_e___n_u_m_b_e_r is 1 or 2, in addition to the default
                 output. If both −−aa1 and −−aa2 are specified, all unpairable
                 lines shall be output.

       −−ee  _s_t_r_i_n_g Replace empty output fields in the list selected by −−oo with
                 the string _s_t_r_i_n_g.

       −−oo  _l_i_s_t   Construct the output line to comprise the fields specified in
                 _l_i_s_t, each element of which shall have one of the following
                 two forms:

                  1. _f_i_l_e___n_u_m_b_e_r_._f_i_e_l_d, where _f_i_l_e___n_u_m_b_e_r is a file number and
                     _f_i_e_l_d is a decimal integer field number

                  2. 0 (zero), representing the join field

                 The elements of _l_i_s_t shall be either <comma>-separated or
                 <blank>-separated, as specified in Guideline 8 of the Base
                 Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y
                 _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.  The fields specified by _l_i_s_t shall be
                 written for all selected output lines. Fields selected by
                 _l_i_s_t that do not appear in the input shall be treated as
                 empty output fields. (See the −−ee option.) Only specifically
                 requested fields shall be written. The application shall
                 ensure that _l_i_s_t is a single command line argument.

       −−tt  _c_h_a_r   Use character _c_h_a_r as a separator, for both input and output.
                 Every appearance of _c_h_a_r in a line shall be significant. When
                 this option is specified, the collating sequence shall be the
                 same as _s_o_r_t without the −−bb option.

       −−vv  _f_i_l_e___n_u_m_b_e_r
                 Instead of the default output, produce a line only for each
                 unpairable line in _f_i_l_e___n_u_m_b_e_r, where _f_i_l_e___n_u_m_b_e_r is 1 or 2.
                 If both −−vv1 and −−vv2 are specified, all unpairable lines shall
                 be output.

       −−11  _f_i_e_l_d  Join on the _f_i_e_l_dth field of file 1. Fields are decimal
                 integers starting with 1.

       −−22  _f_i_e_l_d  Join on the _f_i_e_l_dth field of file 2. Fields are decimal
                 integers starting with 1.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e_1, _f_i_l_e_2
                 A pathname of a file to be joined. If either of the _f_i_l_e_1 or
                 _f_i_l_e_2 operands is ''−−'', the standard input shall be used in
                 its place.

SSTTDDIINN
       The standard input shall be used only if the _f_i_l_e_1 or _f_i_l_e_2 operand is
       ''−−''.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be text files.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _j_o_i_n:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale of the collating sequence _j_o_i_n expects
                 to have been used when the input files were sorted.

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
       The _j_o_i_n utility output shall be a concatenation of selected character
       fields.  When the −−oo option is not specified, the output shall be:


           ""%%ss%%ss%%ss\\nn"",, <<_j_o_i_n _f_i_e_l_d>, <_o_t_h_e_r _f_i_l_e_1 _f_i_e_l_d_s>,
               <_o_t_h_e_r _f_i_l_e_2 _f_i_e_l_d_s>

       If the join field is not the first field in a file, the
       <_o_t_h_e_r_ _f_i_l_e_ _f_i_e_l_d_s> for that file shall be:


           <<_f_i_e_l_d_s _p_r_e_c_e_d_i_n_g _j_o_i_n _f_i_e_l_d>, <_f_i_e_l_d_s _f_o_l_l_o_w_i_n_g _j_o_i_n _f_i_e_l_d>

       When the −−oo option is specified, the output format shall be:


           ""%%ss\\nn"",, <<_c_o_n_c_a_t_e_n_a_t_i_o_n _o_f _f_i_e_l_d_s>

       where the concatenation of fields is described by the −−oo option, above.

       For either format, each field (except the last) shall be written with
       its trailing separator character. If the separator is the default
       (<blank> characters), a single <space> shall be written after each
       field (except the last).

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
       Pathnames consisting of numeric digits or of the form _s_t_r_i_n_g_._s_t_r_i_n_g
       should not be specified directly following the −−oo list.

EEXXAAMMPPLLEESS
       The −−oo 0 field essentially selects the union of the join fields. For
       example, given file pphhoonnee:


           !!NNaammee           PPhhoonnee NNuummbbeerr
           DDoonn             ++11 112233--445566--77889900
           HHaall             ++11 223344--556677--88990011
           YYaassuusshhii         ++22 334455--667788--99001122

       and file ffaaxx:


           !!NNaammee           FFaaxx NNuummbbeerr
           DDoonn             ++11 112233--445566--77889999
           KKeeiitthh           ++11 445566--778899--00112222
           YYaassuusshhii         ++22 334455--667788--99001111

       (where the large expanses of white space are meant to each represent a
       single <tab>), the command:


           jjooiinn −−tt ""<<ttaabb>>"" −−aa 11 −−aa 22 −−ee ''((uunnkknnoowwnn))'' −−oo 00,,11..22,,22..22 pphhoonnee ffaaxx

       would produce:


           !!NNaammee           PPhhoonnee NNuummbbeerr            FFaaxx NNuummbbeerr
           DDoonn             ++11 112233--445566--77889900         ++11 112233--445566--77889999
           HHaall             ++11 223344--556677--88990011         ((uunnkknnoowwnn))
           KKeeiitthh           ((uunnkknnoowwnn))               ++11 445566--778899--00112222
           YYaassuusshhii         ++22 334455--667788--99001122         ++22 334455--667788--99001111

       Multiple instances of the same key will produce combinatorial results.
       The following:


           ffaa::
               aa xx
               aa yy
               aa zz
           ffbb::
               aa pp

       will produce:


           aa xx pp
           aa yy pp
           aa zz pp

       And the following:


           ffaa::
               aa bb cc
               aa dd ee
           ffbb::
               aa ww xx
               aa yy zz
               aa oo pp

       will produce:


           aa bb cc ww xx
           aa bb cc yy zz
           aa bb cc oo pp
           aa dd ee ww xx
           aa dd ee yy zz
           aa dd ee oo pp

RRAATTIIOONNAALLEE
       The −−ee option is only effective when used with −−oo because, unless
       specific fields are identified using −−oo, _j_o_i_n is not aware of what
       fields might be empty. The exception to this is the join field, but
       identifying an empty join field with the −−ee string is not historical
       practice and some scripts might break if this were changed.

       The 0 field in the −−oo list was adopted from the Tenth Edition version
       of _j_o_i_n to satisfy international objections that the _j_o_i_n in the base
       documents does not support the ``full join'' or ``outer join''
       described in relational database literature. Although it has been
       possible to include a join field in the output (by default, or by field
       number using −−oo), the join field could not be included for an unpaired
       line selected by −−aa.  The −−oo 0 field essentially selects the union of
       the join fields.

       This sort of outer join was not possible with the _j_o_i_n commands in the
       base documents. The −−oo 0 field was chosen because it is an upwards-
       compatible change for applications. An alternative was considered: have
       the join field represent the union of the fields in the files (where
       they are identical for matched lines, and one or both are null for
       unmatched lines). This was not adopted because it would break some
       historical applications.

       The ability to specify _f_i_l_e_2 as −− is not historical practice; it was
       added for completeness.

       The −−vv option is not historical practice, but was considered necessary
       because it permitted the writing of _o_n_l_y those lines that do not match
       on the join field, as opposed to the −−aa option, which prints both lines
       that do and do not match. This additional facility is parallel with the
       −−vv option of _g_r_e_p.

       Some historical implementations have been encountered where a blank
       line in one of the input files was considered to be the end of the
       file; the description in this volume of POSIX.1‐2008 does not cite this
       as an allowable case.

       Earlier versions of this standard allowed −−jj, −−jj11, −−jj22 options, and a
       form of the −−oo option that allowed the _l_i_s_t option-argument to be
       multiple arguments. These forms are no longer specified by POSIX.1‐2008
       but may be present in some implementations.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _a_w_k, _c_o_m_m, _s_o_r_t, _u_n_i_q

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



IEEE/The Open Group                  2013                             JOIN(1P)
