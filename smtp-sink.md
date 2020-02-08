SMTP-SINK(1)                            General Commands Manual                           SMTP-SINK(1)

NAME
       smtp-sink - parallelized SMTP/LMTP test server

SYNOPSIS
       smtp-sink [options] [inet:][host]:port backlog

       smtp-sink [options] unix:pathname backlog

DESCRIPTION
       smtp-sink  listens  on  the  named host (or address) and port.  It takes SMTP messages from the
       network and throws them away.  The purpose is to measure client performance, not protocol  com‐
       pliance.

       smtp-sink  may also be configured to capture each mail delivery transaction to file. Since disk
       latencies are large compared to network delays, this mode of operation can reduce  the  maximal
       performance by several orders of magnitude.

       Connections  can  be  accepted  on IPv4 or IPv6 endpoints, or on UNIX-domain sockets.  IPv4 and
       IPv6 are the default.  This program is the complement of the smtp-source(1) program.

       Note: this is an unsupported test program. No attempt is made to maintain compatibility between
       successive versions.

       Arguments:

       -4     Support IPv4 only. This option has no effect when Postfix is built without IPv6 support.

       -6     Support  IPv6 only. This option is not available when Postfix is built without IPv6 sup‐
              port.

       -8     Do not announce 8BITMIME support.

       -a     Do not announce SASL authentication support.

       -A delay
              Wait delay seconds after responding to DATA, then abort prematurely  with  a  550  reply
              status.   Do  not  read  further  input from the client; this is an attempt to block the
              client before it sends ".".  Specify a zero delay value to abort immediately.

       -b soft-bounce-reply
              Use soft-bounce-reply for soft reject responses.  The default reply is "450 4.3.0 Error:
              command failed".

       -B hard-bounce-reply
              Use hard-bounce-reply for hard reject responses.  The default reply is "500 5.3.0 Error:
              command failed".

       -c     Display running counters that are updated whenever an SMTP session ends, a QUIT  command
              is executed, or when "." is received.

       -C     Disable XCLIENT support.

       -d dump-template
              Dump  each  mail transaction to a single-message file whose name is created by expanding
              the dump-template via strftime(3) and appending a pseudo-random hexadecimal number  (ex‐
              ample:  "%Y%m%d%H/%M." expands into "2006081203/05.809a62e3").  If the template contains
              "/" characters, missing directories are created automatically.  The message dump  format
              is described below.

              Note: this option keeps one capture file open for every mail transaction in progress.

       -D dump-template
              Append mail transactions to a multi-message dump file whose name is created by expanding
              the dump-template via strftime(3).  If the template contains "/" characters, missing di‐
              rectories are created automatically.  The message dump format is described below.

              Note: this option keeps one capture file open for every mail transaction in progress.

       -e     Do not announce ESMTP support.

       -E     Do not announce ENHANCEDSTATUSCODES support.

       -f command,command,...
              Reject the specified commands with a hard (5xx) error code.  This option implies -p.

              Examples  of  commands  are  CONNECT, HELO, EHLO, LHLO, MAIL, RCPT, VRFY, DATA, ., RSET,
              NOOP, and QUIT. Separate command names by white space or commas, and use quotes to  pro‐
              tect white space from the shell. Command names are case-insensitive.

       -F     Disable XFORWARD support.

       -h hostname
              Use  hostname  in the SMTP greeting, in the HELO response, and in the EHLO response. The
              default hostname is "smtp-sink".

       -H delay
              Delay the first read operation after receiving DATA (time in seconds).  Combine  with  a
              large  test  message and a small TCP window size (see the -T option) to test the Postfix
              client write_wait() implementation.

       -L     Enable LMTP instead of SMTP.

       -m count (default: 256)
              An upper bound on the maximal number of simultaneous  connections  that  smtp-sink  will
              handle.  This  prevents the process from running out of file descriptors. Excess connec‐
              tions will stay queued in the TCP/IP stack.

       -M count
              Terminate after receiving count messages.

       -n count
              Terminate after count sessions.

       -N     Do not announce support for DSN.

       -p     Do not announce support for ESMTP command pipelining.

       -P     Change the server greeting so that it appears to come through a CISCO  PIX  system.  Im‐
              plies -e.

       -q command,command,...
              Disconnect (without replying) after receiving one of the specified commands.

              Examples  of  commands  are  CONNECT, HELO, EHLO, LHLO, MAIL, RCPT, VRFY, DATA, ., RSET,
              NOOP, and QUIT. Separate command names by white space or commas, and use quotes to  pro‐
              tect white space from the shell. Command names are case-insensitive.

       -Q command,command,...
              Send a 421 reply and disconnect after receiving one of the specified commands.

              Examples  of  commands  are  CONNECT, HELO, EHLO, LHLO, MAIL, RCPT, VRFY, DATA, ., RSET,
              NOOP, and QUIT. Separate command names by white space or commas, and use quotes to  pro‐
              tect white space from the shell. Command names are case-insensitive.

       -r command,command,...
              Reject the specified commands with a soft (4xx) error code.  This option implies -p.

              Examples  of  commands  are  CONNECT, HELO, EHLO, LHLO, MAIL, RCPT, VRFY, DATA, ., RSET,
              NOOP, and QUIT. Separate command names by white space or commas, and use quotes to  pro‐
              tect white space from the shell. Command names are case-insensitive.

       -R root-directory
              Change  the  process root directory to the specified location.  This option requires su‐
              per-user privileges. See also the -u option.

       -s command,command,...
              Log the named commands to syslogd.

              Examples of commands are CONNECT, HELO, EHLO, LHLO, MAIL, RCPT,  VRFY,  DATA,  .,  RSET,
              NOOP,  and QUIT. Separate command names by white space or commas, and use quotes to pro‐
              tect white space from the shell. Command names are case-insensitive.

       -S start-string
              An optional string that is prepended to each message that is written to a dump file (see
              the dump file format description below). The following C escape sequences are supported:
              \a (bell), \b (backspace), \f (formfeed), \n (newline), \r (carriage return), \t  (hori‐
              zontal  tab),  \v  (vertical tab), \ddd (up to three octal digits) and \\ (the backslash
              character).

       -t timeout (default: 100)
              Limit the time for receiving a command or sending a response.  The time limit is  speci‐
              fied in seconds.

       -T windowsize
              Override the default TCP window size. To work around broken TCP window scaling implemen‐
              tations, specify a value > 0 and < 65536.

       -u username
              Switch to the specified user privileges after opening the network socket and  optionally
              changing  the process root directory. This option is required when the process runs with
              super-user privileges. See also the -R option.

       -v     Show the SMTP conversations.

       -w delay
              Wait delay seconds before responding to a DATA command.

       -W command:delay[:odds]
              Wait delay seconds before responding to command.  If odds is also  specified  (a  number
              between  1-99  inclusive), wait for a random multiple of delay. The random multiplier is
              equal to the number of times the program needs to roll a dice with a range of 0..99  in‐
              clusive, before the dice produces a result greater than or equal to odds.

       [inet:][host]:port
              Listen  on  network interface host (default: any interface) TCP port port. Both host and
              port may be specified in numeric or symbolic form.

       unix:pathname
              Listen on the UNIX-domain socket at pathname.

       backlog
              The maximum length the queue of pending connections, as defined by the listen(2)  system
              call.

DUMP FILE FORMAT
       Each  dumped  message contains a sequence of text lines, terminated with the newline character.
       The sequence of information is as follows:

       •      The optional string specified with the -S option.

       •      The smtp-sink generated headers as documented below.

       •      The message header and body as received from the SMTP client.

       •      An empty line.

       The format of the smtp-sink generated headers is as follows:

       X-Client-Addr: text
              The client IP address without enclosing []. An IPv6 address is  prefixed  with  "ipv6:".
              This record is always present.

       X-Client-Proto: text
              The client protocol: SMTP, ESMTP or LMTP. This record is always present.

       X-Helo-Args: text
              The  arguments  of  the last HELO or EHLO command before this mail delivery transaction.
              This record is present only if the client sent a recognizable HELO or EHLO  command  be‐
              fore the DATA command.

       X-Mail-Args: text
              The  arguments  of  the  MAIL  command that started this mail delivery transaction. This
              record is present exactly once.

       X-Rcpt-Args: text
              The arguments of an RCPT command within this mail delivery  transaction.  There  is  one
              record for each RCPT command, and they are in the order as sent by the client.

       Received: text
              A message header for compatibility with mail processing software. This three-line header
              marks the end of the headers provided by smtp-sink, and is formatted as follows:

              from helo ([addr])
                     The HELO or EHLO command argument and client IP address.  If the client  did  not
                     send HELO or EHLO, the client IP address is used instead.

              by host (smtp-sink) with proto id random;
                     The   hostname   specified   with   the  -h  option,  the  client  protocol  (see
                     X-Client-Proto above), and the pseudo-random portion of the  per-message  capture
                     file name.

              time-stamp
                     A time stamp as defined in RFC 2822.

SEE ALSO
       smtp-source(1), SMTP/LMTP message generator

LICENSE
       The Secure Mailer license must be distributed with this software.

AUTHOR(S)
       Wietse Venema
       IBM T.J. Watson Research
       P.O. Box 704
       Yorktown Heights, NY 10598, USA

       Wietse Venema
       Google, Inc.
       111 8th Avenue
       New York, NY 10011, USA

                                                                                          SMTP-SINK(1)
