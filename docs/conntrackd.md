CONNTRACKD(8)                                                                                                                                                                                   CONNTRACKD(8)



NAME
       conntrackd - netfilter connection tracking user-space daemon

SYNOPSIS
       conntrackd [options]

DESCRIPTION
       conntrackd  is the user-space daemon for the netfilter connection tracking system. This daemon synchronizes connection tracking states between several replica firewalls. Thus, conntrackd can be used
       to deploy highly available stateful firewalls. The daemon supports Primary-Backup and Multiprimary setups. The daemon can also be used as statistics collector.

OPTIONS
       The options recognized by conntrackd can be divided into several different groups.

   MODES
       These options specify the particular operation mode in which conntrackd runs. Only one of them can be specified at any given time.

       -d     Run conntrackd in daemon mode.

   CLIENT COMMANDS
       conntrackd can be used in client mode to request several information and operations to a running daemon

       -i [ct|expect]
              Dump the internal cache, i.e. show local states

       -e [ct|expect]
              Dump the external cache, i.e. show foreign states

       -x     Display output in XML format. This option is only valid in combination with "-i" and "-e" parameters.

       -f [internal|external]
              Flush the internal and/or external cache

       -F [ct|expect]
              Flush the kernel conntrack table (if you use a Linux kernel >= 2.6.29, this option will not flush your internal and external cache).

       -c     Commit external cache to conntrack table.

       -B     Force a bulk send to other replica firewalls. With this command, you will ask conntrackd to send the state-entries that it owns to others.

       -n     Request resync with other node (only FT-FW and NOTRACK modes).

       -k     Kill the daemon

       -s [network|cache|runtime|link|rsqueue|process|queue|ct|expect]
              Dump statistics. If no parameter is passed, it displays the general statistics.  If "network" is passed as parameter it displays the networking statistics.  If "cache" is passed as parameter,
              it  shows  the  extended  cache statistics.  If "runtime" is passed as parameter, it shows the run-time statistics.  If "process" is passed as parameter, it shows existing child processes (if
              any).  If "queue" is passed as parameter, it shows queue statistics.  If "ct" is passed, it displays the general statistics.  If "expect" is passed as parameter, it shows expectation  statis‐
              tics.

       -R [ct|expect]
              Force a resync against the kernel connection tracking table

       -t     Reset the in-kernel timers (See PurgeTimeout clause)

       -v     Display version information.

       -h     Display help information.

       -C config file
              Configuration file path. See conntrackd.conf(5) for details.


       DIAGNOSTICS
              The exit code is 0 for correct function. Errors cause an exit code of 1.

EXAMPLES
       The following example are illustrative, for a real use in a firewall fail-over, check the primary-backup.sh script that comes with the sources.

       conntrackd -d
              Runs conntrackd in daemon and synchronization mode

       conntrackd -i
              Dumps the states held in the internal cache, i.e. those handled by this firewall

       conntrackd -e
              Dumps the states held in the external cache, i.e. those handled by other replica firewalls

       conntrackd -c
              Commits the external cache into the kernel connection tracking system. This is used to inject the state so that the connections can be recovered during the failover.

DEPENDENCIES
       This  daemon requires a Linux kernel version >= 2.6.18. TCP window tracking support requires >= 2.6.22, otherwise you have to disable it. Helpers are fully supported since >= 2.6.25, however, if you
       use any previous version, depending on the protocol helper and your setup (e.g. if you setup performs NAT sequence adjustments or not), your help connection may be successfully recovered.

       There are several unsupported stateful iptables matches such as recent, connbytes and the quota matches which gather internal information to operate. Since that information does not  belong  to  the
       domain of the connection tracking system, connections affected by those matches may not be fully recovered during the takeover.

       The  daemon  requires  a Linux kernel version >= 2.6.26 to support kernel-space event filtering. Otherwise, all the event filtering is done in userspace with the corresponding extra overhead. If you
       are not using the Filter clause in the configuration file, ignore this notice.

INCOMPATIBILITIES
       During the 0.9.9 development, some important changes in the replication message format were introduced. Therefore, conntrackd >= 0.9.9 will not work appropriately  with  conntrackd  <=  0.9.8.  This
       should not be a problem if you use the same conntrackd version in all the firewall replica nodes.

SEE ALSO
       conntrack(8),iptables(8),conntrackd.conf(5)
       See http://conntrack-tools.netfilter.org

BUGS
       Please, report them to netfilter-devel@vger.kernel.org or file a bug in Netfilter's bugzilla (https://bugzilla.netfilter.org).

AUTHORS
       Pablo Neira Ayuso wrote and maintains the conntrackd tool

       Please send bug reports to <netfilter-devel@lists.netfilter.org>. Subscription is required.

       Man page written by Pablo Neira Ayuso <pablo@netfilter.org>.



                                                                                                 Nov 19, 2015                                                                                   CONNTRACKD(8)
