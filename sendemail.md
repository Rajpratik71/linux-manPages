SendEmail(1)                                                       User Commands                                                      SendEmail(1)

NAME
       SendEmail - Lightweight, command line SMTP email client

SYNOPSIS
       SendEmail -f ADDRESS [options]

OPTIONS
       -f ADDRESS
              from (sender) email address

              * At least one recipient required via -t, -cc, or -bcc * Message body required via -m, STDIN, or -o message-file=FILE

              Common:

       -t ADDRESS [ADDR ...]
              to email address(es)

       -u SUBJECT
              message subject

       -m MESSAGE
              message body

       -s SERVER[:PORT]
              smtp mail relay, default is localhost:25

       -S [SENDMAIL_PATH]
              use local sendmail utility (default: /usr/bin/sendmail) instead of network MTA

              Optional:

       -a     FILE [FILE ...]      file attachment(s)

       -cc    ADDRESS [ADDR ...]   cc  email address(es)

       -bcc ADDRESS [ADDR ...]
              bcc email address(es)

              [32;1mParanormal:[m

       -xu USERNAME
              authentication user (for SMTP authentication)

       -xp PASSWORD
              authentication password (for SMTP authentication)

       -l     LOGFILE               log to the specified file

       -v     verbosity, use multiple times for greater effect

       -q     be quiet (no stdout output)

       -o NAME=VALUE
              see extended help topic "misc" for details

              Help:

       --help TOPIC
              The following extended help topics are available:

       addressing
              explain addressing and related options

       message
              explain message body input and related options

       misc   explain -xu, -xp, and others

       networking
              explain -s, etc

       output explain logging and other output options

REPORTING BUGS
       Report bugs to <http://bugs.debian.org/sendemail>

AUTHOR
       sendemail was written by Brandon Zehm <caspian@dotconf.net> .

       This  manual  page  was written by Brandon Zehm and improved by Alejandro Garrido Mota <garridomota@gmail.com>, for the Debian project (and
       may be used by others).

sendEmail                                                         September 2010                                                      SendEmail(1)
