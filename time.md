TIME(1)                       Linux User's Manual                      TIME(1)



NNAAMMEE
       time - time a simple command or give resource usage

SSYYNNOOPPSSIISS
       ttiimmee [[_o_p_t_i_o_n_s]] _c_o_m_m_a_n_d [[_a_r_g_u_m_e_n_t_s_._._.]]

DDEESSCCRRIIPPTTIIOONN
       The ttiimmee command runs the specified program _c_o_m_m_a_n_d with the given
       arguments.  When _c_o_m_m_a_n_d finishes, ttiimmee writes a message to standard
       error giving timing statistics about this program run.  These
       statistics consist of (i) the elapsed real time between invocation and
       termination, (ii) the user CPU time (the sum of the _t_m_s___u_t_i_m_e and
       _t_m_s___c_u_t_i_m_e values in a _s_t_r_u_c_t _t_m_s as returned by ttiimmeess(2)), and (iii)
       the system CPU time (the sum of the _t_m_s___s_t_i_m_e and _t_m_s___c_s_t_i_m_e values in
       a _s_t_r_u_c_t _t_m_s as returned by ttiimmeess(2)).

       Note: some shells (e.g., bbaasshh(1)) have a built-in ttiimmee command that
       provides similar information on the usage of time and possibly other
       resources.  To access the real command, you may need to specify its
       pathname (something like _/_u_s_r_/_b_i_n_/_t_i_m_e).

OOPPTTIIOONNSS
       --pp     When in the POSIX locale, use the precise traditional format

                  "real %f\nuser %f\nsys %f\n"

              (with numbers in seconds) where the number of decimals in the
              output for %f is unspecified but is sufficient to express the
              clock tick accuracy, and at least one.

EEXXIITT SSTTAATTUUSS
       If _c_o_m_m_a_n_d was invoked, the exit status is that of _c_o_m_m_a_n_d.  Otherwise,
       it is 127 if _c_o_m_m_a_n_d could not be found, 126 if it could be found but
       could not be invoked, and some other nonzero value (1–125) if something
       else went wrong.

EENNVVIIRROONNMMEENNTT
       The variables LLAANNGG, LLCC__AALLLL, LLCC__CCTTYYPPEE, LLCC__MMEESSSSAAGGEESS, LLCC__NNUUMMEERRIICC, and
       NNLLSSPPAATTHH are used for the text and formatting of the output.  PPAATTHH is
       used to search for _c_o_m_m_a_n_d.  The remaining ones for the text and
       formatting of the output.

GGNNUU VVEERRSSIIOONN
       Below a description of the GNU 1.7 version of ttiimmee.  Disregarding the
       name of the utility, GNU makes it output lots of useful information,
       not only about time used, but also on other resources like memory, I/O
       and IPC calls (where available).  The output is formatted using a
       format string that can be specified using the _-_f option or the TTIIMMEE
       environment variable.

       The default format string is:

           %Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k
           %Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps

       When the _-_p option is given, the (portable) output format is used:

           real %e
           user %U
           sys %S

   TThhee ffoorrmmaatt ssttrriinngg
       The format is interpreted in the usual printf-like way.  Ordinary
       characters are directly copied, tab, newline and backslash are escaped
       using \t, \n and \\, a percent sign is represented by %%, and otherwise
       % indicates a conversion.  The program ttiimmee will always add a trailing
       newline itself.  The conversions follow.  All of those used by ttccsshh(1)
       are supported.

       TTiimmee

       %%EE     Elapsed real time (in [hours:]minutes:seconds).

       %%ee     (Not in ttccsshh(1).)  Elapsed real time (in seconds).

       %%SS     Total number of CPU-seconds that the process spent in kernel
              mode.

       %%UU     Total number of CPU-seconds that the process spent in user mode.

       %%PP     Percentage of the CPU that this job got, computed as (%U + %S) /
              %E.

       MMeemmoorryy

       %%MM     Maximum resident set size of the process during its lifetime, in
              Kbytes.

       %%tt     (Not in ttccsshh(1).)  Average resident set size of the process, in
              Kbytes.

       %%KK     Average total (data+stack+text) memory use of the process, in
              Kbytes.

       %%DD     Average size of the process's unshared data area, in Kbytes.

       %%pp     (Not in ttccsshh(1).)  Average size of the process's unshared stack
              space, in Kbytes.

       %%XX     Average size of the process's shared text space, in Kbytes.

       %%ZZ     (Not in ttccsshh(1).)  System's page size, in bytes.  This is a per-
              system constant, but varies between systems.

       %%FF     Number of major page faults that occurred while the process was
              running.  These are faults where the page has to be read in from
              disk.

       %%RR     Number of minor, or recoverable, page faults.  These are faults
              for pages that are not valid but which have not yet been claimed
              by other virtual pages.  Thus the data in the page is still
              valid but the system tables must be updated.

       %%WW     Number of times the process was swapped out of main memory.

       %%cc     Number of times the process was context-switched involuntarily
              (because the time slice expired).

       %%ww     Number of waits: times that the program was context-switched
              voluntarily, for instance while waiting for an I/O operation to
              complete.

       II//OO

       %%II     Number of filesystem inputs by the process.

       %%OO     Number of filesystem outputs by the process.

       %%rr     Number of socket messages received by the process.

       %%ss     Number of socket messages sent by the process.

       %%kk     Number of signals delivered to the process.

       %%CC     (Not in ttccsshh(1).)  Name and command-line arguments of the
              command being timed.

       %%xx     (Not in ttccsshh(1).)  Exit status of the command.

   GGNNUU ooppttiioonnss
       --ff _f_o_r_m_a_t,, ----ffoorrmmaatt==_f_o_r_m_a_t
              Specify output format, possibly overriding the format specified
              in the environment variable TIME.

       --pp,, ----ppoorrttaabbiilliittyy
              Use the portable output format.

       --oo _f_i_l_e,, ----oouuttppuutt==_f_i_l_e
              Do not send the results to _s_t_d_e_r_r, but overwrite the specified
              file.

       --aa,, ----aappppeenndd
              (Used together with -o.) Do not overwrite but append.

       --vv,, ----vveerrbboossee
              Give very verbose output about all the program knows about.

   GGNNUU ssttaannddaarrdd ooppttiioonnss
       ----hheellpp Print a usage message on standard output and exit successfully.

       --VV,, ----vveerrssiioonn
              Print version information on standard output, then exit
              successfully.

       ----     Terminate option list.

BBUUGGSS
       Not all resources are measured by all versions of UNIX, so some of the
       values might be reported as zero.  The present selection was mostly
       inspired by the data provided by 4.2 or 4.3BSD.

       GNU time version 1.7 is not yet localized.  Thus, it does not implement
       the POSIX requirements.

       The environment variable TTIIMMEE was badly chosen.  It is not unusual for
       systems like aauuttooccoonnff(1) or mmaakkee(1) to use environment variables with
       the name of a utility to override the utility to be used.  Uses like
       MORE or TIME for options to programs (instead of program pathnames)
       tend to lead to difficulties.

       It seems unfortunate that _-_o overwrites instead of appends.  (That is,
       the _-_a option should be the default.)

       Mail suggestions and bug reports for GNU ttiimmee to
       _b_u_g_-_u_t_i_l_s_@_p_r_e_p_._a_i_._m_i_t_._e_d_u.  Please include the version of ttiimmee, which
       you can get by running

           time --version

       and the operating system and C compiler you used.

SSEEEE AALLSSOO
       bbaasshh(1), ttccsshh(1), ttiimmeess(2), wwaaiitt33(2)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



                                  2017-09-15                           TIME(1)
