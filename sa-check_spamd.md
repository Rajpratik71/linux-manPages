SA-CHECK_SPAMD.RAW(1)                                   User Contributed Perl Documentation                                  SA-CHECK_SPAMD.RAW(1)

NAME
       sa-check_spamd - spamd monitoring script for use with Nagios, etc.

SYNOPSIS
       sa-check_spamd [options]

       Options:

        -c secs, --critical=secs          Critical ping response threshold
        -h, -?, --help                    Print usage message
        -H hostname, --hostname=hostname  Hostname of spamd service to ping
        -p port, --port=port              Port of spamd service to ping
        --socketpath=path                 Connect to given UNIX domain socket
        -t secs, --timeout=secs           Max time to wait for a ping response
        -v, --verbose                     Verbose debug output
        -V, --version                     Output version info
        -w secs, --warning=secs           Warning ping response threshold

DESCRIPTION
       The purpose of this program is to provide a tool to monitor the status of "spamd" server processes.  spamd is the daemonized version of the
       spamassassin executable, both provided in the SpamAssassin distribution.

       This program is designed for use, as a plugin, with the Nagios service monitoring software available from http://nagios.org.  It might be
       compatible with other service monitoring packages.  It is also useful as a command line utility or as a component of a custom shell script.

OPTIONS
       Options of the long form can be shortened as long as the remain unambiguous (i.e. --host can be used instead of --hostname).

       -c secs, --critical=secs
           Critical ping response threshold in seconds.  If a spamd ping response takes longer than the value specified (in seconds) the program
           will exit with a value of 2 to indicate the critical status.

           This value must be at least as long as the value specified for warning and less than the value specified for timeout.

       -h, -?, --help
           Prints this usage message and exits.

       -H hostname, --hostname=hostname
           The hostname, or IP address, of the spamd service to ping.  By default the hostname localhost is used.  If --socketpath is set this
           value will be ignored.

       -p port, --port=port
           The port of the spamd service to ping.  By default port 783 (the spamd default port number) is used.  If --socketpath is set this value
           will be ignored.

       --socketpath=path
           Connect to given UNIX domain socket.  Use instead of a hostname and TCP port.  When set, any hostname and TCP port specified will be
           ignored.

       -t secs, --timeout=secs
           The maximum time to wait for a ping response.  Once exceeded the program will exit with a value of 2 to indicate the critical status.
           The default timeout value is 45 seconds.  The timeout must be no less than 1 second.

           This value must be greater than the values specified for both the critical and warning values.

       -v, --verbose
           Display verbose debug output on STDOUT.

       -V, --version
           Display version info on STDOUT.

       -w secs, --warning=secs
           Warning ping response threshold in seconds.  If a spamd ping response takes longer than the value specified (in seconds), and does not
           exceed the critical threshold value, the program will exit with a value of 1 to indicate the warning staus.

           This value must be no longer than the value specified for critical and less than the value specified for timeout.

EXIT CODES
       The program will indicate the status of the spamd process being monitored by exiting with one of these values:

       0   OK: A spamd ping response was received within all threshold times.

       1   WARNING: A spamd ping response exceeded the warning threshold but not the critical threshold.

       2   CRITICAL: A spamd ping response exceeded either the critical threshold or the timeout value.

       3   UNKNOWN: An error, probably caused by a missing dependency or an invalid configuration parameter being supplied, occurred in the
           sa-check_spamd program.

SEE ALSO
       spamc(1) spamd(1) spamassassin(1)

PREREQUISITES
       "Mail::SpamAssassin" version 3.1.1 or higher (3.1.6 or higher recommended)

AUTHOR
       Daryl C. W. O'Shea, DOS Technologies <spamassassin@dostech.ca>

COPYRIGHT AND LICENSE
       sa-check_spamd is distributed under the Apache License, Version 2.0, as described in the file "LICENSE" included with the Apache
       SpamAssassin distribution and available at http://www.apache.org/licenses/LICENSE-2.0

       Copyright (C) 2015 The Apache Software Foundation

perl v5.22.1                                                        2018-11-06                                               SA-CHECK_SPAMD.RAW(1)
