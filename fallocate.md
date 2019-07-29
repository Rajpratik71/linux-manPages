FALLOCATE(2)               Linux Programmer's Manual              FALLOCATE(2)



NNAAMMEE
       fallocate - manipulate file space

SSYYNNOOPPSSIISS
       ##ddeeffiinnee __GGNNUU__SSOOUURRCCEE             /* See feature_test_macros(7) */
       ##iinncclluuddee <<ffccnnttll..hh>>

       iinntt ffaallllooccaattee((iinntt _f_d,, iinntt _m_o_d_e,, ooffff__tt _o_f_f_s_e_t,, ooffff__tt _l_e_n));;

DDEESSCCRRIIPPTTIIOONN
       This is a nonportable, Linux-specific system call.  For the portable,
       POSIX.1-specified method of ensuring that space is allocated for a
       file, see ppoossiixx__ffaallllooccaattee(3).

       ffaallllooccaattee() allows the caller to directly manipulate the allocated disk
       space for the file referred to by _f_d for the byte range starting at
       _o_f_f_s_e_t and continuing for _l_e_n bytes.

       The _m_o_d_e argument determines the operation to be performed on the given
       range.  Details of the supported operations are given in the
       subsections below.

   AAllllooccaattiinngg ddiisskk ssppaaccee
       The default operation (i.e., _m_o_d_e is zero) of ffaallllooccaattee() allocates the
       disk space within the range specified by _o_f_f_s_e_t and _l_e_n.  The file size
       (as reported by ssttaatt(2)) will be changed if _o_f_f_s_e_t+_l_e_n is greater than
       the file size.  Any subregion within the range specified by _o_f_f_s_e_t and
       _l_e_n that did not contain data before the call will be initialized to
       zero.  This default behavior closely resembles the behavior of the
       ppoossiixx__ffaallllooccaattee(3) library function, and is intended as a method of
       optimally implementing that function.

       After a successful call, subsequent writes into the range specified by
       _o_f_f_s_e_t and _l_e_n are guaranteed not to fail because of lack of disk
       space.

       If the FFAALLLLOOCC__FFLL__KKEEEEPP__SSIIZZEE flag is specified in _m_o_d_e, the behavior of
       the call is similar, but the file size will not be changed even if
       _o_f_f_s_e_t+_l_e_n is greater than the file size.  Preallocating zeroed blocks
       beyond the end of the file in this manner is useful for optimizing
       append workloads.

       If the FFAALLLLOOCC__FFLL__UUNNSSHHAARREE flag is specified in _m_o_d_e, shared file data
       extents will be made private to the file to guarantee that a subsequent
       write will not fail due to lack of space.  Typically, this will be done
       by performing a copy-on-write operation on all shared data in the file.
       This flag may not be supported by all filesystems.

       Because allocation is done in block size chunks, ffaallllooccaattee() may
       allocate a larger range of disk space than was specified.

   DDeeaallllooccaattiinngg ffiillee ssppaaccee
       Specifying the FFAALLLLOOCC__FFLL__PPUUNNCCHH__HHOOLLEE flag (available since Linux 2.6.38)
       in _m_o_d_e deallocates space (i.e., creates a hole) in the byte range
       starting at _o_f_f_s_e_t and continuing for _l_e_n bytes.  Within the specified
       range, partial filesystem blocks are zeroed, and whole filesystem
       blocks are removed from the file.  After a successful call, subsequent
       reads from this range will return zeros.

       The FFAALLLLOOCC__FFLL__PPUUNNCCHH__HHOOLLEE flag must be ORed with FFAALLLLOOCC__FFLL__KKEEEEPP__SSIIZZEE in
       _m_o_d_e; in other words, even when punching off the end of the file, the
       file size (as reported by ssttaatt(2)) does not change.

       Not all filesystems support FFAALLLLOOCC__FFLL__PPUUNNCCHH__HHOOLLEE; if a filesystem
       doesn't support the operation, an error is returned.  The operation is
       supported on at least the following filesystems:

       *  XFS (since Linux 2.6.38)

       *  ext4 (since Linux 3.0)

       *  Btrfs (since Linux 3.7)

       *  ttmmppffss(5) (since Linux 3.5)

   CCoollllaappssiinngg ffiillee ssppaaccee
       Specifying the FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE flag (available since Linux
       3.15) in _m_o_d_e removes a byte range from a file, without leaving a hole.
       The byte range to be collapsed starts at _o_f_f_s_e_t and continues for _l_e_n
       bytes.  At the completion of the operation, the contents of the file
       starting at the location _o_f_f_s_e_t_+_l_e_n will be appended at the location
       _o_f_f_s_e_t, and the file will be _l_e_n bytes smaller.

       A filesystem may place limitations on the granularity of the operation,
       in order to ensure efficient implementation.  Typically, _o_f_f_s_e_t and _l_e_n
       must be a multiple of the filesystem logical block size, which varies
       according to the filesystem type and configuration.  If a filesystem
       has such a requirement, ffaallllooccaattee() fails with the error EEIINNVVAALL if this
       requirement is violated.

       If the region specified by _o_f_f_s_e_t plus _l_e_n reaches or passes the end of
       file, an error is returned; instead, use ffttrruunnccaattee(2) to truncate a
       file.

       No other flags may be specified in _m_o_d_e in conjunction with
       FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE.

       As at Linux 3.15, FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE is supported by ext4 (only
       for extent-based files) and XFS.

   ZZeerrooiinngg ffiillee ssppaaccee
       Specifying the FFAALLLLOOCC__FFLL__ZZEERROO__RRAANNGGEE flag (available since Linux 3.15)
       in _m_o_d_e zeros space in the byte range starting at _o_f_f_s_e_t and continuing
       for _l_e_n bytes.  Within the specified range, blocks are preallocated for
       the regions that span the holes in the file.  After a successful call,
       subsequent reads from this range will return zeros.

       Zeroing is done within the filesystem preferably by converting the
       range into unwritten extents.  This approach means that the specified
       range will not be physically zeroed out on the device (except for
       partial blocks at the either end of the range), and I/O is (otherwise)
       required only to update metadata.

       If the FFAALLLLOOCC__FFLL__KKEEEEPP__SSIIZZEE flag is additionally specified in _m_o_d_e, the
       behavior of the call is similar, but the file size will not be changed
       even if _o_f_f_s_e_t+_l_e_n is greater than the file size.  This behavior is the
       same as when preallocating space with FFAALLLLOOCC__FFLL__KKEEEEPP__SSIIZZEE specified.

       Not all filesystems support FFAALLLLOOCC__FFLL__ZZEERROO__RRAANNGGEE; if a filesystem
       doesn't support the operation, an error is returned.  The operation is
       supported on at least the following filesystems:

       *  XFS (since Linux 3.15)

       *  ext4, for extent-based files (since Linux 3.15)

       *  SMB3 (since Linux 3.17)

       *  Btrfs (since Linux 4.16)

   IInnccrreeaassiinngg ffiillee ssppaaccee
       Specifying the FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE flag (available since Linux 4.1)
       in _m_o_d_e increases the file space by inserting a hole within the file
       size without overwriting any existing data.  The hole will start at
       _o_f_f_s_e_t and continue for _l_e_n bytes.  When inserting the hole inside
       file, the contents of the file starting at _o_f_f_s_e_t will be shifted
       upward (i.e., to a higher file offset) by _l_e_n bytes.  Inserting a hole
       inside a file increases the file size by _l_e_n bytes.

       This mode has the same limitations as FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE
       regarding the granularity of the operation.  If the granularity
       requirements are not met, ffaallllooccaattee() fails with the error EEIINNVVAALL..  If
       the _o_f_f_s_e_t is equal to or greater than the end of file, an error is
       returned.  For such operations (i.e., inserting a hole at the end of
       file), ffttrruunnccaattee(2) should be used.

       No other flags may be specified in _m_o_d_e in conjunction with
       FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE.

       FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE requires filesystem support.  Filesystems that
       support this operation include XFS (since Linux 4.1) and ext4 (since
       Linux 4.2).

RREETTUURRNN VVAALLUUEE
       On success, ffaallllooccaattee() returns zero.  On error, -1 is returned and
       _e_r_r_n_o is set to indicate the error.

EERRRROORRSS
       EEBBAADDFF  _f_d is not a valid file descriptor, or is not opened for writing.

       EEFFBBIIGG  _o_f_f_s_e_t+_l_e_n exceeds the maximum file size.

       EEFFBBIIGG  _m_o_d_e is FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE, and the current file size+_l_e_n
              exceeds the maximum file size.

       EEIINNTTRR  A signal was caught during execution; see ssiiggnnaall(7).

       EEIINNVVAALL _o_f_f_s_e_t was less than 0, or _l_e_n was less than or equal to 0.

       EEIINNVVAALL _m_o_d_e is FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE and the range specified by
              _o_f_f_s_e_t plus _l_e_n reaches or passes the end of the file.

       EEIINNVVAALL _m_o_d_e is FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE and the range specified by _o_f_f_s_e_t
              reaches or passes the end of the file.

       EEIINNVVAALL _m_o_d_e is FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE or FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE, but
              either _o_f_f_s_e_t or _l_e_n is not a multiple of the filesystem block
              size.

       EEIINNVVAALL _m_o_d_e contains one of FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE or
              FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE and also other flags; no other flags are
              permitted with FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE or
              FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE.

       EEIINNVVAALL _m_o_d_e is FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE or FFAALLLLOOCC__FFLL__ZZEERROO__RRAANNGGEE or
              FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE, but the file referred to by _f_d is not a
              regular file.

       EEIIOO    An I/O error occurred while reading from or writing to a
              filesystem.

       EENNOODDEEVV _f_d does not refer to a regular file or a directory.  (If _f_d is a
              pipe or FIFO, a different error results.)

       EENNOOSSPPCC There is not enough space left on the device containing the file
              referred to by _f_d.

       EENNOOSSYYSS This kernel does not implement ffaallllooccaattee().

       EEOOPPNNOOTTSSUUPPPP
              The filesystem containing the file referred to by _f_d does not
              support this operation; or the _m_o_d_e is not supported by the
              filesystem containing the file referred to by _f_d.

       EEPPEERRMM  The file referred to by _f_d is marked immutable (see cchhaattttrr(1)).

       EEPPEERRMM  _m_o_d_e specifies FFAALLLLOOCC__FFLL__PPUUNNCCHH__HHOOLLEE or FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE
              or FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE and the file referred to by _f_d is
              marked append-only (see cchhaattttrr(1)).

       EEPPEERRMM  The operation was prevented by a file seal; see ffccnnttll(2).

       EESSPPIIPPEE _f_d refers to a pipe or FIFO.

       EETTXXTTBBSSYY
              _m_o_d_e specifies FFAALLLLOOCC__FFLL__CCOOLLLLAAPPSSEE__RRAANNGGEE or
              FFAALLLLOOCC__FFLL__IINNSSEERRTT__RRAANNGGEE, but the file referred to by _f_d is
              currently being executed.

VVEERRSSIIOONNSS
       ffaallllooccaattee() is available on Linux since kernel 2.6.23.  Support is
       provided by glibc since version 2.10.  The FFAALLLLOOCC__FFLL__** flags are
       defined in glibc headers only since version 2.18.

CCOONNFFOORRMMIINNGG TTOO
       ffaallllooccaattee() is Linux-specific.

SSEEEE AALLSSOO
       ffaallllooccaattee(1), ffttrruunnccaattee(2), ppoossiixx__ffaaddvviissee(3), ppoossiixx__ffaallllooccaattee(3)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2018-04-30                      FALLOCATE(2)
