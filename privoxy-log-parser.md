PRIVOXY-LOG-PARSER(1)                                   User Contributed Perl Documentation                                  PRIVOXY-LOG-PARSER(1)

NAME
       privoxy-log-parser - A parser and syntax-highlighter for Privoxy log messages

SYNOPSIS
       privoxy-log-parser [--html-output] [--no-msecs] [--no-syntax-higlighting] [--statistics] [--shorten-thread-ids]
       [--show-ineffective-filters] [--url-statistics-threshold] [--version]

DESCRIPTION
       privoxy-log-parser reads Privoxy log messages and

       - syntax-highlights recognized lines,

       - reformats some of them for easier comprehension,

       - filters out less useful messages, and

       - (in some cases) calculates additional information,
         like the compression ratio or how a filter affected
         the content size.

       With privoxy-log-parser you should be able to increase Privoxy's log level without getting confused by the resulting amount of output. For
       example for "debug 64" privoxy-log-parser will (by default) only show messages that affect the content. If a filter doesn't cause any hits,
       privoxy-log-parser will hide the "filter foo caused 0 hits" message.

OPTIONS
       [--host-statistics-threshold] Only show the request count for a host if it's above or equal to the given threshold. If the threshold is 0,
       host statistics are disabled.

       [--html-output] Use HTML and CSS for the syntax highlighting. If this option is omitted, ANSI escape sequences are used unless
       --no-syntax-highlighting is active.  This option is only intended to make embedding log excerpts in web pages easier.  It does not escape
       any input!

       [--no-msecs] Don't expect millisecond resolution

       [--no-syntax-highlighting] Disable syntax-highlighting. Useful when the filtered output is piped into less in which case the ANSI control
       codes don't work, or if the terminal itself doesn't support the control codes.

       [--shorten-thread-ids] Shorten the thread ids to a three-digit decimal number.  Note that the mapping from thread ids to shortened ids is
       created at run-time and thus varies with the input.

       [--show-ineffective-filters] Don't suppress log lines for filters that didn't modify the content.

       [--show-complete-request-distribution] Show the complete client request distribution in the --statistics output. Without this option only
       the ten most common numbers are shown.

       [--statistics] Gather various statistics instead of syntax highlighting log messages. This is an experimental feature, if the results look
       wrong they very well might be. Also note that the results are pretty much guaranteed to be incorrect if Privoxy and Privoxy-Log-Parser
       aren't in sync.

       [--strict-checks] When generating statistics, look more careful at the input data and abort if it is unexpected, even if it doesn't affect
       the results. Significantly slows the parsing down and is not expected to catch any problems that matter.  When highlighting, print warnings
       in case of unknown messages which can't be properly highlighted.

       [--unbreak-lines-only] Tries to fix lines that got messed up by a broken or interestingly configured mail client and thus are no longer
       recognized properly.  Only fixes some breakage, but may be good enough or at least better than nothing.  Doesn't do anything else, so you
       probably want to pipe the output into privoxy-log-parser again.

       [--url-statistics-threshold] Only show the request count for a resource if it's above or equal to the given threshold. If the threshold is
       0, URL statistics are disabled.

       [--version] Print version and exit.

EXAMPLES
       To monitor a log file:

       tail -F /usr/jails/privoxy-jail/var/log/privoxy/privoxy.log | privoxy-log-parser

       Replace '-F' with '-f' if your tail implementation lacks '-F' support or if the log won't get rotated anyway. The log file location depends
       on your system (Doh!).

       To monitor Privoxy without having it write to a log file:

       privoxy --no-daemon /usr/jails/privoxy-jail/usr/local/etc/privoxy/config 2>&1 | privoxy-log-parser

       Again, the config file location depends on your system. Output redirection depends on your shell, the above works with bourne shells.

       To read a processed Privoxy log file from top to bottom, letting the content scroll by slightly faster than you can read:

       privoxy-log-parser < /usr/jails/privoxy-jail/var/log/privoxy/privoxy.log

       This is probably only useful to fill screens in the background of haxor movies.

CAVEATS
       Syntax highlighting with ANSI escape sequences will look strange if your background color isn't black.

       Some messages aren't recognized yet and will not be fully highlighted.

       privoxy-log-parser is developed with Privoxy 3.0.7 or later in mind, using earlier Privoxy versions will probably result in an increased
       amount of unrecognized log lines.

       Privoxy's log files tend to be rather large. If you use HTML highlighting some browsers can't handle them, get confused and will eventually
       crash because of segmentation faults or unexpected exceptions. This is a problem in the browser and not privoxy-log-parser's fault.

BUGS
       Many settings can't be controlled through command line options yet.

SEE ALSO
       privoxy(1)

AUTHOR
       Fabian Keil <fk@fabiankeil.de>

perl v5.22.1                                                        2017-01-12                                               PRIVOXY-LOG-PARSER(1)
