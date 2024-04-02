FAIL2BAN-REGEX(1)                                                  User Commands                                                 FAIL2BAN-REGEX(1)

NAME
       fail2ban-regex - test Fail2ban "failregex" option

SYNOPSIS
       fail2ban-regex [OPTIONS] <LOG> <REGEX> [IGNOREREGEX]

DESCRIPTION
       Fail2Ban  reads log file that contains password failure report and bans the corresponding IP addresses using firewall rules.

       This tools can test regular expressions for "fail2ban".

   LOG:
       string a string representing a log line

       filename
              path to a log file (/var/log/auth.log)

       "systemd-journal"
              search systemd journal (systemd-python required)

   REGEX:
       string a string representing a 'failregex'

       filename
              path to a filter file (filter.d/sshd.conf)

   IGNOREREGEX:
       string a string representing an 'ignoreregex'

       filename
              path to a filter file (filter.d/sshd.conf)

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -d DATEPATTERN, --datepattern=DATEPATTERN
              set custom pattern used to match date/times

       -e ENCODING, --encoding=ENCODING
              File encoding. Default: system locale

       -L MAXLINES, --maxlines=MAXLINES
              maxlines for multi-line regex

       -m JOURNALMATCH, --journalmatch=JOURNALMATCH
              journalctl style matches overriding filter file.  "systemd-journal" only

       -l LOG_LEVEL, --log-level=LOG_LEVEL
              Log level for the Fail2Ban logger to use

       -v, --verbose
              Be verbose in output

       -D, --debuggex
              Produce debuggex.com urls for debugging there

       --print-no-missed
              Do not print any missed lines

       --print-no-ignored
              Do not print any ignored lines

       --print-all-matched
              Print all matched lines

       --print-all-missed
              Print all missed lines, no matter how many

       --print-all-ignored
              Print all ignored lines, no matter how many

       -t, --log-traceback
              Enrich log-messages with compressed tracebacks

       --full-traceback
              Either to make the tracebacks full, not compressed (as by default)

AUTHOR
       Written by Cyril Jaquier <cyril.jaquier@fail2ban.org>.  Many contributions by Yaroslav O. Halchenko and Steven Hiscocks.

REPORTING BUGS
       Report bugs to https://github.com/fail2ban/fail2ban/issues

COPYRIGHT
       Copyright © 2004-2008 Cyril Jaquier, 2008- Fail2Ban Contributors
       Copyright of modifications held by their respective authors.  Licensed under the GNU General Public License v2 (GPL).

SEE ALSO
       fail2ban-client(1) fail2ban-server(1)

fail2ban-regex 0.9.3                                                 July 2015                                                   FAIL2BAN-REGEX(1)
