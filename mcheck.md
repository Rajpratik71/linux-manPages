MCHECK(3)                  Linux Programmer's Manual                 MCHECK(3)



NNAAMMEE
       mcheck, mcheck_check_all, mcheck_pedantic, mprobe - heap consistency
       checking

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<mmcchheecckk..hh>>

       iinntt mmcchheecckk((vvooiidd ((**_a_b_o_r_t_f_u_n_c))((eennuumm mmcchheecckk__ssttaattuuss _m_s_t_a_t_u_s))));;

       iinntt mmcchheecckk__ppeeddaannttiicc((vvooiidd ((**_a_b_o_r_t_f_u_n_c))((eennuumm mmcchheecckk__ssttaattuuss _m_s_t_a_t_u_s))));;

       vvooiidd mmcchheecckk__cchheecckk__aallll((vvooiidd));;

       eennuumm mmcchheecckk__ssttaattuuss mmpprroobbee((vvooiidd **_p_t_r));;

DDEESSCCRRIIPPTTIIOONN
       The mmcchheecckk() function installs a set of debugging hooks for the
       mmaalllloocc(3) family of memory-allocation functions.  These hooks cause
       certain consistency checks to be performed on the state of the heap.
       The checks can detect application errors such as freeing a block of
       memory more than once or corrupting the bookkeeping data structures
       that immediately precede a block of allocated memory.

       To be effective, the mmcchheecckk() function must be called before the first
       call to mmaalllloocc(3) or a related function.  In cases where this is
       difficult to ensure, linking the program with _-_l_m_c_h_e_c_k inserts an
       implicit call to mmcchheecckk() (with a NULL argument) before the first call
       to a memory-allocation function.

       The mmcchheecckk__ppeeddaannttiicc() function is similar to mmcchheecckk(), but performs
       checks on all allocated blocks whenever one of the memory-allocation
       functions is called.  This can be very slow!

       The mmcchheecckk__cchheecckk__aallll() function causes an immediate check on all
       allocated blocks.  This call is effective only if mmcchheecckk() is called
       beforehand.

       If the system detects an inconsistency in the heap, the caller-supplied
       function pointed to by _a_b_o_r_t_f_u_n_c is invoked with a single argument,
       _m_s_t_a_t_u_s, that indicates what type of inconsistency was detected.  If
       _a_b_o_r_t_f_u_n_c is NULL, a default function prints an error message on _s_t_d_e_r_r
       and calls aabboorrtt(3).

       The mmpprroobbee() function performs a consistency check on the block of
       allocated memory pointed to by _p_t_r.  The mmcchheecckk() function should be
       called beforehand (otherwise mmpprroobbee() returns MMCCHHEECCKK__DDIISSAABBLLEEDD).

       The following list describes the values returned by mmpprroobbee() or passed
       as the _m_s_t_a_t_u_s argument when _a_b_o_r_t_f_u_n_c is invoked:

       MMCCHHEECCKK__DDIISSAABBLLEEDD (mmpprroobbee() only)
              mmcchheecckk() was not called before the first memory allocation
              function was called.  Consistency checking is not possible.

       MMCCHHEECCKK__OOKK (mmpprroobbee() only)
              No inconsistency detected.

       MMCCHHEECCKK__HHEEAADD
              Memory preceding an allocated block was clobbered.

       MMCCHHEECCKK__TTAAIILL
              Memory following an allocated block was clobbered.

       MMCCHHEECCKK__FFRREEEE
              A block of memory was freed twice.

RREETTUURRNN VVAALLUUEE
       mmcchheecckk() and mmcchheecckk__ppeeddaannttiicc() return 0 on success, or -1 on error.

VVEERRSSIIOONNSS
       The mmcchheecckk__ppeeddaannttiicc() and mmcchheecckk__cchheecckk__aallll() functions are available
       since glibc 2.2.  The mmcchheecckk() and mmpprroobbee() functions are present since
       at least glibc 2.0

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +-----------------------------+---------------+-----------------------+
       |IInntteerrffaaccee                    | AAttttrriibbuuttee     | VVaalluuee                 |
       +-----------------------------+---------------+-----------------------+
       |mcheck (), mcheck_pedantic   | Thread safety | MT-Unsafe race:mcheck |
       |(), mcheck_check_all (),     |               | const:malloc_hooks    |
       |mprobe ()                    |               |                       |
       +-----------------------------+---------------+-----------------------+

CCOONNFFOORRMMIINNGG TTOO
       These functions are GNU extensions.

NNOOTTEESS
       Linking a program with _-_l_m_c_h_e_c_k and using the MMAALLLLOOCC__CCHHEECCKK__ environment
       variable (described in mmaalllloopptt(3)) cause the same kinds of errors to be
       detected.  But, using MMAALLLLOOCC__CCHHEECCKK__ does not require the application to
       be relinked.

EEXXAAMMPPLLEE
       The program below calls mmcchheecckk() with a NULL argument and then frees
       the same block of memory twice.  The following shell session
       demonstrates what happens when running the program:

           $ ..//aa..oouutt
           About to free

           About to free a second time
           block freed twice
           Aborted (core dumped)

   PPrrooggrraamm ssoouurrccee
       #include <stdlib.h>
       #include <stdio.h>
       #include <mcheck.h>

       int
       main(int argc, char *argv[])
       {
           char *p;

           if (mcheck(NULL) != 0) {
               fprintf(stderr, "mcheck() failed\n");

               exit(EXIT_FAILURE);
           }

           p = malloc(1000);

           fprintf(stderr, "About to free\n");
           free(p);
           fprintf(stderr, "\nAbout to free a second time\n");
           free(p);

           exit(EXIT_SUCCESS);
       }

SSEEEE AALLSSOO
       mmaalllloocc(3), mmaalllloopptt(3), mmttrraaccee(3)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



GNU                               2017-09-15                         MCHECK(3)
