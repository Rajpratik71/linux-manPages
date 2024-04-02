ipmievd(8)                                                                                                                                                                                         ipmievd(8)



NAME
       ipmievd - IPMI event daemon for sending events to syslog

SYNOPSIS
       ipmievd [-c|-h|-d N|-v|-V] -I open <open | sel> [<option>]

       ipmievd [-c|-h|-v|-V] -I lan -H <hostname>
               [-p <port>]
               [-U <username>]
               [-A <authtype>]
               [-L <privlvl>]
               [-a|-E|-P|-f <password>]
               [-o <oemtype>]
               [-O <sel oem>]
               sel [<option>]

       ipmievd [-c|-h|-v|-V] -I lanplus -H <hostname>
               [-p <port>]
               [-U <username>]
               [-L <privlvl>]
               [-a|-E|-P|-f <password>]
               [-o <oemtype>]
               [-O <sel oem>]
               [-C <ciphersuite>]
               sel [<option>]

DESCRIPTION
       ipmievd  is  a  daemon  which will listen for events from the BMC that are being sent to the SEL and also log those messages to syslog.  It is able to run in one of two modes: either using the Event
       Message Buffer and asynchronous event notification from the OpenIPMI kernel driver or actively polling the contents of the SEL for new events.  Upon receipt of an event via either mechanism it  will
       be logged to syslog with the LOG_LOCAL4 facility.

       It is based on the ipmitool utility and shares the same IPMI interface support and session setup options.  Please see the ipmitool manpage for more information on supported IPMI interfaces.

OPTIONS
       -a     Prompt for the remote server password.

       -A <authtype>
              Specify an authentication type to use during IPMIv1.5 lan session activation.  Supported types are NONE, PASSWORD, MD2, MD5, or OEM.

       -c     Present output in CSV (comma separated variable) format.  This is not available with all commands.

       -C <ciphersuite>
              The  remote  server authentication, integrity, and encryption algorithms to use for IPMIv2 lanplus connections.  See table 22-19 in the IPMIv2 specification.  The default is 3 which specifies
              RAKP-HMAC-SHA1 authentication, HMAC-SHA1-96 integrity, and AES-CBC-128 encryption algorightms.

       -E     The remote server password is specified by the environment variable IPMI_PASSWORD.

       -f <password_file>
              Specifies a file containing the remote server password. If this option is absent, or if password_file is empty, the password will default to NULL.

       -h     Get basic usage help from the command line.

       -H <address>
              Remote server address, can be IP address or hostname.  This option is required for lan and lanplus interfaces.

       -I <interface>
              Selects IPMI interface to use.  Supported interfaces that are compiled in are visible in the usage help output.

       -L <privlvl>
              Force session privilege level.  Can be CALLBACK, USER, OPERATOR, ADMIN. Default is ADMIN.

       -m <local_address>
              Set the local IPMB address.  The default is 0x20 and there should be no need to change it for normal operation.

       -o <oemtype>
              Select OEM type to support.  This usually involves minor hacks in place in the code to work around quirks in various BMCs from various manufacturers.  Use -o list to see  a  list  of  current
              supported OEM types.

       -O <sel oem>
              Open selected file and read OEM SEL event descriptions to be used during SEL listings.  See examples in contrib dir for file format.

       -p <port>
              Remote server UDP port to connect to.  Default is 623.

       -P <password>
              Remote server password is specified on the command line.  If supported it will be obscured in the process list.  Note! Specifying the password as a command line option is not recommended.

       -S <sdr_cache_file>
              Use local file for remote SDR cache.  Using a local SDR cache can drastically increase performance for commands that require knowledge of the entire SDR to perform their function.

       -t <target_address>
              Bridge IPMI requests to the remote target address.

       -U <username>
              Remote server username, default is NULL user.

       -d N   Use  device number N to specify the /dev/ipmiN (or /dev/ipmi/N or /dev/ipmidev/N) device to use for in-band BMC communication.  Used to target a specific BMC on a multi-node, multi-BMC system
              through the ipmi device driver interface.  Default is 0.

       -v     Increase verbose output level.  This option may be specified multiple times to increase the level of debug output.  If given three times you will get hexdumps of  all  incoming  and  outgoing
              packets.

       -V     Display version information.


       If no password method is specified then ipmievd will prompt the user for a password. If no password is entered at the prompt, the remote server password will default to NULL.

COMMANDS
       help   This can be used to get command-line help.  It may also be placed at the end of commands to get option usage help.

              > ipmievd help
              Commands:
                  open    Use OpenIPMI for asyncronous notification of events
                  sel     Poll SEL for notification of events


       open   This  command  starts  ipmievd with the OpenIPMI event watching mechanism which relies on the Event Message Buffer feature of IPMI.  This requires a properly installed and configured OpenIPMI
              driver on Linux and is only valid to be run through the open interface.  See the ipmitool manpage and associated documentation for more information on setting up the OpenIPMI driver.

              Note: Some BMC do not support the Event Message Buffer required for this command.  Other BMCs claim to support it but do not actually deliver events to it.  If this is the case please use the
              sel method.


              daemon Launch process as a daemon and reparent to init process.  All messages will be sent to syslog.  This is the default action.

              nodaemon
                     Do NOT become a daemon, instead log all messages to stderr.

              pidfile=<filename>
                     Save process ID to this file when in daemon mode.  Defaults to /var/run/ipmievd.pidN (where N is the ipmi device number -- defaults to 0).


       sel    This command starts ipmievd with the SEL Polling event watching mechanism.  This will poll the SEL periodically to determine if new events have been logged.  This command should work with all
              BMCs and is capable of using the LAN interface as well to monitor a remote system and log its events to a local syslog.


              daemon Launch process as a daemon and reparent to init process.  All messages will be sent to syslog.  This is the default action.

              nodaemon
                     Do NOT become a daemon, instead log all messages to stderr.

              pidfile=<filename>
                     Save process ID to this file when in daemon mode.  Defaults to /var/run/ipmievd.pidN (where N is the ipmi device number -- defaults to 0).

              timeout=<seconds>
                     Time between checks for SEL polling method.  Default is 10 seconds.

EXAMPLES
       Example 1: Daemon process watching OpenIPMI for events

              > ipmievd -I open open daemon

       Example 2: Local non-daemon process checking remote SEL every 30 seconds

              > ipmievd -I lan -H 1.2.3.4 -f passfile sel nodaemon timeout=30
              Reading Sensors...
              Waiting for Events...

AUTHOR
       Duncan Laurie <duncan@iceblink.org>

SEE ALSO
       IPMItool Homepage
              http://ipmitool.sourceforge.net

       Intelligent Platform Management Interface Specification
              http://www.intel.com/design/servers/ipmi

       OpenIPMI Homepage
              http://openipmi.sourceforge.net



Duncan Laurie                                                                                                                                                                                      ipmievd(8)
