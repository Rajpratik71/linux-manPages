RTCWAKE(8)                                                                                  System Administration                                                                                  RTCWAKE(8)



NAME
       rtcwake - enter a system sleep state until specified wakeup time

SYNOPSIS
       rtcwake [options] [-d device] [-m standby_mode] {-t time_t|-s seconds}

DESCRIPTION
       This program is used to enter a system sleep state until specified wakeup time.

       This  uses  cross-platform  Linux  interfaces to enter a system sleep state, and leave it no later than a specified time.  It uses any RTC framework driver that supports standard driver model wakeup
       flags.

       This is normally used like the old apmsleep utility, to wake from a suspend state like ACPI S1 (standby) or S3 (suspend-to-RAM).  Most platforms can implement those without analogues of  BIOS,  APM,
       or ACPI.

       On some systems, this can also be used like nvram-wakeup, waking from states like ACPI S4 (suspend to disk).  Not all systems have persistent media that are appropriate for such suspend modes.

   Options
       -v | --verbose
              Be verbose.

       -h | --help
              Display a short help message that shows how to use the program.

       -V | --version
              Displays version information and exists.

       -n | --dry-run
              This option does everything but actually setup alarm, suspend system or wait for the alarm.

       -A | --adjfile file
              Specifies an alternative path to the adjust file.

       -a | --auto
              Reads the clock mode (whether the hardware clock is set to UTC or local time) from /etc/adjtime. That's the location where the hwclock(8) stores that information. This is the default.

       -l | --local
              Assumes that the hardware clock is set to local time, regardless of the contents of /etc/adjtime.

       -u | --utc
              Assumes that the hardware clock is set to UTC (Universal Time Coordinated), regardless of the contents of /etc/adjtime.

       -d device | --device device
              Uses device instead of rtc0 as realtime clock. This option is only relevant if your system has more than one RTC. You may specify rtc1, rtc2, ... here.

       -s seconds | --seconds seconds
              Sets the wakeup time to seconds in future from now.

       -t time_t | --time time_t
              Sets the wakeup time to the absolute time time_t. time_t is the time in seconds since 1970-01-01, 00:00 UTC. Use the date(1) tool to convert between human-readable time and time_t.

       -m mode | --mode mode
              Use standby state mode. Valid values are:

              standby
                     ACPI state S1. This state offers minimal, though real, power savings, while providing a very low-latency transition back to a working system. This is the default mode.

              mem    ACPI  state  S3  (Suspend-to-RAM).  This  state  offers significant power savings as everything in the system is put into a low-power state, except for memory, which is placed in self-
                     refresh mode to retain its contents.

              freeze The processes are frozen, all the devices are suspended and all the processors idles. This state is a general state that does not need any platform specific support, but it saves  less
                     power than susepnd to RAM, because the system is still in a running state. (since Linux 3.9)

              disk   ACPI  state S4 (Suspend-to-disk). This state offers the greatest power savings, and can be used even in the absence of low-level platform support for power management. This state oper‐
                     ates similarly to Suspend-to-RAM, but includes a final step of writing memory contents to disk.

              off    ACPI state S5 (Poweroff). This is done by calling '/sbin/shutdown'.  Not officially supported by ACPI, but usually working.

              no     Don't suspend. The rtcwake command sets RTC wakeup time only.

              on     Don't suspend, but read RTC device until alarm time appears. This mode is useful for debugging.

              disable
                     Disable previously set alarm.

              show   Print alarm information in format: "alarm: off|on  <time>".  The time is in ctime() output format, e.g. "alarm: on  Tue Nov 16 04:48:45 2010".

NOTES
       Some PC systems can't currently exit sleep states such as mem using only the kernel code accessed by this driver.  They need help from userspace code to make the framebuffer work again.

HISTORY
       The program was posted several times on LKML and other lists before appearing in kernel commit message for Linux 2.6 in the GIT commit 87ac84f42a7a580d0dd72ae31d6a5eb4bfe04c6d.

AVAILABILITY
       The rtcwake command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.

AUTHOR
       The program was written by David Brownell <dbrownell@users.sourceforge.net> and improved by Bernhard Walle <bwalle@suse.de>.

COPYRIGHT
       This is free software.  You may redistribute copies of it  under  the  terms of  the  GNU General  Public  License <http://www.gnu.org/licenses/gpl.html>.  There is NO WARRANTY, to the  extent  per‐
       mitted by law.

SEE ALSO
       hwclock(8), date(1)



util-linux                                                                                        July 2007                                                                                        RTCWAKE(8)
