USLEEP(3)                  Linux Programmer's Manual                 USLEEP(3)



NNAAMMEE
       usleep - suspend execution for microsecond intervals

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>

       iinntt uusslleeeepp((uusseeccoonnddss__tt _u_s_e_c));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       uusslleeeepp():
           Since glibc 2.12:
               (_XOPEN_SOURCE >= 500) && ! (_POSIX_C_SOURCE >= 200809L)
                   || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                   || /* Glibc versions <= 2.19: */ _BSD_SOURCE
           Before glibc 2.12:
               _BSD_SOURCE || _XOPEN_SOURCE >= 500

DDEESSCCRRIIPPTTIIOONN
       The uusslleeeepp() function suspends execution of the calling thread for (at
       least) _u_s_e_c microseconds.  The sleep may be lengthened slightly by any
       system activity or by the time spent processing the call or by the
       granularity of system timers.

RREETTUURRNN VVAALLUUEE
       The uusslleeeepp() function returns 0 on success.  On error, -1 is returned,
       with _e_r_r_n_o set to indicate the cause of the error.

EERRRROORRSS
       EEIINNTTRR  Interrupted by a signal; see ssiiggnnaall(7).

       EEIINNVVAALL _u_s_e_c is greater than or equal to 1000000.  (On systems where
              that is considered an error.)

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +----------+---------------+---------+
       |IInntteerrffaaccee | AAttttrriibbuuttee     | VVaalluuee   |
       +----------+---------------+---------+
       |usleep () | Thread safety | MT-Safe |
       +----------+---------------+---------+
CCOONNFFOORRMMIINNGG TTOO
       4.3BSD, POSIX.1-2001.  POSIX.1-2001 declares this function obsolete;
       use nnaannoosslleeeepp(2) instead.  POSIX.1-2008 removes the specification of
       uusslleeeepp().

       On the original BSD implementation, and in glibc before version 2.2.2,
       the return type of this function is _v_o_i_d.  The POSIX version returns
       _i_n_t, and this is also the prototype used since glibc 2.2.2.

       Only the EEIINNVVAALL error return is documented by SUSv2 and POSIX.1-2001.

NNOOTTEESS
       The type _u_s_e_c_o_n_d_s___t is an unsigned integer type capable of holding
       integers in the range [0,1000000].  Programs will be more portable if
       they never mention this type explicitly.  Use

           #include <unistd.h>
           ...
               unsigned int usecs;
           ...
               usleep(usecs);

       The interaction of this function with the SSIIGGAALLRRMM signal, and with
       other timer functions such as aallaarrmm(2), sslleeeepp(3), nnaannoosslleeeepp(2),
       sseettiittiimmeerr(2), ttiimmeerr__ccrreeaattee(2), ttiimmeerr__ddeelleettee(2), ttiimmeerr__ggeettoovveerrrruunn(2),
       ttiimmeerr__ggeettttiimmee(2), ttiimmeerr__sseettttiimmee(2), uuaallaarrmm(3) is unspecified.

SSEEEE AALLSSOO
       BR alarm (2), ggeettiittiimmeerr(2), nnaannoosslleeeepp(2), sseelleecctt(2), sseettiittiimmeerr(2),
       sslleeeepp(3), uuaallaarrmm(3), ttiimmee(7)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



                                  2017-09-15                         USLEEP(3)
