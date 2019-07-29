MKTEMP(3)                  Linux Programmer's Manual                 MKTEMP(3)



NNAAMMEE
       mktemp - make a unique temporary filename

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssttddlliibb..hh>>

       cchhaarr **mmkktteemmpp((cchhaarr **_t_e_m_p_l_a_t_e));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       mmkktteemmpp():
           Since glibc 2.12:
               (_XOPEN_SOURCE >= 500) && ! (_POSIX_C_SOURCE >= 200112L)
                   || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                   || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE
           Before glibc 2.12:
               _BSD_SOURCE || _SVID_SOURCE || _XOPEN_SOURCE >= 500

DDEESSCCRRIIPPTTIIOONN
       _N_e_v_e_r _u_s_e _t_h_i_s _f_u_n_c_t_i_o_n; see BUGS.

       The mmkktteemmpp() function generates a unique temporary filename from
       _t_e_m_p_l_a_t_e.  The last six characters of _t_e_m_p_l_a_t_e must be XXXXXX and these
       are replaced with a string that makes the filename unique.  Since it
       will be modified, _t_e_m_p_l_a_t_e must not be a string constant, but should be
       declared as a character array.

RREETTUURRNN VVAALLUUEE
       The mmkktteemmpp() function always returns _t_e_m_p_l_a_t_e.  If a unique name was
       created, the last six bytes of _t_e_m_p_l_a_t_e will have been modified in such
       a way that the resulting name is unique (i.e., does not exist already)
       If a unique name could not be created, _t_e_m_p_l_a_t_e is made an empty
       string, and _e_r_r_n_o is set to indicate the error.

EERRRROORRSS
       EEIINNVVAALL The last six characters of _t_e_m_p_l_a_t_e were not XXXXXX.

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +----------+---------------+---------+
       |IInntteerrffaaccee | AAttttrriibbuuttee     | VVaalluuee   |
       +----------+---------------+---------+
       |mktemp () | Thread safety | MT-Safe |
       +----------+---------------+---------+
CCOONNFFOORRMMIINNGG TTOO
       4.3BSD, POSIX.1-2001.  POSIX.1-2008 removes the specification of
       mmkktteemmpp().

BBUUGGSS
       Never use mmkktteemmpp().  Some implementations follow 4.3BSD and replace
       XXXXXX by the current process ID and a single letter, so that at most
       26 different names can be returned.  Since on the one hand the names
       are easy to guess, and on the other hand there is a race between
       testing whether the name exists and opening the file, every use of
       mmkktteemmpp() is a security risk.  The race is avoided by mmkksstteemmpp(3) and
       mmkkddtteemmpp(3).

SSEEEE AALLSSOO
       mmkktteemmpp(1), mmkkddtteemmpp(3), mmkksstteemmpp(3), tteemmppnnaamm(3), ttmmppffiillee(3), ttmmppnnaamm(3)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



GNU                               2017-09-15                         MKTEMP(3)
