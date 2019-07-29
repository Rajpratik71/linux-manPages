SETSID(2)                  Linux Programmer's Manual                 SETSID(2)



NNAAMMEE
       setsid - creates a session and sets the process group ID

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//ttyyppeess..hh>>
       ##iinncclluuddee <<uunniissttdd..hh>>

       ppiidd__tt sseettssiidd((vvooiidd));;

DDEESSCCRRIIPPTTIIOONN
       sseettssiidd() creates a new session if the calling process is not a process
       group leader.  The calling process is the leader of the new session
       (i.e., its session ID is made the same as its process ID).  The calling
       process also becomes the process group leader of a new process group in
       the session (i.e., its process group ID is made the same as its process
       ID).

       The calling process will be the only process in the new process group
       and in the new session.

       Initially, the new session has no controlling terminal.  For details of
       how a session acquires a controlling terminal, see ccrreeddeennttiiaallss(7).

RREETTUURRNN VVAALLUUEE
       On success, the (new) session ID of the calling process is returned.
       On error, _(_p_i_d___t_)_ _-_1 is returned, and _e_r_r_n_o is set to indicate the
       error.

EERRRROORRSS
       EEPPEERRMM  The process group ID of any process equals the PID of the
              calling process.  Thus, in particular, sseettssiidd() fails if the
              calling process is already a process group leader.

CCOONNFFOORRMMIINNGG TTOO
       POSIX.1-2001, POSIX.1-2008, SVr4.

NNOOTTEESS
       A child created via ffoorrkk(2) inherits its parent's session ID.  The
       session ID is preserved across an eexxeeccvvee(2).

       A process group leader is a process whose process group ID equals its
       PID.  Disallowing a process group leader from calling sseettssiidd() prevents
       the possibility that a process group leader places itself in a new
       session while other processes in the process group remain in the
       original session; such a scenario would break the strict two-level
       hierarchy of sessions and process groups.  In order to be sure that
       sseettssiidd() will succeed, call ffoorrkk(2) and have the parent __eexxiitt(2), while
       the child (which by definition can't be a process group leader) calls
       sseettssiidd().

       If a session has a controlling terminal, and the CCLLOOCCAALL flag for that
       terminal is not set, and a terminal hangup occurs, then the session
       leader is sent a SSIIGGHHUUPP signal.

       If a process that is a session leader terminates, then a SSIIGGHHUUPP signal
       is sent to each process in the foreground process group of the
       controlling terminal.

SSEEEE AALLSSOO
       sseettssiidd(1), ggeettssiidd(2), sseettppggiidd(2), sseettppggrrpp(2), ttccggeettssiidd(3),
       ccrreeddeennttiiaallss(7), sscchheedd(7)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                         SETSID(2)
