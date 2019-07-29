PUMP(8)                                                    Linux Administrator's Manual                                                    PUMP(8)

NAME
       pump - configure network interface via BOOTP or DHCP protocol

SYNOPSIS
       pump  [-krRsd]  [-c|--config-file  FILE]  [-h|--hostname  HOSTNAME]  [-i|--interface  IFACE]  [-l|--lease HOURS] [-m|--route-metric METRIC]
       [--lookup-hostname]  [--no-dns]   [--no-gateway]   [--no-ntp]   [--no-setup]   [--release]   [--renew]   [--script=   ISCRIPT]   [--status]
       [--win-client-ident]

       pump [-?|--help] [--usage]

DESCRIPTION
       pump is a daemon that manages network interfaces that are controlled by either the DHCP or BOOTP protocol.

       While pump may be started manually, it is normally started automatically by ifup(8) for devices configured via BOOTP or DHCP.

       If pump is managing an interface, you can run it again to query the status of that interface.  For example,
           pump -i eth0 --status
       will print the current status of device eth0.

COMMAND LINE OPTIONS
       switch   long option             description
       -?       --help                  Show this help message
       -c       --config-file=FILE      Get configuration from FILE instead of /etc/pump.conf
       -d       --no-dns                Don't update DNS resolver configuration
       -h       --hostname=HOSTNAME     Request HOSTNAME
       -i       --interface=IFACE       Manage IFACE rather than eth0
                --keep-up               Keep the interface up when released
       -k       --kill                  Kill daemon (and disable all interfaces)
       -l       --lease=HOURS           Request least time of HOURS
                --lookup-hostname       Look up hostname in DNS
       -R       --renew                 Renew lease immediately
       -r       --release               Release interface
       -m       --route-metric=METRIC   Metric to use on routes (normally 0)
                --no-gateway            Don't configure a default route for this interface
                --no-resolvconf         Don't use the resolvconf program to update resolv.conf
                --no-ntp                Don't update ntp.conf
                --no-setup              Don't set up anything
                --script=SCRIPT         Call SCRIPT (or null string to disable)
       -s       --status                Display interface status
                --usage                 Display a brief usage message
                --win-client-ident      Specify a Windows(tm)-like client identifier

OPTION NOTES
       The  --lookup-hostname  option  causes  pump to ignore the host and domain names returned by the server and instead to look these up in DNS
       using the IP address of the interface.  The name that is looked up is used in forming the search line in the resolv.conf  file.   Thus,  if
       either the --no-dns or domainsearch option is used then --lookup-hostname has no effect.

       Note that pump itself never sets the computer's hostname.

CONFIGURATION FILE
       You  can  tune  the  behavior  of  pump using a configuration file.  By default pump reads /etc/pump.conf but you can change this using the
       --config-file option.

       The configuration file is line-oriented.  Most lines contain a directive followed by zero or more arguments.  Arguments are  handled  simi‐
       larly  to how shells handle command arguments, allowing the use of quotes and backslash escapes.  Comments are allowed, and must begin with
       a # character.  Spaces and tabs are ignored.

       Directives may be specified at two levels: global and specific.  Global directives change pump's behavior for all of the  devices  that  it
       manages whereas specific directives change pump's behavior for a single device.  Later directives always override earlier ones.

       Here is an example configuration file:

       # sample /etc/pump.conf file

       domainsearch "my.own.org own.org at.work.com"
       retries 3

       device eth1 {
           nodns
       }

       This  configuration  file  tells pump to use a specific DNS search path rather than deriving one from the DHCP or BOOTP server response, to
       retry each request 3 times (for a total of 4 tries), and not to change the DNS configuration file when it's configuring the eth1 device.

       Here is a complete list of directives:

       device DEVICE
              Specify specific directives for DEVICE. This directive must be followed by a {, and the list of specific directives must end with  a
              } on its own line.  These directives may not be nested.

       domainsearch SEARCHPATH
              Use  SEARCHPATH  as  the DNS search path instead of the domain name returned by the server or the domain part of the fully qualified
              hostname.

       keepup Keep the interface up when released.  Normally pump brings the interface down when it releases its lease, but some daemons  such  as
              ifplugd or wpa_supplicant still need the interface to be up so that they can still work.

       nonisdomain
              Don't  set the NIS domain.  Normally pump sets the system's NIS domain if an NIS domain is specified by the DHCP server and the cur‐
              rent NIS domain is empty or localdomain.

       nodns  Don't update /etc/resolv.conf when the interface is configured.

       nogateway
              Ignore any default gateway suggested by the DHCP server for this device.  This can be useful on machines with multiple devices.

       nontp  Don't update /etc/ntp.conf when the interface is configured.

       nosetup
              Don't set up anything on the local machine as a result of DHCP operations.  This implies nodns, nonisdomain,  nogateway  and  nontp.
              This option is useful, for example, if you want to perform setup in customised scripts.

       noresolvconf
              Don't  use the resolvconf program to update /etc/resolv.conf; instead, update /etc/resolv.conf directly.  (This option is only rele‐
              vant if --nodns is not used.)

       retries COUNT
              Retry each phase of the DHCP process COUNT times.

       timeout COUNT
              Don't let any one step of the DHCP process take more then COUNT seconds.

       script FILE

              Condition   arg1      arg2   arg3
              lease       up        eth0   1.2.3.4
              renewal     renewal   eth0   2.3.4.5
              release     down      eth0

              When events occur in negotiation with the server, call the executable FILE.  Scripts are called when a  lease  is  granted,  when  a
              renewal  is  negotiated,  and  when  the interface is brought down and the address released.  The script is called with two or three
              arguments, depending on the condition, as documented in the table above.

LOGGING
       The program logs a good deal of information to syslog, much of it at the DEBUG level.  If you're having trouble, it's a good idea  to  turn
       up syslog's logging level.

BUGS
       At  startup  pump  tries  to detect whether another instance of itself is running.  If the UNIX domain socket (normally /var/run/pump.sock)
       does not exist, pump tries to connect to tcp/127.0.0.1:68.  If it is also unreachable (possibly due to packet filtering), pump will issue a
       warning to stderr and assume that there is no instance of itself running.

       Probably limited to Ethernet, might work on PLIP, probably not ARCnet and Token Ring. The configuration file should let you do more things.

       Submit bug reports at the Bug Track link at http://developer.redhat.com/

QUIBBLE
       A pump, like a boot[p], is something you wear on your foot.  Some of us like the name (I know, hard to believe)!

Linux                                                             26 August 2004                                                           PUMP(8)
