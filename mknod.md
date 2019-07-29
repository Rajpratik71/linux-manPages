MKNOD(2)                   Linux Programmer's Manual                  MKNOD(2)



NNAAMMEE
       mknod, mknodat - create a special or ordinary file

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//ttyyppeess..hh>>
       ##iinncclluuddee <<ssyyss//ssttaatt..hh>>
       ##iinncclluuddee <<ffccnnttll..hh>>
       ##iinncclluuddee <<uunniissttdd..hh>>

       iinntt mmkknnoodd((ccoonnsstt cchhaarr **_p_a_t_h_n_a_m_e,, mmooddee__tt _m_o_d_e,, ddeevv__tt _d_e_v));;

       ##iinncclluuddee <<ffccnnttll..hh>>           /* Definition of AT_* constants */
       ##iinncclluuddee <<ssyyss//ssttaatt..hh>>

       iinntt mmkknnooddaatt((iinntt _d_i_r_f_d,, ccoonnsstt cchhaarr **_p_a_t_h_n_a_m_e,, mmooddee__tt _m_o_d_e,, ddeevv__tt _d_e_v));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       mmkknnoodd():
           _XOPEN_SOURCE >= 500
               || /* Since glibc 2.19: */ _DEFAULT_SOURCE
               || /* Glibc versions <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

DDEESSCCRRIIPPTTIIOONN
       The system call mmkknnoodd() creates a filesystem node (file, device special
       file, or named pipe) named _p_a_t_h_n_a_m_e, with attributes specified by _m_o_d_e
       and _d_e_v.

       The _m_o_d_e argument specifies both the file mode to use and the type of
       node to be created.  It should be a combination (using bitwise OR) of
       one of the file types listed below and zero or more of the file mode
       bits listed in iinnooddee(7).

       The file mode is modified by the process's _u_m_a_s_k in the usual way: in
       the absence of a default ACL, the permissions of the created node are
       (_m_o_d_e & ~_u_m_a_s_k).

       The file type must be one of SS__IIFFRREEGG, SS__IIFFCCHHRR, SS__IIFFBBLLKK, SS__IIFFIIFFOO, or
       SS__IIFFSSOOCCKK to specify a regular file (which will be created empty),
       character special file, block special file, FIFO (named pipe), or UNIX
       domain socket, respectively.  (Zero file type is equivalent to type
       SS__IIFFRREEGG.)

       If the file type is SS__IIFFCCHHRR or SS__IIFFBBLLKK, then _d_e_v specifies the major
       and minor numbers of the newly created device special file (mmaakkeeddeevv(3)
       may be useful to build the value for _d_e_v); otherwise it is ignored.

       If _p_a_t_h_n_a_m_e already exists, or is a symbolic link, this call fails with
       an EEEEXXIISSTT error.

       The newly created node will be owned by the effective user ID of the
       process.  If the directory containing the node has the set-group-ID bit
       set, or if the filesystem is mounted with BSD group semantics, the new
       node will inherit the group ownership from its parent directory;
       otherwise it will be owned by the effective group ID of the process.

   mmkknnooddaatt(())
       The mmkknnooddaatt() system call operates in exactly the same way as mmkknnoodd(),
       except for the differences described here.

       If the pathname given in _p_a_t_h_n_a_m_e is relative, then it is interpreted
       relative to the directory referred to by the file descriptor _d_i_r_f_d
       (rather than relative to the current working directory of the calling
       process, as is done by mmkknnoodd() for a relative pathname).

       If _p_a_t_h_n_a_m_e is relative and _d_i_r_f_d is the special value AATT__FFDDCCWWDD, then
       _p_a_t_h_n_a_m_e is interpreted relative to the current working directory of
       the calling process (like mmkknnoodd()).

       If _p_a_t_h_n_a_m_e is absolute, then _d_i_r_f_d is ignored.

       See ooppeennaatt(2) for an explanation of the need for mmkknnooddaatt().

RREETTUURRNN VVAALLUUEE
       mmkknnoodd() and mmkknnooddaatt() return zero on success, or -1 if an error
       occurred (in which case, _e_r_r_n_o is set appropriately).

EERRRROORRSS
       EEAACCCCEESS The parent directory does not allow write permission to the
              process, or one of the directories in the path prefix of
              _p_a_t_h_n_a_m_e did not allow search permission.  (See also
              ppaatthh__rreessoolluuttiioonn(7).)

       EEDDQQUUOOTT The user's quota of disk blocks or inodes on the filesystem has
              been exhausted.

       EEEEXXIISSTT _p_a_t_h_n_a_m_e already exists.  This includes the case where _p_a_t_h_n_a_m_e
              is a symbolic link, dangling or not.

       EEFFAAUULLTT _p_a_t_h_n_a_m_e points outside your accessible address space.

       EEIINNVVAALL _m_o_d_e requested creation of something other than a regular file,
              device special file, FIFO or socket.

       EELLOOOOPP  Too many symbolic links were encountered in resolving _p_a_t_h_n_a_m_e.

       EENNAAMMEETTOOOOLLOONNGG
              _p_a_t_h_n_a_m_e was too long.

       EENNOOEENNTT A directory component in _p_a_t_h_n_a_m_e does not exist or is a
              dangling symbolic link.

       EENNOOMMEEMM Insufficient kernel memory was available.

       EENNOOSSPPCC The device containing _p_a_t_h_n_a_m_e has no room for the new node.

       EENNOOTTDDIIRR
              A component used as a directory in _p_a_t_h_n_a_m_e is not, in fact, a
              directory.

       EEPPEERRMM  _m_o_d_e requested creation of something other than a regular file,
              FIFO (named pipe), or UNIX domain socket, and the caller is not
              privileged (Linux: does not have the CCAAPP__MMKKNNOODD capability); also
              returned if the filesystem containing _p_a_t_h_n_a_m_e does not support
              the type of node requested.

       EERROOFFSS  _p_a_t_h_n_a_m_e refers to a file on a read-only filesystem.

       The following additional errors can occur for mmkknnooddaatt():

       EEBBAADDFF  _d_i_r_f_d is not a valid file descriptor.

       EENNOOTTDDIIRR
              _p_a_t_h_n_a_m_e is relative and _d_i_r_f_d is a file descriptor referring to
              a file other than a directory.

VVEERRSSIIOONNSS
       mmkknnooddaatt() was added to Linux in kernel 2.6.16; library support was
       added to glibc in version 2.4.

CCOONNFFOORRMMIINNGG TTOO
       mmkknnoodd(): SVr4, 4.4BSD, POSIX.1-2001 (but see below), POSIX.1-2008.

       mmkknnooddaatt(): POSIX.1-2008.

NNOOTTEESS
       POSIX.1-2001 says: "The only portable use of mmkknnoodd() is to create a
       FIFO-special file.  If _m_o_d_e is not SS__IIFFIIFFOO or _d_e_v is not 0, the
       behavior of mmkknnoodd() is unspecified."  However, nowadays one should
       never use mmkknnoodd() for this purpose; one should use mmkkffiiffoo(3), a
       function especially defined for this purpose.

       Under Linux, mmkknnoodd() cannot be used to create directories.  One should
       make directories with mmkkddiirr(2).

       There are many infelicities in the protocol underlying NFS.  Some of
       these affect mmkknnoodd() and mmkknnooddaatt().

SSEEEE AALLSSOO
       mmkknnoodd(1), cchhmmoodd(2), cchhoowwnn(2), ffccnnttll(2), mmkkddiirr(2), mmoouunntt(2), ssoocckkeett(2),
       ssttaatt(2), uummaasskk(2), uunnlliinnkk(2), mmaakkeeddeevv(3), mmkkffiiffoo(3), aaccll(5)
       ppaatthh__rreessoolluuttiioonn(7)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                          MKNOD(2)
