CANPLAYER(1)                                                       User Commands                                                      CANPLAYER(1)

NAME
       canplayer - manual page for canplayer 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       canplayer <options> [interface assignment]*

DESCRIPTION
       canplayer - replay a compact CAN frame logfile to CAN devices.

OPTIONS
       -I <infile>
              (default stdin)

       -l <num>
              (process input file <num> times) (Use 'i' for infinite loop - default: 1)

       -t     (ignore timestamps: send frames immediately)

       -g <ms>
              (gap in milli seconds - default: 1 ms)

       -s <s> (skip gaps in timestamps > 's' seconds)

       -x     (disable local loopback of sent CAN frames)

       -v     (verbose: print sent CAN frames)

       Interface  assignment: 0..n assignments like <write-if>=<log-if> e.g. vcan2=can0 (send frames received from can0 on vcan2) extra hook: std‐
       out=can0 (print logfile line marked with can0 on stdout) No assignments => send frames to the interface(s) they had been received from.

       Lines in the logfile not beginning with '(' (start of timestamp) are ignored.

canplayer 2018.02.0-1~ubuntu16.04.1~ppa1                           October 2018                                                       CANPLAYER(1)
