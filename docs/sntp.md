sntp(1)                                                                                         User Commands                                                                                         sntp(1)



NAME
       sntp - standard Simple Network Time Protocol client program

SYNOPSIS
       sntp [-flags] [-flag [value]] [--option-name[[=| ]value]] [ hostname-or-IP ...]


DESCRIPTION
       sntp  can  be  used as an SNTP client to query a NTP or SNTP server and either display the time or set the local system's time (given suitable privilege).  It can be run as an interactive command or
       from a cron job.  NTP (the Network Time Protocol) and SNTP (the Simple Network Time Protocol) are defined and described by RFC 5905.

       The default is to write the estimated correct local date and time (i.e. not UTC) to the standard output in a format like: '1996-10-15 20:17:25.123 (+0800) +4.567 +/- 0.089 [host] IP  sN'  where  the
       '(+0800)'  means that to get to UTC from the reported local time one must add 8 hours and 0 minutes, the '+4.567' indicates the local clock is 4.567 seconds behind the correct time (so 4.567 seconds
       must be added to the local clock to get it to be correct).  Note that the number of decimals printed for this value will change based on the reported precision of the server.   '+/-  0.089'  is  the
       reported synchronization distance (in seconds), which represents the maximum error due to all causes.  If the server does not report valid data needed to calculate the synchronization distance, this
       will be reported as '+/- ?'.  If the host is different from the IP, both will be displayed.  Otherwise, only the IP is displayed.  Finally, the stratum of the host is reported and the leap indicator
       is decoded and displayed.

OPTIONS
       -4, --ipv4
              Force IPv4 DNS name resolution.  This option must not appear in combination with any of the following options: ipv6.

              Force DNS resolution of the following host names on the command line to the IPv4 namespace.

       -6, --ipv6
              Force IPv6 DNS name resolution.  This option must not appear in combination with any of the following options: ipv4.

              Force DNS resolution of the following host names on the command line to the IPv6 namespace.

       -a auth-keynumber, --authentication=auth-keynumber
              Enable authentication with the key auth-keynumber.  This option takes an integer number as its argument.

              Enable  authentication  using the key specified in this option's argument.  The argument of this option is the keyid, a number specified in the keyfile as this key's identifier.  See the key-
              file option (-k) for more details.

       -b broadcast-address, --broadcast=broadcast-address
              Listen to the address specified for broadcast time sync.  This option may appear an unlimited number of times.

              If specified sntp will listen to the specified address for NTP broadcasts.  The default maximum wait time can (and probably should) be modified with -t.

       -c host-name, --concurrent=host-name
              Concurrently query all IPs returned for host-name.  This option may appear an unlimited number of times.

              Requests from an NTP "client" to a "server" should never be sent more rapidly than one every 2 seconds.  By default, any IPs returned as part of a DNS lookup are assumed to be  for  a  single
              instance of ntpd, and therefore sntp will send queries to these IPs one after another, with a 2-second gap in between each query.

              The -c or --concurrent flag says that any IPs returned for the DNS lookup of the supplied host-name are on different machines, so we can send concurrent queries.

       -d, --debug-level
              Increase debug verbosity level.  This option may appear an unlimited number of times.


       -D number, --set-debug-level=number
              Set the debug verbosity level.  This option may appear an unlimited number of times.  This option takes an integer number as its argument.


       -g milliseconds, --gap=milliseconds
              The gap (in milliseconds) between time requests.  This option takes an integer number as its argument.  The default milliseconds for this option is:
                   50

              Since we're only going to use the first valid response we get and there is benefit to specifying a good number of servers to query, separate the queries we send out by the specified number of
              milliseconds.

       -K file-name, --kod=file-name
              KoD history filename.  The default file-name for this option is:
                   /var/lib/ntp/kod

              Specifies the filename to be used for the persistent history of KoD responses received from servers.  If the file does not exist, a warning message will be displayed.  The file  will  not  be
              created.

       -k file-name, --keyfile=file-name
              Look in this file for the key specified with -a.

              This option specifies the keyfile.  sntp will search for the key specified with -a keyno in this file.  See ntp.keys(5) for more information.

       -l file-name, --logfile=file-name
              Log to specified logfile.

              This option causes the client to write log messages to the specified logfile.

       -M number, --steplimit=number
              Adjustments less than steplimit msec will be slewed.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  greater than or equal to 0

              If the time adjustment is less than steplimit milliseconds, slew the amount using adjtime(2).  Otherwise, step the correction using settimeofday(2).  The default value is 0, which means all
              adjustments will be stepped.  This is a feature, as different situations demand different values.

       -o number, --ntpversion=number
              Send int as our NTP protocol version.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 7
              The default number for this option is:
                   4

              When sending requests to a remote server, tell them we are running NTP protocol version ntpversion .

       -r, --usereservedport
              Use the NTP Reserved Port (port 123).

              Use port 123, which is reserved for NTP, for our network communications.

       -S, --step
              OK to 'step' the time with settimeofday(2).


       -s, --slew
              OK to 'slew' the time with adjtime(2).


       -t seconds, --timeout=seconds
              The number of seconds to wait for responses.  This option takes an integer number as its argument.  The default seconds for this option is:
                   5

              When waiting for a reply, sntp will wait the number of seconds specified before giving up.  The default should be more than enough for a unicast response.  If sntp is only waiting for a
              broadcast response a longer timeout is likely needed.

       --wait, - Fl -no-wait
              Wait for pending replies (if not setting the time).  The no-wait form will disable the option.  This option is enabled by default.

              If we are not setting the time, wait for all pending responses.

       -?, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -> [cfgfile], --save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The command will exit after updating the config file.

       -< cfgfile, --load-opts=cfgfile, --no-load-opts
              Load options from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts is handled early, out of order.

       --version [{v|c|n}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and `n' will print the full copyright notice.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s) and values from environment variables named:
         SNTP_<option-name> or SNTP
       The  environmental  presets  take  precedence  (are  processed  later than) the configuration files.  The homerc files are "$HOME", and ".".  If any of these are directories, then the file .ntprc is
       searched for within those directories.

USAGE
       sntp ntpserver.somewhere
              is the simplest use of this program and can be run as an unprivileged command to check the current time and error in the local clock.

       sntp -Ss -M 128 ntpserver.somewhere
              With suitable privilege, run as a command or from a cron(8) job, sntp -Ss -M 128 ntpserver.somewhere will request the time from the server, and if that server reports that it is  synchronized
              then if the offset adjustment is less than 128 milliseconds the correction will be slewed, and if the correction is more than 128 milliseconds the correction  will be stepped.

       sntp -S ntpserver.somewhere
              With  suitable  privilege, run as a command or from a cron(8) job, sntp -S ntpserver.somewhere will set (step) the local clock from a synchronized specified server, like the (deprecated) ntp-
              date(1), or rdate(8) commands.

ENVIRONMENT
       See OPTION PRESETS for configuration environment variables.

FILES
       See OPTION PRESETS for configuration files.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       66  (EX_NOINPUT)
              A specified configuration file could not be loaded.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

AUTHORS
       Johannes Maximilian Kuehn
       Harlan Stenn
       Dave Hart

COPYRIGHT
       Copyright (C) 1992-2017 The University of Delaware and Network Time Foundation all rights reserved.  This program is released under the terms of the NTP license, <http://ntp.org/license>.

BUGS
       Please send bug reports to: http://bugs.ntp.org, bugs@ntp.org

NOTES
       This manual page was AutoGen-erated from the sntp option definitions.



4.2.8p10                                                                                         21 Mar 2017                                                                                          sntp(1)
