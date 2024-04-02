FAIL2BAN-TESTCASES(1)                                              User Commands                                             FAIL2BAN-TESTCASES(1)

NAME
       fail2ban-testcases - run Fail2Ban unit-tests

SYNOPSIS
       fail2ban-testcases [OPTIONS] [regexps]

DESCRIPTION
       Script to run Fail2Ban tests battery

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -l LOG_LEVEL, --log-level=LOG_LEVEL
              Log level for the logger to use during running tests

       -n, --no-network
              Do not run tests that require the network

       -t, --log-traceback
              Enrich log-messages with compressed tracebacks

       --full-traceback
              Either to make the tracebacks full, not compressed (as by default)

SEE ALSO
       fail2ban-client(1) fail2ban-server(1) fail2ban-regex(1)

fail2ban-testcases 0.9.3                                             July 2015                                               FAIL2BAN-TESTCASES(1)
