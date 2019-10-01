WDCTL(8)                                                                                    System Administration                                                                                    WDCTL(8)



NAME
       wdctl - show hardware watchdog status

SYNOPSIS
       wdctl [options] [device...]

DESCRIPTION
       Show hardware watchdog status.  The default device is /dev/watchdog.  If more than one device is specified then the output is separated by one blank line.

       Note that number of supported watchdog features is hardware specific.

OPTIONS
       -f, --flags list
              Print selected flags only.

       -F, --noflags
              Do not print information about flags.

       -n, --noheadings
              Do not print a header line for flags table.

       -I, --noident
              Do not print watchdog identity information.

       -T, --notimeouts
              Do not print watchdog timeouts.

       -s, --settimeout seconds
              Set the watchdog timeout in seconds.

       -o, --output list
              Define the output columns to use in table of watchdog flags.  If no output arrangement is specified, then a default set is used.  Use --help to get list of all supported columns.

       -O, --oneline
              Print all wanted information on one line in key="value" output format.

       -V, --version
              Output version information and exit.

       -r, --raw
              Use the raw output format.

       -x, --flags-only
              Same as -I -T.

       -h, --help
              Print a help text and exit.

AUTHORS
       Karel Zak ⟨kzak@redhat.com⟩
       Lennart Poettering ⟨lennart@poettering.net⟩

AVAILABILITY
       The wdctl command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                        June 2012                                                                                          WDCTL(8)
