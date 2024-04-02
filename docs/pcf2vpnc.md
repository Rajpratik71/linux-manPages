PCF2VPNC(1)                                                            vpnc                                                            PCF2VPNC(1)

NAME
       pcf2vpnc - converts VPN-config files from pcf to vpnc-format

SYNOPSIS
       pcf2vpnc <pcf file> [vpnc file]

DESCRIPTION
       This  script accompanies vpnc. It attempts to convert *.pcf-configuration files often spread with proprietary (read Cisco) VPN-clients into
       vpnc-configuration files, usually named *.conf.

       If [vpnc file] is not specified, the result will be printed to STDOUT. If specified, it will be written to that file. Please make sure that
       it has appropriate permissions as it may contain sensitive data!

AUTHOR
       pcf2vpnc was originally written by Stefan Tomanek. Updates and this man-page were made by Wolfram Sang (ninja(at)the-dreams.de).

       Permission  is  granted  to  copy,  distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any
       later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

SEE ALSO
       vpnc(8) cisco-decrypt(8)

pcf2vpnc                                                             June 2007                                                         PCF2VPNC(1)
