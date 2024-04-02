CANDUMP(1)                                                         User Commands                                                        CANDUMP(1)

NAME
       candump - manual page for candump 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       candump [options] <CAN interface>+

DESCRIPTION
       candump - dump CAN bus traffic.

              (use CTRL-C to terminate candump)

OPTIONS
       -t <type>
              (timestamp: (a)bsolute/(d)elta/(z)ero/(A)bsolute w date)

       -H     (read hardware timestamps instead of system timestamps)

       -c     (increment color mode level)

       -i     (binary output - may exceed 80 chars/line)

       -a     (enable additional ASCII output)

       -S     (swap byte order in printed CAN data[] - marked with '`' )

       -s <level>
              (silent mode - 0: off (default) 1: animation 2: silent)

       -b <can>
              (bridge mode - send received frames to <can>)

       -B <can>
              (bridge mode - like '-b' with disabled loopback)

       -u <usecs>
              (delay bridge forwarding by <usecs> microseconds)

       -l     (log CAN-frames into file. Sets '-s 2' by default)

       -L     (use log file format on stdout)

       -n <count>
              (terminate after receiption of <count> CAN frames)

       -r <size>
              (set socket receive buffer to <size>)

       -D     (Don't exit if a "detected" can device goes down.

       -d     (monitor dropped CAN frames)

       -e     (dump CAN error frames in human-readable format)

       -x     (print extra message infos, rx/tx brs esi)

       -T <msecs>
              (terminate after <msecs> without any reception)

       Up to 16 CAN interfaces with optional filter sets can be specified on the commandline in the form: <ifname>[,filter]*

   Filters:
              Comma separated filters can be specified for each given CAN interface.

       <can_id>:<can_mask>

              (matches when <received_can_id> & mask == can_id & mask)

       <can_id>~<can_mask>

              (matches when <received_can_id> & mask != can_id & mask)

       #<error_mask>

              (set error frame filter, see include/linux/can/error.h)

       [j|J]

              (join the given CAN filters - logical AND semantic)

       CAN IDs, masks and data content are given and expected in hexadecimal values.  When can_id and can_mask are both 8 digits, they are assumed
       to be 29 bit EFF.  Without any given filter all data frames are received ('0:0' default filter).

       Use interface name 'any' to receive from all CAN interfaces.

EXAMPLES
       candump -c -c -ta can0,123:7FF,400:700,#000000FF can2,400~7F0 can3 can8

       candump -l any,0~0,#FFFFFFFF

              (log only error frames but no(!) data frames)

       candump -l any,0:0,#FFFFFFFF

              (log error frames and also all data frames)

       candump vcan2,92345678:DFFFFFFF

              (match only for extended CAN ID 12345678)

       candump vcan2,123:7FF

              (matches CAN ID 123 - including EFF and RTR frames)

       candump vcan2,123:C00007FF

              (matches CAN ID 123 - only SFF and non-RTR frames)

candump 2018.02.0-1~ubuntu16.04.1~ppa1                             October 2018                                                         CANDUMP(1)
