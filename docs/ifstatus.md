IFUP(8)                                                                                     Network configuration                                                                                     IFUP(8)



NAME
       ifup - start a pre-configured network interface.
       ifdown - stop a (pre-configured) network interface.
       ifstatus - show the state of a (pre-configured) network interface.
       ifprobe - checks if the configuration for the interface has changed


SYNOPSIS
       if{up,down,status,probe} [ <configuration-name> ] <interface> [-o options ]


NOTATION
       We  use  the terms configuration, interface and device in a dedicated way. A device is always a piece of hardware representing a network interface, a PCI or PCMCIA card or a USB device. An interface
       then is the name of the network interface it gets from the kernel, when the device has been registered. A configuration is a set of parameters which can be assigned to an interface like IP addresses
       or routes.


DESCRIPTION
       ifup is used to bring up a pre-configured interface for networking. It is usually invoked by the network script at boot time or by the PCMCIA/hotplug system.  It can also be used to start interfaces
       manually on the command line.  It activates the link, adds addresses and other parameters and sets up the routes for an interface.
       Former iprenew operation is performed upon each successfull ifup call.

       ifdown is used to set down the interface and flush all its addresses. It is possible to let ifdown check the interface if it is still used before setting it down.  If configured it may then get  rid
       of the using processes or refuse setting it down. Have a look at /etc/sysconfig/network/config to enable this feature.

       ifstatus checks if the interface and its routes were set up properly.

       ifprobe checks if any of the configuration files for this interface have been changed since the interface is up.

       <interface> is the network interface name.
       The network interface names of physical network devices are assigned by the kernel and may be modified by udev(7) rules.

       <configuration-name> This optional parameter exists for compatibility reasons only and is not used.


OPTIONS
       The following are options to be specified after the -o switch.

       debug  Be verbose.

       quiet  Silent mode. Feedback only via return code.

       force  Applicable to ifdown only. Forces persistent (nfsroot type) interface down.


FILES
       /sbin/ifup
              The script itself.
       /etc/sysconfig/network/config
              General configuration options. See section GENERAL VARIABLES below.
       /etc/sysconfig/network/ifcfg- <configuration-name>
              The files containing the configuration of the devices.  An example that shows a typical configuration with the name ifcfg-eth0:

              IPADDRESS=10.10.11.184
              NETMASK=255.255.0.0
              BROADCAST=10.10.255.255
              STARTMODE=onboot
              BOOTPROTO=static

       /etc/sysconfig/network/ifroute- <configuration-name>
              You can specify individual routes for every configuration in these files. See routes (5) for a detailed description.


GENERAL VARIABLES
       There  are  some general settings in the file /etc/sysconfig/network/config.  If needed you can also set most of the general variables as an individual variable in the ifcfg-* files.  Please see the
       description of these variables in /etc/sysconfig/network/config.

       For dhcp there are additional global options in /etc/sysconfig/network/dhcp.  Also these are described there and can be used individually in ifcfg-* files.


DIAGNOSTICS
       ifstatus interface

       wicked generates debug output when called with debug option set to a particular facility (e.g. all). Please use it, when something wrong is happening.


COPYRIGHT
       Copyright (C) 2014 SUSE LINUX Products GmbH, Nuernberg, Germany.

BUGS
       Please report bugs at <https://bugzilla.novell.com/index.cgi>

AUTHORS
       Pawel Wieczorkiewicz

SEE ALSO
       ifcfg(5), routes(5), wicked(8), ifcfg-wireless(5), ifcfg-tunnel(5), ifcfg-vlan(5), ifcfg-bonding(5),



wicked                                                                                           August 2004                                                                                          IFUP(8)
