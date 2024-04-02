WICKEDD(8)                                                                                 System Manager's Manual                                                                                 WICKEDD(8)



NAME
       wickedd - network management daemon

SYNOPSIS
       wickedd [options]

DESCRIPTION
       wickedd provides a service for managing network interfaces. It monitors the system's interfaces by retrieving relevant information from the kernel via netlink, sysfs and other interfaces.

       It can be accessed via a DBus service, which can be used to reconfigure interfaces, bring them up or take them down.

COMPONENTS
       Additionally to the main wickedd daemon, wicked framework provides several helper daemons and supplicants:

       ┌──────────────┬─────────────────────────────────────────────────────────┐
       │Component     │ Description                                             │
       ├──────────────┼─────────────────────────────────────────────────────────┤
       │wickedd-nanny │ Event driven policy daemon responsible for hotplugging. │
       │wickedd-dhcp6 │ DHCPv6 client supplicant                                │
       │wickedd-dhcp4 │ DHCPv4 client supplicant                                │
       │wickedd-auto4 │ IPv6 autoip supplicant                                  │
       └──────────────┴─────────────────────────────────────────────────────────┘
       Further, it communicates also with external supplicants:

       ┌───────────────┬────────────────────────┐
       │Supplicant     │ Description            │
       ├───────────────┼────────────────────────┤
       │wpa-supplicant │ Wireless (WPA) support │
       └───────────────┴────────────────────────┘
OPTIONS
       --help Show available options and exit.

       --version
              Show name and version.

       --config filename
              By default, the daemon reads its configuration from /etc/wicked/server.xml. The --config options allows you to specify a different configuration file.

       --debug facility
              Enable  debugging for facility. By specifying most as the debug facility, most useful debug options will be enabled.  You can also specify several facilities, separated by commas.  Prepending
              a minus will turn off the specified facility. For instance, to enable all debugging facilities except reporting of events, use "all,-events".

              The list of available facilities can be obtained using "--debug help".

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


       --foreground
              Tell the daemon to not background itself at startup.

       --recover
              By default, wickedd does not read previously saved state when starting.  With this options set, wickedd will load any saved state and recover valid address configuration.

       --systemd
              Forces wickedd to use the syslog target for logging. This also forces wickedd to not report any transient return codes.


       FILES

       /etc/wicked/server.xml
              specifies the global configuration of the daemon. This file may pull in additional configuration data from the same directory.

       /run/wicked/wicked.pid
              Location of the PID file written by the daemon when backgrounding itself. The pid directory be changed in the configuration file.

SEE ALSO
       wicked(8), wicked-config(5), wicked(5).

COPYRIGHT
       Copyright (C) 2014 SUSE LINUX Products GmbH, Nuernberg, Germany.

BUGS
       Please report bugs at <https://bugzilla.novell.com/index.cgi>

AUTHORS
       Olaf Kirch



                                                                                                 16 July 2012                                                                                      WICKEDD(8)
