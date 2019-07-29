FLOCK(2)                   Linux Programmer's Manual                  FLOCK(2)



NNAAMMEE
       flock - apply or remove an advisory lock on an open file

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//ffiillee..hh>>

       iinntt fflloocckk((iinntt _f_d,, iinntt _o_p_e_r_a_t_i_o_n));;

DDEESSCCRRIIPPTTIIOONN
       Apply or remove an advisory lock on the open file specified by _f_d.  The
       argument _o_p_e_r_a_t_i_o_n is one of the following:

           LLOOCCKK__SSHH  Place a shared lock.  More than one process may hold a
                    shared lock for a given file at a given time.

           LLOOCCKK__EEXX  Place an exclusive lock.  Only one process may hold an
                    exclusive lock for a given file at a given time.

           LLOOCCKK__UUNN  Remove an existing lock held by this process.

       A call to fflloocckk() may block if an incompatible lock is held by another
       process.  To make a nonblocking request, include LLOOCCKK__NNBB (by ORing)
       with any of the above operations.

       A single file may not simultaneously have both shared and exclusive
       locks.

       Locks created by fflloocckk() are associated with an open file description
       (see ooppeenn(2)).  This means that duplicate file descriptors (created by,
       for example, ffoorrkk(2) or dduupp(2)) refer to the same lock, and this lock
       may be modified or released using any of these file descriptors.
       Furthermore, the lock is released either by an explicit LLOOCCKK__UUNN
       operation on any of these duplicate file descriptors, or when all such
       file descriptors have been closed.

       If a process uses ooppeenn(2) (or similar) to obtain more than one file
       descriptor for the same file, these file descriptors are treated
       independently by fflloocckk().  An attempt to lock the file using one of
       these file descriptors may be denied by a lock that the calling process
       has already placed via another file descriptor.

       A process may hold only one type of lock (shared or exclusive) on a
       file.  Subsequent fflloocckk() calls on an already locked file will convert
       an existing lock to the new lock mode.

       Locks created by fflloocckk() are preserved across an eexxeeccvvee(2).

       A shared or exclusive lock can be placed on a file regardless of the
       mode in which the file was opened.

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       EEBBAADDFF  _f_d is not an open file descriptor.

       EEIINNTTRR  While waiting to acquire a lock, the call was interrupted by
              delivery of a signal caught by a handler; see ssiiggnnaall(7).

       EEIINNVVAALL _o_p_e_r_a_t_i_o_n is invalid.

       EENNOOLLCCKK The kernel ran out of memory for allocating lock records.

       EEWWOOUULLDDBBLLOOCCKK
              The file is locked and the LLOOCCKK__NNBB flag was selected.

CCOONNFFOORRMMIINNGG TTOO
       4.4BSD (the fflloocckk() call first appeared in 4.2BSD).  A version of
       fflloocckk(), possibly implemented in terms of ffccnnttll(2), appears on most
       UNIX systems.

NNOOTTEESS
       Since kernel 2.0, fflloocckk() is implemented as a system call in its own
       right rather than being emulated in the GNU C library as a call to
       ffccnnttll(2).  With this implementation, there is no interaction between
       the types of lock placed by fflloocckk() and ffccnnttll(2), and fflloocckk() does not
       detect deadlock.  (Note, however, that on some systems, such as the
       modern BSDs, fflloocckk() and ffccnnttll(2) locks _d_o interact with one another.)

       fflloocckk() places advisory locks only; given suitable permissions on a
       file, a process is free to ignore the use of fflloocckk() and perform I/O on
       the file.

       fflloocckk() and ffccnnttll(2) locks have different semantics with respect to
       forked processes and dduupp(2).  On systems that implement fflloocckk() using
       ffccnnttll(2), the semantics of fflloocckk() will be different from those
       described in this manual page.

       Converting a lock (shared to exclusive, or vice versa) is not
       guaranteed to be atomic: the existing lock is first removed, and then a
       new lock is established.  Between these two steps, a pending lock
       request by another process may be granted, with the result that the
       conversion either blocks, or fails if LLOOCCKK__NNBB was specified.  (This is
       the original BSD behavior, and occurs on many other implementations.)

   NNFFSS ddeettaaiillss
       In Linux kernels up to 2.6.11, fflloocckk() does not lock files over NFS
       (i.e., the scope of locks was limited to the local system).  Instead,
       one could use ffccnnttll(2) byte-range locking, which does work over NFS,
       given a sufficiently recent version of Linux and a server which
       supports locking.

       Since Linux 2.6.12, NFS clients support fflloocckk() locks by emulating them
       as ffccnnttll(2) byte-range locks on the entire file.  This means that
       ffccnnttll(2) and fflloocckk() locks _d_o interact with one another over NFS.  It
       also means that in order to place an exclusive lock, the file must be
       opened for writing.

       Since Linux 2.6.37, the kernel supports a compatibility mode that
       allows fflloocckk() locks (and also ffccnnttll(2) byte region locks) to be
       treated as local; see the discussion of the _l_o_c_a_l___l_o_c_k option in
       nnffss(5).

SSEEEE AALLSSOO
       fflloocckk(1), cclloossee(2), dduupp(2), eexxeeccvvee(2), ffccnnttll(2), ffoorrkk(2), ooppeenn(2),
       lloocckkff(3), llsslloocckkss(8)

       _D_o_c_u_m_e_n_t_a_t_i_o_n_/_f_i_l_e_s_y_s_t_e_m_s_/_l_o_c_k_s_._t_x_t in the Linux kernel source tree
       (_D_o_c_u_m_e_n_t_a_t_i_o_n_/_l_o_c_k_s_._t_x_t in older kernels)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                          FLOCK(2)
