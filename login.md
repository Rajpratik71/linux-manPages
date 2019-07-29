LOGIN(3)                   Linux Programmer's Manual                  LOGIN(3)



NNAAMMEE
       login, logout - write utmp and wtmp entries

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uuttmmpp..hh>>

       vvooiidd llooggiinn((ccoonnsstt ssttrruucctt uuttmmpp **_u_t));;

       iinntt llooggoouutt((ccoonnsstt cchhaarr **_u_t___l_i_n_e));;

       Link with _-_l_u_t_i_l.

DDEESSCCRRIIPPTTIIOONN
       The utmp file records who is currently using the system.  The wtmp file
       records all logins and logouts.  See uuttmmpp(5).

       The function llooggiinn() takes the supplied _s_t_r_u_c_t _u_t_m_p, _u_t, and writes it
       to both the utmp and the wtmp file.

       The function llooggoouutt() clears the entry in the utmp file again.

   GGNNUU ddeettaaiillss
       More precisely, llooggiinn() takes the argument _u_t struct, fills the field
       _u_t_-_>_u_t___t_y_p_e (if there is such a field) with the value UUSSEERR__PPRROOCCEESSSS, and
       fills the field _u_t_-_>_u_t___p_i_d (if there is such a field) with the process
       ID of the calling process.  Then it tries to fill the field
       _u_t_-_>_u_t___l_i_n_e.  It takes the first of _s_t_d_i_n, _s_t_d_o_u_t, _s_t_d_e_r_r that is a
       terminal, and stores the corresponding pathname minus a possible
       leading _/_d_e_v_/ into this field, and then writes the struct to the utmp
       file.  On the other hand, if no terminal name was found, this field is
       filled with "???" and the struct is not written to the utmp file.
       After this, the struct is written to the wtmp file.

       The llooggoouutt() function searches the utmp file for an entry matching the
       _u_t___l_i_n_e argument.  If a record is found, it is updated by zeroing out
       the _u_t___n_a_m_e and _u_t___h_o_s_t fields, updating the _u_t___t_v timestamp field and
       setting _u_t___t_y_p_e (if there is such a field) to DDEEAADD__PPRROOCCEESSSS.

RREETTUURRNN VVAALLUUEE
       The llooggoouutt() function returns 1 if the entry was successfully written
       to the database, or 0 if an error occurred.

FFIILLEESS
       _/_v_a_r_/_r_u_n_/_u_t_m_p
              user accounting database, configured through __PPAATTHH__UUTTMMPP in
              _<_p_a_t_h_s_._h_>

       _/_v_a_r_/_l_o_g_/_w_t_m_p
              user accounting log file, configured through __PPAATTHH__WWTTMMPP in
              _<_p_a_t_h_s_._h_>

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +--------------------+---------------+----------------------+
       |IInntteerrffaaccee           | AAttttrriibbuuttee     | VVaalluuee                |
       +--------------------+---------------+----------------------+
       |login (), logout () | Thread safety | MT-Unsafe race:utent |
       |                    |               | sig:ALRM timer       |
       +--------------------+---------------+----------------------+
       In the above table, _u_t_e_n_t in _r_a_c_e_:_u_t_e_n_t signifies that if any of the
       functions sseettuutteenntt(3), ggeettuutteenntt(3), or eenndduutteenntt(3) are used in parallel
       in different threads of a program, then data races could occur.
       llooggiinn() and llooggoouutt() calls those functions, so we use race:utent to
       remind users.

CCOONNFFOORRMMIINNGG TTOO
       Not in POSIX.1.  Present on the BSDs.

NNOOTTEESS
       Note that the member _u_t___u_s_e_r of _s_t_r_u_c_t _u_t_m_p is called _u_t___n_a_m_e in BSD.
       Therefore, _u_t___n_a_m_e is defined as an alias for _u_t___u_s_e_r in _<_u_t_m_p_._h_>.

SSEEEE AALLSSOO
       ggeettuutteenntt(3), uuttmmpp(5)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



GNU                               2017-09-15                          LOGIN(3)
