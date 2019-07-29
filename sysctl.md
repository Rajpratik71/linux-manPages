SYSCTL(2)                  Linux Programmer's Manual                 SYSCTL(2)



NNAAMMEE
       sysctl - read/write system parameters

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>
       ##iinncclluuddee <<lliinnuuxx//ssyyssccttll..hh>>

       iinntt __ssyyssccttll((ssttrruucctt ____ssyyssccttll__aarrggss **_a_r_g_s));;

       _N_o_t_e: There is no glibc wrapper for this system call; see NOTES.

DDEESSCCRRIIPPTTIIOONN
       DDoo nnoott uussee tthhiiss ssyysstteemm ccaallll!!  See NOTES.

       The __ssyyssccttll() call reads and/or writes kernel parameters.  For example,
       the hostname, or the maximum number of open files.  The argument has
       the form

           struct __sysctl_args {
               int    *name;    /* integer vector describing variable */
               int     nlen;    /* length of this vector */
               void   *oldval;  /* 0 or address where to store old value */
               size_t *oldlenp; /* available room for old value,
                                   overwritten by actual size of old value */
               void   *newval;  /* 0 or address of new value */
               size_t  newlen;  /* size of new value */
           };

       This call does a search in a tree structure, possibly resembling a
       directory tree under _/_p_r_o_c_/_s_y_s, and if the requested item is found
       calls some appropriate routine to read or modify the value.

RREETTUURRNN VVAALLUUEE
       Upon successful completion, __ssyyssccttll() returns 0.  Otherwise, a value of
       -1 is returned and _e_r_r_n_o is set to indicate the error.

EERRRROORRSS
       EEAACCCCEESS, EEPPEERRMM
              No search permission for one of the encountered "directories",
              or no read permission where _o_l_d_v_a_l was nonzero, or no write
              permission where _n_e_w_v_a_l was nonzero.

       EEFFAAUULLTT The invocation asked for the previous value by setting _o_l_d_v_a_l
              non-NULL, but allowed zero room in _o_l_d_l_e_n_p.

       EENNOOTTDDIIRR
              _n_a_m_e was not found.

CCOONNFFOORRMMIINNGG TTOO
       This call is Linux-specific, and should not be used in programs
       intended to be portable.  A ssyyssccttll() call has been present in Linux
       since version 1.3.57.  It originated in 4.4BSD.  Only Linux has the
       _/_p_r_o_c_/_s_y_s mirror, and the object naming schemes differ between Linux
       and 4.4BSD, but the declaration of the ssyyssccttll() function is the same in
       both.

NNOOTTEESS
       Glibc does not provide a wrapper for this system call; call it using
       ssyyssccaallll(2).  Or rather...  _d_o_n_'_t call it: use of this system call has
       long been discouraged, and it is so unloved that iitt iiss lliikkeellyy ttoo
       ddiissaappppeeaarr iinn aa ffuuttuurree kkeerrnneell vveerrssiioonn.  Since Linux 2.6.24, uses of this
       system call result in warnings in the kernel log.  Remove it from your
       programs now; use the _/_p_r_o_c_/_s_y_s interface instead.

       This system call is available only if the kernel was configured with
       the CCOONNFFIIGG__SSYYSSCCTTLL__SSYYSSCCAALLLL option.

BBUUGGSS
       The object names vary between kernel versions, making this system call
       worthless for applications.

       Not all available objects are properly documented.

       It is not yet possible to change operating system by writing to
       _/_p_r_o_c_/_s_y_s_/_k_e_r_n_e_l_/_o_s_t_y_p_e.

EEXXAAMMPPLLEE
       #define _GNU_SOURCE
       #include <unistd.h>
       #include <sys/syscall.h>
       #include <string.h>
       #include <stdio.h>
       #include <stdlib.h>
       #include <linux/sysctl.h>

       int _sysctl(struct __sysctl_args *args );

       #define OSNAMESZ 100

       int
       main(void)
       {
           struct __sysctl_args args;
           char osname[OSNAMESZ];
           size_t osnamelth;
           int name[] = { CTL_KERN, KERN_OSTYPE };

           memset(&args, 0, sizeof(struct __sysctl_args));
           args.name = name;
           args.nlen = sizeof(name)/sizeof(name[0]);
           args.oldval = osname;
           args.oldlenp = &osnamelth;

           osnamelth = sizeof(osname);

           if (syscall(SYS__sysctl, &args) == -1) {
               perror("_sysctl");
               exit(EXIT_FAILURE);
           }
           printf("This machine is running %*s\n", osnamelth, osname);
           exit(EXIT_SUCCESS);
       }

SSEEEE AALLSSOO
       pprroocc(5)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                         SYSCTL(2)
