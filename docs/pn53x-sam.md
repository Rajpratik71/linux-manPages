pn53x-sam(1)                                                     libnfc's examples                                                    pn53x-sam(1)

NAME
       pn53x-sam - PN53x SAM communication demonstration tool

SYNOPSIS
       pn53x-sam

DESCRIPTION
       pn53x-sam is a utility attempt to test a simple connection with a SAM (Secure Access Module) in several modes.

       To run this utility you must have a SAM (like the NXP's P5CN072 chip) successfully connected to your PN53x chip.

       Warning:  the  SAM inside a Touchatag/ACR122U  is not hooked to the PN532 but to the intermediate controller so pn53x-sam won't work with a
       Touchatag/ACR122U.

BUGS
       Please report any bugs on the libnfc issue tracker at:
       http://code.google.com/p/libnfc/issues

LICENCE
       libnfc is licensed under the GNU Lesser General Public License (LGPL), version 3.
       libnfc-utils and libnfc-examples are covered by the the BSD 2-Clause license.

AUTHORS
       Emanuele Bertoldi <emanuele.bertoldi@gmail.com>

       This manual page was written by Emanuele Bertoldi <emanuele.bertoldi@gmail.com>.  It is licensed under the terms of the GNU GPL (version  2
       or later).

libnfc                                                             June 15, 2010                                                      pn53x-sam(1)
