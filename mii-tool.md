MII-TOOL(8)                       Linux System Administrator's Manual                      MII-TOOL(8)

NAME
       mii-tool - view, manipulate media-independent interface status

SYNOPSIS
       mii-tool  [-v,  --verbose]  [-V,  --version]  [-R,  --reset] [-r, --restart] [-w, --watch] [-l,
       --log] [-A, --advertise=media,...]  [-F, --force=media] [-p, --phy=addr] interface ...

DESCRIPTION
       This utility checks or sets the status of a network  interface's  Media  Independent  Interface
       (MII) unit.  Most fast ethernet adapters use an MII to autonegotiate link speed and duplex set‐
       ting.

       Most intelligent network devices use an autonegotiation  protocol  to  communicate  what  media
       technologies  they  support,  and  then select the fastest mutually supported media technology.
       The -A or --advertise options can be used to tell the MII to only advertise a subset of its ca‐
       pabilities.   Some passive devices, such as single-speed hubs, are unable to autonegotiate.  To
       handle such devices, the MII protocol also allows for establishing a link by  simply  detecting
       either a 10baseT or 100baseT link beat.  The -F or --force options can be used to force the MII
       to operate in one mode, instead of autonegotiating.  The -A and -F options are mutually  exclu‐
       sive.

       The default short output reports the negotiated link speed and link status for each interface.

OPTIONS
       -v, --verbose
              Display  more detailed MII status information.  If used twice, also display raw MII reg‐
              ister contents.
              Alert: If used three times, will force reading all MII registers, including non standard
              ones.  It's  not  guaranteed  any valid answer from PHY while PHY communication can even
              hang.  With driver e1000e will fail while reading register 0x07.

       -V, --version
              Display program version information.

       -R, --reset
              Reset the MII to its default configuration.

       -r, --restart
              Restart autonegotiation.

       -w, --watch
              Watch interface(s) and report changes in link status.  The MII interfaces are polled  at
              one second intervals.

       -l, --log
              Used with -w, records link status changes in the system log instead of printing on stan‐
              dard output.

       -F media, --force=media
              Disable autonegotiation,  and  force  the  MII  to  either  100baseTx-FD,  100baseTx-HD,
              10baseT-FD, or 10baseT-HD operation.

       -A media,..., --advertise=media,...
              Enable and restart autonegotiation, and advertise only the specified media technologies.
              Multiple technologies should  be  separated  by  commas.   Valid  media  are  100baseT4,
              100baseTx-FD, 100baseTx-HD, 10baseT-FD, and 10baseT-HD.

       -p addr, --phy=addr
              Override the MII address provided by kernel with value addr.

DIAGNOSTICS
       SIOCGMIIPHY on 'eth?' failed: Invalid argument
              If the interface is not running (up), kernel will refuse to report its link state.

       SIOCGMIIPHY on 'eth?' failed: Operation not permitted
              Most kernels restrict access to root.

       SIOCGMIIPHY on 'eth?' failed: No such device
              This error is shown, if the kernel does not know about the named device.

       SIOCGMIIPHY on 'eth?' failed: Operation not supported
              The  interface  in  question does not support MII queries. Most likely, it does not have
              MII transceivers, at all.

AUTHORS
       David Hinds - dhinds@pcmcia.sourceforge.org
       Donald Becker - becker@scyld.com
       Bernd Eckenfels - net-tools@lina.inka.de

SEE ALSO
       http://net-tools.sourceforge.net - Homepage of the net-tools project

net-tools                                     2013-02-15                                   MII-TOOL(8)
