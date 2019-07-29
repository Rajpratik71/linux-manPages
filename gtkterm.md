GTKTERM(1)                                                    General Commands Manual                                                   GTKTERM(1)

NAME
       gtkterm - A simple GTK+ serial port terminal

SYNOPSIS
       gtkterm [ options ]

DESCRIPTION
       gtkterm is a simple GTK+ terminal used to communicate with the serial port.

OPTIONS
       gtkterm accepts the following options:

       -h, --help Help screen.

       -c, --config <configuration>
              Load configuration (default is "default").

       -p, --port <device>
              Serial port device (default /dev/ttyS0).

       -s, --speed <speed>
              Serial port speed (default 9600).

       -b, --bits <bits>
              Number of bits (default 8).

       -t, --stopbits <stopbits>
              Number of stopbits (default 1).

       -a, --parity <odd | even>
              Partity (default none).

       -w, --flow <Xon | CTS>
              Flow control (default none).

       -d, --delay <ms>
              End of line delay in ms (default none).

       -r, --char <char>
              Wait for a special char at end of line (default none).

       -f, --file <filename>
              Default file to send (default none).

       -e, --echo
              Set local echo.

AUTHOR
       gtkterm was written by Julien Schmitt.  Maintained at https://fedorahosted.org/gtkterm/ By Zach Davis

       This manual page was written by Sebastien Bacher <seb128@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  August 26, 2010                                                       GTKTERM(1)
