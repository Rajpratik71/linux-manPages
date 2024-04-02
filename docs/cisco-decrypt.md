CISCO-DECRYPT(1)                                                       vpnc                                                       CISCO-DECRYPT(1)

NAME
       cisco-decrypt - decrypts an obfuscated Cisco vpn client pre-shared key

SYNOPSIS
       cisco-decrypt <obfuscated pre-shared key>

DESCRIPTION
       This  command  accompanies  vpnc.  It decrypts the obfuscated pre-shared key from *.pcf-configuration files, which must be specified on the
       command line.

       The result will be printed to STDOUT.

AUTHOR
       cisco-decrypt was originally written by Maurice Massar. This man-page was written by Jörg Mayer, based on the pcf2vpnc manpage  written  by
       Wolfram Sang (ninja(at)the-dreams.de).

       Permission  is  granted  to  copy,  distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any
       later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

SEE ALSO
       vpnc(8) pcf2vpnc(1)

cisco-decrypt                                                       August 2007                                                   CISCO-DECRYPT(1)
