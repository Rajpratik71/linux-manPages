DATE(1P)                   POSIX Programmer's Manual                  DATE(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       date — write the date and time

SSYYNNOOPPSSIISS
       date [[−u]] [[+_f_o_r_m_a_t]]

       date [[−u]] _m_m_d_d_h_h_m_m[[[[_c_c]]_y_y]]

DDEESSCCRRIIPPTTIIOONN
       The _d_a_t_e utility shall write the date and time to standard output or
       attempt to set the system date and time.  By default, the current date
       and time shall be written. If an operand beginning with ''++'' is
       specified, the output format of _d_a_t_e shall be controlled by the
       conversion specifications and other text in the operand.

OOPPTTIIOONNSS
       The _d_a_t_e utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−uu        Perform operations as if the _T_Z environment variable was set
                 to the string ""UUTTCC00"", or its equivalent historical value of
                 ""GGMMTT00"".  Otherwise, _d_a_t_e shall use the timezone indicated by
                 the _T_Z environment variable or the system default if that
                 variable is unset or null.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       +_f_o_r_m_a_t   When the format is specified, each conversion specifier shall
                 be replaced in the standard output by its corresponding
                 value. All other characters shall be copied to the output
                 without change. The output shall always be terminated with a
                 <newline>.

   CCoonnvveerrssiioonn SSppeecciiffiiccaattiioonnss

                 %a      Locale's abbreviated weekday name.

                 %A      Locale's full weekday name.

                 %b      Locale's abbreviated month name.

                 %B      Locale's full month name.

                 %c      Locale's appropriate date and time representation.

                 %C      Century (a year divided by 100 and truncated to an
                         integer) as a decimal number [00,99].

                 %d      Day of the month as a decimal number [01,31].

                 %D      Date in the format _m_m/_d_d/_y_y.

                 %e      Day of the month as a decimal number [1,31] in a two-
                         digit field with leading <space> character fill.

                 %h      A synonym for %%bb.

                 %H      Hour (24-hour clock) as a decimal number [00,23].

                 %I      Hour (12-hour clock) as a decimal number [01,12].

                 %j      Day of the year as a decimal number [001,366].

                 %m      Month as a decimal number [01,12].

                 %M      Minute as a decimal number [00,59].

                 %n      A <newline>.

                 %p      Locale's equivalent of either AM or PM.

                 %r      12-hour clock time [01,12] using the AM/PM notation;
                         in the POSIX locale, this shall be equivalent to
                         %%II:%%MM:%%SS %%pp.

                 %S      Seconds as a decimal number [00,60].

                 %t      A <tab>.

                 %T      24-hour clock time [00,23] in the format _H_H:_M_M:_S_S.

                 %u      Weekday as a decimal number [1,7] (1=Monday).

                 %U      Week of the year (Sunday as the first day of the
                         week) as a decimal number [00,53]. All days in a new
                         year preceding the first Sunday shall be considered
                         to be in week 0.

                 %V      Week of the year (Monday as the first day of the
                         week) as a decimal number [01,53]. If the week
                         containing January 1 has four or more days in the new
                         year, then it shall be considered week 1; otherwise,
                         it shall be the last week of the previous year, and
                         the next week shall be week 1.

                 %w      Weekday as a decimal number [0,6] (0=Sunday).

                 %W      Week of the year (Monday as the first day of the
                         week) as a decimal number [00,53]. All days in a new
                         year preceding the first Monday shall be considered
                         to be in week 0.

                 %x      Locale's appropriate date representation.

                 %X      Locale's appropriate time representation.

                 %y      Year within century [00,99].

                 %Y      Year with century as a decimal number.

                 %Z      Timezone name, or no characters if no timezone is
                         determinable.

                 %%      A <percent-sign> character.

                 See the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n
                 _7_._3_._5, _L_C___T_I_M_E for the conversion specifier values in the
                 POSIX locale.

   MMooddiiffiieedd CCoonnvveerrssiioonn SSppeecciiffiiccaattiioonnss
       Some conversion specifiers can be modified by the EE and OO modifier
       characters to indicate a different format or specification as specified
       in the _L_C___T_I_M_E locale description (see the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _7_._3_._5, _L_C___T_I_M_E).  If the corresponding keyword
       (see eerraa, eerraa__yyeeaarr, eerraa__dd__ffmmtt, and aalltt__ddiiggiittss in the Base Definitions
       volume of POSIX.1‐2008, _S_e_c_t_i_o_n _7_._3_._5, _L_C___T_I_M_E) is not specified or not
       supported for the current locale, the unmodified conversion specifier
       value shall be used.

       %Ec     Locale's alternative appropriate date and time representation.

       %EC     The name of the base year (period) in the locale's alternative
               representation.

       %Ex     Locale's alternative date representation.

       %EX     Locale's alternative time representation.

       %Ey     Offset from %%EECC (year only) in the locale's alternative
               representation.

       %EY     Full alternative year representation.

       %Od     Day of month using the locale's alternative numeric symbols.

       %Oe     Day of month using the locale's alternative numeric symbols.

       %OH     Hour (24-hour clock) using the locale's alternative numeric
               symbols.

       %OI     Hour (12-hour clock) using the locale's alternative numeric
               symbols.

       %Om     Month using the locale's alternative numeric symbols.

       %OM     Minutes using the locale's alternative numeric symbols.

       %OS     Seconds using the locale's alternative numeric symbols.

       %Ou     Weekday as a number in the locale's alternative representation
               (Monday = 1).

       %OU     Week number of the year (Sunday as the first day of the week)
               using the locale's alternative numeric symbols.

       %OV     Week number of the year (Monday as the first day of the week,
               rules corresponding to %%VV), using the locale's alternative
               numeric symbols.

       %Ow     Weekday as a number in the locale's alternative representation
               (Sunday = 0).

       %OW     Week number of the year (Monday as the first day of the week)
               using the locale's alternative numeric symbols.

       %Oy     Year (offset from %%CC) in alternative representation.

       _m_m_d_d_h_h_m_m[[[[_c_c]]_y_y]]
                 Attempt to set the system date and time from the value given
                 in the operand. This is only possible if the user has
                 appropriate privileges and the system permits the setting of
                 the system date and time. The first _m_m is the month (number);
                 _d_d is the day (number); _h_h is the hour (number, 24-hour
                 system); the second _m_m is the minute (number); _c_c is the
                 century and is the first two digits of the year (this is
                 optional); _y_y is the last two digits of the year and is
                 optional. If century is not specified, then values in the
                 range [69,99] shall refer to years 1969 to 1999 inclusive,
                 and values in the range [00,68] shall refer to years 2000 to
                 2068 inclusive. The current year is the default if _y_y is
                 omitted.

                 NNoottee::     It is expected that in a future version of this
                           standard the default century inferred from a
                           2-digit year will change. (This would apply to all
                           commands accepting a 2-digit year as input.)

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _d_a_t_e:

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

       _L_C___T_I_M_E   Determine the format and contents of date and time strings
                 written by _d_a_t_e.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone in which the time and date are
                 written, unless the −−uu option is specified. If the _T_Z
                 variable is unset or null and −−uu is not specified, an
                 unspecified system default timezone is used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       When no formatting operand is specified, the output in the POSIX locale
       shall be equivalent to specifying:


           ddaattee ""++%%aa %%bb %%ee %%HH::%%MM::%%SS %%ZZ %%YY""

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The date was written successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Conversion specifiers are of unspecified format when not in the POSIX
       locale. Some of them can contain <newline> characters in some locales,
       so it may be difficult to use the format shown in standard output for
       parsing the output of _d_a_t_e in those locales.

       The range of values for %%SS extends from 0 to 60 seconds to accommodate
       the occasional leap second.

       Although certain of the conversion specifiers in the POSIX locale (such
       as the name of the month) are shown with initial capital letters, this
       need not be the case in other locales. Programs using these fields may
       need to adjust the capitalization if the output is going to be used at
       the beginning of a sentence.

       The date string formatting capabilities are intended for use in
       Gregorian-style calendars, possibly with a different starting year (or
       years). The %%xx and %%cc conversion specifications, however, are intended
       for local representation; these may be based on a different, non-
       Gregorian calendar.

       The %%CC conversion specification was introduced to allow a fallback for
       the %%EECC (alternative year format base year); it can be viewed as the
       base of the current subdivision in the Gregorian calendar. The century
       number is calculated as the year divided by 100 and truncated to an
       integer; it should not be confused with the use of ordinal numbers for
       centuries (for example, ``twenty-first century''.) Both the %%EEyy and %%yy
       can then be viewed as the offset from %%EECC and %%CC, respectively.

       The EE and OO modifiers modify the traditional conversion specifiers, so
       that they can always be used, even if the implementation (or the
       current locale) does not support the modifier.

       The EE modifier supports alternative date formats, such as the Japanese
       Emperor's Era, as long as these are based on the Gregorian calendar
       system. Extending the EE modifiers to other date elements may provide an
       implementation-defined extension capable of supporting other calendar
       systems, especially in combination with the OO modifier.

       The OO modifier supports time and date formats using the locale's
       alternative numerical symbols, such as Kanji or Hindi digits or ordinal
       number representation.

       Non-European locales, whether they use Latin digits in computational
       items or not, often have local forms of the digits for use in date
       formats. This is not totally unknown even in Europe; a variant of dates
       uses Roman numerals for the months: the third day of September 1991
       would be written as 3.IX.1991. In Japan, Kanji digits are regularly
       used for dates; in Arabic-speaking countries, Hindi digits are used.
       The %%dd, %%ee, %%HH, %%II, %%mm, %%SS, %%UU, %%ww, %%WW, and %%yy conversion
       specifications always return the date and time field in Latin digits
       (that is, 0 to 9). The %%OO modifier was introduced to support the use
       for display purposes of non-Latin digits. In the _L_C___T_I_M_E category in
       _l_o_c_a_l_e_d_e_f, the optional aalltt__ddiiggiittss keyword is intended for this
       purpose. As an example, assume the following (partial) _l_o_c_a_l_e_d_e_f
       source:


           aalltt__ddiiggiittss  """";;""II"";;""IIII"";;""IIIIII"";;""IIVV"";;""VV"";;""VVII"";;""VVIIII"";;""VVIIIIII"" \\
                       ""IIXX"";;""XX"";;""XXII"";;""XXIIII""
           dd__ffmmtt       ""%%ee..%%OOmm..%%YY""

       With the above date, the command:


           ddaattee ""++%%xx""

       would yield 3.IX.1991. With the same dd__ffmmtt, but without the aalltt__ddiiggiittss,
       the command would yield 3.9.1991.

EEXXAAMMPPLLEESS
        1. The following are input/output examples of _d_a_t_e used at arbitrary
           times in the POSIX locale:


               $$ date
               TTuuee JJuunn 2266 0099::5588::1100 PPDDTT 11999900

               $$ date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"
               DDAATTEE:: 1111//0022//9911
               TTIIMMEE:: 1133::3366::1166

               $$ date "+TIME: %r"
               TTIIMMEE:: 0011::3366::3322 PPMM

        2. Examples for Denmark, where the default date and time format is %%aa
           %%dd %%bb %%YY %%TT %%ZZ:


               $$ LANG=da_DK.iso_8859−1 date
               oonnss 0022 ookktt 11999911 1155::0033::3322 CCEETT

               $$ LANG=da_DK.iso_8859−1 \
                   date "+DATO: %A den %e. %B %Y%nKLOKKEN: %H:%M:%S"
               DDAATTOO:: oonnssddaagg ddeenn 22.. ookkttoobbeerr 11999911
               KKLLOOKKKKEENN:: 1155::0033::5566

        3. Examples for Germany, where the default date and time format is %%aa
           %%dd.%%hh.%%YY, %%TT %%ZZ:


               $$ LANG=De_DE.88591 date
               MMii 0022..OOkktt..11999911,, 1155::0011::2211 MMEEZZ

               $$ LANG=De_DE.88591 date "+DATUM: %A, %d. %B %Y%nZEIT: %H:%M:%S"
               DDAATTUUMM:: MMiittttwwoocchh,, 0022.. OOkkttoobbeerr 11999911
               ZZEEIITT:: 1155::0022::0022

        4. Examples for France, where the default date and time format is %%aa
           %%dd %%hh %%YY %%ZZ %%TT:


               $$ LANG=Fr_FR.88591 date
               MMeerr 0022 oocctt 11999911 MMEETT 1155::0033::3322

               $$ LANG=Fr_FR.88591 date "+JOUR: %A %d %B %Y%nHEURE: %H:%M:%S"
               JJOOUURR:: MMeerrccrreeddii 0022 ooccttoobbrree 11999911
               HHEEUURREE:: 1155::0033::5566

RRAATTIIOONNAALLEE
       Some of the new options for formatting are from the ISO C standard. The
       −−uu option was introduced to allow portable access to Coordinated
       Universal Time (UTC).  The string ""GGMMTT00"" is allowed as an equivalent _T_Z
       value to be compatible with all of the systems using the BSD
       implementation, where this option originated.

       The %%ee format conversion specification (adopted from System V) was
       added because the ISO C standard conversion specifications did not
       provide any way to produce the historical default _d_a_t_e output during
       the first nine days of any month.

       There are two varieties of day and week numbering supported (in
       addition to any others created with the locale-dependent %%EE and %%OO
       modifier characters):

        *  The historical variety in which Sunday is the first day of the week
           and the weekdays preceding the first Sunday of the year are
           considered week 0. These are represented by %%ww and %%UU.  A variant
           of this is %%WW, using Monday as the first day of the week, but still
           referring to week 0. This view of the calendar was retained because
           so many historical applications depend on it and the ISO C standard
           _s_t_r_f_t_i_m_e() function, on which many _d_a_t_e implementations are based,
           was defined in this way.

        *  The international standard, based on the ISO 8601:2004 standard
           where Monday is the first weekday and the algorithm for the first
           week number is more complex: If the week (Monday to Sunday)
           containing January 1 has four or more days in the new year, then it
           is week 1; otherwise, it is week 53 of the previous year, and the
           next week is week 1. These are represented by the new conversion
           specifications %%uu and %%VV, added as a result of international
           comments.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _7_._3_._5, _L_C___T_I_M_E,
       _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
       _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _f_p_r_i_n_t_f(), _s_t_r_f_t_i_m_e()

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



IEEE/The Open Group                  2013                             DATE(1P)
