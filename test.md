TEST(1P)                   POSIX Programmer's Manual                  TEST(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       test — evaluate expression

SSYYNNOOPPSSIISS
       test [[_e_x_p_r_e_s_s_i_o_n]]

       [ [[_e_x_p_r_e_s_s_i_o_n]] ]

DDEESSCCRRIIPPTTIIOONN
       The _t_e_s_t utility shall evaluate the _e_x_p_r_e_s_s_i_o_n and indicate the result
       of the evaluation by its exit status. An exit status of zero indicates
       that the expression evaluated as true and an exit status of 1 indicates
       that the expression evaluated as false.

       In the second form of the utility, which uses ""[[]]"" rather than _t_e_s_t,
       the application shall ensure that the square brackets are separate
       arguments.

OOPPTTIIOONNSS
       The _t_e_s_t utility shall not recognize the ""−−−−"" argument in the manner
       specified by Guideline 10 in the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       No options shall be supported.

OOPPEERRAANNDDSS
       The application shall ensure that all operators and elements of
       primaries are presented as separate arguments to the _t_e_s_t utility.

       The following primaries can be used to construct _e_x_p_r_e_s_s_i_o_n:

       −−bb  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to en existing directory entry for
                 a block special file.  False if _p_a_t_h_n_a_m_e cannot be resolved,
                 or if _p_a_t_h_n_a_m_e resolves to an existing directory entry for a
                 file that is not a block special file.

       −−cc  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a character special file.  False if _p_a_t_h_n_a_m_e cannot be
                 resolved, or if _p_a_t_h_n_a_m_e resolves to an existing directory
                 entry for a file that is not a character special file.

       −−dd  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a directory. False if _p_a_t_h_n_a_m_e cannot be resolved, or if
                 _p_a_t_h_n_a_m_e resolves to an existing directory entry for a file
                 that is not a directory.

       −−ee  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry.
                 False if _p_a_t_h_n_a_m_e cannot be resolved.

       −−ff  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a regular file. False if _p_a_t_h_n_a_m_e cannot be resolved, or if
                 _p_a_t_h_n_a_m_e resolves to an existing directory entry for a file
                 that is not a regular file.

       −−gg  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a file that has its set-group-ID flag set. False if _p_a_t_h_n_a_m_e
                 cannot be resolved, or if _p_a_t_h_n_a_m_e resolves to an existing
                 directory entry for a file that does not have its set-group-
                 ID flag set.

       −−hh  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a symbolic link. False if _p_a_t_h_n_a_m_e cannot be resolved, or if
                 _p_a_t_h_n_a_m_e resolves to an existing directory entry for a file
                 that is not a symbolic link. If the final component of
                 _p_a_t_h_n_a_m_e is a symbolic link, that symbolic link is not
                 followed.

       −−LL  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a symbolic link. False if _p_a_t_h_n_a_m_e cannot be resolved, or if
                 _p_a_t_h_n_a_m_e resolves to an existing directory entry for a file
                 that is not a symbolic link. If the final component of
                 _p_a_t_h_n_a_m_e is a symbolic link, that symbolic link is not
                 followed.

       −−nn  _s_t_r_i_n_g True if the length of _s_t_r_i_n_g is non-zero; otherwise, false.

       −−pp  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a FIFO. False if _p_a_t_h_n_a_m_e cannot be resolved, or if _p_a_t_h_n_a_m_e
                 resolves to an existing directory entry for a file that is
                 not a FIFO.

       −−rr  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a file for which permission to read from the file will be
                 granted, as defined in _S_e_c_t_i_o_n _1_._1_._1_._4, _F_i_l_e _R_e_a_d, _W_r_i_t_e, _a_n_d
                 _C_r_e_a_t_i_o_n.  False if _p_a_t_h_n_a_m_e cannot be resolved, or if
                 _p_a_t_h_n_a_m_e resolves to an existing directory entry for a file
                 for which permission to read from the file will not be
                 granted.

       −−SS  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a socket. False if _p_a_t_h_n_a_m_e cannot be resolved, or if
                 _p_a_t_h_n_a_m_e resolves to an existing directory entry for a file
                 that is not a socket.

       −−ss  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a file that has a size greater than zero. False if _p_a_t_h_n_a_m_e
                 cannot be resolved, or if _p_a_t_h_n_a_m_e resolves to an existing
                 directory entry for a file that does not have a size greater
                 than zero.

       −−tt  _f_i_l_e___d_e_s_c_r_i_p_t_o_r
                 True if file descriptor number _f_i_l_e___d_e_s_c_r_i_p_t_o_r is open and is
                 associated with a terminal. False if _f_i_l_e___d_e_s_c_r_i_p_t_o_r is not a
                 valid file descriptor number, or if file descriptor number
                 _f_i_l_e___d_e_s_c_r_i_p_t_o_r is not open, or if it is open but is not
                 associated with a terminal.

       −−uu  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a file that has its set-user-ID flag set. False if _p_a_t_h_n_a_m_e
                 cannot be resolved, or if _p_a_t_h_n_a_m_e resolves to an existing
                 directory entry for a file that does not have its set-user-ID
                 flag set.

       −−ww  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a file for which permission to write to the file will be
                 granted, as defined in _S_e_c_t_i_o_n _1_._1_._1_._4, _F_i_l_e _R_e_a_d, _W_r_i_t_e, _a_n_d
                 _C_r_e_a_t_i_o_n.  False if _p_a_t_h_n_a_m_e cannot be resolved, or if
                 _p_a_t_h_n_a_m_e resolves to an existing directory entry for a file
                 for which permission to write to the file will not be
                 granted.

       −−xx  _p_a_t_h_n_a_m_e
                 True if _p_a_t_h_n_a_m_e resolves to an existing directory entry for
                 a file for which permission to execute the file (or search
                 it, if it is a directory) will be granted, as defined in
                 _S_e_c_t_i_o_n _1_._1_._1_._4, _F_i_l_e _R_e_a_d, _W_r_i_t_e, _a_n_d _C_r_e_a_t_i_o_n.  False if
                 _p_a_t_h_n_a_m_e cannot be resolved, or if _p_a_t_h_n_a_m_e resolves to an
                 existing directory entry for a file for which permission to
                 execute (or search) the file will not be granted.

       −−zz  _s_t_r_i_n_g True if the length of string _s_t_r_i_n_g is zero; otherwise,
                 false.

       _s_t_r_i_n_g    True if the string _s_t_r_i_n_g is not the null string; otherwise,
                 false.

       _s_1  ==  _s_2   True if the strings _s_1 and _s_2 are identical; otherwise,
                 false.

       _s_1  !!==  _s_2  True if the strings _s_1 and _s_2 are not identical; otherwise,
                 false.

       _n_1  −−eeqq  _n_2 True if the integers _n_1 and _n_2 are algebraically equal;
                 otherwise, false.

       _n_1  −−nnee  _n_2 True if the integers _n_1 and _n_2 are not algebraically equal;
                 otherwise, false.

       _n_1  −−ggtt  _n_2 True if the integer _n_1 is algebraically greater than the
                 integer _n_2; otherwise, false.

       _n_1  −−ggee  _n_2 True if the integer _n_1 is algebraically greater than or equal
                 to the integer _n_2; otherwise, false.

       _n_1  −−lltt  _n_2 True if the integer _n_1 is algebraically less than the integer
                 _n_2; otherwise, false.

       _n_1  −−llee  _n_2 True if the integer _n_1 is algebraically less than or equal to
                 the integer _n_2; otherwise, false.

       _e_x_p_r_e_s_s_i_o_n_1  −−aa  _e_x_p_r_e_s_s_i_o_n_2
                 True if both _e_x_p_r_e_s_s_i_o_n_1 and _e_x_p_r_e_s_s_i_o_n_2 are true; otherwise,
                 false. The −−aa binary primary is left associative. It has a
                 higher precedence than −−oo.

       _e_x_p_r_e_s_s_i_o_n_1  −−oo  _e_x_p_r_e_s_s_i_o_n_2
                 True if either _e_x_p_r_e_s_s_i_o_n_1 or _e_x_p_r_e_s_s_i_o_n_2 is true; otherwise,
                 false. The −−oo binary primary is left associative.

       With the exception of the −−hh _p_a_t_h_n_a_m_e and −−LL _p_a_t_h_n_a_m_e primaries, if a
       _p_a_t_h_n_a_m_e argument is a symbolic link, _t_e_s_t shall evaluate the
       expression by resolving the symbolic link and using the file referenced
       by the link.

       These primaries can be combined with the following operators:

       !!  _e_x_p_r_e_s_s_i_o_n
                 True if _e_x_p_r_e_s_s_i_o_n is false. False if _e_x_p_r_e_s_s_i_o_n is true.

       ((  _e_x_p_r_e_s_s_i_o_n_ ))
                 True if _e_x_p_r_e_s_s_i_o_n is true. False if _e_x_p_r_e_s_s_i_o_n is false. The
                 parentheses can be used to alter the normal precedence and
                 associativity.

       The primaries with two elements of the form:


           −−_p_r_i_m_a_r_y___o_p_e_r_a_t_o_r _p_r_i_m_a_r_y___o_p_e_r_a_n_d

       are known as _u_n_a_r_y _p_r_i_m_a_r_i_e_s.  The primaries with three elements in
       either of the two forms:


           _p_r_i_m_a_r_y___o_p_e_r_a_n_d −_p_r_i_m_a_r_y___o_p_e_r_a_t_o_r _p_r_i_m_a_r_y___o_p_e_r_a_n_d

           primary_operand primary_operator primary_operand

       are known as _b_i_n_a_r_y _p_r_i_m_a_r_i_e_s.  Additional implementation-defined
       operators and _p_r_i_m_a_r_y___o_p_e_r_a_t_o_rs may be provided by implementations.
       They shall be of the form −_o_p_e_r_a_t_o_r where the first character of
       _o_p_e_r_a_t_o_r is not a digit.

       The algorithm for determining the precedence of the operators and the
       return value that shall be generated is based on the number of
       arguments presented to _t_e_s_t.  (However, when using the ""[[......]]"" form,
       the <right-square-bracket> final argument shall not be counted in this
       algorithm.)

       In the following list, $1, $2, $3, and $4 represent the arguments
       presented to _t_e_s_t:

       0 arguments:
                   Exit false (1).

       1 argument: Exit true (0) if $1 is not null; otherwise, exit false.

       2 arguments:
                    *  If $1 is ''!!'', exit true if $2 is null, false if $2 is
                       not null.

                    *  If $1 is a unary primary, exit true if the unary test
                       is true, false if the unary test is false.

                    *  Otherwise, produce unspecified results.

       3 arguments:
                    *  If $2 is a binary primary, perform the binary test of
                       $1 and $3.

                    *  If $1 is ''!!'', negate the two-argument test of $2 and
                       $3.

                    *  If $1 is ''(('' and $3 is ''))'', perform the unary test of
                       $2.  On systems that do not support the XSI option, the
                       results are unspecified if $1 is ''(('' and $3 is ''))''.

                    *  Otherwise, produce unspecified results.

       4 arguments:
                    *  If $1 is ''!!'', negate the three-argument test of $2, $3,
                       and $4.

                    *  If $1 is ''(('' and $4 is ''))'', perform the two-argument
                       test of $2 and $3.  On systems that do not support the
                       XSI option, the results are unspecified if $1 is ''((''
                       and $4 is ''))''.

                    *  Otherwise, the results are unspecified.

       >4 arguments:
                   The results are unspecified.

                   On XSI-conformant systems, combinations of primaries and
                   operators shall be evaluated using the precedence and
                   associativity rules described previously. In addition, the
                   string comparison binary primaries ''=='' and ""!!=="" shall have
                   a higher precedence than any unary primary.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _t_e_s_t:

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

        0    _e_x_p_r_e_s_s_i_o_n evaluated to true.

        1    _e_x_p_r_e_s_s_i_o_n evaluated to false or _e_x_p_r_e_s_s_i_o_n was missing.

       >1    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The XSI extensions specifying the −−aa and −−oo binary primaries and the
       ''(('' and ''))'' operators have been marked obsolescent. (Many expressions
       using them are ambiguously defined by the grammar depending on the
       specific expressions being evaluated.) Scripts using these expressions
       should be converted to the forms given below. Even though many
       implementations will continue to support these obsolescent forms,
       scripts should be extremely careful when dealing with user-supplied
       input that could be confused with these and other primaries and
       operators. Unless the application developer knows all the cases that
       produce input to the script, invocations like:


           tteesstt ""$$11"" −−aa ""$$22""

       should be written as:


           tteesstt ""$$11"" &&&& tteesstt ""$$22""

       to avoid problems if a user supplied values such as $1 set to ''!!'' and
       $2 set to the null string. That is, in cases where maximal portability
       is of concern, replace:


           tteesstt eexxpprr11 −−aa eexxpprr22

       with:


           tteesstt eexxpprr11 &&&& tteesstt eexxpprr22

       and replace:


           tteesstt eexxpprr11 −−oo eexxpprr22

       with:


           tteesstt eexxpprr11 |||| tteesstt eexxpprr22

       but note that, in _t_e_s_t, −−aa has higher precedence than −−oo while ""&&&&"" and
       ""||||"" have equal precedence in the shell.

       Parentheses or braces can be used in the shell command language to
       effect grouping.

       Parentheses must be escaped when using _s_h; for example:


           tteesstt \\(( eexxpprr11 −−aa eexxpprr22 \\)) −−oo eexxpprr33

       This command is not always portable even on XSI-conformant systems
       depending on the expressions specified by _e_x_p_r1, _e_x_p_r2, and _e_x_p_r3.  The
       following form can be used instead:


           (( tteesstt eexxpprr11 &&&& tteesstt eexxpprr22 )) |||| tteesstt eexxpprr33

       The two commands:


           tteesstt ""$$11""
           tteesstt !! ""$$11""

       could not be used reliably on some historical systems. Unexpected
       results would occur if such a _s_t_r_i_n_g expression were used and $1
       expanded to ''!!'', ''(('', or a known unary primary. Better constructs are:


           tteesstt −−nn ""$$11""
           tteesstt −−zz ""$$11""

       respectively.

       Historical systems have also been unreliable given the common
       construct:


           tteesstt ""$$rreessppoonnssee"" == ""eexxppeecctteedd ssttrriinngg""

       One of the following is a more reliable form:


           tteesstt ""XX$$rreessppoonnssee"" == ""XXeexxppeecctteedd ssttrriinngg""
           tteesstt ""eexxppeecctteedd ssttrriinngg"" == ""$$rreessppoonnssee""

       Note that the second form assumes that _e_x_p_e_c_t_e_d _s_t_r_i_n_g could not be
       confused with any unary primary. If _e_x_p_e_c_t_e_d _s_t_r_i_n_g starts with ''−−'',
       ''(('', ''!!'', or even ''=='', the first form should be used instead. Using the
       preceding rules without the XSI marked extensions, any of the three
       comparison forms is reliable, given any input. (However, note that the
       strings are quoted in all cases.)

       Because the string comparison binary primaries, ''=='' and ""!!=="", have a
       higher precedence than any unary primary in the greater than 4 argument
       case, unexpected results can occur if arguments are not properly
       prepared. For example, in:


           tteesstt −−dd $$11 −−oo −−dd $$22

       If $1 evaluates to a possible directory name of ''=='', the first three
       arguments are considered a string comparison, which shall cause a
       syntax error when the second −−dd is encountered. One of the following
       forms prevents this; the second is preferred:


           tteesstt \\(( −−dd ""$$11"" \\)) −−oo \\(( −−dd ""$$22"" \\))
           tteesstt −−dd ""$$11"" |||| tteesstt −−dd ""$$22""

       Also in the greater than 4 argument case:


           tteesstt ""$$11"" == ""bbaatt"" −−aa ""$$22"" == ""bbaallll""

       syntax errors occur if $1 evaluates to ''(('' or ''!!''.  One of the
       following forms prevents this; the third is preferred:


           tteesstt ""XX$$11"" == ""XXbbaatt"" −−aa ""XX$$22"" == ""XXbbaallll""
           tteesstt ""$$11"" == ""bbaatt"" &&&& tteesstt ""$$22"" == ""bbaallll""
           tteesstt ""XX$$11"" == ""XXbbaatt"" &&&& tteesstt ""XX$$22"" == ""XXbbaallll""

EEXXAAMMPPLLEESS
        1. Exit if there are not two or three arguments (two variations):


               iiff [[ $$## −−nnee 22 ]] &&&& [[ $$## −−nnee 33 ]];; tthheenn eexxiitt 11;; ffii
               iiff [[ $$## −−lltt 22 ]] |||| [[ $$## −−ggtt 33 ]];; tthheenn eexxiitt 11;; ffii

        2. Perform a _m_k_d_i_r if a directory does not exist:


               tteesstt !! −−dd tteemmppddiirr &&&& mmkkddiirr tteemmppddiirr

        3. Wait for a file to become non-readable:


               wwhhiillee tteesstt −−rr tthheeffiillee
               ddoo
                   sslleeeepp 3300
               ddoonnee
               eecchhoo ''""tthheeffiillee"" iiss nnoo lloonnggeerr rreeaaddaabbllee''

        4. Perform a command if the argument is one of three strings (two
           variations):


               iiff [[ ""$$11"" == ""ppeeaarr"" ]] |||| [[ ""$$11"" == ""ggrraappee"" ]] |||| [[ ""$$11"" == ""aappppllee"" ]]
               tthheenn
                   _c_o_m_m_a_n_d
               ffii

               case "$1" in
                   pear|grape|apple) _c_o_m_m_a_n_d ;;
               esac

RRAATTIIOONNAALLEE
       The KornShell-derived conditional command (double bracket [[[[]]]]) was
       removed from the shell command language description in an early
       proposal. Objections were raised that the real problem is misuse of the
       _t_e_s_t command ([[), and putting it into the shell is the wrong way to fix
       the problem.  Instead, proper documentation and a new shell reserved
       word (!!) are sufficient.

       Tests that require multiple _t_e_s_t operations can be done at the shell
       level using individual invocations of the _t_e_s_t command and shell
       logicals, rather than using the error-prone −−oo flag of _t_e_s_t.

       XSI-conformant systems support more than four arguments.

       XSI-conformant systems support the combining of primaries with the
       following constructs:

       _e_x_p_r_e_s_s_i_o_n_1 −−aa _e_x_p_r_e_s_s_i_o_n_2
             True if both _e_x_p_r_e_s_s_i_o_n_1 and _e_x_p_r_e_s_s_i_o_n_2 are true.

       _e_x_p_r_e_s_s_i_o_n_1 −−oo _e_x_p_r_e_s_s_i_o_n_2
             True if at least one of _e_x_p_r_e_s_s_i_o_n_1 and _e_x_p_r_e_s_s_i_o_n_2 are true.

       (( _e_x_p_r_e_s_s_i_o_n ))
             True if _e_x_p_r_e_s_s_i_o_n is true.

       In evaluating these more complex combined expressions, the following
       precedence rules are used:

        *  The unary primaries have higher precedence than the algebraic
           binary primaries.

        *  The unary primaries have lower precedence than the string binary
           primaries.

        *  The unary and binary primaries have higher precedence than the
           unary _s_t_r_i_n_g primary.

        *  The !!  operator has higher precedence than the −−aa operator, and the
           −−aa operator has higher precedence than the −−oo operator.

        *  The −−aa and −−oo operators are left associative.

        *  The parentheses can be used to alter the normal precedence and
           associativity.

       The BSD and System V versions of −−ff are not the same. The BSD
       definition was:

       −−ff  _f_i_l_e   True if _f_i_l_e exists and is not a directory.

       The SVID version (true if the file exists and is a regular file) was
       chosen for this volume of POSIX.1‐2008 because its use is consistent
       with the −−bb, −−cc, −−dd, and −−pp operands (_f_i_l_e exists and is a specific
       file type).

       The −−ee primary, possessing similar functionality to that provided by
       the C shell, was added because it provides the only way for a shell
       script to find out if a file exists without trying to open the file.
       Since implementations are allowed to add additional file types, a
       portable script cannot use:


           tteesstt −−bb ffoooo −−oo −−cc ffoooo −−oo −−dd ffoooo −−oo −−ff ffoooo −−oo −−pp ffoooo

       to find out if ffoooo is an existing file. On historical BSD systems, the
       existence of a file could be determined by:


           tteesstt −−ff ffoooo −−oo −−dd ffoooo

       but there was no easy way to determine that an existing file was a
       regular file. An early proposal used the KornShell −−aa primary (with the
       same meaning), but this was changed to −−ee because there were concerns
       about the high probability of humans confusing the −−aa primary with the
       −−aa binary operator.

       The following options were not included in this volume of POSIX.1‐2008,
       although they are provided by some implementations. These operands
       should not be used by new implementations for other purposes:

       −−kk  _f_i_l_e   True if _f_i_l_e exists and its sticky bit is set.

       −−CC  _f_i_l_e   True if _f_i_l_e is a contiguous file.

       −−VV  _f_i_l_e   True if _f_i_l_e is a version file.

       The following option was not included because it was undocumented in
       most implementations, has been removed from some implementations
       (including System V), and the functionality is provided by the shell
       (see _S_e_c_t_i_o_n _2_._6_._2, _P_a_r_a_m_e_t_e_r _E_x_p_a_n_s_i_o_n.

       −−ll  _s_t_r_i_n_g The length of the string _s_t_r_i_n_g.

       The −−bb, −−cc, −−gg, −−pp, −−uu, and −−xx operands are derived from the SVID;
       historical BSD does not provide them. The −−kk operand is derived from
       System V; historical BSD does not provide it.

       On historical BSD systems, _t_e_s_t −−ww _d_i_r_e_c_t_o_r_y always returned false
       because _t_e_s_t tried to open the directory for writing, which always
       fails.

       Some additional primaries newly invented or from the KornShell appeared
       in an early proposal as part of the conditional command ([[[[]]]]): _s_1 >>
       _s_2, _s_1 << _s_2, _s_t_r == _p_a_t_t_e_r_n, _s_t_r !!== _p_a_t_t_e_r_n, _f_1 −−nntt _f_2, _f_1 −−oott _f_2, and
       _f_1 −−eeff _f_2.  They were not carried forward into the _t_e_s_t utility when
       the conditional command was removed from the shell because they have
       not been included in the _t_e_s_t utility built into historical
       implementations of the _s_h utility.

       The −−tt _f_i_l_e___d_e_s_c_r_i_p_t_o_r primary is shown with a mandatory argument
       because the grammar is ambiguous if it can be omitted. Historical
       implementations have allowed it to be omitted, providing a default of
       1.

       It is noted that ''[['' is not part of the portable filename character
       set; however, since it is required to be encoded by a single byte, and
       is part of the portable character set, the name of this utility forms a
       character string across all supported locales.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _1_._1_._1_._4, _F_i_l_e _R_e_a_d, _W_r_i_t_e, _a_n_d _C_r_e_a_t_i_o_n, _f_i_n_d

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



IEEE/The Open Group                  2013                             TEST(1P)
