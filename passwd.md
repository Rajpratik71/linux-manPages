PASSWD(5)                  Linux Programmer's Manual                 PASSWD(5)



NNAAMMEE
       passwd - password file

DDEESSCCRRIIPPTTIIOONN
       The _/_e_t_c_/_p_a_s_s_w_d file is a text file that describes user login accounts
       for the system.  It should have read permission allowed for all users
       (many utilities, like llss(1) use it to map user IDs to usernames), but
       write access only for the superuser.

       In the good old days there was no great problem with this general read
       permission.  Everybody could read the encrypted passwords, but the
       hardware was too slow to crack a well-chosen password, and moreover the
       basic assumption used to be that of a friendly user-community.  These
       days many people run some version of the shadow password suite, where
       _/_e_t_c_/_p_a_s_s_w_d has an 'x' character in the password field, and the
       encrypted passwords are in _/_e_t_c_/_s_h_a_d_o_w, which is readable by the
       superuser only.

       If the encrypted password, whether in _/_e_t_c_/_p_a_s_s_w_d or in _/_e_t_c_/_s_h_a_d_o_w, is
       an empty string, login is allowed without even asking for a password.
       Note that this functionality may be intentionally disabled in
       applications, or configurable (for example using the "nullok" or
       "nonull" arguments to pam_unix.so).

       If the encrypted password in _/_e_t_c_/_p_a_s_s_w_d is "_*_N_P_*" (without the
       quotes), the shadow record should be obtained from an NIS+ server.

       Regardless of whether shadow passwords are used, many system
       administrators use an asterisk (*) in the encrypted password field to
       make sure that this user can not authenticate him- or herself using a
       password.  (But see NOTES below.)

       If you create a new login, first put an asterisk (*) in the password
       field, then use ppaasssswwdd(1) to set it.

       Each line of the file describes a single user, and contains seven
       colon-separated fields:

           name:password:UID:GID:GECOS:directory:shell

       The field are as follows:

       _n_a_m_e        This is the user's login name.  It should not contain
                   capital letters.

       _p_a_s_s_w_o_r_d    This is either the encrypted user password, an asterisk
                   (*), or the letter 'x'.  (See ppwwccoonnvv(8) for an explanation
                   of 'x'.)

       _U_I_D         The privileged _r_o_o_t login account (superuser) has the user
                   ID 0.

       _G_I_D         This is the numeric primary group ID for this user.
                   (Additional groups for the user are defined in the system
                   group file; see ggrroouupp(5)).

       _G_E_C_O_S       This field (sometimes called the "comment field") is
                   optional and used only for informational purposes.
                   Usually, it contains the full username.  Some programs (for
                   example, ffiinnggeerr(1)) display information from this field.

                   GECOS stands for "General Electric Comprehensive Operating
                   System", which was renamed to GCOS when GE's large systems
                   division was sold to Honeywell.  Dennis Ritchie has
                   reported: "Sometimes we sent printer output or batch jobs
                   to the GCOS machine.  The gcos field in the password file
                   was a place to stash the information for the $IDENTcard.
                   Not elegant."

       _d_i_r_e_c_t_o_r_y   This is the user's home directory: the initial directory
                   where the user is placed after logging in.  The value in
                   this field is used to set the HHOOMMEE environment variable.

       _s_h_e_l_l       This is the program to run at login (if empty, use
                   _/_b_i_n_/_s_h).  If set to a nonexistent executable, the user
                   will be unable to login through llooggiinn(1).  The value in
                   this field is used to set the SSHHEELLLL environment variable.

FFIILLEESS
       _/_e_t_c_/_p_a_s_s_w_d

NNOOTTEESS
       If you want to create user groups, there must be an entry in
       _/_e_t_c_/_g_r_o_u_p, or no group will exist.

       If the encrypted password is set to an asterisk (*), the user will be
       unable to login using llooggiinn(1), but may still login using rrllooggiinn(1),
       run existing processes and initiate new ones through rrsshh(1), ccrroonn(8),
       aatt(1), or mail filters, etc.  Trying to lock an account by simply
       changing the shell field yields the same result and additionally allows
       the use of ssuu(1).

SSEEEE AALLSSOO
       cchhffnn(1), cchhsshh(1), llooggiinn(1), ppaasssswwdd(1), ssuu(1), ccrryypptt(3), ggeettppwweenntt(3),
       ggeettppwwnnaamm(3), ggrroouupp(5), sshhaaddooww(5), vviippww(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2018-04-30                         PASSWD(5)
