lldpad(8)                                                                                  System Manager's Manual                                                                                  lldpad(8)



NAME
       lldpad - Link Layer Discovery Protocol (LLDP) agent daemon

SYNOPSIS
       lldpad [-h] [-v] [-V level] [-d] [-k] [-p] [-s] [-t] [-f filename]

DESCRIPTION
       Executes the LLDP protocol for supported network interfaces.  The list of TLVs currently supported are:

       -      IEEE 802.1AB Mandatory TLVs

       -      IEEE 802.1AB Basic Management TLVs

       -      IEEE 802.3 Organizationally Specific TLVs

       -      LLDP-MED Organizationally Specific TLVs

       -      Data Center Bridging capabilities exchange protocol (DCBX) TLVs

       -      Edge Virtual Bridging (EVB) TLVs

       Capabilities of lldpad include:

       -      Transmission of LLDP PDUs containing enabled TLVs from enabled ports.

       -      Reception of LLDP PDUs from enabled ports.

       -      Operation  of the DCBX protocol for interfaces which support the DCB rtnetlink interface.  This includes operation of the DCBX state machines above LLDP and corresponding configuration of the
              DCB parameters of the network interface.  Supported DCB features are: Extended Transmission Selection, Priority Flow Control and the FCoE application.

       -      Configuring the DCB settings of the network driver based on the operation of DCBX.

       -      Provides a multi-channel interface for client applications to query and configure features.  Events are also generated on the client interface to inform clients of changes.  The lldpad  pack‐
              age includes two clients:  lldptool for general LLDP agent management and dcbtool for DCB management.

       lldpad supports the versions of the DCB capabilities exchange (DCBX) protocol listed as follows:

       version 1 - also known as CIN DCBX
              <http://download.intel.com/technology/eedc/dcb_cep_spec.pdf>

       version 2 - also known as CEE DCBX
              <http://www.ieee802.org/1/files/public/docs2008/az-wadekar-dcbx-capability-exchange-discovery-protocol-1108-v1.01.pdf>

       IEEE DCBX
              See the IEEE 802.1Qaz-2011 specification for details.

       IEEE  DCBX  is  the  default DCBX mode for a DCB capable interface so the default and configured IEEE DCBX TLVs will be transmitted when the interface comes up.  lldpad can be globally configured to
       support one of the legacy DCBX versions (CIN or CEE).  If the remote LLDP agent does not transmit any IEEE DCBX TLVs and does transmit a legacy DCBX TLV which matches the configured legacy DCBX ver‐
       sion,  then  the  DCBX  mode will drop back to legacy DCBX mode.  It will not transition back to IEEE DCBX mode until the next link reset.  If lldpad has dropped back to legacy DCBX mode for a given
       interface and the daemon is stopped and restarted, the legacy DCBX mode for that interface will be used instead of starting out in IEEE DCBX mode.  This behavior only applies to the case where  lld‐
       pad is restarted and is not persistent across a system reboot.

       See dcbtool for information on how to globally configure which legacy version of DCBX lldpad executes.

       See lldptool for information on how to reset the DCBX mode of an interface back to default (starts out in IEEE DCBX mode).

       lldpad also supports edge virtual bridging as currently under specification in the IEEE 802.1Qb working group.  <http://www.ieee802.org/1/pages/802.1bg.html>


OPTIONS
       lldpad has the following command line options:

       -h     show usage information

       -f filename
              use  the specified file as the configuration file instead of the default file: /var/lib/lldpad/lldpad.conf lldpad expects the directory of the configuration file to exist, but if the configu‐
              ration file does not exist, then a default configuration file will be created.  lldpad creates and maintains the contents of the configuration file.   Configuration  should  be  performed  by
              using lldptool or dcbtool.

       -d     run lldpad as a daemon

       -v     show lldpad version

       -V level
              set lldpad debugging level. Uses syslog debug levels see syslog.2 for details.

       -k     used  to  terminate  the first instance of lldpad that was started (e.g. from initrd).  Once lldpad -k has been invoked and lldpad has been restarted, subsequent invocations of lldpad -k will
              not terminate lldpad.


       -s     remove lldpad state records from shared memory

       -p     do not create PID file /var/run/lldpad.pid on startup

       -t     omit timestamps from logging messages

NOTE
       On termination, lldpad does not undo any of the configurations that it has set. This approach minimizes the risk of restarting the daemon to perform a software update, or of  having  storage  issues
       during shutdown. Ongoing operation of network interfaces that had been controlled by lldpad may result in unexpected behavior.


SEE ALSO
       dcbtool(8), lldptool(8), lldptool-dcbx(8), lldptool-ets(8), lldptool-pfc(8), lldptool-app(8), lldptool-med(8), lldptool-vdp(8), lldptool-evb(8)


COPYRIGHT
       lldpad - LLDP agent daemon with DCBX support
       Copyright(c) 2007-2012 Intel Corporation.   Portions of lldpad  are based on:

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



                                                                                                March 23, 2012                                                                                      lldpad(8)
