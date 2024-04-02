nfc-emulate-tag(1)                                               libnfc's examples                                              nfc-emulate-tag(1)

NAME
       nfc-emulate-tag - Simple tag emulation command line demonstration tool

SYNOPSIS
       nfc-emulate-tag

DESCRIPTION
       nfc-emulate-tag is a simple tag emulation tool that demonstrates how emulation can be done using libnfc.

       Currently,  this  tool partially emulates a Mifare Mini: it is detected as Mifare Mini but internal MIFARE proprietary commands are not yet
       implemented.

       To be able to emulate a target, there are two main parts:
        - communication: handle modulation, anticollision, etc.
        - computation: process commands (input) and produce results (output).

       This demonstration tool proposes a logical structure to handle communication and a simple function to deal with computation.

       To improve the target capabilities, we can now implement more allowed commands in a single function: target_io()

       Please note that, due to timing issues, it is very difficult to implement an ISO14443-4 tag this way: RATS  request  expects  a  quick  ATS
       answer.  By  the  way, even if you implement another kind of tag, timing issues are often the source of problems like CRC or parity errors.
       The OmniKey CardMan 5321 is known to be very large on timings and is a good choice if you want to experiment with this emulator with a tol‐
       erant reader.

IMPORTANT
       ACR122  devices (like touchatag, etc.) can be used by this example (with probably timing issue), but if something goes wrong, you will have
       to unplug/replug your device. This is not a libnfc's bug, this problem is due to ACR122's internal MCU in front of NFC chip (PN532).

BUGS
       Please report any bugs on the libnfc issue tracker at:
       http://code.google.com/p/libnfc/issues

LICENCE
       libnfc is licensed under the GNU Lesser General Public License (LGPL), version 3.
       libnfc-utils and libnfc-examples are covered by the the BSD 2-Clause license.

AUTHORS
       Romuald Conty <romuald@libnfc.org>

       This manual page was written by Romuald Conty <romuald@libnfc.org>.  It is licensed under the terms of the GNU GPL (version 2 or later).

libnfc                                                            October 8, 2010                                               nfc-emulate-tag(1)
