READAHEAD(2)               Linux Programmer's Manual              READAHEAD(2)



NNAAMMEE
       readahead - initiate file readahead into page cache

SSYYNNOOPPSSIISS
       ##ddeeffiinnee __GGNNUU__SSOOUURRCCEE             /* See feature_test_macros(7) */
       ##iinncclluuddee <<ffccnnttll..hh>>

       ssssiizzee__tt rreeaaddaahheeaadd((iinntt _f_d,, ooffff6644__tt _o_f_f_s_e_t,, ssiizzee__tt _c_o_u_n_t));;

DDEESSCCRRIIPPTTIIOONN
       rreeaaddaahheeaadd() initiates readahead on a file so that subsequent reads from
       that file will be satisfied from the cache, and not block on disk I/O
       (assuming the readahead was initiated early enough and that other
       activity on the system did not in the meantime flush pages from the
       cache).

       The _f_d argument is a file descriptor identifying the file which is to
       be read.  The _o_f_f_s_e_t argument specifies the starting point from which
       data is to be read and _c_o_u_n_t specifies the number of bytes to be read.
       I/O is performed in whole pages, so that _o_f_f_s_e_t is effectively rounded
       down to a page boundary and bytes are read up to the next page boundary
       greater than or equal to _(_o_f_f_s_e_t_+_c_o_u_n_t_).  rreeaaddaahheeaadd() does not read
       beyond the end of the file.  The file offset of the open file
       description referred to by _f_d is left unchanged.

RREETTUURRNN VVAALLUUEE
       On success, rreeaaddaahheeaadd() returns 0; on failure, -1 is returned, with
       _e_r_r_n_o set to indicate the cause of the error.

EERRRROORRSS
       EEBBAADDFF  _f_d is not a valid file descriptor or is not open for reading.

       EEIINNVVAALL _f_d does not refer to a file type to which rreeaaddaahheeaadd() can be
              applied.

VVEERRSSIIOONNSS
       The rreeaaddaahheeaadd() system call appeared in Linux 2.4.13; glibc support has
       been provided since version 2.3.

CCOONNFFOORRMMIINNGG TTOO
       The rreeaaddaahheeaadd() system call is Linux-specific, and its use should be
       avoided in portable applications.

NNOOTTEESS
       On some 32-bit architectures, the calling signature for this system
       call differs, for the reasons described in ssyyssccaallll(2).

BBUUGGSS
       rreeaaddaahheeaadd() attempts to schedule the reads in the background and return
       immediately.  However, it may block while it reads the filesystem
       metadata needed to locate the requested blocks.  This occurs frequently
       with ext[234] on large files using indirect blocks instead of extents,
       giving the appearance that the call blocks until the requested data has
       been read.

SSEEEE AALLSSOO
       llsseeeekk(2), mmaaddvviissee(2), mmmmaapp(2), ppoossiixx__ffaaddvviissee(2), rreeaadd(2)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                      READAHEAD(2)
