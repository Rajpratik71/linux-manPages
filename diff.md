DIFF(1P)                   POSIX Programmer's Manual                  DIFF(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       diff — compare two files

SSYYNNOOPPSSIISS
       diff [[−c|−e|−f|−u|−C _n|−U _n]] [[−br]] _f_i_l_e_1 _f_i_l_e_2

DDEESSCCRRIIPPTTIIOONN
       The _d_i_f_f utility shall compare the contents of _f_i_l_e_1 and _f_i_l_e_2 and
       write to standard output a list of changes necessary to convert _f_i_l_e_1
       into _f_i_l_e_2.  This list should be minimal. No output shall be produced
       if the files are identical.

OOPPTTIIOONNSS
       The _d_i_f_f utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−bb        Cause any amount of white space at the end of a line to be
                 treated as a single <newline> (that is, the white-space
                 characters preceding the <newline> are ignored) and other
                 strings of white-space characters, not including <newline>
                 characters, to compare equal.

       −−cc        Produce output in a form that provides three lines of copied
                 context.

       −−CC  _n      Produce output in a form that provides _n lines of copied
                 context (where _n shall be interpreted as a positive decimal
                 integer).

       −−ee        Produce output in a form suitable as input for the _e_d
                 utility, which can then be used to convert _f_i_l_e_1 into _f_i_l_e_2.

       −−ff        Produce output in an alternative form, similar in format to
                 −−ee, but not intended to be suitable as input for the _e_d
                 utility, and in the opposite order.

       −−rr        Apply _d_i_f_f recursively to files and directories of the same
                 name when _f_i_l_e_1 and _f_i_l_e_2 are both directories.

                 The _d_i_f_f utility shall detect infinite loops; that is,
                 entering a previously visited directory that is an ancestor
                 of the last file encountered.  When it detects an infinite
                 loop, _d_i_f_f shall write a diagnostic message to standard error
                 and shall either recover its position in the hierarchy or
                 terminate.

       −−uu        Produce output in a form that provides three lines of unified
                 context.

       −−UU  _n      Produce output in a form that provides _n lines of unified
                 context (where _n shall be interpreted as a non-negative
                 decimal integer).

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e_1, _f_i_l_e_2
                 A pathname of a file to be compared. If either the _f_i_l_e_1 or
                 _f_i_l_e_2 operand is ''−−'', the standard input shall be used in its
                 place.

       If both _f_i_l_e_1 and _f_i_l_e_2 are directories, _d_i_f_f shall not compare block
       special files, character special files, or FIFO special files to any
       files and shall not compare regular files to directories.  Further
       details are as specified in _D_i_f_f _D_i_r_e_c_t_o_r_y _C_o_m_p_a_r_i_s_o_n _F_o_r_m_a_t.  The
       behavior of _d_i_f_f on other file types is implementation-defined when
       found in directories.

       If only one of _f_i_l_e_1 and _f_i_l_e_2 is a directory, _d_i_f_f shall be applied to
       the non-directory file and the file contained in the directory file
       with a filename that is the same as the last component of the non-
       directory file.

SSTTDDIINN
       The standard input shall be used only if one of the _f_i_l_e_1 or _f_i_l_e_2
       operands references standard input. See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files may be of any type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _d_i_f_f:

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

       _L_C___T_I_M_E   Determine the locale for affecting the format of file
                 timestamps written with the −−CC and −−cc options.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone used for calculating file timestamps
                 written with a context format. If _T_Z is unset or null, an
                 unspecified default timezone shall be used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
   DDiiffff DDiirreeccttoorryy CCoommppaarriissoonn FFoorrmmaatt
       If both _f_i_l_e_1 and _f_i_l_e_2 are directories, the following output formats
       shall be used.

       In the POSIX locale, each file that is present in only one directory
       shall be reported using the following format:


           ""OOnnllyy iinn %%ss:: %%ss\\nn"",, <<_d_i_r_e_c_t_o_r_y _p_a_t_h_n_a_m_e>>,, <<_f_i_l_e_n_a_m_e>

       In the POSIX locale, subdirectories that are common to the two
       directories may be reported with the following format:


           ""CCoommmmoonn ssuubbddiirreeccttoorriieess:: %%ss aanndd %%ss\\nn"",, <<_d_i_r_e_c_t_o_r_y_1 _p_a_t_h_n_a_m_e>,
               <_d_i_r_e_c_t_o_r_y_2 _p_a_t_h_n_a_m_e>

       For each file common to the two directories, if the two files are not
       to be compared: if the two files have the same device ID and file
       serial number, or are both block special files that refer to the same
       device, or are both character special files that refer to the same
       device, in the POSIX locale the output format is unspecified.
       Otherwise, in the POSIX locale an unspecified format shall be used that
       contains the pathnames of the two files.

       For each file common to the two directories, if the files are compared
       and are identical, no output shall be written. If the two files differ,
       the following format is written:


           ""ddiiffff %%ss %%ss %%ss\\nn"",, <<_d_i_f_f___o_p_t_i_o_n_s>, <_f_i_l_e_n_a_m_e_1>, <_f_i_l_e_n_a_m_e_2>

       where <_d_i_f_f___o_p_t_i_o_n_s> are the options as specified on the command line.

       All directory pathnames listed in this section shall be relative to the
       original command line arguments. All other names of files listed in
       this section shall be filenames (pathname components).

   DDiiffff BBiinnaarryy OOuuttppuutt FFoorrmmaatt
       In the POSIX locale, if one or both of the files being compared are not
       text files, it is implementation-defined whether _d_i_f_f uses the binary
       file output format or the other formats as specified below. The binary
       file output format shall contain the pathnames of two files being
       compared and the string ""ddiiffffeerr"".

       If both files being compared are text files, depending on the options
       specified, one of the following formats shall be used to write the
       differences.

   DDiiffff DDeeffaauulltt OOuuttppuutt FFoorrmmaatt
       The default (without −−ee, −−ff, −−cc, −−CC, −−uu, or −−UU options) _d_i_f_f utility
       output shall contain lines of these forms:


           ""%%ddaa%%dd\\nn"",, <<_n_u_m_1>, <_n_u_m_2>

           "%da%d,%d\n", <_n_u_m_1>, <_n_u_m_2>, <_n_u_m_3>

           "%dd%d\n", <_n_u_m_1>, <_n_u_m_2>

           "%d,%dd%d\n", <_n_u_m_1>, <_n_u_m_2>, <_n_u_m_3>

           "%dc%d\n", <_n_u_m_1>, <_n_u_m_2>

           "%d,%dc%d\n", <_n_u_m_1>, <_n_u_m_2>, <_n_u_m_3>

           "%dc%d,%d\n", <_n_u_m_1>, <_n_u_m_2>, <_n_u_m_3>

           "%d,%dc%d,%d\n", <_n_u_m_1>, <_n_u_m_2>, <_n_u_m_3>, <_n_u_m_4>

       These lines resemble _e_d subcommands to convert _f_i_l_e_1 into _f_i_l_e_2.  The
       line numbers before the action letters shall pertain to _f_i_l_e_1; those
       after shall pertain to _f_i_l_e_2.  Thus, by exchanging _a for _d and reading
       the line in reverse order, one can also determine how to convert _f_i_l_e_2
       into _f_i_l_e_1.  As in _e_d, identical pairs (where _n_u_m_1= _n_u_m_2) are
       abbreviated as a single number.

       Following each of these lines, _d_i_f_f shall write to standard output all
       lines affected in the first file using the format:


           ""<< %%ss"",, <<_l_i_n_e>

       and all lines affected in the second file using the format:


           "">> %%ss"",, <<_l_i_n_e>

       If there are lines affected in both _f_i_l_e_1 and _f_i_l_e_2 (as with the cc
       subcommand), the changes are separated with a line consisting of three
       <hyphen> characters:


           ""−−−−−−\\nn""

   DDiiffff −−ee OOuuttppuutt FFoorrmmaatt
       With the −−ee option, a script shall be produced that shall, when
       provided as input to _e_d, along with an appended ww (write) command,
       convert _f_i_l_e_1 into _f_i_l_e_2.  Only the aa (append), cc (change), dd (delete),
       ii (insert), and ss (substitute) commands of _e_d shall be used in this
       script. Text lines, except those consisting of the single character
       <period> (''..''), shall be output as they appear in the file.

   DDiiffff −−ff OOuuttppuutt FFoorrmmaatt
       With the −−ff option, an alternative format of script shall be produced.
       It is similar to that produced by −−ee, with the following differences:

        1. It is expressed in reverse sequence; the output of −−ee orders
           changes from the end of the file to the beginning; the −−ff from
           beginning to end.

        2. The command form <_l_i_n_e_s> <_c_o_m_m_a_n_d_-_l_e_t_t_e_r> used by −−ee is reversed.
           For example, 10_c with −−ee would be _c10 with −−ff.

        3. The form used for ranges of line numbers is <space>-separated,
           rather than <comma>-separated.

   DDiiffff −−cc oorr −−CC OOuuttppuutt FFoorrmmaatt
       With the −−cc or −−CC option, the output format shall consist of affected
       lines along with surrounding lines of context. The affected lines shall
       show which ones need to be deleted or changed in _f_i_l_e_1, and those added
       from _f_i_l_e_2.  With the −−cc option, three lines of context, if available,
       shall be written before and after the affected lines. With the −−CC
       option, the user can specify how many lines of context are written.
       The exact format follows.

       The name and last modification time of each file shall be output in the
       following format:


           ""****** %%ss %%ss\\nn"",, _f_i_l_e_1, <_f_i_l_e_1 _t_i_m_e_s_t_a_m_p>
           "−−− %s %s\n", _f_i_l_e_2, <_f_i_l_e_2 _t_i_m_e_s_t_a_m_p>

       Each <_f_i_l_e> field shall be the pathname of the corresponding file being
       compared. The pathname written for standard input is unspecified.

       In the POSIX locale, each <_t_i_m_e_s_t_a_m_p> field shall be equivalent to the
       output from the following command:


           ddaattee ""++%%aa %%bb %%ee %%TT %%YY""

       without the trailing <newline>, executed at the time of last
       modification of the corresponding file (or the current time, if the
       file is standard input).

       Then, the following output formats shall be applied for every set of
       changes.

       First, a line shall be written in the following format:


           ""******************************\\nn""

       Next, the range of lines in _f_i_l_e_1 shall be written in the following
       format if the range contains two or more lines:


           ""****** %%dd,,%%dd ********\\nn"",, <<_b_e_g_i_n_n_i_n_g _l_i_n_e _n_u_m_b_e_r>, <_e_n_d_i_n_g _l_i_n_e _n_u_m_b_e_r>

       and the following format otherwise:


           ""****** %%dd ********\\nn"",, <<_e_n_d_i_n_g _l_i_n_e _n_u_m_b_e_r>

       The ending line number of an empty range shall be the number of the
       preceding line, or 0 if the range is at the start of the file.

       Next, the affected lines along with lines of context (unaffected lines)
       shall be written. Unaffected lines shall be written in the following
       format:


           ""  %%ss"",, <<_u_n_a_f_f_e_c_t_e_d___l_i_n_e>

       Deleted lines shall be written as:


           ""−− %%ss"",, <<_d_e_l_e_t_e_d___l_i_n_e>

       Changed lines shall be written as:


           ""!! %%ss"",, <<_c_h_a_n_g_e_d___l_i_n_e>

       Next, the range of lines in _f_i_l_e_2 shall be written in the following
       format if the range contains two or more lines:


           ""−−−−−− %%dd,,%%dd −−−−−−−−\\nn"",, <<_b_e_g_i_n_n_i_n_g _l_i_n_e _n_u_m_b_e_r>, <_e_n_d_i_n_g _l_i_n_e _n_u_m_b_e_r>

       and the following format otherwise:


           ""−−−−−− %%dd −−−−−−−−\\nn"",, <<_e_n_d_i_n_g _l_i_n_e _n_u_m_b_e_r>

       Then, lines of context and changed lines shall be written as described
       in the previous formats. Lines added from _f_i_l_e_2 shall be written in the
       following format:


           ""++ %%ss"",, <<_a_d_d_e_d___l_i_n_e>

   DDiiffff −−uu oorr −−UU OOuuttppuutt FFoorrmmaatt
       The −−uu or −−UU options behave like the −−cc or −−CC options, except that the
       context lines are not repeated; instead, the context, deleted, and
       added lines are shown together, interleaved.  The exact format follows.

       The name and last modification time of each file shall be output in the
       following format:


           ""------ %%ss%%ss%%ss %%ss00,, ffiillee11,, <<ffiillee11 ttiimmeessttaammpp>>,, <<ffiillee11 ffrraacc>>,, <<ffiillee11 zzoonnee>>
           ""++++++ %%ss%%ss%%ss %%ss00,, ffiillee22,, <<ffiillee22 ttiimmeessttaammpp>>,, <<ffiillee22 ffrraacc>>,, <<ffiillee22 zzoonnee>>

       Each <_f_i_l_e> field shall be the pathname of the corresponding file being
       compared, or the single character ''−−'' if standard input is being
       compared. However, if the pathname contains a <tab> or a <newline>, or
       if it does not consist entirely of characters taken from the portable
       character set, the behavior is implementation-defined.

       Each <_t_i_m_e_s_t_a_m_p> field shall be equivalent to the output from the
       following command:


           ddaattee ''++%%YY--%%mm--%%dd %%HH::%%MM::%%SS''

       without the trailing <newline>, executed at the time of last
       modification of the corresponding file (or the current time, if the
       file is standard input).

       Each <_f_r_a_c> field shall be either empty, or a decimal point followed by
       at least one decimal digit, indicating the fractional-seconds part (if
       any) of the file timestamp. The number of fractional digits shall be at
       least the number needed to represent the file's timestamp without loss
       of information.

       Each <_z_o_n_e> field shall be of the form ""sshhhhmmmm"", where ""sshhhh"" is a signed
       two-digit decimal number in the range −24 through +25, and ""mmmm"" is an
       unsigned two-digit decimal number in the range 00 through 59.  It
       represents the timezone of the timestamp as the number of hours (hh)
       and minutes (mm) east (+) or west (−) of UTC for the timestamp.  If the
       hours and minutes are both zero, the sign shall be ''++''.  However, if
       the timezone is not an integral number of minutes away from UTC, the
       <_z_o_n_e> field is implementation-defined.

       Then, the following output formats shall be applied for every set of
       changes.

       First, the range of lines in each file shall be written in the
       following format:


           ""@@@@ --%%ss ++%%ss @@@@"",, <<ffiillee11 rraannggee>>,, <<ffiillee22 rraannggee>>

       Each <_r_a_n_g_e> field shall be of the form:


           ""%%11dd"",, <<bbeeggiinnnniinngg lliinnee nnuummbbeerr>>

       if the range contains exactly one line, and:


           ""%%11dd,,%%11dd"",, <<bbeeggiinnnniinngg lliinnee nnuummbbeerr>>,, <<nnuummbbeerr ooff lliinneess>>

       otherwise. If a range is empty, its beginning line number shall be the
       number of the line just before the range, or 0 if the empty range
       starts the file.

       Next, the affected lines along with lines of context shall be written.
       Each non-empty unaffected line shall be written in the following
       format:


           "" %%ss"",, <<uunnaaffffeecctteedd__lliinnee>>

       where the contents of the unaffected line shall be taken from _f_i_l_e_1.
       It is implementation-defined whether an empty unaffected line is
       written as an empty line or a line containing a single <space>
       character. This line also represents the same line of _f_i_l_e_2, even
       though _f_i_l_e_2's line may contain different contents due to the −−bb.
       Deleted lines shall be written as:


           ""--%%ss"",, <<ddeelleetteedd__lliinnee>>

       Added lines shall be written as:


           ""++%%ss"",, <<aaddddeedd__lliinnee>>

       The order of lines written shall be the same as that of the
       corresponding file. A deleted line shall never be written immediately
       after an added line.

       If −−UU _n is specified, the output shall contain no more than _n
       consecutive unaffected lines; and if the output contains an affected
       line and this line is adjacent to up to _n consecutive unaffected lines
       in the corresponding file, the output shall contain these unaffected
       lines.  −−uu shall act like −−UU3.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    No differences were found.

        1    Differences were found.

       >1    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       If lines at the end of a file are changed and other lines are added,
       _d_i_f_f output may show this as a delete and add, as a change, or as a
       change and add; _d_i_f_f is not expected to know which happened and users
       should not care about the difference in output as long as it clearly
       shows the differences between the files.

EEXXAAMMPPLLEESS
       If ddiirr11 is a directory containing a directory named xx, ddiirr22 is a
       directory containing a directory named xx, ddiirr11//xx and ddiirr22//xx both
       contain files named ddaattee..oouutt, and ddiirr22//xx contains a file named yy, the
       command:


           ddiiffff −−rr ddiirr11 ddiirr22

       could produce output similar to:


           CCoommmmoonn ssuubbddiirreeccttoorriieess:: ddiirr11//xx aanndd ddiirr22//xx
           OOnnllyy iinn ddiirr22//xx:: yy
           ddiiffff −−rr ddiirr11//xx//ddaattee..oouutt ddiirr22//xx//ddaattee..oouutt
           11cc11
           << MMoonn JJuull  22 1133::1122::1166 PPDDTT 11999900
           −−−−−−
           >> TTuuee JJuunn 1199 2211::4411::3399 PPDDTT 11999900

RRAATTIIOONNAALLEE
       The −−hh option was omitted because it was insufficiently specified and
       does not add to applications portability.

       Historical implementations employ algorithms that do not always produce
       a minimum list of differences; the current language about making every
       effort is the best this volume of POSIX.1‐2008 can do, as there is no
       metric that could be employed to judge the quality of implementations
       against any and all file contents. The statement ``This list should be
       minimal'' clearly implies that implementations are not expected to
       provide the following output when comparing two 100-line files that
       differ in only one character on a single line:


           11,,110000cc11,,110000
           aallll 110000 lliinneess ffrroomm ffiillee11 pprreecceeddeedd wwiitthh ""<< ""
           −−−−−−
           aallll 110000 lliinneess ffrroomm ffiillee22 pprreecceeddeedd wwiitthh "">> ""

       The ``Only in'' messages required when the −−rr option is specified are
       not used by most historical implementations if the −−ee option is also
       specified. It is required here because it provides useful information
       that must be provided to update a target directory hierarchy to match a
       source hierarchy. The ``Common subdirectories'' messages are written by
       System V and 4.3 BSD when the −−rr option is specified. They are allowed
       here but are not required because they are reporting on something that
       is the same, not reporting a difference, and are not needed to update a
       target hierarchy.

       The −−cc option, which writes output in a format using lines of context,
       has been included. The format is useful for a variety of reasons, among
       them being much improved readability and the ability to understand
       difference changes when the target file has line numbers that differ
       from another similar, but slightly different, copy. The _p_a_t_c_h utility
       is most valuable when working with difference listings using a context
       format. The BSD version of −−cc takes an optional argument specifying the
       amount of context. Rather than overloading −−cc and breaking the Utility
       Syntax Guidelines for _d_i_f_f, the standard developers decided to add a
       separate option for specifying a context diff with a specified amount
       of context (−−CC).  Also, the format for context _d_i_f_fs was extended
       slightly in 4.3 BSD to allow multiple changes that are within context
       lines from each other to be merged together. The output format contains
       an additional four <asterisk> characters after the range of affected
       lines in the first filename. This was to provide a flag for old
       programs (like old versions of _p_a_t_c_h) that only understand the old
       context format. The version of context described here does not require
       that multiple changes within context lines be merged, but it does not
       prohibit it either. The extension is upwards-compatible, so any vendors
       that wish to retain the old version of _d_i_f_f can do so by adding the
       extra four <asterisk> characters (that is, utilities that currently use
       _d_i_f_f and understand the new merged format will also understand the old
       unmerged format, but not _v_i_c_e _v_e_r_s_a).

       The −−uu and −−UU options of GNU _d_i_f_f have been included. Their output
       format, designed by Wayne Davison, takes up less space than −−cc and −−CC
       format, and in many cases is easier to read. The format's timestamps do
       not vary by locale, so _L_C___T_I_M_E does not affect it. The format's line
       numbers are rendered with the %%11dd format, not %%dd, because the file
       format notation rules would allow extra <blank> characters to appear
       around the numbers.

       The substitute command was added as an additional format for the −−ee
       option. This was added to provide implementations with a way to fix the
       classic ``dot alone on a line'' bug present in many versions of _d_i_f_f.
       Since many implementations have fixed this bug, the standard developers
       decided not to standardize broken behavior, but rather to provide the
       necessary tool for fixing the bug. One way to fix this bug is to output
       two periods whenever a lone period is needed, then terminate the append
       command with a period, and then use the substitute command to convert
       the two periods into one period.

       The BSD-derived −−rr option was added to provide a mechanism for using
       _d_i_f_f to compare two file system trees. This behavior is useful, is
       standard practice on all BSD-derived systems, and is not easily
       reproducible with the _f_i_n_d utility.

       The requirement that _d_i_f_f not compare files in some circumstances, even
       though they have the same name, is based on the actual output of
       historical implementations.  The specified behavior precludes the
       problems arising from running into FIFOs and other files that would
       cause _d_i_f_f to hang waiting for input with no indication to the user
       that _d_i_f_f was hung. An earlier version of this standard specified the
       output format more precisely, but in practice this requirement was
       widely ignored and the benefit of standardization seemed small, so it
       is now unspecified. In most common usage, _d_i_f_f −−rr should indicate
       differences in the file hierarchies, not the difference of contents of
       devices pointed to by the hierarchies.

       Many early implementations of _d_i_f_f require seekable files. Since the
       System Interfaces volume of POSIX.1‐2008 supports named pipes, the
       standard developers decided that such a restriction was unreasonable.
       Note also that the allowed filename −− almost always refers to a pipe.

       No directory search order is specified for _d_i_f_f.  The historical
       ordering is, in fact, not optimal, in that it prints out all of the
       differences at the current level, including the statements about all
       common subdirectories before recursing into those subdirectories.

       The message:


           ""ddiiffff %%ss %%ss %%ss\\nn"",, <<_d_i_f_f___o_p_t_i_o_n_s>>,, <<_f_i_l_e_n_a_m_e_1>>,, <<_f_i_l_e_n_a_m_e_2>>

       does not vary by locale because it is the representation of a command,
       not an English sentence.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_m_p, _c_o_m_m, _e_d, _f_i_n_d

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



IEEE/The Open Group                  2013                             DIFF(1P)
