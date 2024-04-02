tableau-parm(1)                                                                                                                    tableau-parm(1)

NAME
       tableau-parm - Tableau Write-blocking Bridge Query/Command Utility

SYNOPSIS
       tableau-parm [-r] device

DESCRIPTION
       tableau-parm  is  designed  to interact with write-blocking forensics bridges produced by Tableau, LLC. It can be used to query bridges for
       various bridge and device data, as well as to disable DCO regions.

OPTIONS
       tableau-parm accepts the following parameters:

       -r     Directs tableau-parm to permanently remove a DCO, if it exists.  THIS WILL MODIFY THE STATE OF THE DRIVE. USE AT YOUR OWN RISK!  (It
              is  recommended  for forensics investigations, that a full drive image be taken before this command is run, and then again afterward
              if a DCO was detected originally.) Note: after running this, you'll need to restart the Tableau bridge for it  to  correctly  detect
              the changes.

       device Required  argument.  Specifies  the device file for the bridge/drive to be queried. This must be a device presenting SCSI emulation.
              Under Linux, all USB and FireWire mass storage devices behave like SCSI devices. Once a bridge and drive are plugged in and  powered
              on, one can generally find out what the device was dynamically mapped to by running: dmesg | tail -20

OUTPUT
       tableau-parm  generates  simple output with one data value per line, interspersed with blank lines and section headers.  This output format
       is subject to change.

EXAMPLES
       To query a bridge which is mapped to /dev/sda:

            tableau-parm /dev/sda

       To remove a DCO from the hard drive on /dev/sda:

            tableau-parm -r /dev/sda

BUGS
       Older versions of ATA and SATA Tableau firmwares didn't properly handle HPA and DCO on some types of drives. Be sure to upgrade your block‐
       ers' firmwares using the firmware update utility, version 4.2 or later, which was released on July 5, 2007.

       This  is  not really a bug, but something to note: when a drive has both an HPA and DCO section, and the DCO is removed, the HPA is removed
       with it. This is how the bridge firmware works, and isn't something controlled by tableau-parm. Just something to be aware of.

CREDITS
       Copyright (C) 2007,2009 Timothy D. Morgan

       Copyright (C) 1999,2001,2006,2007 D. Gilbert

       tableau-parm was written by Timothy D. Morgan using portions of SCSI example code written by D. Gilbert.

       Tableau, LLC cooperated in the development of this tool by providing documentation on the proprietary SCSI interfaces and assisted in test‐
       ing.  Without their help, this tool would not have been possible. Tableau, LLC does not endorse or warrant this code in any way.

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 3 for more details.

SEE ALSO
       hdparm(1) sdparm(1)

Forensics Utilities                                              30 September 2009                                                 tableau-parm(1)
