calc_tickadj(1calc_tickadjman)                                     User Commands                                    calc_tickadj(1calc_tickadjman)

NAME
       calc_tickadj - Calculates optimal value for tick given ntp drift file.

SYNOPSIS
       calc_tickadj [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       The  calc_tickadj  script uses provided ntp drift file to generate optimal tick value. Generally, ntpd can do better job if the drift value
       is the smallest possible number.

       The example output of
           $ ./calc_tickadj
           81.699 (drift)
           9999 usec; 9999779 nsec
           $ cat /etc/ntp/drift
           -23.159

       means the following. If tick on that box is 10,000, by making the value 9999 we'll shift the box from its current drift  of  -23.159  to  a
       drift of 81.699, and in doing so we'll speed the clock up a little every second instead of slowing the clock down a little.

       If 'tick' on that box is 10,000,000 then by setting it to 9999779 the drift value will be somewhere around 0.0.

       calc_tickadj  tries to determine the the tick value by using tickadj program from ntp package. If this doesn't work you can specify current
       tick manually on command line.

OPTIONS
       -d string, --drift-file=string
              Ntp drift file to use.  The default string for this option is:
                   /etc/ntp/drift

              Use the specified drift file for calculations

       -t number, --tick=number
              Tick value of this host.  This option takes an integer number as its argument.

              The current tick which to adjustment will be calculated

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

NOTES
       This manual page was AutoGen-erated from the calc_tickadj option definitions.

ntp (4.2.8p9)                                                       21 Nov 2016                                     calc_tickadj(1calc_tickadjman)
