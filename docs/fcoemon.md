FCOEMON(8)                                                                                     Open-FCoE Tools                                                                                     FCOEMON(8)



NAME
       fcoemon - Open-FCoE service daemon

SYNOPSIS
       fcoemon [-f|--foreground] [-l|--legacy] [-d|--debug] [-s|--syslog]

       fcoemon -h|--help

       fcoemon -v|--version

DESCRIPTION
       The fcoemon daemon is the core component of the Open-FCoE management service.

       The  primary  function  of  fcoemon  is  to control FCoE instances. fcoemon will create, destroy, reset, enable and disable FCoE instances based on system configuration, administrative commands, and
       runtime events.

       On startup, fcoemon will create FCoE instances defined by the configuration files (see FILES section below). Since FCoE typically relies on the Data Center Bridging (DCB) capabilities of an Ethernet
       interface, fcoemon establishes a connection with the LLDP daemon lldpad to query the status of the DCB features on relevant Ethernet interfaces and receive DCB configuration change events.

       During  runtime, fcoemon will monitor network and lldpad events for the relevant Ethernet interfaces and perform appropriate actions (create, destroy, enable, disable) on the FCoE instances. fcoemon
       also provides a client interface via which the fcoeadm utility is able to issue commands.

       Installation of the fcoe-utils package will set up an fcoe service which will control the execution of the fcoemon daemon.

OPTIONS
       -f, --foreground
           Run fcoemon in the foreground.

       -d, --debug
           Enable debugging messages.

       -l, --legacy
           Force fcoemon to use the legacy /sys/module/libfcoe/parameters/ interface. The default is to use the newer /sys/bus/fcoe/ interfaces if they are available.

       -s, --syslog
           Use syslogd for logging. The default behavior is to log to stdout and stderr.

       -h, --help
           Show help message with basic usage instructions

       -v, --version
           Show the version of the fcoemon command.

TERMINOLOGY
       DCB
           Data Center Bridging A set of Ethernet enhancement standards developed by the IEEE 802.1 Working Group.


           See http://www.ieee802.org/1/pages/dcbridges.html for more information.

       DCBX
           DCB Capabilities Exchange Protocol, implemented by the DCB module of lldpad. DCBX exchanges DCB capabilities and configuration with a link partner as a series of  values  transferred  using  the
           Link Layer Discovery Protocol (LLDP).

       PFC
           Priority-based Flow Control, a DCB feature.

       App:FCoE
           The FCoE instance of application specific parameters in DCBX.

CRITERIA USED FOR CONTROLLING THE FCOE INSTANCE
       fcoemon  uses  two information sources for determining when to create an FCoE instance: the state of the network interface, which may be a VLAN interface, and, if required for the FCoE instance, the
       state of the DCB configuration on the physical Ethernet interface.

       First of all, the network interface must be "up" for the FCoE instance to be created. Secondly, if the FCoE configuration indicates that  DCB  is  required,  then  the  following  criteria  must  be
       satisfied before the FCoE interface is created:

       ·   DCB is enabled on the Ethernet interface.

       ·   The PFC DCB feature is enabled and operational.

       ·   The App:FCoE DCB feature is enabled and operational.

       ·   The priority indicated by the App:FCoE feature is also enabled for PFC.

       Once the FCoE instance is created by fcoemon, it will only be destroyed under the following conditions:

       ·   The driver for the Ethernet interface is unloaded.

       ·   A user administratively destroys the FCoE instance using fcoeadm.

       ·   The fcoemon daemon is terminated.

       If DCB is required for the FCoE instance, and the DCB settings change after the interface is created, the following criteria are used to disable the FCoE instance:

       ·   DCB is disabled on the Ethernet interface.

       ·   The App:FCoE DCB feature is not enabled.

       ·   The App:FCoE and PFC features are operational AND the priority indicated by App:FCoE is not enabled for PFC.

       Otherwise, the FCoE instance will always remain enabled.

CONFIGURATION
       Once  the  fcoe-utils  and lldpad packages have been installed and the corresponding services are running, there are a few simple configuration steps required to get an FCoE instance up and running.
       The following assumes that DCB will be required for the interface.

       ·   Ensure that the configuration on the peer device (e.g. FCoE capable switch) has the necessary configurations (VLANs, DCB, DCBX).

       ·   Configure any needed VLAN interfaces on the local system.

       ·   Create and configure /etc/fcoe/cfg-<ifname> files for the network interfaces over which FCoE instances need to be created. See the FILES sections for details. Note that ifname may be for a  VLAN
           interface.

       ·   Restart the fcoe service (i.e.  fcoemon).

       ·   The default DCB configuration of an Ethernet interface managed by lldpad requires the following configuration using dcbtool.

               dcbtool sc ethX dcb on          <-- enable DCB on the interface
               dcbtool sc ethX app:fcoe e:1    <-- enable App:FCoE on the interface

       These  steps only need to be done one time. Note that if other DCB configuration changes have been made with dcbtool, then additional changes may need to be made in order to satisfy the DCB criteria
       for creating an FCoE instance. Consult dcbtool for details.

       Once these configuration steps have been performed, use fcoeadm to query the status of the FCoE instances.

FILES
   /etc/fcoe/config
       This is the primary configuration file for the fcoe system service. The default options in this file are: DEBUG="no" and USE_SYSLOG="yes". The former is used to enable debugging  messages  from  the
       fcoe service script and fcoemon (via the --debug option). The latter is to indicate if the log messages are to be output to the system log (via the --syslog option). SUPPORTED_DRIVERS is the list of
       drivers to automatically load during fcoe service start. Any changes to this file will require a restart of the fcoe service.

   /etc/sysconfig/fcoe
       On systemd-enabled systems, this is the primary configuration file used for the fcoe system service. Add --debug to FCOEMON_OPTS to enable debug log messages. Any changes to this file will require a
       restart of the fcoe service.

   /etc/fcoe/cfg-<ifname>
       These  files  are  read  by  fcoemon  on  initialization. They are used to indicate which Ethernet or VLAN interfaces should have FCoE instances created. The option values in this file normally are:
       FCOE_ENABLE="yes", DCB_REQUIRED="yes", and AUTO_VLAN="yes", though if the variable values are omitted, they default to "no".

       FCOE_ENABLE
           is used to enable/disable creation of the FCoE instance. If FCoE_ENABLE is set to "no", then the other configuration values have no effect.

       DCB_REQUIRED
           indicates if the DCB service is required on the Ethernet interface.

       AUTO_VLAN
           indicates if VLAN discovery should be performed. If AUTO_VLAN is set to "yes", then once the link configuration has been validated, fcoemon will run run the FIP VLAN discovery  protocol  on  the
           Ethernet interface. Network interfaces for any discovered FCoE VLANs will be automatically created, if they are not already configured, and FCoE instances will be created on the VLAN interfaces.
           If the network interface specified by the filename is already a VLAN interface, the AUTO_VLAN setting is ignored.

       MODE
           indicates whether operation will be in fabric or vn2vn mode. The default is fabric.

       FIP_RESP
           indicates whether a FIP responder should be activated on this device to support VLAN discovery in a vn2vn environment. The default is "no". Often this will be used on a vn2vn node  also  serving
           as  a target. When using this option, the AUTO_VLAN should not be set and the supported VLANs should have configuration files supplied, constituting a static VLAN configuration that provides the
           information for the FIP responder to return. This should be set on a base device, which should probably have FCOE_ENABLE set to "no" since presumably FCoE operation will  be  on  the  configured
           VLANs.

       Note that the attached Ethernet peer device (e.g. FCoE capable switch port) must have compatible settings For DCB and FCoE to function properly.

   /etc/init.d/fcoe
       This  is the fcoe system service script. This script is invoked by the init process or by the service command to start and stop the fcoemon. On systemd-enabled systems, fcoemon is controlled via the
       fcoe.service unit.

VLAN NAMING CONVENTIONS
       If a new VLAN device is created (see the description of the AUTO_VLAN setting above), it will have the name dev.vlan-fcoe; where dev is the name of  the  Ethernet  parent  device  and  vlan  is  the
       discovered VLAN ID number.

SEE ALSO
       fcoeadm(8) lldpad(8) lldptool(8) dcbtool(8)

SUPPORT
       fcoemon is part of the fcoe-utils package, maintained through the Open-FCoE project. Resources for both developers and users can be found at the Open-FCoE website http://open-fcoe.org/



Open-FCoE                                                                                         09/30/2015                                                                                       FCOEMON(8)
