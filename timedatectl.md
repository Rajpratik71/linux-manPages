TIMEDATECTL(1)                                                                                 timedatectl                                                                                 TIMEDATECTL(1)

NAME
       timedatectl - Control the system time and date

SYNOPSIS
       timedatectl [OPTIONS...] {COMMAND}

DESCRIPTION
       timedatectl may be used to query and change the system clock and its settings.

       Use systemd-firstboot(1) to initialize the system time zone for mounted (but not booted) system images.

OPTIONS
       The following options are understood:

       --no-ask-password
           Do not query the user for authentication for privileged operations.

       --adjust-system-clock
           If set-local-rtc is invoked and this option is passed, the system clock is synchronized from the RTC again, taking the new setting into account. Otherwise, the RTC is synchronized from the
           system clock.

       -H, --host=
           Execute the operation remotely. Specify a hostname, or a username and hostname separated by "@", to connect to. The hostname may optionally be suffixed by a container name, separated by ":",
           which connects directly to a specific container on the specified host. This will use SSH to talk to the remote machine manager instance. Container names may be enumerated with machinectl -H
           HOST.

       -M, --machine=
           Execute operation on a local container. Specify a container name to connect to.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       --no-pager
           Do not pipe output into a pager.

       The following commands are understood:

       status
           Show current settings of the system clock and RTC, including whether network time synchronization is on. Note that whether network time synchronization is on simply reflects whether the
           systemd-timesyncd.service unit is enabled. Even if this command shows the status as off, a different service might still synchronize the clock with the network.

       set-time [TIME]
           Set the system clock to the specified time. This will also update the RTC time accordingly. The time may be specified in the format "2012-10-30 18:17:16".

       set-timezone [TIMEZONE]
           Set the system time zone to the specified value. Available timezones can be listed with list-timezones. If the RTC is configured to be in the local time, this will also update the RTC time.
           This call will alter the /etc/localtime symlink. See localtime(5) for more information.

       list-timezones
           List available time zones, one per line. Entries from the list can be set as the system timezone with set-timezone.

       set-local-rtc [BOOL]
           Takes a boolean argument. If "0", the system is configured to maintain the RTC in universal time. If "1", it will maintain the RTC in local time instead. Note that maintaining the RTC in the
           local timezone is not fully supported and will create various problems with time zone changes and daylight saving adjustments. If at all possible, keep the RTC in UTC mode. Note that
           invoking this will also synchronize the RTC from the system clock, unless --adjust-system-clock is passed (see above). This command will change the 3rd line of /etc/adjtime, as documented in
           hwclock(8).

       set-ntp [BOOL]
           Takes a boolean argument. Controls whether network time synchronization is active and enabled (if available). This enables and starts, or disables and stops the systemd-timesyncd.service
           unit. It does not affect the state of any other, unrelated network time synchronization services that might be installed on the system. This command is hence mostly equivalent to: systemctl
           enable --now systemd-timesyncd.service and systemctl disable --now systemd-timesyncd.service, but is protected by a different access policy.

           Note that even if time synchronization is turned off with this command, another unrelated system service might still synchronize the clock with the network. Also note that, strictly
           speaking, systemd-timesyncd.service does more than just network time synchronization, as it ensures a monotonic clock on systems without RTC even if no network is available. See systemd-
           timesyncd.service(8) for details about this.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

ENVIRONMENT
       $SYSTEMD_PAGER
           Pager to use when --no-pager is not given; overrides $PAGER. Setting this to an empty string or the value "cat" is equivalent to passing --no-pager.

       $SYSTEMD_LESS
           Override the default options passed to less ("FRSXMK").

EXAMPLES
       Show current settings:

           $ timedatectl
                 Local time: Di 2015-04-07 16:26:56 CEST
             Universal time: Di 2015-04-07 14:26:56 UTC
                   RTC time: Di 2015-04-07 14:26:56
                  Time zone: Europe/Berlin (CEST, +0200)
            Network time on: yes
           NTP synchronized: yes
            RTC in local TZ: no

       Enable network time synchronization:

           $ timedatectl set-ntp true
           ==== AUTHENTICATING FOR org.freedesktop.timedate1.set-ntp ===
           Authentication is required to control whether network time synchronization shall be enabled.
           Authenticating as: user
           Password: ********
           ==== AUTHENTICATION COMPLETE ===

           $ systemctl status systemd-timesyncd.service
           ● systemd-timesyncd.service - Network Time Synchronization
              Loaded: loaded (/lib/systemd/system/systemd-timesyncd.service; enabled)
              Active: active (running) since Mo 2015-03-30 14:20:38 CEST; 5s ago
                Docs: man:systemd-timesyncd.service(8)
            Main PID: 595 (systemd-timesyn)
              Status: "Using Time Server 216.239.38.15:123 (time4.google.com)."
              CGroup: /system.slice/systemd-timesyncd.service
                      └─595 /lib/systemd/systemd-timesyncd
           ...

SEE ALSO
       systemd(1), hwclock(8), date(1), localtime(5), systemctl(1), systemd-timedated.service(8), systemd-timesyncd.service(8), systemd-firstboot(1)

systemd 229                                                                                                                                                                                TIMEDATECTL(1)
