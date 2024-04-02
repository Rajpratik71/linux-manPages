lldptool(8)                                                                                         Linux                                                                                         lldptool(8)



NAME
       lldptool - manage the LLDP settings and status of lldpad

SYNOPSIS
       lldptool <command> [options] [argument]



DESCRIPTION
       lldptool  is  used  to  query and configure lldpad.  It connects to the client interface of lldpad to perform these operations.  lldptool will operate in interactive mode if it is executed without a
       command.  In interactive mode, lldptool will also function as an event listener to print out events as they are received asynchronously from lldpad.  It will use libreadline  for  interactive  input
       when available.


OPTIONS
       -i [ifname]
              specifies the network interface to which the command applies.  Most lldptool commands require specifying a network interface.

       -V [tlvid]
              specifies the TLV identifier
              The  tlvid  is  an  integer value used to identify specific LLDP TLVs.  The tlvid value is the Type value for types not equal to 127 (the organizationally specific type). For organizationally
              specific TLVs, the tlvid is the value represented by the 3 byte OUI and 1 byte subtype - where the subtype is the lowest order byte of the tlvid.
              The tlvid can be entered as a numerical value (e.g. 10 or 0xa), or for supported TLVs, as a keyword.  Review the lldptool help output to see the list of supported TLV keywords.

       -n     "neighbor" option for commands which can use it (e.g. get-tlv)

       -g [bridge scope]
              specify the bridge scope this command operates on. Allows to  set  and  query  all  LLDP  TLV  modules  for  "nearest_bridge"  (short:  "nb"),  "nearest_customer_bridge"  ("ncb")  and  "near‐
              est_nontpmr_bridge"  ("nntpmrb")  group  mac addresses. Configurations are saved into independent sections in lldpad.conf.  If no bridge scope is supplied this defaults to "nearest bridge" to
              preserve the previous behaviour.

       -c <argument list>
              "config" option for TLV queries. Indicates that the query is for the configuration elements for the specified TLV.  The argument list specifies the specific elements to query.   If  no  argu‐
              ments are listed, then all configuration elements for the TLV are returned.

       -r     show raw client interface messages

       -R     show only raw Client interface messages

COMMANDS
       license
              show license information

       -h, help
              show usage information

       -v, version
              show version information

       -S, stats
              get LLDP statistics for the specified interface

       -t, get-tlv
              get TLV information for the specified interface

       -T, set-tlv
              set TLV information for the specified interface

       -l, get-lldp
              get LLDP parameters for the specified interface

       -L, set-lldp
              set LLDP parameters for the specified interface

       -p, ping
              display the process identifier of the running lldpad process

       -q, quit
              exit from interactive mode

ARGUMENTS
       This  section lists arguments which are available for administration of LLDP parameters.  Arguments for basic TLV's (non-organizationally specific TLVs) are also described.  See the SEE ALSO section
       for references to other lldptool man pages which contain usage details and arguments for various organizationally specific TLVs.


       adminStatus
              Argument for the get-lldp/set-lldp commands.  Configures the LLDP adminStatus parameter for the specified interface.  Valid values are: disabled, rx, tx, rxtx


       enableTx
              Argument for the get-tlv/set-tlv commands.  May be applied per interface for a specified TLV.  Valid values are: yes, no.  If the DCBX TLV enableTx is set to no, then all of the  DCB  feature
              TLVs DCBX advertise settings will be turned off as well.  Setting enableTx to yes will enable the DCBX advertise settings.


       ipv4   Argument  for  the  get-tlv/set-tlv  commands  with  respect  to the Management Address TLV.  The get command will retrieve the configured value.  Set values take the form of an IPv4 address:
              A.B.C.D


       ipv6   Argument for the get-tlv/set-tlv commands with respect to the Management Address TLV.  The get command will retrieve the configured value.  Set values  take  the  form  of  an  IPv6  address:
              1111:2222:3333:4444:5555:6666:7777:8888 and various shorthand variations.


EXAMPLES
       Configure LLDP adminStatus to Receive and Transmit for interface eth2
              lldptool -L -i eth2 adminStatus=rxtx
              lldptool set-lldp -i eth2 adminStatus=rxtx


       Query the LLDP adminStatus for interface eth3
              lldptool -l -i eth3 adminStatus
              lldptool get-lldp -i eth3 adminStatus


       Query the LLDP statistics for interface eth3
              lldptool -S -i eth3 adminStatus
              lldptool stats -i eth3 adminStatus


       Query the local TLVs which are being transmitted for a given interface:
              lldptool -t -i eth3
              lldptool get-tlv -i eth3


       Query the received neighbor TLVs received on a given interface:
              lldptool -t -n -i eth3
              lldptool get-tlv -n -i eth3


       Query the value of the System Description TLV as received from the neighbor on a given interface:
              lldptool -t -n -i eth3 -V sysDesc
              lldptool get-tlv -n -i eth3 -V 6


       Disable transmit of the IEEE 802.3 MAC/PHY Configuration Status TLV for a given interface:
              lldptool -T -i eth3 -V macPhyCfg enableTx=no
              lldptool set-tlv -i eth3 -V 0x120f01 enableTx=no


       Query value of the transmit setting for the Port Description TLV for a given interface:
              lldptool -t -i eth3 -V portDesc -c enableTx
              lldptool get-tlv -i eth3 -V 4 -c enableTx


       Set a Management Address TLV on eth3 to carry IPv4 address 192.168.10.10
              lldptool -T -i eth3 -V mngAddr ipv4=192.168.10.10


       Set a Management Address TLV on eth3 to carry IPv6 address ::192.168.10.10
              lldptool -T -i eth3 -V mngAddr ipv6=::192.168.10.10


       Get the configured IPv4 address for the Management Address TLV on eth3
              lldptool -t -i eth3 -V mngAddr -c ipv4


       Get all configured attributes for the Management Address TLV on eth3
              lldptool -t -i eth3 -V mngAddr -c


       Enable transmit of the Edge Virtual Bridging TLV for interface eth4
              lldptool -i eth4 -T -g ncb -V evbCfg enableTx=yes


       Enable transmit of VDP for interface eth4
              lldptool -i eth4 -T -V vdp enableTx=yes


       Display process identifier of lldpad
              lldptool -p


SEE ALSO
       lldptool-dcbx(8), lldptool-ets(8), lldptool-pfc(8), lldptool-app(8), lldptool-med(8), lldptool-vdp(8), lldptool-evb(8), lldptool-evb22(8), dcbtool(8), lldpad(8)


COPYRIGHT
       lldptool - LLDP agent configuration utility
       Copyright(c) 2007-2012 Intel Corporation.   Portions of lldptool are based on:

       hostapd-0.5.7

       Copyright
              (c) 2004-2008, Jouni Malinen <j@w1.fi>


LICENSE
       This program is free software; you can redistribute it and/or modify it under the terms and conditions of the GNU General Public License, version 2, as published by the Free Software Foundation.

       This  program  is  distributed in the hope it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
       Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin St - Fifth Floor,  Boston,  MA  02110-1301
       USA.

       The full GNU General Public License is included in this distribution in the file called "COPYING".

SUPPORT
       Contact Information: open-lldp Mailing List <lldp-devel@open-lldp.org>




open-lldp                                                                                        August 2012                                                                                      lldptool(8)
