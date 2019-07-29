MOUNT(2)                   Linux Programmer's Manual                  MOUNT(2)



NNAAMMEE
       mount - mount filesystem

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//mmoouunntt..hh>>

       iinntt mmoouunntt((ccoonnsstt cchhaarr **_s_o_u_r_c_e,, ccoonnsstt cchhaarr **_t_a_r_g_e_t,,
                 ccoonnsstt cchhaarr **_f_i_l_e_s_y_s_t_e_m_t_y_p_e,, uunnssiiggnneedd lloonngg _m_o_u_n_t_f_l_a_g_s,,
                 ccoonnsstt vvooiidd **_d_a_t_a));;

DDEESSCCRRIIPPTTIIOONN
       mmoouunntt() attaches the filesystem specified by _s_o_u_r_c_e (which is often a
       pathname referring to a device, but can also be the pathname of a
       directory or file, or a dummy string) to the location (a directory or
       file) specified by the pathname in _t_a_r_g_e_t.

       Appropriate privilege (Linux: the CCAAPP__SSYYSS__AADDMMIINN capability) is required
       to mount filesystems.

       Values for the _f_i_l_e_s_y_s_t_e_m_t_y_p_e argument supported by the kernel are
       listed in _/_p_r_o_c_/_f_i_l_e_s_y_s_t_e_m_s (e.g., "btrfs", "ext4", "jfs", "xfs",
       "vfat", "fuse", "tmpfs", "cgroup", "proc", "mqueue", "nfs", "cifs",
       "iso9660").  Further types may become available when the appropriate
       modules are loaded.

       The _d_a_t_a argument is interpreted by the different filesystems.
       Typically it is a string of comma-separated options understood by this
       filesystem.  See mmoouunntt(8) for details of the options available for each
       filesystem type.

       A call to mmoouunntt() performs one of a number of general types of
       operation, depending on the bits specified in _m_o_u_n_t_f_l_a_g_s.  The choice
       of which operation to perform is determined by testing the bits set in
       _m_o_u_n_t_f_l_a_g_s, with the tests being conducted in the order listed here:

       *  Remount an existing mount: _m_o_u_n_t_f_l_a_g_s includes MMSS__RREEMMOOUUNNTT.

       *  Create a bind mount: _m_o_u_n_t_f_l_a_g_s includes MMSS__BBIINNDD.

       *  Change the propagation type of an existing mount: _m_o_u_n_t_f_l_a_g_s
          includes one of MMSS__SSHHAARREEDD, MMSS__PPRRIIVVAATTEE, MMSS__SSLLAAVVEE, or MMSS__UUNNBBIINNDDAABBLLEE.

       *  Move an existing mount to a new location: _m_o_u_n_t_f_l_a_g_s includes
          MMSS__MMOOVVEE.

       *  Create a new mount: _m_o_u_n_t_f_l_a_g_s includes none of the above flags.

       Each of these operations is detailed later in this page.  Further flags
       may be specified in _m_o_u_n_t_f_l_a_g_s to modify the behavior of mmoouunntt(), as
       described below.

   AAddddiittiioonnaall mmoouunntt ffllaaggss
       The list below describes the additional flags that can be specified in
       _m_o_u_n_t_f_l_a_g_s.  Note that some operation types ignore some or all of these
       flags, as described later in this page.

       MMSS__DDIIRRSSYYNNCC (since Linux 2.5.19)
              Make directory changes on this filesystem synchronous.  (This
              property can be obtained for individual directories or subtrees
              using cchhaattttrr(1).)

       MMSS__LLAAZZYYTTIIMMEE (since Linux 4.0)
              Reduce on-disk updates of inode timestamps (atime, mtime, ctime)
              by maintaining these changes only in memory.  The on-disk
              timestamps are updated only when:

              (a)  the inode needs to be updated for some change unrelated to
                   file timestamps;

              (b)  the application employs ffssyynncc(2), ssyynnccffss(2), or ssyynncc(2);

              (c)  an undeleted inode is evicted from memory; or

              (d)  more than 24 hours have passed since the inode was written
                   to disk.

              This mount option significantly reduces writes needed to update
              the inode's timestamps, especially mtime and atime.  However, in
              the event of a system crash, the atime and mtime fields on disk
              might be out of date by up to 24 hours.

       Examples of workloads where this option could be of significant benefit
       include frequent random writes to preallocated files, as well as cases
       where the MMSS__SSTTRRIICCTTAATTIIMMEE mount option is also enabled.  (The advantage
       of combining MMSS__SSTTRRIICCTTAATTIIMMEE and MMSS__LLAAZZYYTTIIMMEE is that ssttaatt(2) will return
       the correctly updated atime, but the atime updates will be flushed to
       disk only in the cases listed above.)

       MMSS__MMAANNDDLLOOCCKK
              Permit mandatory locking on files in this filesystem.
              (Mandatory locking must still be enabled on a per-file basis, as
              described in ffccnnttll(2).)  Since Linux 4.5, this mount option
              requires the CCAAPP__SSYYSS__AADDMMIINN capability.

       MMSS__NNOOAATTIIMMEE
              Do not update access times for (all types of) files on this
              filesystem.

       MMSS__NNOODDEEVV
              Do not allow access to devices (special files) on this
              filesystem.

       MMSS__NNOODDIIRRAATTIIMMEE
              Do not update access times for directories on this filesystem.
              This flag provides a subset of the functionality provided by
              MMSS__NNOOAATTIIMMEE; that is, MMSS__NNOOAATTIIMMEE implies MMSS__NNOODDIIRRAATTIIMMEE.

       MMSS__NNOOEEXXEECC
              Do not allow programs to be executed from this filesystem.

       MMSS__NNOOSSUUIIDD
              Do not honor set-user-ID and set-group-ID bits or file
              capabilities when executing programs from this filesystem.

       MMSS__RRDDOONNLLYY
              Mount filesystem read-only.

       MMSS__RREECC (since Linux 2.4.11)
              Used in conjunction with MMSS__BBIINNDD to create a recursive bind
              mount, and in conjunction with the propagation type flags to
              recursively change the propagation type of all of the mounts in
              a subtree.  See below for further details.

       MMSS__RREELLAATTIIMMEE (since Linux 2.6.20)
              When a file on this filesystem is accessed, update the file's
              last access time (atime) only if the current value of atime is
              less than or equal to the file's last modification time (mtime)
              or last status change time (ctime).  This option is useful for
              programs, such as mmuutttt(1), that need to know when a file has
              been read since it was last modified.  Since Linux 2.6.30, the
              kernel defaults to the behavior provided by this flag (unless
              MMSS__NNOOAATTIIMMEE was specified), and the MMSS__SSTTRRIICCTTAATTIIMMEE flag is
              required to obtain traditional semantics.  In addition, since
              Linux 2.6.30, the file's last access time is always updated if
              it is more than 1 day old.

       MMSS__SSIILLEENNTT (since Linux 2.6.17)
              Suppress the display of certain (_p_r_i_n_t_k()) warning messages in
              the kernel log.  This flag supersedes the misnamed and obsolete
              MMSS__VVEERRBBOOSSEE flag (available since Linux 2.4.12), which has the
              same meaning.

       MMSS__SSTTRRIICCTTAATTIIMMEE (since Linux 2.6.30)
              Always update the last access time (atime) when files on this
              filesystem are accessed.  (This was the default behavior before
              Linux 2.6.30.)  Specifying this flag overrides the effect of
              setting the MMSS__NNOOAATTIIMMEE and MMSS__RREELLAATTIIMMEE flags.

       MMSS__SSYYNNCCHHRROONNOOUUSS
              Make writes on this filesystem synchronous (as though the OO__SSYYNNCC
              flag to ooppeenn(2) was specified for all file opens to this
              filesystem).

       From Linux 2.4 onward, the MMSS__NNOODDEEVV, MMSS__NNOOEEXXEECC, and MMSS__NNOOSSUUIIDD flags are
       settable on a per-mount-point basis.  From kernel 2.6.16 onward,
       MMSS__NNOOAATTIIMMEE and MMSS__NNOODDIIRRAATTIIMMEE are also settable on a per-mount-point
       basis.  The MMSS__RREELLAATTIIMMEE flag is also settable on a per-mount-point
       basis.  Since Linux 2.6.16, MMSS__RRDDOONNLLYY can be set or cleared on a per-
       mount-point basis as well as on the underlying filesystem.  The mounted
       filesystem will be writable only if neither the filesystem nor the
       mountpoint are flagged as read-only.

   RReemmoouunnttiinngg aann eexxiissttiinngg mmoouunntt
       An existing mount may be remounted by specifying MMSS__RREEMMOOUUNNTT in
       _m_o_u_n_t_f_l_a_g_s.  This allows you to change the _m_o_u_n_t_f_l_a_g_s and _d_a_t_a of an
       existing mount without having to unmount and remount the filesystem.
       _t_a_r_g_e_t should be the same value specified in the initial mmoouunntt() call.

       The _s_o_u_r_c_e and _f_i_l_e_s_y_s_t_e_m_t_y_p_e arguments are ignored.

       The _m_o_u_n_t_f_l_a_g_s and _d_a_t_a arguments should match the values used in the
       original mmoouunntt() call, except for those parameters that are being
       deliberately changed.  Another exception is that MMSS__BBIINNDD has a
       different meaning for remount, and it should be included only if
       explicitly desired.

       The following _m_o_u_n_t_f_l_a_g_s can be changed: MMSS__LLAAZZYYTTIIMMEE, MMSS__MMAANNDDLLOOCCKK,
       MMSS__NNOOAATTIIMMEE, MMSS__NNOODDEEVV, MMSS__NNOODDIIRRAATTIIMMEE, MMSS__NNOOEEXXEECC, MMSS__NNOOSSUUIIDD, MMSS__RREELLAATTIIMMEE,
       MMSS__RRDDOONNLLYY, and MMSS__SSYYNNCCHHRROONNOOUUSS.  Attempts to change the setting of the
       MMSS__DDIIRRSSYYNNCC flag during a remount are silently ignored.

       Since Linux 3.17, if none of MMSS__NNOOAATTIIMMEE, MMSS__NNOODDIIRRAATTIIMMEE, MMSS__RREELLAATTIIMMEE, or
       MMSS__SSTTRRIICCTTAATTIIMMEE is specified in _m_o_u_n_t_f_l_a_g_s, then the remount operation
       preserves the existing values of these flags (rather than defaulting to
       MMSS__RREELLAATTIIMMEE).

       Since Linux 2.6.26, this flag can be used with MMSS__BBIINNDD to modify only
       the per-mount-point flags.  This is particularly useful for setting or
       clearing the "read-only" flag on a mount point without changing the
       underlying filesystem.  Specifying _m_o_u_n_t_f_l_a_g_s as:

           MS_REMOUNT | MS_BIND | MS_RDONLY

       will make access through this mountpoint read-only, without affecting
       other mount points.

   CCrreeaattiinngg aa bbiinndd mmoouunntt
       If _m_o_u_n_t_f_l_a_g_s includes MMSS__BBIINNDD (available since Linux 2.4), then
       perform a bind mount.  A bind mount makes a file or a directory subtree
       visible at another point within the single directory hierarchy.  Bind
       mounts may cross filesystem boundaries and span cchhrroooott(2) jails.

       The _f_i_l_e_s_y_s_t_e_m_t_y_p_e and _d_a_t_a arguments are ignored.

       The remaining bits in the _m_o_u_n_t_f_l_a_g_s argument are also ignored, with
       the exception of MMSS__RREECC.  (The bind mount has the same mount options as
       the underlying mount point.)  However, see the discussion of remounting
       above, for a method of making an existing bind mount read-only.

       By default, when a directory is bind mounted, only that directory is
       mounted; if there are any submounts under the directory tree, they are
       not bind mounted.  If the MMSS__RREECC flag is also specified, then a
       recursive bind mount operation is performed: all submounts under the
       _s_o_u_r_c_e subtree (other than unbindable mounts) are also bind mounted at
       the corresponding location in the _t_a_r_g_e_t subtree.

   CChhaannggiinngg tthhee pprrooppaaggaattiioonn ttyyppee ooff aann eexxiissttiinngg mmoouunntt
       If _m_o_u_n_t_f_l_a_g_s includes one of MMSS__SSHHAARREEDD, MMSS__PPRRIIVVAATTEE, MMSS__SSLLAAVVEE, or
       MMSS__UUNNBBIINNDDAABBLLEE (all available since Linux 2.6.15), then the propagation
       type of an existing mount is changed.  If more than one of these flags
       is specified, an error results.

       The only flags that can be used with changing the propagation type are
       MMSS__RREECC and MMSS__SSIILLEENNTT.

       The _s_o_u_r_c_e, _f_i_l_e_s_y_s_t_e_m_t_y_p_e, and _d_a_t_a arguments are ignored.

       The meanings of the propagation type flags are as follows:

       MMSS__SSHHAARREEDD
              Make this mount point shared.  Mount and unmount events
              immediately under this mount point will propagate to the other
              mount points that are members of this mount's peer group.
              Propagation here means that the same mount or unmount will
              automatically occur under all of the other mount points in the
              peer group.  Conversely, mount and unmount events that take
              place under peer mount points will propagate to this mount
              point.

       MMSS__PPRRIIVVAATTEE
              Make this mount point private.  Mount and unmount events do not
              propagate into or out of this mount point.

       MMSS__SSLLAAVVEE
              If this is a shared mount point that is a member of a peer group
              that contains other members, convert it to a slave mount.  If
              this is a shared mount point that is a member of a peer group
              that contains no other members, convert it to a private mount.
              Otherwise, the propagation type of the mount point is left
              unchanged.

       When a mount point is a slave, mount and unmount events propagate into
       this mount point from the (master) shared peer group of which it was
       formerly a member.  Mount and unmount events under this mount point do
       not propagate to any peer.

       A mount point can be the slave of another peer group while at the same
       time sharing mount and unmount events with a peer group of which it is
       a member.

       MMSS__UUNNBBIINNDDAABBLLEE
              Make this mount unbindable.  This is like a private mount, and
              in addition this mount can't be bind mounted.  When a recursive
              bind mount (mmoouunntt() with the MMSS__BBIINNDD and MMSS__RREECC flags) is
              performed on a directory subtree, any bind mounts within the
              subtree are automatically pruned (i.e., not replicated) when
              replicating that subtree to produce the target subtree.

       By default, changing the propagation type affects only the _t_a_r_g_e_t mount
       point.  If the MMSS__RREECC flag is also specified in _m_o_u_n_t_f_l_a_g_s, then the
       propagation type of all mount points under _t_a_r_g_e_t is also changed.

       For further details regarding mount propagation types (including the
       default propagation type assigned to new mounts), see
       mmoouunntt__nnaammeessppaacceess(7).

   MMoovviinngg aa mmoouunntt
       If _m_o_u_n_t_f_l_a_g_s contains the flag MMSS__MMOOVVEE (available since Linux 2.4.18),
       then move a subtree: _s_o_u_r_c_e specifies an existing mount point and
       _t_a_r_g_e_t specifies the new location to which that mount point is to be
       relocated.  The move is atomic: at no point is the subtree unmounted.

       The remaining bits in the _m_o_u_n_t_f_l_a_g_s argument are ignored, as are the
       _f_i_l_e_s_y_s_t_e_m_t_y_p_e and _d_a_t_a arguments.

   CCrreeaattiinngg aa nneeww mmoouunntt ppooiinntt
       If none of MMSS__RREEMMOOUUNNTT, MMSS__BBIINNDD, MMSS__MMOOVVEE, MMSS__SSHHAARREEDD, MMSS__PPRRIIVVAATTEE,
       MMSS__SSLLAAVVEE, or MMSS__UUNNBBIINNDDAABBLLEE is specified in _m_o_u_n_t_f_l_a_g_s, then mmoouunntt()
       performs its default action: creating a new mount point.  _s_o_u_r_c_e
       specifies the source for the new mount point, and _t_a_r_g_e_t specifies the
       directory at which to create the mount point.

       The _f_i_l_e_s_y_s_t_e_m_t_y_p_e and _d_a_t_a arguments are employed, and further bits
       may be specified in _m_o_u_n_t_f_l_a_g_s to modify the behavior of the call.

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       The error values given below result from filesystem type independent
       errors.  Each filesystem type may have its own special errors and its
       own special behavior.  See the Linux kernel source code for details.

       EEAACCCCEESS A component of a path was not searchable.  (See also
              ppaatthh__rreessoolluuttiioonn(7).)

       EEAACCCCEESS Mounting a read-only filesystem was attempted without giving the
              MMSS__RRDDOONNLLYY flag.

       EEAACCCCEESS The block device _s_o_u_r_c_e is located on a filesystem mounted with
              the MMSS__NNOODDEEVV option.

       EEBBUUSSYY  An attempt was made to stack a new mount directly on top of an
              existing mount point that was created in this mount namespace
              with the same _s_o_u_r_c_e and _t_a_r_g_e_t.

       EEBBUUSSYY  _s_o_u_r_c_e cannot be remounted read-only, because it still holds
              files open for writing.

       EEFFAAUULLTT One of the pointer arguments points outside the user address
              space.

       EEIINNVVAALL _s_o_u_r_c_e had an invalid superblock.

       EEIINNVVAALL A remount operation (MMSS__RREEMMOOUUNNTT) was attempted, but _s_o_u_r_c_e was
              not already mounted on _t_a_r_g_e_t.

       EEIINNVVAALL A move operation (MMSS__MMOOVVEE) was attempted, but _s_o_u_r_c_e was not a
              mount point, or was '/'.

       EEIINNVVAALL _m_o_u_n_t_f_l_a_g_s includes more than one of MMSS__SSHHAARREEDD, MMSS__PPRRIIVVAATTEE,
              MMSS__SSLLAAVVEE, or MMSS__UUNNBBIINNDDAABBLLEE.

       EEIINNVVAALL _m_o_u_n_t_f_l_a_g_s includes MMSS__SSHHAARREEDD, MMSS__PPRRIIVVAATTEE, MMSS__SSLLAAVVEE, or
              MMSS__UUNNBBIINNDDAABBLLEE and also includes a flag other than MMSS__RREECC or
              MMSS__SSIILLEENNTT.

       EEIINNVVAALL An attempt was made to bind mount an unbindable mount.

       EEIINNVVAALL In an unprivileged mount namespace (i.e., a mount namespace
              owned by a user namespace that was created by an unprivileged
              user), a bind mount operation (MMSS__BBIINNDD) was attempted without
              specifying (MMSS__RREECC), which would have revealed the filesystem
              tree underneath one of the submounts of the directory being
              bound.

       EELLOOOOPP  Too many links encountered during pathname resolution.

       EELLOOOOPP  A move operation was attempted, and _t_a_r_g_e_t is a descendant of
              _s_o_u_r_c_e.

       EEMMFFIILLEE (In case no block device is required:) Table of dummy devices is
              full.

       EENNAAMMEETTOOOOLLOONNGG
              A pathname was longer than MMAAXXPPAATTHHLLEENN.

       EENNOODDEEVV _f_i_l_e_s_y_s_t_e_m_t_y_p_e not configured in the kernel.

       EENNOOEENNTT A pathname was empty or had a nonexistent component.

       EENNOOMMEEMM The kernel could not allocate a free page to copy filenames or
              data into.

       EENNOOTTBBLLKK
              _s_o_u_r_c_e is not a block device (and a device was required).

       EENNOOTTDDIIRR
              _t_a_r_g_e_t, or a prefix of _s_o_u_r_c_e, is not a directory.

       EENNXXIIOO  The major number of the block device _s_o_u_r_c_e is out of range.

       EEPPEERRMM  The caller does not have the required privileges.

VVEERRSSIIOONNSS
       The definitions of MMSS__DDIIRRSSYYNNCC, MMSS__MMOOVVEE, MMSS__PPRRIIVVAATTEE, MMSS__RREECC,
       MMSS__RREELLAATTIIMMEE, MMSS__SSHHAARREEDD, MMSS__SSLLAAVVEE, MMSS__SSTTRRIICCTTAATTIIMMEE and MMSS__UUNNBBIINNDDAABBLLEE were
       added to glibc headers in version 2.12.

CCOONNFFOORRMMIINNGG TTOO
       This function is Linux-specific and should not be used in programs
       intended to be portable.

NNOOTTEESS
       Since Linux 2.4 a single filesystem can be mounted at multiple mount
       points, and multiple mounts can be stacked on the same mount point.

       The _m_o_u_n_t_f_l_a_g_s argument may have the magic number 0xC0ED (MMSS__MMGGCC__VVAALL)
       in the top 16 bits.  (All of the other flags discussed in DESCRIPTION
       occupy the low order 16 bits of _m_o_u_n_t_f_l_a_g_s.) Specifying MMSS__MMGGCC__VVAALL was
       required in kernel versions prior to 2.4, but since Linux 2.4 is no
       longer required and is ignored if specified.

       The original MMSS__SSYYNNCC flag was renamed MMSS__SSYYNNCCHHRROONNOOUUSS in 1.1.69 when a
       different MMSS__SSYYNNCC was added to _<_m_m_a_n_._h_>.

       Before Linux 2.4 an attempt to execute a set-user-ID or set-group-ID
       program on a filesystem mounted with MMSS__NNOOSSUUIIDD would fail with EEPPEERRMM.
       Since Linux 2.4 the set-user-ID and set-group-ID bits are just silently
       ignored in this case.

   PPeerr--pprroocceessss nnaammeessppaacceess
       Starting with kernel 2.4.19, Linux provides per-process mount
       namespaces.  A mount namespace is the set of filesystem mounts that are
       visible to a process.  Mount-point namespaces can be (and usually are)
       shared between multiple processes, and changes to the namespace (i.e.,
       mounts and unmounts) by one process are visible to all other processes
       sharing the same namespace.  (The pre-2.4.19 Linux situation can be
       considered as one in which a single namespace was shared by every
       process on the system.)

       A child process created by ffoorrkk(2) shares its parent's mount namespace;
       the mount namespace is preserved across an eexxeeccvvee(2).

       A process can obtain a private mount namespace if: it was created using
       the cclloonnee(2) CCLLOONNEE__NNEEWWNNSS flag, in which case its new namespace is
       initialized to be a _c_o_p_y of the namespace of the process that called
       cclloonnee(2); or it calls uunnsshhaarree(2) with the CCLLOONNEE__NNEEWWNNSS flag, which
       causes the caller's mount namespace to obtain a private copy of the
       namespace that it was previously sharing with other processes, so that
       future mounts and unmounts by the caller are invisible to other
       processes (except child processes that the caller subsequently creates)
       and vice versa.

       The Linux-specific _/_p_r_o_c_/_[_p_i_d_]_/_m_o_u_n_t_s file exposes the list of mount
       points in the mount namespace of the process with the specified ID; see
       pprroocc(5) for details.

SSEEEE AALLSSOO
       mmoouunnttppooiinntt(1), uummoouunntt(2), mmoouunntt__nnaammeessppaacceess(7), ppaatthh__rreessoolluuttiioonn(7),
       ffiinnddmmnntt(8), llssbbllkk(8), mmoouunntt(8), uummoouunntt(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2018-02-02                          MOUNT(2)
