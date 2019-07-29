REALPATH(3)                Linux Programmer's Manual               REALPATH(3)



NNAAMMEE
       realpath - return the canonicalized absolute pathname

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<lliimmiittss..hh>>
       ##iinncclluuddee <<ssttddlliibb..hh>>

       cchhaarr **rreeaallppaatthh((ccoonnsstt cchhaarr **_p_a_t_h,, cchhaarr **_r_e_s_o_l_v_e_d___p_a_t_h));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       rreeaallppaatthh():
           _XOPEN_SOURCE >= 500
               || /* Glibc since 2.19: */ _DEFAULT_SOURCE
               || /* Glibc versions <= 2.19: */ _BSD_SOURCE

DDEESSCCRRIIPPTTIIOONN
       rreeaallppaatthh() expands all symbolic links and resolves references to _/_._/,
       _/_._._/ and extra '/' characters in the null-terminated string named by
       _p_a_t_h to produce a canonicalized absolute pathname.  The resulting
       pathname is stored as a null-terminated string, up to a maximum of
       PPAATTHH__MMAAXX bytes, in the buffer pointed to by _r_e_s_o_l_v_e_d___p_a_t_h.  The
       resulting path will have no symbolic link, _/_._/ or _/_._._/ components.

       If _r_e_s_o_l_v_e_d___p_a_t_h is specified as NULL, then rreeaallppaatthh() uses mmaalllloocc(3)
       to allocate a buffer of up to PPAATTHH__MMAAXX bytes to hold the resolved
       pathname, and returns a pointer to this buffer.  The caller should
       deallocate this buffer using ffrreeee(3).

RREETTUURRNN VVAALLUUEE
       If there is no error, rreeaallppaatthh() returns a pointer to the
       _r_e_s_o_l_v_e_d___p_a_t_h.

       Otherwise, it returns NULL, the contents of the array _r_e_s_o_l_v_e_d___p_a_t_h are
       undefined, and _e_r_r_n_o is set to indicate the error.

EERRRROORRSS
       EEAACCCCEESS Read or search permission was denied for a component of the path
              prefix.

       EEIINNVVAALL _p_a_t_h is NULL.  (In glibc versions before 2.3, this error is also
              returned if _r_e_s_o_l_v_e_d___p_a_t_h is NULL.)

       EEIIOO    An I/O error occurred while reading from the filesystem.

       EELLOOOOPP  Too many symbolic links were encountered in translating the
              pathname.

       EENNAAMMEETTOOOOLLOONNGG
              A component of a pathname exceeded NNAAMMEE__MMAAXX characters, or an
              entire pathname exceeded PPAATTHH__MMAAXX characters.

       EENNOOEENNTT The named file does not exist.

       EENNOOMMEEMM Out of memory.

       EENNOOTTDDIIRR
              A component of the path prefix is not a directory.

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +------------+---------------+---------+
       |IInntteerrffaaccee   | AAttttrriibbuuttee     | VVaalluuee   |
       +------------+---------------+---------+
       |realpath () | Thread safety | MT-Safe |
       +------------+---------------+---------+
CCOONNFFOORRMMIINNGG TTOO
       4.4BSD, POSIX.1-2001.

       POSIX.1-2001 says that the behavior if _r_e_s_o_l_v_e_d___p_a_t_h is NULL is
       implementation-defined.  POSIX.1-2008 specifies the behavior described
       in this page.

NNOOTTEESS
       In 4.4BSD and Solaris, the limit on the pathname length is MMAAXXPPAATTHHLLEENN
       (found in _<_s_y_s_/_p_a_r_a_m_._h_>).  SUSv2 prescribes PPAATTHH__MMAAXX and NNAAMMEE__MMAAXX, as
       found in _<_l_i_m_i_t_s_._h_> or provided by the ppaatthhccoonnff(3) function.  A typical
       source fragment would be

           #ifdef PATH_MAX
             path_max = PATH_MAX;
           #else
             path_max = pathconf(path, _PC_PATH_MAX);
             if (path_max <= 0)
               path_max = 4096;
           #endif

       (But see the BUGS section.)

   GGNNUU eexxtteennssiioonnss
       If the call fails with either EEAACCCCEESS or EENNOOEENNTT and _r_e_s_o_l_v_e_d___p_a_t_h is not
       NULL, then the prefix of _p_a_t_h that is not readable or does not exist is
       returned in _r_e_s_o_l_v_e_d___p_a_t_h.

BBUUGGSS
       The POSIX.1-2001 standard version of this function is broken by design,
       since it is impossible to determine a suitable size for the output
       buffer, _r_e_s_o_l_v_e_d___p_a_t_h.  According to POSIX.1-2001 a buffer of size
       PPAATTHH__MMAAXX suffices, but PPAATTHH__MMAAXX need not be a defined constant, and may
       have to be obtained using ppaatthhccoonnff(3).  And asking ppaatthhccoonnff(3) does not
       really help, since, on the one hand POSIX warns that the result of
       ppaatthhccoonnff(3) may be huge and unsuitable for mallocing memory, and on the
       other hand ppaatthhccoonnff(3) may return -1 to signify that PPAATTHH__MMAAXX is not
       bounded.  The _r_e_s_o_l_v_e_d___p_a_t_h_ _=_=_ _N_U_L_L feature, not standardized in
       POSIX.1-2001, but standardized in POSIX.1-2008, allows this design
       problem to be avoided.

SSEEEE AALLSSOO
       rreeaallppaatthh(1), rreeaaddlliinnkk(2), ccaannoonniiccaalliizzee__ffiillee__nnaammee(3), ggeettccwwdd(3),
       ppaatthhccoonnff(3), ssyyssccoonnff(3)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



                                  2017-09-15                       REALPATH(3)
