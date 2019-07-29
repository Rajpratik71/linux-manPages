check_omp(8)                                                  System Manager's Manual                                                 check_omp(8)

NAME
       check_omp - OMP command line tool to support Nagios core for OpenVAS

SYNOPSIS
       check_omp OPTIONS

DESCRIPTION
       check_omp  is  a  OMP  command line tool specifically designed to support Nagios core in order to integrate vulnerability scan results into
       system monitoring.

       Basically, check_omp works the same like the "omp" command line tool.

OPTIONS
       -H, --host=HOST
              Connect to OpenVAS Manager on host HOST.

       -p, --port=PORT
              Connect to OpenVAS Manager on port PORT.

       -u, --username=USER
              Use the username USER to access the OpenVAS Manager.

       -w, --password=PASSWORD
              Use the password PASSWORD to access the OpenVAS Manager. If the password is not set as parameter,  it  will  be  requested  interac‐
              tively.

       -O, --ping
              Ping the manager.

       -t, --timout=SECONDS
              Wait SECONDS for response (0 disables timeout).

       -n, --name=NAME
              Use NAME as the name for the newly created task.

       -T, --task=TASK
              Report status of task TASK.

       -F, --host-filter=IP
              Report last report status of host IP.

       --overrides=N
              Include overrides (N: 0=no, 1=yes).

       -d, --details
              Include connection details in output.

       -l, --report-link
              Include URL of report in output.

       --dfn  Include DFN-CERT IDs on vulnerabilities in output.

       --oid  Include OIDs of NVTs finding vulnerabilities in output.

       --descr
              Include descriptions of NVTs finding vulnerabilities in output.

       --showlog
              Include log messages in output.

       --scanend
              Include timestamp of scan end in output.

       --autofp=N
              Trust vendor security updates for automatic false positive filtering (0=No, 1=full match, 2=partial).

       -e, --empty-as-unknown
              Respond with UNKNOWN on empty results.

       --status
              Report status of task.

       -A, --use-asset-management
              Request host status via Asset Management.

       --trend
              Report status by trend (default).

       --last-report
              Report status by last report.

       -V, --version
              Print version.

       -v, --verbose
              Verbose messages (WARNING: may reveal passwords).

       --Werror
              Turn status UNKNOWN into status CRITICIAL.

       -?, --help
              Show help.

EXAMPLES
       omp --username foobar --trend

       Connect to the OpenVAS Manager as user foobar and ask for trend.

SEE ALSO
       openvassd(8) gsad(8) openvasmd(8) omp(8)

MORE INFORMATION ABOUT THE OPENVAS PROJECT
       The  canonical  places  where  you  will  find  more  information  about  the  OpenVAS project are: http://www.openvas.org/ (Official site)
       http://wald.intevation.org/projects/openvas/ (Development Platform)

COPYRIGHT
       The check_omp command line client is released under the GNU GPL, version 2, or, at your option, any later version.

Manuals                                                                User                                                           check_omp(8)
