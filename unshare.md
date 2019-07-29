UNSHARE(2)                 Linux Programmer's Manual                UNSHARE(2)



NNAAMMEE
       unshare - disassociate parts of the process execution context

SSYYNNOOPPSSIISS
       ##ddeeffiinnee __GGNNUU__SSOOUURRCCEE
       ##iinncclluuddee <<sscchheedd..hh>>

       iinntt uunnsshhaarree((iinntt _f_l_a_g_s));;

DDEESSCCRRIIPPTTIIOONN
       uunnsshhaarree() allows a process (or thread) to disassociate parts of its
       execution context that are currently being shared with other processes
       (or threads).  Part of the execution context, such as the mount
       namespace, is shared implicitly when a new process is created using
       ffoorrkk(2) or vvffoorrkk(2), while other parts, such as virtual memory, may be
       shared by explicit request when creating a process or thread using
       cclloonnee(2).

       The main use of uunnsshhaarree() is to allow a process to control its shared
       execution context without creating a new process.

       The _f_l_a_g_s argument is a bit mask that specifies which parts of the
       execution context should be unshared.  This argument is specified by
       ORing together zero or more of the following constants:

       CCLLOONNEE__FFIILLEESS
              Reverse the effect of the cclloonnee(2) CCLLOONNEE__FFIILLEESS flag.  Unshare
              the file descriptor table, so that the calling process no longer
              shares its file descriptors with any other process.

       CCLLOONNEE__FFSS
              Reverse the effect of the cclloonnee(2) CCLLOONNEE__FFSS flag.  Unshare
              filesystem attributes, so that the calling process no longer
              shares its root directory (cchhrroooott(2)), current directory
              (cchhddiirr(2)), or umask (uummaasskk(2)) attributes with any other
              process.

       CCLLOONNEE__NNEEWWCCGGRROOUUPP (since Linux 4.6)
              This flag has the same effect as the cclloonnee(2) CCLLOONNEE__NNEEWWCCGGRROOUUPP
              flag.  Unshare the cgroup namespace.  Use of CCLLOONNEE__NNEEWWCCGGRROOUUPP
              requires the CCAAPP__SSYYSS__AADDMMIINN capability.

       CCLLOONNEE__NNEEWWIIPPCC (since Linux 2.6.19)
              This flag has the same effect as the cclloonnee(2) CCLLOONNEE__NNEEWWIIPPCC flag.
              Unshare the IPC namespace, so that the calling process has a
              private copy of the IPC namespace which is not shared with any
              other process.  Specifying this flag automatically implies
              CCLLOONNEE__SSYYSSVVSSEEMM as well.  Use of CCLLOONNEE__NNEEWWIIPPCC requires the
              CCAAPP__SSYYSS__AADDMMIINN capability.

       CCLLOONNEE__NNEEWWNNEETT (since Linux 2.6.24)
              This flag has the same effect as the cclloonnee(2) CCLLOONNEE__NNEEWWNNEETT flag.
              Unshare the network namespace, so that the calling process is
              moved into a new network namespace which is not shared with any
              previously existing process.  Use of CCLLOONNEE__NNEEWWNNEETT requires the
              CCAAPP__SSYYSS__AADDMMIINN capability.

       CCLLOONNEE__NNEEWWNNSS
              This flag has the same effect as the cclloonnee(2) CCLLOONNEE__NNEEWWNNSS flag.
              Unshare the mount namespace, so that the calling process has a
              private copy of its namespace which is not shared with any other
              process.  Specifying this flag automatically implies CCLLOONNEE__FFSS as
              well.  Use of CCLLOONNEE__NNEEWWNNSS requires the CCAAPP__SSYYSS__AADDMMIINN capability.
              For further information, see mmoouunntt__nnaammeessppaacceess(7).

       CCLLOONNEE__NNEEWWPPIIDD (since Linux 3.8)
              This flag has the same effect as the cclloonnee(2) CCLLOONNEE__NNEEWWPPIIDD flag.
              Unshare the PID namespace, so that the calling process has a new
              PID namespace for its children which is not shared with any
              previously existing process.  The calling process is _n_o_t moved
              into the new namespace.  The first child created by the calling
              process will have the process ID 1 and will assume the role of
              iinniitt(1) in the new namespace.  CCLLOONNEE__NNEEWWPPIIDD automatically
              implies CCLLOONNEE__TTHHRREEAADD as well.  Use of CCLLOONNEE__NNEEWWPPIIDD requires the
              CCAAPP__SSYYSS__AADDMMIINN capability.  For further information, see
              ppiidd__nnaammeessppaacceess(7).

       CCLLOONNEE__NNEEWWUUSSEERR (since Linux 3.8)
              This flag has the same effect as the cclloonnee(2) CCLLOONNEE__NNEEWWUUSSEERR
              flag.  Unshare the user namespace, so that the calling process
              is moved into a new user namespace which is not shared with any
              previously existing process.  As with the child process created
              by cclloonnee(2) with the CCLLOONNEE__NNEEWWUUSSEERR flag, the caller obtains a
              full set of capabilities in the new namespace.

              CCLLOONNEE__NNEEWWUUSSEERR requires that the calling process is not threaded;
              specifying CCLLOONNEE__NNEEWWUUSSEERR automatically implies CCLLOONNEE__TTHHRREEAADD.
              Since Linux 3.9, CCLLOONNEE__NNEEWWUUSSEERR also automatically implies
              CCLLOONNEE__FFSS.  CCLLOONNEE__NNEEWWUUSSEERR requires that the user ID and group ID
              of the calling process are mapped to user IDs and group IDs in
              the user namespace of the calling process at the time of the
              call.

              For further information on user namespaces, see
              uusseerr__nnaammeessppaacceess(7).

       CCLLOONNEE__NNEEWWUUTTSS (since Linux 2.6.19)
              This flag has the same effect as the cclloonnee(2) CCLLOONNEE__NNEEWWUUTTSS flag.
              Unshare the UTS IPC namespace, so that the calling process has a
              private copy of the UTS namespace which is not shared with any
              other process.  Use of CCLLOONNEE__NNEEWWUUTTSS requires the CCAAPP__SSYYSS__AADDMMIINN
              capability.

       CCLLOONNEE__SSYYSSVVSSEEMM (since Linux 2.6.26)
              This flag reverses the effect of the cclloonnee(2) CCLLOONNEE__SSYYSSVVSSEEMM
              flag.  Unshare System V semaphore adjustment (_s_e_m_a_d_j) values, so
              that the calling process has a new empty _s_e_m_a_d_j list that is not
              shared with any other process.  If this is the last process that
              has a reference to the process's current _s_e_m_a_d_j list, then the
              adjustments in that list are applied to the corresponding
              semaphores, as described in sseemmoopp(2).

       In addition, CCLLOONNEE__TTHHRREEAADD, CCLLOONNEE__SSIIGGHHAANNDD, and CCLLOONNEE__VVMM can be specified
       in _f_l_a_g_s if the caller is single threaded (i.e., it is not sharing its
       address space with another process or thread).  In this case, these
       flags have no effect.  (Note also that specifying CCLLOONNEE__TTHHRREEAADD
       automatically implies CCLLOONNEE__VVMM, and specifying CCLLOONNEE__VVMM automatically
       implies CCLLOONNEE__SSIIGGHHAANNDD.) If the process is multithreaded, then the use
       of these flags results in an error.

       If _f_l_a_g_s is specified as zero, then uunnsshhaarree() is a no-op; no changes
       are made to the calling process's execution context.

RREETTUURRNN VVAALLUUEE
       On success, zero returned.  On failure, -1 is returned and _e_r_r_n_o is set
       to indicate the error.

EERRRROORRSS
       EEIINNVVAALL An invalid bit was specified in _f_l_a_g_s.

       EEIINNVVAALL CCLLOONNEE__TTHHRREEAADD, CCLLOONNEE__SSIIGGHHAANNDD, or CCLLOONNEE__VVMM was specified in _f_l_a_g_s,
              and the caller is multithreaded.

       EENNOOMMEEMM Cannot allocate sufficient memory to copy parts of caller's
              context that need to be unshared.

       EENNOOSSPPCC (since Linux 3.7)
              CCLLOONNEE__NNEEWWPPIIDD was specified in flags, but the limit on the
              nesting depth of PID namespaces would have been exceeded; see
              ppiidd__nnaammeessppaacceess(7).

       EENNOOSSPPCC (since Linux 4.9; beforehand EEUUSSEERRSS)
              CCLLOONNEE__NNEEWWUUSSEERR was specified in _f_l_a_g_s, and the call would cause
              the limit on the number of nested user namespaces to be
              exceeded.  See uusseerr__nnaammeessppaacceess(7).

              From Linux 3.11 to Linux 4.8, the error diagnosed in this case
              was EEUUSSEERRSS.

       EENNOOSSPPCC (since Linux 4.9)
              One of the values in _f_l_a_g_s specified the creation of a new user
              namespace, but doing so would have caused the limit defined by
              the corresponding file in _/_p_r_o_c_/_s_y_s_/_u_s_e_r to be exceeded.  For
              further details, see nnaammeessppaacceess(7).

       EEPPEERRMM  The calling process did not have the required privileges for
              this operation.

       EEPPEERRMM  CCLLOONNEE__NNEEWWUUSSEERR was specified in _f_l_a_g_s, but either the effective
              user ID or the effective group ID of the caller does not have a
              mapping in the parent namespace (see uusseerr__nnaammeessppaacceess(7)).

       EEPPEERRMM (since Linux 3.9)
              CCLLOONNEE__NNEEWWUUSSEERR was specified in _f_l_a_g_s and the caller is in a
              chroot environment (i.e., the caller's root directory does not
              match the root directory of the mount namespace in which it
              resides).

       EEUUSSEERRSS (from Linux 3.11 to Linux 4.8)
              CCLLOONNEE__NNEEWWUUSSEERR was specified in _f_l_a_g_s, and the limit on the
              number of nested user namespaces would be exceeded.  See the
              discussion of the EENNOOSSPPCC error above.

VVEERRSSIIOONNSS
       The uunnsshhaarree() system call was added to Linux in kernel 2.6.16.

CCOONNFFOORRMMIINNGG TTOO
       The uunnsshhaarree() system call is Linux-specific.

NNOOTTEESS
       Not all of the process attributes that can be shared when a new process
       is created using cclloonnee(2) can be unshared using uunnsshhaarree().  In
       particular, as at kernel 3.8, uunnsshhaarree() does not implement flags that
       reverse the effects of CCLLOONNEE__SSIIGGHHAANNDD, CCLLOONNEE__TTHHRREEAADD, or CCLLOONNEE__VVMM.  Such
       functionality may be added in the future, if required.

EEXXAAMMPPLLEE
       The program below provides a simple implementation of the uunnsshhaarree(1)
       command, which unshares one or more namespaces and executes the command
       supplied in its command-line arguments.  Here's an example of the use
       of this program, running a shell in a new mount namespace, and
       verifying that the original shell and the new shell are in separate
       mount namespaces:

           $ rreeaaddlliinnkk //pprroocc//$$$$//nnss//mmnntt
           mnt:[4026531840]
           $ ssuuddoo ..//uunnsshhaarree --mm //bbiinn//bbaasshh
           # rreeaaddlliinnkk //pprroocc//$$$$//nnss//mmnntt
           mnt:[4026532325]

       The differing output of the two rreeaaddlliinnkk(1) commands shows that the two
       shells are in different mount namespaces.

   PPrrooggrraamm ssoouurrccee
       /* unshare.c

          A simple implementation of the unshare(1) command: unshare
          namespaces and execute a command.
       */
       #define _GNU_SOURCE
       #include <sched.h>
       #include <unistd.h>
       #include <stdlib.h>
       #include <stdio.h>

       /* A simple error-handling function: print an error message based
          on the value in 'errno' and terminate the calling process */

       #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                               } while (0)

       static void
       usage(char *pname)
       {
           fprintf(stderr, "Usage: %s [options] program [arg...]\n", pname);
           fprintf(stderr, "Options can be:\n");
           fprintf(stderr, "    -i   unshare IPC namespace\n");
           fprintf(stderr, "    -m   unshare mount namespace\n");
           fprintf(stderr, "    -n   unshare network namespace\n");
           fprintf(stderr, "    -p   unshare PID namespace\n");
           fprintf(stderr, "    -u   unshare UTS namespace\n");
           fprintf(stderr, "    -U   unshare user namespace\n");
           exit(EXIT_FAILURE);
       }

       int
       main(int argc, char *argv[])
       {
           int flags, opt;

           flags = 0;

           while ((opt = getopt(argc, argv, "imnpuU")) != -1) {
               switch (opt) {
               case 'i': flags |= CLONE_NEWIPC;        break;
               case 'm': flags |= CLONE_NEWNS;         break;
               case 'n': flags |= CLONE_NEWNET;        break;
               case 'p': flags |= CLONE_NEWPID;        break;
               case 'u': flags |= CLONE_NEWUTS;        break;
               case 'U': flags |= CLONE_NEWUSER;       break;
               default:  usage(argv[0]);
               }
           }

           if (optind >= argc)
               usage(argv[0]);

           if (unshare(flags) == -1)
               errExit("unshare");

           execvp(argv[optind], &argv[optind]);
           errExit("execvp");
       }

SSEEEE AALLSSOO
       uunnsshhaarree(1), cclloonnee(2), ffoorrkk(2), kkccmmpp(2), sseettnnss(2), vvffoorrkk(2),
       nnaammeessppaacceess(7)

       _D_o_c_u_m_e_n_t_a_t_i_o_n_/_u_s_e_r_s_p_a_c_e_-_a_p_i_/_u_n_s_h_a_r_e_._r_s_t in the Linux kernel source tree
       (or _D_o_c_u_m_e_n_t_a_t_i_o_n_/_u_n_s_h_a_r_e_._t_x_t before Linux 4.12)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2018-02-02                        UNSHARE(2)
