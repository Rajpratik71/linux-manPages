TOUCH(1P)                  POSIX Programmer's Manual                 TOUCH(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       touch — change file access and modification times

SSYYNNOOPPSSIISS
       touch [[−acm]] [[−r _r_e_f___f_i_l_e|−t _t_i_m_e|−d _d_a_t_e___t_i_m_e]] _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _t_o_u_c_h utility shall change the last data modification timestamps,
       the last data access timestamps, or both.

       The time used can be specified by the −−tt _t_i_m_e option-argument, the
       corresponding _t_i_m_e fields of the file referenced by the −−rr _r_e_f___f_i_l_e
       option-argument, or the −−dd _d_a_t_e___t_i_m_e option-argument, as specified in
       the following sections. If none of these are specified, _t_o_u_c_h shall use
       the current time.

       For each _f_i_l_e operand, _t_o_u_c_h shall perform actions equivalent to the
       following functions defined in the System Interfaces volume of
       POSIX.1‐2008:

        1. If _f_i_l_e does not exist:

            a. The _c_r_e_a_t() function is called with the following arguments:

               --  The _f_i_l_e operand is used as the _p_a_t_h argument.

               --  The value of the bitwise-inclusive OR of S_IRUSR, S_IWUSR,
                   S_IRGRP, S_IWGRP, S_IROTH, and S_IWOTH is used as the _m_o_d_e
                   argument.

            b. The _f_u_t_i_m_e_n_s() function is called with the following arguments:

               --  The file descriptor opened in step 1a.

               --  The access time and the modification time, set as described
                   in the OPTIONS section, are used as the first and second
                   elements of the _t_i_m_e_s array argument, respectively.

        2. If _f_i_l_e exists, the _u_t_i_m_e_n_s_a_t() function is called with the
           following arguments:

            a. The AT_FDCWD special value is used as the _f_d argument.

            b. The _f_i_l_e operand is used as the _p_a_t_h argument.

            c. The access time and the modification time, set as described in
               the OPTIONS section, are used as the first and second elements
               of the _t_i_m_e_s array argument, respectively.

            d. The _f_l_a_g argument is set to zero.

OOPPTTIIOONNSS
       The _t_o_u_c_h utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−aa        Change the access time of _f_i_l_e.  Do not change the
                 modification time unless −−mm is also specified.

       −−cc        Do not create a specified _f_i_l_e if it does not exist. Do not
                 write any diagnostic messages concerning this condition.

       −−dd  _d_a_t_e___t_i_m_e
                 Use the specified _d_a_t_e___t_i_m_e instead of the current time. The
                 option-argument shall be a string of the form:


                     _Y_Y_Y_Y−_M_M−_D_DT_h_h:_m_m:_S_S[[._f_r_a_c]][[_t_z]]

                 or:


                     _Y_Y_Y_Y−_M_M−_D_DT_h_h:_m_m:_S_S[[,_f_r_a_c]][[_t_z]]

                 where:

                  *  _Y_Y_Y_Y are at least four decimal digits giving the year.

                  *  _M_M, _D_D, _h_h, _m_m, and _S_S are as with −−tt _t_i_m_e.

                  *  T is the time designator, and can be replaced by a single
                     <space>.

                  *  [._f_r_a_c] and [,_f_r_a_c] are either empty, or a <period> (''..'')
                     or a <comma> ('',,'') respectively, followed by one or more
                     decimal digits, specifying a fractional second.

                  *  [_t_z] is either empty, signifying local time, or the
                     letter ''ZZ'', signifying UTC. If [_t_z] is empty, the
                     resulting time shall be affected by the value of the _T_Z
                     environment variable.

                 If the resulting time precedes the Epoch, the behavior is
                 implementation-defined. If the time cannot be represented as
                 the file's timestamp, _t_o_u_c_h shall exit immediately with an
                 error status.

       −−mm        Change the modification time of _f_i_l_e.  Do not change the
                 access time unless −−aa is also specified.

       −−rr  _r_e_f___f_i_l_e
                 Use the corresponding time of the file named by the pathname
                 _r_e_f___f_i_l_e instead of the current time.

       −−tt  _t_i_m_e   Use the specified _t_i_m_e instead of the current time. The
                 option-argument shall be a decimal number of the form:


                     [[[[_C_C]]_Y_Y]]_M_M_D_D_h_h_m_m[[._S_S]]

                 where each two digits represents the following:

                 _M_M      The month of the year [01,12].

                 _D_D      The day of the month [01,31].

                 _h_h      The hour of the day [00,23].

                 _m_m      The minute of the hour [00,59].

                 _C_C      The first two digits of the year (the century).

                 _Y_Y      The second two digits of the year.

                 _S_S      The second of the minute [00,60].

                 Both _C_C and _Y_Y shall be optional. If neither is given, the
                 current year shall be assumed. If _Y_Y is specified, but _C_C is
                 not, _C_C shall be derived as follows:

                                 +----------+----------------+
                                 |IIff _Y_Y iiss:: |  _C_C bbeeccoommeess::   |
                                 +----------+----------------+
                                 | [69,99]  | 19             |
                                 | [00,68]  | 20             |
                                 +----------+----------------+
                 NNoottee::     It is expected that in a future version of this
                           standard the default century inferred from a
                           2-digit year will change. (This would apply to all
                           commands accepting a 2-digit year as input.)

                 The resulting time shall be affected by the value of the _T_Z
                 environment variable. If the resulting time value precedes
                 the Epoch, the behavior is implementation-defined. If the
                 time is out of range for the file's timestamp, _t_o_u_c_h shall
                 exit immediately with an error status. The range of valid
                 times past the Epoch is implementation-defined, but it shall
                 extend to at least the time 0 hours, 0 minutes, 0 seconds,
                 January 1, 2038, Coordinated Universal Time. Some
                 implementations may not be able to represent dates beyond
                 January 18, 2038, because they use ssiiggnneedd iinntt as a time
                 holder.

                 The range for _S_S is [00,60] rather than [00,59] because of
                 leap seconds. If _S_S is 60, and the resulting time, as
                 affected by the _T_Z environment variable, does not refer to a
                 leap second, the resulting time shall be one second after a
                 time where _S_S is 59. If _S_S is not given a value, it is
                 assumed to be zero.

       If neither the −−aa nor −−mm options were specified, _t_o_u_c_h shall behave as
       if both the −−aa and −−mm options were specified.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _f_i_l_e      A pathname of a file whose times shall be modified.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _t_o_u_c_h:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone to be used for interpreting the _t_i_m_e
                 option-argument. If _T_Z is unset or null, an unspecified
                 default timezone shall be used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Not used.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The utility executed successfully and all requested changes were
             made.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The interpretation of time is taken to be _s_e_c_o_n_d_s _s_i_n_c_e _t_h_e _E_p_o_c_h (see
       the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _4_._1_5, _S_e_c_o_n_d_s
       _S_i_n_c_e _t_h_e _E_p_o_c_h).  It should be noted that implementations conforming
       to the System Interfaces volume of POSIX.1‐2008 do not take leap
       seconds into account when computing seconds since the Epoch. When _S_S=60
       is used, the resulting time always refers to 1 plus _s_e_c_o_n_d_s _s_i_n_c_e _t_h_e
       _E_p_o_c_h for a time when _S_S=59.

       Although the −−tt _t_i_m_e option-argument specifies values in 1969, the
       access time and modification time fields are defined in terms of
       seconds since the Epoch (00:00:00 on 1 January 1970 UTC). Therefore,
       depending on the value of _T_Z when _t_o_u_c_h is run, there is never more
       than a few valid hours in 1969 and there need not be any valid times in
       1969.

       One ambiguous situation occurs if −−tt _t_i_m_e is not specified, −−rr _r_e_f___f_i_l_e
       is not specified, and the first operand is an eight or ten-digit
       decimal number. A portable script can avoid this problem by using:


           ttoouucchh −−−− ffiillee

       or:


           ttoouucchh ..//ffiillee

       in this case.

       If the _T time designator is replaced by a <space> for the −−dd _d_a_t_e___t_i_m_e
       option-argument, the <space> must be quoted to prevent the shell from
       splitting the argument.

EEXXAAMMPPLLEESS
       Create or update a file called ddwwcc; the resulting file has both the
       last data modification and last data access timestamps set to November
       12, 2007 at 10:15:30 local time:


           ttoouucchh −−dd 22000077--1111--1122TT1100::1155::3300 ddwwcc

       Create or update a file called nniicckk; the resulting file has both the
       last data modification and last data access timestamps set to November
       12, 2007 at 10:15:30 UTC:


           ttoouucchh −−dd 22000077--1111--1122TT1100::1155::3300ZZ nniicckk

       Create or update a file called ggwwcc; the resulting file has both the
       last data modification and last data access timestamps set to November
       12, 2007 at 10:15:30 local time with a fractional second timestamp of
       .002 seconds:


           ttoouucchh −−dd 22000077--1111--1122TT1100::1155::3300,,000022 ggwwcc

       Create or update a file called aajjoosseeyy; the resulting file has both the
       last data modification and last data access timestamps set to November
       12, 2007 at 10:15:30 UTC with a fractional second timestamp of .002
       seconds:


           ttoouucchh −−dd ""22000077--1111--1122 1100::1155::3300..000022ZZ"" aajjoosseeyy

       Create or update a file called ccaatthhyy; the resulting file has both the
       last data modification and last data access timestamps set to November
       12, 2007 at 10:15:00 local time:


           ttoouucchh −−tt 220000771111112211001155 ccaatthhyy

       Create or update a file called ddrreeppppeerr; the resulting file has both the
       last data modification and last data access timestamps set to November
       12, 2007 at 10:15:30 local time:


           ttoouucchh −−tt 220000771111112211001155..3300 ddrreeppppeerr

       Create or update a file called eebbbb99; the resulting file has both the
       last data modification and last data access timestamps set to November
       12, 2007 at 10:15:30 local time:


           ttoouucchh −−tt 00771111112211001155..3300 eebbbb99

       Create or update a file called eeggggeerrtt; the resulting file has the last
       data access timestamp set to the corresponding time of the file named
       mmaarrkk instead of the current time. If the file exists, the last data
       modification time is not changed:


           ttoouucchh −−aa −−rr mmaarrkk eeggggeerrtt

RRAATTIIOONNAALLEE
       The functionality of _t_o_u_c_h is described almost entirely through
       references to functions in the System Interfaces volume of
       POSIX.1‐2008. In this way, there is no duplication of effort required
       for describing such side-effects as the relationship of user IDs to the
       user database, permissions, and so on.

       There are some significant differences between the _t_o_u_c_h utility in
       this volume of POSIX.1‐2008 and those in System V and BSD systems. They
       are upwards-compatible for historical applications from both
       implementations:

        1. In System V, an ambiguity exists when a pathname that is a decimal
           number leads the operands; it is treated as a time value. In BSD,
           no _t_i_m_e value is allowed; files may only be _t_o_u_c_hed to the current
           time. The −−tt _t_i_m_e construct solves these problems for future
           conforming applications (note that the −−tt option is not historical
           practice).

        2. The inclusion of the century digits, _C_C, is also new. Note that a
           ten-digit _t_i_m_e value is treated as if _Y_Y, and not _C_C, were
           specified. The caveat about the range of dates following the Epoch
           was included as recognition that some implementations are not able
           to represent dates beyond 18 January 2038 because they use ssiiggnneedd
           iinntt as a time holder.

       The −−rr option was added because several comments requested this
       capability.  This option was named −−ff in an early proposal, but was
       changed because the −−ff option is used in the BSD version of _t_o_u_c_h with
       a different meaning.

       At least one historical implementation of _t_o_u_c_h incremented the exit
       code if −−cc was specified and the file did not exist. This volume of
       POSIX.1‐2008 requires exit status zero if no errors occur.

       In previous version of the standard, if at least two operands are
       specified, and the first operand is an eight or ten-digit decimal
       integer, the first operand was assumed to be a _d_a_t_e___t_i_m_e operand. This
       usage was removed in this version of the standard since it had been
       marked obsolescent previously.

       The −−dd _d_a_t_e___t_i_m_e format is an ISO 8601:2004 standard complete
       representation of date and time extended format with an optional
       decimal point or <comma> followed by a string of digits following the
       seconds portion to specify fractions of a second. It is not necessary
       to recognize ""[[++//--]]hhhh::mmmm"" and ""[[++//--]]hhhh"" to specify timezones other than
       local time and UTC. The _T time designator in the ISO 8601:2004 standard
       extended format may be replaced by <space>.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _d_a_t_e

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _4_._1_5, _S_e_c_o_n_d_s
       _S_i_n_c_e _t_h_e _E_p_o_c_h, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2,
       _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, <<ssyyss__ssttaatt..hh>>

       The System Interfaces volume of POSIX.1‐2008, _c_r_e_a_t(), _f_u_t_i_m_e_n_s(),
       _t_i_m_e(), _u_t_i_m_e()

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



IEEE/The Open Group                  2013                            TOUCH(1P)
