nfc-relay(1)                                                      libnfc'examples                                                     nfc-relay(1)

NAME
       nfc-relay - Relay attack command line tool based on libnfc

SYNOPSIS
       nfc-relay

DESCRIPTION
       nfc-relay is a utility that demonstrates a relay attack.

       This  tool  requires  two  NFC devices. One device (configured as target) will emulate an ISO/IEC 14443 type A tag, while the second device
       (configured as initiator) will act as a reader. The genuine tag can be placed on the second device (initiator) and the tag  emulator  (tar‐
       get) can be placed close to the original reader. All communication is now relayed and shown in the screen on real-time.

       This  tool  has  the same issues regarding timing as nfc-emulate-uid has, therefore we advise you to try it against e.g. an OmniKey CardMan
       5321 reader.

BUGS
       Please report any bugs on the libnfc issue tracker at:
       http://code.google.com/p/libnfc/issues

LICENCE
       libnfc is licensed under the GNU Lesser General Public License (LGPL), version 3.
       libnfc-utils and libnfc-examples are covered by the the BSD 2-Clause license.

AUTHORS
       Roel Verdult <roel@libnfc.org>

       This manual page was written by Romuald Conty <romuald@libnfc.org>.  It is licensed under the terms of the GNU GPL (version 2 or later).

libnfc                                                             June 26, 2009                                                      nfc-relay(1)
