TRUNCATE(2)                Linux Programmer's Manual               TRUNCATE(2)



NNAAMMEE
       truncate, ftruncate - truncate a file to a specified length

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>
       ##iinncclluuddee <<ssyyss//ttyyppeess..hh>>

       iinntt ttrruunnccaattee((ccoonnsstt cchhaarr **_p_a_t_h,, ooffff__tt _l_e_n_g_t_h));;
       iinntt ffttrruunnccaattee((iinntt _f_d,, ooffff__tt _l_e_n_g_t_h));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       ttrruunnccaattee():
           _XOPEN_SOURCE >= 500
               || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L
               || /* Glibc versions <= 2.19: */ _BSD_SOURCE

       ffttrruunnccaattee():
           _XOPEN_SOURCE >= 500
               || /* Since glibc 2.3.5: */ _POSIX_C_SOURCE >= 200112L
               || /* Glibc versions <= 2.19: */ _BSD_SOURCE

DDEESSCCRRIIPPTTIIOONN
       The ttrruunnccaattee() and ffttrruunnccaattee() functions cause the regular file named
       by _p_a_t_h or referenced by _f_d to be truncated to a size of precisely
       _l_e_n_g_t_h bytes.

       If the file previously was larger than this size, the extra data is
       lost.  If the file previously was shorter, it is extended, and the
       extended part reads as null bytes ('\0').

       The file offset is not changed.

       If the size changed, then the st_ctime and st_mtime fields
       (respectively, time of last status change and time of last
       modification; see iinnooddee(7)) for the file are updated, and the set-user-
       ID and set-group-ID mode bits may be cleared.

       With ffttrruunnccaattee(), the file must be open for writing; with ttrruunnccaattee(),
       the file must be writable.

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       For ttrruunnccaattee():

       EEAACCCCEESS Search permission is denied for a component of the path prefix,
              or the named file is not writable by the user.  (See also
              ppaatthh__rreessoolluuttiioonn(7).)

       EEFFAAUULLTT The argument _p_a_t_h points outside the process's allocated address
              space.

       EEFFBBIIGG  The argument _l_e_n_g_t_h is larger than the maximum file size. (XSI)

       EEIINNTTRR  While blocked waiting to complete, the call was interrupted by a
              signal handler; see ffccnnttll(2) and ssiiggnnaall(7).

       EEIINNVVAALL The argument _l_e_n_g_t_h is negative or larger than the maximum file
              size.

       EEIIOO    An I/O error occurred updating the inode.

       EEIISSDDIIRR The named file is a directory.

       EELLOOOOPP  Too many symbolic links were encountered in translating the
              pathname.

       EENNAAMMEETTOOOOLLOONNGG
              A component of a pathname exceeded 255 characters, or an entire
              pathname exceeded 1023 characters.

       EENNOOEENNTT The named file does not exist.

       EENNOOTTDDIIRR
              A component of the path prefix is not a directory.

       EEPPEERRMM  The underlying filesystem does not support extending a file
              beyond its current size.

       EEPPEERRMM  The operation was prevented by a file seal; see ffccnnttll(2).

       EERROOFFSS  The named file resides on a read-only filesystem.

       EETTXXTTBBSSYY
              The file is an executable file that is being executed.

       For ffttrruunnccaattee() the same errors apply, but instead of things that can
       be wrong with _p_a_t_h, we now have things that can be wrong with the file
       descriptor, _f_d:

       EEBBAADDFF  _f_d is not a valid file descriptor.

       EEBBAADDFF or EEIINNVVAALL
              _f_d is not open for writing.

       EEIINNVVAALL _f_d does not reference a regular file or a POSIX shared memory
              object.

       EEIINNVVAALL or EEBBAADDFF
              The file descriptor _f_d is not open for writing.  POSIX permits,
              and portable applications should handle, either error for this
              case.  (Linux produces EEIINNVVAALL.)

CCOONNFFOORRMMIINNGG TTOO
       POSIX.1-2001, POSIX.1-2008, 4.4BSD, SVr4 (these calls first appeared in
       4.2BSD).

NNOOTTEESS
       ffttrruunnccaattee() can also be used to set the size of a POSIX shared memory
       object; see sshhmm__ooppeenn(7).

       The details in DESCRIPTION are for XSI-compliant systems.  For non-XSI-
       compliant systems, the POSIX standard allows two behaviors for
       ffttrruunnccaattee() when _l_e_n_g_t_h exceeds the file length (note that ttrruunnccaattee()
       is not specified at all in such an environment): either returning an
       error, or extending the file.  Like most UNIX implementations, Linux
       follows the XSI requirement when dealing with native filesystems.
       However, some nonnative filesystems do not permit ttrruunnccaattee() and
       ffttrruunnccaattee() to be used to extend a file beyond its current length: a
       notable example on Linux is VFAT.

       The original Linux ttrruunnccaattee() and ffttrruunnccaattee() system calls were not
       designed to handle large file offsets.  Consequently, Linux 2.4 added
       ttrruunnccaattee6644() and ffttrruunnccaattee6644() system calls that handle large files.
       However, these details can be ignored by applications using glibc,
       whose wrapper functions transparently employ the more recent system
       calls where they are available.

       On some 32-bit architectures, the calling signature for these system
       calls differ, for the reasons described in ssyyssccaallll(2).

BBUUGGSS
       A header file bug in glibc 2.12 meant that the minimum value of
       __PPOOSSIIXX__CC__SSOOUURRCCEE required to expose the declaration of ffttrruunnccaattee() was
       200809L instead of 200112L.  This has been fixed in later glibc
       versions.

SSEEEE AALLSSOO
       ttrruunnccaattee(1), ooppeenn(2), ssttaatt(2), ppaatthh__rreessoolluuttiioonn(7)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                       TRUNCATE(2)
