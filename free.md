MALLOC(3)                  Linux Programmer's Manual                 MALLOC(3)



NNAAMMEE
       malloc, free, calloc, realloc - allocate and free dynamic memory

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssttddlliibb..hh>>

       vvooiidd **mmaalllloocc((ssiizzee__tt _s_i_z_e));;
       vvooiidd ffrreeee((vvooiidd _*_p_t_r));;
       vvooiidd **ccaalllloocc((ssiizzee__tt _n_m_e_m_b,, ssiizzee__tt _s_i_z_e));;
       vvooiidd **rreeaalllloocc((vvooiidd _*_p_t_r,, ssiizzee__tt _s_i_z_e));;
       vvooiidd **rreeaallllooccaarrrraayy((vvooiidd _*_p_t_r,, ssiizzee__tt _n_m_e_m_b,, ssiizzee__tt _s_i_z_e));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       rreeaallllooccaarrrraayy():
           _GNU_SOURCE

DDEESSCCRRIIPPTTIIOONN
       The mmaalllloocc() function allocates _s_i_z_e bytes and returns a pointer to the
       allocated memory.  _T_h_e _m_e_m_o_r_y _i_s _n_o_t _i_n_i_t_i_a_l_i_z_e_d.  If _s_i_z_e is 0, then
       mmaalllloocc() returns either NULL, or a unique pointer value that can later
       be successfully passed to ffrreeee().

       The ffrreeee() function frees the memory space pointed to by _p_t_r, which
       must have been returned by a previous call to mmaalllloocc(), ccaalllloocc(), or
       rreeaalllloocc().  Otherwise, or if _f_r_e_e_(_p_t_r_) has already been called before,
       undefined behavior occurs.  If _p_t_r is NULL, no operation is performed.

       The ccaalllloocc() function allocates memory for an array of _n_m_e_m_b elements
       of _s_i_z_e bytes each and returns a pointer to the allocated memory.  The
       memory is set to zero.  If _n_m_e_m_b or _s_i_z_e is 0, then ccaalllloocc() returns
       either NULL, or a unique pointer value that can later be successfully
       passed to ffrreeee().

       The rreeaalllloocc() function changes the size of the memory block pointed to
       by _p_t_r to _s_i_z_e bytes.  The contents will be unchanged in the range from
       the start of the region up to the minimum of the old and new sizes.  If
       the new size is larger than the old size, the added memory will _n_o_t be
       initialized.  If _p_t_r is NULL, then the call is equivalent to
       _m_a_l_l_o_c_(_s_i_z_e_), for all values of _s_i_z_e; if _s_i_z_e is equal to zero, and _p_t_r
       is not NULL, then the call is equivalent to _f_r_e_e_(_p_t_r_).  Unless _p_t_r is
       NULL, it must have been returned by an earlier call to mmaalllloocc(),
       ccaalllloocc(), or rreeaalllloocc().  If the area pointed to was moved, a _f_r_e_e_(_p_t_r_)
       is done.

       The rreeaallllooccaarrrraayy() function changes the size of the memory block
       pointed to by _p_t_r to be large enough for an array of _n_m_e_m_b elements,
       each of which is _s_i_z_e bytes.  It is equivalent to the call

               realloc(ptr, nmemb * size);

       However, unlike that rreeaalllloocc() call, rreeaallllooccaarrrraayy() fails safely in the
       case where the multiplication would overflow.  If such an overflow
       occurs, rreeaallllooccaarrrraayy() returns NULL, sets _e_r_r_n_o to EENNOOMMEEMM, and leaves
       the original block of memory unchanged.

RREETTUURRNN VVAALLUUEE
       The mmaalllloocc() and ccaalllloocc() functions return a pointer to the allocated
       memory, which is suitably aligned for any built-in type.  On error,
       these functions return NULL.  NULL may also be returned by a successful
       call to mmaalllloocc() with a _s_i_z_e of zero, or by a successful call to
       ccaalllloocc() with _n_m_e_m_b or _s_i_z_e equal to zero.

       The ffrreeee() function returns no value.

       The rreeaalllloocc() function returns a pointer to the newly allocated memory,
       which is suitably aligned for any built-in type and may be different
       from _p_t_r, or NULL if the request fails.  If _s_i_z_e was equal to 0, either
       NULL or a pointer suitable to be passed to ffrreeee() is returned.  If
       rreeaalllloocc() fails, the original block is left untouched; it is not freed
       or moved.

       On success, the rreeaallllooccaarrrraayy() function returns a pointer to the newly
       allocated memory.  On failure, it returns NULL and the original block
       of memory is left untouched.

EERRRROORRSS
       ccaalllloocc(), mmaalllloocc(), rreeaalllloocc(), and rreeaallllooccaarrrraayy() can fail with the
       following error:

       EENNOOMMEEMM Out of memory.  Possibly, the application hit the RRLLIIMMIITT__AASS or
              RRLLIIMMIITT__DDAATTAA limit described in ggeettrrlliimmiitt(2).

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +---------------------+---------------+---------+
       |IInntteerrffaaccee            | AAttttrriibbuuttee     | VVaalluuee   |
       +---------------------+---------------+---------+
       |malloc (), free (),  | Thread safety | MT-Safe |
       |calloc (), realloc   |               |         |
       |()                   |               |         |
       +---------------------+---------------+---------+
CCOONNFFOORRMMIINNGG TTOO
       mmaalllloocc(), ffrreeee(), ccaalllloocc(), rreeaalllloocc(): POSIX.1-2001, POSIX.1-2008, C89,
       C99.

       rreeaallllooccaarrrraayy() is a nonstandard extension that first appeared in
       OpenBSD 5.6 and FreeBSD 11.0.

NNOOTTEESS
       By default, Linux follows an optimistic memory allocation strategy.
       This means that when mmaalllloocc() returns non-NULL there is no guarantee
       that the memory really is available.  In case it turns out that the
       system is out of memory, one or more processes will be killed by the
       OOM killer.  For more information, see the description of
       _/_p_r_o_c_/_s_y_s_/_v_m_/_o_v_e_r_c_o_m_m_i_t___m_e_m_o_r_y and _/_p_r_o_c_/_s_y_s_/_v_m_/_o_o_m___a_d_j in pprroocc(5), and
       the Linux kernel source file _D_o_c_u_m_e_n_t_a_t_i_o_n_/_v_m_/_o_v_e_r_c_o_m_m_i_t_-_a_c_c_o_u_n_t_i_n_g.

       Normally, mmaalllloocc() allocates memory from the heap, and adjusts the size
       of the heap as required, using ssbbrrkk(2).  When allocating blocks of
       memory larger than MMMMAAPP__TTHHRREESSHHOOLLDD bytes, the glibc mmaalllloocc()
       implementation allocates the memory as a private anonymous mapping
       using mmmmaapp(2).  MMMMAAPP__TTHHRREESSHHOOLLDD is 128 kB by default, but is adjustable
       using mmaalllloopptt(3).  Prior to Linux 4.7 allocations performed using
       mmmmaapp(2) were unaffected by the RRLLIIMMIITT__DDAATTAA resource limit; since Linux
       4.7, this limit is also enforced for allocations performed using
       mmmmaapp(2).

       To avoid corruption in multithreaded applications, mutexes are used
       internally to protect the memory-management data structures employed by
       these functions.  In a multithreaded application in which threads
       simultaneously allocate and free memory, there could be contention for
       these mutexes.  To scalably handle memory allocation in multithreaded
       applications, glibc creates additional _m_e_m_o_r_y _a_l_l_o_c_a_t_i_o_n _a_r_e_n_a_s if
       mutex contention is detected.  Each arena is a large region of memory
       that is internally allocated by the system (using bbrrkk(2) or mmmmaapp(2)),
       and managed with its own mutexes.

       SUSv2 requires mmaalllloocc(), ccaalllloocc(), and rreeaalllloocc() to set _e_r_r_n_o to EENNOOMMEEMM
       upon failure.  Glibc assumes that this is done (and the glibc versions
       of these routines do this); if you use a private malloc implementation
       that does not set _e_r_r_n_o, then certain library routines may fail without
       having a reason in _e_r_r_n_o.

       Crashes in mmaalllloocc(), ccaalllloocc(), rreeaalllloocc(), or ffrreeee() are almost always
       related to heap corruption, such as overflowing an allocated chunk or
       freeing the same pointer twice.

       The mmaalllloocc() implementation is tunable via environment variables; see
       mmaalllloopptt(3) for details.

SSEEEE AALLSSOO
       vvaallggrriinndd(1), bbrrkk(2), mmmmaapp(2), aallllooccaa(3), mmaalllloocc__ggeett__ssttaattee(3),
       mmaalllloocc__iinnffoo(3), mmaalllloocc__ttrriimm(3), mmaalllloocc__uussaabbllee__ssiizzee(3), mmaalllloopptt(3),
       mmcchheecckk(3), mmttrraaccee(3), ppoossiixx__mmeemmaalliiggnn(3)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



GNU                               2017-09-15                         MALLOC(3)
