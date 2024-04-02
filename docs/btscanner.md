BTSCANNER(1)                                                  General Commands Manual                                                 BTSCANNER(1)

NAME
       btscanner - ncurses-based scanner for Bluetooth devices

SYNOPSIS
       btscanner [--help] [--cfg <file>] [--no-reset]

DESCRIPTION
       This manual page was written for the Debian GNU/Linux distribution because the original program does not have a manual page.

       btscanner  is  a  tool  designed specifically to extract as much information as possible from a Bluetooth device without the requirement to
       pair. A detailed information screen extracts HCI and SDP information, and maintains an open connection to monitor the RSSI and  link  qual‐
       ity.   btscanner  is based on the BlueZ Bluetooth stack, which is included with recent Linux kernels, and the BlueZ toolset. btscanner also
       contains a complete listing of the IEEE OUI numbers and class lookup tables. Using the information gathered from these sources it is possi‐
       ble to make educated guesses as to the host device type.

OPTIONS
       --help Show a help text and exit.

       --cfg <file> Use <file> as the config file.

       --no-reset Do not reset the Bluetooth adapter before scanning.

BUGS
       Please report any bugs to Tim Hurman <tim.hurman@pentest.co.uk>.

LICENCE
       btscanner is covered by the GNU General Public License (GPL).

SEE ALSO
       kismet(1).

AUTHORS
       Tim Hurman <tim.hurman@pentest.co.uk>

       This manual page was written by Uwe Hermann <uwe@hermann-uwe.de>, for the Debian GNU/Linux system (but may be used by others).

                                                                  April 22, 2006                                                      BTSCANNER(1)
