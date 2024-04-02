
RASDAEMON(8)                                                                         RAS memory controller admin utility                                                                         RASDAEMON(8)



NAME
       rasdaemon - RAS daemon to log the RAS events.


SYNOPSIS
       rasdaemon [OPTION]...


DESCRIPTION
       The rasdaemon program is a daemon which monitors the platform Reliablity, Availability and Serviceability (RAS) reports from the Linux kernel trace events. These trace events are logged in /sys/ker‐
       nel/debug/tracing, reporting them via syslog/journald.


OPTIONS
       --usage
              Display a brief usage message and exit.

       --help Display a help message and exit.

       --disable
              Disable RAS tracing events and exit.

       --enable
              Enable RAS tracing events and exit.

       --foreground
              Executes in foreground, printing the events at console. Useful for testing it, and to be used by systemd or Unix System V respan.  If not specified, the program runs in daemon mode.

       --record
              Record RAS events via Sqlite3. The Sqlite3 database has the benefit of keeping a persistent record of the RAS events. This feature is used with the ras-mc-ctl utility. Note that rasdaemon may
              be compiled without this feature.

       --version
              Print the program version and exit.


SEE ALSO
       ras-mc-ctl(8)




                                                                                                                                                                                                 RASDAEMON(8)
