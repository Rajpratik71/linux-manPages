dcbtool(8)                                                                                 System Manager's Manual                                                                                 dcbtool(8)



NAME
       dcbtool - manage the Data Center Bridging (DCB) settings of a CEE DCB interface

SYNOPSIS
       dcbtool -h
       dcbtool -v
       dcbtool [-rR]
       dcbtool [-rR] [command] [command arguments]


DESCRIPTION
       dcbtool  is  used to query and set the DCB settings of a Converged Enhanced Ethernet (CEE) DCB capable Ethernet interface.  It connects to the client interface of lldpad to perform these operations.
       dcbtool will operate in interactive mode if it is executed without a command.  In interactive mode, dcbtool also functions as an event listener and will print out events received from lldpad as they
       arrive. It will use libreadline for interactive input when available. 802.1Qaz DCBX is not controllable from dcbtool instead lldptool can be used in this case.

OPTIONS
       -h     show the dcbtool usage message

       -v     shows dcbtool version information

       -r     display the raw lldpad client interface messages as well as the readable output.

       -R     display only the raw lldpad client interface messages

COMMANDS
       help   shows the dcbtool usage message

       ping   test command.  lldpad responds with "PPONG" if the client interface is operational.

       license
              displays dcbtool license information

       quit   exit from interactive mode


       The following commands interact with lldpad to manage the daemon and DCB features on DCB capable interfaces.

       dcbtool general configuration commands:

       <gc|go> dcbx
              Get  the configured or operational legacy version of the DCBX protocol which will be supported by lldpad.  The configured version, if different from the operational version,  will take effect
              after lldpad is restarted.

       sc dcbx v:[cin|cee|force-cin|force-cee]
              Set the legacy version of DCBX which will be supported by lldpad the next time it is started.
              Information about the CIN version can be found at:
              <http://download.intel.com/technology/eedc/dcb_cep_spec.pdf>
              Information about the CEE version can be found at:
              <http://www.ieee802.org/1/files/public/docs2008/az-wadekar-dcbx-capability-exchange-discovery-protocol-1108-v1.01.pdf>
              The dcbx setting is a global setting and changes only take effect when lldpad is restarted.  The default DCBX version used is the IEEE  standard  version.   If  a  pre-IEEE  DCBX  version  is
              received (per port) which matches the dcbx setting, then lldpad will fall back to the configured global dcbx setting.  If the dcbx setting is set to either 'force-cin' or 'force-cee' then any
              port doing DCBX will start out in the corresponding legacy DCBX mode.

       DCB per-interface commands:

       gc <ifname> <feature>
              get configuration of feature on interface ifname.

       go <ifname> <feature>
              get operational status of feature on interface ifname.

       gp <ifname> <feature>
              get peer configuration of feature on interface ifname.

       sc <ifname> <feature> <args>
              set the configuration of feature on interface ifname.

       feature may be one of the following:

       dcb    DCB state of the port

       pg     priority groups

       pfc    priority flow control

       app:<subtype>
              application specific data

       ll:<subtype>
              logical link status

       subtype can be:

       0|fcoe Fiber Channel over Ethernet (FCoE)

       1|iscsi
              Internet Small Computer System Interface (iSCSI)

       2|fip  FCoE Initialization Protocol (FIP)

       args can include:

       e:<0|1>
              controls feature enable

       a:<0|1>
              controls whether the feature is advertised via DCBX to the peer

       w:<0|1>
              controls whether the feature is willing to change its operational configuration based on what is received from the peer

       [feature specific args]
              arguments specific to a DCB feature


       Feature specific arguments for dcb:

       on|off enable or disable DCB for the interface.  The go and gp commands are not needed for the dcb feature.  Also, the enable(e), advertise(a) and willing(w) arguments are not required.


       Feature specific arguments for pg:

       pgid:xxxxxxxx
              Priority group ID for the 8 priorities.  From left to right (priorities 0-7), x is the corresponding priority group ID value, which can be 0-7 for priority groups with  bandwidth  allocations
              or f (priority group ID 15) for the unrestricted priority group.


       pgpct:x,x,x,x,x,x,x,x
              Priority  group  percentage of link bandwidth.  From left to right (priority groups 0-7), x is the percentage of link bandwidth allocated to the corresponding priority group.  The total band‐
              width must equal 100%.


       uppct:x,x,x,x,x,x,x,x
              Priority percentage of priority group bandwidth.  From left to right (priorities 0-7), x is the percentage of priority group bandwidth allocated to the corresponding  priority.   The  sum  of
              percentages for priorities which belong to the same priority group must total 100% (except for priority group 15).


       strict:xxxxxxxx
              Strict priority setting.  From left to right (priorities 0-7), x is 0 or 1.  1 indicates that the priority may utilize all of the bandwidth allocated to its priority group.


       up2tc:xxxxxxxx
              Priority to traffic class mapping.  From left to right (priorities 0-7), x is the traffic class (0-7) to which the priority is mapped.


       Feature specific arguments for pfc:

       pfcup:xxxxxxxx
              Enable/disable priority flow control.  From left to right (priorities 0-7), x is 0 or 1.  1 indicates that the corresponding priority is configured to transmit priority pause.


       Feature specific arguments for app:<subtype>:
              The app features uses global enable and willing bits for all subtypes. To remove or add subtypes to the TLV set the advertise bit.


       appcfg:xx
              xx  is  a  hexadecimal  value representing an 8 bit bitmap where 1 bits indicate the priorities which frames for the applications specified by subtype should use. The lowest order bit maps to
              priority 0.


       Feature specific arguments for ll:<subtype>:

       status:[0|1]
              For testing purposes, the logical link status may be set to 0 or 1.  Changes to the logical link status are not saved in the configuration file.


EXAMPLES
       Enable DCB on interface eth2

       dcbtool sc eth2 dcb on


       Assign priorities 0-3 to priority group 0, priorities 4-6 to priority group 1 and priority 7 to the unrestricted priority.  Also, allocate 25% of link bandwidth to priority group 0 and 75% to  group
       1.

       dcbtool sc eth2 pg pgid:0000111f pgpct:25,75,0,0,0,0,0,0


       Enable transmit of Priority Flow Control for priority 3 and assign FCoE to priority 3.

       dcbtool sc eth2 pfc pfcup:00010000
       dcbtool sc eth2 app:0 appcfg:08


SEE ALSO
       lldpad(8), lldptool(8), lldptool-dcbx(8), lldptool-ets(8), lldptool-pfc(8), lldptool-app(8)


COPYRIGHT
       dcbtool - DCB configuration utility
       Copyright(c) 2007-2012 Intel Corporation.   Portions of dcbtool are based on:

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




                                                                                                March 23, 2012                                                                                     dcbtool(8)
