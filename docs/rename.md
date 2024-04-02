RENAME(2)                  Linux Programmer's Manual                 RENAME(2)



NNAAMMEE
       rename, renameat, renameat2 - change the name or location of a file

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssttddiioo..hh>>

       iinntt rreennaammee((ccoonnsstt cchhaarr **_o_l_d_p_a_t_h,, ccoonnsstt cchhaarr **_n_e_w_p_a_t_h));;

       ##iinncclluuddee <<ffccnnttll..hh>>           /* Definition of AT_* constants */
       ##iinncclluuddee <<ssttddiioo..hh>>

       iinntt rreennaammeeaatt((iinntt _o_l_d_d_i_r_f_d,, ccoonnsstt cchhaarr **_o_l_d_p_a_t_h,,
                    iinntt _n_e_w_d_i_r_f_d,, ccoonnsstt cchhaarr **_n_e_w_p_a_t_h));;

       iinntt rreennaammeeaatt22((iinntt _o_l_d_d_i_r_f_d,, ccoonnsstt cchhaarr **_o_l_d_p_a_t_h,,
                     iinntt _n_e_w_d_i_r_f_d,, ccoonnsstt cchhaarr **_n_e_w_p_a_t_h,, uunnssiiggnneedd iinntt _f_l_a_g_s));;

       _N_o_t_e: There is no glibc wrapper for rreennaammeeaatt22(); see NOTES.

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       rreennaammeeaatt():
           Since glibc 2.10:
               _POSIX_C_SOURCE >= 200809L
           Before glibc 2.10:
               _ATFILE_SOURCE

DDEESSCCRRIIPPTTIIOONN
       rreennaammee() renames a file, moving it between directories if required.
       Any other hard links to the file (as created using lliinnkk(2)) are
       unaffected.  Open file descriptors for _o_l_d_p_a_t_h are also unaffected.

       Various restrictions determine whether or not the rename operation
       succeeds: see ERRORS below.

       If _n_e_w_p_a_t_h already exists, it will be atomically replaced, so that
       there is no point at which another process attempting to access _n_e_w_p_a_t_h
       will find it missing.  However, there will probably be a window in
       which both _o_l_d_p_a_t_h and _n_e_w_p_a_t_h refer to the file being renamed.

       If _o_l_d_p_a_t_h and _n_e_w_p_a_t_h are existing hard links referring to the same
       file, then rreennaammee() does nothing, and returns a success status.

       If _n_e_w_p_a_t_h exists but the operation fails for some reason, rreennaammee()
       guarantees to leave an instance of _n_e_w_p_a_t_h in place.

       _o_l_d_p_a_t_h can specify a directory.  In this case, _n_e_w_p_a_t_h must either not
       exist, or it must specify an empty directory.

       If _o_l_d_p_a_t_h refers to a symbolic link, the link is renamed; if _n_e_w_p_a_t_h
       refers to a symbolic link, the link will be overwritten.

   rreennaammeeaatt(())
       The rreennaammeeaatt() system call operates in exactly the same way as
       rreennaammee(), except for the differences described here.

       If the pathname given in _o_l_d_p_a_t_h is relative, then it is interpreted
       relative to the directory referred to by the file descriptor _o_l_d_d_i_r_f_d
       (rather than relative to the current working directory of the calling
       process, as is done by rreennaammee() for a relative pathname).

       If _o_l_d_p_a_t_h is relative and _o_l_d_d_i_r_f_d is the special value AATT__FFDDCCWWDD, then
       _o_l_d_p_a_t_h is interpreted relative to the current working directory of the
       calling process (like rreennaammee()).

       If _o_l_d_p_a_t_h is absolute, then _o_l_d_d_i_r_f_d is ignored.

       The interpretation of _n_e_w_p_a_t_h is as for _o_l_d_p_a_t_h, except that a relative
       pathname is interpreted relative to the directory referred to by the
       file descriptor _n_e_w_d_i_r_f_d.

       See ooppeennaatt(2) for an explanation of the need for rreennaammeeaatt().

   rreennaammeeaatt22(())
       rreennaammeeaatt22() has an additional _f_l_a_g_s argument.  A rreennaammeeaatt22() call with
       a zero _f_l_a_g_s argument is equivalent to rreennaammeeaatt().

       The _f_l_a_g_s argument is a bit mask consisting of zero or more of the
       following flags:

       RREENNAAMMEE__EEXXCCHHAANNGGEE
              Atomically exchange _o_l_d_p_a_t_h and _n_e_w_p_a_t_h.  Both pathnames must
              exist but may be of different types (e.g., one could be a non-
              empty directory and the other a symbolic link).

       RREENNAAMMEE__NNOORREEPPLLAACCEE
              Don't overwrite _n_e_w_p_a_t_h of the rename.  Return an error if
              _n_e_w_p_a_t_h already exists.

              RREENNAAMMEE__NNOORREEPPLLAACCEE can't be employed together with
              RREENNAAMMEE__EEXXCCHHAANNGGEE.

       RREENNAAMMEE__WWHHIITTEEOOUUTT (since Linux 3.18)
              This operation makes sense only for overlay/union filesystem
              implementations.

              Specifying RREENNAAMMEE__WWHHIITTEEOOUUTT creates a "whiteout" object at the
              source of the rename at the same time as performing the rename.
              The whole operation is atomic, so that if the rename succeeds
              then the whiteout will also have been created.

              A "whiteout" is an object that has special meaning in
              union/overlay filesystem constructs.  In these constructs,
              multiple layers exist and only the top one is ever modified.  A
              whiteout on an upper layer will effectively hide a matching file
              in the lower layer, making it appear as if the file didn't
              exist.

              When a file that exists on the lower layer is renamed, the file
              is first copied up (if not already on the upper layer) and then
              renamed on the upper, read-write layer.  At the same time, the
              source file needs to be "whiteouted" (so that the version of the
              source file in the lower layer is rendered invisible).  The
              whole operation needs to be done atomically.

              When not part of a union/overlay, the whiteout appears as a
              character device with a {0,0} device number.

              RREENNAAMMEE__WWHHIITTEEOOUUTT requires the same privileges as creating a
              device node (i.e., the CCAAPP__MMKKNNOODD capability).

              RREENNAAMMEE__WWHHIITTEEOOUUTT can't be employed together with RREENNAAMMEE__EEXXCCHHAANNGGEE.

              RREENNAAMMEE__WWHHIITTEEOOUUTT requires support from the underlying filesystem.
              Among the filesystems that provide that support are shmem (since
              Linux 3.18), ext4 (since Linux 3.18), and XFS (since Linux 4.1).

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       EEAACCCCEESS Write permission is denied for the directory containing _o_l_d_p_a_t_h
              or _n_e_w_p_a_t_h, or, search permission is denied for one of the
              directories in the path prefix of _o_l_d_p_a_t_h or _n_e_w_p_a_t_h, or _o_l_d_p_a_t_h
              is a directory and does not allow write permission (needed to
              update the _._.  entry).  (See also ppaatthh__rreessoolluuttiioonn(7).)

       EEBBUUSSYY  The rename fails because _o_l_d_p_a_t_h or _n_e_w_p_a_t_h is a directory that
              is in use by some process (perhaps as current working directory,
              or as root directory, or because it was open for reading) or is
              in use by the system (for example as mount point), while the
              system considers this an error.  (Note that there is no
              requirement to return EEBBUUSSYY in such cases—there is nothing wrong
              with doing the rename anyway—but it is allowed to return EEBBUUSSYY
              if the system cannot otherwise handle such situations.)

       EEDDQQUUOOTT The user's quota of disk blocks on the filesystem has been
              exhausted.

       EEFFAAUULLTT _o_l_d_p_a_t_h or _n_e_w_p_a_t_h points outside your accessible address space.

       EEIINNVVAALL The new pathname contained a path prefix of the old, or, more
              generally, an attempt was made to make a directory a
              subdirectory of itself.

       EEIISSDDIIRR _n_e_w_p_a_t_h is an existing directory, but _o_l_d_p_a_t_h is not a
              directory.

       EELLOOOOPP  Too many symbolic links were encountered in resolving _o_l_d_p_a_t_h or
              _n_e_w_p_a_t_h.

       EEMMLLIINNKK _o_l_d_p_a_t_h already has the maximum number of links to it, or it was
              a directory and the directory containing _n_e_w_p_a_t_h has the maximum
              number of links.

       EENNAAMMEETTOOOOLLOONNGG
              _o_l_d_p_a_t_h or _n_e_w_p_a_t_h was too long.

       EENNOOEENNTT The link named by _o_l_d_p_a_t_h does not exist; or, a directory
              component in _n_e_w_p_a_t_h does not exist; or, _o_l_d_p_a_t_h or _n_e_w_p_a_t_h is
              an empty string.

       EENNOOMMEEMM Insufficient kernel memory was available.

       EENNOOSSPPCC The device containing the file has no room for the new directory
              entry.

       EENNOOTTDDIIRR
              A component used as a directory in _o_l_d_p_a_t_h or _n_e_w_p_a_t_h is not, in
              fact, a directory.  Or, _o_l_d_p_a_t_h is a directory, and _n_e_w_p_a_t_h
              exists but is not a directory.

       EENNOOTTEEMMPPTTYY or EEEEXXIISSTT
              _n_e_w_p_a_t_h is a nonempty directory, that is, contains entries other
              than "." and "..".

       EEPPEERRMM or EEAACCCCEESS
              The directory containing _o_l_d_p_a_t_h has the sticky bit (SS__IISSVVTTXX)
              set and the process's effective user ID is neither the user ID
              of the file to be deleted nor that of the directory containing
              it, and the process is not privileged (Linux: does not have the
              CCAAPP__FFOOWWNNEERR capability); or _n_e_w_p_a_t_h is an existing file and the
              directory containing it has the sticky bit set and the process's
              effective user ID is neither the user ID of the file to be
              replaced nor that of the directory containing it, and the
              process is not privileged (Linux: does not have the CCAAPP__FFOOWWNNEERR
              capability); or the filesystem containing _p_a_t_h_n_a_m_e does not
              support renaming of the type requested.

       EERROOFFSS  The file is on a read-only filesystem.

       EEXXDDEEVV  _o_l_d_p_a_t_h and _n_e_w_p_a_t_h are not on the same mounted filesystem.
              (Linux permits a filesystem to be mounted at multiple points,
              but rreennaammee() does not work across different mount points, even
              if the same filesystem is mounted on both.)

       The following additional errors can occur for rreennaammeeaatt() and
       rreennaammeeaatt22():

       EEBBAADDFF  _o_l_d_d_i_r_f_d or _n_e_w_d_i_r_f_d is not a valid file descriptor.

       EENNOOTTDDIIRR
              _o_l_d_p_a_t_h is relative and _o_l_d_d_i_r_f_d is a file descriptor referring
              to a file other than a directory; or similar for _n_e_w_p_a_t_h and
              _n_e_w_d_i_r_f_d

       The following additional errors can occur for rreennaammeeaatt22():

       EEEEXXIISSTT _f_l_a_g_s contains RREENNAAMMEE__NNOORREEPPLLAACCEE and _n_e_w_p_a_t_h already exists.

       EEIINNVVAALL An invalid flag was specified in _f_l_a_g_s.

       EEIINNVVAALL Both RREENNAAMMEE__NNOORREEPPLLAACCEE and RREENNAAMMEE__EEXXCCHHAANNGGEE were specified in
              _f_l_a_g_s.

       EEIINNVVAALL Both RREENNAAMMEE__WWHHIITTEEOOUUTT and RREENNAAMMEE__EEXXCCHHAANNGGEE were specified in
              _f_l_a_g_s.

       EEIINNVVAALL The filesystem does not support one of the flags in _f_l_a_g_s.

       EENNOOEENNTT _f_l_a_g_s contains RREENNAAMMEE__EEXXCCHHAANNGGEE and _n_e_w_p_a_t_h does not exist.

       EEPPEERRMM  RREENNAAMMEE__WWHHIITTEEOOUUTT was specified in _f_l_a_g_s, but the caller does not
              have the CCAAPP__MMKKNNOODD capability.

VVEERRSSIIOONNSS
       rreennaammeeaatt() was added to Linux in kernel 2.6.16; library support was
       added to glibc in version 2.4.

       rreennaammeeaatt22() was added to Linux in kernel 3.15.

CCOONNFFOORRMMIINNGG TTOO
       rreennaammee(): 4.3BSD, C89, C99, POSIX.1-2001, POSIX.1-2008.

       rreennaammeeaatt(): POSIX.1-2008.

       rreennaammeeaatt22() is Linux-specific.

NNOOTTEESS
       Glibc does not provide a wrapper for the rreennaammeeaatt22() system call; call
       it using ssyyssccaallll(2).

   GGlliibbcc nnootteess
       On older kernels where rreennaammeeaatt() is unavailable, the glibc wrapper
       function falls back to the use of rreennaammee().  When _o_l_d_p_a_t_h and _n_e_w_p_a_t_h
       are relative pathnames, glibc constructs pathnames based on the
       symbolic links in _/_p_r_o_c_/_s_e_l_f_/_f_d that correspond to the _o_l_d_d_i_r_f_d and
       _n_e_w_d_i_r_f_d arguments.

BBUUGGSS
       On NFS filesystems, you can not assume that if the operation failed,
       the file was not renamed.  If the server does the rename operation and
       then crashes, the retransmitted RPC which will be processed when the
       server is up again causes a failure.  The application is expected to
       deal with this.  See lliinnkk(2) for a similar problem.

SSEEEE AALLSSOO
       mmvv(1), cchhmmoodd(2), lliinnkk(2), ssyymmlliinnkk(2), uunnlliinnkk(2), ppaatthh__rreessoolluuttiioonn(7),
       ssyymmlliinnkk(7)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                         RENAME(2)
