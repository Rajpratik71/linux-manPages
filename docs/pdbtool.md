PDBTOOL(1)                                                    The pdbtool manual page                                                   PDBTOOL(1)

NAME
       pdbtool - An application to test and convert syslog-ng pattern database rules

SYNOPSIS
       pdbtool [command] [options]

DESCRIPTION
       This manual page is only an abstract; for the complete documentation of syslog-ng and pdbtool, see The syslog-ng Administrator Guide[1].

       The syslog-ng application can match the contents of the log messages to a database of predefined message patterns (also called patterndb).
       By comparing the messages to the known patterns, syslog-ng is able to identify the exact type of the messages, tag the messages, and sort
       them into message classes. The message classes can be used to classify the type of the event described in the log message. The
       functionality of the pattern database is similar to that of the logcheck project, but the syslog-ng approach is faster, scales better, and
       is much easier to maintain compared to the regular expressions of logcheck.

       The pdbtool application is a utility that can be used to:

       ·   test message patterns;

       ·   convert an older pattern database to the latest database format;

       ·   merge pattern databases into a single file;

       ·   dump the RADIX tree built from the pattern database (or a part of it) to explore how the pattern matching works.

THE DUMP COMMAND
       dump [options]

       Display the RADIX tree built from the patterns. This shows how are the patterns represented in syslog-ng and it might also help to track
       down pattern-matching problems. The dump utility can dump the tree used for matching the PROGRAM or the MSG parts.

       --pdb or -p
           Name of the pattern database file to use.

       --program or -P
           Displays the RADIX tree built from the patterns belonging to the $PROGRAM application.

       --program-tree or -T
           Display the $PROGRAM tree.

       Example and sample output:

           pdbtool dump -p patterndb.xml  -P 'sshd'

           'p'
              'assword for'
                @QSTRING:@
                  'from'
                   @QSTRING:@
                     'port '
                       @NUMBER:@ rule_id='fc49054e-75fd-11dd-9bba-001e6806451b'
                         ' ssh' rule_id='fc55cf86-75fd-11dd-9bba-001e6806451b'
                            '2' rule_id='fc4b7982-75fd-11dd-9bba-001e6806451b'
               'ublickey for'
                 @QSTRING:@
                   'from'
                    @QSTRING:@
                      'port '
                        @NUMBER:@ rule_id='fc4d377c-75fd-11dd-9bba-001e6806451b'
                          ' ssh' rule_id='fc5441ac-75fd-11dd-9bba-001e6806451b'
                             '2' rule_id='fc44a9fe-75fd-11dd-9bba-001e6806451b'

THE MATCH COMMAND
       match [options]

       Use the match command to test the rules in a pattern database. The command tries to match the specified message against the patterns of the
       database, evaluates the parsers of the pattern, and also displays which part of the message was parsed successfully. The command returns
       with a 0 (success) or 1 (no match) return code and displays the following information:

       ·   the class assigned to the message (that is, system, violation, and so on),

       ·   the ID of the rule that matched the message, and

       ·   the values of the parsers (if there were parsers in the matching pattern).

       The match command has the following options:

       --color-out  or -c
           Color the terminal output to highlight the part of the message that was successfully parsed.

       --debug-csv or -C
           Print the debugging information returned by the --debug-pattern option as comma-separated values.

       --debug-pattern or -D
           Print debugging information about the pattern matching. See also the --debug-csv option.

       --file=<filename-with-path> or -f
           Process the messages of the specified log file with the pattern database. This option allows to classify messages offline, and to apply
           the pattern database to already existing logfiles. To read the messages from the standard input (stdin), specify a hyphen (-) character
           instead of a filename.

       --filter=<filter-expression> or -F
           Print only messages matching the specified syslog-ng filter expression.

       --message or -M
           The text of the log message to match (only the $MESSAGE part without the syslog headers).

       --pdb or -p
           Name of the pattern database file to use.

       --program or -P
           Name of the program to use, as contained in the $PROGRAM part of the syslog message.

       --template=<template-expression> or -T
           A syslog-ng template expression that is used to format the output messages.

       Example: The following command checks if the patterndb.xml file recognizes the Accepted publickey for myuser from 127.0.0.1 port 59357 ssh2
       message:

           pdbtool match -p patterndb.xml -P sshd -M "Accepted publickey for myuser from 127.0.0.1 port 59357 ssh2"

       The following example applies the sshd.pdb pattern database file to the log messages stored in the /var/log/messages file, and displays
       only the messages that received a useracct tag.

           pdbtool match -p sshd.pdb \
             –file /var/log/messages \
             –filter ‘tags(“usracct”);’

THE MERGE COMMAND
       merge [options]

       Use the merge command to combine separate pattern database files into a single file (pattern databases are usually stored in separate files
       per applications to simplify maintenance). If a file uses an older database format, it is automatically updated to the latest format (V3).
       See the The syslog-ng Administrator Guide[1] for details on the different pattern database versions.

       --directory or -D
           The directory that contains the pattern database XML files to be merged.

       --glob or -G
           Specify filenames to be merged using a glob pattern, for example, using wildcards. For details on glob patterns, see man glob. This
           pattern is applied only to the filenames, and not on directory names.

       --pdb or -p
           Name of the output pattern database file.

       --recursive or -r
           Merge files from subdirectories as well.

       Example:

           pdbtool merge --recursive --directory /home/me/mypatterns/  --pdb /var/lib/syslog-ng/patterndb.xml

       Currently it is not possible to convert a file without merging, so if you only want to convert an older pattern database file to the latest
       format, you have to copy it into an empty directory.

THE PATTERNIZE COMMAND
       patternize [options]

       Automatically create a pattern database from a log file containing a large number of log messages. The resulting pattern database is
       printed to the standard output (stdout). The pdbtool patternize command uses a data clustering technique to find similar log messages and
       replacing the differing parts with @ESTRING:: @ parsers. For details on pattern databases and message parsers, see the The syslog-ng
       Administrator Guide[1]. The patternize command is available only in syslog-ng OSE version 3.2 and later.

       --file=<path> or -f
           The logfile containing the log messages to create patterns from. To receive the log messages from the standard input (stdin), use -.

       --iterate-outliers or -o
           Recursively iterate on the log lines to cover as many log messages with patterns as possible.

       --named-parsers or -n
           The number of example log messages to include in the pattern database for every pattern. Default value: 1

       --samples=<number-of-samples>
           Include a generated name in the parsers, for example, .dict.string1, .dict.string2, and so on.

       --support=<number> or -S
           A pattern is added to the output pattern database if at least the specified percentage of log messages from the input logfile match the
           pattern. For example, if the input logfile contains 1000 log messages and the --support=3.0 option is used, a pattern is created only
           if the pattern matches at least 3 percent of the log messages (that is, 30 log messages). If patternize does not create enough
           patterns, try to decrease the support value.

           Default value: 4.0

       Example:

           pdbtool patternize --support=2.5 --file=/var/log/messages

THE TEST COMMAND
       test [options]

       Use the test command to validate a pattern database XML file. Note that you must have the xmllint application installed. The test command
       is available only in syslog-ng OSE version 3.2 and later.

       --validate
           Validate a pattern database XML file.

       Example:

           pdbtool test --validate /home/me/mypatterndb.pdb

FILES
       /usr/bin/pdbtool

       /etc/syslog-ng/syslog-ng/syslog-ng.conf

SEE ALSO
       The syslog-ng Administrator Guide[1]

       syslog-ng.conf(5)

       syslog-ng(8)

       The syslog-ng OSE 3.3 Administrator Guide[1]

       If you experience any problems or need help with syslog-ng, visit visit the syslog-ng wiki[2] or the syslog-ng mailing list[3].

       For news and notifications about of syslog-ng, visit the syslog-ng Insider Blog[4].

AUTHOR
       This manual page was written by the BalaBit Documentation Team <documentation@balabit.com>.

COPYRIGHT

       The authors grant permission to copy, distribute and/or modify this manual page under the terms of the GNU General Public License Version 2
       or newer (GPL v2+).

NOTES
        1.

                     The syslog-ng Administrator Guide

           http://www.balabit.com/support/documentation/

        2. visit the syslog-ng wiki
           http://www.balabit.com/wiki/syslog-ng-faq

        3. syslog-ng mailing list
           https://lists.balabit.hu/mailman/listinfo/syslog-ng

        4. syslog-ng Insider Blog
           http://insider.blogs.balabit.com

syslog-ng Open Source Edition                                       10/24/2015                                                          PDBTOOL(1)
