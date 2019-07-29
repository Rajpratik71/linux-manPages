UMOUNT(2)                  Linux Programmer's Manual                 UMOUNT(2)



NNAAMMEE
       umount, umount2 - unmount filesystem

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//mmoouunntt..hh>>

       iinntt uummoouunntt((ccoonnsstt cchhaarr **_t_a_r_g_e_t));;

       iinntt uummoouunntt22((ccoonnsstt cchhaarr **_t_a_r_g_e_t,, iinntt _f_l_a_g_s));;

DDEESSCCRRIIPPTTIIOONN
       uummoouunntt() and uummoouunntt22() remove the attachment of the (topmost)
       filesystem mounted on _t_a_r_g_e_t.

       Appropriate privilege (Linux: the CCAAPP__SSYYSS__AADDMMIINN capability) is required
       to unmount filesystems.

       Linux 2.1.116 added the uummoouunntt22() system call, which, like uummoouunntt(),
       unmounts a target, but allows additional _f_l_a_g_s controlling the behavior
       of the operation:

       MMNNTT__FFOORRCCEE (since Linux 2.1.116)
              Ask the filesystem to abort pending requests before attempting
              the unmount.  This may allow the unmount to complete without
              waiting for an inaccessible server, but could cause data loss.
              If, after aborting requests, some processes still have active
              references to the filesystem, the unmount will still fail.  As
              at Linux 4.12, MMNNTT__FFOORRCCEE is supported only on the following
              filesystems: 9p (since Linux 2.6.16), ceph (since Linux 2.6.34),
              cifs (since Linux 2.6.12), fuse (since Linux 2.6.16), lustre
              (since Linux 3.11), and NFS (since Linux 2.1.116).

       MMNNTT__DDEETTAACCHH (since Linux 2.4.11)
              Perform a lazy unmount: make the mount point unavailable for new
              accesses, immediately disconnect the filesystem and all
              filesystems mounted below it from each other and from the mount
              table, and actually perform the unmount when the mount point
              ceases to be busy.

       MMNNTT__EEXXPPIIRREE (since Linux 2.6.8)
              Mark the mount point as expired.  If a mount point is not
              currently in use, then an initial call to uummoouunntt22() with this
              flag fails with the error EEAAGGAAIINN, but marks the mount point as
              expired.  The mount point remains expired as long as it isn't
              accessed by any process.  A second uummoouunntt22() call specifying
              MMNNTT__EEXXPPIIRREE unmounts an expired mount point.  This flag cannot be
              specified with either MMNNTT__FFOORRCCEE or MMNNTT__DDEETTAACCHH.

       UUMMOOUUNNTT__NNOOFFOOLLLLOOWW (since Linux 2.6.34)
              Don't dereference _t_a_r_g_e_t if it is a symbolic link.  This flag
              allows security problems to be avoided in set-user-ID-_r_o_o_t
              programs that allow unprivileged users to unmount filesystems.

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       The error values given below result from filesystem type independent
       errors.  Each filesystem type may have its own special errors and its
       own special behavior.  See the Linux kernel source code for details.

       EEAAGGAAIINN A call to uummoouunntt22() specifying MMNNTT__EEXXPPIIRREE successfully marked an
              unbusy filesystem as expired.

       EEBBUUSSYY  _t_a_r_g_e_t could not be unmounted because it is busy.

       EEFFAAUULLTT _t_a_r_g_e_t points outside the user address space.

       EEIINNVVAALL _t_a_r_g_e_t is not a mount point.

       EEIINNVVAALL uummoouunntt22() was called with MMNNTT__EEXXPPIIRREE and either MMNNTT__DDEETTAACCHH or
              MMNNTT__FFOORRCCEE.

       EEIINNVVAALL (since Linux 2.6.34)
              uummoouunntt22() was called with an invalid flag value in _f_l_a_g_s.

       EENNAAMMEETTOOOOLLOONNGG
              A pathname was longer than MMAAXXPPAATTHHLLEENN.

       EENNOOEENNTT A pathname was empty or had a nonexistent component.

       EENNOOMMEEMM The kernel could not allocate a free page to copy filenames or
              data into.

       EEPPEERRMM  The caller does not have the required privileges.

VVEERRSSIIOONNSS
       MMNNTT__DDEETTAACCHH and MMNNTT__EEXXPPIIRREE are available in glibc since version 2.11.

CCOONNFFOORRMMIINNGG TTOO
       These functions are Linux-specific and should not be used in programs
       intended to be portable.

NNOOTTEESS
   uummoouunntt(()) aanndd sshhaarreedd mmoouunntt ppooiinnttss
       Shared mount points cause any mount activity on a mount point,
       including uummoouunntt() operations, to be forwarded to every shared mount
       point in the peer group and every slave mount of that peer group.  This
       means that uummoouunntt() of any peer in a set of shared mounts will cause
       all of its peers to be unmounted and all of their slaves to be
       unmounted as well.

       This propagation of unmount activity can be particularly surprising on
       systems where every mount point is shared by default.  On such systems,
       recursively bind mounting the root directory of the filesystem onto a
       subdirectory and then later unmounting that subdirectory with
       MMNNTT__DDEETTAACCHH will cause every mount in the mount namespace to be lazily
       unmounted.

       To ensure uummoouunntt() does not propagate in this fashion, the mount point
       may be remounted using a mmoouunntt() call with a _m_o_u_n_t___f_l_a_g_s argument that
       includes both MMSS__RREECC and MMSS__PPRRIIVVAATTEE prior to uummoouunntt() being called.

   HHiissttoorriiccaall ddeettaaiillss
       The original uummoouunntt() function was called as _u_m_o_u_n_t_(_d_e_v_i_c_e_) and would
       return EENNOOTTBBLLKK when called with something other than a block device.
       In Linux 0.98p4, a call _u_m_o_u_n_t_(_d_i_r_) was added, in order to support
       anonymous devices.  In Linux 2.3.99-pre7, the call _u_m_o_u_n_t_(_d_e_v_i_c_e_) was
       removed, leaving only _u_m_o_u_n_t_(_d_i_r_) (since now devices can be mounted in
       more than one place, so specifying the device does not suffice).

SSEEEE AALLSSOO
       mmoouunntt(2), mmoouunntt__nnaammeessppaacceess(7), ppaatthh__rreessoolluuttiioonn(7), mmoouunntt(8), uummoouunntt(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                         UMOUNT(2)
