DOONA(1)                                                           User Commands                                                          DOONA(1)

NAME
       doona - Network fuzzer forked from bed

SYNOPSIS
       doona -m [module] <options>

OPTIONS
       -m <module>
              Possible values for <module>: FINGER, FTP, HTTP, IMAP, IRC, LPD, PJL, POP, PROXY, RTSP, SMTP, SOCKS4, SOCKS5, TFTP, WHOIS

       -t <target>
              Host to check (default: localhost)

       -p <port>
              Port to connect to (default: module specific standard port)

       -o <timeout>
              seconds to wait after each test (default: 2 seconds)

       -r <index>
              Resumes fuzzing at test case index

       -k     Keep trying until server passes a health check

       -d     Dump test case to stdout (use in combination with -r)

       -M <num>
              Exit after executing <num> number of fuzz cases

       -h     Print help (this text).

              Use "doona.pl -m [module] -h" for module specific option.

              Only -m is a mandatory switch.

doona                                                               August 2016                                                           DOONA(1)
