PIVOT_ROOT(2)              Linux Programmer's Manual             PIVOT_ROOT(2)



NNAAMMEE
       pivot_root - change the root filesystem

SSYYNNOOPPSSIISS
       iinntt ppiivvoott__rroooott((ccoonnsstt cchhaarr **_n_e_w___r_o_o_t,, ccoonnsstt cchhaarr **_p_u_t___o_l_d));;

       _N_o_t_e: There is no glibc wrapper for this system call; see NOTES.

DDEESSCCRRIIPPTTIIOONN
       ppiivvoott__rroooott() moves the root filesystem of the calling process to the
       directory _p_u_t___o_l_d and makes _n_e_w___r_o_o_t the new root filesystem of the
       calling process.

       The typical use of ppiivvoott__rroooott() is during system startup, when the
       system mounts a temporary root filesystem (e.g., an iinniittrrdd), then
       mounts the real root filesystem, and eventually turns the latter into
       the current root of all relevant processes or threads.

       ppiivvoott__rroooott() may or may not change the current root and the current
       working directory of any processes or threads which use the old root
       directory.  The caller of ppiivvoott__rroooott() must ensure that processes with
       root or current working directory at the old root operate correctly in
       either case.  An easy way to ensure this is to change their root and
       current working directory to _n_e_w___r_o_o_t before invoking ppiivvoott__rroooott().

       The paragraph above is intentionally vague because the implementation
       of ppiivvoott__rroooott() may change in the future.  At the time of writing,
       ppiivvoott__rroooott() changes root and current working directory of each process
       or thread to _n_e_w___r_o_o_t if they point to the old root directory.  This is
       necessary in order to prevent kernel threads from keeping the old root
       directory busy with their root and current working directory, even if
       they never access the filesystem in any way.  In the future, there may
       be a mechanism for kernel threads to explicitly relinquish any access
       to the filesystem, such that this fairly intrusive mechanism can be
       removed from ppiivvoott__rroooott().

       Note that this also applies to the calling process: ppiivvoott__rroooott() may or
       may not affect its current working directory.  It is therefore
       recommended to call cchhddiirr((""//"")) immediately after ppiivvoott__rroooott().

       The following restrictions apply to _n_e_w___r_o_o_t and _p_u_t___o_l_d:

       -  They must be directories.

       -  _n_e_w___r_o_o_t and _p_u_t___o_l_d must not be on the same filesystem as the
          current root.

       -  _p_u_t___o_l_d must be underneath _n_e_w___r_o_o_t, that is, adding a nonzero
          number of _/_._. to the string pointed to by _p_u_t___o_l_d must yield the
          same directory as _n_e_w___r_o_o_t.

       -  No other filesystem may be mounted on _p_u_t___o_l_d.

       See also ppiivvoott__rroooott(8) for additional usage examples.

       If the current root is not a mount point (e.g., after cchhrroooott(2) or
       ppiivvoott__rroooott(), see also below), not the old root directory, but the
       mount point of that filesystem is mounted on _p_u_t___o_l_d.

       _n_e_w___r_o_o_t does not have to be a mount point.  In this case, _/_p_r_o_c_/_m_o_u_n_t_s
       will show the mount point of the filesystem containing _n_e_w___r_o_o_t as root
       (_/).

RREETTUURRNN VVAALLUUEE
       On success, zero is returned.  On error, -1 is returned, and _e_r_r_n_o is
       set appropriately.

EERRRROORRSS
       ppiivvoott__rroooott() may return (in _e_r_r_n_o) any of the errors returned by
       ssttaatt(2).  Additionally, it may return:

       EEBBUUSSYY  _n_e_w___r_o_o_t or _p_u_t___o_l_d are on the current root filesystem, or a
              filesystem is already mounted on _p_u_t___o_l_d.

       EEIINNVVAALL _p_u_t___o_l_d is not underneath _n_e_w___r_o_o_t.

       EENNOOTTDDIIRR
              _n_e_w___r_o_o_t or _p_u_t___o_l_d is not a directory.

       EEPPEERRMM  The calling process does not have the CCAAPP__SSYYSS__AADDMMIINN capability.

VVEERRSSIIOONNSS
       ppiivvoott__rroooott() was introduced in Linux 2.3.41.

CCOONNFFOORRMMIINNGG TTOO
       ppiivvoott__rroooott() is Linux-specific and hence is not portable.

NNOOTTEESS
       Glibc does not provide a wrapper for this system call; call it using
       ssyyssccaallll(2).

BBUUGGSS
       ppiivvoott__rroooott() should not have to change root and current working
       directory of all other processes in the system.

       Some of the more obscure uses of ppiivvoott__rroooott() may quickly lead to
       insanity.

SSEEEE AALLSSOO
       cchhddiirr(2), cchhrroooott(2), ssttaatt(2), iinniittrrdd(4), ppiivvoott__rroooott(8), sswwiittcchh__rroooott(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                     PIVOT_ROOT(2)
