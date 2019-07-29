PS(1P)                     POSIX Programmer's Manual                    PS(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       ps — report process status

SSYYNNOOPPSSIISS
       ps [[−aA]] [[−defl]] [[−g _g_r_o_u_p_l_i_s_t]] [[−G _g_r_o_u_p_l_i_s_t]]
           [[−n _n_a_m_e_l_i_s_t]] [[−o _f_o_r_m_a_t]]... [[−p _p_r_o_c_l_i_s_t]] [[−t _t_e_r_m_l_i_s_t]]
           [[−u _u_s_e_r_l_i_s_t]] [[−U _u_s_e_r_l_i_s_t]]

DDEESSCCRRIIPPTTIIOONN
       The _p_s utility shall write information about processes, subject to
       having appropriate privileges to obtain information about those
       processes.

       By default, _p_s shall select all processes with the same effective user
       ID as the current user and the same controlling terminal as the
       invoker.

OOPPTTIIOONNSS
       The _p_s utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−aa        Write information for all processes associated with
                 terminals.  Implementations may omit session leaders from
                 this list.

       −−AA        Write information for all processes.

       −−dd        Write information for all processes, except session leaders.

       −−ee        Write information for all processes.  (Equivalent to −−AA.)

       −−ff        Generate a ffuullll listing. (See the STDOUT section for the
                 contents of a ffuullll listing.)

       −−gg  _g_r_o_u_p_l_i_s_t
                 Write information for processes whose session leaders are
                 given in _g_r_o_u_p_l_i_s_t.  The application shall ensure that the
                 _g_r_o_u_p_l_i_s_t is a single argument in the form of a <blank> or
                 <comma>-separated list.

       −−GG  _g_r_o_u_p_l_i_s_t
                 Write information for processes whose real group ID numbers
                 are given in _g_r_o_u_p_l_i_s_t.  The application shall ensure that
                 the _g_r_o_u_p_l_i_s_t is a single argument in the form of a <blank>
                 or <comma>-separated list.

       −−ll        Generate a lloonngg listing. (See STDOUT for the contents of a
                 lloonngg listing.)

       −−nn  _n_a_m_e_l_i_s_t
                 Specify the name of an alternative system _n_a_m_e_l_i_s_t file in
                 place of the default. The name of the default file and the
                 format of a _n_a_m_e_l_i_s_t file are unspecified.

       −−oo  _f_o_r_m_a_t Write information according to the format specification given
                 in _f_o_r_m_a_t.  This is fully described in the STDOUT section.
                 Multiple −−oo options can be specified; the format
                 specification shall be interpreted as the <space>-separated
                 concatenation of all the _f_o_r_m_a_t option-arguments.

       −−pp  _p_r_o_c_l_i_s_t
                 Write information for processes whose process ID numbers are
                 given in _p_r_o_c_l_i_s_t.  The application shall ensure that the
                 _p_r_o_c_l_i_s_t is a single argument in the form of a <blank> or
                 <comma>-separated list.

       −−tt  _t_e_r_m_l_i_s_t
                 Write information for processes associated with terminals
                 given in _t_e_r_m_l_i_s_t.  The application shall ensure that the
                 _t_e_r_m_l_i_s_t is a single argument in the form of a <blank> or
                 <comma>-separated list. Terminal identifiers shall be given
                 in an implementation-defined format.  On XSI-conformant
                 systems, they shall be given in one of two forms: the
                 device's filename (for example, ttttyy0044) or, if the device's
                 filename starts with ttttyy, just the identifier following the
                 characters ttttyy (for example, ""0044"").

       −−uu  _u_s_e_r_l_i_s_t
                 Write information for processes whose user ID numbers or
                 login names are given in _u_s_e_r_l_i_s_t.  The application shall
                 ensure that the _u_s_e_r_l_i_s_t is a single argument in the form of
                 a <blank> or <comma>-separated list. In the listing, the
                 numerical user ID shall be written unless the −−ff option is
                 used, in which case the login name shall be written.

       −−UU  _u_s_e_r_l_i_s_t
                 Write information for processes whose real user ID numbers or
                 login names are given in _u_s_e_r_l_i_s_t.  The application shall
                 ensure that the _u_s_e_r_l_i_s_t is a single argument in the form of
                 a <blank> or <comma>-separated list.

       With the exception of −−ff, −−ll, −−nn _n_a_m_e_l_i_s_t, and −−oo _f_o_r_m_a_t, all of the
       options shown are used to select processes. If any are specified, the
       default list shall be ignored and _p_s shall select the processes
       represented by the inclusive OR of all the selection-criteria options.

OOPPEERRAANNDDSS
       None.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _p_s:

       _C_O_L_U_M_N_S   Override the system-selected horizontal display line size,
                 used to determine the number of text columns to display. See
                 the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8,
                 _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s for valid values and results when it is
                 unset or null.

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s the precedence of internationalization variables
                 used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard error
                 and informative messages written to standard output.

       _L_C___T_I_M_E   Determine the format and contents of the date and time
                 strings displayed.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone used to calculate date and time
                 strings displayed. If _T_Z is unset or null, an unspecified
                 default timezone shall be used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       When the −−oo option is not specified, the standard output format is
       unspecified.

       On XSI-conformant systems, the output format shall be as follows.  The
       column headings and descriptions of the columns in a _p_s listing are
       given below. The precise meanings of these fields are implementation-
       defined. The letters ''ff'' and ''ll'' (below) indicate the option (ffuullll or
       lloonngg) that shall cause the corresponding heading to appear; aallll means
       that the heading always appears. Note that these two options determine
       only what information is provided for a process; they do not determine
       which processes are listed.

       FF       (l)     Flags (octal and additive) associated with
                       the process.
       SS       (l)     The state of the process.
       UUIIDD     (f,l)   The user ID number of the process owner;
                       the login name is printed under the −f
                       option.
       PPIIDD     (all)   The process ID of the process; it is
                       possible to kill a process if this datum is
                       known.
       PPPPIIDD    (f,l)   The process ID of the parent process.
       CC       (f,l)   Processor utilization for scheduling.
       PPRRII     (l)     The priority of the process; higher numbers
                       mean lower priority.
       NNII      (l)     Nice value; used in priority computation.
       AADDDDRR    (l)     The address of the process.
       SSZZ      (l)     The size in blocks of the core image of the
                       process.
       WWCCHHAANN   (l)     The event for which the process is waiting
                       or sleeping; if blank, the process is
                       running.
       SSTTIIMMEE   (f)     Starting time of the process.
       TTTTYY     (all)   The controlling terminal for the process.
       TTIIMMEE    (all)   The cumulative execution time for the
                       process.
       CCMMDD     (all)   The command name; the full command name and
                       its arguments are written under the −f
                       option.

       A process that has exited and has a parent, but has not yet been waited
       for by the parent, shall be marked ddeeffuunncctt.

       Under the option −−ff, _p_s tries to determine the command name and
       arguments given when the process was created by examining memory or the
       swap area. Failing this, the command name, as it would appear without
       the option −−ff, is written in square brackets.

       The −−oo option allows the output format to be specified under user
       control.

       The application shall ensure that the format specification is a list of
       names presented as a single argument, <blank> or <comma>-separated.
       Each variable has a default header. The default header can be
       overridden by appending an <equals-sign> and the new text of the
       header. The rest of the characters in the argument shall be used as the
       header text. The fields specified shall be written in the order
       specified on the command line, and should be arranged in columns in the
       output. The field widths shall be selected by the system to be at least
       as wide as the header text (default or overridden value). If the header
       text is null, such as −−oo _u_s_e_r=, the field width shall be at least as
       wide as the default header text.  If all header text fields are null,
       no header line shall be written.

       The following names are recognized in the POSIX locale:

       rruusseerr   The real user ID of the process. This shall be the textual user
               ID, if it can be obtained and the field width permits, or a
               decimal representation otherwise.

       uusseerr    The effective user ID of the process. This shall be the textual
               user ID, if it can be obtained and the field width permits, or
               a decimal representation otherwise.

       rrggrroouupp  The real group ID of the process. This shall be the textual
               group ID, if it can be obtained and the field width permits, or
               a decimal representation otherwise.

       ggrroouupp   The effective group ID of the process. This shall be the
               textual group ID, if it can be obtained and the field width
               permits, or a decimal representation otherwise.

       ppiidd     The decimal value of the process ID.

       ppppiidd    The decimal value of the parent process ID.

       ppggiidd    The decimal value of the process group ID.

       ppccppuu    The ratio of CPU time used recently to CPU time available in
               the same period, expressed as a percentage. The meaning of
               ``recently'' in this context is unspecified. The CPU time
               available is determined in an unspecified manner.

       vvsszz     The size of the process in (virtual) memory in 1024 byte units
               as a decimal integer.

       nniiccee    The decimal value of the nice value of the process; see _n_i_c_e.

       eettiimmee   In the POSIX locale, the elapsed time since the process was
               started, in the form:


                   [[[[_d_d−]]_h_h:]]_m_m:_s_s

               where _d_d shall represent the number of days, _h_h the number of
               hours, _m_m the number of minutes, and _s_s the number of seconds.
               The _d_d field shall be a decimal integer. The _h_h, _m_m, and _s_s
               fields shall be two-digit decimal integers padded on the left
               with zeros.

       ttiimmee    In the POSIX locale, the cumulative CPU time of the process in
               the form:


                   [[_d_d−]]_h_h:_m_m:_s_s

               The _d_d, _h_h, _m_m, and _s_s fields shall be as described in the
               eettiimmee specifier.

       ttttyy     The name of the controlling terminal of the process (if any) in
               the same format used by the _w_h_o utility.

       ccoommmm    The name of the command being executed (_a_r_g_v[0] value) as a
               string.

       aarrggss    The command with all its arguments as a string. The
               implementation may truncate this value to the field width; it
               is implementation-defined whether any further truncation
               occurs. It is unspecified whether the string represented is a
               version of the argument list as it was passed to the command
               when it started, or is a version of the arguments as they may
               have been modified by the application. Applications cannot
               depend on being able to modify their argument list and having
               that modification be reflected in the output of _p_s.

       Any field need not be meaningful in all implementations. In such a case
       a <hyphen> (''−−'') should be output in place of the field value.

       Only ccoommmm and aarrggss shall be allowed to contain <blank> characters; all
       others shall not. Any implementation-defined variables shall be
       specified in the system documentation along with the default header and
       indicating whether the field may contain <blank> characters.

       The following table specifies the default header to be used in the
       POSIX locale corresponding to each format specifier.

                                TTaabblleeNNaammeess:: VVaarriiaabbllee

       +----------------------------------+-----------------------------------+
       |FFoorrmmaatt SSppeecciiffiieerr   DDeeffaauulltt HHeeaaddeerr | FFoorrmmaatt SSppeecciiffiieerr   DDeeffaauulltt HHeeaaddeerr |
       +----------------------------------+-----------------------------------+
       |aarrggss               CCOOMMMMAANNDD        | ppppiidd               PPPPIIDD           |
       |ccoommmm               CCOOMMMMAANNDD        | rrggrroouupp             RRGGRROOUUPP         |
       |eettiimmee              EELLAAPPSSEEDD        | rruusseerr              RRUUSSEERR          |
       |ggrroouupp              GGRROOUUPP          | ttiimmee               TTIIMMEE           |
       |nniiccee               NNII             | ttttyy                TTTT             |
       |ppccppuu               %%CCPPUU           | uusseerr               UUSSEERR           |
       |ppggiidd               PPGGIIDD           | vvsszz                VVSSZZ            |
       |ppiidd                PPIIDD            |                                   |
       +----------------------------------+-----------------------------------+
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
       Things can change while _p_s is running; the snapshot it gives is only
       true for an instant, and might not be accurate by the time it is
       displayed.

       The aarrggss format specifier is allowed to produce a truncated version of
       the command arguments. In some implementations, this information is no
       longer available when the _p_s utility is executed.

       If the field width is too narrow to display a textual ID, the system
       may use a numeric version. Normally, the system would be expected to
       choose large enough field widths, but if a large number of fields were
       selected to write, it might squeeze fields to their minimum sizes to
       fit on one line. One way to ensure adequate width for the textual IDs
       is to override the default header for a field to make it larger than
       most or all user or group names.

       There is no special quoting mechanism for header text. The header text
       is the rest of the argument. If multiple header changes are needed,
       multiple −−oo options can be used, such as:


           ppss −−oo ""uusseerr==UUsseerr NNaammee"" −−oo ppiidd==PPrroocceessss\\ IIDD

       On some implementations, especially multi-level secure systems, _p_s may
       be severely restricted and produce information only about child
       processes owned by the user.

EEXXAAMMPPLLEESS
       The command:


           ppss −−oo uusseerr,,ppiidd,,ppppiidd==MMOOMM −−oo aarrggss

       writes at least the following in the POSIX locale:


             UUSSEERR   PPIIDD   MMOOMM   CCOOMMMMAANNDD
           hheelleennee    3344    1122   ppss −−oo uuiidd,,ppiidd,,ppppiidd==MMOOMM −−oo aarrggss

       The contents of the CCOOMMMMAANNDD field need not be the same in all
       implementations, due to possible truncation.

RRAATTIIOONNAALLEE
       There is very little commonality between BSD and System V
       implementations of _p_s.  Many options conflict or have subtly different
       usages. The standard developers attempted to select a set of options
       for the base standard that were useful on a wide range of systems and
       selected options that either can be implemented on both BSD and System
       V-based systems without breaking the current implementations or where
       the options are sufficiently similar that any changes would not be
       unduly problematic for users or implementors.

       It is recognized that on some implementations, especially multi-level
       secure systems, _p_s may be nearly useless. The default output has
       therefore been chosen such that it does not break historical
       implementations and also is likely to provide at least some useful
       information on most systems.

       The major change is the addition of the format specification
       capability. The motivation for this invention is to provide a mechanism
       for users to access a wider range of system information, if the system
       permits it, in a portable manner. The fields chosen to appear in this
       volume of POSIX.1‐2008 were arrived at after considering what concepts
       were likely to be both reasonably useful to the ``average'' user and
       had a reasonable chance of being implemented on a wide range of
       systems. Again it is recognized that not all systems are able to
       provide all the information and, conversely, some may wish to provide
       more. It is hoped that the approach adopted will be sufficiently
       flexible and extensible to accommodate most systems. Implementations
       may be expected to introduce new format specifiers.

       The default output should consist of a short listing containing the
       process ID, terminal name, cumulative execution time, and command name
       of each process.

       The preference of the standard developers would have been to make the
       format specification an operand of the _p_s command. Unfortunately, BSD
       usage precluded this.

       At one time a format was included to display the environment array of
       the process. This was deleted because there is no portable way to
       display it.

       The −−AA option is equivalent to the BSD −−gg and the SVID −−ee.  Because the
       two systems differed, a mnemonic compromise was selected.

       The −−aa option is described with some optional behavior because the SVID
       omits session leaders, but BSD does not.

       In an early proposal, format specifiers appeared for priority and start
       time. The former was not defined adequately in this volume of
       POSIX.1‐2008 and was removed in deference to the defined nice value;
       the latter because elapsed time was considered to be more useful.

       In a new BSD version of _p_s, a −−OO option can be used to write all of the
       default information, followed by additional format specifiers. This was
       not adopted because the default output is implementation-defined.
       Nevertheless, this is a useful option that should be reserved for that
       purpose. In the −−oo option for the POSIX Shell and Utilities _p_s, the
       format is the concatenation of each −−oo.  Therefore, the user can have
       an alias or function that defines the beginning of their desired format
       and add more fields to the end of the output in certain cases where
       that would be useful.

       The format of the terminal name is unspecified, but the descriptions of
       _p_s, _t_a_l_k, _w_h_o, and _w_r_i_t_e require that they all use the same format.

       The ppccppuu field indicates that the CPU time available is determined in
       an unspecified manner. This is because it is difficult to express an
       algorithm that is useful across all possible machine architectures.
       Historical counterparts to this value have attempted to show percentage
       of use in the recent past, such as the preceding minute. Frequently,
       these values for all processes did not add up to 100%. Implementations
       are encouraged to provide data in this field to users that will help
       them identify processes currently affecting the performance of the
       system.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _k_i_l_l, _n_i_c_e, _r_e_n_i_c_e

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



IEEE/The Open Group                  2013                               PS(1P)
