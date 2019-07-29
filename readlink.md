READLINK(2)                Linux Programmer's Manual               READLINK(2)



NNAAMMEE
       readlink, readlinkat - read value of a symbolic link

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>

       ssssiizzee__tt rreeaaddlliinnkk((ccoonnsstt cchhaarr **_p_a_t_h_n_a_m_e,, cchhaarr **_b_u_f,, ssiizzee__tt _b_u_f_s_i_z));;

       ##iinncclluuddee <<ffccnnttll..hh>>           /* Definition of AT_* constants */
       ##iinncclluuddee <<uunniissttdd..hh>>

       ssssiizzee__tt rreeaaddlliinnkkaatt((iinntt _d_i_r_f_d,, ccoonnsstt cchhaarr **_p_a_t_h_n_a_m_e,,
                          cchhaarr **_b_u_f,, ssiizzee__tt _b_u_f_s_i_z));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       rreeaaddlliinnkk():
           _XOPEN_SOURCE >= 500 || _POSIX_C_SOURCE >= 200112L
               || /* Glibc versions <= 2.19: */ _BSD_SOURCE

       rreeaaddlliinnkkaatt():
           Since glibc 2.10:
               _POSIX_C_SOURCE >= 200809L
           Before glibc 2.10:
               _ATFILE_SOURCE

DDEESSCCRRIIPPTTIIOONN
       rreeaaddlliinnkk() places the contents of the symbolic link _p_a_t_h_n_a_m_e in the
       buffer _b_u_f, which has size _b_u_f_s_i_z.  rreeaaddlliinnkk() does not append a null
       byte to _b_u_f.  It will (silently) truncate the contents (to a length of
       _b_u_f_s_i_z characters), in case the buffer is too small to hold all of the
       contents.

   rreeaaddlliinnkkaatt(())
       The rreeaaddlliinnkkaatt() system call operates in exactly the same way as
       rreeaaddlliinnkk(), except for the differences described here.

       If the pathname given in _p_a_t_h_n_a_m_e is relative, then it is interpreted
       relative to the directory referred to by the file descriptor _d_i_r_f_d
       (rather than relative to the current working directory of the calling
       process, as is done by rreeaaddlliinnkk() for a relative pathname).

       If _p_a_t_h_n_a_m_e is relative and _d_i_r_f_d is the special value AATT__FFDDCCWWDD, then
       _p_a_t_h_n_a_m_e is interpreted relative to the current working directory of
       the calling process (like rreeaaddlliinnkk()).

       If _p_a_t_h_n_a_m_e is absolute, then _d_i_r_f_d is ignored.

       Since Linux 2.6.39, _p_a_t_h_n_a_m_e can be an empty string, in which case the
       call operates on the symbolic link referred to by _d_i_r_f_d (which should
       have been obtained using ooppeenn(2) with the OO__PPAATTHH and OO__NNOOFFOOLLLLOOWW flags).

       See ooppeennaatt(2) for an explanation of the need for rreeaaddlliinnkkaatt().

RREETTUURRNN VVAALLUUEE
       On success, these calls return the number of bytes placed in _b_u_f.  (If
       the returned value equals _b_u_f_s_i_z, then truncation may have occurred.)
       On error, -1 is returned and _e_r_r_n_o is set to indicate the error.

EERRRROORRSS
       EEAACCCCEESS Search permission is denied for a component of the path prefix.
              (See also ppaatthh__rreessoolluuttiioonn(7).)

       EEFFAAUULLTT _b_u_f extends outside the process's allocated address space.

       EEIINNVVAALL _b_u_f_s_i_z is not positive.

       EEIINNVVAALL The named file (i.e., the final filename component of _p_a_t_h_n_a_m_e)
              is not a symbolic link.

       EEIIOO    An I/O error occurred while reading from the filesystem.

       EELLOOOOPP  Too many symbolic links were encountered in translating the
              pathname.

       EENNAAMMEETTOOOOLLOONNGG
              A pathname, or a component of a pathname, was too long.

       EENNOOEENNTT The named file does not exist.

       EENNOOMMEEMM Insufficient kernel memory was available.

       EENNOOTTDDIIRR
              A component of the path prefix is not a directory.

       The following additional errors can occur for rreeaaddlliinnkkaatt():

       EEBBAADDFF  _d_i_r_f_d is not a valid file descriptor.

       EENNOOTTDDIIRR
              _p_a_t_h_n_a_m_e is relative and _d_i_r_f_d is a file descriptor referring to
              a file other than a directory.

VVEERRSSIIOONNSS
       rreeaaddlliinnkkaatt() was added to Linux in kernel 2.6.16; library support was
       added to glibc in version 2.4.

CCOONNFFOORRMMIINNGG TTOO
       rreeaaddlliinnkk(): 4.4BSD (rreeaaddlliinnkk() first appeared in 4.2BSD), POSIX.1-2001,
       POSIX.1-2008.

       rreeaaddlliinnkkaatt(): POSIX.1-2008.

NNOOTTEESS
       In versions of glibc up to and including glibc 2.4, the return type of
       rreeaaddlliinnkk() was declared as _i_n_t.  Nowadays, the return type is declared
       as _s_s_i_z_e___t, as (newly) required in POSIX.1-2001.

       Using a statically sized buffer might not provide enough room for the
       symbolic link contents.  The required size for the buffer can be
       obtained from the _s_t_a_t_._s_t___s_i_z_e value returned by a call to llssttaatt(2) on
       the link.  However, the number of bytes written by rreeaaddlliinnkk() and
       rreeaaddlliinnkkaatt() should be checked to make sure that the size of the
       symbolic link did not increase between the calls.  Dynamically
       allocating the buffer for rreeaaddlliinnkk() and rreeaaddlliinnkkaatt() also addresses a
       common portability problem when using _P_A_T_H___M_A_X for the buffer size, as
       this constant is not guaranteed to be defined per POSIX if the system
       does not have such limit.

   GGlliibbcc nnootteess
       On older kernels where rreeaaddlliinnkkaatt() is unavailable, the glibc wrapper
       function falls back to the use of rreeaaddlliinnkk().  When _p_a_t_h_n_a_m_e is a
       relative pathname, glibc constructs a pathname based on the symbolic
       link in _/_p_r_o_c_/_s_e_l_f_/_f_d that corresponds to the _d_i_r_f_d argument.

EEXXAAMMPPLLEE
       The following program allocates the buffer needed by rreeaaddlliinnkk()
       dynamically from the information provided by llssttaatt(2), falling back to
       a buffer of size PPAATTHH__MMAAXX in cases where llssttaatt(2) reports a size of
       zero.

       #include <sys/types.h>
       #include <sys/stat.h>
       #include <limits.h>
       #include <stdio.h>
       #include <stdlib.h>
       #include <unistd.h>

       int
       main(int argc, char *argv[])
       {
           struct stat sb;
           char *buf;
           ssize_t nbytes, bufsiz;

           if (argc != 2) {
               fprintf(stderr, "Usage: %s <pathname>\n", argv[0]);
               exit(EXIT_FAILURE);
           }

           if (lstat(argv[1], &sb) == -1) {
               perror("lstat");
               exit(EXIT_FAILURE);
           }

           /* Add one to the link size, so that we can determine whether
              the buffer returned by readlink() was truncated. */

           bufsiz = sb.st_size + 1;

           /* Some magic symlinks under (for example) /proc and /sys
              report 'st_size' as zero. In that case, take PATH_MAX as
              a "good enough" estimate. */

           if (sb.st_size == 0)
               bufsiz = PATH_MAX;

           buf = malloc(bufsiz);
           if (buf == NULL) {
               perror("malloc");
               exit(EXIT_FAILURE);
           }

           nbytes = readlink(argv[1], buf, bufsiz);
           if (nbytes == -1) {
               perror("readlink");
               exit(EXIT_FAILURE);
           }

           printf("'%s' points to '%.*s'\n", argv[1], (int) nbytes, buf);

           /* If the return value was equal to the buffer size, then the
              the link target was larger than expected (perhaps because the
              target was changed between the call to lstat() and the call to
              readlink()). Warn the user that the returned target may have
              been truncated. */

           if (nbytes == bufsiz)
               printf("(Returned buffer may have been truncated)\n");

           free(buf);
           exit(EXIT_SUCCESS);
       }

SSEEEE AALLSSOO
       rreeaaddlliinnkk(1), llssttaatt(2), ssttaatt(2), ssyymmlliinnkk(2), rreeaallppaatthh(3),
       ppaatthh__rreessoolluuttiioonn(7), ssyymmlliinnkk(7)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                       READLINK(2)
