NM(1P)                     POSIX Programmer's Manual                    NM(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       nm — write the name list of an object file (DDEEVVEELLOOPPMMEENNTT)

SSYYNNOOPPSSIISS
       nm [[−APv]] [[−g|−u]] [[−t _f_o_r_m_a_t]] _f_i_l_e...
       nm [[−APv]] [[−efox]] [[−g|−u]] [[−t _f_o_r_m_a_t]] _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _n_m utility shall display symbolic information appearing in the
       object file, executable file, or object-file library named by _f_i_l_e.  If
       no symbolic information is available for a valid input file, the _n_m
       utility shall report that fact, but not consider it an error condition.

       The default base used when numeric values are written is unspecified.
       On XSI-conformant systems, it shall be decimal.

OOPPTTIIOONNSS
       The _n_m utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−AA        Write the full pathname or library name of an object on each
                 line.

       −−ee        Write only external (global) and static symbol information.

       −−ff        Produce full output. Write redundant symbols (..tteexxtt, ..ddaattaa,
                 and ..bbssss), normally suppressed.

       −−gg        Write only external (global) symbol information.

       −−oo        Write numeric values in octal (equivalent to −−tt  oo).

       −−PP        Write information in a portable output format, as specified
                 in the STDOUT section.

       −−tt  _f_o_r_m_a_t Write each numeric value in the specified format. The format
                 shall be dependent on the single character used as the _f_o_r_m_a_t
                 option-argument:

                 d     The offset is written in decimal (default).

                 o     The offset is written in octal.

                 x     The offset is written in hexadecimal.

       −−uu        Write only undefined symbols.

       −−vv        Sort output by value instead of by symbol name.

       −−xx        Write numeric values in hexadecimal (equivalent to −−tt  xx).

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of an object file, executable file, or object-file
                 library.

SSTTDDIINN
       See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input file shall be an object file, an object-file library whose
       format is the same as those produced by the _a_r utility for link
       editing, or an executable file. The _n_m utility may accept additional
       implementation-defined object library formats for the input file.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _n_m:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for character collation information for
                 the symbol-name and symbol-value collation sequences.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       If symbolic information is present in the input files, then for each
       file or for each member of an archive, the _n_m utility shall write the
       following information to standard output. By default, the format is
       unspecified, but the output shall be sorted by symbol name according to
       the collation sequence in the current locale.

        *  Library or object name, if −−AA is specified

        *  Symbol name

        *  Symbol type, which shall either be one of the following single
           characters or an implementation-defined type represented by a
           single character:

           A     Global absolute symbol.

           a     Local absolute symbol.

           B     Global ``bss'' (that is, uninitialized data space) symbol.

           b     Local bss symbol.

           D     Global data symbol.

           d     Local data symbol.

           T     Global text symbol.

           t     Local text symbol.

           U     Undefined symbol.

        *  Value of the symbol

        *  The size associated with the symbol, if applicable

       This information may be supplemented by additional information specific
       to the implementation.

       If the −−PP option is specified, the previous information shall be
       displayed using the following portable format. The three versions
       differ depending on whether −−tt  dd, −−tt  oo, or −−tt  xx was specified,
       respectively:


           ""%%ss%%ss %%ss %%dd %%dd\\nn"",, <<_l_i_b_r_a_r_y_/_o_b_j_e_c_t _n_a_m_e>, <_n_a_m_e>, <_t_y_p_e>,
               <_v_a_l_u_e>, <_s_i_z_e>

           "%s%s %s %o %o\n", <_l_i_b_r_a_r_y_/_o_b_j_e_c_t _n_a_m_e>, <_n_a_m_e>, <_t_y_p_e>,
               <_v_a_l_u_e>, <_s_i_z_e>

           "%s%s %s %x %x\n", <_l_i_b_r_a_r_y_/_o_b_j_e_c_t _n_a_m_e>, <_n_a_m_e>, <_t_y_p_e>,
               <_v_a_l_u_e>, <_s_i_z_e>

       where <_l_i_b_r_a_r_y_/_o_b_j_e_c_t_ _n_a_m_e> shall be formatted as follows:

        *  If −−AA is not specified, <_l_i_b_r_a_r_y_/_o_b_j_e_c_t_ _n_a_m_e> shall be an empty
           string.

        *  If −−AA is specified and the corresponding _f_i_l_e operand does not name
           a library:


               ""%%ss:: "",, <<_f_i_l_e>

        *  If −−AA is specified and the corresponding _f_i_l_e operand names a
           library. In this case, <_o_b_j_e_c_t_ _f_i_l_e> shall name the object file in
           the library containing the symbol being described:


               ""%%ss[[%%ss]]:: "",, <<_f_i_l_e>, <_o_b_j_e_c_t _f_i_l_e>

       If −−AA is not specified, then if more than one _f_i_l_e operand is specified
       or if only one _f_i_l_e operand is specified and it names a library, _n_m
       shall write a line identifying the object containing the following
       symbols before the lines containing those symbols, in the form:

        *  If the corresponding _f_i_l_e operand does not name a library:


               ""%%ss::\\nn"",, <<_f_i_l_e>

        *  If the corresponding _f_i_l_e operand names a library; in this case,
           <_o_b_j_e_c_t_ _f_i_l_e> shall be the name of the file in the library
           containing the following symbols:


               ""%%ss[[%%ss]]::\\nn"",, <<_f_i_l_e>, <_o_b_j_e_c_t _f_i_l_e>

       If −−PP is specified, but −−tt is not, the format shall be as if −−tt  xx had
       been specified.

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
       Mechanisms for dynamic linking make this utility less meaningful when
       applied to an executable file because a dynamically linked executable
       may omit numerous library routines that would be found in a statically
       linked executable.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       Historical implementations of _n_m have used different bases for numeric
       output and supplied different default types of symbols that were
       reported. The −−tt _f_o_r_m_a_t option, similar to that used in _o_d and _s_t_r_i_n_g_s,
       can be used to specify the numeric base; −−gg and −−uu can be used to
       restrict the amount of output or the types of symbols included in the
       output.

       The compromise of using −−tt _f_o_r_m_a_t _v_e_r_s_u_s using −−dd, −−oo, and other
       similar options was necessary because of differences in the meaning of
       −−oo between implementations. The −−oo option from BSD has been provided
       here as −−AA to avoid confusion with the −−oo from System V (which has been
       provided here as −−tt and as −−oo on XSI-conformant systems).

       The option list was significantly reduced from that provided by
       historical implementations.

       The _n_m description is a subset of both the System V and BSD _n_m
       utilities with no specified default output.

       It was recognized that mechanisms for dynamic linking make this utility
       less meaningful when applied to an executable file (because a
       dynamically linked executable file may omit numerous library routines
       that would be found in a statically linked executable file), but the
       value of _n_m during software development was judged to outweigh other
       limitations.

       The default output format of _n_m is not specified because of differences
       in historical implementations.  The −−PP option was added to allow some
       type of portable output format. After a comparison of the different
       formats used in SunOS, BSD, SVR3, and SVR4, it was decided to create
       one that did not match the current format of any of these four systems.
       The format devised is easy to parse by humans, easy to parse in shell
       scripts, and does not need to vary depending on locale (because no
       English descriptions are included).  All of the systems currently have
       the information available to use this format.

       The format given in _n_m STDOUT uses <space> characters between the
       fields, which may be any number of <blank> characters required to align
       the columns. The single-character types were selected to match
       historical practice, and the requirement that implementation additions
       also be single characters made parsing the information easier for shell
       scripts.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _a_r, _c_9_9

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



IEEE/The Open Group                  2013                               NM(1P)
