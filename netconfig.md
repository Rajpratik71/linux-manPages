NETCONFIG(8)                                                                                Network configuration                                                                                NETCONFIG(8)



NAME
       netconfig - modular tool to modify network configuration

SYNOPSIS
       netconfig modify
               < -s | --service <service name> >
               [ -i | --interface <interface name> ]
               [ -F | --input-format <input/lease file format> ]
               [ -I | --input-file <input/lease file name> ]
               [ -l | --lease-file <input/lease file name> ]
               [ -m | --module-only < name | prefix > ]
               [ -f | --force-replace ]
               [ -v | --verbose ]

       netconfig remove
               < -s | --service <service name> >
               [ -i | --interface <interface name> ]
               [ -m | --module-only < name | prefix > ]
               [ -f | --force-replace ]
               [ -v | --verbose ]

       netconfig update
               [ -m | --module-only < name | prefix > ]
               [ -f | --force-replace ]
               [ -v | --verbose ]

       netconfig < -h | --help >


DESCRIPTION
       Netconfig  is a modular tool to manage additional network configuration settings.  It merges statically defined settings with settings provided by autoconfiguration mechanisms as dhcp or ppp accord-
       ing to a predefined policy and applies the required changes to the system by calling netconfig modules.

       Each netconfig module is responsible to apply a set of changes for instance by writing of a configuration file and restarting a service or similar.

       The netconfig tool knows three main actions:

       modify Modify the current interface and service specific dynamic settings and update the network configuration.

              Netconfig reads these settings on its standard input or from the file specified by the --input-file option and stores them internally until a system  reboot  or  the  next  modify  or  remove
              action. Already existing settings for the same interface and service combination will be overwritten.  See the MODIFY INPUT FORMAT section for input format description.


       remove Removes the dynamic settings provided by a modify action for the specified interface and service combination and update the network configuration.


       update Update the network configuration using current settings. This also required when the policy or the static configuration in sysconfig/network/config changed.

              The update can be limited to a group of modules with a common prefix or to a single module name using the -m name-or-prefix option, for example use -m dns to apply all dns settings or -m dns-
              resolver to apply only settings handled in the dns-resolver module.  Note: Especially the second call may cause inconsistent system configuration!

       The netconfig policy and the static configuration settings are defined in /etc/sysconfig/network/config variables by the administrator using YaST2, NetworkManager or manually as defined in NETCONFIG
       VARIABLES section.

       The dynamic configuration settings provided by autoconfiguration tools as dhcp or ppp are delivered to netconfig directly by these tools with the modify and remove netconfig actions.


NETCONFIG VARIABLES
       NETCONFIG_MODULES_ORDER
              This variable defines the start order of netconfig modules installed in the /etc/netconfig.d/ directory.

              To disable the execution of a module, don't remove it from the list but prepend it with a minus sign, -ntp-runtime.

       NETCONFIG_<set>_POLICY
              Netconfig defines a merge policy variable for each set of network settings.  An empty policy variable disables any modifications in netconfig.

              This variable lists the network interfaces, that netconfig has to consider as a valid source for this set of settings and in which order.

              Except of complete interface names, also basic wildcards to match multiple interfaces are allowed. For example, "eth* ppp?" will target first all eth and then all ppp0-ppp9 interfaces.

              There are two special predefined policy values which indicate how to apply the static settings defined in the corresponding NETCONFIG_<set>_STATIC_* variables:

              STATIC the static settings have to be merged together with the dynamic settings.

              STATIC_FALLBACK
                     the static settings have to be used only, when no dynamic are avaliable.

              By default, the policy is set to the special value auto. This special policy value is resolved differently by netconfig when the NetworkManager is enabled or disabled:

                     NetworkManager is disabled
                            The auto policy value is resolved to a policy "STATIC *".

                     NetworkManager is enabled
                            The  auto  policy value is resolved to "STATIC_FALLBACK NetworkManager" causing to use the NetworkManager build-in merge policy with a fallback to the static settings defined in
                            netconfig variables when the NetworkManager does not provide any.

                            Note: NetworkManager is not using any of the statically defined netconfig settings.
                            Please use the (k)nm connection editor to define yout network settings for the NetworkManager!



   DNS
       NETCONFIG_DNS_POLICY
              Defines the DNS merge policy.  See also the NETCONFIG_<set>_POLICY section.

       NETCONFIG_DNS_FORWARDER
              The name of the DNS forwarder that has to be configured. Currently implemented are "bind" (dns-bind module), "dnsmasq" (dns-dnsmasq) and "resolver" (dns-resolver module), that causes to write
              the name server IP addresses directly to /etc/resolv.conf only (no forwarder).  Empty string defaults to "resolver", that is also the default setting.

              See also NETCONFIG MODULES section for more informations.

       NETCONFIG_DNS_FORWARDER_FALLBACK
              When  enabled  (default)  in forwarder mode ("bind", "dnsmasq"), netconfig writes an explicit localhost nameserver address to the /etc/resolv.conf, followed by the policy resolved name server
              list as fallback for the moments, when the local forwarder is stopped. Otherwise, the fallback is written only, when the NETCONFIG_DNS_STATIC_SERVERS variable contains an localhost address.

       NETCONFIG_DNS_STATIC_SEARCHLIST
              List of DNS domain names used for host-name lookup.

              It is written as search list into the /etc/resolv.conf file.

       NETCONFIG_DNS_STATIC_SERVERS
              List of namserver IP addresses used for host-name lookup.

              When the NETCONFIG_DNS_FORWARDER variable is set to "resolver", the name servers are written directly to /etc/resolv.conf.

              Otherwise, the nameserver are written into a forwarder specific configuration file. Whether the nameservers are written as fallback to the /etc/resolv.conf, depends on the  NETCONFIG_DNS_FOR-
              WARDER_FALLBACK  variable.  When the /etc/resolv.conf does not contain any nameservers, the glibc makes use of the name server running on the local machine (the forwarder). See also NETCONFIG
              MODULES section for more informations.

       NETCONFIG_DNS_RANKING
              Allows to specify a custom DNS service ranking list, that is which services provide preferred (e.g. vpn services), and which services fallback settings (e.g. avahi). It causes a  per  service
              sorting  of  the nameservers and search list settings.  Preferred service names have to be prepended with a "+", fallback service names can be marked with a "-" character. Instead of the ser-
              vice name also a regex is supported using +/pattern/ and -/pattern/.  The special default value "auto" enables the build-in service ranking list, currently:
                  "+/vpn/ -/auto/ +strongswan +openswan +racoon -avahi"
              the value "none" or "" allows to disable the ranking / sorting.

       NETCONFIG_DNS_RESOLVER_OPTIONS
              Allows to specify options to use when writting the /etc/resolv.conf, for example:
                   "debug attempts:1 timeout:10"
              See resolv.conf(5) manual page for details.

       NETCONFIG_DNS_RESOLVER_SORTLIST
              Allows to specify a sortlist to use when writting the /etc/resolv.conf, for example:
                   "130.155.160.0/255.255.240.0 130.155.0.0"
              See resolv.conf(5) manual page for details.


   NTP
       NETCONFIG_NTP_POLICY
              Defines the NTP merge policy.  See also the NETCONFIG_<set>_POLICY section.

       NETCONFIG_NTP_STATIC_SERVERS
              List of NTP server IP addresses.


   NIS
       NETCONFIG_NIS_POLICY Defines the NIS / YP merge policy.  See also the NETCONFIG_<set>_POLICY section.

       NETCONFIG_NIS_STATIC_DOMAIN [ _<number> ]
              A NIS domain name.

       NETCONFIG_NIS_STATIC_SERVERS [ _<number> ]
              A list of NIS servers for the domain with same suffix number.

       NETCONFIG_NIS_SETDOMAINNAME
              Defines whether to set the NIS domain using a setdomainname(2) call.  When enabled and the NIS domain is not provided dynamically or defined in the static netconfig variables, the domain from
              /etc/defaultdomain is used as fallback. Valid values are:
              no     netconfig does not set the domainname at all
              yes    netconfig sets the domainname according to the NIS policy using the settings of the first interface and service which provided the NIS domainname.
              <interface>
                     netconfig sets the domainname according to the NIS policy using the settings of the first service which provided the NIS domainname on the specified interface.


NETCONFIG MODULES
       dns-resolver
              This module writes the DNS settings into the /etc/resolv.conf file.

              When the NETCONFIG_DNS_FORWARDER variable is empty or set to "resolver", both, the domain search list and the nameserver list is written.

              Otherwise,  only  the  domain  search list is written. Whether the nameservers are written to the /etc/resolv.conf or handled by the forwarder specific module (e.g. bind) only, depends on the
              NETCONFIG_DNS_FORWARDER_FALLBACK variable.

       dns-bind
              This module writes the DNS nameservers as forwarders for the bind nameserver into the /etc/named.d/forwarders.conf file. Please verify that this file is included in  the  options  section  of
              /etc/named.conf, like:
              options {
                   #forward                first;
                   include                 "/etc/named.d/forwarders.conf";
              # [...]
              You can use the yast2 dns-server module to configure bind as forwarder.

       dns-dnsmasq
              This module writes the DNS nameservers as forwarders for the dnsmasq nameserver into the /var/run/dnsmasq-forwarders.conf file. Please verify, that this file is set in the resolv-file keyword
              in the /etc/dnsmasq.conf.

       ntp-runtime
              The netconfig ntp-runtime module does not alter the /etc/ntp.conf file, but makes use of NTP "runtime configuration".

              The list of the NTP servers is written to the /var/run/ntp/servers-netconfig file and if the configuration changed meanwhile, the ntp service will be restarted using "rcntp try-restart".  The
              ntp init script provides the functionality to apply the server list at runtime to the ntpd(1) daemon.

       nis    This module writes the NIS configuration into the /etc/ypconf file and reloads the "ypbind" service when the configuration changed.


MODIFY INPUT FORMAT
       The  netconfig  modify  command expects a simple, single quoted, key-value parameter list in a dhcpcd info file compatible format. The keywords have to be usable as variable name in a shell (identi-
       fier).  The keyword INTERFACE is mandatory. The currently considered key-value pairs are:
              INTERFACE='<interface name>'
              IPADDR='<IP address> [/<prefix length>]'
              NETMASK='<network mask>'
              NETWORK='<network address>'
              BROADCAST='<broadcast address>'
              ROUTES='<space separated list of classless route entries>'
              Each route entry consists of "network,netmask,router" addresses.
              GATEWAYS='<space separated list of gateway IP addresses>'
              DNSSEARCH='<space separated list of DNS domain names>'
              DNSDOMAIN='<DNS domain name>'
              DNSSERVERS='<space separated list of DNS nameserver addresses>'
              NTPSERVERS='<space separated list of ntp server addresses>'
              NISDOMAIN='<NIS domain name>'
              NISSERVERS='<list of server addresses for the NIS domain>'
              NETBIOSNAMESERVER='<list of netbios nameserver addresses>'


MODIFY VARIABLE EXAMPLES
       See also the output of the dhcpcd-test <interface name> command.
       Following variables are used by the current netconfig modules:

   DNS
       DNSSEARCH='example.net example.com'
       DNSDOMAIN='example.com'
       DNSSERVERS='192.168.0.10 192.168.0.20'

   NTP
       NTPSERVERS='192.168.0.10 192.168.0.20'

   NIS
       NISDOMAIN='example.com'
       NISSERVERS='192.168.0.20 192.168.0.10'


BUGS
       Please report bugs at <http://www.suse.de/feedback>


AUTHORS
       Michael Calmer <mc@suse.de>
       Marius Tomaschewski <mt@suse.de>
       Milisav Radmanic <radmanic@suse.de>


SEE ALSO
       ifcfg(5),
       /etc/sysconfig/network/config.




sysconfig                                                                                        October 2008                                                                                    NETCONFIG(8)
