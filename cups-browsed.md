cups-browsed(8)                                                                                                                                                                               cups-browsed(8)



NAME
       cups-browsed - A daemon for browsing the Bonjour broadcasts of shared, remote CUPS printers

SYNOPSIS
       cups-browsed [-v | -d | --debug] [--autoshutdown=mode]
       [--autoshutdown-timeout=timeout]


DESCRIPTION
       cups-browsed has three independently switchable functions:

       1.  Browse Bonjour broadcasts of remote printers and create/remove local raw queues pointing to these printers.

       2.  Browse CUPS broadcasts of remote printers and create/remove local raw queues pointing to these printers.

       3.  Broadcast local queues with the CUPS protocol.

       Note  that  2.  and  3.  are only to allow communication with legacy CUPS servers (1.5.x or older) on the remote machine(s). The standard method to broadcast for shared/network printers to broadcast
       their presence is Bonjour. The CUPS broadcasting/browsing protocol is deprecated.

       cups-browsed can be run permanently (from system boot to shutdown) or on-demand (for example to save resources on mobile devices). For running it on-demend an auto-shutdown feature can be  activated
       to let cups-browsed terminate when it does not have queues any more to take care of.


OPTIONS
       -v, -d, --debug
              Debug mode

       --autoshutdown=mode
              Auto  shutdown mode, mode is off for no auto shutdown, on for auto shutdown being active, and avahi for control by the avahi-daemon being run on-demand, getting auto-shutdown turned off while
              avahi-daemon is present and on when avahi-daemon is shut down.

       --autoshutdown-timeout=timeout
              timeout tells after how many seconds cups-browsed should shut down if it has no local queues set up for any discovered remote printer any more. Default is 30 seconds. 0 means immediate  shut-
              down.

FILES
       /etc/cups/cups-browsed.conf

SIGNALS
       SIGINT, SIGTERM: cups-browsed will shutdown.

       SIGUSR1: Switches cups-browsed into permanent mode (no auto shutdown).

       SIGUSR2: Switches cups-browsed into auto shutdown mode.


NOTES
       Please take references to cups 1.6.x to include newer versions.  Similarily, cups 1.5.x is intended to encompass older versions too.

       In  environments  with  only  cups 1.6.x servers and clients (plus cups-browsed on either server or client or both) the function described in 1.  enables the automatic discovery of remote queues and
       their display in printing dialogues of applications and with command line tools.

       The facility provided by 3. means that servers running cups 1.6.x plus cups-browsed can broadcast their local queues so that clients with cups 1.5.x get these  queues  automatically  available.  The
       outcome  of 2. is that clients running cups 1.6.x plus cups-browsed can use the CUPS broadcasts from servers with cups 1.5.x. As with browsing of Bonjour broadcasts, the created local raw queues are
       available to applications and command line tools.

SEE ALSO
       cups-browsed.conf(5)

       /usr/share/doc/cups-browsed/README.gz

AUTHOR
       The authors of cups-browsed are listed in /usr/share/doc/cups-browsed/AUTHORS.

       This manual page was written for the Debian Project, but it may be used by others.



                                                                                                 29 June 2013                                                                                 cups-browsed(8)
