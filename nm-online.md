NM-ONLINE(1)               General Commands Manual               NM-ONLINE(1)

NAME
       nm-online - ask NetworkManager whether the network is connected

SYNOPSIS
       nm-online [OPTIONS...]

DESCRIPTION
       nm-online is a utility to find out whether we are online. It is done
       by asking NetworkManager about its status. When run, nm-online waits
       until NetworkManager reports an active connection, or specified
       timeout expires. On exit, the returned status code should be checked
       (see the return codes below).

       By default NetworkManager waits for IPv4 dynamic addressing to
       complete but does not wait for the auto IPv6 dynamic addressing. To
       wait for IPv6 addressing to complete, either (1) change the network
       connection's IPv6 may-fail setting to no, and/or (2) change the IPv6
       addressing method to manual or dhcp, to indicate that IPv6
       connectivity is expected.

OPTIONS
       -t | --timeout seconds
           Time to wait for a connection, in seconds. If the option is not
           provided, the default timeout is 30 seconds.

       -x | --exit
           Exit immediately if NetworkManager is not running or connecting.

       -q | --quiet
           Don't print anything.

       -s | --wait-for-startup
           Wait for NetworkManager startup to complete, rather than waiting
           for network connectivity specifically. Startup is considered
           complete once NetworkManager has activated (or attempted to
           activate) every auto-activate connection which is available given
           the current network state. (This is generally only useful at boot
           time; after startup has completed, nm-online -s will just return
           immediately, regardless of the current network state.)

EXIT STATUS
       nm-online exits with status 0 if it succeeds, a value greater than 0
       is returned if an error occurs.

       0
           Success – already online or connection established within given
           timeout.

       1
           Offline or not online within given timeout.

       2
           Unknown or unspecified error.

SEE ALSO
       nmcli(1), NetworkManager(8).

NetworkManager 1.10.6                                            NM-ONLINE(1)
