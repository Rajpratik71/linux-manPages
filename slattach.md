SLATTACH(8)                                                                                                                            SLATTACH(8)

NAME
       slattach - attach a network interface to a serial line

SYNOPSIS
       slattach [-dehlLmnqv] [-c command] [-p proto] [-s speed] [tty]

DESCRIPTION
       Slattach  is  a  tiny  little  program  that can be used to put a normal terminal ("serial") line into one of several "network" modes, thus
       allowing you to use it for point-to-point links to other computers.

OPTIONS
       [-c command]
              Execute command when the line is hung up. This can be used to run scripts or re-establish connections when a link goes down.

       [-d]   Enable debugging output.  Useful when determining why a given setup doesn't work.

       [-h]   Exit when the carrier is lost. This works on both /dev/tty and /dev/cua devices by directly monitoring the carrier status  every  15
              seconds.

       [-v]   Enable verbose output.  Useful in shell scripts.

       [-q]   Operate in quiet mode - no messages at all.

       [-l]   Create an UUCP-style lockfile for the device in /var/lock.

       [-n]   Equivalent to the "mesg n" command.

       [-m]   Do not initialize the line into 8 bits raw mode.

       [-e]   Exit right after initializing device, instead of waiting for the line to hang up.

       [-L]   Enable 3 wire operation. The terminal is moved into CLOCAL mode, carrier watching is disabled.

       [-p proto]
              Set  a  specific kind of protocol to use on the line.  The default is set to cslip, i.e. compressed SLIP.  Other possible values are
              slip (normal SLIP), adaptive (adaptive CSLIP/SLIP), ppp (Point-to-Point Protocol) and kiss (a protocol used for  communicating  with
              AX.25 packet radio terminal node controllers).  The special argument tty can be used to put the device back into normal serial oper‐
              ation.  Using 'ppp' mode is not normally useful as ppp requires an additional ppp daemon pppd to be active on  the  line.  For  kiss
              connections the axattach program should be used.

       [-s speed]
              Set a specific line speed, other than the default.

       If no arguments are given, the current terminal line (usually: the login device) is used.  Otherwise, an attempt is made to claim the indi‐
       cated terminal port, lock it, and open it.

FILES
       /dev/cua* /var/lock/LCK.*

BUGS
       None known.

SEE ALSO
       axattach(8), dip(8) pppd(8), sliplogin(8).

AUTHORS
       Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
       Alan Cox, <Alan.Cox@linux.org>
       Miquel van Smoorenburg, <miquels@drinkel.ow.org>
       George Shearer, <gshearer@one.net>
       Yossi Gottlieb, <yogo@math.tau.ac.il>

                                                                    10 Oct 2006                                                        SLATTACH(8)
