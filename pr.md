PR(1P)                     POSIX Programmer's Manual                    PR(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       pr — print files

SSYYNNOOPPSSIISS
       pr [[+_p_a_g_e]] [[−_c_o_l_u_m_n]] [[−adFmrt]] [[−e[[_c_h_a_r]][[_g_a_p]]]] [[−h _h_e_a_d_e_r]] [[−i[[_c_h_a_r]][[_g_a_p]]]]
           [[−l _l_i_n_e_s]] [[−n[[_c_h_a_r]][[_w_i_d_t_h]]]] [[−o _o_f_f_s_e_t]] [[−s[[_c_h_a_r]]]] [[−w _w_i_d_t_h]] [[−fp]]
           [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _p_r utility is a printing and pagination filter. If multiple input
       files are specified, each shall be read, formatted, and written to
       standard output. By default, the input shall be separated into 66-line
       pages, each with:

        *  A 5-line header that includes the page number, date, time, and the
           pathname of the file

        *  A 5-line trailer consisting of blank lines

       If standard output is associated with a terminal, diagnostic messages
       shall be deferred until the _p_r utility has completed processing.

       When options specifying multi-column output are specified, output text
       columns shall be of equal width; input lines that do not fit into a
       text column shall be truncated. By default, text columns shall be
       separated with at least one <blank>.

OOPPTTIIOONNSS
       The _p_r utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, except that: the
       _p_a_g_e option has a ''++'' delimiter; _p_a_g_e and _c_o_l_u_m_n can be multi-digit
       numbers; some of the option-arguments are optional; and some of the
       option-arguments cannot be specified as separate arguments from the
       preceding option letter. In particular, the −−ss option does not allow
       the option letter to be separated from its argument, and the options
       −−ee, −−ii, and −−nn require that both arguments, if present, not be
       separated from the option letter.

       The following options shall be supported. In the following option
       descriptions, _c_o_l_u_m_n, _l_i_n_e_s, _o_f_f_s_e_t, _p_a_g_e, and _w_i_d_t_h are positive
       decimal integers; _g_a_p is a non-negative decimal integer.

       ++_p_a_g_e     Begin output at page number _p_a_g_e of the formatted input.

       −−_c_o_l_u_m_n   Produce multi-column output that is arranged in _c_o_l_u_m_n
                 columns (the default shall be 1) and is written down each
                 column in the order in which the text is received from the
                 input file. This option should not be used with −−mm.  The
                 options −−ee and −−ii shall be assumed for multiple text-column
                 output. Whether or not text columns are produced with
                 identical vertical lengths is unspecified, but a text column
                 shall never exceed the length of the page (see the −−ll
                 option). When used with −−tt, use the minimum number of lines
                 to write the output.

       −−aa        Modify the effect of the −−_c_o_l_u_m_n option so that the columns
                 are filled across the page in a round-robin order (for
                 example, when _c_o_l_u_m_n is 2, the first input line heads column
                 1, the second heads column 2, the third is the second line in
                 column 1, and so on).

       −−dd        Produce output that is double-spaced; append an extra
                 <newline> following every <newline> found in the input.

       −−ee[[_c_h_a_r]][[_g_a_p]]
                 Expand each input <tab> to the next greater column position
                 specified by the formula _n*_g_a_p+1, where _n is an integer > 0.
                 If _g_a_p is zero or is omitted, it shall default to 8. All
                 <tab> characters in the input shall be expanded into the
                 appropriate number of <space> characters. If any non-digit
                 character, _c_h_a_r, is specified, it shall be used as the input
                 <tab>.  If the first character of the −−ee option-argument is a
                 digit, the entire option-argument shall be assumed to be _g_a_p.

       −−ff        Use a <form-feed> for new pages, instead of the default
                 behavior that uses a sequence of <newline> characters. Pause
                 before beginning the first page if the standard output is
                 associated with a terminal.

       −−FF        Use a <form-feed> for new pages, instead of the default
                 behavior that uses a sequence of <newline> characters.

       −−hh  _h_e_a_d_e_r Use the string _h_e_a_d_e_r to replace the contents of the _f_i_l_e
                 operand in the page header.

       −−ii[[_c_h_a_r]][[_g_a_p]]
                 In output, replace <space> characters with <tab> characters
                 wherever one or more adjacent <space> characters reach column
                 positions _g_a_p+1, 2* _g_a_p+1, 3* _g_a_p+1, and so on. If _g_a_p is
                 zero or is omitted, default tab settings at every eighth
                 column position shall be assumed. If any non-digit character,
                 _c_h_a_r, is specified, it shall be used as the output <tab>.  If
                 the first character of the −−ii option-argument is a digit, the
                 entire option-argument shall be assumed to be _g_a_p.

       −−ll  _l_i_n_e_s  Override the 66-line default and reset the page length to
                 _l_i_n_e_s.  If _l_i_n_e_s is not greater than the sum of both the
                 header and trailer depths (in lines), the _p_r utility shall
                 suppress both the header and trailer, as if the −−tt option
                 were in effect.

       −−mm        Merge files. Standard output shall be formatted so the _p_r
                 utility writes one line from each file specified by a _f_i_l_e
                 operand, side by side into text columns of equal fixed
                 widths, in terms of the number of column positions.
                 Implementations shall support merging of at least nine _f_i_l_e
                 operands.

       −−nn[[_c_h_a_r]][[_w_i_d_t_h]]
                 Provide _w_i_d_t_h-digit line numbering (default for _w_i_d_t_h shall
                 be 5). The number shall occupy the first _w_i_d_t_h column
                 positions of each text column of default output or each line
                 of −−mm output. If _c_h_a_r (any non-digit character) is given, it
                 shall be appended to the line number to separate it from
                 whatever follows (default for _c_h_a_r is a <tab>).

       −−oo  _o_f_f_s_e_t Each line of output shall be preceded by offset <space>
                 characters. If the −−oo option is not specified, the default
                 offset shall be zero. The space taken is in addition to the
                 output line width (see the −−ww option below).

       −−pp        Pause before beginning each page if the standard output is
                 directed to a terminal (_p_r shall write an <alert> to standard
                 error and wait for a <carriage-return> to be read on
                 //ddeevv//ttttyy).

       −−rr        Write no diagnostic reports on failure to open files.

       −−ss[[_c_h_a_r]]  Separate text columns by the single character _c_h_a_r instead of
                 by the appropriate number of <space> characters (default for
                 _c_h_a_r shall be <tab>).

       −−tt        Write neither the five-line identifying header nor the five-
                 line trailer usually supplied for each page. Quit writing
                 after the last line of each file without spacing to the end
                 of the page.

       −−ww  _w_i_d_t_h  Set the width of the line to _w_i_d_t_h column positions for
                 multiple text-column output only. If the −−ww option is not
                 specified and the −−ss option is not specified, the default
                 width shall be 72. If the −−ww option is not specified and the
                 −−ss option is specified, the default width shall be 512.

                 For single column output, input lines shall not be truncated.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a file to be written. If no _f_i_l_e operands are
                 specified, or if a _f_i_l_e operand is ''−−'', the standard input
                 shall be used.

SSTTDDIINN
       The standard input shall be used only if no _f_i_l_e operands are
       specified, or if a _f_i_l_e operand is ''−−''.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files shall be text files.

       The file //ddeevv//ttttyy shall be used to read responses required by the −−pp
       option.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _p_r:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s the precedence of internationalization variables
                 used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments and input
                 files) and which characters are defined as printable
                 (character class pprriinntt).  Non-printable characters are still
                 written to standard output, but are not counted for the
                 purpose for column-width and line-length calculations.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _L_C___T_I_M_E   Determine the format of the date and time for use in writing
                 header lines.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone used to calculate date and time
                 strings written in header lines. If _T_Z is unset or null, an
                 unspecified default timezone shall be used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       If _p_r receives an interrupt while writing to a terminal, it shall flush
       all accumulated error messages to the screen before terminating.

SSTTDDOOUUTT
       The _p_r utility output shall be a paginated version of the original file
       (or files). This pagination shall be accomplished using either <form-
       feed> characters or a sequence of <newline> characters, as controlled
       by the −−FF or −−ff option. Page headers shall be generated unless the −−tt
       option is specified. The page headers shall be of the form:


           ""\\nn\\nn%%ss %%ss PPaaggee %%dd\\nn\\nn\\nn"",, <<_o_u_t_p_u_t _o_f _d_a_t_e>>,, <<_f_i_l_e>, <_p_a_g_e _n_u_m_b_e_r>

       In the POSIX locale, the <_o_u_t_p_u_t_ _o_f_ _d_a_t_e> field, representing the date
       and time of last modification of the input file (or the current date
       and time if the input file is standard input), shall be equivalent to
       the output of the following command as it would appear if executed at
       the given time:


           ddaattee ""++%%bb %%ee %%HH::%%MM %%YY""

       without the trailing <newline>, if the page being written is from
       standard input. If the page being written is not from standard input,
       in the POSIX locale, the same format shall be used, but the time used
       shall be the modification time of the file corresponding to _f_i_l_e
       instead of the current time. When the _L_C___T_I_M_E locale category is not
       set to the POSIX locale, a different format and order of presentation
       of this field may be used.

       If the standard input is used instead of a _f_i_l_e operand, the <_f_i_l_e>
       field shall be replaced by a null string.

       If the −−hh option is specified, the <_f_i_l_e> field shall be replaced by
       the _h_e_a_d_e_r argument.

SSTTDDEERRRR
       The standard error shall be used for diagnostic messages and for
       alerting the terminal when −−pp is specified.

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
       A conforming application must protect its first operand, if it starts
       with a <plus-sign>, by preceding it with the ""−−−−"" argument that denotes
       the end of the options. For example, _p_r+_x could be interpreted as an
       invalid page number or a _f_i_l_e operand.

EEXXAAMMPPLLEESS
        1. Print a numbered list of all files in the current directory:


               llss −−aa || pprr −−nn −−hh ""FFiilleess iinn $$((ppwwdd))..""

        2. Print ffiillee11 and ffiillee22 as a double-spaced, three-column listing
           headed by ``file list'':


               pprr −−33dd −−hh ""ffiillee lliisstt"" ffiillee11 ffiillee22

        3. Write ffiillee11 on ffiillee22, expanding tabs to columns 10, 19, 28, ...:


               pprr −−ee99 −−tt <<ffiillee11 >>ffiillee22

RRAATTIIOONNAALLEE
       This utility is one of those that does not follow the Utility Syntax
       Guidelines because of its historical origins. The standard developers
       could have added new options that obeyed the guidelines (and marked the
       old options obsolescent) or devised an entirely new utility; there are
       examples of both actions in this volume of POSIX.1‐2008. Because of its
       widespread use by historical applications, the standard developers
       decided to exempt this version of _p_r from many of the guidelines.

       Implementations are required to accept option-arguments to the −−hh, −−ll,
       −−oo, and −−ww options whether presented as part of the same argument or as
       a separate argument to _p_r, as suggested by the Utility Syntax
       Guidelines. The −−nn and −−ss options, however, are specified as in
       historical practice because they are frequently specified without their
       optional arguments. If a <blank> were allowed before the option-
       argument in these cases, a _f_i_l_e operand could mistakenly be interpreted
       as an option-argument in historical applications.

       The text about the minimum number of lines in multi-column output was
       included to ensure that a best effort is made in balancing the length
       of the columns. There are known historical implementations in which,
       for example, 60-line files are listed by _p_r −2 as one column of 56
       lines and a second of 4. Although this is not a problem when a full
       page with headers and trailers is produced, it would be relatively
       useless when used with −−tt.

       Historical implementations of the _p_r utility have differed in the
       action taken for the −−ff option. BSD uses it as described here for the
       −−FF option; System V uses it to change trailing <newline> characters on
       each page to a <form-feed> and, if standard output is a TTY device,
       sends an <alert> to standard error and reads a line from //ddeevv//ttttyy
       before the first page. There were strong arguments from both sides of
       this issue concerning historical practice and as a result the −−FF option
       was added. XSI-conformant systems support the System V historical
       actions for the −−ff option.

       The <_o_u_t_p_u_t_ _o_f_ _d_a_t_e> field in the −−ll format is specified only for the
       POSIX locale. As noted, the format can be different in other locales.
       No mechanism for defining this is present in this volume of
       POSIX.1‐2008, as the appropriate vehicle is a message catalog; that is,
       the format should be specified as a ``message''.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _e_x_p_a_n_d, _l_p

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



IEEE/The Open Group                  2013                               PR(1P)
