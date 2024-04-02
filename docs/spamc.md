SPAMC(1)                                                User Contributed Perl Documentation                                               SPAMC(1)

NAME
       spamc - client for spamd

SYNOPSIS
       spamc [options] < message

DESCRIPTION
       Spamc is the client half of the spamc/spamd pair.  It should be used in place of "spamassassin" in scripts to process mail.  It will read
       the mail from STDIN, and spool it to its connection to spamd, then read the result back and print it to STDOUT.  Spamc has extremely low
       overhead in loading, so it should be much faster to load than the whole spamassassin program.

       See the README file in the spamd directory of the SpamAssassin distribution for more details.

OPTIONS
       All options detailed below can be passed as command line arguments, or be contained in a configuration file, as described in the
       CONFIGURATION FILE section below.

       Note that the long options, a la "--long-options", are new as of SpamAssassin 3.2.0, and were not available in earlier versions.

       -B, --bsmtp
           Assume input is a single BSMTP-formatted message. In other words, spamc will pull out everything between the DATA line and the lone-dot
           line to feed to spamd, and will place the spamd output back in the same envelope (thus, any SIZE extension in your BSMTP file will
           cause many problems).

       -c, --check
           Just check if the message is spam or not.  Set process exitcode to 1 if message is spam, 0 if not spam or processing failure occurs.
           Will print score/threshold to stdout (as ints) or 0/0 if there was an error.  Combining -c and -E is a no-op, since -c implies the
           behaviour of -E.

       -d host[,host2], --dest=host[,host2]
           In TCP/IP mode, connect to spamd server on given host (default: localhost).  Several hosts can be specified if separated by commas.

           If host resolves to multiple addresses, then spamc will fail-over to the other addresses, if the first one cannot be connected to.  It
           will first try all addresses of one host before it tries the next one in the list.  Note that this fail-over behaviour is incompatible
           with -x; if that switch is used, fail-over will not occur.

       -4  Use IPv4 only for connecting to server. Restricts domain name resolution of spamd server host(s) to address family AF_INET through the
           "hints.ai_family" flag in the call to getaddrinfo(3).

       -6  Use IPv6 only for connecting to server. Restricts domain name resolution of spamd server host(s) to address family AF_INET6 through the
           "hints.ai_family" flag in the call to getaddrinfo(3).

       -e command [args], --pipe-to command [args]
           Instead of writing to stdout, pipe the output to command's standard input.  Note that there is a very slight chance mail will be lost
           here, because if the fork-and-exec fails there's no place to put the mail message.

           Note that this must be the LAST command line option, as everything after the -e is taken as arguments to the command (it's like rxvt or
           xterm).

           This option is not supported on Win32 platforms.

       -E, --exitcode
           Filter according to the other options, but set the process exitcode to 1 if message is spam, 0 if not spam or processing failure
           occurs.

       -F /path/to/file, --config=path
           Specify a configuration file to read additional command-line flags from.  See CONFIGURATION FILE below.

       -h, --help
           Print this help message and terminate without action.

       -H, --randomize
           For TCP/IP sockets, randomize the IP addresses returned for the hosts given by the -d switch. This provides for a simple kind of load
           balancing.  It will try only three times though.

       -l, --log-to-stderr
           Send log messages to stderr, instead of to the syslog.

       -L learn type, --learntype=type
           Send message to spamd for learning.  The "learn type" can be either spam, ham or forget.  The exitcode for spamc will be set to 5 if
           the message was learned, or 6 if it was already learned, under a condition that a --no-safe-fallback option is selected too.

           Note that the "spamd" must run with the "--allow-tell" option for this to work.

       -C report type, --reporttype=type
           Report or revoke a message to one of the configured collaborative filtering databases.  The "report type" can be either report or
           revoke.

           Note that the "spamd" must run with the "--allow-tell" option for this to work.

       -p port, --port=port
           In TCP/IP mode, connect to spamd server listening on given port (default: 783).

       -r, --full-spam
           Just output the SpamAssassin report text to stdout, if the message is spam.  If the message is ham (non-spam), nothing will be printed.
           The first line of the output is the message score and the threshold, in this format:

                   score/threshold

       -R, --full
           Just output the SpamAssassin report text to stdout, for all messages.  See -r for details of the output format used.

       -s max_size, --max-size=max_size
           Set the maximum message size which will be sent to spamd -- any bigger than this threshold and the message will be returned unprocessed
           (default: 500 KB).  If spamc gets handed a message bigger than this, it won't be passed to spamd.  The maximum message size is 256 MB.

           The size is specified in bytes, as a positive integer greater than 0.  For example, -s 500000.

       --connect-retries=retries
           Retry connecting to spamd retries times.  The default is 3 times.

       --retry-sleep=sleep
           Sleep for sleep seconds between attempts to connect to spamd.  The default is 1 second.

       --filter-retries=retries
           Retry filtering retries times if the spamd process fails (usually times out).  This differs from --connect-retries in that it times out
           the transaction after the TCP connection has been established successfully.  The default is 1 time (ie. one attempt and no retries).

       --filter-retry-sleep=sleep
           Sleep for sleep seconds between failed spamd filtering attempts.  The default is 1 second.

       -S, --ssl, --ssl
           If spamc was built with support for SSL, encrypt data to and from the spamd process with SSL; spamd must support SSL as well.

       -t timeout, --timeout=timeout
           Set the timeout for spamc-to-spamd communications (default: 600, 0 disables).  If spamd takes longer than this many seconds to reply to
           a message, spamc will abort the connection and treat this as a failure to connect; in other words the message will be returned
           unprocessed.

       -n timeout, --connect-timeout=timeout
           Set the timeout for spamc-to-spamd connection establishment (default: 600, 0 disables). If spamc takes longer than this many seconds to
           establish a connection to spamd, spamc will abort the connection and treat this as a failure to connect; in other words the message
           will be returned unprocessed.

       -u username, --username=username
           To have spamd use per-user-config files, run spamc as the user whose config files spamd should load; by default the effective user-ID
           is sent to spamd.  If you're running spamc as some other user, though, (eg. root, mail, nobody, cyrus, etc.) then you may use this flag
           to override the default.

       -U socketpath, --socket=path
           Connect to "spamd" via UNIX domain socket socketpath instead of a TCP/IP connection.

           This option is not supported on Win32 platforms.

       -V, --version
           Report the version of this "spamc" client.  If built with SSL support, an additional line will be included noting this, like so:

             SpamAssassin Client version 3.0.0-rc4
               compiled with SSL support (OpenSSL 0.9.7d 17 Mar 2004)

       -x, --no-safe-fallback
           Disables the 'safe fallback' error-recovery method, which passes through the unaltered message if an error occurs.  Instead, exit with
           an error code, and let the MTA queue up the mails for a retry later.  See also "EXIT CODES".

           This also disables the TCP fail-over behaviour from -d.

       -X, --unavailable-tempfail
           When disabling 'safe fallback' with -x, this option will turn EX_UNAVAILABLE errors into EX_TEMPFAIL. This may allow your MTA to defer
           mails with a temporary SMTP error instead of bouncing them with a permanent SMTP error.  See also "EXIT CODES".

       -y, --tests
           Just output the names of the tests hit to stdout, on one line, separated by commas.

       -K  Perform a keep-alive check of spamd, instead of a full message check.

       -z  Use gzip compression to compress the mail message sent to "spamd". This is useful for long-distance use of spamc over the internet.
           Note that this relies on "zlib" being installed on the "spamc" client side, and the "Compress::Zlib" perl module on the server side; an
           error will be returned otherwise.

       --headers
           Perform a scan, but instead of allowing any part of the message (header and body) to be rewritten, limit rewriting to only the message
           headers. This is much more efficient in bandwidth usage, since the response message transmitted back from the spamd server will not
           include the body.

           Note that this only makes sense if you are using "report_safe 0" in the scanning configuration on the remote end; with "report_safe 1",
           it is likely to result in corrupt messages.

CONFIGURATION FILE
       The above command-line switches can also be loaded from a configuration file.

       The format of the file is similar to the SpamAssassin rules files; blank lines and lines beginning with "#" are ignored.  Any space-
       separated words are considered additions to the command line, and are prepended. Newlines are treated as equivalent to spaces. Existing
       command line switches will override any settings in the configuration file.

       If the -F switch is specified, that file will be used.  Otherwise, "spamc" will attempt to load spamc.conf in "SYSCONFDIR" (default:
       /etc/spamassassin). If that file doesn't exist, and the -F switch is not specified, no configuration file will be read.

       Example:

           # spamc global configuration file

           # connect to "server.example.com", port 783
           -d server.example.com
           -p 783

           # max message size for scanning = 350k
           -s 350000

EXIT CODES
       By default, spamc will use the 'safe fallback' error recovery method.  That means, it will always exit with an exit code of 0, even if an
       error was encountered.  If any error occurrs, it will simply pass through the unaltered message.

       The -c and -E options modify this; instead, spamc will use an exit code of 1 if the message is determined to be spam.

       If one of the "-x", "-L" or "-C" options are specified, 'safe fallback' will be disabled, and certain error conditions related to
       communication between spamc and spamd will result in an error code.

       The exit codes used are as follows:

           EX_USAGE        64  command line usage error
           EX_DATAERR      65  data format error
           EX_NOINPUT      66  cannot open input
           EX_NOUSER       67  addressee unknown
           EX_NOHOST       68  host name unknown
           EX_UNAVAILABLE  69  service unavailable
           EX_SOFTWARE     70  internal software error
           EX_OSERR        71  system error (e.g., can't fork)
           EX_OSFILE       72  critical OS file missing
           EX_CANTCREAT    73  can't create (user) output file
           EX_IOERR        74  input/output error
           EX_TEMPFAIL     75  temp failure; user is invited to retry
           EX_PROTOCOL     76  remote error in protocol
           EX_NOPERM       77  permission denied
           EX_CONFIG       78  configuration error

           * The EX_TOOBIG error level is never used.  If spamc receives a message
             that is too big, the exit code will be 0.

           EX_TOOBIG       98  message was too big to process (see --max-size)

SEE ALSO
       spamd(8) spamassassin(1) Mail::SpamAssassin(3)

PREREQUISITES
       "Mail::SpamAssassin"

AUTHORS
       The SpamAssassin(tm) Project <http://spamassassin.apache.org/>

COPYRIGHT
       SpamAssassin is distributed under the Apache License, Version 2.0, as described in the file "LICENSE" included with the distribution.

perl v5.22.1                                                        2018-11-06                                                            SPAMC(1)
