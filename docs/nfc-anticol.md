nfc-anticol(1)                                                   libnfc's examples                                                  nfc-anticol(1)

NAME
       nfc-anticol - Demonstration of NFC anti-collision command line tool based on libnfc

SYNOPSIS
       nfc-anticol

DESCRIPTION
       nfc-anticol  is an anti-collision demonstration tool for ISO/IEC 14443-A tags, performed by custom constructed frames. The first frame must
       be a short frame which is only 7 bits long. Commercial SDK's often don't support a feature to send frames that are not a multiple of 8 bits
       (1  byte)  long.  This makes it impossible to do the anti-collision yourself.  The developer has to rely on closed proprietary software and
       should hope it does not contain vulnerabilities during the anti-collision phase.  Performing the anti-collision using custom  frames  could
       protect  against  a  malicious  tag that, for example, violates the standard by sending frames with unsupported lengths.  Note that this is
       only a demonstration tool, which can not handle multiple tags as real life anti-collisions with multiple tags generate "messy"  bits  which
       are neither 0 nor 1.

BUGS
       Please report any bugs on the libnfc issue tracker at:
       http://code.google.com/p/libnfc/issues

LICENCE
       libnfc is licensed under the GNU Lesser General Public License (LGPL), version 3.
       libnfc-utils and libnfc-examples are covered by the the BSD 2-Clause license.

AUTHORS
       Roel Verdult <roel@libnfc.org>

       This manual page was written by Romuald Conty <romuald@libnfc.org>.  It is licensed under the terms of the GNU GPL (version 2 or later).

libnfc                                                             June 26, 2009                                                    nfc-anticol(1)
