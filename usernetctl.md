USERNETCTL(8)                                                                              System Manager's Manual                                                                              USERNETCTL(8)



NAME
       usernetctl - allow a user to manipulate a network interface if permitted

SYNOPSIS
       usernetctl interface-name up|down|report

DESCRIPTION
       usernetctl  checks  to see if users are allowed to manipulate the network interface specified by interface-name, and then tries to bring the network interface up or down, if up or down was specified
       on the command line, or returns true or false status (respectively) if the report option was specified.

       usernetctl is not really meant to be called directly by users, though it currently works fine that way.  It is used as a wrapper by the ifup and ifdown scripts, so that users can do exactly the same
       thing as root:
       ifup interface-name
       ifdown interface-name
       and ifup and ifdown will call usernetctl automatically to allow the interface status change.

OPTIONS
       interface-name
              The name of the network interface to check; for example, "ppp0".  For backwards compatibility, "ifcfg-ppp0" and "/etc/sysconfig/network-scripts/ifcfg-ppp0" are also supported.

       up|down
              Attempt to bring the interface up or down.

       report Report on whether users can bring the interface up or down.

NOTES
       Alternate device configurations may inherit the default configuration's permissions.



RHS                                                                                             Red Hat, Inc.                                                                                   USERNETCTL(8)
