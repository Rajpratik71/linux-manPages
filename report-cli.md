REPORT-CLI(1)                                                                                  LIBREPORT MANUAL                                                                                 REPORT-CLI(1)



NAME
       report-cli - Work with ABRT problem directories from command line.

SYNOPSIS
       report-cli [-vsp] -L[PREFIX] [PROBLEM_DIR]

       report-cli [-vsp] -e EVENT PROBLEM_DIR

       report-cli [-vsp] -a[y] PROBLEM_DIR

       report-cli [-vsp] -c[y] PROBLEM_DIR

       report-cli [-vsp] -r[y|o|d] PROBLEM_DIR

DESCRIPTION
       report-cli is a command line tool that manages application crashes and other problems caught by abrtd daemon, or created by other programs using libreport. It enables access to, manipulation of
       problem data, and reporting.

OPTIONS
       -L[PREFIX]
           List possible events [which start with PREFIX]

       -e EVENT
           Run EVENT on PROBLEM_DIR

       -a, --analyze
           Run analyze event(s) on PROBLEM_DIR

       -c, --collect
           Run collect event(s) on PROBLEM_DIR

       -r, --report
           Analyze, collect and report problem data in PROBLEM_DIR

       -d, --delete
           Remove PROBLEM_DIR after reporting

       -y, --always
           Noninteractive: don’t ask questions, assume positive answer to all of them

       -o, --report-only
           With -r: do not run analyzers, run only reporters

       -v, --verbose
           Be verbose

       -s
           Log to syslog

       -p
           Add program names to log

       -V, --version
           Display version and exit

AUTHORS
       ·   ABRT team



LIBREPORT 2.1.11.1                                                                                08/12/2019                                                                                    REPORT-CLI(1)
