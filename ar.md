AR(1P)                     POSIX Programmer's Manual                    AR(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       ar — create and maintain library archives

SSYYNNOOPPSSIISS
       ar −d [[−v]] _a_r_c_h_i_v_e _f_i_l_e...

       ar −m [[−v]] _a_r_c_h_i_v_e _f_i_l_e...
       ar −m −a [[−v]] _p_o_s_n_a_m_e _a_r_c_h_i_v_e _f_i_l_e...
       ar −m −b [[−v]] _p_o_s_n_a_m_e _a_r_c_h_i_v_e _f_i_l_e...
       ar −m −i [[−v]] _p_o_s_n_a_m_e _a_r_c_h_i_v_e _f_i_l_e...

       ar −p [[−v]] [[−s]] _a_r_c_h_i_v_e [[_f_i_l_e...]]

       ar −q [[−cv]] _a_r_c_h_i_v_e _f_i_l_e...

       ar −r [[−cuv]] _a_r_c_h_i_v_e _f_i_l_e...

       ar −r −a [[−cuv]] _p_o_s_n_a_m_e _a_r_c_h_i_v_e _f_i_l_e...
       ar −r −b [[−cuv]] _p_o_s_n_a_m_e _a_r_c_h_i_v_e _f_i_l_e...
       ar −r −i [[−cuv]] _p_o_s_n_a_m_e _a_r_c_h_i_v_e _f_i_l_e...

       ar −t [[−v]] [[−s]] _a_r_c_h_i_v_e [[_f_i_l_e...]]

       ar −x [[−v]] [[−sCT]] _a_r_c_h_i_v_e [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _a_r utility is part of the Software Development Utilities option.

       The _a_r utility can be used to create and maintain groups of files
       combined into an archive. Once an archive has been created, new files
       can be added, and existing files in an archive can be extracted,
       deleted, or replaced. When an archive consists entirely of valid object
       files, the implementation shall format the archive so that it is usable
       as a library for link editing (see _c_9_9 and _f_o_r_t_7_7).  When some of the
       archived files are not valid object files, the suitability of the
       archive for library use is undefined.  If an archive consists entirely
       of printable files, the entire archive shall be printable.

       When _a_r creates an archive, it creates administrative information
       indicating whether a symbol table is present in the archive. When there
       is at least one object file that _a_r recognizes as such in the archive,
       an archive symbol table shall be created in the archive and maintained
       by _a_r; it is used by the link editor to search the archive. Whenever
       the _a_r utility is used to create or update the contents of such an
       archive, the symbol table shall be rebuilt. The −−ss option shall force
       the symbol table to be rebuilt.

       All _f_i_l_e operands can be pathnames. However, files within archives
       shall be named by a filename, which is the last component of the
       pathname used when the file was entered into the archive. The
       comparison of _f_i_l_e operands to the names of files in archives shall be
       performed by comparing the last component of the operand to the name of
       the file in the archive.

       It is unspecified whether multiple files in the archive may be
       identically named. In the case of such files, however, each _f_i_l_e and
       _p_o_s_n_a_m_e operand shall match only the first file in the archive having a
       name that is the same as the last component of the operand.

OOPPTTIIOONNSS
       The _a_r utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except for
       Guideline 9.

       The following options shall be supported:

       −−aa        Position new files in the archive after the file named by the
                 _p_o_s_n_a_m_e operand.

       −−bb        Position new files in the archive before the file named by
                 the _p_o_s_n_a_m_e operand.

       −−cc        Suppress the diagnostic message that is written to standard
                 error by default when the archive _a_r_c_h_i_v_e is created.

       −−CC        Prevent extracted files from replacing like-named files in
                 the file system. This option is useful when −−TT is also used,
                 to prevent truncated filenames from replacing files with the
                 same prefix.

       −−dd        Delete one or more _f_i_l_es from _a_r_c_h_i_v_e.

       −−ii        Position new files in the archive before the file in the
                 archive named by the _p_o_s_n_a_m_e operand (equivalent to −−bb).

       −−mm        Move the named files in the archive. The −−aa, −−bb, or −−ii
                 options with the _p_o_s_n_a_m_e operand indicate the position;
                 otherwise, move the names files in the archive to the end of
                 the archive.

       −−pp        Write the contents of the _f_i_l_es in the archive named by _f_i_l_e
                 operands from _a_r_c_h_i_v_e to the standard output. If no _f_i_l_e
                 operands are specified, the contents of all files in the
                 archive shall be written in the order of the archive.

       −−qq        Append the named files to the end of the archive. In this
                 case _a_r does not check whether the added files are already in
                 the archive.  This is useful to bypass the searching
                 otherwise done when creating a large archive piece by piece.

       −−rr        Replace or add _f_i_l_es to _a_r_c_h_i_v_e.  If the archive named by
                 _a_r_c_h_i_v_e does not exist, a new archive shall be created and a
                 diagnostic message shall be written to standard error (unless
                 the −−cc option is specified). If no _f_i_l_es are specified and
                 the _a_r_c_h_i_v_e exists, the results are undefined. Files that
                 replace existing files in the archive shall not change the
                 order of the archive. Files that do not replace existing
                 files in the archive shall be appended to the archive unless
                 a −−aa, −−bb, or −−ii option specifies another position.

       −−ss        Force the regeneration of the archive symbol table even if _a_r
                 is not invoked with an option that modifies the archive
                 contents. This option is useful to restore the archive symbol
                 table after it has been stripped; see _s_t_r_i_p.

       −−tt        Write a table of contents of _a_r_c_h_i_v_e to the standard output.
                 Only the files specified by the _f_i_l_e operands shall be
                 included in the written list. If no _f_i_l_e operands are
                 specified, all files in _a_r_c_h_i_v_e shall be included in the
                 order of the archive.

       −−TT        Allow filename truncation of extracted files whose archive
                 names are longer than the file system can support. By
                 default, extracting a file with a name that is too long shall
                 be an error; a diagnostic message shall be written and the
                 file shall not be extracted.

       −−uu        Update older files in the archive. When used with the −−rr
                 option, files in the archive shall be replaced only if the
                 corresponding _f_i_l_e has a modification time that is at least
                 as new as the modification time of the file in the archive.

       −−vv        Give verbose output. When used with the option characters −−dd,
                 −−rr, or −−xx, write a detailed file-by-file description of the
                 archive creation and maintenance activity, as described in
                 the STDOUT section.

                 When used with −−pp, write the name of the file in the archive
                 to the standard output before writing the file in the archive
                 itself to the standard output, as described in the STDOUT
                 section.

                 When used with −−tt, include a long listing of information
                 about the files in the archive, as described in the STDOUT
                 section.

       −−xx        Extract the files in the archive named by the _f_i_l_e operands
                 from _a_r_c_h_i_v_e.  The contents of the archive shall not be
                 changed. If no _f_i_l_e operands are given, all files in the
                 archive shall be extracted. The modification time of each
                 file extracted shall be set to the time the file is extracted
                 from the archive.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _a_r_c_h_i_v_e   A pathname of the archive.

       _f_i_l_e      A pathname. Only the last component shall be used when
                 comparing against the names of files in the archive. If two
                 or more _f_i_l_e operands have the same last pathname component
                 (basename), the results are unspecified. The implementation's
                 archive format shall not truncate valid filenames of files
                 added to or replaced in the archive.

       _p_o_s_n_a_m_e   The name of a file in the archive, used for relative
                 positioning; see options −−mm and −−rr.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       The archive named by _a_r_c_h_i_v_e shall be a file in the format created by
       _a_r −−rr.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _a_r:

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

       _L_C___T_I_M_E   Determine the format and content for date and time strings
                 written by _a_r −−ttvv.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_M_P_D_I_R    Determine the pathname that overrides the default directory
                 for temporary files, if any.

       _T_Z        Determine the timezone used to calculate date and time
                 strings written by _a_r −−ttvv.  If _T_Z is unset or null, an
                 unspecified default timezone shall be used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       If the −−dd option is used with the −−vv option, the standard output format
       shall be:


           ""dd −− %%ss\\nn"",, <<_f_i_l_e>

       where _f_i_l_e is the operand specified on the command line.

       If the −−pp option is used with the −−vv option, _a_r shall precede the
       contents of each file with:


           ""\\nn<<%%ss>>\\nn\\nn"",, <<_f_i_l_e>

       where _f_i_l_e is the operand specified on the command line, if _f_i_l_e
       operands were specified, and the name of the file in the archive if
       they were not.

       If the −−rr option is used with the −−vv option:

        *  If _f_i_l_e is already in the archive, the standard output format shall
           be:


               ""rr −− %%ss\\nn"",, <<_f_i_l_e>

           where <_f_i_l_e> is the operand specified on the command line.

        *  If _f_i_l_e is not already in the archive, the standard output format
           shall be:


               ""aa −− %%ss\\nn"",, <<_f_i_l_e>

           where <_f_i_l_e> is the operand specified on the command line.

       If the −−tt option is used, _a_r shall write the names of the files in the
       archive to the standard output in the format:


           ""%%ss\\nn"",, <<_f_i_l_e>

       where _f_i_l_e is the operand specified on the command line, if _f_i_l_e
       operands were specified, or the name of the file in the archive if they
       were not.

       If the −−tt option is used with the −−vv option, the standard output format
       shall be:


           ""%%ss %%uu//%%uu %%uu %%ss %%dd %%dd::%%dd %%dd %%ss\\nn"",, <<_m_e_m_b_e_r _m_o_d_e>, <_u_s_e_r _I_D>,
               <_g_r_o_u_p _I_D>, <_n_u_m_b_e_r _o_f _b_y_t_e_s _i_n _m_e_m_b_e_r>,
               <_a_b_b_r_e_v_i_a_t_e_d _m_o_n_t_h>, <_d_a_y_-_o_f_-_m_o_n_t_h>, <_h_o_u_r>,
               <_m_i_n_u_t_e>, <_y_e_a_r>, <_f_i_l_e>

       where:

       <_f_i_l_e>    Shall be the operand specified on the command line, if _f_i_l_e
                 operands were specified, or the name of the file in the
                 archive if they were not.

       <_m_e_m_b_e_r_ _m_o_d_e>
                 Shall be formatted the same as the <_f_i_l_e_ _m_o_d_e> string defined
                 in the STDOUT section of _l_s, except that the first character,
                 the <_e_n_t_r_y_ _t_y_p_e>, is not used; the string represents the file
                 mode of the file in the archive at the time it was added to
                 or replaced in the archive.

       The following represent the last-modification time of a file when it
       was most recently added to or replaced in the archive:

       <_a_b_b_r_e_v_i_a_t_e_d_ _m_o_n_t_h>
                 Equivalent to the format of the %%bb conversion specification
                 format in _d_a_t_e.

       <_d_a_y_-_o_f_-_m_o_n_t_h>
                 Equivalent to the format of the %%ee conversion specification
                 format in _d_a_t_e.

       <_h_o_u_r>    Equivalent to the format of the %%HH conversion specification
                 format in _d_a_t_e.

       <_m_i_n_u_t_e>  Equivalent to the format of the %%MM conversion specification
                 format in _d_a_t_e.

       <_y_e_a_r>    Equivalent to the format of the %%YY conversion specification
                 format in _d_a_t_e.

       When _L_C___T_I_M_E does not specify the POSIX locale, a different format and
       order of presentation of these fields relative to each other may be
       used in a format appropriate in the specified locale.

       If the −−xx option is used with the −−vv option, the standard output format
       shall be:


           ""xx −− %%ss\\nn"",, <<_f_i_l_e>

       where _f_i_l_e is the operand specified on the command line, if _f_i_l_e
       operands were specified, or the name of the file in the archive if they
       were not.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.  The
       diagnostic message about creating a new archive when −−cc is not
       specified shall not modify the exit status.

OOUUTTPPUUTT FFIILLEESS
       Archives are files with unspecified formats.

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
       None.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The archive format is not described. It is recognized that there are
       several known _a_r formats, which are not compatible. The _a_r utility is
       included, however, to allow creation of archives that are intended for
       use only on one machine. The archive is specified as a file, and it can
       be moved as a file. This does allow an archive to be moved from one
       machine to another machine that uses the same implementation of _a_r.

       Utilities such as _p_a_x (and its forebears _t_a_r and _c_p_i_o) also provide
       portable ``archives''. This is a not a duplication; the _a_r utility is
       included to provide an interface primarily for _m_a_k_e and the compilers,
       based on a historical model.

       In historical implementations, the −−qq option (available on XSI-
       conforming systems) is known to execute quickly because _a_r does not
       check on whether the added members are already in the archive. This is
       useful to bypass the searching otherwise done when creating a large
       archive piece-by-piece. These remarks may but need not remain true for
       a brand new implementation of this utility; hence, these remarks have
       been moved into the RATIONALE.

       BSD implementations historically required applications to provide the
       −−ss option whenever the archive was supposed to contain a symbol table.
       As in this volume of POSIX.1‐2008, System V historically creates or
       updates an archive symbol table whenever an object file is removed
       from, added to, or updated in the archive.

       The OPERANDS section requires what might seem to be true without
       specifying it: the archive cannot truncate the filenames below
       {NAME_MAX}.  Some historical implementations do so, however, causing
       unexpected results for the application. Therefore, this volume of
       POSIX.1‐2008 makes the requirement explicit to avoid misunderstandings.

       According to the System V documentation, the options −−ddmmppqqrrttxx are not
       required to begin with a <hyphen> (''−−'').  This volume of POSIX.1‐2008
       requires that a conforming application use the leading <hyphen>.

       The archive format used by the 4.4 BSD implementation is documented in
       this RATIONALE as an example:

              A file created by _a_r begins with the ``magic'' string
              ""!!<<aarrcchh>>\\nn"".  The rest of the archive is made up of objects,
              each of which is composed of a header for a file, a possible
              filename, and the file contents. The header is portable between
              machine architectures, and, if the file contents are printable,
              the archive is itself printable.

              The header is made up of six ASCII fields, followed by a two-
              character trailer. The fields are the object name (16
              characters), the file last modification time (12 characters),
              the user and group IDs (each 6 characters), the file mode (8
              characters), and the file size (10 characters). All numeric
              fields are in decimal, except for the file mode, which is in
              octal.

              The modification time is the file _s_t___m_t_i_m_e field. The user and
              group IDs are the file _s_t___u_i_d and _s_t___g_i_d fields. The file mode
              is the file _s_t___m_o_d_e field. The file size is the file _s_t___s_i_z_e
              field. The two-byte trailer is the string ""``<<nneewwlliinnee>>"".

              Only the name field has any provision for overflow. If any
              filename is more than 16 characters in length or contains an
              embedded space, the string ""##11//"" followed by the ASCII length of
              the name is written in the name field.  The file size (stored in
              the archive header) is incremented by the length of the name.
              The name is then written immediately following the archive
              header.

              Any unused characters in any of these fields are written as
              <space> characters. If any fields are their particular maximum
              number of characters in length, there is no separation between
              the fields.

              Objects in the archive are always an even number of bytes long;
              files that are an odd number of bytes long are padded with a
              <newline>, although the size in the header does not reflect
              this.

       The _a_r utility description requires that (when all its members are
       valid object files) _a_r produce an object code library, which the
       linkage editor can use to extract object modules. If the linkage editor
       needs a symbol table to permit random access to the archive, _a_r must
       provide it; however, _a_r does not require a symbol table.

       The BSD −−oo option was omitted. It is a rare conforming application that
       uses _a_r to extract object code from a library with concern for its
       modification time, since this can only be of importance to _m_a_k_e.
       Hence, since this functionality is not deemed important for
       applications portability, the modification time of the extracted files
       is set to the current time.

       There is at least one known implementation (for a small computer) that
       can accommodate only object files for that system, disallowing mixed
       object and other files. The ability to handle any type of file is not
       only historical practice for most implementations, but is also a
       reasonable expectation.

       Consideration was given to changing the output format of _a_r −−ttvv to the
       same format as the output of _l_s −−ll.  This would have made parsing the
       output of _a_r the same as that of _l_s.  This was rejected in part because
       the current _a_r format is commonly used and changes would break
       historical usage.  Second, _a_r gives the user ID and group ID in numeric
       format separated by a <slash>.  Changing this to be the user name and
       group name would not be correct if the archive were moved to a machine
       that contained a different user database. Since _a_r cannot know whether
       the archive was generated on the same machine, it cannot tell what to
       report.

       The text on the −−uurr option combination is historical practice—since one
       filename can easily represent two different files (for example, //aa//ffoooo
       and //bb//ffoooo), it is reasonable to replace the file in the archive even
       when the modification time in the archive is identical to that in the
       file system.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _c_9_9, _d_a_t_e, _f_o_r_t_7_7, _p_a_x, _s_t_r_i_p

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, <<uunniissttdd..hh>>,
       description of {POSIX_NO_TRUNC}

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



IEEE/The Open Group                  2013                               AR(1P)
