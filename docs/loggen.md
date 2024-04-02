LOGGEN(1)                                                     The loggen manual page                                                     LOGGEN(1)

NAME
       loggen - Generate syslog messages at a specified rate

SYNOPSIS
       loggen [options]target [port]

DESCRIPTION
       NOTE: The loggen application is distributed with the syslog-ng system logging application, and is usually part of the syslog-ng package.
       The latest version of the syslog-ng application is available at the official syslog-ng website[1].

       This manual page is only an abstract; for the complete documentation of syslog-ng, see The syslog-ng Administrator Guide[2].

       The loggen application is tool to test and stress-test your syslog server and the connection to the server. It can send syslog messages to
       the server at a specified rate, using a number of connection types and protocols, including TCP, UDP, and unix domain sockets. The messages
       can be generated automatically (repeating the PADDstring over and over), or read from a file or the standard input.

       When loggen finishes sending the messages, it displays the following statistics:

       ·   average rate: Average rate the messages were sent in messages/second.

       ·   count: The total number of messages sent.

       ·   time: The time required to send the messages in seconds.

       ·   average message size: The average size of the sent messages in bytes.

       ·   bandwidth: The average bandwidth used for sending the messages in kilobytes/second.

OPTIONS
       --active-connections <number-of-connections>
           Number of connections loggen will use to send messages to the destination. This option is usable only when using TCP or TLS connections
           to the destination. Default value: 1

           The loggen utility waits until every connection is established before starting to to send messages. See also the --idle-connections
           option.

       --csv or -C
           Send the statistics of the sent messages to stdout as CSV. This can be used for plotting the message rate.

       --dgram or -D
           Use datagram socket (UDP or unix-dgram) to send the messages to the target. Requires the --inet option as well.

       --dont-parse or -d
           Do not parse the lines read from the input files, send them as received.

       --help or -h
           Display a brief help message.

       --idle-connections <number-of-connections>
           Number of idle connections loggen will establish to the destination. Note that loggen will not send any messages on idle connections,
           but the connection is kept open using keep-alive messages. This option is usable only when using TCP or TLS connections to the
           destination. See also the --active-connections option. Default value: 0

       --inet or -i
           Use the TCP (by default) or UDP (when used together with the --dgram option) protocol to send the messages to the target.

       --interval <seconds> or -I <seconds>
           The number of seconds loggen will run. Default value: 10

           Note that when the --interval and --number are used together, loggen will send messages until the period set in --interval expires or
           the amount of messages set in --number is reached, whichever happens first.

       --ipv6 or -6
           Specify the destination using its IPv6 address. Note that the destination must have a real IPv6 address.

       --loop-reading or -l
           Read the file specified in --read-file option in loop: loggen will start reading from the beginning of the file when it reaches the end
           of the file.

       --number <number-of-messages> or -n <number-of-messages>
           Number of messages to generate.

           Note that when the --interval and --number are used together, loggen will send messages until the period set in --interval expires or
           the amount of messages set in --number is reached, whichever happens first.

       --no-framing or -F
           Do not use the framing of the IETF-syslog protocol style, even if the syslog-proto option is set.

       --quiet or -Q
           Output statistics only when the execution of loggen is finished. If not set, the statistics are displayed every second.

       --rate <message/second> or -r <message/second>
           The number of messages generated per second for every active connection. Default value: 1000

       --read-file <filename> or -R <filename>
           Read the messages from a file and send them to the target. See also the --skip-tokens option.

           Specify - as the input file to read messages from the standard input (stdio). Note that when reading messages from the standard input,
           loggen can only use a single thread. The -R - parameters must be placed at end of command, like: loggen 127.0.0.1 1061 --read-file -
               Send the given sdata (e.g. "[test name=\"value\"]) in case of syslog-proto
               .PP --sdata <data-to-send> or -p <data-to-send>
           Send the argument of the --sdata option as the SDATA part of IETF-syslog (RFC5424 formatted) messages. Use it together with the
           --syslog-proto option. For example: --sdata "[test name=\"value\"]

       --size <message-size> or -s <message-size>
           The size of a syslog message in bytes. Default value: 256. Minimum value: 127 bytes, maximum value: 8192 bytes.

       --skip-tokens <number>
           Skip the specified number of space-separated tokens (words) at the beginning of every line. For example, if the messages in the file
           look like foo bar message, --skip-tokens 2 skips the foo bar part of the line, and sends only the message part. Works only when used
           together with the --read-file parameter. Default value: 3

       --stream or -S
           Use a stream socket (TCP or unix-stream) to send the messages to the target.

       --syslog-proto or -P
           Use the new IETF-syslog message format as specified in RFC5424. By default, loggen uses the legacy BSD-syslog message format (as
           described in RFC3164). See also the --no-framing option.

       --unix </path/to/socket> or -x </path/to/socket>
           Use a UNIX domain socket to send the messages to the target.

       --use-ssl or -U
           Use an SSL-encrypted channel to send the messages to the target. Note that it is not possible to check the certificate of the target,
           or to perform mutual authentication.

       --version or -V
           Display version number of syslog-ng.

EXAMPLES
       The following command generates 100 messages per second for ten minutes, and sends them to port 2010 of the localhost via TCP. Each message
       is 300 bytes long.  loggen --size 300 --rate 100 --interval 600 127.0.0.1 2010.PP The following command is similar to the one above, but
       uses the UDP protocol.  loggen --inet --dgram --size 300 --rate 100 --interval 600 127.0.0.1 2010.PP Send a single message on TCP6 to the
       ::1 IPv6 address, port 1061: loggen --ipv6 --number 1 ::1 1061.PP Send a single message on UDP6 to the ::1 IPv6 address, port 1061: loggen
       --ipv6 --dgram --number 1 ::1 1061.PP Send a single message using a unix domain-socket: loggen --unix --stream --number 1
       </path/to/socket>.PP Read messages from the standard input (stdio) and send them to the localhost: loggen 127.0.0.1 1061 --read-file -.SH
       "FILES"

       /usr/bin/loggen

SEE ALSO
       syslog-ng.conf(5)

       The syslog-ng Administrator Guide[2]

       If you experience any problems or need help with loggen or syslog-ng, visit the syslog-ng mailing list[3]

       The syslog-ng OSE 3.3 Administrator Guide[2]

       If you experience any problems or need help with syslog-ng, visit visit the syslog-ng wiki[4] or the syslog-ng mailing list[3].

       For news and notifications about of syslog-ng, visit the syslog-ng Insider Blog[5].

AUTHOR
       This manual page was written by the BalaBit Documentation Team <documentation@balabit.com>.

COPYRIGHT

       The authors grant permission to copy, distribute and/or modify this manual page under the terms of the GNU General Public License Version 2
       or newer (GPL v2+).

NOTES
        1. the official syslog-ng website
           http://www.balabit.com/network-security/syslog-ng/

        2. The syslog-ng Administrator Guide
           http://www.balabit.com/support/documentation/

        3. syslog-ng mailing list
           https://lists.balabit.hu/mailman/listinfo/syslog-ng

        4. visit the syslog-ng wiki
           http://www.balabit.com/wiki/syslog-ng-faq

        5. syslog-ng Insider Blog
           http://insider.blogs.balabit.com

syslog-ng Open Source Edition                                       10/24/2015                                                           LOGGEN(1)
