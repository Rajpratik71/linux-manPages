SLCAND(1)                                                          User Commands                                                         SLCAND(1)

NAME
       slcand - manual page for slcand 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       slcand [options] <tty> [canif-name]

DESCRIPTION
       ./slcand - userspace daemon for serial line CAN interface driver SLCAN.

OPTIONS
       -o     (send open command 'O\r')

       -c     (send close command 'C\r')

       -f     (read status flags with 'F\r' to reset error states)

       -l     (send listen only command 'L\r', overrides -o)

       -s <speed>
              (set CAN speed 0..8)

       -S <speed>
              (set UART speed in baud)

       -t <type>
              (set UART flow control type 'hw' or 'sw')

       -b <btr>
              (set bit time register value)

       -F     (stay in foreground; no daemonize)

       -h     (show this help page)

EXAMPLES
       slcand -o -c -f -s6 ttyUSB0 slcand -o -c -f -s6 ttyUSB0 can0 slcand -o -c -f -s6 /dev/ttyUSB0

slcand 2018.02.0-1~ubuntu16.04.1~ppa1                              October 2018                                                          SLCAND(1)
