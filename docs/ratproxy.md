RATPROXY(1)                                                        User Commands                                                       RATPROXY(1)

NAME
       ratproxy - a passive web application security assessment tool

SYNOPSIS
       ratproxy [-w logfile] [-v logdir] [-p port] [-d domain] [-P host:port] [-xtifkgmjscael2XCr]

DESCRIPTION
       Ratproxy  is  a  semi-automated,  largely passive web application security audit tool. It is meant to complement active crawlers and manual
       proxies more commonly used for this task, and is optimized specifically for an accurate and sensitive detection, and automatic  annotation,
       of potential problems and security-relevant design patterns based on the observation of existing, user-initiated traffic in complex web 2.0
       environments.

OPTIONS
       -w logfile    - write results to a specified file (default: stdout)

       -v logdir     - write HTTP traces to a specified directory (default: none)

       -p port       - listen on a custom TCP port (default: 8080)

       -d domain     - analyze requests to specified domains only (default: all)

       -P host:port  - use upstream proxy for all requests (format host:port)

       -r            - accept remote connections (default: 127.0.0.1 only)

       -l            - use response length, not checksum, for identity check

       -2            - perform two, not one, page identity check

       -e            - perform pedantic caching headers checks

       -x            - log all XSS candidates

       -t            - log all directory traversal candidates

       -i            - log all PNG files served inline

       -f            - log all Flash applications for analysis (add -v to decompile)

       -s            - log all POST requests for analysis

       -c            - log all cookie setting URLs for analysis

       -g            - perform XSRF token checks on all GET requests

       -j            - report on risky Javascript constructions

       -m            - log all active content referenced across domains

       -X            - disruptively validate XSRF, XSS protections

       -C            - try to auto-correct persistent side effects of -X

       -k            - flag HTTP requests as bad (for HTTPS-only applications)

       -a            - indiscriminately report all visited URLs

EXAMPLES
       Example settings suitable for most tests:

       1) Low verbosity  : -v <outdir> -w <outfile> -d <domain> -lfscm

       2) High verbosity : -v <outdir> -w <outfile> -d <domain> -lextifscgjm

       3) Active testing : -v <outdir> -w <outfile> -d <domain> -XClfscm

       Multiple -d options are allowed. Consult the documentation for more.

AUTHOR
       ratproxy is written and maintained by Michal Zalewski <lcamtuf@google.com>

       This manual page was generated via help2man by Iustin Pop <iusty@k1024.org> for the Debian project (but may be used by others).

SEE ALSO
       ratproxy-report(1)

ratproxy 1.56-beta                                                  April 2009                                                         RATPROXY(1)
