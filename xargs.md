XARGS(1P)                  POSIX Programmer's Manual                 XARGS(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       xargs — construct argument lists and invoke utility

SSYYNNOOPPSSIISS
       xargs [[−ptx]] [[−E _e_o_f_s_t_r]] [[−I _r_e_p_l_s_t_r|−L _n_u_m_b_e_r|−n _n_u_m_b_e_r]]
           [[−s _s_i_z_e]] [[_u_t_i_l_i_t_y [[_a_r_g_u_m_e_n_t...]]]]

DDEESSCCRRIIPPTTIIOONN
       The _x_a_r_g_s utility shall construct a command line consisting of the
       _u_t_i_l_i_t_y and _a_r_g_u_m_e_n_t operands specified followed by as many arguments
       read in sequence from standard input as fit in length and number
       constraints specified by the options. The _x_a_r_g_s utility shall then
       invoke the constructed command line and wait for its completion. This
       sequence shall be repeated until one of the following occurs:

        *  An end-of-file condition is detected on standard input.

        *  An argument consisting of just the logical end-of-file string (see
           the −−EE _e_o_f_s_t_r option) is found on standard input after double-quote
           processing, <apostrophe> processing, and <backslash>-escape
           processing (see next paragraph). All arguments up to but not
           including the argument consisting of just the logical end-of-file
           string shall be used as arguments in constructed command lines.

        *  An invocation of a constructed command line returns an exit status
           of 255.

       The application shall ensure that arguments in the standard input are
       separated by unquoted <blank> characters, unescaped <blank> characters,
       or <newline> characters. A string of zero or more non-double-quote
       (''""'') characters and non-<newline> characters can be quoted by
       enclosing them in double-quotes. A string of zero or more
       non-<apostrophe> (''\\'''') characters and non-<newline> characters can be
       quoted by enclosing them in <apostrophe> characters. Any unquoted
       character can be escaped by preceding it with a <backslash>.  The
       utility named by _u_t_i_l_i_t_y shall be executed one or more times until the
       end-of-file is reached or the logical end-of file string is found. The
       results are unspecified if the utility named by _u_t_i_l_i_t_y attempts to
       read from its standard input.

       The generated command line length shall be the sum of the size in bytes
       of the utility name and each argument treated as strings, including a
       null byte terminator for each of these strings. The _x_a_r_g_s utility shall
       limit the command line length such that when the command line is
       invoked, the combined argument and environment lists (see the _e_x_e_c
       family of functions in the System Interfaces volume of POSIX.1‐2008)
       shall not exceed {ARG_MAX}−2048 bytes. Within this constraint, if
       neither the −−nn nor the −−ss option is specified, the default command line
       length shall be at least {LINE_MAX}.

OOPPTTIIOONNSS
       The _x_a_r_g_s utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−EE  _e_o_f_s_t_r Use _e_o_f_s_t_r as the logical end-of-file string. If −−EE is not
                 specified, it is unspecified whether the logical end-of-file
                 string is the <underscore> character (''__'') or the end-of-file
                 string capability is disabled. When _e_o_f_s_t_r is the null
                 string, the logical end-of-file string capability shall be
                 disabled and <underscore> characters shall be taken
                 literally.

       −−II  _r_e_p_l_s_t_r
                 Insert mode: _u_t_i_l_i_t_y is executed for each logical line from
                 standard input. Arguments in the standard input shall be
                 separated only by unescaped <newline> characters, not by
                 <blank> characters. Any unquoted unescaped <blank> characters
                 at the beginning of each line shall be ignored. The resulting
                 argument shall be inserted in _a_r_g_u_m_e_n_t_s in place of each
                 occurrence of _r_e_p_l_s_t_r.  At least five arguments in _a_r_g_u_m_e_n_t_s
                 can each contain one or more instances of _r_e_p_l_s_t_r.  Each of
                 these constructed arguments cannot grow larger than an
                 implementation-defined limit greater than or equal to 255
                 bytes. Option −−xx shall be forced on.

       −−LL  _n_u_m_b_e_r The _u_t_i_l_i_t_y shall be executed for each non-empty _n_u_m_b_e_r lines
                 of arguments from standard input. The last invocation of
                 _u_t_i_l_i_t_y shall be with fewer lines of arguments if fewer than
                 _n_u_m_b_e_r remain. A line is considered to end with the first
                 <newline> unless the last character of the line is a <blank>;
                 a trailing <blank> signals continuation to the next non-empty
                 line, inclusive.

       −−nn  _n_u_m_b_e_r Invoke _u_t_i_l_i_t_y using as many standard input arguments as
                 possible, up to _n_u_m_b_e_r (a positive decimal integer) arguments
                 maximum. Fewer arguments shall be used if:

                  *  The command line length accumulated exceeds the size
                     specified by the −−ss option (or {LINE_MAX} if there is no
                     −−ss option).

                  *  The last iteration has fewer than _n_u_m_b_e_r, but not zero,
                     operands remaining.

       −−pp        Prompt mode: the user is asked whether to execute _u_t_i_l_i_t_y at
                 each invocation. Trace mode (−−tt) is turned on to write the
                 command instance to be executed, followed by a prompt to
                 standard error. An affirmative response read from //ddeevv//ttttyy
                 shall execute the command; otherwise, that particular
                 invocation of _u_t_i_l_i_t_y shall be skipped.

       −−ss  _s_i_z_e   Invoke _u_t_i_l_i_t_y using as many standard input arguments as
                 possible yielding a command line length less than _s_i_z_e (a
                 positive decimal integer) bytes. Fewer arguments shall be
                 used if:

                  *  The total number of arguments exceeds that specified by
                     the −−nn option.

                  *  The total number of lines exceeds that specified by the
                     −−LL option.

                  *  End-of-file is encountered on standard input before _s_i_z_e
                     bytes are accumulated.

                 Values of _s_i_z_e up to at least {LINE_MAX} bytes shall be
                 supported, provided that the constraints specified in the
                 DESCRIPTION are met. It shall not be considered an error if a
                 value larger than that supported by the implementation or
                 exceeding the constraints specified in the DESCRIPTION is
                 given; _x_a_r_g_s shall use the largest value it supports within
                 the constraints.

       −−tt        Enable trace mode. Each generated command line shall be
                 written to standard error just prior to invocation.

       −−xx        Terminate if a constructed command line will not fit in the
                 implied or specified size (see the −−ss option above).

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _u_t_i_l_i_t_y   The name of the utility to be invoked, found by search path
                 using the _P_A_T_H environment variable, described in the Base
                 Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
                 _V_a_r_i_a_b_l_e_s.  If _u_t_i_l_i_t_y is omitted, the default shall be the
                 _e_c_h_o utility. If the _u_t_i_l_i_t_y operand names any of the special
                 built-in utilities in _S_e_c_t_i_o_n _2_._1_4, _S_p_e_c_i_a_l _B_u_i_l_t_-_I_n
                 _U_t_i_l_i_t_i_e_s, the results are undefined.

       _a_r_g_u_m_e_n_t  An initial option or operand for the invocation of _u_t_i_l_i_t_y.

SSTTDDIINN
       The standard input shall be a text file. The results are unspecified if
       an end-of-file condition is detected immediately following an escaped
       <newline>.

IINNPPUUTT FFIILLEESS
       The file //ddeevv//ttttyy shall be used to read responses required by the −−pp
       option.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _x_a_r_g_s:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

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
                 files) and the behavior of character classes used in the
                 extended regular expression defined for the yyeesseexxpprr locale
                 keyword in the _L_C___M_E_S_S_A_G_E_S category.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale used to process affirmative responses,
                 and the locale used to affect the format and contents of
                 diagnostic messages and prompts written to standard error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _P_A_T_H      Determine the location of _u_t_i_l_i_t_y, as described in the Base
                 Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
                 _V_a_r_i_a_b_l_e_s.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       Not used.

SSTTDDEERRRR
       The standard error shall be used for diagnostic messages and the −−tt and
       −−pp options. If the −−tt option is specified, the _u_t_i_l_i_t_y and its
       constructed argument list shall be written to standard error, as it
       will be invoked, prior to invocation. If −−pp is specified, a prompt of
       the following format shall be written (in the POSIX locale):


           ""??......""

       at the end of the line of the output from −−tt.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

           0   All invocations of _u_t_i_l_i_t_y returned exit status zero.

       1‐125   A command line meeting the specified requirements could not be
               assembled, one or more of the invocations of _u_t_i_l_i_t_y returned a
               non-zero exit status, or some other error occurred.

         126   The utility specified by _u_t_i_l_i_t_y was found but could not be
               invoked.

         127   The utility specified by _u_t_i_l_i_t_y could not be found.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If a command line meeting the specified requirements cannot be
       assembled, the utility cannot be invoked, an invocation of the utility
       is terminated by a signal, or an invocation of the utility exits with
       exit status 255, the _x_a_r_g_s utility shall write a diagnostic message and
       exit without processing any remaining input.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The 255 exit status allows a utility being used by _x_a_r_g_s to tell _x_a_r_g_s
       to terminate if it knows no further invocations using the current data
       stream will succeed. Thus, _u_t_i_l_i_t_y should explicitly _e_x_i_t with an
       appropriate value to avoid accidentally returning with 255.

       Note that since input is parsed as lines, <blank> characters separate
       arguments, and <backslash>, <apostrophe>, and double-quote characters
       are used for quoting, if _x_a_r_g_s is used to bundle the output of commands
       like _f_i_n_d _d_i_r −−pprriinntt or _l_s into commands to be executed, unexpected
       results are likely if any filenames contain <blank>, <newline>, or
       quoting characters. This can be solved by using find to call a script
       that converts each file found into a quoted string that is then piped
       to _x_a_r_g_s, but in most cases it is preferable just to have _f_i_n_d do the
       argument aggregation itself by using −−eexxeecc with a ''++'' terminator
       instead of '';;''.  Note that the quoting rules used by _x_a_r_g_s are not the
       same as in the shell. They were not made consistent here because
       existing applications depend on the current rules. An easy (but
       inefficient) method that can be used to transform input consisting of
       one argument per line into a quoted form that _x_a_r_g_s interprets
       correctly is to precede each non-<newline> character with a
       <backslash>.  More efficient alternatives are shown in Example 2 and
       Example 5 below.

       On implementations with a large value for {ARG_MAX}, _x_a_r_g_s may produce
       command lines longer than {LINE_MAX}.  For invocation of utilities,
       this is not a problem. If _x_a_r_g_s is being used to create a text file,
       users should explicitly set the maximum command line length with the −−ss
       option.

       The _c_o_m_m_a_n_d, _e_n_v, _n_i_c_e, _n_o_h_u_p, _t_i_m_e, and _x_a_r_g_s utilities have been
       specified to use exit code 127 if an error occurs so that applications
       can distinguish ``failure to find a utility'' from ``invoked utility
       exited with an error indication''. The value 127 was chosen because it
       is not commonly used for other meanings; most utilities use small
       values for ``normal error conditions'' and the values above 128 can be
       confused with termination due to receipt of a signal. The value 126 was
       chosen in a similar manner to indicate that the utility could be found,
       but not invoked. Some scripts produce meaningful error messages
       differentiating the 126 and 127 cases. The distinction between exit
       codes 126 and 127 is based on KornShell practice that uses 127 when all
       attempts to _e_x_e_c the utility fail with [[EENNOOEENNTT]], and uses 126 when any
       attempt to _e_x_e_c the utility fails for any other reason.

EEXXAAMMPPLLEESS
        1. The following command combines the output of the parenthesized
           commands (minus the <apostrophe> characters) onto one line, which
           is then appended to the file log. It assumes that the expansion of
           ""$$00$*" does not include any <apostrophe> or <newline> characters.


               ((llooggnnaammee;; ddaattee;; pprriinnttff ""''%%ss''\\nn$$00 $$**"")) || xxaarrggss −−EE """" >>>>lloogg

        2. The following command invokes _d_i_f_f with successive pairs of
           arguments originally typed as command line arguments. It assumes
           there are no embedded <newline> characters in the elements of the
           original argument list.


               pprriinnttff ""%%ss\\nn$$@@"" || sseedd ''ss//[[^^[[::aallnnuumm::]]]]//\\\\&&//gg'' ||
                   xxaarrggss −−EE """" −−nn 22 −−xx ddiiffff

        3. In the following commands, the user is asked which files in the
           current directory (excluding dotfiles) are to be archived. The
           files are archived into aarrcchh; _a, one at a time or _b, many at a
           time. The commands assume that no filenames contain <blank>,
           <newline>, <backslash>, <apostrophe>, or double-quote characters.


               aa.. llss || xxaarrggss −−EE """" −−pp −−LL 11 aarr −−rr aarrcchh

               b. ls | xargs −E "" −p −L 1 | xargs −E "" ar −r arch

        4. The following command invokes _c_o_m_m_a_n_d_1 one or more times with
           multiple arguments, stopping if an invocation of _c_o_m_m_a_n_d_1 has a
           non-zero exit status.


               xxaarrggss −−EE """" sshh −−cc ''ccoommmmaanndd11 ""$$@@"" |||| eexxiitt 225555'' sshh << xxaarrggss__iinnppuutt

        5. On XSI-conformant systems, the following command moves all files
           from directory $$11 to directory $$22, and echoes each move command
           just before doing it. It assumes no filenames contain <newline>
           characters and that neither $$11 nor $$22 contains the sequence ""{{}}"".


               llss −−AA ""$$11"" || sseedd −−ee ''ss//""//""\\\\""""//gg'' −−ee ''ss//..**//""&&""//'' ||
                   xxaarrggss −−EE """" −−II {{}} −−tt mmvv ""$$11""//{{}} ""$$22""//{{}}

RRAATTIIOONNAALLEE
       The _x_a_r_g_s utility was usually found only in System V-based systems; BSD
       systems included an _a_p_p_l_y utility that provided functionality similar
       to _x_a_r_g_s −−nn _n_u_m_b_e_r.  The SVID lists _x_a_r_g_s as a software development
       extension. This volume of POSIX.1‐2008 does not share the view that it
       is used only for development, and therefore it is not optional.

       The classic application of the _x_a_r_g_s utility is in conjunction with the
       _f_i_n_d utility to reduce the number of processes launched by a simplistic
       use of the _f_i_n_d −−eexxeecc combination. The _x_a_r_g_s utility is also used to
       enforce an upper limit on memory required to launch a process. With
       this basis in mind, this volume of POSIX.1‐2008 selected only the
       minimal features required.

       Although the 255 exit status is mostly an accident of historical
       implementations, it allows a utility being used by _x_a_r_g_s to tell _x_a_r_g_s
       to terminate if it knows no further invocations using the current data
       stream shall succeed. Any non-zero exit status from a utility falls
       into the 1‐125 range when _x_a_r_g_s exits. There is no statement of how the
       various non-zero utility exit status codes are accumulated by _x_a_r_g_s.
       The value could be the addition of all codes, their highest value, the
       last one received, or a single value such as 1. Since no algorithm is
       arguably better than the others, and since many of the standard
       utilities say little more (portably) than ``pass/fail'', no new
       algorithm was invented.

       Several other _x_a_r_g_s options were removed because simple alternatives
       already exist within this volume of POSIX.1‐2008. For example, the −−ii
       _r_e_p_l_s_t_r option can be just as efficiently performed using a shell ffoorr
       loop. Since _x_a_r_g_s calls an _e_x_e_c function with each input line, the −−ii
       option does not usually exploit the grouping capabilities of _x_a_r_g_s.

       The requirement that _x_a_r_g_s never produces command lines such that
       invocation of _u_t_i_l_i_t_y is within 2048 bytes of hitting the POSIX _e_x_e_c
       {ARG_MAX} limitations is intended to guarantee that the invoked utility
       has room to modify its environment variables and command line arguments
       and still be able to invoke another utility. Note that the minimum
       {ARG_MAX} allowed by the System Interfaces volume of POSIX.1‐2008 is
       4096 bytes and the minimum value allowed by this volume of POSIX.1‐2008
       is 2048 bytes; therefore, the 2048 bytes difference seems reasonable.
       Note, however, that _x_a_r_g_s may never be able to invoke a utility if the
       environment passed in to _x_a_r_g_s comes close to using {ARG_MAX} bytes.

       The version of _x_a_r_g_s required by this volume of POSIX.1‐2008 is
       required to wait for the completion of the invoked command before
       invoking another command. This was done because historical scripts
       using _x_a_r_g_s assumed sequential execution. Implementations wanting to
       provide parallel operation of the invoked utilities are encouraged to
       add an option enabling parallel invocation, but should still wait for
       termination of all of the children before _x_a_r_g_s terminates normally.

       The −−ee option was omitted from the ISO POSIX‐2:1993 standard in the
       belief that the _e_o_f_s_t_r option-argument was recognized only when it was
       on a line by itself and before quote and escape processing were
       performed, and that the logical end-of-file processing was only enabled
       if a −−ee option was specified. In that case, a simple _s_e_d script could
       be used to duplicate the −−ee functionality. Further investigation
       revealed that:

        *  The logical end-of-file string was checked for after quote and
           escape processing, making a _s_e_d script that provided equivalent
           functionality much more difficult to write.

        *  The default was to perform logical end-of-file processing with an
           <underscore> as the logical end-of-file string.

       To correct this misunderstanding, the −−EE _e_o_f_s_t_r option was adopted from
       the X/Open Portability Guide. Users should note that the description of
       the −−EE option matches historical documentation of the −−ee option (which
       was not adopted because it did not support the Utility Syntax
       Guidelines), by saying that if _e_o_f_s_t_r is the null string, logical end-
       of-file processing is disabled.  Historical implementations of _x_a_r_g_s
       actually did not disable logical end-of-file processing; they treated a
       null argument found in the input as a logical end-of-file string. (A
       null _s_t_r_i_n_g argument could be generated using single or double-quotes
       ('''' or """").  Since this behavior was not documented historically, it is
       considered to be a bug.

       The −−II, −−LL, and −−nn options are mutually-exclusive. Some implementations
       use the last one specified if more than one is given on a command line;
       other implementations treat combinations of the options in different
       ways.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _C_h_a_p_t_e_r _2, _S_h_e_l_l _C_o_m_m_a_n_d _L_a_n_g_u_a_g_e, _d_i_f_f, _e_c_h_o, _f_i_n_d

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _e_x_e_c

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



IEEE/The Open Group                  2013                            XARGS(1P)
