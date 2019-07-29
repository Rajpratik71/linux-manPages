logcheck-test(1)                                              General Commands Manual                                             logcheck-test(1)

NAME
       logcheck-test - test new logcheck rules easily

SYNOPSIS
       logcheck-test [-q|-i] [-a|-s|-l FILE] [-e] [-P PREFIX] [-S SUFFIX] RULE
       logcheck-test [-q|-i] [-a|-s|-l FILE] -r RULEFILE

DESCRIPTION
       logcheck-test  parses  a log file for matching lines specified by a single rule or a rule file. If using a single RULE you can set a PREFIX
       and a SUFFIX to write new rules easily.

OPTIONS
       -h, --help
              Show usage information

       -a, --auth.log
              Parse /var/log/auth.log for matching lines

       -s, --syslog
              Parse /var/log/syslog for matching lines

       -l, --log-file FILE
              Parse FILE for matching lines

       -i, --invert-match
              Show line that don't match the RULE or the RULEFILE

       -q, --quiet
              Suppress rule summary at the end of output

       -e, --surround-rule
              Surround RULE with standard prefix and suffix:

              ^[[:alpha:]]{3} [ :[:digit:]]{11} [._[:alnum:]-]+ RULE$

       -P, --append-prefix PREFIX
              Append PREFIX to rule prefix. Option can be given multiple times

       -S, --prepend-suffix SUFFIX
              Prepend SUFFIX to rule suffix. Option can be given multiple times

       -r, --rule-file RULEFILE
              Use file RULEFILE for rule input

EXAMPLES
       With logcheck-test you can easily write and test new rules.

       Test a single rule against /var/log/syslog:
              logcheck-test -s "RULE"

       Test a single rule against ~/log, surround the rule with standard prefix and suffix and append "kernel " to prefix:
              logcheck-test -l ~/log -e -P "kernel " "RULE"

       Test the rules in rulefiles/linux/ignore.d.server/kernel against ~/log:
              logcheck-test -l ~/log -r rulefiles/linux/ignore.d.server/kernel

       Test which lines the rules in rulefiles/linux/ignore.d.server/kernel doesn't match:
              logcheck-test -l ~/log -r rulefiles/linux/ignore.d.server/kernel -i

EXIT STATUS
       On successful matching logcheck-test will complete with exit code 0. An exit code of 1 indicates no successful matching.

       An exit code greater then 1 indicates an error occurred. Textual errors are written to the standard error stream.

SEE ALSO
       logcheck(8)

AUTHOR
       logcheck is developed by Debian logcheck Team at alioth: http://alioth.debian.org/projects/logcheck/. This manual was written by Hannes von
       Haugwitz <hannes@vonhaugwitz.com>.

                                                                   Feb 19, 2010                                                   logcheck-test(1)
