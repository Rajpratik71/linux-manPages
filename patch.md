PATCH(1P)                  POSIX Programmer's Manual                 PATCH(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       patch — apply changes to files

SSYYNNOOPPSSIISS
       patch [[−blNR]] [[−c|−e|−n|−u]] [[−d _d_i_r]] [[−D _d_e_f_i_n_e]] [[−i _p_a_t_c_h_f_i_l_e]]
           [[−o _o_u_t_f_i_l_e]] [[−p _n_u_m]] [[−r _r_e_j_e_c_t_f_i_l_e]] [[_f_i_l_e]]

DDEESSCCRRIIPPTTIIOONN
       The _p_a_t_c_h utility shall read a source (patch) file containing any of
       four forms of difference (diff) listings produced by the _d_i_f_f utility
       (normal, copied context, unified context, or in the style of _e_d) and
       apply those differences to a file. By default, _p_a_t_c_h shall read from
       the standard input.

       The _p_a_t_c_h utility shall attempt to determine the type of the _d_i_f_f
       listing, unless overruled by a −−cc, −−ee, −−nn, or −−uu option.

       If the patch file contains more than one patch, _p_a_t_c_h shall attempt to
       apply each of them as if they came from separate patch files. (In this
       case, the application shall ensure that the name of the patch file is
       determinable for each _d_i_f_f listing.)

OOPPTTIIOONNSS
       The _p_a_t_c_h utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−bb        Save a copy of the original contents of each modified file,
                 before the differences are applied, in a file of the same
                 name with the suffix ..oorriigg appended to it. If the file
                 already exists, it shall be overwritten; if multiple patches
                 are applied to the same file, the ..oorriigg file shall be written
                 only for the first patch. When the −−oo _o_u_t_f_i_l_e option is also
                 specified, _f_i_l_e..oorriigg shall not be created but, if _o_u_t_f_i_l_e
                 already exists, _o_u_t_f_i_l_e..oorriigg shall be created.

       −−cc        Interpret the patch file as a copied context difference (the
                 output of the utility _d_i_f_f when the −−cc or −−CC options are
                 specified).

       −−dd  _d_i_r    Change the current directory to _d_i_r before processing as
                 described in the EXTENDED DESCRIPTION section.

       −−DD  _d_e_f_i_n_e Mark changes with one of the following C preprocessor
                 constructs:


                     ##iiffddeeff ddeeffiinnee
                     ......
                     ##eennddiiff

                     #ifndef define
                     ...
                     #endif

                 optionally combined with the C preprocessor construct ##eellssee.
                 If the patched file is processed with the C preprocessor,
                 where the macro _d_e_f_i_n_e is defined, the output shall contain
                 the changes from the patch file; otherwise, the output shall
                 not contain the patches specified in the patch file.

       −−ee        Interpret the patch file as an _e_d script, rather than a _d_i_f_f
                 script.

       −−ii  _p_a_t_c_h_f_i_l_e
                 Read the patch information from the file named by the
                 pathname _p_a_t_c_h_f_i_l_e, rather than the standard input.

       −−ll        (The letter ell.) Cause any sequence of <blank> characters in
                 the difference script to match any sequence of <blank>
                 characters in the input file. Other characters shall be
                 matched exactly.

       −−nn        Interpret the script as a normal difference.

       −−NN        Ignore patches where the differences have already been
                 applied to the file; by default, already-applied patches
                 shall be rejected.

       −−oo  _o_u_t_f_i_l_e
                 Instead of modifying the files (specified by the _f_i_l_e operand
                 or the difference listings) directly, write a copy of the
                 file referenced by each patch, with the appropriate
                 differences applied, to _o_u_t_f_i_l_e.  Multiple patches for a
                 single file shall be applied to the intermediate versions of
                 the file created by any previous patches, and shall result in
                 multiple, concatenated versions of the file being written to
                 _o_u_t_f_i_l_e.

       −−pp  _n_u_m    For all pathnames in the patch file that indicate the names
                 of files to be patched, delete _n_u_m pathname components from
                 the beginning of each pathname. If the pathname in the patch
                 file is absolute, any leading <slash> characters shall be
                 considered the first component (that is, −−pp  11 shall remove
                 the leading <slash> characters). Specifying −−pp  00 shall cause
                 the full pathname to be used. If −−pp is not specified, only
                 the basename (the final pathname component) shall be used.

       −−RR        Reverse the sense of the patch script; that is, assume that
                 the difference script was created from the new version to the
                 old version.  The −−RR option cannot be used with _e_d scripts.
                 The _p_a_t_c_h utility shall attempt to reverse each portion of
                 the script before applying it. Rejected differences shall be
                 saved in swapped format. If this option is not specified, and
                 until a portion of the patch file is successfully applied,
                 _p_a_t_c_h attempts to apply each portion in its reversed sense as
                 well as in its normal sense. If the attempt is successful,
                 the user shall be prompted to determine whether the −−RR option
                 should be set.

       −−rr  _r_e_j_e_c_t_f_i_l_e
                 Override the default reject filename. In the default case,
                 the reject file shall have the same name as the output file,
                 with the suffix ..rreejj appended to it; see _P_a_t_c_h _A_p_p_l_i_c_a_t_i_o_n.

       −−uu        Interpret the patch file as a unified context difference (the
                 output of the _d_i_f_f utility when the −−uu or −−UU options are
                 specified).

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a file to patch.

SSTTDDIINN
       See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       Input files shall be text files.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _p_a_t_c_h:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s the precedence of internationalization variables
                 used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for the behavior of ranges, equivalence
                 classes, and multi-character collating elements used in the
                 extended regular expression defined for the yyeesseexxpprr locale
                 keyword in the _L_C___M_E_S_S_A_G_E_S category.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files), and the behavior of character classes used in the
                 extended regular expression defined for the yyeesseexxpprr locale
                 keyword in the _L_C___M_E_S_S_A_G_E_S category.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale used to process affirmative responses,
                 and the locale used to affect the format and contents of
                 diagnostic messages and prompts written to standard error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _L_C___T_I_M_E   Determine the locale for recognizing the format of file
                 timestamps written by the _d_i_f_f utility in a context-
                 difference input file.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Not used.

SSTTDDEERRRR
       The standard error shall be used for diagnostic and informational
       messages.

OOUUTTPPUUTT FFIILLEESS
       The output of the _p_a_t_c_h utility, the save files (..oorriigg suffixes), and
       the reject files (..rreejj suffixes) shall be text files.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       A patch file may contain patching instructions for more than one file;
       filenames shall be determined as specified in _F_i_l_e_n_a_m_e _D_e_t_e_r_m_i_n_a_t_i_o_n.
       When the −−bb option is specified, for each patched file, the original
       shall be saved in a file of the same name with the suffix ..oorriigg
       appended to it.

       For each patched file, a reject file may also be created as noted in
       _P_a_t_c_h _A_p_p_l_i_c_a_t_i_o_n.  In the absence of a −−rr option, the name of this
       file shall be formed by appending the suffix ..rreejj to the original
       filename.

   PPaattcchh FFiillee FFoorrmmaatt
       The patch file shall contain zero or more lines of header information
       followed by one or more patches. Each patch shall contain zero or more
       lines of filename identification in the format produced by the −−cc, −−CC,
       −−uu, or −−UU options of the _d_i_f_f utility, and one or more sets of _d_i_f_f
       output, which are customarily called _h_u_n_k_s.

       The _p_a_t_c_h utility shall recognize the following expression in the
       header information:

       IInnddeexx::  _p_a_t_h_n_a_m_e
             The file to be patched is named _p_a_t_h_n_a_m_e.

       If all lines (including headers) within a patch begin with the same
       leading sequence of <blank> characters, the _p_a_t_c_h utility shall remove
       this sequence before proceeding. Within each patch, if the type of
       difference is common context, the _p_a_t_c_h utility shall recognize the
       following expressions:

       *** _f_i_l_e_n_a_m_e_ _t_i_m_e_s_t_a_m_p
             The patches arose from _f_i_l_e_n_a_m_e.

       −−− _f_i_l_e_n_a_m_e_ _t_i_m_e_s_t_a_m_p
             The patches should be applied to _f_i_l_e_n_a_m_e.

       If the type of difference is unified context, the _p_a_t_c_h utility shall
       recognize the following expressions:

       −−− _f_i_l_e_n_a_m_e_ _t_i_m_e_s_t_a_m_p
             The patches arose from _f_i_l_e_n_a_m_e.

       +++ _f_i_l_e_n_a_m_e_ _t_i_m_e_s_t_a_m_p
             The patches should be applied to _f_i_l_e_n_a_m_e.

       Each hunk within a patch shall be the _d_i_f_f output to change a line
       range within the original file. The line numbers for successive hunks
       within a patch shall occur in ascending order.

   FFiilleennaammee DDeetteerrmmiinnaattiioonn
       If no _f_i_l_e operand is specified, _p_a_t_c_h shall perform the following
       steps to determine the filename to use:

        1. If the type of _d_i_f_f is context, the _p_a_t_c_h utility shall delete
           pathname components (as specified by the −−pp option) from the
           filename on the line beginning with ""******"" (if copied context) or
           ""−−−−−−"" (if unified context), then test for the existence of this
           file relative to the current directory (or the directory specified
           with the −−dd option). If the file exists, the _p_a_t_c_h utility shall
           use this filename.

        2. If the type of _d_i_f_f is context, the _p_a_t_c_h utility shall delete the
           pathname components (as specified by the −−pp option) from the
           filename on the line beginning with ""−−−−−−"" (if copied context) or
           ""++++++"" (if unified context), then test for the existence of this
           file relative to the current directory (or the directory specified
           with the −−dd option). If the file exists, the _p_a_t_c_h utility shall
           use this filename.

        3. If the header information contains a line beginning with the string
           IInnddeexx::, the _p_a_t_c_h utility shall delete pathname components (as
           specified by the −−pp option) from this line, then test for the
           existence of this file relative to the current directory (or the
           directory specified with the −−dd option). If the file exists, the
           _p_a_t_c_h utility shall use this filename.

        4. If an SSCCCCSS directory exists in the current directory, _p_a_t_c_h shall
           attempt to perform a _g_e_t −−ee SSCCCCSS//ss.._f_i_l_e_n_a_m_e command to retrieve an
           editable version of the file. If the file exists, the _p_a_t_c_h utility
           shall use this filename.

        5. The _p_a_t_c_h utility shall write a prompt to standard output and
           request a filename interactively from the controlling terminal (for
           example, //ddeevv//ttttyy).

   PPaattcchh AApppplliiccaattiioonn
       If the −−cc, −−ee, −−nn, or −−uu option is present, the _p_a_t_c_h utility shall
       interpret information within each hunk as a copied context difference,
       an _e_d difference, a normal difference, or a unified context difference,
       respectively. In the absence of any of these options, the _p_a_t_c_h utility
       shall determine the type of difference based on the format of
       information within the hunk.

       For each hunk, the _p_a_t_c_h utility shall begin to search for the place to
       apply the patch at the line number at the beginning of the hunk, plus
       or minus any offset used in applying the previous hunk. If lines
       matching the hunk context are not found, _p_a_t_c_h shall scan both forwards
       and backwards at least 1000 bytes for a set of lines that match the
       hunk context.

       If no such place is found and it is a context difference, then another
       scan shall take place, ignoring the first and last line of context. If
       that fails, the first two and last two lines of context shall be
       ignored and another scan shall be made. Implementations may search more
       extensively for installation locations.

       If no location can be found, the _p_a_t_c_h utility shall append the hunk to
       the reject file. A rejected hunk that is a copied context difference,
       an _e_d difference, or a normal difference shall be written in copied-
       context-difference format regardless of the format of the patch file.
       It is implementation-defined whether a rejected hunk that is a unified
       context difference is written in copied-context-difference format or in
       unified-context-difference format.  If the input was a normal or
       _e_d-style difference, the reject file may contain differences with zero
       lines of context. The line numbers on the hunks in the reject file may
       be different from the line numbers in the patch file since they shall
       reflect the approximate locations for the failed hunks in the new file
       rather than the old one.

       If the type of patch is an _e_d diff, the implementation may accomplish
       the patching by invoking the _e_d utility.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

        1    One or more lines were written to a reject file.

       >1    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Patches that cannot be correctly placed in the file shall be written to
       a reject file.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The −−RR option does not work with _e_d scripts because there is too little
       information to reconstruct the reverse operation.

       The −−pp option makes it possible to customize a patch file to local user
       directory structures without manually editing the patch file. For
       example, if the filename in the patch file was:


           //ccuurrddss//wwhheeyy//ssrrcc//bblluurrffll//bblluurrffll..cc

       Setting −−pp  00 gives the entire pathname unmodified; −−pp  11 gives:


           ccuurrddss//wwhheeyy//ssrrcc//bblluurrffll//bblluurrffll..cc

       without the leading <slash>, −−pp  44 gives:


           bblluurrffll//bblluurrffll..cc

       and not specifying −−pp at all gives:


           bblluurrffll..cc ..

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Some of the functionality in historical _p_a_t_c_h implementations was not
       specified. The following documents those features present in historical
       implementations that have not been specified.

       A deleted piece of functionality was the ''++'' pseudo-option allowing an
       additional set of options and a patch file operand to be given. This
       was seen as being insufficiently useful to standardize.

       In historical implementations, if the string ""PPrreerreeqq::"" appeared in the
       header, the _p_a_t_c_h utility would search for the corresponding version
       information (the string specified in the header, delimited by <blank>
       characters or the beginning or end of a line or the file) anywhere in
       the original file. This was deleted as too simplistic and
       insufficiently trustworthy a mechanism to standardize. For example, if:


           PPrreerreeqq:: 11..22

       were in the header, the presence of a delimited 1.2 anywhere in the
       file would satisfy the prerequisite.

       The following options were dropped from historical implementations of
       _p_a_t_c_h as insufficiently useful to standardize:

       −−bb        The −−bb option historically provided a method for changing the
                 name extension of the backup file from the default ..oorriigg.
                 This option has been modified and retained in this volume of
                 POSIX.1‐2008.

       −−FF        The −−FF option specified the number of lines of a context diff
                 to ignore when searching for a place to install a patch.

       −−ff        The −−ff option historically caused _p_a_t_c_h not to request
                 additional information from the user.

       −−rr        The −−rr option historically provided a method of overriding
                 the extension of the reject file from the default ..rreejj.

       −−ss        The −−ss option historically caused _p_a_t_c_h to work silently
                 unless an error occurred.

       −−xx        The −−xx option historically set internal debugging flags.

       In some file system implementations, the saving of a ..oorriigg file may
       produce unwanted results. In the case of 12, 13, or 14-character
       filenames (on file systems supporting 14-character maximum filenames),
       the ..oorriigg file overwrites the new file. The reject file may also exceed
       this filename limit. It was suggested, due to some historical practice,
       that a <tilde> (''~~'') suffix be used instead of ..oorriigg and some other
       character instead of the ..rreejj suffix. This was rejected because it is
       not obvious to the user which file is which. The suffixes ..oorriigg and
       ..rreejj are clearer and more understandable.

       The −−bb option has the opposite sense in some historical
       implementations—do not save the ..oorriigg file. The default case here is
       not to save the files, making _p_a_t_c_h behave more consistently with the
       other standard utilities.

       The −−ww option in early proposals was changed to −−ll to match historical
       practice.

       The −−NN option was included because without it, a non-interactive
       application cannot reject previously applied patches. For example, if a
       user is piping the output of _d_i_f_f into the _p_a_t_c_h utility, and the user
       only wants to patch a file to a newer version non-interactively, the −−NN
       option is required.

       Changes to the −−ll option description were proposed to allow matching
       across <newline> characters in addition to just <blank> characters.
       Since this is not historical practice, and since some ambiguities could
       result, it is suggested that future developments in this area utilize
       another option letter, such as −−LL.

       The −−uu option of GNU _p_a_t_c_h has been added, along with support for
       unified context formats.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _d_i_f_f, _e_d

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



IEEE/The Open Group                  2013                            PATCH(1P)
