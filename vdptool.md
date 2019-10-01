vdptool(8)                                                                                          Linux                                                                                          vdptool(8)



NAME
       vdptool - manage the VSI associations and status of lldpad

SYNOPSIS
       vdptool <command> [options] [argument]

DESCRIPTION
       vdptool  is  used  to  query and configure the VSI associations in lldpad.  Only the ratified stardard version of the VDP protocol (also refered to as vdp22) is supported.  It connects to the client
       interface of lldpad to perform these operations.  vdptool will operate in interactive mode if it is executed without a command.  In interactive mode, vdptool will also function as an event  listener
       to print out events as they are received asynchronously from lldpad(still to be done).  It will use libreadline for interactive input when available (still to be done).

OPTIONS
       -i [ifname]
              specifies the network interface to which the command applies.  Most vdptool commands require specifying a network interface.

       -V [tlvid]
              specifies the VDP tlv identifier to be set or queried.
              The  tlvid  is  an  integer value used to identify specific VDP TLVs.  The tlvid value is the type value for types not equal to 127 (the organizationally specific type).  For organizationally
              specific TLVs, the tlvid is the value represented by the 3 byte OUI and 1 byte subtype - where the subtype is the lowest order byte of the tlvid.
              The tlvid can be entered as a numerical value (e.g. 10 or 0xa), or for supported TLVs, as a keyword (such as assoc, deassoc, preassoc, preassoc-rr, etc).  Review the vdptool  help  output  to
              see the list of supported TLV keywords.

              Use option -c to specify the parameters and its values to be set or queried.

       -n     "neighbor" option for commands which can use it (e.g. get-tlv).  Use this flag to retrieve the last VDP22 data returned from the bridge.  (not yet supported).

       -c <argument list>
              Specifies  additional  parameters  for  TLV queries and associations commands.  The argument list varies, depending on the command option (-T) or (-t).  To establish a VSI association use the
              command option (-T) and specify additional information as arguments in the form of key=value. See the VSI Parameter subsection and Example section below.  To query a VSI specific  association
              use the command option (-t) and specify the value of the VSI Instance Identifier (keywork uuid followed be the VSI UUID value) of the VSI association as configuration parameter.

       -r     show raw client interface messages

       -R     show only raw Client interface messages

       -W     Wait for the bridge response message

   VSI Parameter
       Each  VDP22  TLVs  contains  a  command mode, manager identifier, type identifier, type identifier version, VSI instance identifier, migration hints and filter information.  The fields are explained
       next:

       mode (Command Mode):
              The command mode determines the type of the VSI association to be established.  It is an ascii string can be one of:

              assoc: Create an VSI association.

              preassoc:
                     Create an VSI preassociation. The association is only announced to the switch.

              preassoc-rr:
                     Create an VSI preassociation. The association is only announced to the switch and the switch should reserve the resources.

              deassoc:
                     Delete an VSI association.
       Other strings are not recognized and return an error.

       mgrid2 (Manager identifier):
              The manager identifier is a string of up to 16 alphanumeric characters.  It can also be an UUID according to RFC 4122 with optional dashes in between.

       typeid (Type Identifier):
              The type identifier is a number in the range of 0 to 2^24 - 1.

       typeidver (Type Identifier Version):
              The type identifer version is a number in the range of 0 to 255.

       uuid (VSI Instance Identifier):
              The VSI instance identifier is an UUID according to RFC 4122 with optional dashes in between.

       hints (Migration Hints):
              The migration hints is a string aiding in migration of virtual machines:

              none:  No hints available.

              from:  The virtual machine is migrating away.

              to:    The virtual machine is migrating to.

       fid (Filter Information Data):
              The filter information data can be supplied in four different formats identified by numbers in parathesis.  Multiple filter information fields can be supplied, but all have to be of the  same
              format.

              vlan (1)
                     A  vlan  number  only,  also known as filter information format 1.  The vlan identifier is a number in the range of 1 to 2^16 - 1.  The high order 4 bits are used as quality of service
                     bits.  The vlan identifier can be zero, a vlan identifier is then selected by the switch. Refer to IEEE 802.1 Qbg ratified standard for details.

              vlan-mac (2)
                     A vlan number and MAC address delimited by a slash ('-'), also known as filter information format 2.  The MAC address is specified in the  format  xx:xx:xx:xx:xx:xx.   The  colons  are
                     mandatory.  For vlan details see (1).

              vlan-mac-group (4)
                     A vlan number, MAC address and group identifier, each delimited by a slash ('-'), also known as filter information format 4.  The group identifier is a 32 bit number.  For vlan and MAC
                     address details see (1) and (2).

              vlan--group (3)
                     A vlan number and group identifier, delimited by two slashes ('--'), also known as filter information format 3.  For vlan and group details see (1) and (4).

       oui (Organizationally Unique Identifier):
              This defines the optional Organizationally defined information field. This contains the specific sets of values for this entry. There can be multiple organizational specific fields, in  which
              case there will be multiple keywords oui= followed by the values.  The value is of the following format:
              oui=OUI,[Organization specific values ]
              The OUI specifies the name of the Organization that is responsible for defining this content. A comma is mandatory after the OUI field. The fields following this
               is specified by the organization and hence will be decoded based on the value of this OUI field. Currently, the following values for OUI are supported.

              cisco  Specifies Cisco defined OUI.


       COMMANDS

       license
              show license information

       -h, help
              show usage information

       -v, version
              show version information

       -t, get-vsi
              get VSI information for the specified interface

       -T, set-vsi
              set VSI information for the specified interface

       -p, ping
              display the process identifier of the running lldpad process

       -q, quit
              exit from interactive mode

NOTES
       This tool is in its early design and development phase.  It it buggy, incomplete and most of the ideas have not even been thought of....  It reflects the current state of development when I had been
       given another work assignment.  I append it so some else can continue to work on this.

EXAMPLES
       Display process identifier of lldpad
              vdptool -p

       Create a VSI association on interface eth2
              vdptool -i eth2 -T -V assoc -c mode=assoc -c mgrid2=blabla \
                   -c typeid=5 -c uuid=1122 -c typeidver=4 -c hints=none \
                   -c filter=2-52:00:00:11:22:33-200

       Create a VSI association on interface eth2 and wait for the
              response from the bridge
              vdptool -i eth2 -T -W -V assoc -c mode=assoc -c mgrid2=blabla \
                   -c typeid=5 -c uuid=1122 -c typeidver=4 -c hints=none \
                   -c filter=0-52:00:00:11:22:33-200

       Create a VSI association on interface eth2 wth OUI parameters
              and wait for the response from the bridge
              vdptool -i eth2 -T -W -V assoc -c mode=assoc -c mgrid2=blabla \
                   -c typeid=5 -c uuid=1122 -c typeidver=4 -c hints=none \
                   -c filter=0-52:00:00:11:22:33-200 -c oui=CompanyA,data

       Create a VSI association on interface eth2 wth multiple OUI parameters
              and wait for the response from the bridge
              vdptool -i eth2 -T -W -V assoc -c mode=assoc -c mgrid2=blabla \
                   -c typeid=5 -c uuid=1122 -c typeidver=4 -c hints=none \
                   -c filter=0-52:00:00:11:22:33-200 -c oui=CompanyA,data \
                   -c oui=CompanyB,data


       Query all VSI association on interface eth2
              vdptool -i eth2 -t -V assoc


       Query  VSI association on interface eth2 that matches specific
              VSI parameters. Any of the VSI parameters below can be omitted.
              vdptool -i eth2 -t -V assoc -t -V assoc -c mode=assoc \
                      -c mgrid2=blabla -c typeid=5 -c uuid=1122 \
                      -c typeidver=4 -c hints=none

SEE ALSO
       lldptool-dcbx(8), lldptool-ets(8), lldptool-pfc(8), lldptool-app(8), lldptool-med(8), lldptool-vdp(8), lldptool-evb(8), lldptool-evb22(8), dcbtool(8), lldpad(8)

COPYRIGHT
       vdptool - VSI configuration utility

       Copyright(c)
              (c) 2014 IBM Corporation.   Portions of vdptool are based on:

       open-lldp-0.96

       lldptool - LLDP agent configuration utility

       Copyright(c)
              2007-2012 Intel Corporation.   Portions of lldptool are based on:

       hostapd-0.5.7

       Copyright
              (c) 2004-2008, Jouni Malinen <j@w1.fi>


LICENSE
       This program is free software; you can redistribute it and/or modify it under the terms and conditions of the GNU General Public License, version 2, as published by the Free Software Foundation.

       This program is distributed in the hope it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See  the  GNU  General
       Public License for more details.

       You  should  have  received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301
       USA.

       The full GNU General Public License is included in this distribution in the file called "COPYING".

SUPPORT
       Contact Information: open-lldp Mailing List <lldp-devel@open-lldp.org>



open-lldp                                                                                         April 2014                                                                                       vdptool(8)
