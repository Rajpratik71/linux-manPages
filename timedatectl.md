TIMEDATECTL(1)                                timedatectl                               TIMEDATECTL(1)

NAME
       timedatectl - Control the system time and date

SYNOPSIS
       timedatectl [OPTIONS...] {COMMAND}

DESCRIPTION
       timedatectl may be used to query and change the system clock and its settings.

       Use systemd-firstboot(1) to initialize the system time zone for mounted (but not booted) system
       images.

       timedatectl may be used to show the current status of systemd-timesyncd.service(8).

OPTIONS
       The following options are understood:

       --no-ask-password
           Do not query the user for authentication for privileged operations.

       --adjust-system-clock
           If set-local-rtc is invoked and this option is passed, the system clock is synchronized
           from the RTC again, taking the new setting into account. Otherwise, the RTC is synchronized
           from the system clock.

       --monitor
           If timesync-status is invoked and this option is passed, then timedatectl monitors the
           status of systemd-timesyncd.service(8) and updates the outputs. Use Ctrl+C to terminate the
           monitoring.

       -a, --all
           When showing properties of systemd-timesyncd.service(8), show all properties regardless of
           whether they are set or not.

       -p, --property=
           When showing properties of systemd-timesyncd.service(8), limit display to certain
           properties as specified as argument. If not specified, all set properties are shown. The
           argument should be a property name, such as "ServerName". If specified more than once, all
           properties with the specified names are shown.

       --value
           When printing properties with show-timesync, only print the value, and skip the property
           name and "=".

       -H, --host=
           Execute the operation remotely. Specify a hostname, or a username and hostname separated by
           "@", to connect to. The hostname may optionally be suffixed by a port ssh is listening on,
           seperated by ":", and then a container name, separated by "/", which connects directly to a
           specific container on the specified host. This will use SSH to talk to the remote machine
           manager instance. Container names may be enumerated with machinectl -H HOST. Put IPv6
           addresses in brackets.

       -M, --machine=
           Execute operation on a local container. Specify a container name to connect to.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       --no-pager
           Do not pipe output into a pager.

COMMANDS
       The following commands are understood:

       status
           Show current settings of the system clock and RTC, including whether network time
           synchronization through systemd-timesyncd.service is active. Even if it is inactive, a
           different service might still synchronize the clock. If no command is specified, this is
           the implied default.

       show
           Show the same information as status, but in machine readable form. This command is intended
           to be used whenever computer-parsable output is required. Use status if you are looking for
           formatted human-readable output.

           By default, empty properties are suppressed. Use --all to show those too. To select
           specific properties to show, use --property=.

       set-time [TIME]
           Set the system clock to the specified time. This will also update the RTC time accordingly.
           The time may be specified in the format "2012-10-30 18:17:16".

       set-timezone [TIMEZONE]
           Set the system time zone to the specified value. Available timezones can be listed with
           list-timezones. If the RTC is configured to be in the local time, this will also update the
           RTC time. This call will alter the /etc/localtime symlink. See localtime(5) for more
           information.

       list-timezones
           List available time zones, one per line. Entries from the list can be set as the system
           timezone with set-timezone.

       set-local-rtc [BOOL]
           Takes a boolean argument. If "0", the system is configured to maintain the RTC in universal
           time. If "1", it will maintain the RTC in local time instead. Note that maintaining the RTC
           in the local timezone is not fully supported and will create various problems with time
           zone changes and daylight saving adjustments. If at all possible, keep the RTC in UTC mode.
           Note that invoking this will also synchronize the RTC from the system clock, unless
           --adjust-system-clock is passed (see above). This command will change the 3rd line of
           /etc/adjtime, as documented in hwclock(8).

       set-ntp [BOOL]
           Takes a boolean argument. Controls whether network time synchronization is active and
           enabled (if available). If the argument is true, this enables and starts the first existed
           service listed in the environment variable $SYSTEMD_TIMEDATED_NTP_SERVICES of
           systemd-timedated.service. If the argument is false, then this disables and stops the all
           services listed in $SYSTEMD_TIMEDATED_NTP_SERVICES.

   systemd-timesyncd Commands
       The following commands are specific to systemd-timesyncd.service(8).

       timesync-status
           Show current status of systemd-timesyncd.service(8). If --monitor is specified, then this
           will monitor the status updates.

       show-timesync
           Show the same information as timesync-status, but in machine readable form. This command is
           intended to be used whenever computer-parsable output is required. Use timesync-status if
           you are looking for formatted human-readable output.

           By default, empty properties are suppressed. Use --all to show those too. To select
           specific properties to show, use --property=.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

ENVIRONMENT
       $SYSTEMD_PAGER
           Pager to use when --no-pager is not given; overrides $PAGER. If neither $SYSTEMD_PAGER nor
           $PAGER are set, a set of well-known pager implementations are tried in turn, including
           less(1) and more(1), until one is found. If no pager implementation is discovered no pager
           is invoked. Setting this environment variable to an empty string or the value "cat" is
           equivalent to passing --no-pager.

       $SYSTEMD_LESS
           Override the options passed to less (by default "FRSXMK").

           If the value of $SYSTEMD_LESS does not include "K", and the pager that is invoked is less,
           Ctrl+C will be ignored by the executable. This allows less to handle Ctrl+C itself.

       $SYSTEMD_LESSCHARSET
           Override the charset passed to less (by default "utf-8", if the invoking terminal is
           determined to be UTF-8 compatible).

EXAMPLES
       Show current settings:

           $ timedatectl
                          Local time: Thu 2017-09-21 16:08:56 CEST
                      Universal time: Thu 2017-09-21 14:08:56 UTC
                            RTC time: Thu 2017-09-21 14:08:56
                           Time zone: Europe/Warsaw (CEST, +0200)
           System clock synchronized: yes
                         NTP service: active
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

       Show current status of systemd-timesyncd.service(8):

           $ timedatectl timesync-status
                  Server: 216.239.38.15 (time4.google.com)
           Poll interval: 1min 4s (min: 32s; max 34min 8s)
                    Leap: normal
                 Version: 4
                 Stratum: 1
               Reference: GPS
               Precision: 1us (-20)
           Root distance: 335us (max: 5s)
                  Offset: +316us
                   Delay: 349us
                  Jitter: 0
            Packet count: 1
               Frequency: -8.802ppm

SEE ALSO
       systemd(1), hwclock(8), date(1), localtime(5), systemctl(1), systemd-timedated.service(8),
       systemd-timesyncd.service(8), systemd-firstboot(1)

systemd 242                                                                             TIMEDATECTL(1)
