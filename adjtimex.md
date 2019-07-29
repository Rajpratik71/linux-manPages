ADJTIMEX(8)                                                                                System Manager's Manual                                                                                ADJTIMEX(8)



NAME
       adjtimex - display or set the kernel time variables

SYNOPSIS
       adjtimex [option]...

DESCRIPTION
       This program gives you raw access to the kernel time variables.  Anyone may print out the time variables, but only the superuser may change them.

       Your computer has two clocks - the "hardware clock" that runs all the time, and the system clock that runs only while the computer is on.  Normally, "hwclock --hctosys" should be run at startup to
       initialize the system clock.  The system clock has much better precision (approximately 1 usec), but the hardware clock probably has better long-term stability.  There are three basic strategies for
       managing these clocks.

       For a machine connected to the Internet, or equipped with a precision oscillator or radio clock, the best way is to regulate the system clock with ntpd(8).  The kernel will automatically update the
       hardware clock every eleven minutes.

       In addition, hwclock(8) can be used to approximately correct for a constant drift in the hardware clock.  In this case, "hwclock --adjust" is run occasionally. hwclock notes how long it has been
       since the last adjustment, and nudges the hardware clock forward or back by the appropriate amount.  The user needs to set the time with "hwclock --set" several times over the course of a few days
       so hwclock can estimate the drift rate.  During that time, ntpd should not be running, or else hwclock will conclude the hardware clock does not drift at all.  After you have run "hwclock --set" for
       the last time, it's okay to start ntpd.  Then, "hwclock --systohc" should be run when the machine is shut down.  (To see why, suppose the machine runs for a week with ntpd, is shut down for a day,
       is restarted, and "hwclock --adjust" is run by a startup script.  It should only correct for one day's worth of drift.  However, it has no way of knowing that ntpd has been adjusting the hardware
       clock, so it bases its adjustment on the last time hwclock was run.)

       For a standalone or intermittently connected machine, where it's not possible to run ntpd, you may use adjtimex instead to correct the system clock for systematic drift.

       There are several ways to estimate the drift rate.  If your computer can be connected to the net, you might run ntpd for at least several hours and run "adjtimex --print" to learn what values of
       tick and freq it settled on.  Alternately, you could estimate values using as a reference the CMOS clock (see the --compare and --adjust switches), another host (see --host and --review), or some
       other source of time (see --watch and --review).  You could then add a line to rc.local invoking adjtimex, or configure /etc/init.d/adjtimex or /etc/default/adjtimex, to set those parameters each
       time you reboot.

OPTIONS
       Options may be introduced by either - or --, and unique abbreviations may be used.

       Here is a summary of the options, grouped by type.  Explanations follow.

       Get/Set Kernel Time Parameters
              -p --print -t --tick val -f newfreq --frequency newfreq -o val --offset val -s adjustment --singleshot adjustment -S status --status status -m val -R --reset --maxerror val -e val --esterror
              val -T val --timeconstant val -a[count] --adjust[=count]

       Estimate Systematic Drifts
              -c[count] --compare[=count] -i tim --interval tim -l file --logfile file -h timeserver --host timeserver -w --watch -r[file] --review[=file] -u --utc -d --directisa -n --nointerrupt

       Informative Output
              --help -v --version -V --verbose

       -p, --print
              Print the current values of the kernel time variables.  NOTE: The time is "raw", and may be off by up to one timer tick (10 msec).  "status" gives the value of the time_status variable in the
              kernel.  For Linux 1.0 and 1.2 kernels, the value is as follows:
                    0   clock is synchronized (so the kernel should
                        periodically set the CMOS clock to match the
                        system clock)
                    1   inserting a leap second at midnight
                    2   deleting a leap second at midnight
                    3   leap second in progress
                    4   leap second has occurred
                    5   clock not externally synchronized (so the
                        kernel should leave the CMOS clock alone)
              For Linux kernels 2.0 through 2.6, the value is a sum of these:
                    1   PLL updates enabled
                    2   PPS freq discipline enabled
                    4   PPS time discipline enabled
                    8   frequency-lock mode enabled
                   16   inserting leap second
                   32   deleting leap second
                   64   clock unsynchronized
                  128   holding frequency
                  256   PPS signal present
                  512   PPS signal jitter exceeded
                 1024   PPS signal wander exceeded
                 2048   PPS signal calibration error
                 4096   clock hardware fault

       -t val, --tick val
              Set the number of microseconds that should be added to the system time for each kernel tick interrupt.  For a kernel with USER_HZ=100, there are supposed to be 100 ticks per second, so val
              should be close to 10000.  Increasing val by 1 speeds up the system clock by about 100 ppm, or 8.64 sec/day.  tick must be in the range 900000/USER_HZ...1100000/USER_HZ.  If val is rejected
              by the kernel, adjtimex will determine the acceptable range through trial and error and print it.  (After completing the search, it will restore the original value.)

       -f newfreq, --frequency newfreq
              Set the system clock frequency offset to newfreq.  newfreq can be negative or positive, and gives a much finer adjustment than the --tick switch.  When USER_HZ=100, the value is scaled such
              that newfreq = 65536 speeds up the system clock by about 1 ppm, or .0864 sec/day.  Thus, all of these are about the same:
                   --tick  9995 --frequency  32768000
                   --tick 10000 --frequency   6553600
                   --tick 10001 --frequency         0
                   --tick 10002 --frequency  -6553600
                   --tick 10005 --frequency -32768000
              To see the acceptable range for newfreq, use --print and look at "tolerance", or try an illegal value (e.g. --tick 0).

       -s adj, --singleshot adj
              Slew the system clock by adj usec.  (Its rate is changed temporarily by about 1 part in 2000.)

       -o adj, --offset adj
              Add a time offset of adj usec.  The kernel code adjusts the time gradually by adj, notes how long it has been since the last time offset, and then adjusts the frequency offset to correct for
              the apparent drift.  adj must be in the range -512000...512000.

       -S status, --status status
              Set kernel system clock status register to value status. Look here above at the --print switch section for the meaning of status, depending on your kernel.

       -R, --reset
              Reset clock status after setting a clock parameter.  For early Linux kernels, using the adjtimex(2) system call to set any time parameter the kernel think the clock is synchronized with an
              external time source, so it sets the kernel variable time_status to TIME_OK.  Thereafter, at 11 minute intervals, it will adjust the CMOS clock to match.  We prevent this "eleven minute mode"
              by setting the clock, because that has the side effect of resetting time_status to TIME_BAD.  We try not to actually change the clock setting.  Kernel versions 2.0.40 and later apparently
              don't need this.  If your kernel does require it, use this option with: -t -T -t -e -m -f -s -o -c -r.

       -m val, --maxerror val
              Set maximum error (usec).

       -e val, --esterror val
              Set estimated error (usec).  The maximum and estimated error are not used by the kernel.  They are merely made available to user processes via the adjtimex(2) system call.

       -T val, --timeconstant val
              Set phase locked loop (PLL) time constant.  val determines the bandwidth or "stiffness" of the PLL.  The effective PLL time constant will be a multiple of (2^val).  For room-temperature
              quartz oscillators, David Mills recommends the value 2, which corresponds to a PLL time constant of about 900 sec and a maximum update interval of about 64 sec.  The maximum update interval
              scales directly with the time constant, so that at the maximum time constant of 6, the update interval can be as large as 1024 sec.

              Values of val between zero and 2 give quick convergence; values between 2 and 6 can be used to reduce network load, but at a modest cost in accuracy.

       -c[count], --compare[=count]
              Periodically compare the system clock with the CMOS clock.  After the first two calls, print values for tick and frequency offset that would bring the system clock into approximate agreement
              with the CMOS clock.  CMOS clock readings are adjusted for systematic drift using using the correction in /etc/adjtime — see hwclock(8).  The interval between comparisons is 10 seconds,
              unless changed by the --interval switch.  The optional argument is the number of comparisons.  (If the argument is supplied, the "=" is required.)  If the CMOS clock and the system clock
              differ by more than six minutes, adjtimex will try shifting the time from the CMOS clock by some multiple of one hour, up to plus or minus 13 hours in all.  This should allow correct
              operation, including logging, if the --utc switch was used when the CMOS clock is set to local time (or vice-versa), or if summer time has started or stopped since the CMOS clock was last
              set.

       -a[count], --adjust[=count]
              By itself, same as --compare, except the recommended values are actually installed after every third comparison.  With --review, the tick and frequency are set to the least-squares estimates.
              (In the latter case, any count value is ignored.)

       --force-adjust
              Override the sanity check that prevents changing the clock rate by more than 500 ppm.

       -i tim, --interval tim
              Set the interval in seconds between clock comparisons for the --compare and --adjust options.

       -u, --utc
              The CMOS clock is set to UTC (universal time) rather than local time.

       -d, --directisa
              To read the CMOS clock accurately, adjtimex usually accesses the clock via the /dev/rtc device driver of the kernel, and makes use of its CMOS update-ended interrupt to detect the beginning
              of seconds. It will also try /dev/rtc0 (for udev), /dev/misc/rtc (for the obsolete devfs) and possibly others.  When the /dev/rtc driver is absent, or when the interrupt is not available,
              adjtimex can sometimes automatically fallback to a direct access method. This method detects the start of seconds by polling the update-in-progress (UIP) flag of the CMOS clock. You can force
              this direct access to the CMOS chip with the --directisa switch.

              Note that the /dev/rtc interrupt method is more accurate, less sensible to perturbations due to system load, cleaner, cheaper, and is generally better than the direct access method. It is
              advisable to not use the --directisa switch, unless the CMOS chip or the motherboard don't properly provide the necessary interrupt.

       -n, --nointerrupt
              Force immediate use of busywait access method, without first waiting for the interrupt timeout.

       -l[file], --log[=file]
              Save the current values of the system and CMOS clocks, and optionally a reference time, to file (default /var/log/clocks.log).  The reference time is taken from a network timeserver (see the
              --host switch) or supplied by the user (see the --watch switch).

       -h timeserver, --host timeserver
              Use ntpdate to query the given timeserver for the current time.  This will fail if timeserver is not running a Network Time Protocol (NTP) server, or if that server is not synchronized.
              Implies --log.

       -w, --watch
              Ask for a keypress when the user knows the time, then ask what that time was, and its approximate accuracy.  Implies --log.

       -r[file], --review[=file]
              Review the clock log file (default /var/log/clocks.log) and estimate, if possible, the rates of the CMOS and system clocks.  Calculate least-squares rates using all suitable log entries.
              Suggest corrections to adjust for systematic drift.  With --adjust, the frequency and tick are set to the suggested values.  (The CMOS clock correction is not changed.)

       -V, --verbose
              Increase verbosity.

       --help Print the program options.

       -v, --version
              Print the program version.

EXAMPLES
       If your system clock gained 8 seconds in 24 hours, you could set the tick to 9999, and then it would lose 0.64 seconds a day (that is, 1 tick unit = 8.64 seconds per day).  To correct the rest of
       the error, you could set the frequency offset to (2^16)*0.64/.0864 = 485452.  Thus, putting the following in rc.local would approximately correct the system clock:

            adjtimex  --tick 9999  --freq 485452

NOTES
       adjtimex adjusts only the system clock — the one that runs while the computer is powered up.  To set or regulate the CMOS clock, see hwclock(8).

AUTHORS
       Steven S. Dick <ssd at nevets.oau.org>, Jim Van Zandt <jrv at comcast.net>.

SEE ALSO
       date(1L), gettimeofday(2), settimeofday(2), hwclock(8), ntpdate(8), ntpd(8), /usr/src/linux/include/linux/timex.h, /usr/src/linux/include/linux/sched.h, /usr/src/linux/kernel/time.c,
       /usr/src/linux/kernel/sched.c



                                                                                                March 11, 2009                                                                                    ADJTIMEX(8)
