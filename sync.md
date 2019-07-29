SYNC(2)                    Linux Programmer's Manual                   SYNC(2)



NNAAMMEE
       sync, syncfs - commit filesystem caches to disk

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>

       vvooiidd ssyynncc((vvooiidd));;

       iinntt ssyynnccffss((iinntt _f_d));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       ssyynncc():
           _XOPEN_SOURCE >= 500
               || /* Since glibc 2.19: */ _DEFAULT_SOURCE
               || /* Glibc versions <= 2.19: */ _BSD_SOURCE

       ssyynnccffss():
           _GNU_SOURCE

DDEESSCCRRIIPPTTIIOONN
       ssyynncc() causes all pending modifications to filesystem metadata and
       cached file data to be written to the underlying filesystems.

       ssyynnccffss() is like ssyynncc(), but synchronizes just the filesystem
       containing file referred to by the open file descriptor _f_d.

RREETTUURRNN VVAALLUUEE
       ssyynnccffss() returns 0 on success; on error, it returns -1 and sets _e_r_r_n_o
       to indicate the error.

EERRRROORRSS
       ssyynncc() is always successful.

       ssyynnccffss() can fail for at least the following reason:

       EEBBAADDFF  _f_d is not a valid file descriptor.

VVEERRSSIIOONNSS
       ssyynnccffss() first appeared in Linux 2.6.39; library support was added to
       glibc in version 2.14.

CCOONNFFOORRMMIINNGG TTOO
       ssyynncc(): POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.

       ssyynnccffss() is Linux-specific.

NNOOTTEESS
       Since glibc 2.2.2, the Linux prototype for ssyynncc() is as listed above,
       following the various standards.  In glibc 2.2.1 and earlier, it was
       "int sync(void)", and ssyynncc() always returned 0.

       According to the standard specification (e.g., POSIX.1-2001), ssyynncc()
       schedules the writes, but may return before the actual writing is done.
       However Linux waits for I/O completions, and thus ssyynncc() or ssyynnccffss()
       provide the same guarantees as fsync called on every file in the system
       or filesystem respectively.

BBUUGGSS
       Before version 1.3.20 Linux did not wait for I/O to complete before
       returning.

SSEEEE AALLSSOO
       ssyynncc(1), ffddaattaassyynncc(2), ffssyynncc(2)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                           SYNC(2)
