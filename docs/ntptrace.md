ntptrace(1)                                                                                     User Commands                                                                                     ntptrace(1)



NAME
       ntptrace - Trace peers of an NTP server

SYNOPSIS
       ntptrace [-flags] [-flag [value]] [--option-name[[=| ]value]] [host]


DESCRIPTION
       ntptrace  is  a  perl  script  that  uses  the ntpq utility program to follow the chain of NTP servers from a given host back to the primary time source. For ntptrace to work properly, each of these
       servers must implement the NTP Control and Monitoring Protocol specified in RFC 1305 and enable NTP Mode 6 packets.

       If given no arguments, ntptrace starts with localhost. Here is an example of the output from ntptrace:

           % ntptrace localhost: stratum 4, offset 0.0019529, synch distance 0.144135
           server2ozo.com: stratum 2, offset 0.0124263, synch distance 0.115784 usndh.edu:
           stratum 1, offset 0.0019298, synch distance 0.011993, refid 'WWVB'

       On each line, the fields are (left to right): the host name, the host stratum, the time offset between that host and the local host (as measured by ntptrace; this is why it is not  always  zero  for
       "localhost"), the host synchronization distance, and (only for stratum-1 servers) the reference clock ID. All times are given in seconds. Note that the stratum is the server hop count to the primary
       source, while the synchronization distance is the estimated error relative to the primary source. These terms are precisely defined in RFC-1305.

OPTIONS
       -n, --numeric
              Print IP addresses instead of hostnames.

              Output hosts as dotted-quad numeric format rather than converting to the canonical host names.

       -m number, --max-hosts=number
              Maximum number of peers to trace.  This option takes an integer number as its argument.  The default number for this option is:
                   99

              This option has not been fully documented.

       -r string, --host=string
              Single remote host.  The default string for this option is:
                   127.0.0.1

              This option has not been fully documented.

       -?, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and `n' will print the full copyright notice.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

NOTES
       This manual page was AutoGen-erated from the ntptrace option definitions.



ntp (4.2.8p10)                                                                                   21 Mar 2017                                                                                      ntptrace(1)
