CHMOD(1P)                  POSIX Programmer's Manual                 CHMOD(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       chmod — change the file modes

SSYYNNOOPPSSIISS
       chmod [[−R]] _m_o_d_e _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       The _c_h_m_o_d utility shall change any or all of the file mode bits of the
       file named by each _f_i_l_e operand in the way specified by the _m_o_d_e
       operand.

       It is implementation-defined whether and how the _c_h_m_o_d utility affects
       any alternate or additional file access control mechanism (see the Base
       Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _4_._4, _F_i_l_e _A_c_c_e_s_s
       _P_e_r_m_i_s_s_i_o_n_s) being used for the specified file.

       Only a process whose effective user ID matches the user ID of the file,
       or a process with appropriate privileges, shall be permitted to change
       the file mode bits of a file.

       Upon successfully changing the file mode bits of a file, the _c_h_m_o_d
       utility shall mark for update the last file status change timestamp of
       the file.

OOPPTTIIOONNSS
       The _c_h_m_o_d utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The following option shall be supported:

       −−RR        Recursively change file mode bits. For each _f_i_l_e operand that
                 names a directory, _c_h_m_o_d shall change the file mode bits of
                 the directory and all files in the file hierarchy below it.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _m_o_d_e      Represents the change to be made to the file mode bits of
                 each file named by one of the _f_i_l_e operands; see the EXTENDED
                 DESCRIPTION section.

       _f_i_l_e      A pathname of a file whose file mode bits shall be modified.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
       None.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _c_h_m_o_d:

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
       The _m_o_d_e operand shall be either a _s_y_m_b_o_l_i_c___m_o_d_e expression or a non-
       negative octal integer. The _s_y_m_b_o_l_i_c___m_o_d_e form is described by the
       grammar later in this section.

       Each ccllaauussee shall specify an operation to be performed on the current
       file mode bits of each _f_i_l_e.  The operations shall be performed on each
       _f_i_l_e in the order in which the ccllaauussees are specified.

       The wwhhoo symbols uu, gg, and oo shall specify the _u_s_e_r, _g_r_o_u_p, and _o_t_h_e_r
       parts of the file mode bits, respectively. A wwhhoo consisting of the
       symbol aa shall be equivalent to uuggoo.

       The ppeerrmm symbols rr, ww, and xx represent the _r_e_a_d, _w_r_i_t_e, and
       _e_x_e_c_u_t_e/_s_e_a_r_c_h portions of file mode bits, respectively. The ppeerrmm
       symbol ss shall represent the _s_e_t_-_u_s_e_r_-_I_D_-_o_n_-_e_x_e_c_u_t_i_o_n (when wwhhoo
       contains or implies uu) and _s_e_t_-_g_r_o_u_p_-_I_D_-_o_n_-_e_x_e_c_u_t_i_o_n (when wwhhoo contains
       or implies gg) bits.

       The ppeerrmm symbol XX shall represent the execute/search portion of the
       file mode bits if the file is a directory or if the current
       (unmodified) file mode bits have at least one of the execute bits
       (S_IXUSR, S_IXGRP, or S_IXOTH) set. It shall be ignored if the file is
       not a directory and none of the execute bits are set in the current
       file mode bits.

       The ppeerrmmccooppyy symbols uu, gg, and oo shall represent the current
       permissions associated with the user, group, and other parts of the
       file mode bits, respectively. For the remainder of this section, ppeerrmm
       refers to the non-terminals ppeerrmm and ppeerrmmccooppyy in the grammar.

       If multiple aaccttiioonnlliisstts are grouped with a single wwhhoolliisstt in the
       grammar, each aaccttiioonnlliisstt shall be applied in the order specified with
       that wwhhoolliisstt.  The _o_p symbols shall represent the operation performed,
       as follows:

       +     If ppeerrmm is not specified, the ''++'' operation shall not change the
             file mode bits.

             If wwhhoo is not specified, the file mode bits represented by ppeerrmm
             for the owner, group, and other permissions, except for those
             with corresponding bits in the file mode creation mask of the
             invoking process, shall be set.

             Otherwise, the file mode bits represented by the specified wwhhoo
             and ppeerrmm values shall be set.

       −     If ppeerrmm is not specified, the ''−−'' operation shall not change the
             file mode bits.

             If wwhhoo is not specified, the file mode bits represented by ppeerrmm
             for the owner, group, and other permissions, except for those
             with corresponding bits in the file mode creation mask of the
             invoking process, shall be cleared.

             Otherwise, the file mode bits represented by the specified wwhhoo
             and ppeerrmm values shall be cleared.

       =     Clear the file mode bits specified by the wwhhoo value, or, if no
             wwhhoo value is specified, all of the file mode bits specified in
             this volume of POSIX.1‐2008.

             If ppeerrmm is not specified, the ''=='' operation shall make no further
             modifications to the file mode bits.

             If wwhhoo is not specified, the file mode bits represented by ppeerrmm
             for the owner, group, and other permissions, except for those
             with corresponding bits in the file mode creation mask of the
             invoking process, shall be set.

             Otherwise, the file mode bits represented by the specified wwhhoo
             and ppeerrmm values shall be set.

       When using the symbolic mode form on a regular file, it is
       implementation-defined whether or not:

        *  Requests to set the set-user-ID-on-execution or set-group-ID-on-
           execution bit when all execute bits are currently clear and none
           are being set are ignored.

        *  Requests to clear all execute bits also clear the set-user-ID-on-
           execution and set-group-ID-on-execution bits.

        *  Requests to clear the set-user-ID-on-execution or set-group-ID-on-
           execution bits when all execute bits are currently clear are
           ignored. However, if the command _l_s −−ll _f_i_l_e writes an _s in the
           position indicating that the set-user-ID-on-execution or set-group-
           ID-on-execution is set, the commands _c_h_m_o_d uu−−ss _f_i_l_e or _c_h_m_o_d gg−−ss
           _f_i_l_e, respectively, shall not be ignored.

       When using the symbolic mode form on other file types, it is
       implementation-defined whether or not requests to set or clear the set-
       user-ID-on-execution or set-group-ID-on-execution bits are honored.

       If the wwhhoo symbol oo is used in conjunction with the ppeerrmm symbol ss with
       no other wwhhoo symbols being specified, the set-user-ID-on-execution and
       set-group-ID-on-execution bits shall not be modified. It shall not be
       an error to specify the wwhhoo symbol oo in conjunction with the ppeerrmm
       symbol ss.

       The ppeerrmm symbol tt shall specify the S_ISVTX bit. When used with a file
       of type directory, it can be used with the wwhhoo symbol aa, or with no wwhhoo
       symbol. It shall not be an error to specify a wwhhoo symbol of uu, gg, or oo
       in conjunction with the ppeerrmm symbol tt, but the meaning of these
       combinations is unspecified. The effect when using the ppeerrmm symbol tt
       with any file type other than directory is unspecified.

       For an octal integer _m_o_d_e operand, the file mode bits shall be set
       absolutely.

       For each bit set in the octal number, the corresponding file permission
       bit shown in the following table shall be set; all other file
       permission bits shall be cleared. For regular files, for each bit set
       in the octal number corresponding to the set-user-ID-on-execution or
       the set-group-ID-on-execution, bits shown in the following table shall
       be set; if these bits are not set in the octal number, they are
       cleared. For other file types, it is implementation-defined whether or
       not requests to set or clear the set-user-ID-on-execution or set-group-
       ID-on-execution bits are honored.

+----------------------+-----------------------+-----------------------+-----------------------+
|  OOccttaall      MMooddee BBiitt |   OOccttaall      MMooddee BBiitt |   OOccttaall      MMooddee BBiitt |   OOccttaall      MMooddee BBiitt |
+----------------------+-----------------------+-----------------------+-----------------------+
|44000000         S_ISUID  | 00440000         S_IRUSR  | 00004400         S_IRGRP  | 00000044         S_IROTH  |
+----------------------+-----------------------+-----------------------+-----------------------+
|22000000         S_ISGID  | 00220000         S_IWUSR  | 00002200         S_IWGRP  | 00000022         S_IWOTH  |
+----------------------+-----------------------+-----------------------+-----------------------+
|11000000         S_ISVTX  | 00110000         S_IXUSR  | 00001100         S_IXGRP  | 00000011         S_IXOTH  |
+----------------------+-----------------------+-----------------------+-----------------------+
       When bits are set in the octal number other than those listed in the
       table above, the behavior is unspecified.

   GGrraammmmaarr ffoorr cchhmmoodd
       The grammar and lexical conventions in this section describe the syntax
       for the _s_y_m_b_o_l_i_c___m_o_d_e operand. The general conventions for this style
       of grammar are described in _S_e_c_t_i_o_n _1_._3, _G_r_a_m_m_a_r _C_o_n_v_e_n_t_i_o_n_s.  A valid
       _s_y_m_b_o_l_i_c___m_o_d_e can be represented as the non-terminal symbol
       _s_y_m_b_o_l_i_c___m_o_d_e in the grammar. This formal syntax shall take precedence
       over the preceding text syntax description.

       The lexical processing is based entirely on single characters.
       Implementations need not allow <blank> characters within the single
       argument being processed.


           %%ssttaarrtt    ssyymmbboolliicc__mmooddee
           %%%%

           symbolic_mode    : clause
                            | symbolic_mode ',' clause
                            ;

           clause           : actionlist
                            | wholist actionlist
                            ;

           wholist          : who
                            | wholist who
                            ;

           who              : 'u' | 'g' | 'o' | 'a'
                            ;

           actionlist       : action
                            | actionlist action
                            ;

           action           : op
                            | op permlist
                            | op permcopy
                            ;

           permcopy         : 'u' | 'g' | 'o'
                            ;

           op               : '+' | '−' | '='
                            ;

           permlist         : perm
                            | perm permlist
                            ;

           perm             : 'r' | 'w' | 'x' | 'X' | 's' | 't'
                            ;

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    The utility executed successfully and all requested changes were
             made.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Some implementations of the _c_h_m_o_d utility change the mode of a
       directory before the files in the directory when performing a recursive
       (−−RR option) change; others change the directory mode after the files in
       the directory. If an application tries to remove read or search
       permission for a file hierarchy, the removal attempt fails if the
       directory is changed first; on the other hand, trying to re-enable
       permissions to a restricted hierarchy fails if directories are changed
       last. Users should not try to make a hierarchy inaccessible to
       themselves.

       Some implementations of _c_h_m_o_d never used the _u_m_a_s_k of the process when
       changing modes; systems conformant with this volume of POSIX.1‐2008 do
       so when wwhhoo is not specified. Note the difference between:


           cchhmmoodd aa−−ww ffiillee

       which removes all write permissions, and:


           cchhmmoodd −−−− −−ww ffiillee

       which removes write permissions that would be allowed if ffiillee was
       created with the same _u_m_a_s_k.

       Conforming applications should never assume that they know how the set-
       user-ID and set-group-ID bits on directories are interpreted.

EEXXAAMMPPLLEESS

                      +------+--------------------------------+
                      |MMooddee  |            RReessuullttss             |
                      +------+--------------------------------+
                      |_a+=   | Equivalent to a +, a =; clears |
                      |      | all file mode bits.            |
                      |_g_o+−w | Equivalent to go +, go − w ;   |
                      |      | clears group and other write   |
                      |      | bits.                          |
                      |_g=_o−_w | Equivalent to g = o , g − w ;  |
                      |      | sets group bit to match other  |
                      |      | bits and then clears group     |
                      |      | write bit.                     |
                      |_g−_r+_w | Equivalent to g − r , g + w ;  |
                      |      | clears group read bit and sets |
                      |      | group write bit.               |
                      |_u_o=_g  | Sets owner bits to match group |
                      |      | bits and sets other bits to    |
                      |      | match group bits.              |
                      +------+--------------------------------+
RRAATTIIOONNAALLEE
       The functionality of _c_h_m_o_d is described substantially through
       references to concepts defined in the System Interfaces volume of
       POSIX.1‐2008. In this way, there is less duplication of effort required
       for describing the interactions of permissions. However, the behavior
       of this utility is not described in terms of the _c_h_m_o_d() function from
       the System Interfaces volume of POSIX.1‐2008 because that specification
       requires certain side-effects upon alternate file access control
       mechanisms that might not be appropriate, depending on the
       implementation.

       Implementations that support mandatory file and record locking as
       specified by the 1984 /usr/group standard historically used the
       combination of set-group-ID bit set and group execute bit clear to
       indicate mandatory locking. This condition is usually set or cleared
       with the symbolic mode ppeerrmm symbol ll instead of the ppeerrmm symbols ss and
       xx so that the mandatory locking mode is not changed without explicit
       indication that that was what the user intended. Therefore, the details
       on how the implementation treats these conditions must be defined in
       the documentation. This volume of POSIX.1‐2008 does not require
       mandatory locking (nor does the System Interfaces volume of
       POSIX.1‐2008), but does allow it as an extension. However, this volume
       of POSIX.1‐2008 does require that the _l_s and _c_h_m_o_d utilities work
       consistently in this area. If _l_s −−ll _f_i_l_e indicates that the set-group-
       ID bit is set, _c_h_m_o_d gg−−ss _f_i_l_e must clear it (assuming appropriate
       privileges exist to change modes).

       The System V and BSD versions use different exit status codes. Some
       implementations used the exit status as a count of the number of errors
       that occurred; this practice is unworkable since it can overflow the
       range of valid exit status values. This problem is avoided here by
       specifying only 0 and >0 as exit values.

       The System Interfaces volume of POSIX.1‐2008 indicates that
       implementation-defined restrictions may cause the S_ISUID and S_ISGID
       bits to be ignored. This volume of POSIX.1‐2008 allows the _c_h_m_o_d
       utility to choose to modify these bits before calling _c_h_m_o_d() (or some
       function providing equivalent capabilities) for non-regular files.
       Among other things, this allows implementations that use the set-user-
       ID and set-group-ID bits on directories to enable extended features to
       handle these extensions in an intelligent manner.

       The XX ppeerrmm symbol was adopted from BSD-based systems because it
       provides commonly desired functionality when doing recursive (−−RR
       option) modifications. Similar functionality is not provided by the
       _f_i_n_d utility. Historical BSD versions of _c_h_m_o_d, however, only supported
       XX with _o_p+; it has been extended in this volume of POSIX.1‐2008 because
       it is also useful with _o_p=.  (It has also been added for _o_p− even
       though it duplicates xx, in this case, because it is intuitive and
       easier to explain.)

       The grammar was extended with the _p_e_r_m_c_o_p_y non-terminal to allow
       historical-practice forms of symbolic modes like oo=uu −−gg (that is, set
       the ``other'' permissions to the permissions of ``owner'' minus the
       permissions of ``group'').

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _l_s, _u_m_a_s_k

       The Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _4_._4, _F_i_l_e _A_c_c_e_s_s
       _P_e_r_m_i_s_s_i_o_n_s, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y
       _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _c_h_m_o_d()

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



IEEE/The Open Group                  2013                            CHMOD(1P)
