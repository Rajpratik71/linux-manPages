SLCAN_ATTACH(1)                                                    User Commands                                                   SLCAN_ATTACH(1)

NAME
       slcan_attach - manual page for slcan_attach 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       slcan_attach [options] tty

DESCRIPTION
       ./slcan_attach - userspace tool for serial line CAN interface driver SLCAN.

OPTIONS
       -o     (send open command 'O\r')

       -l     (send listen only command 'L\r', overrides -o)

       -c     (send close command 'C\r')

       -f     (read status flags with 'F\r' to reset error states)

       -s <speed>
              (set CAN speed 0..8)

       -b <btr>
              (set bit time register value)

       -d     (only detach line discipline)

       -w     (attach - wait for keypess - detach)

       -n <name>
              (assign created netdevice name)

EXAMPLES
       slcan_attach -w -o -f -s6 -c /dev/ttyS1 slcan_attach /dev/ttyS1 slcan_attach -d /dev/ttyS1 slcan_attach -w -n can15 /dev/ttyS1

slcan_attach 2018.02.0-1~ubuntu16.04.1~ppa1                        October 2018                                                    SLCAN_ATTACH(1)
