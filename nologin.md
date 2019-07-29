NOLOGIN(5)                 Linux Programmer's Manual                NOLOGIN(5)



NNAAMMEE
       nologin - prevent unprivileged users from logging into the system

DDEESSCCRRIIPPTTIIOONN
       If the file _/_e_t_c_/_n_o_l_o_g_i_n exists and is readable, llooggiinn(1) will allow
       access only to root.  Other users will be shown the contents of this
       file and their logins will be refused.  This provides a simple way of
       temporarily disabling all unprivileged logins.

FFIILLEESS
       _/_e_t_c_/_n_o_l_o_g_i_n

SSEEEE AALLSSOO
       llooggiinn(1), sshhuuttddoowwnn(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                        NOLOGIN(5)
