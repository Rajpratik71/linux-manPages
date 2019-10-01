LDATTACH(8)                                                                                 System Administration                                                                                 LDATTACH(8)



NAME
       ldattach - attach a line discipline to a serial line

SYNOPSIS
       ldattach [-dhV78neo12] [-s speed] [-i iflag] ldisc device

DESCRIPTION
       The  ldattach  daemon  opens  the specified device file (which should refer to a serial device) and attaches the line discipline ldisc to it for processing of the sent and/or received data.  It then
       goes into the background keeping the device open so that the line discipline stays loaded.

       The line discipline ldisc may be specified either by name or by number.

       In order to detach the line discipline, kill(1) the ldattach process.

       With no arguments, ldattach prints usage information.

LINE DISCIPLINES
       Depending on the kernel release, the following line disciplines are supported:

       TTY(0) The default line discipline, providing transparent operation (raw mode) as well as the habitual terminal line editing capabilities (cooked mode).

       SLIP(1)
              Serial Line IP (SLIP) protocol processor for transmitting TCP/IP packets over serial lines.

       MOUSE(2)
              Device driver for RS232 connected pointing devices (serial mice).

       PPP(3) Point to Point Protocol (PPP) processor for transmitting network packets over serial lines.

       STRIP(4)

       AX25(5)

       X25(6) Line driver for transmitting X.25 packets over asynchronous serial lines.

       6PACK(7)

       R3964(9)
              Driver for Simatic R3964 module.

       IRDA(11)
              Linux IrDa (infrared data transmission) driver - see http://irda.sourceforge.net/

       HDLC(13)
              Synchronous HDLC driver.

       SYNC_PPP(14)
              Synchronous PPP driver.

       HCI(15)
              Bluetooth HCI UART driver.

       GIGASET_M101(16)
              Driver for Siemens Gigaset M101 serial DECT adapter.

       PPS(18)
              Driver for serial line Pulse Per Second (PPS) source.

OPTIONS
       -d | --debug
              Causes ldattach to stay in the foreground so that it can be interrupted or debugged, and to print verbose messages about its progress to the standard error output.

       -h | --help
              Prints a usage message and exits.

       -V | --version
              Prints the program version.

       -s value | --speed value
              Set the speed of the serial line to the specified value.

       -7 | --sevenbits
              Sets the character size of the serial line to 7 bits.

       -8 | --eightbits
              Sets the character size of the serial line to 8 bits.

       -n | --noparity
              Sets the parity of the serial line to none.

       -e | --evenparity
              Sets the parity of the serial line to even.

       -o | --oddparity
              Sets the parity of the serial line to odd.

       -1 | --onestopbit
              Sets the number of stop bits of the serial line to one.

       -2 | --twostopbits
              Sets the number of stop bits of the serial line to two.

       -i value | --iflag [-]value{,...}
              Sets the specified bits in the c_iflag word of the serial line.  Value may be a number or a symbolic name.  If value is prefixed by a minus sign, clear the specified  bits  instead.   Several
              comma separated values may be given in order to set and clear multiple bits.

SEE ALSO
       inputattach(1), ttys(4)

AUTHOR
       Tilman Schmidt (tilman@imap.cc)

AVAILABILITY
       The ldattach command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                      February 2010                                                                                     LDATTACH(8)
