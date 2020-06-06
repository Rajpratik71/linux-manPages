GTESTER(1)                                   User Commands                                  GTESTER(1)

NAME
       gtester - test running utility

SYNOPSIS
       gtester [OPTION...] [testprogram]

DESCRIPTION
       gtester is a utility to run unit tests that have been written using the GLib test framework.

       Since GLib 2.62, gtester-report is deprecated. Use TAP for reporting test results instead, and
       feed it to the test harness provided by your build system.

       When called with the -o option, gtester writes an XML report of the test results, which can be
       converted into HTML using the gtester-report utility.

OPTIONS
       -h, --help
           print help and exit

       -v, --version
           print version information and exit

       --g-fatal-warnings
           make warnings fatal

       -k, --keep-going
           continue running after tests failed

       -l
           list paths of available test cases

       -m=MODE
           run test cases in MODE, which can be one of:

           perf
               run performance tests

           slow, thorough
               run slow tests, or repeat non-deterministic tests more often

           quick
               do not run slow or performance tests, or do extra repeats of non-deterministic tests
               (default)

           undefined
               run test cases that deliberately provoke checks or assertion failures, if implemented
               (default)

           no-undefined
               do not run test cases that deliberately provoke checks or assertion failures

       -p=TESTPATH
           only run test cases matching TESTPATH

       -s=TESTPATH
           skip test cases matching TESTPATH

       --seed=SEEDSTRING
           run all test cases with random number seed SEEDSTRING

       -o=LOGFILE
           write the test log to LOGFILE

       -q, --quiet
           suppress per test binary output

       --verbose
           report success per testcase

SEE ALSO
       gtester-report(1)

GLib                                                                                        GTESTER(1)
