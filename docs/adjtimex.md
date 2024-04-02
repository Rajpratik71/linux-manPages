ADJTIMEX(2)                Linux Programmer's Manual               ADJTIMEX(2)



NNAAMMEE
       adjtimex, ntp_adjtime - tune kernel clock

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//ttiimmeexx..hh>>

       iinntt aaddjjttiimmeexx((ssttrruucctt ttiimmeexx **_b_u_f));;

       iinntt nnttpp__aaddjjttiimmee((ssttrruucctt ttiimmeexx **_b_u_f));;

DDEESSCCRRIIPPTTIIOONN
       Linux uses David L. Mills' clock adjustment algorithm (see RFC 5905).
       The system call aaddjjttiimmeexx() reads and optionally sets adjustment
       parameters for this algorithm.  It takes a pointer to a _t_i_m_e_x
       structure, updates kernel parameters from (selected) field values, and
       returns the same structure updated with the current kernel values.
       This structure is declared as follows:

           struct timex {
               int  modes;      /* Mode selector */
               long offset;     /* Time offset; nanoseconds, if STA_NANO
                                   status flag is set, otherwise
                                   microseconds */
               long freq;       /* Frequency offset; see NOTES for units */
               long maxerror;   /* Maximum error (microseconds) */
               long esterror;   /* Estimated error (microseconds) */
               int  status;     /* Clock command/status */
               long constant;   /* PLL (phase-locked loop) time constant */
               long precision;  /* Clock precision
                                   (microseconds, read-only) */
               long tolerance;  /* Clock frequency tolerance (read-only);
                                   see NOTES for units */
               struct timeval time;
                                /* Current time (read-only, except for
                                   ADJ_SETOFFSET); upon return, time.tv_usec
                                   contains nanoseconds, if STA_NANO status
                                   flag is set, otherwise microseconds */
               long tick;       /* Microseconds between clock ticks */
               long ppsfreq;    /* PPS (pulse per second) frequency
                                   (read-only); see NOTES for units */
               long jitter;     /* PPS jitter (read-only); nanoseconds, if
                                   STA_NANO status flag is set, otherwise
                                   microseconds */
               int  shift;      /* PPS interval duration
                                   (seconds, read-only) */
               long stabil;     /* PPS stability (read-only);
                                   see NOTES for units */
               long jitcnt;     /* PPS count of jitter limit exceeded
                                   events (read-only) */
               long calcnt;     /* PPS count of calibration intervals
                                   (read-only) */
               long errcnt;     /* PPS count of calibration errors
                                   (read-only) */
               long stbcnt;     /* PPS count of stability limit exceeded
                                   events (read-only) */
               int tai;         /* TAI offset, as set by previous ADJ_TAI
                                   operation (seconds, read-only,
                                   since Linux 2.6.26) */
               /* Further padding bytes to allow for future expansion */
           };

       The _m_o_d_e_s field determines which parameters, if any, to set.  (As
       described later in this page, the constants used for nnttpp__aaddjjttiimmee() are
       equivalent but differently named.)  It is a bit mask containing a
       bitwise-_o_r combination of zero or more of the following bits:

       AADDJJ__OOFFFFSSEETT
              Set time offset from _b_u_f_._o_f_f_s_e_t.  Since Linux 2.6.26, the
              supplied value is clamped to the range (-0.5s, +0.5s).  In older
              kernels, an EEIINNVVAALL error occurs if the supplied value is out of
              range.

       AADDJJ__FFRREEQQUUEENNCCYY
              Set frequency offset from _b_u_f_._f_r_e_q.  Since Linux 2.6.26, the
              supplied value is clamped to the range (-32768000, +32768000).
              In older kernels, an EEIINNVVAALL error occurs if the supplied value
              is out of range.

       AADDJJ__MMAAXXEERRRROORR
              Set maximum time error from _b_u_f_._m_a_x_e_r_r_o_r.

       AADDJJ__EESSTTEERRRROORR
              Set estimated time error from _b_u_f_._e_s_t_e_r_r_o_r.

       AADDJJ__SSTTAATTUUSS
              Set clock status bits from _b_u_f_._s_t_a_t_u_s.  A description of these
              bits is provided below.

       AADDJJ__TTIIMMEECCOONNSSTT
              Set PLL time constant from _b_u_f_._c_o_n_s_t_a_n_t.  If the SSTTAA__NNAANNOO status
              flag (see below) is clear, the kernel adds 4 to this value.

       AADDJJ__SSEETTOOFFFFSSEETT (since Linux 2.6.39)
              Add _b_u_f_._t_i_m_e to the current time.  If _b_u_f_._s_t_a_t_u_s includes the
              AADDJJ__NNAANNOO flag, then _b_u_f_._t_i_m_e_._t_v___u_s_e_c is interpreted as a
              nanosecond value; otherwise it is interpreted as microseconds.

       AADDJJ__MMIICCRROO (since Linux 2.6.26)
              Select microsecond resolution.

       AADDJJ__NNAANNOO (since Linux 2.6.26)
              Select nanosecond resolution.  Only one of AADDJJ__MMIICCRROO and
              AADDJJ__NNAANNOO should be specified.

       AADDJJ__TTAAII (since Linux 2.6.26)
              Set TAI (Atomic International Time) offset from _b_u_f_._c_o_n_s_t_a_n_t.

              AADDJJ__TTAAII should not be used in conjunction with AADDJJ__TTIIMMEECCOONNSSTT,
              since the latter mode also employs the _b_u_f_._c_o_n_s_t_a_n_t field.

              For a complete explanation of TAI and the difference between TAI
              and UTC, see
       _B_I_P_M <http://www.bipm.org/en/bipm/tai/tai.html>

       AADDJJ__TTIICCKK
              Set tick value from _b_u_f_._t_i_c_k.

       Alternatively, _m_o_d_e_s can be specified as either of the following
       (multibit mask) values, in which case other bits should not be
       specified in _m_o_d_e_s:

       AADDJJ__OOFFFFSSEETT__SSIINNGGLLEESSHHOOTT
              Old-fashioned aaddjjttiimmee(): (gradually) adjust time by value
              specified in _b_u_f_._o_f_f_s_e_t, which specifies an adjustment in
              microseconds.

       AADDJJ__OOFFFFSSEETT__SSSS__RREEAADD (functional since Linux 2.6.28)
              Return (in _b_u_f_._o_f_f_s_e_t) the remaining amount of time to be
              adjusted after an earlier AADDJJ__OOFFFFSSEETT__SSIINNGGLLEESSHHOOTT operation.  This
              feature was added in Linux 2.6.24, but did not work correctly
              until Linux 2.6.28.

       Ordinary users are restricted to a value of either 0 or
       AADDJJ__OOFFFFSSEETT__SSSS__RREEAADD for _m_o_d_e_s.  Only the superuser may set any
       parameters.

       The _b_u_f_._s_t_a_t_u_s field is a bit mask that is used to set and/or retrieve
       status bits associated with the NTP implementation.  Some bits in the
       mask are both readable and settable, while others are read-only.

       SSTTAA__PPLLLL (read-write)
              Enable phase-locked loop (PLL) updates via AADDJJ__OOFFFFSSEETT.

       SSTTAA__PPPPSSFFRREEQQ (read-write)
              Enable PPS (pulse-per-second) frequency discipline.

       SSTTAA__PPPPSSTTIIMMEE (read-write)
              Enable PPS time discipline.

       SSTTAA__FFLLLL (read-write)
              Select frequency-locked loop (FLL) mode.

       SSTTAA__IINNSS (read-write)
              Insert a leap second after the last second of the UTC day, thus
              extending the last minute of the day by one second.  Leap-second
              insertion will occur each day, so long as this flag remains set.

       SSTTAA__DDEELL (read-write)
              Delete a leap second at the last second of the UTC day.  Leap
              second deletion will occur each day, so long as this flag
              remains set.

       SSTTAA__UUNNSSYYNNCC (read-write)
              Clock unsynchronized.

       SSTTAA__FFRREEQQHHOOLLDD (read-write)
              Hold frequency.  Normally adjustments made via AADDJJ__OOFFFFSSEETT result
              in dampened frequency adjustments also being made.  So a single
              call corrects the current offset, but as offsets in the same
              direction are made repeatedly, the small frequency adjustments
              will accumulate to fix the long-term skew.

              This flag prevents the small frequency adjustment from being
              made when correcting for an AADDJJ__OOFFFFSSEETT value.

       SSTTAA__PPPPSSSSIIGGNNAALL (read-only)
              A valid PPS (pulse-per-second) signal is present.

       SSTTAA__PPPPSSJJIITTTTEERR (read-only)
              PPS signal jitter exceeded.

       SSTTAA__PPPPSSWWAANNDDEERR (read-only)
              PPS signal wander exceeded.

       SSTTAA__PPPPSSEERRRROORR (read-only)
              PPS signal calibration error.

       SSTTAA__CCLLOOCCKKEERRRR (read-only)
              Clock hardware fault.

       SSTTAA__NNAANNOO (read-only; since Linux 2.6.26)
              Resolution (0 = microsecond, 1 = nanoseconds).  Set via
              AADDJJ__NNAANNOO, cleared via AADDJJ__MMIICCRROO.

       SSTTAA__MMOODDEE (since Linux 2.6.26)
              Mode (0 = Phase Locked Loop, 1 = Frequency Locked Loop).

       SSTTAA__CCLLKK (read-only; since Linux 2.6.26)
              Clock source (0 = A, 1 = B); currently unused.

       Attempts to set read-only _s_t_a_t_u_s bits are silently ignored.

   nnttpp__aaddjjttiimmee (())
       The nnttpp__aaddjjttiimmee() library function (described in the NTP "Kernel
       Application Program API", KAPI) is a more portable interface for
       performing the same task as aaddjjttiimmeexx().  Other than the following
       points, it is identical to aaddjjttiimmee():

       *  The constants used in _m_o_d_e_s are prefixed with "MOD_" rather than
          "ADJ_", and have the same suffixes (thus, MMOODD__OOFFFFSSEETT, MMOODD__FFRREEQQUUEENNCCYY,
          and so on), other than the exceptions noted in the following points.

       *  MMOODD__CCLLKKAA is the synonym for AADDJJ__OOFFFFSSEETT__SSIINNGGLLEESSHHOOTT.

       *  MMOODD__CCLLKKBB is the synonym for AADDJJ__TTIICCKK.

       *  The is no synonym for AADDJJ__OOFFFFSSEETT__SSSS__RREEAADD, which is not described in
          the KAPI.

RREETTUURRNN VVAALLUUEE
       On success, aaddjjttiimmeexx() and nnttpp__aaddjjttiimmee() return the clock state; that
       is, one of the following values:

       TTIIMMEE__OOKK     Clock synchronized, no leap second adjustment pending.

       TTIIMMEE__IINNSS    Indicates that a leap second will be added at the end of
                   the UTC day.

       TTIIMMEE__DDEELL    Indicates that a leap second will be deleted at the end of
                   the UTC day.

       TTIIMMEE__OOOOPP    Insertion of a leap second is in progress.

       TTIIMMEE__WWAAIITT   A leap-second insertion or deletion has been completed.
                   This value will be returned until the next AADDJJ__SSTTAATTUUSS
                   operation clears the SSTTAA__IINNSS and SSTTAA__DDEELL flags.

       TTIIMMEE__EERRRROORR  The system clock is not synchronized to a reliable server.
                   This value is returned when any of the following holds
                   true:

                   *  Either SSTTAA__UUNNSSYYNNCC or SSTTAA__CCLLOOCCKKEERRRR is set.

                   *  SSTTAA__PPPPSSSSIIGGNNAALL is clear and either SSTTAA__PPPPSSFFRREEQQ or
                      SSTTAA__PPPPSSTTIIMMEE is set.

                   *  SSTTAA__PPPPSSTTIIMMEE and SSTTAA__PPPPSSJJIITTTTEERR are both set.

                   *  SSTTAA__PPPPSSFFRREEQQ is set and either SSTTAA__PPPPSSWWAANNDDEERR or
                      SSTTAA__PPPPSSJJIITTTTEERR is set.

                   The symbolic name TTIIMMEE__BBAADD is a synonym for TTIIMMEE__EERRRROORR,
                   provided for backward compatibility.

       Note that starting with Linux 3.4, the call operates asynchronously and
       the return value usually will not reflect a state change caused by the
       call itself.

       On failure, these calls return -1 and set _e_r_r_n_o.

EERRRROORRSS
       EEFFAAUULLTT _b_u_f does not point to writable memory.

       EEIINNVVAALL (kernels before Linux 2.6.26)
              An attempt was made to set _b_u_f_._f_r_e_q to a value outside the range
              (-33554432, +33554432).

       EEIINNVVAALL (kernels before Linux 2.6.26)
              An attempt was made to set _b_u_f_._o_f_f_s_e_t to a value outside the
              permitted range.  In kernels before Linux 2.0, the permitted
              range was (-131072, +131072).  From Linux 2.0 onwards, the
              permitted range was (-512000, +512000).

       EEIINNVVAALL An attempt was made to set _b_u_f_._s_t_a_t_u_s to a value other than
              those listed above.

       EEIINNVVAALL An attempt was made to set _b_u_f_._t_i_c_k to a value outside the range
              900000/HHZZ to 1100000/HHZZ, where HHZZ is the system timer interrupt
              frequency.

       EEPPEERRMM  _b_u_f_._m_o_d_e_s is neither 0 nor AADDJJ__OOFFFFSSEETT__SSSS__RREEAADD, and the caller
              does not have sufficient privilege.  Under Linux, the
              CCAAPP__SSYYSS__TTIIMMEE capability is required.

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +---------------+---------------+---------+
       |IInntteerrffaaccee      | AAttttrriibbuuttee     | VVaalluuee   |
       +---------------+---------------+---------+
       |ntp_adjtime () | Thread safety | MT-Safe |
       +---------------+---------------+---------+
CCOONNFFOORRMMIINNGG TTOO
       Neither of these interfaces is described in POSIX.1

       aaddjjttiimmeexx() is Linux-specific and should not be used in programs
       intended to be portable.

       The preferred API for the NTP daemon is nnttpp__aaddjjttiimmee().

NNOOTTEESS
       In struct _t_i_m_e_x, _f_r_e_q, _p_p_s_f_r_e_q, and _s_t_a_b_i_l are ppm (parts per million)
       with a 16-bit fractional part, which means that a value of 1 in one of
       those fields actually means 2^-16 ppm, and 2^16=65536 is 1 ppm.  This
       is the case for both input values (in the case of _f_r_e_q) and output
       values.

       The leap-second processing triggered by SSTTAA__IINNSS and SSTTAA__DDEELL is done by
       the kernel in timer context Thus, it will take one tick into the second
       for the leap second to be inserted or deleted.

SSEEEE AALLSSOO
       sseettttiimmeeooffddaayy(2), aaddjjttiimmee(3), nnttpp__ggeettttiimmee(3), ccaappaabbiilliittiieess(7), ttiimmee(7),
       aaddjjttiimmeexx(8), hhwwcclloocckk(8) NTP "Kernel Application Program Interface"
       <http://www.slac.stanford.edu/comp/unix/package/rtems/src/ssrlApps/ntpNanoclock/api.htm>

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2016-10-08                       ADJTIMEX(2)
