CHROOT(2)                  Linux Programmer's Manual                 CHROOT(2)



NNAAMMEE
       chroot - change root directory

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>

       iinntt cchhrroooott((ccoonnsstt cchhaarr **_p_a_t_h));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       cchhrroooott():
           Since glibc 2.2.2:
               _XOPEN_SOURCE && ! (_POSIX_C_SOURCE >= 200112L)
                   || /* Since glibc 2.20: */ _DEFAULT_SOURCE
                   || /* Glibc versions <= 2.19: */ _BSD_SOURCE
           Before glibc 2.2.2: none

DDEESSCCRRIIPPTTIIOONN
       cchhrroooott() changes the root directory of the calling process to that
       specified in _p_a_t_h.  This directory will be used for pathnames beginning
       with _/.  The root directory is inherited by all children of the calling
       process.

       Only a privileged process (Linux: one with the CCAAPP__SSYYSS__CCHHRROOOOTT
       capability in its user namespace) may call cchhrroooott().

       This call changes an ingredient in the pathname resolution process and
       does nothing else.  In particular, it is not intended to be used for
       any kind of security purpose, neither to fully sandbox a process nor to
       restrict filesystem system calls.  In the past, cchhrroooott() has been used
       by daemons to restrict themselves prior to passing paths supplied by
       untrusted users to system calls such as ooppeenn(2).  However, if a folder
       is moved out of the chroot directory, an attacker can exploit that to
       get out of the chroot directory as well.  The easiest way to do that is
       to cchhddiirr(2) to the to-be-moved directory, wait for it to be moved out,
       then open a path like ../../../etc/passwd.

       A slightly trickier variation also works under some circumstances if
       cchhddiirr(2) is not permitted.  If a daemon allows a "chroot directory" to
       be specified, that usually means that if you want to prevent remote
       users from accessing files outside the chroot directory, you must
       ensure that folders are never moved out of it.

       This call does not change the current working directory, so that after
       the call '_.' can be outside the tree rooted at '_/'.  In particular, the
       superuser can escape from a "chroot jail" by doing:

           mkdir foo; chroot foo; cd ..

       This call does not close open file descriptors, and such file
       descriptors may allow access to files outside the chroot tree.

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       Depending on the filesystem, other errors can be returned.  The more
       general errors are listed below:

       EEAACCCCEESS Search permission is denied on a component of the path prefix.
              (See also ppaatthh__rreessoolluuttiioonn(7).)

       EEFFAAUULLTT _p_a_t_h points outside your accessible address space.

       EEIIOO    An I/O error occurred.

       EELLOOOOPP  Too many symbolic links were encountered in resolving _p_a_t_h.

       EENNAAMMEETTOOOOLLOONNGG
              _p_a_t_h is too long.

       EENNOOEENNTT The file does not exist.

       EENNOOMMEEMM Insufficient kernel memory was available.

       EENNOOTTDDIIRR
              A component of _p_a_t_h is not a directory.

       EEPPEERRMM  The caller has insufficient privilege.

CCOONNFFOORRMMIINNGG TTOO
       SVr4, 4.4BSD, SUSv2 (marked LEGACY).  This function is not part of
       POSIX.1-2001.

NNOOTTEESS
       A child process created via ffoorrkk(2) inherits its parent's root
       directory.  The root directory is left unchanged by eexxeeccvvee(2).

       FreeBSD has a stronger jjaaiill() system call.

SSEEEE AALLSSOO
       cchhrroooott(1), cchhddiirr(2), ppiivvoott__rroooott(2), ppaatthh__rreessoolluuttiioonn(7), sswwiittcchh__rroooott(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                         CHROOT(2)
