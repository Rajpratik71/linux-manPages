PPP-WATCH(8)                                                                               System Manager's Manual                                                                               PPP-WATCH(8)



NAME
       ppp-watch - daemon to make PPP interfaces act more like other interfaces

SYNOPSIS
       ppp-watch interface-name [boot]

DESCRIPTION
       ppp-watch manages one PPP connection, including starting, stopping, and redialing.  It makes starting and stopping the connection synchronous activities.

       ppp-watch is not really meant to be called directly.  It should only be used from within the ifup-ppp script.

OPTIONS
       interface-name
              The name of the PPP interface to bring up.

       boot   ppp-watch is being called at boot time and should time out after a while if the PPP connection does not come up in order not to hang the boot sequence.



RHS                                                                                             Red Hat, Inc.                                                                                    PPP-WATCH(8)
