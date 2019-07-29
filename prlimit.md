GETRLIMIT(2)               Linux Programmer's Manual              GETRLIMIT(2)



NNAAMMEE
       getrlimit, setrlimit, prlimit - get/set resource limits

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//ttiimmee..hh>>
       ##iinncclluuddee <<ssyyss//rreessoouurrccee..hh>>

       iinntt ggeettrrlliimmiitt((iinntt _r_e_s_o_u_r_c_e,, ssttrruucctt rrlliimmiitt **_r_l_i_m));;
       iinntt sseettrrlliimmiitt((iinntt _r_e_s_o_u_r_c_e,, ccoonnsstt ssttrruucctt rrlliimmiitt **_r_l_i_m));;

       iinntt pprrlliimmiitt((ppiidd__tt _p_i_d,, iinntt _r_e_s_o_u_r_c_e,, ccoonnsstt ssttrruucctt rrlliimmiitt **_n_e_w___l_i_m_i_t,,
                   ssttrruucctt rrlliimmiitt **_o_l_d___l_i_m_i_t));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       pprrlliimmiitt(): _GNU_SOURCE

DDEESSCCRRIIPPTTIIOONN
       The ggeettrrlliimmiitt() and sseettrrlliimmiitt() system calls get and set resource
       limits respectively.  Each resource has an associated soft and hard
       limit, as defined by the _r_l_i_m_i_t structure:

           struct rlimit {
               rlim_t rlim_cur;  /* Soft limit */
               rlim_t rlim_max;  /* Hard limit (ceiling for rlim_cur) */
           };

       The soft limit is the value that the kernel enforces for the
       corresponding resource.  The hard limit acts as a ceiling for the soft
       limit: an unprivileged process may set only its soft limit to a value
       in the range from 0 up to the hard limit, and (irreversibly) lower its
       hard limit.  A privileged process (under Linux: one with the
       CCAAPP__SSYYSS__RREESSOOUURRCCEE capability in the initial user namespace) may make
       arbitrary changes to either limit value.

       The value RRLLIIMM__IINNFFIINNIITTYY denotes no limit on a resource (both in the
       structure returned by ggeettrrlliimmiitt() and in the structure passed to
       sseettrrlliimmiitt()).

       The _r_e_s_o_u_r_c_e argument must be one of:

       RRLLIIMMIITT__AASS
              This is the maximum size of the process's virtual memory
              (address space).  The limit is specified in bytes, and is
              rounded down to the system page size.  This limit affects calls
              to bbrrkk(2), mmmmaapp(2), and mmrreemmaapp(2), which fail with the error
              EENNOOMMEEMM upon exceeding this limit.  In addition, automatic stack
              expansion fails (and generates a SSIIGGSSEEGGVV that kills the process
              if no alternate stack has been made available via
              ssiiggaallttssttaacckk(2)).  Since the value is a _l_o_n_g, on machines with a
              32-bit _l_o_n_g either this limit is at most 2 GiB, or this resource
              is unlimited.

       RRLLIIMMIITT__CCOORREE
              This is the maximum size of a _c_o_r_e file (see ccoorree(5)) in bytes
              that the process may dump.  When 0 no core dump files are
              created.  When nonzero, larger dumps are truncated to this size.

       RRLLIIMMIITT__CCPPUU
              This is a limit, in seconds, on the amount of CPU time that the
              process can consume.  When the process reaches the soft limit,
              it is sent a SSIIGGXXCCPPUU signal.  The default action for this signal
              is to terminate the process.  However, the signal can be caught,
              and the handler can return control to the main program.  If the
              process continues to consume CPU time, it will be sent SSIIGGXXCCPPUU
              once per second until the hard limit is reached, at which time
              it is sent SSIIGGKKIILLLL.  (This latter point describes Linux
              behavior.  Implementations vary in how they treat processes
              which continue to consume CPU time after reaching the soft
              limit.  Portable applications that need to catch this signal
              should perform an orderly termination upon first receipt of
              SSIIGGXXCCPPUU.)

       RRLLIIMMIITT__DDAATTAA
              This is the maximum size of the process's data segment
              (initialized data, uninitialized data, and heap).  The limit is
              specified in bytes, and is rounded down to the system page size.
              This limit affects calls to bbrrkk(2), ssbbrrkk(2), and (since Linux
              4.7) mmmmaapp(2), which fail with the error EENNOOMMEEMM upon encountering
              the soft limit of this resource.

       RRLLIIMMIITT__FFSSIIZZEE
              This is the maximum size in bytes of files that the process may
              create.  Attempts to extend a file beyond this limit result in
              delivery of a SSIIGGXXFFSSZZ signal.  By default, this signal
              terminates a process, but a process can catch this signal
              instead, in which case the relevant system call (e.g., wwrriittee(2),
              ttrruunnccaattee(2)) fails with the error EEFFBBIIGG.

       RRLLIIMMIITT__LLOOCCKKSS (early Linux 2.4 only)
              This is a limit on the combined number of fflloocckk(2) locks and
              ffccnnttll(2) leases that this process may establish.

       RRLLIIMMIITT__MMEEMMLLOOCCKK
              This is the maximum number of bytes of memory that may be locked
              into RAM.  This limit is in effect rounded down to the nearest
              multiple of the system page size.  This limit affects mmlloocckk(2),
              mmlloocckkaallll(2), and the mmmmaapp(2) MMAAPP__LLOOCCKKEEDD operation.  Since Linux
              2.6.9, it also affects the sshhmmccttll(2) SSHHMM__LLOOCCKK operation, where
              it sets a maximum on the total bytes in shared memory segments
              (see sshhmmggeett(2)) that may be locked by the real user ID of the
              calling process.  The sshhmmccttll(2) SSHHMM__LLOOCCKK locks are accounted for
              separately from the per-process memory locks established by
              mmlloocckk(2), mmlloocckkaallll(2), and mmmmaapp(2) MMAAPP__LLOOCCKKEEDD; a process can
              lock bytes up to this limit in each of these two categories.

              In Linux kernels before 2.6.9, this limit controlled the amount
              of memory that could be locked by a privileged process.  Since
              Linux 2.6.9, no limits are placed on the amount of memory that a
              privileged process may lock, and this limit instead governs the
              amount of memory that an unprivileged process may lock.

       RRLLIIMMIITT__MMSSGGQQUUEEUUEE (since Linux 2.6.8)
              This is a limit on the number of bytes that can be allocated for
              POSIX message queues for the real user ID of the calling
              process.  This limit is enforced for mmqq__ooppeenn(3).  Each message
              queue that the user creates counts (until it is removed) against
              this limit according to the formula:

                  Since Linux 3.5:

                      bytes = attr.mq_maxmsg * sizeof(struct msg_msg) +
                              min(attr.mq_maxmsg, MQ_PRIO_MAX) *
                                    sizeof(struct posix_msg_tree_node)+
                                              /* For overhead */
                              attr.mq_maxmsg * attr.mq_msgsize;
                                              /* For message data */

                  Linux 3.4 and earlier:

                      bytes = attr.mq_maxmsg * sizeof(struct msg_msg *) +
                                              /* For overhead */
                              attr.mq_maxmsg * attr.mq_msgsize;
                                              /* For message data */

              where _a_t_t_r is the _m_q___a_t_t_r structure specified as the fourth
              argument to mmqq__ooppeenn(3), and the _m_s_g___m_s_g and _p_o_s_i_x___m_s_g___t_r_e_e___n_o_d_e
              structures are kernel-internal structures.

              The "overhead" addend in the formula accounts for overhead bytes
              required by the implementation and ensures that the user cannot
              create an unlimited number of zero-length messages (such
              messages nevertheless each consume some system memory for
              bookkeeping overhead).

       RRLLIIMMIITT__NNIICCEE (since Linux 2.6.12, but see BUGS below)
              This specifies a ceiling to which the process's nice value can
              be raised using sseettpprriioorriittyy(2) or nniiccee(2).  The actual ceiling
              for the nice value is calculated as _2_0_ _-_ _r_l_i_m___c_u_r.  The useful
              range for this limit is thus from 1 (corresponding to a nice
              value of 19) to 40 (corresponding to a nice value of -20).  This
              unusual choice of range was necessary because negative numbers
              cannot be specified as resource limit values, since they
              typically have special meanings.  For example, RRLLIIMM__IINNFFIINNIITTYY
              typically is the same as -1.  For more detail on the nice value,
              see sscchheedd(7).

       RRLLIIMMIITT__NNOOFFIILLEE
              This specifies a value one greater than the maximum file
              descriptor number that can be opened by this process.  Attempts
              (ooppeenn(2), ppiippee(2), dduupp(2), etc.)  to exceed this limit yield the
              error EEMMFFIILLEE.  (Historically, this limit was named RRLLIIMMIITT__OOFFIILLEE
              on BSD.)

              Since Linux 4.5, this limit also defines the maximum number of
              file descriptors that an unprivileged process (one without the
              CCAAPP__SSYYSS__RREESSOOUURRCCEE capability) may have "in flight" to other
              processes, by being passed across UNIX domain sockets.  This
              limit applies to the sseennddmmssgg(2) system call.  For further
              details, see uunniixx(7).

       RRLLIIMMIITT__NNPPRROOCC
              This is a limit on the number of extant process (or, more
              precisely on Linux, threads) for the real user ID of the calling
              process.  So long as the current number of processes belonging
              to this process's real user ID is greater than or equal to this
              limit, ffoorrkk(2) fails with the error EEAAGGAAIINN.

              The RRLLIIMMIITT__NNPPRROOCC limit is not enforced for processes that have
              either the CCAAPP__SSYYSS__AADDMMIINN or the CCAAPP__SSYYSS__RREESSOOUURRCCEE capability.

       RRLLIIMMIITT__RRSSSS
              This is a limit (in bytes) on the process's resident set (the
              number of virtual pages resident in RAM).  This limit has effect
              only in Linux 2.4.x, x < 30, and there affects only calls to
              mmaaddvviissee(2) specifying MMAADDVV__WWIILLLLNNEEEEDD.

       RRLLIIMMIITT__RRTTPPRRIIOO (since Linux 2.6.12, but see BUGS)
              This specifies a ceiling on the real-time priority that may be
              set for this process using sscchheedd__sseettsscchheedduulleerr(2) and
              sscchheedd__sseettppaarraamm(2).

              For further details on real-time scheduling policies, see
              sscchheedd(7)

       RRLLIIMMIITT__RRTTTTIIMMEE (since Linux 2.6.25)
              This is a limit (in microseconds) on the amount of CPU time that
              a process scheduled under a real-time scheduling policy may
              consume without making a blocking system call.  For the purpose
              of this limit, each time a process makes a blocking system call,
              the count of its consumed CPU time is reset to zero.  The CPU
              time count is not reset if the process continues trying to use
              the CPU but is preempted, its time slice expires, or it calls
              sscchheedd__yyiieelldd(2).

              Upon reaching the soft limit, the process is sent a SSIIGGXXCCPPUU
              signal.  If the process catches or ignores this signal and
              continues consuming CPU time, then SSIIGGXXCCPPUU will be generated
              once each second until the hard limit is reached, at which point
              the process is sent a SSIIGGKKIILLLL signal.

              The intended use of this limit is to stop a runaway real-time
              process from locking up the system.

              For further details on real-time scheduling policies, see
              sscchheedd(7)

       RRLLIIMMIITT__SSIIGGPPEENNDDIINNGG (since Linux 2.6.8)
              This is a limit on the number of signals that may be queued for
              the real user ID of the calling process.  Both standard and
              real-time signals are counted for the purpose of checking this
              limit.  However, the limit is enforced only for ssiiggqquueeuuee(3); it
              is always possible to use kkiillll(2) to queue one instance of any
              of the signals that are not already queued to the process.

       RRLLIIMMIITT__SSTTAACCKK
              This is the maximum size of the process stack, in bytes.  Upon
              reaching this limit, a SSIIGGSSEEGGVV signal is generated.  To handle
              this signal, a process must employ an alternate signal stack
              (ssiiggaallttssttaacckk(2)).

              Since Linux 2.6.23, this limit also determines the amount of
              space used for the process's command-line arguments and
              environment variables; for details, see eexxeeccvvee(2).

   pprrlliimmiitt(())
       The Linux-specific pprrlliimmiitt() system call combines and extends the
       functionality of sseettrrlliimmiitt() and ggeettrrlliimmiitt().  It can be used to both
       set and get the resource limits of an arbitrary process.

       The _r_e_s_o_u_r_c_e argument has the same meaning as for sseettrrlliimmiitt() and
       ggeettrrlliimmiitt().

       If the _n_e_w___l_i_m_i_t argument is a not NULL, then the _r_l_i_m_i_t structure to
       which it points is used to set new values for the soft and hard limits
       for _r_e_s_o_u_r_c_e.  If the _o_l_d___l_i_m_i_t argument is a not NULL, then a
       successful call to pprrlliimmiitt() places the previous soft and hard limits
       for _r_e_s_o_u_r_c_e in the _r_l_i_m_i_t structure pointed to by _o_l_d___l_i_m_i_t.

       The _p_i_d argument specifies the ID of the process on which the call is
       to operate.  If _p_i_d is 0, then the call applies to the calling process.
       To set or get the resources of a process other than itself, the caller
       must have the CCAAPP__SSYYSS__RREESSOOUURRCCEE capability in the user namespace of the
       process whose resource limits are being changed, or the real,
       effective, and saved set user IDs of the target process must match the
       real user ID of the caller _a_n_d the real, effective, and saved set group
       IDs of the target process must match the real group ID of the caller.

RREETTUURRNN VVAALLUUEE
       On success, these system calls return 0.  On error, -1 is returned, and
       _e_r_r_n_o is set appropriately.

EERRRROORRSS
       EEFFAAUULLTT A pointer argument points to a location outside the accessible
              address space.

       EEIINNVVAALL The value specified in _r_e_s_o_u_r_c_e is not valid; or, for
              sseettrrlliimmiitt() or pprrlliimmiitt(): _r_l_i_m_-_>_r_l_i_m___c_u_r was greater than
              _r_l_i_m_-_>_r_l_i_m___m_a_x.

       EEPPEERRMM  An unprivileged process tried to raise the hard limit; the
              CCAAPP__SSYYSS__RREESSOOUURRCCEE capability is required to do this.

       EEPPEERRMM  The caller tried to increase the hard RRLLIIMMIITT__NNOOFFIILLEE limit above
              the maximum defined by _/_p_r_o_c_/_s_y_s_/_f_s_/_n_r___o_p_e_n (see pprroocc(5))

       EEPPEERRMM  (pprrlliimmiitt()) The calling process did not have permission to set
              limits for the process specified by _p_i_d.

       EESSRRCCHH  Could not find a process with the ID specified in _p_i_d.

VVEERRSSIIOONNSS
       The pprrlliimmiitt() system call is available since Linux 2.6.36.  Library
       support is available since glibc 2.13.

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +------------------------------------+---------------+---------+
       |IInntteerrffaaccee                           | AAttttrriibbuuttee     | VVaalluuee   |
       +------------------------------------+---------------+---------+
       |getrlimit (), setrlimit (), prlimit | Thread safety | MT-Safe |
       |()                                  |               |         |
       +------------------------------------+---------------+---------+

CCOONNFFOORRMMIINNGG TTOO
       ggeettrrlliimmiitt(), sseettrrlliimmiitt(): POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.

       pprrlliimmiitt(): Linux-specific.

       RRLLIIMMIITT__MMEEMMLLOOCCKK and RRLLIIMMIITT__NNPPRROOCC derive from BSD and are not specified
       in POSIX.1; they are present on the BSDs and Linux, but on few other
       implementations.  RRLLIIMMIITT__RRSSSS derives from BSD and is not specified in
       POSIX.1; it is nevertheless present on most implementations.
       RRLLIIMMIITT__MMSSGGQQUUEEUUEE, RRLLIIMMIITT__NNIICCEE, RRLLIIMMIITT__RRTTPPRRIIOO, RRLLIIMMIITT__RRTTTTIIMMEE, and
       RRLLIIMMIITT__SSIIGGPPEENNDDIINNGG are Linux-specific.

NNOOTTEESS
       A child process created via ffoorrkk(2) inherits its parent's resource
       limits.  Resource limits are preserved across eexxeeccvvee(2).

       Lowering the soft limit for a resource below the process's current
       consumption of that resource will succeed (but will prevent the process
       from further increasing its consumption of the resource).

       One can set the resource limits of the shell using the built-in _u_l_i_m_i_t
       command (_l_i_m_i_t in ccsshh(1)).  The shell's resource limits are inherited
       by the processes that it creates to execute commands.

       Since Linux 2.6.24, the resource limits of any process can be inspected
       via _/_p_r_o_c_/_[_p_i_d_]_/_l_i_m_i_t_s; see pprroocc(5).

       Ancient systems provided a vvlliimmiitt() function with a similar purpose to
       sseettrrlliimmiitt().  For backward compatibility, glibc also provides vvlliimmiitt().
       All new applications should be written using sseettrrlliimmiitt().

   CC lliibbrraarryy//kkeerrnneell AABBII ddiiffffeerreenncceess
       Since version 2.13, the glibc ggeettrrlliimmiitt() and sseettrrlliimmiitt() wrapper
       functions no longer invoke the corresponding system calls, but instead
       employ pprrlliimmiitt(), for the reasons described in BUGS.

       The name of the glibc wrapper function is pprrlliimmiitt(); the underlying
       system call is pprrlliimmiitt6644().

BBUUGGSS
       In older Linux kernels, the SSIIGGXXCCPPUU and SSIIGGKKIILLLL signals delivered when
       a process encountered the soft and hard RRLLIIMMIITT__CCPPUU limits were
       delivered one (CPU) second later than they should have been.  This was
       fixed in kernel 2.6.8.

       In 2.6.x kernels before 2.6.17, a RRLLIIMMIITT__CCPPUU limit of 0 is wrongly
       treated as "no limit" (like RRLLIIMM__IINNFFIINNIITTYY).  Since Linux 2.6.17,
       setting a limit of 0 does have an effect, but is actually treated as a
       limit of 1 second.

       A kernel bug means that RRLLIIMMIITT__RRTTPPRRIIOO does not work in kernel 2.6.12;
       the problem is fixed in kernel 2.6.13.

       In kernel 2.6.12, there was an off-by-one mismatch between the priority
       ranges returned by ggeettpprriioorriittyy(2) and RRLLIIMMIITT__NNIICCEE.  This had the effect
       that the actual ceiling for the nice value was calculated as
       _1_9_ _-_ _r_l_i_m___c_u_r.  This was fixed in kernel 2.6.13.

       Since Linux 2.6.12, if a process reaches its soft RRLLIIMMIITT__CCPPUU limit and
       has a handler installed for SSIIGGXXCCPPUU, then, in addition to invoking the
       signal handler, the kernel increases the soft limit by one second.
       This behavior repeats if the process continues to consume CPU time,
       until the hard limit is reached, at which point the process is killed.
       Other implementations do not change the RRLLIIMMIITT__CCPPUU soft limit in this
       manner, and the Linux behavior is probably not standards conformant;
       portable applications should avoid relying on this Linux-specific
       behavior.  The Linux-specific RRLLIIMMIITT__RRTTTTIIMMEE limit exhibits the same
       behavior when the soft limit is encountered.

       Kernels before 2.4.22 did not diagnose the error EEIINNVVAALL for sseettrrlliimmiitt()
       when _r_l_i_m_-_>_r_l_i_m___c_u_r was greater than _r_l_i_m_-_>_r_l_i_m___m_a_x.

   RReepprreesseennttaattiioonn ooff ""llaarrggee"" rreessoouurrccee lliimmiitt vvaalluueess oonn 3322--bbiitt ppllaattffoorrmmss
       The glibc ggeettrrlliimmiitt() and sseettrrlliimmiitt() wrapper functions use a 64-bit
       _r_l_i_m___t data type, even on 32-bit platforms.  However, the _r_l_i_m___t data
       type used in the ggeettrrlliimmiitt() and sseettrrlliimmiitt() system calls is a (32-bit)
       _u_n_s_i_g_n_e_d _l_o_n_g.  Furthermore, in Linux versions before 2.6.36, the
       kernel represents resource limits on 32-bit platforms as _u_n_s_i_g_n_e_d _l_o_n_g.
       However, a 32-bit data type is not wide enough.  The most pertinent
       limit here is RRLLIIMMIITT__FFSSIIZZEE, which specifies the maximum size to which a
       file can grow: to be useful, this limit must be represented using a
       type that is as wide as the type used to represent file offsets—that
       is, as wide as a 64-bit ooffff__tt (assuming a program compiled with
       ___F_I_L_E___O_F_F_S_E_T___B_I_T_S_=_6_4).

       To work around this kernel limitation, if a program tried to set a
       resource limit to a value larger than can be represented in a 32-bit
       _u_n_s_i_g_n_e_d _l_o_n_g, then the glibc sseettrrlliimmiitt() wrapper function silently
       converted the limit value to RRLLIIMM__IINNFFIINNIITTYY.  In other words, the
       requested resource limit setting was silently ignored.

       This problem was addressed in Linux 2.6.36 with two principal changes:

       *  the addition of a new kernel representation of resource limits that
          uses 64 bits, even on 32-bit platforms;

       *  the addition of the pprrlliimmiitt() system call, which employs 64-bit
          values for its resource limit arguments.

       Since version 2.13, glibc works around the limitations of the
       ggeettrrlliimmiitt() and sseettrrlliimmiitt() system calls by implementing sseettrrlliimmiitt()
       and ggeettrrlliimmiitt() as wrapper functions that call pprrlliimmiitt().

EEXXAAMMPPLLEE
       The program below demonstrates the use of pprrlliimmiitt().

       #define _GNU_SOURCE
       #define _FILE_OFFSET_BITS 64
       #include <stdio.h>
       #include <time.h>
       #include <stdlib.h>
       #include <unistd.h>
       #include <sys/resource.h>

       #define errExit(msg) do { perror(msg); exit(EXIT_FAILURE); \
                               } while (0)

       int
       main(int argc, char *argv[])
       {
           struct rlimit old, new;
           struct rlimit *newp;
           pid_t pid;

           if (!(argc == 2 || argc == 4)) {
               fprintf(stderr, "Usage: %s <pid> [<new-soft-limit> "
                       "<new-hard-limit>]\n", argv[0]);
               exit(EXIT_FAILURE);
           }

           pid = atoi(argv[1]);        /* PID of target process */

           newp = NULL;
           if (argc == 4) {
               new.rlim_cur = atoi(argv[2]);
               new.rlim_max = atoi(argv[3]);
               newp = &new;
           }

           /* Set CPU time limit of target process; retrieve and display
              previous limit */

           if (prlimit(pid, RLIMIT_CPU, newp, &old) == -1)
               errExit("prlimit-1");
           printf("Previous limits: soft=%lld; hard=%lld\n",
                   (long long) old.rlim_cur, (long long) old.rlim_max);

           /* Retrieve and display new CPU time limit */

           if (prlimit(pid, RLIMIT_CPU, NULL, &old) == -1)
               errExit("prlimit-2");
           printf("New limits: soft=%lld; hard=%lld\n",
                   (long long) old.rlim_cur, (long long) old.rlim_max);

           exit(EXIT_SUCCESS);
       }

SSEEEE AALLSSOO
       pprrlliimmiitt(1), dduupp(2), ffccnnttll(2), ffoorrkk(2), ggeettrruussaaggee(2), mmlloocckk(2), mmmmaapp(2),
       ooppeenn(2), qquuoottaaccttll(2), ssbbrrkk(2), sshhmmccttll(2), mmaalllloocc(3), ssiiggqquueeuuee(3),
       uulliimmiitt(3), ccoorree(5), ccaappaabbiilliittiieess(7), ccggrroouuppss(7), ccrreeddeennttiiaallss(7),
       ssiiggnnaall(7)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2018-04-30                      GETRLIMIT(2)
