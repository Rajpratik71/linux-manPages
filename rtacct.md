RTACCT(8)                               System Manager's Manual                              RTACCT(8)

NAME
       nstat, rtacct - network statistics tools.

SYNOPSIS
       Usage: nstat [ -h?vVzrnasd:t:jp ] [ PATTERN [ PATTERN ] ]
       Usage: rtacct [ -h?vVzrnasd:t: ] [ ListOfRealms ]

DESCRIPTION
       nstat and rtacct are simple tools to monitor kernel snmp counters and network interface statis‐
       tics.

OPTIONS
       -h, --help Print help

       -V, --version
              Print version

       -z, --zeros
              Dump zero counters too. By default they are not shown.

       -r, --reset
              Reset history.

       -n, --nooutput
              Do not display anything, only update history.

       -a, --ignore
              Dump absolute values of counters. The default is to calculate increments since the  pre‐
              vious use.

       -s, --noupdate
              Do  not update history, so that the next time you will see counters including values ac‐
              cumulated to the moment of this measurement too.

       -j, --json
              Display results in JSON format.

       -p, --pretty
              When combined with --json, pretty print the output.

       -d, --scan <INTERVAL>
              Run in daemon mode collecting statistics. <INTERVAL> is interval between measurements in
              seconds.

       -t, --interval <INTERVAL>
              Time interval to average rates. Default value is 60 seconds.

SEE ALSO
       lnstat(8)

                                             27 June, 2007                                   RTACCT(8)
