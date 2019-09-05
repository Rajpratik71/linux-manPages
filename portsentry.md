PORTSENTRY(8)                                                 System Manager's Manual                                                PORTSENTRY(8)

NAME
       portsentry - detect portscan activity

SYNOPSIS
       portsentry [ -tcp | -stcp | -atcp ]
       portsentry [ -udp | -sudp | -audp ]

DESCRIPTION
       This  manual page documents briefly the portsentry command.  This manual page was written for the Debian GNU/Linux distribution because the
       original program does not have a manual page.

       portsentry is a program that tries to detect portscans on network interfaces with the ability to detect stealth scans. On alarm  portsentry
       can  block the scanning machine via hosts.deny (see hosts_access(5), firewall rule (see ipfwadm(8), ipchains(8) and iptables(8)) or dropped
       route (see route(8)).

OPTIONS
       For details on the various modes see /usr/share/doc/portsentry/README.install

       -tcp   tcp portscan detection on ports specified under TCP_PORTS in the config file /etc/portsentry/portsentry.conf.

       -stcp  As above but additionally detect stealth scans.

       -atcp  Advanced tcp or inverse mode. Portsentry binds to all unused ports below ADVANCED_PORTS_TCP given in the config  file  /etc/portsen‐
              try/portsentry.conf.

       -udp   udp portscan detection on ports specified under UDP_PORTS in the config file /etc/portsentry/portsentry.conf.

       -sudp  As above but additionally detect "stealth" scans.

       -audp  Advanced  udp  or inverse mode. Portsentry binds to all unused ports below ADVANCED_PORTS_UDP given in the config file /etc/portsen‐
              try/portsentry.conf.

CONFIGURATION FILES
       portsentry keeps all its configuration files in /etc/portsentry.  portsentry.conf is portsentry's main  configuration  file.  See  portsen‐
       try.conf(5) for details.

       The  file  portsentry.ignore contains a list of all hosts that are ignored, if they connect to a tripwired port. It should contain at least
       the localhost(127.0.0.1), 0.0.0.0 and the IP addresses of all local interfaces. You can ignore  whole  subnets  by  using  a  notation  <IP
       Address>/<Netmask Bits>. It is  *not* recommend putting in every machine IP on your network. It may be important for you to see who is con‐
       necting to you, even if it is a "friendly" machine. This can help you detect internal host compromises faster.

       If you use the /etc/init.d/portsentry script to start the daemon, portsentry.ignore is rebuild on each start of the daemon  using  portsen‐
       try.ignore.static and all the IP addresses found on the machine via ifconfig.

       /etc/default/portsentry  specifies in which protocol modes portsentry should be startet from /etc/init.d/portsentry There are currently two
       options:

       TCP_MODE=
              either tcp, stcp or atcp (see OPTIONS above).

       UDP_MODE=
              either udp, sudp or audp (see OPTIONS above).

       The options above correspond to portsentry's commandline arguments. For example TCP_MODE="atcp" has the same effect as to start  portsentry
       using portsentry -atcp.  Only one mode per protocol can be started at a time (i.e. one tcp and one udp mode).

FILES
       /etc/portsentry/portsentry.conf main configuration file

       /etc/portsentry/portsentry.ignore
              IP addresses to ignore

       /etc/portsentry/portsentry.ignore.static
              static IP addresses to ignore

       /etc/default/portsentry
              startup options

       /etc/init.d/portsentry
              script responsible for starting and stopping the daemon

       /var/lib/portsentry/portsentry.blocked.*
              blocked hosts(cleared upon reload)

       /var/lib/portsentry/portsentry.history
              history file

SEE ALSO
       portsentry.conf(5), hosts_access(5), hosts_options(5), route(8), ipfwadm(8), ipchains(8), iptables(8), ifconfig(8)

       /usr/share/doc/portsentry/README.install

AUTHOR
       portsentry was written by Craig H. Howland <crowland@users.sf.net>.

       This  manual  page  was  stitched together by Guido Guenther <agx@debian.org>, for the Debian GNU/Linux system (but may be used by others).
       Some parts are just a cut and paste from the original documentation.

                                                                                                                                     PORTSENTRY(8)
