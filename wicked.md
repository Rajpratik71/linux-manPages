WICKED(8)                                                                                  System Manager's Manual                                                                                  WICKED(8)



NAME
       wicked - network management utility

SYNOPSIS
       wicked [global-options] ifup [options] interface
       wicked [global-options] ifdown [options] interface
       wicked [global-options] ifreload [options] interface
       wicked [global-options] ifstatus [options] interface
       wicked [global-options] ifcheck [options] interface
       wicked [global-options] show-config [options] [interface]
       wicked [global-options] convert [options] [file ... ]
       wicked [global-options] show-xml [options] [interface]
       wicked [global-options] xpath [options] format...
       wicked [global-options] getnames [options] device...

DESCRIPTION
       wicked  offers access to the wicked network managment service from the command line. It can be used to display the current state of network devices, to bring interfaces up or down, or to check their
       operational status.

       Conceptually, the wicked network management system deals with two very distinct classes of information. One is the set of configuration files stored somewhere in the system; the other is the current
       configuration state maintained by the kernel and closely related system daemons like pppd(8) or openvpn(8).

       Currently, wicked only supports sysconfig style ifcfg- files. Data present in these config files is converted to an internal XML representation.

       The server only knows about the latter, but does not parse any configuration files, and does not maintain any state besides what is actually in effect. On the other hand, the client never probes the
       kernel directly to obtain the current system state. The client's job is to parse the configuration file(s) handed to it by the user, process and convert them  to  policies,  and  hand  them  off  to
       wickedd-nanny.  wickedd-nanny then performs device configuration when policy conditions have been met.

       The client, nanny and server processes communicate with each other over DBus.

OPTIONS
       wicked supports a set of options common to all subcommands. These options must precede the subcommand, as in

            # wicked --dry-run ifup eth0

       Currently, wicked supports the following list of options:

       --config filename
              By default, the daemon reads its configuration from /etc/wicked/common.xml.  The --config options allows you to specify a different configuration file.

       --log-level level
              Set log level to one of <error|warning|notice|info|debug>.

       --log-target target
              Set log target to one of <stderr|syslog>, optionally followed by a colon and target specific details.

                  stderr[:options] with the following options:
                      pid include program pid in each message

                  syslog[:facility[:options]] with following facilities:
                      user, daemon, local0 .. local7
                  and options:
                      perror log the message to stderr as well


       --debug facility
              Enable debugging for facility.  The list of available facilities can be obtained using "--debug help".

       --root-directory pathname
              Specify an alternative root directory from where to load files.  This applies to the client's configuration file as well as any interface configuration files.

       --dry-run
              skips  all calls to wickedd that would modify the current system settings, instead displaying the command that would be sent, along with an XML representation of the XML.  Helpful for getting
              a feel for how the utility and the protocol work, and for debugging.

              This does not work at the moment.

       --systemd
              Forces wicked to use the syslog target for logging.

       --transient
              Enables more detailed interface return codes.

ifup - bring up one or more interfaces
       To bring up interfaces, use wicked ifup.  This command supports a number of different modes of operations.  In its simplest form, you just give it the name of an interface, and it will bring up  the
       interface using the stored system configuration:

           # wicked ifup eth0

       This invocation makes wicked:
       1. Run the ibft extension to get all firmware type configurations
       2. Read all sysconfig network configuration files from /etc/sysconfig/network
       3. Read all XML network configuration files from /etc/wicked/ifconfig

       For  each  interface to be configured, wicked will generate a policy and pass this to wickedd-nanny. wickedd-nanny will then kick off applying the configuration to wickedd. wickedd then will perform
       the necessary steps to configure the interface.  These steps include assigning a static address, and starting DHCP and similar address configuration protocols as required.

       Instead of an interface name, you can also use the special names all or boot, which will tell wicked to bring up all interfaces.  The difference between all and boot is in behavior. When  using  the
       latter, wicked will ignore any interfaces that are not configured as boot time interfaces.

       It  is also possible to bring up interfaces that do not have a configuration stored in the system; using the --ifconfig option you can provide a configuration by specifying a path prefixed by a sup-
       ported schema. Again, you have to specify the name of the interface to bring up, or all to bring up all interfaces described in the file:

           # wicked ifup --ifconfig compat:/etc/sysconfig/network all
           # wicked ifup --ifconfig firmware:ibft:ethernet0 all

       Note that wicked attempts to bring up interfaces in a "reasonable order": for virtual interfaces like VLANs, bridges or bonds, it will always make sure  that  all  subordinate  devices  are  in  the
       required state before bringing up the virtual device itself.

       The ifup command supports the following options:

       --ifconfig pathname
              Specify an alternative source of network configuration, instead of obtaining the system's interface configuration.

              If  the  file name starts with the string compat:, wicked is instructed to load the interface configuration from files in the default "ifcfg" syntax, as described by the ifcfg(5) manual page.
              The string following the compat: prefix is interpreted as a directory name where wicked will scan for files with names matching ifcfg-* and related files, like routes and ifroute-*.

              The special name firmware: can be used to obtain the interface definition(s) from firmware services like iBFT.

       --mode identifier
              This can be used in conjunction with the special interface name all, in order to restrict the set of interfaces that will be brought up.  If this option is given, only those interface config-
              urations are considered that have a control <mode> element containing the given identifier.

              If the interface does not specify a <mode> element in its control section, then it defaults to boot.

       --boot-stage identifier
              This can be used in conjunction with the special interface name all, in order to restrict the set of interfaces that will be brought up.  If this option is given, only those interface config-
              urations are considered that have a <boot-stage> element containing the given identifier.

              If the interface does not specify a <boot-stage> element in its control section, then it defaults to default.

       --skip-origin configsource
              This can be used to ignore interfaces that have already been configured.  For instance, an interface that has been configured based on a firmware configuration (see option  --ifconfig  above)
              will  be  marked as having a configuration origin of firmware. When bringing up the remaining network interfaces, it is a good idea to not touch these.  This can be achieved by running wicked
              with the option --skip-origin firmware.

       --skip-active
              Ignore all interfaces that have already been brought up.

       --timeout seconds
              The default timeout for bringing up a network device is 5 seconds. If the interface fails to come up within this time, wicked will fail the device and and exit with an error code. All  inter-
              faces depending on the failed interface will fail as well.  --persistent Set interface into persistent mode (no regular ifdown allowed).

              Failed interfaces are left in an undefined state.

ifdown - bring down one or more interfaces
       This  command  does  the  reverse of ifup.  Again, you can give it either a specific interface name, or use the special name all to bring down all devices. When bringing down several interfaces, the
       utility tries to do this in a suitable order.

       The ifdown command supports the following options:

       --force state
              Forcefully put interface into a specified state. This option is applicable whether the interface is persistent or not. State can be one of:
                   device-down
                   device-exists
                   device-setup
                   protocols-up
                   firewall-up
                   device-up
                   link-up
                   link-authenticated
                   lldp-up

       --delete
              Attempts to delete an interface. This is equivalent to --force device-down.

       --no-delete
              Brings the specified interface to device-exists state. In other words, the interface is down, but not deleted. Persistent interfaces are ignored.

       --timeout seconds
              The default timeout for bringing down a network device is 5 seconds. If the interface fails to shut down within this time, wicked will fail the device and and exit with  an  error  code.  All
              interfaces that are used by the failed interface will fail as well.

              Failed interfaces are left in an undefined state.

ifreload - checks whether a configuration has changed, and applies accordingly.
       To  automatically  re-apply  changed  sections of a configuration for specified interfaces, use wicked ifreload. This command performs necessary ifdown/ifup operations and attempts to apply detected
       differences. For additional, see the uses cases below.

           # wicked ifreload eth0
           # wicked ifreload all

       There are 4 potential ifreload use cases:

       1. Configuration unchanged
           ifreload does not touch specified interfaces.
       2. Configuration changed
           performs ifdown followed by ifup with the new configuration on the
           specified interfaces.
       3. Configuration deleted
           performs ifdown --delete in order to remove the specified interfaces.
       4. New configuration added
           performs regular ifup on specified interfaces.

       This behavior can be fine-tuned using the following options:

       --ifconfig pathname
              Specify an alternative source of network configuration, instead of obtaining the system's interface configuration.

              If the file name starts with the string compat:, wicked is instructed to load the interface configuration from files in the default "ifcfg" syntax, as described by the ifcfg(5)  manual  page.
              The  string  following  the compat: prefix is interpreted as a path name. If this path name refers to a directory, wicked will scan it for files with names matching ifcfg-*.  If the path name
              refers to a regular file, it will parse this file, assuming it is an ifcfg file.

              The special name firmware: can be used to obtain the interface definition(s) from firmware services like iBFT.

       --persistent
              Set interface into persistent mode (no regular ifdown allowed).

ifstatus/show - displays detailed interface information.
       To display/diagnose system wide interface network configuration, use wicked ifstatus/show. ifstatus command additionally reads system wide configuration and so is usable by root only. The show vari-
       ant, on the other hand, deals with runtime configurations of existing interfaces only. Thus, it can be used by users.

           # wicked ifstatus eth0
           # wicked ifstatus all

       Example output for loopback interface:
           lo              up
                 link:     #1, state up
                 type:     loopback
                 cstate:   network-up
                 config:   compat:/etc/sysconfig/network/ifcfg-lo
                 leases:   ipv4 static granted
                 addr:     ipv4 127.0.0.1/8
                 addr:     ipv6 ::1/128

       This behavior can be fine-tuned using the following options:

       --quiet
              Used to obtain status return codes only. No information is output, so can be used for scrpiting.

       --brief
              Displays device status for specified interfaces.

       --ifconfig filenam
              Note that this is ifstatus specfic (ie. root only).  Used to alter the source of the specified interface configurations.

ifcheck - inspects particular interface details
       To inspect details such as interface presence, change in interface configuration, internal interface state (cstate) and persistent mode for specified interfaces, use wicked ifcheck. This command can
       be particularly helpful to script writers.

           # wicked ifcheck --missed eth0
           # wicked ifcheck --missed --changed all

       --ifconfig pathname
              Specify an alternative source of network configuration, instead of obtaining the system's interface configuration.

              If the file name starts with the string compat:, wicked is instructed to load the interface configuration from files in the old-style "ifcfg" syntax, as described by the ifcfg(5) manual page.
              The  string  following  the compat: prefix is interpreted as a path name. If this path name refers to a directory, wicked will scan it for files with names matching ifcfg-*.  If the path name
              refers to a regular file, it will parse this file, assuming it is an ifcfg file.

              The special name firmware: can be used to obtain the interface definition(s) from firmware services like iBFT.

       --quiet
              Used to obtain status return codes only. No information is output, so can be used for scrpiting.

       --missed
              Check if the interface is missed.

       --changed
              Check if the interface's configuration is changed.

       --state state-name
              Check if the interface is in the given state. Possible states:
                  none
                  device-down
                  device-exists
                  device-setup
                  protocols-up
                  firewall-up
                  device-up
                  link-up
                  link-authenticated
                  lldp-up
                  network-up

       --persistent
              Check if the interface is in persistent mode.

show-config - reads, conversts and displays all available configuration files.
       To display all available network configuration files in the internal XML format for specified sources (default is all sources), use wicked show-config. To specify the source, use one of the  follow-
       ing:
           firmware:
           compat:

           # wicked show-config
           # wicked show-config compat:

              This behavior can be fine-tuned using the following options:

       --raw  Filter from output all config meta-data.

       --output path
              By  default,  wicked will write the XML document to its standard output. Using this option, you can instruct it to write to a different file instead. If the specified path is a directory, the
              XML document will be split into separate files, one for each interface.

convert - convert configuration files to internal XML
       Wicked currently supports sysconfig ifcfg files, and internally converts them to XML. When invoked without arguments, this command will dump to stdout the XML document representation of all of  your
       ifcfg files.

       This behavior can be fine-tuned using the following options:

       --raw  Filter from output all config meta-data.

       --output path
              By  default,  wicked will write the XML document to its standard output. Using this option, you can instruct it to write to a different file instead. If the specified path is a directory, the
              XML document will be split into separate files, one for each interface.

       Note that convert is a variant is show-config, and is equivalent to: show-config compat:

getnames - obtain different names for an interface
       wicked can identify network devices via a number of different mechanisms, in addition to the usual interface name.  For instance, you can identify an Ethernet device using the permanent MAC  address
       programmed into the card's EEPROM, or via its PCI topology.

       For  the  convenience of management applications, wicked provides a function to retrieve all possible names for an interface names as XML. For each device specified on the command line, a <names> is
       printed, with zero or more <name> elements.

       The getnames command supports the following options:

       --modem
              Instead of querying network devices, interpret the given interface name as a modem device.

xpath - retrieve data from an XML blob
       The wickedd server can be enhanced to support new network device types via extension commands — usually shell scripts. When invoking such a script, wickedd will hand it the  arguments  of  the  DBus
       call as an XML document.

       The  xpathP  command tries to provide a flexible and convenient interface for extracting individual bits of information from an XML document. To the degree that XML can be convenient to a shell pro-
       grammer...

       For this, wicked supports expressions using a (subset of) the XPATH 1.0 syntax. These xpath expressions can be embedded into format strings using "%{expression}".  Several expressions can be  embed-
       ded into one format string; this can help to combine pairs of information such as e.g. address and prefix length.

       The xpath command by default expects an XML document on standard input.  You can use the --file option to specify a filename.

       The xpath command supports the following options:

       --reference xpath-expr
              By  default,  the  command will evaluate all XPATH expressions relative to the document's root node. Using this option allows you to "drill into" the document: the utility will first evaluate
              the given expression to look up 0 or more XML nodes in the document, and then evaluate all format strings relative to these nodes. It is an error for the reference expression  to  yield  data
              other than XML elements (such as strings).

       --file filename
              The file containing the XML document to operate on.

       This manual page cannot give a full overview of xpath, of course, however consider the following examples (which assume the input is an XML interface description):

       # wicked xpath "vlan_tag=%{/interface/vlan/tag}"

       Given  a  VLAN  interface  definition, this will expand to the contents of the <tag> element of the VLAN definition. The "path-like" syntax specifies how to traverse the XML tree to find the desired
       node.  Assuming the tag is 42, the above command will print vlan_tag=42.  In case the document contains several VLAN interface definitions, this would of course print several lines  of  output;  one
       per VLAN tag found.

       Note  that the xpath command considers an empty expansion as error.  If an element or expansion is considered optional, you can prefix it with a question mark, as in %{?...}. If the expansion fails,
       the expression will be replaced with an empty string.

       As a different example, consider a bridge definition like the following:

       <bridge>
         <ports>
           <e>
            <device>eth0</device>
            <priority>1</priority>
           </e>
           <e>
            <device>eth1</device>
            <priority>0</priority>
           </e>
         </ports>
       </bridge>

       In order to print out a list of device/priority pairs of all ports, you could invoke wicked like this:

       # wicked xpath --reference "/bridge/ports/e" \
                 "dev=%{device} priority=%{?priority}"

       By using the --reference option, you instruct wicked to loop over all XML nodes matching this expression - i.e. the two child nodes of the <ports> element. For  each  of  them  in  turn,  the  xpath
       expression is evaluated relative to each node. Note the use of the question mark in the priority term, marking the field as optional.

SEE ALSO
       wickedd(8), wicked-config(5).

COPYRIGHT
       Copyright (C) 2014 SUSE LINUX Products GmbH, Nuernberg, Germany.

BUGS
       Please report bugs at <https://bugzilla.novell.com/index.cgi>

AUTHORS
       Olaf Kirch Pawel Wieczorkiewicz Karol Mroz



                                                                                                 16 July 2012                                                                                       WICKED(8)
