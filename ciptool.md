CIPTOOL(1)                                                                                                                              CIPTOOL(1)

NAME
       ciptool - Bluetooth Common ISDN Access Profile (CIP)

SYNOPSIS
       ciptool [ options ] < command >

DESCRIPTION
       ciptool is used to set up, maintain, and inspect the CIP configuration of the Bluetooth subsystem in the Linux kernel.

OPTIONS
       -h     Gives a list of possible commands.

       -i <hciX> | <bdaddr>
              The  command  is  applied to device hciX , which must be the name or the address of an installed Bluetooth device. If not specified,
              the command will be use the first available Bluetooth device.

COMMANDS
       show   Display information about the connected devices.

       search Search for Bluetooth devices and connect to first one that offers CIP support.

       connect <bdaddr> [psm]
              Connect the local device to the remote Bluetooth device on the specified PSM number. If no PSM is specified, it will use the SDP  to
              retrieve it from the remote device.

       release [bdaddr]
              Release a connection to the specific device. If no address is given and only one device is connected this will be released.

       loopback <bdaddr> [psm]
              Create a connection to the remote device for Bluetooth testing.  This command will not provide a CAPI controller, because it is only
              for testing the CAPI Message Transport Protocol.

AUTHOR
       Written by Marcel Holtmann <marcel@holtmann.org>.

                                                                   JUNE 6, 2003                                                         CIPTOOL(1)
