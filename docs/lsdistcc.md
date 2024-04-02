lsdistcc(1)                            General Commands Manual                            lsdistcc(1)

NAME
       lsdistcc - simple distcc server discovery

SYNOPSIS
       lsdistcc [OPTIONS] [FORMAT]

       lsdistcc [OPTIONS] host1 ...

DESCRIPTION
       lsdistcc autodetects listening distcc servers either by looking in DNS for hosts named accord‐
       ing to a given FORMAT, or by checking the host names given on the command line.

       Hosts are considered good servers based solely on whether  their  name  fits  the  format  and
       whether  they  are  listening  on the right port (and optionally whether they respond when you
       send them a compile job).

       Scans for hosts named according to FORMAT (default is "distcc%d"; see printf(3)) and  starting
       from 1, so hosts such as distcc1, distcc2, and so on.  Stops after 7 seconds or the first host
       name that does not resolve.  Prints the names of all such servers listening on distcc's port.

       If a list of host names is given in the command line, lsdistcc will only check those hosts.

OPTIONS
       --help Displays summary instructions

       -l     Output latency in milliseconds after each hostname (not including DNS latency)

       -n     Print IP address rather than name

       -x     Append ,down to down hosts in host list

       -tTIMEOUT
              Set number of seconds to stop searching after [7]

       -hHTIMEOUT
              Set number of milliseconds before retrying gethostbyname [500]

       -cCTIMEOUT
              Set number of milliseconds before giving up on connect [900] (0 to inhibit connect)

       -kKTIMEOUT
              Set number of milliseconds before giving up on compile [1500] (0 to inhibit compile)

       -mBITS Set number of bits of address that must match first host found [0]

       -oOVERLAP
              Set number of extra DNS requests to send [1]

       -gDNSGAP
              Set number of missing DNS entries to tolerate [0]

       -rPORT Port to connect to [3632]

       -PPROTOCOL
              Protocol version to use (1-3) [1]

       -pCOMPILER
              Name of compiler to use [none]

       -d     Append DNS domain name to format

       -v     Verbose

EXAMPLES
       Scan for servers named distcc1, distcc2, ...   that  provide  a  compiler  named  gcc-4.6  and
       include their latencies in the output:

              $ lsdistcc -l -pgcc-4.6

       Scan for a compiler named gcc-4.6 on the servers hosta, somehost, hostx, and hosty:

              $ lsdistcc -pgcc-4.6 hosta somehost hostx hosty

       To use the program in a build script, add the lines:

              DISTCC_HOSTS=`lsdistcc`
              export DISTCC_HOSTS

       before the line that invokes make.  Or, in a Makefile, add the line:

              export DISTCC_HOSTS = $(shell lsdistcc)

EXIT STATUS
       The exit status is 0 if any servers were found, and 1 otherwise.

       Uses  'for  i=1... sprintf(format, i)' to construct names of servers, stops after 7 seconds or
       at second server that doesn't resolve, prints the names  of  all  such  servers  listening  on
       distcc's port.  Default format is distcc%d.

SEE ALSO
       distcc(1), distccd(1), printf(3)

       http://code.google.com/p/distcc/

AUTHOR
       lsdistcc was written by Dan Kegel, Dongmin Zhang, and Manos Renieris.

       This manual page was written by Daniel Hartwig for the Debian project.

                                              1 May 2012                                  lsdistcc(1)
