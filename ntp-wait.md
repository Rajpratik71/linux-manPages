ntp-wait(1)                                                        User Commands                                                       ntp-wait(1)

NAME
       ntp-wait - Wait for ntpd to stabilize the system clock

SYNOPSIS
       ntp-wait [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       ntp-wait will send at most num-tries queries to ntpd(8), sleeping for secs-between-tries after each status return that says ntpd(8) has not
       yet produced a synchronized and stable system clock.

       ntp-wait will do this quietly, unless the -v flag is provided.  This can be useful at boot time, to delay the  boot  sequence  until  after
       ntpd -g has set the time.

OPTIONS
       -n number, --tries=number
              Number of times to check ntpd.  This option takes an integer number as its argument.  The default number for this option is:
                   100

                      The maximum number of times we will check ntpd to see if
                      it has been able to synchronize and stabilize the system clock.

       -s secs-between-tries, --sleep=secs-between-tries
              How  long  to  sleep  between  tries.  This option takes an integer number as its argument.  The default secs-between-tries for this
              option is:
                   6

                      We will sleep for secs-between-tries after each query
                      of ntpd that returns "the time is not yet stable".

       -v, --verbose
              Be verbose.

                      By default, ntp-wait is silent.
                      With this option, ntp-wait will provide status information.

       -?, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright  information  and
              `n' will print the full copyright notice.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

AUTHORS
       Harlan Stenn

NOTES
       This document corresponds to version 4.2.8p9 of NTP.

       This manual page was AutoGen-erated from the ntp-wait option definitions.

ntp (4.2.8p9)                                                       21 Nov 2016                                                        ntp-wait(1)
