PATHCHK(1P)                POSIX Programmer's Manual               PATHCHK(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       pathchk — check pathnames

SSYYNNOOPPSSIISS
       pathchk [[−p]] [[−P]] _p_a_t_h_n_a_m_e...

DDEESSCCRRIIPPTTIIOONN
       The _p_a_t_h_c_h_k utility shall check that one or more pathnames are valid
       (that is, they could be used to access or create a file without causing
       syntax errors) and portable (that is, no filename truncation results).
       More extensive portability checks are provided by the −−pp and −−PP
       options.

       By default, the _p_a_t_h_c_h_k utility shall check each component of each
       _p_a_t_h_n_a_m_e operand based on the underlying file system. A diagnostic
       shall be written for each _p_a_t_h_n_a_m_e operand that:

        *  Is longer than {PATH_MAX} bytes (see PPaatthhnnaammee VVaarriiaabbllee VVaalluueess in
           the Base Definitions volume of POSIX.1‐2008, <<lliimmiittss..hh>>)

        *  Contains any component longer than {NAME_MAX} bytes in its
           containing directory

        *  Contains any component in a directory that is not searchable

        *  Contains any byte sequence that is not valid in its containing
           directory

       The format of the diagnostic message is not specified, but shall
       indicate the error detected and the corresponding _p_a_t_h_n_a_m_e operand.

       It shall not be considered an error if one or more components of a
       _p_a_t_h_n_a_m_e operand do not exist as long as a file matching the pathname
       specified by the missing components could be created that does not
       violate any of the checks specified above.

OOPPTTIIOONNSS
       The _p_a_t_h_c_h_k utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−pp        Instead of performing checks based on the underlying file
                 system, write a diagnostic for each _p_a_t_h_n_a_m_e operand that:

                  *  Is longer than {_POSIX_PATH_MAX} bytes (see MMiinniimmuumm
                     VVaalluueess in the Base Definitions volume of POSIX.1‐2008,
                     <<lliimmiittss..hh>>)

                  *  Contains any component longer than {_POSIX_NAME_MAX}
                     bytes

                  *  Contains any character in any component that is not in
                     the portable filename character set

       −−PP        Write a diagnostic for each _p_a_t_h_n_a_m_e operand that:

                  *  Contains a component whose first character is the
                     <hyphen> character

                  *  Is empty

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _p_a_t_h_n_a_m_e  A pathname to be checked.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _p_a_t_h_c_h_k:

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

        0    All _p_a_t_h_n_a_m_e operands passed all of the checks.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The _t_e_s_t utility can be used to determine whether a given pathname
       names an existing file; it does not, however, give any indication of
       whether or not any component of the pathname was truncated in a
       directory where the _POSIX_NO_TRUNC feature is not in effect. The
       _p_a_t_h_c_h_k utility does not check for file existence; it performs checks
       to determine whether a pathname does exist or could be created with no
       pathname component truncation.

       The _n_o_c_l_o_b_b_e_r option in the shell (see the _s_e_t special built-in) can be
       used to atomically create a file. As with all file creation semantics
       in the System Interfaces volume of POSIX.1‐2008, it guarantees atomic
       creation, but still depends on applications to agree on conventions and
       cooperate on the use of files after they have been created.

       To verify that a pathname meets the requirements of filename
       portability, applications should use both the −−pp and −−PP options
       together.

EEXXAAMMPPLLEESS
       To verify that all pathnames in an imported data interchange archive
       are legitimate and unambiguous on the current system:


           ## TThhiiss eexxaammppllee aassssuummeess tthhaatt nnoo ppaatthhnnaammeess iinn tthhee aarrcchhiivvee
           ## ccoonnttaaiinn <<nneewwlliinnee>> cchhaarraacctteerrss..
           ppaaxx −−ff aarrcchhiivvee || sseedd −−ee ''ss//[[^^[[::aallnnuumm::]]]]//\\\\&&//gg'' || xxaarrggss ppaatthhcchhkk −−−−
           iiff [[ $$?? −−eeqq 00 ]]
           tthheenn
               ppaaxx −−rr −−ff aarrcchhiivvee
           eellssee
               eecchhoo IInnvveessttiiggaattee pprroobblleemmss bbeeffoorree iimmppoorrttiinngg ffiilleess..
               eexxiitt 11
           ffii

       To verify that all files in the current directory hierarchy could be
       moved to any system conforming to the System Interfaces volume of
       POSIX.1‐2008 that also supports the _p_a_x utility:


           ffiinndd .. −−eexxeecc ppaatthhcchhkk −−pp −−PP {{}} ++
           iiff [[ $$?? −−eeqq 00 ]]
           tthheenn
               ppaaxx −−ww −−ff ....//aarrcchhiivvee ..
           eellssee
               eecchhoo PPoorrttaabbllee aarrcchhiivvee ccaannnnoott bbee ccrreeaatteedd..
               eexxiitt 11
           ffii

       To verify that a user-supplied pathname names a readable file and that
       the application can create a file extending the given path without
       truncation and without overwriting any existing file:


           ccaassee $$−− iinn
               **CC**))    rreesseett=="""";;;;
               **))      rreesseett==""sseett ++CC""
                       sseett −−CC;;;;
           eessaacc
           tteesstt −−rr ""$$ppaatthh"" &&&& ppaatthhcchhkk ""$$ppaatthh..oouutt"" &&&&
               rrmm ""$$ppaatthh..oouutt"" >> ""$$ppaatthh..oouutt""
           iiff [[ $$?? −−nnee 00 ]];; tthheenn
               pprriinnttff ""%%ss:: %%ss nnoott ffoouunndd oorr %%ss..oouutt ffaaiillss \\
           ccrreeaattiioonn cchheecckkss..\\nn"" $$00 ""$$ppaatthh$$ppaatthh""
               $$rreesseett    ## RReesseett tthhee nnoocclloobbbbeerr ooppttiioonn iinn ccaassee aa ttrraapp
                         ## oonn EEXXIITT ddeeppeennddss oonn iitt..
               eexxiitt 11
           ffii
           $$rreesseett
           PPRROOCCEESSSSIINNGG << ""$$ppaatthh"" >> ""$$ppaatthh..oouutt""

       The following assumptions are made in this example:

        1. PPRROOCCEESSSSIINNGG represents the code that is used by the application to
           use $$ppaatthh once it is verified that $$ppaatthh..oouutt works as intended.

        2. The state of the _n_o_c_l_o_b_b_e_r option is unknown when this code is
           invoked and should be set on exit to the state it was in when this
           code was invoked. (The rreesseett variable is used in this example to
           restore the initial state.)

        3. Note the usage of:


               rrmm ""$$ppaatthh..oouutt"" >> ""$$ppaatthh..oouutt""

            a. The _p_a_t_h_c_h_k command has already verified, at this point, that
               $$ppaatthh..oouutt is not truncated.

            b. With the _n_o_c_l_o_b_b_e_r option set, the shell verifies that
               $$ppaatthh..oouutt does not already exist before invoking _r_m.

            c. If the shell succeeded in creating $$ppaatthh..oouutt, _r_m removes it so
               that the application can create the file again in the
               PPRROOCCEESSSSIINNGG step.

            d. If the PPRROOCCEESSSSIINNGG step wants the file to exist already when it
               is invoked, the:


                   rrmm ""$$ppaatthh..oouutt"" >> ""$$ppaatthh..oouutt""

               should be replaced with:


                   >> ""$$ppaatthh..oouutt""

               which verifies that the file did not already exist, but leaves
               $$ppaatthh..oouutt in place for use by PPRROOCCEESSSSIINNGG.

RRAATTIIOONNAALLEE
       The _p_a_t_h_c_h_k utility was new for the ISO POSIX‐2:1993 standard. It,
       along with the _s_e_t −−CC(_n_o_c_l_o_b_b_e_r) option added to the shell, replaces
       the _m_k_t_e_m_p, _v_a_l_i_d_f_n_a_m, and _c_r_e_a_t_e utilities that appeared in early
       proposals. All of these utilities were attempts to solve several common
       problems:

        *  Verify the validity (for several different definitions of
           ``valid'') of a pathname supplied by a user, generated by an
           application, or imported from an external source.

        *  Atomically create a file.

        *  Perform various string handling functions to generate a temporary
           filename.

       The _c_r_e_a_t_e utility, included in an early proposal, provided checking
       and atomic creation in a single invocation of the utility; these are
       orthogonal issues and need not be grouped into a single utility. Note
       that the _n_o_c_l_o_b_b_e_r option also provides a way of creating a lock for
       process synchronization; since it provides an atomic _c_r_e_a_t_e, there is
       no race between a test for existence and the following creation if it
       did not exist.

       Having a function like _t_m_p_n_a_m() in the ISO C standard is important in
       many high-level languages. The shell programming language, however, has
       built-in string manipulation facilities, making it very easy to
       construct temporary filenames. The names needed obviously depend on the
       application, but are frequently of a form similar to:


           $$TTMMPPDDIIRR//_a_p_p_l_i_c_a_t_i_o_n___a_b_b_r_e_v_i_a_t_i_o_n$$$$.._s_u_f_f_i_x

       In cases where there is likely to be contention for a given suffix, a
       simple shell ffoorr or wwhhiillee loop can be used with the shell _n_o_c_l_o_b_b_e_r
       option to create a file without risk of collisions, as long as
       applications trying to use the same filename name space are cooperating
       on the use of files after they have been created.

       For historical purposes, −−pp does not check for the use of the <hyphen>
       character as the first character in a component of the pathname, or for
       an empty _p_a_t_h_n_a_m_e operand.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _2_._7, _R_e_d_i_r_e_c_t_i_o_n, _s_e_t, _t_e_s_t

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s, <<lliimmiittss..hh>>

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



IEEE/The Open Group                  2013                          PATHCHK(1P)
