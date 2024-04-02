NFC-EMULATE-FORUM-TAG2(1)                                     User's Reference Manual                                    NFC-EMULATE-FORUM-TAG2(1)

NAME
     nfc-emulate-forum-tag2 — NFC Forum tag type 2 emulation command line demonstration tool

SYNOPSIS
     nfc-emulate-forum-tag2

DESCRIPTION
     nfc-emulate-forum-tag2 is a demonstration tool that emulates a NFC-Forum Tag Type 2 with NDEF content.

     Some devices compliant with NFC-Forum Tag Type 2 can be used with this example, in read mode only.

IMPORTANT
     This example has been developed using PN533 USB hardware as target and Google Nexus S phone as initiator.

     This is know to NOT work with Nokia 6212 Classic and could fail with several NFC Forum compliant devices due to the following reasons:

     - The emulated target has only a 4-byte UID while most devices assume a Tag Type 2 has always a 7-byte UID (as a real Mifare Ultralight tag);

     - The chip is emulating an ISO/IEC 14443-3 tag, without any hardware helper.  If the initiator have too strict timeouts for software-based
     emulation (which is usually the case), this example will fail.  This is not a bug and we can't do anything using this hardware (PN531/PN533).

     ACR122 devices (like touchatag, etc.) can be used by this example, but if something goes wrong, you will have to unplug/replug your device.
     This is not a libnfc's bug, this problem is due to ACR122's internal MCU in front of NFC chip (PN532).

BUGS
     Please report any bugs on the libnfc issue tracker at: http://code.google.com/p/libnfc/issues

LICENCE
     libnfc is licensed under the GNU Lesser General Public License (LGPL), version 3.  libnfc-utils and libnfc-examples are covered by the BSD
     2-Clause license.

AUTHORS
     Roel Verdult <roel@libnfc.org>
     Romain Tartière <romain@libnfc.org>
     Romuald Conty <romuald@libnfc.org>

     This manual page was written by Romuald Conty.  It is licensed under the terms of the GNU GPL (version 2 or later).

                                                                September 19, 2012
