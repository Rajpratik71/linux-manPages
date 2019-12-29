BTMON(1)                                General Commands Manual                               BTMON(1)

NAME
       btmon - Bluetooth monitor

DESCRIPTION
       btmon - Bluetooth monitor Usage:

              btmon [options]

   options:
       -r, --read <file>
              Read traces in btsnoop format

       -w, --write <file>
              Save traces in btsnoop format

       -a, --analyze <file>
              Analyze traces in btsnoop format

       -s, --server <socket>
              Start monitor server socket

       -p, --priority <level> Show only priority or lower

       -i, --index <num>
              Show only specified controller

       -d, --tty <tty>
              Read data from TTY

       -B, --tty-speed <rate> Set TTY speed (default 115200)

       -t, --time
              Show time instead of time offset

       -T, --date
              Show time and date information

       -S, --sco
              Dump SCO traffic

       -A, --a2dp
              Dump A2DP stream traffic

       -E, --ellisys [ip]
              Send Ellisys HCI Injection

       -h, --help
              Show help options

                                              April 2018                                      BTMON(1)
