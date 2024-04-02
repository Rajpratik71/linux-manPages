LOGCONV.PL(1)                                                                              General Commands Manual                                                                              LOGCONV.PL(1)



NAME
       logconv.pl - analyzes Directory Server access log files

SYNOPSIS
       logconv.pl [-h] [-d <rootDN>] [-s <size limit>] [-v] [-V] [-S <start time>] [-E <end time>] [-T <min etime>] [-efcibaltnxgjuU] [ access log ... ... ]

DESCRIPTION
       Analyzes Directory Server access log files for specific information defined on the command line

OPTIONS
       A summary of options is included below:

       -h, --help
              help/usage

       -d, --rootDN <Directory Managers DN>
              DEFAULT -> cn=directory manager

       -D, --data <Location for temporary data files>
              DEFAULT -> /tmp
              TIP -> If there is enough RAM, a RAM disk can be used instead:

                     mkdir /dev/shm/logconv, and use this directory for the "-D" value.

       -s, --sizeLimit <Number of results to return per category>
              DEFAULT -> 20

       -X, --excludeIP <IP address to exclude from connection stats>
              E.g. Load balancers

       -v, --version show version of tool
              Print version of the tool

       -S, --startTime <time to begin analyzing logfile from>
              Time to begin analyzing logfile from E.g. [28/Mar/2002:13:14:22 -0800]

       -E, --endTime <time to stop analyzing logfile>
              Time to stop analyzing logfile from E.g. [28/Mar/2002:13:24:62 -0800]

       -T, --minEtime <minimum etime to report unindexed searches>
              The minimum etime that is required to record and report on an unindexed search.  Default is zero.

       -M, --reportFileMins <CSV output file>
              This option creates a CSV report for spreadsheets.

       -m, --reportFileSecs <CSV output file>
              This option creates a CSV report for spreadsheets.

       -B, --bind <ALL | ANONYMOUS | Bind DN >
              This generates a report based on either ALL bind dn's, anonymous binds, or a specific DN.

       -V, --verbose <enable verbose output - includes all stats listed below except U>
              Verbose output

       -[efcibaltnxgjuU]
              e Error Code stats
              f Failed Login Stats
              c Connection Code Stats
              i Client Stats
              b Bind Stats
              a Search Base Stats
              l Search Filter Stats
              t Etime Stats
              n Nentries Stats
              x Extended Operations
              r Most Requested Attribute Stats
              g Abandoned Operation Stats
              j Recommendations
              u Unindexed Search Stats (very detailed)
              y Connection Latency Stats
              p Open Connection ID Stats
              U Unindexed Search Summary

USAGE
       Examples:

              logconv.pl -s 10 -V access

              logconv.pl -d "cn=directory manager" /var/log/dirsrv/slapd-host/access*

              logconv.pl -s 50 -ibgju access*

              logconv.pl -S "[28/Mar/2002:13:14:22 -0800]" -E "[28/Mar/2002:13:50:05 -0800]" -e access

AUTHOR
       logconv.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug-in distribution.



                                                                                                March 31, 2017                                                                                  LOGCONV.PL(1)
