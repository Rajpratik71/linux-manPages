FSYNC(2)                   Linux Programmer's Manual                  FSYNC(2)



NNAAMMEE
       fsync, fdatasync - synchronize a file's in-core state with storage
       device

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>

       iinntt ffssyynncc((iinntt _f_d));;

       iinntt ffddaattaassyynncc((iinntt _f_d));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       ffssyynncc():
           Glibc 2.16 and later:
               No feature test macros need be defined
           Glibc up to and including 2.15:
               _BSD_SOURCE || _XOPEN_SOURCE
                   || /* since glibc 2.8: */ _POSIX_C_SOURCE >= 200112L
       ffddaattaassyynncc():
           _POSIX_C_SOURCE >= 199309L || _XOPEN_SOURCE >= 500

DDEESSCCRRIIPPTTIIOONN
       ffssyynncc() transfers ("flushes") all modified in-core data of (i.e.,
       modified buffer cache pages for) the file referred to by the file
       descriptor _f_d to the disk device (or other permanent storage device) so
       that all changed information can be retrieved even if the system
       crashes or is rebooted.  This includes writing through or flushing a
       disk cache if present.  The call blocks until the device reports that
       the transfer has completed.

       As well as flushing the file data, ffssyynncc() also flushes the metadata
       information associated with the file (see iinnooddee(7)).

       Calling ffssyynncc() does not necessarily ensure that the entry in the
       directory containing the file has also reached disk.  For that an
       explicit ffssyynncc() on a file descriptor for the directory is also needed.

       ffddaattaassyynncc() is similar to ffssyynncc(), but does not flush modified metadata
       unless that metadata is needed in order to allow a subsequent data
       retrieval to be correctly handled.  For example, changes to _s_t___a_t_i_m_e or
       _s_t___m_t_i_m_e (respectively, time of last access and time of last
       modification; see iinnooddee(7)) do not require flushing because they are
       not necessary for a subsequent data read to be handled correctly.  On
       the other hand, a change to the file size (_s_t___s_i_z_e, as made by say
       ffttrruunnccaattee(2)), would require a metadata flush.

       The aim of ffddaattaassyynncc() is to reduce disk activity for applications that
       do not require all metadata to be synchronized with the disk.

RREETTUURRNN VVAALLUUEE
       On success, these system calls return zero.  On error, -1 is returned,
       and _e_r_r_n_o is set appropriately.

EERRRROORRSS
       EEBBAADDFF  _f_d is not a valid open file descriptor.

       EEIIOO    An error occurred during synchronization.  This error may relate
              to data written to some other file descriptor on the same file.
              Since Linux 4.13, errors from write-back will be reported to all
              file descriptors that might have written the data which
              triggered the error.  Some filesystems (e.g., NFS) keep close
              track of which data came through which file descriptor, and give
              more precise reporting.  Other filesystems (e.g., most local
              filesystems) will report errors to all file descriptors that
              where open on the file when the error was recorded.

       EENNOOSSPPCC Disk space was exhausted while synchronizing.

       EERROOFFSS, EEIINNVVAALL
              _f_d is bound to a special file (e.g., a pipe, FIFO, or socket)
              which does not support synchronization.

       EENNOOSSPPCC, EEDDQQUUOOTT
              _f_d is bound to a file on NFS or another filesystem which does
              not allocate space at the time of a wwrriittee(2) system call, and
              some previous write failed due to insufficient storage space.

CCOONNFFOORRMMIINNGG TTOO
       POSIX.1-2001, POSIX.1-2008, 4.3BSD.

AAVVAAIILLAABBIILLIITTYY
       On POSIX systems on which ffddaattaassyynncc() is available,
       __PPOOSSIIXX__SSYYNNCCHHRROONNIIZZEEDD__IIOO is defined in _<_u_n_i_s_t_d_._h_> to a value greater than
       0.  (See also ssyyssccoonnff(3).)

NNOOTTEESS
       On some UNIX systems (but not Linux), _f_d must be a _w_r_i_t_a_b_l_e file
       descriptor.

       In Linux 2.2 and earlier, ffddaattaassyynncc() is equivalent to ffssyynncc(), and so
       has no performance advantage.

       The ffssyynncc() implementations in older kernels and lesser used
       filesystems does not know how to flush disk caches.  In these cases
       disk caches need to be disabled using hhddppaarrmm(8) or ssddppaarrmm(8) to
       guarantee safe operation.

SSEEEE AALLSSOO
       ssyynncc(1), bbddfflluusshh(2), ooppeenn(2), ppoossiixx__ffaaddvviissee(2), ppwwrriitteevv(2), ssyynncc(2),
       ssyynncc__ffiillee__rraannggee(2), fffflluusshh(3), ffiilleennoo(3), hhddppaarrmm(8), mmoouunntt(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                          FSYNC(2)
