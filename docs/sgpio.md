sgpio(1)                                                                                        USER COMMANDS                                                                                        sgpio(1)



NAME
       sgpio - captive backplane LED control utility

SYNOPSIS
       sgpio [-h] [-V] [[-d|--disk <device>[,<device>...]] | [-p|--port <port>[,<port>...]]] [-s|--status <status>] [-f|--freq <frequency>]

DESCRIPTION
       Serial  General  Purpose  Input Output (SGPIO) is a communication method used between a main board and a variety of internal and external hard disk drive bay enclosures.  This utility can be used to
       control LEDs in an enclosure.  For more information about SGPIO, please consult the SFF-8485 Specification.

OPTIONS
       -h, --help
              displays a short help text

       -V, --version
              displays the utility and AHCI SGPIO specification

       -d, --disk
              disk name of LED location.  Names are sda,sdb,sdc,... Multiple names can be provided in a comma-delimited list.

       -p, --port
              SATA port number of LED location, can be used if a disk name is no longer valid. 0,1,2,3,... Multiple ports can be provided in a comma-delimited list.

       -s, --status
              status of the LED to set.  LED status is: locate, fault, rebuild, off

       -f, --freq
              Set the frequency at which the LED should blink (in Hz). Frequency should be an integer between 1 and 10.


EXAMPLES
       Set the locate LED on SDA with an Intel Intelligent backplane:
              sgpio -d sda -s locate

       Set the locate LED on SDA to flash at 3 Hz for non-intelligent backplanes:
              sgpio -d sda -s locate -f 3

       Set SATA port 2 with fault at a 3 Hz flash rate:
              sgpio -p 2 -s fault -f 3

       Set disks sda through sdf to fault:
              sgpio -d sda,sdb,sdc,sdd,sde,sdf -s fault

EXIT STATUS
       sgpio should return zero when successful.  It will return with a non-zero value if there was a failure.

AUTHOR
       Eric R. Hall <Eric.R.Hall@intel.com>



version 0.3                                                                                     December 2007                                                                                        sgpio(1)
