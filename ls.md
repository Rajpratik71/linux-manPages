LS(1P)                     POSIX Programmer's Manual                    LS(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       ls — list directory contents

SSYYNNOOPPSSIISS
       ls [[−ikqrs]] [[−glno]] [[−A|−a]] [[−C|−m|−x|−1]] \
           [[−F|−p]] [[−H|−L]] [[−R|−d]] [[−S|−f|−t]] [[−c|−u]] [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       For each operand that names a file of a type other than directory or
       symbolic link to a directory, _l_s shall write the name of the file as
       well as any requested, associated information. For each operand that
       names a file of type directory, _l_s shall write the names of files
       contained within the directory as well as any requested, associated
       information. Filenames beginning with a <period> (''..'') and any
       associated information shall not be written out unless explicitly
       referenced, the −−AA or −−aa option is supplied, or an implementation-
       defined condition causes them to be written. If one or more of the −−dd,
       −−FF, or −−ll options are specified, and neither the −−HH nor the −−LL option
       is specified, for each operand that names a file of type symbolic link
       to a directory, _l_s shall write the name of the file as well as any
       requested, associated information. If none of the −−dd, −−FF, or −−ll options
       are specified, or the −−HH or −−LL options are specified, for each operand
       that names a file of type symbolic link to a directory, _l_s shall write
       the names of files contained within the directory as well as any
       requested, associated information. In each case where the names of
       files contained within a directory are written, if the directory
       contains any symbolic links then _l_s shall evaluate the file information
       and file type to be those of the symbolic link itself, unless the −−LL
       option is specified.

       If no operands are specified, _l_s shall behave as if a single operand of
       dot (''..'') had been specified. If more than one operand is specified, _l_s
       shall write non-directory operands first; it shall sort directory and
       non-directory operands separately according to the collating sequence
       in the current locale.

       The _l_s utility shall detect infinite loops; that is, entering a
       previously visited directory that is an ancestor of the last file
       encountered.  When it detects an infinite loop, _l_s shall write a
       diagnostic message to standard error and shall either recover its
       position in the hierarchy or terminate.

OOPPTTIIOONNSS
       The _l_s utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−AA        Write out all directory entries, including those whose names
                 begin with a <period> (''..'') but excluding the entries dot and
                 dot-dot (if they exist).

       −−CC        Write multi-text-column output with entries sorted down the
                 columns, according to the collating sequence. The number of
                 text columns and the column separator characters are
                 unspecified, but should be adapted to the nature of the
                 output device. This option disables long format output.

       −−FF        Do not follow symbolic links named as operands unless the −−HH
                 or −−LL options are specified. Write a <slash> (''//'')
                 immediately after each pathname that is a directory, an
                 <asterisk> (''**'') after each that is executable, a <vertical-
                 line> (''||'') after each that is a FIFO, and an at-sign (''@@'')
                 after each that is a symbolic link. For other file types,
                 other symbols may be written.

       −−HH        Evaluate the file information and file type for symbolic
                 links specified on the command line to be those of the file
                 referenced by the link, and not the link itself; however, _l_s
                 shall write the name of the link itself and not the file
                 referenced by the link.

       −−LL        Evaluate the file information and file type for all symbolic
                 links (whether named on the command line or encountered in a
                 file hierarchy) to be those of the file referenced by the
                 link, and not the link itself; however, _l_s shall write the
                 name of the link itself and not the file referenced by the
                 link. When −−LL is used with −−ll, write the contents of symbolic
                 links in the long format (see the STDOUT section).

       −−RR        Recursively list subdirectories encountered. When a symbolic
                 link to a directory is encountered, the directory shall not
                 be recursively listed unless the −−LL option is specified.  The
                 use of −−RR with −−dd or −−ff produces unspecified results.

       −−SS        Sort with the primary key being file size (in decreasing
                 order) and the secondary key being filename in the collating
                 sequence (in increasing order).

       −−aa        Write out all directory entries, including those whose names
                 begin with a <period> (''..'').

       −−cc        Use time of last modification of the file status information
                 (see the Base Definitions volume of POSIX.1‐2008,
                 <<ssyyss__ssttaatt..hh>>) instead of last modification of the file itself
                 for sorting (−−tt) or writing (−−ll).

       −−dd        Do not follow symbolic links named as operands unless the −−HH
                 or −−LL options are specified. Do not treat directories
                 differently than other types of files. The use of −−dd with −−RR
                 or −−ff produces unspecified results.

       −−ff        List the entries in directory operands in the order they
                 appear in the directory. The behavior for non-directory
                 operands is unspecified. This option shall turn on −−aa.  When
                 −−ff is specified, any occurrences of the −−rr, −−SS, and −−tt
                 options shall be ignored and any occurrences of the −−AA, −−gg,
                 −−ll, −−nn, −−oo, and −−ss options may be ignored. The use of −−ff with
                 −−RR or −−dd produces unspecified results.

       −−gg        Turn on the −−ll (ell) option, but disable writing the file's
                 owner name or number.  Disable the −−CC, −−mm, and −−xx options.

       −−ii        For each file, write the file's file serial number (see
                 _s_t_a_t() in the System Interfaces volume of POSIX.1‐2008).

       −−kk        Set the block size for the −−ss option and the per-directory
                 block count written for the −−ll, −−nn, −−ss, −−gg, and −−oo options
                 (see the STDOUT section) to 1024 bytes.

       −−ll        (The letter ell.) Do not follow symbolic links named as
                 operands unless the −−HH or −−LL options are specified. Write out
                 in long format (see the STDOUT section). Disable the −−CC, −−mm,
                 and −−xx options.

       −−mm        Stream output format; list pathnames across the page,
                 separated by a <comma> character followed by a <space>
                 character. Use a <newline> character as the list terminator
                 and after the separator sequence when there is not room on a
                 line for the next list entry. This option disables long
                 format output.

       −−nn        Turn on the −−ll (ell) option, but when writing the file's
                 owner or group, write the file's numeric UID or GID rather
                 than the user or group name, respectively. Disable the −−CC,
                 −−mm, and −−xx options.

       −−oo        Turn on the −−ll (ell) option, but disable writing the file's
                 group name or number.  Disable the −−CC, −−mm, and −−xx options.

       −−pp        Write a <slash> (''//'') after each filename if that file is a
                 directory.

       −−qq        Force each instance of non-printable filename characters and
                 <tab> characters to be written as the <question-mark> (''??'')
                 character. Implementations may provide this option by default
                 if the output is to a terminal device.

       −−rr        Reverse the order of the sort to get reverse collating
                 sequence oldest first, or smallest file size first depending
                 on the other options given.

       −−ss        Indicate the total number of file system blocks consumed by
                 each file displayed. If the −−kk option is also specified, the
                 block size shall be 1024 bytes; otherwise, the block size is
                 implementation-defined.

       −−tt        Sort with the primary key being time modified (most recently
                 modified first) and the secondary key being filename in the
                 collating sequence.  For a symbolic link, the time used as
                 the sort key is that of the symbolic link itself, unless _l_s
                 is evaluating its file information to be that of the file
                 referenced by the link (see the −−HH and −−LL options).

       −−uu        Use time of last access (see the Base Definitions volume of
                 POSIX.1‐2008, <<ssyyss__ssttaatt..hh>>) instead of last modification of
                 the file for sorting (−−tt) or writing (−−ll).

       −−xx        The same as −−CC, except that the multi-text-column output is
                 produced with entries sorted across, rather than down, the
                 columns. This option disables long format output.

       −−11        (The numeric digit one.) Force output to be one entry per
                 line.  This option does not disable long format output. (Long
                 format output is enabled by −−gg, −−ll (ell), −−nn, and −−oo; and
                 disabled by −−CC, −−mm, and −−xx.)

       If an option that enables long format output (−−gg, −−ll (ell), −−nn, and −−oo
       is given with an option that disables long format output (−−CC, −−mm, and
       −−xx), this shall not be considered an error. The last of these options
       specified shall determine whether long format output is written.

       If −−RR, −−dd, or −−ff are specified, the results of specifying these
       mutually-exclusive options are specified by the descriptions of these
       options above. If more than one of any of the other options shown in
       the SYNOPSIS section in mutually-exclusive sets are given, this shall
       not be considered an error; the last option specified in each set shall
       determine the output.

       Note that if −−tt is specified, −−cc and −−uu are not only mutually-exclusive
       with each other, they are also mutually-exclusive with −−SS when
       determining sort order. But even if −−SS is specified after all
       occurrences of −−cc, −−tt, and −−uu, the last use of −−cc or −−uu determines the
       timestamp printed when producing long format output.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a file to be written. If the file specified is
                 not found, a diagnostic message shall be output on standard
                 error.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _l_s:

       _C_O_L_U_M_N_S   Determine the user's preferred column position width for
                 writing multiple text-column output. If this variable
                 contains a string representing a decimal integer, the _l_s
                 utility shall calculate how many pathname text columns to
                 write (see −−CC) based on the width provided. If _C_O_L_U_M_N_S is not
                 set or invalid, an implementation-defined number of column
                 positions shall be assumed, based on the implementation's
                 knowledge of the output device. The column width chosen to
                 write the names of files in any given directory shall be
                 constant. Filenames shall not be truncated to fit into the
                 multiple text-column output.

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for character collation information in
                 determining the pathname collation sequence.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments) and which
                 characters are defined as printable (character class pprriinntt).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _L_C___T_I_M_E   Determine the format and contents for date and time strings
                 written by _l_s.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone for date and time strings written by
                 _l_s.  If _T_Z is unset or null, an unspecified default timezone
                 shall be used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The default format shall be to list one entry per line to standard
       output; the exceptions are to terminals or when one of the −−CC, −−mm, or
       −−xx options is specified. If the output is to a terminal, the format is
       implementation-defined.

       When −−mm is specified, the format used for the last element of the list
       shall be:


           ""%%ss\\nn"",, <<_f_i_l_e_n_a_m_e>

       The format used for each other element of the list shall be:


           ""%%ss,,%%ss"",, <<_f_i_l_e_n_a_m_e>, <_s_e_p_a_r_a_t_o_r>

       where, if there is not room for the next element of the list to fit
       within the current line length, <_s_e_p_a_r_a_t_o_r> is a string containing an
       optional <space> character and a mandatory <newline> character;
       otherwise it is a single <space> character.

       If the −−ii option is specified, the file's file serial number (see the
       Base Definitions volume of POSIX.1‐2008, <<ssyyss__ssttaatt..hh>>) shall be written
       in the following format before any other output for the corresponding
       entry:


           %%uu "",, <<_f_i_l_e _s_e_r_i_a_l _n_u_m_b_e_r>

       If the −−ll option is specified, the following information shall be
       written for files other than character special and block special files:


           ""%%ss %%uu %%ss %%ss %%uu %%ss %%ss\\nn"",, <<_f_i_l_e _m_o_d_e>, <_n_u_m_b_e_r _o_f _l_i_n_k_s>,
               <_o_w_n_e_r _n_a_m_e>, <_g_r_o_u_p _n_a_m_e>, <_s_i_z_e>, <_d_a_t_e _a_n_d _t_i_m_e>,
               <_p_a_t_h_n_a_m_e>

       If the −−ll option is specified, the following information shall be
       written for character special and block special files:


           ""%%ss %%uu %%ss %%ss %%ss %%ss %%ss\\nn"",, <<_f_i_l_e _m_o_d_e>, <_n_u_m_b_e_r _o_f _l_i_n_k_s>,
               <_o_w_n_e_r _n_a_m_e>, <_g_r_o_u_p _n_a_m_e>, <_d_e_v_i_c_e _i_n_f_o>, <_d_a_t_e _a_n_d _t_i_m_e>,
               <_p_a_t_h_n_a_m_e>

       In both cases if the file is a symbolic link and the −−LL option is also
       specified, this information shall be for the file resolved from the
       symbolic link, except that the <_p_a_t_h_n_a_m_e> field shall contain the
       pathname of the symbolic link itself. If the file is a symbolic link
       and the −−LL option is not specified, this information shall be about the
       link itself and the <_p_a_t_h_n_a_m_e> field shall be of the form:


           ""%%ss −−>> %%ss"",, <<_p_a_t_h_n_a_m_e _o_f _l_i_n_k>, <_c_o_n_t_e_n_t_s _o_f _l_i_n_k>

       The −−nn, −−gg, and −−oo options use the same format as −−ll, but with omitted
       items and their associated <blank> characters. See the OPTIONS section.

       In both the preceding −−ll forms, if <_o_w_n_e_r _n_a_m_e> or <_g_r_o_u_p _n_a_m_e> cannot
       be determined, or if −−nn is given, they shall be replaced with their
       associated numeric values using the format %%uu.

       The <_s_i_z_e> field shall contain the value that would be returned for the
       file in the _s_t___s_i_z_e field of ssttrruucctt ssttaatt (see the Base Definitions
       volume of POSIX.1‐2008, <<ssyyss__ssttaatt..hh>>).  Note that for some file types
       this value is unspecified.

       The <_d_e_v_i_c_e_ _i_n_f_o> field shall contain implementation-defined
       information associated with the device in question.

       The <_d_a_t_e_ _a_n_d_ _t_i_m_e> field shall contain the appropriate date and
       timestamp of when the file was last modified. In the POSIX locale, the
       field shall be the equivalent of the output of the following _d_a_t_e
       command:


           ddaattee ""++%%bb %%ee %%HH::%%MM""

       if the file has been modified in the last six months, or:


           ddaattee ""++%%bb %%ee %%YY""

       (where two <space> characters are used between %%ee and %%YY) if the file
       has not been modified in the last six months or if the modification
       date is in the future, except that, in both cases, the final <newline>
       produced by _d_a_t_e shall not be included and the output shall be as if
       the _d_a_t_e command were executed at the time of the last modification
       date of the file rather than the current time. When the _L_C___T_I_M_E locale
       category is not set to the POSIX locale, a different format and order
       of presentation of this field may be used.

       If the pathname was specified as a _f_i_l_e operand, it shall be written as
       specified.

       The file mode written under the −−ll, −−nn, −−gg, and −−oo options shall
       consist of the following format:


           ""%%cc%%ss%%ss%%ss%%ss"",, <<_e_n_t_r_y _t_y_p_e>, <_o_w_n_e_r _p_e_r_m_i_s_s_i_o_n_s>,
               <_g_r_o_u_p _p_e_r_m_i_s_s_i_o_n_s>, <_o_t_h_e_r _p_e_r_m_i_s_s_i_o_n_s>,
               <_o_p_t_i_o_n_a_l _a_l_t_e_r_n_a_t_e _a_c_c_e_s_s _m_e_t_h_o_d _f_l_a_g>

       The <_o_p_t_i_o_n_a_l_ _a_l_t_e_r_n_a_t_e_ _a_c_c_e_s_s_ _m_e_t_h_o_d_ _f_l_a_g> shall be the empty string
       if there is no alternate or additional access control method associated
       with the file; otherwise, it shall be a string containing a single
       printable character that is not a <blank>.

       The <_e_n_t_r_y_ _t_y_p_e> character shall describe the type of file, as follows:

       d       Directory.

       b       Block special file.

       c       Character special file.

       l (ell) Symbolic link.

       p       FIFO.

       −       Regular file.

       Implementations may add other characters to this list to represent
       other implementation-defined file types.

       The next three fields shall be three characters each:

       <_o_w_n_e_r _p_e_r_m_i_s_s_i_o_n_s>
             Permissions for the file owner class (see the Base Definitions
             volume of POSIX.1‐2008, _S_e_c_t_i_o_n _4_._4, _F_i_l_e _A_c_c_e_s_s _P_e_r_m_i_s_s_i_o_n_s).

       <_g_r_o_u_p _p_e_r_m_i_s_s_i_o_n_s>
             Permissions for the file group class.

       <_o_t_h_e_r _p_e_r_m_i_s_s_i_o_n_s>
             Permissions for the file other class.

       Each field shall have three character positions:

        1. If ''rr'', the file is readable; if ''−−'', the file is not readable.

        2. If ''ww'', the file is writable; if ''−−'', the file is not writable.

        3. The first of the following that applies:

           S     If in <_o_w_n_e_r_ _p_e_r_m_i_s_s_i_o_n_s>, the file is not executable and
                 set-user-ID mode is set. If in <_g_r_o_u_p_ _p_e_r_m_i_s_s_i_o_n_s>, the file
                 is not executable and set-group-ID mode is set.

           s     If in <_o_w_n_e_r_ _p_e_r_m_i_s_s_i_o_n_s>, the file is executable and set-
                 user-ID mode is set. If in <_g_r_o_u_p_ _p_e_r_m_i_s_s_i_o_n_s>, the file is
                 executable and set-group-ID mode is set.

           T     If in <_o_t_h_e_r_ _p_e_r_m_i_s_s_i_o_n_s> and the file is a directory, search
                 permission is not granted to others, and the restricted
                 deletion flag is set.

           t     If in <_o_t_h_e_r_ _p_e_r_m_i_s_s_i_o_n_s> and the file is a directory, search
                 permission is granted to others, and the restricted deletion
                 flag is set.

           x     The file is executable or the directory is searchable.

           −     None of the attributes of ''SS'', ''ss'', ''TT'', ''tt'', or ''xx'' applies.

           Implementations may add other characters to this list for the third
           character position. Such additions shall, however, be written in
           lowercase if the file is executable or searchable, and in uppercase
           if it is not.

       If any of the −−ll, −−nn, −−ss, −−gg, or −−oo options is specified, each list of
       files within the directory shall be preceded by a status line
       indicating the number of file system blocks occupied by files in the
       directory in 512-byte units if the −−kk option is not specified, or
       1024-byte units if the −−kk option is specified, rounded up to the next
       integral number of units, if necessary. In the POSIX locale, the format
       shall be:


           ""ttoottaall %%uu\\nn"",, <<_n_u_m_b_e_r _o_f _u_n_i_t_s _i_n _t_h_e _d_i_r_e_c_t_o_r_y>

       If more than one directory, or a combination of non-directory files and
       directories are written, either as a result of specifying multiple
       operands, or the −−RR option, each list of files within a directory shall
       be preceded by:


           ""\\nn%%ss::\\nn"",, <<_d_i_r_e_c_t_o_r_y _n_a_m_e>

       If this string is the first thing to be written, the first <newline>
       shall not be written. This output shall precede the number of units in
       the directory.

       If the −−ss option is given, each file shall be written with the number
       of blocks used by the file. Along with −−CC, −−11, −−mm, or −−xx, the number
       and a <space> shall precede the filename; with −−ll, −−nn, −−gg, or −−oo, they
       shall precede each line describing a file.

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
       Many implementations use the <equals-sign> (''=='') to denote sockets
       bound to the file system for the −−FF option. Similarly, many historical
       implementations use the ''ss'' character to denote sockets as the entry
       type characters for the −−ll option.

       It is difficult for an application to use every part of the file modes
       field of _l_s −−ll in a portable manner. Certain file types and executable
       bits are not guaranteed to be exactly as shown, as implementations may
       have extensions. Applications can use this field to pass directly to a
       user printout or prompt, but actions based on its contents should
       generally be deferred, instead, to the _t_e_s_t utility.

       The output of _l_s (with the −−ll and related options) contains information
       that logically could be used by utilities such as _c_h_m_o_d and _t_o_u_c_h to
       restore files to a known state. However, this information is presented
       in a format that cannot be used directly by those utilities or be
       easily translated into a format that can be used. A character has been
       added to the end of the permissions string so that applications at
       least have an indication that they may be working in an area they do
       not understand instead of assuming that they can translate the
       permissions string into something that can be used. Future versions or
       related documents may define one or more specific characters to be used
       based on different standard additional or alternative access control
       mechanisms.

       As with many of the utilities that deal with filenames, the output of
       _l_s for multiple files or in one of the long listing formats must be
       used carefully on systems where filenames can contain embedded white
       space. Systems and system administrators should institute policies and
       user training to limit the use of such filenames.

       The number of disk blocks occupied by the file that it reports varies
       depending on underlying file system type, block size units reported,
       and the method of calculating the number of blocks. On some file system
       types, the number is the actual number of blocks occupied by the file
       (counting indirect blocks and ignoring holes in the file); on others it
       is calculated based on the file size (usually making an allowance for
       indirect blocks, but ignoring holes).

EEXXAAMMPPLLEESS
       An example of a small directory tree being fully listed with _l_s −−llaaRRFF  aa
       in the POSIX locale:


           ttoottaall 1111
           ddrrwwxxrr--xxrr--xx   33 ffooxx      pprroogg          6644 JJuull  44 1122::0077 ..//
           ddrrwwxxrrwwxxrrwwxx   44 ffooxx      pprroogg        33226644 JJuull  44 1122::0099 ....//
           ddrrwwxxrr--xxrr--xx   22 ffooxx      pprroogg          4488 JJuull  44 1122::0077 bb//
           --rrwwxxrr----rr----   11 ffooxx      pprroogg         557722 JJuull  44 1122::0077 ffoooo**

           a/b:
           total 4
           drwxr-xr-x   2 fox      prog          48 Jul  4 12:07 ./
           drwxr-xr-x   3 fox      prog          64 Jul  4 12:07 ../
           -rw-r--r--   1 fox      prog         700 Jul  4 12:07 bar

RRAATTIIOONNAALLEE
       Some historical implementations of the _l_s utility show all entries in a
       directory except dot and dot-dot when a superuser invokes _l_s without
       specifying the −−aa option. When ``normal'' users invoke _l_s without
       specifying −−aa, they should not see information about any files with
       names beginning with a <period> unless they were named as _f_i_l_e
       operands.

       Implementations are expected to traverse arbitrary depths when
       processing the −−RR option. The only limitation on depth should be based
       on running out of physical storage for keeping track of untraversed
       directories.

       The −−11 (one) option was historically found in BSD and BSD-derived
       implementations only. It is required in this volume of POSIX.1‐2008 so
       that conforming applications might ensure that output is one entry per
       line, even if the output is to a terminal.

       The −−SS option was added in Issue 7, but had been provided by several
       implementations for many years. The description given in the standard
       documents historic practice, but does not match much of the
       documentation that described its behavior. Historical documentation
       typically described it as something like:

       −−SS        Sort by size (largest size first) instead of by name. Special
                 character devices (listed last) are sorted by name.

       even though the file type was never considered when sorting the output.
       Character special files do typically sort close to the end of the list
       because their file size on most implementations is zero. But they are
       sorted alphabetically with any other files that happen to have the same
       file size (zero), not sorted separately and added to the end.

       This volume of POSIX.1‐2008 is frequently silent about what happens
       when mutually-exclusive options are specified. Except for −−RR, −−dd, and
       −−ff, the _l_s utility is required to accept multiple options from each
       mutually-exclusive option set without treating them as errors and to
       use the behavior specified by the last option given in each mutually-
       exclusive set. Since _l_s is one of the most aliased commands, it is
       important that the implementation perform intuitively. For example, if
       the alias were:


           aalliiaass llss==""llss −−CC""

       and the user typed _l_s −−11 (one), single-text-column output should
       result, not an error.

       The −−gg, −−ll (ell), −−nn, and −−oo options are not mutually-exclusive
       options. They all enable long format output. They work together to
       determine whether the file's owner is written (no if −−gg is present),
       file's group is written (no if −−oo is present), and if the file's group
       or owner is written whether it is written as the name (default) or a
       string representation of the UID or GID number (if −−nn is present). The
       −−CC, −−mm, −−xx, and −−11 (one) are mutually-exclusive options and the first
       three of these disable long format output. The −−11 (one) option does not
       directly change whether or not long format output is enabled, but by
       overriding −−CC, −−mm, and −−xx, it can re-enable long format output that had
       been disabled by one of these options.

       Earlier versions of this standard did not describe the BSD −−AA option
       (like −−aa, but dot and dot-dot are not written out). It has been added
       due to widespread implementation.

       Implementations may make −−qq the default for terminals to prevent trojan
       horse attacks on terminals with special escape sequences.  This is not
       required because:

        *  Some control characters may be useful on some terminals; for
           example, a system might write them as ""\\000011"" or ""^^AA"".

        *  Special behavior for terminals is not relevant to applications
           portability.

       An early proposal specified that the
       <_o_p_t_i_o_n_a_l_ _a_l_t_e_r_n_a_t_e_ _a_c_c_e_s_s_ _m_e_t_h_o_d_ _f_l_a_g> had to be ''++'' if there was an
       alternate access method used on the file or <space> if there was not.
       This was changed to be <space> if there is not and a single printable
       character if there is. This was done for three reasons:

        1. There are historical implementations using characters other than
           ''++''.

        2. There are implementations that vary this character used in that
           position to distinguish between various alternate access methods in
           use.

        3. The standard developers did not want to preclude future
           specifications that might need a way to specify more than one
           alternate access method.

       Nonetheless, implementations providing a single alternate access method
       are encouraged to use ''++''.

       Earlier versions of this standard did not have the −−kk option, which
       meant that the −−ss option could not be used portably as its block size
       was implementation-defined, and the units used to specify the number of
       blocks occupied by files in a directory in an _l_s −−ll listing were fixed
       as 512-byte units. The −−kk option has been added to provide a way for
       the −−ss option to be used portably, and for consistency it also changes
       the aforementioned units from 512-byte to 1024-byte.

       The <_d_a_t_e_ _a_n_d_ _t_i_m_e> field in the −−ll format is specified only for the
       POSIX locale. As noted, the format can be different in other locales.
       No mechanism for defining this is present in this volume of
       POSIX.1‐2008, as the appropriate vehicle is a messaging system; that
       is, the format should be specified as a ``message''.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       Allowing −−ff to ignore the −−AA, −−gg, −−ll, −−nn, −−oo, and −−ss options may be
       removed in a future version.

SSEEEE AALLSSOO
       _c_h_m_o_d, _f_i_n_d

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _4_._4, _F_i_l_e _A_c_c_e_s_s
       _P_e_r_m_i_s_s_i_o_n_s, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y
       _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, <<ssyyss__ssttaatt..hh>>

       The System Interfaces volume of POSIX.1‐2008, _f_s_t_a_t_a_t()

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



IEEE/The Open Group                  2013                               LS(1P)
