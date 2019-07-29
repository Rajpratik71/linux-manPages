RATPROXY-REPORT(1)                                                 User Commands                                                RATPROXY-REPORT(1)

NAME
       ratproxy-report - report generator for the ratproxy tool

SYNOPSIS
       ratproxy-report ratproxy.log

DESCRIPTION
       This  is  essentially  a prettyprinter for ratproxy logs. It removes dupes, sorts entries within groups, then sorts groups base don highest
       priority within the group, and produces some nice HTML with form replay capabilities.

OPTIONS
       ratproxy-report takes no options, only the name of the ratproxy-generated log file, and displays the generated HTML file on  standard  out‐
       put.

ENVIRONMENT
       The environment variable RAT_URLPREFIX can be used to specify an absolute URL prefix for the trace/decompile links, if available. Otherwise
       they will be referenced with relative links. If the generated report will be stored in a directory different from the parameter -v to  rat‐
       proxy, then you should set this variable to that directory.

EXAMPLES
           $ ratproxy-report ratproxy.log >report.html

AUTHOR
       ratproxy is written and maintained by Michal Zalewski <lcamtuf@google.com>

       This manual page was generated via help2man by Iustin Pop <iusty@k1024.org> for the Debian project (but may be used by others).

SEE ALSO
       ratproxy(1)

ratproxy 1.56-beta                                                  April 2009                                                  RATPROXY-REPORT(1)
