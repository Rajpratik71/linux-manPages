SG_MAP(8)                                                                                         SG3_UTILS                                                                                         SG_MAP(8)



NAME
       sg_map - displays mapping between Linux sg and other SCSI devices

SYNOPSIS
       sg_map [-a] [-h] [-i] [-n] [-scd] [-sd] [-sr] [-st] [-V] [-x]

DESCRIPTION
       Sometimes  it  is  difficult to determine which SCSI device a sg device name (e.g. /dev/sg0) refers to. This command loops through the sg devices and finds the corresponding SCSI disk, cdrom or tape
       device name (if any). Scanners are an example of SCSI devices that have no alternate SCSI device name apart from their sg device name.

       This utility is deprecated and has not been updated for years, only very obvious bugs will be fixed. Unless a very old version of Linux is being used (e.g.  2.4 series or earlier), then please use a
       utility like lsscsi(8) or the facilities offered by udev(8).

OPTIONS
       -a     assume  the sg devices have alphabetical device names and loop through /dev/sga, /dev/sgb, etc. Default is numeric scan.  Note that sg device nodes with an alphabetical index have been depre-
              cated since the Linux kernel 2.2 series.

       -h     print usage message then exit.

       -i     in addition do a standard INQUIRY and output vendor, product and revision strings for devices that are found.

       -n     assume the sg devices have numeric device names and loop through /dev/sg0, /dev/sg1, etc. Default is numeric scan

       -scd   display mappings to SCSI cdrom device names of the form /dev/scd0, /dev/scd1 etc

       -sd    display mappings to SCSI disk device names

       -sr    display mappings to SCSI cdrom device names of the form /dev/sr0, /dev/sr1 etc

       -st    display mappings to SCSI tape device names

       -V     print out version string then exit (without further ado).

       -x     after each active sg device name is displayed there are five digits: <host_number> <bus> <scsi_id> <lun> <scsi_type>

NOTES
       If no options starting with "-s" are given then the mapping to all SCSI disk, cdrom and tape device names is shown.

       If the device file system (devfs) is present a line noting this is output. The "native" devfs scsi hierarchy makes the relationship between a sg device name and any corresponding disk, cdrom or tape
       device  name  easy  to  establish. This replaces the need for this command. However many applications will continue to look for Linux SCSI device names in their traditional places. [Devfs supplies a
       compatibility daemon called devfsd whose default configuration adds back the Linux device names in their traditional positions.

       Quite often the mapping information can be derived by observing the output of the command: "cat /proc/scsi/scsi".  However if devices have been added since boot this can be deceptive.

       In the Linux kernel 2.6 series something close to the mapping shown by this utility can be found by analysing sysfs. The main difference is that sysfs analysis will show the mapping between sg nodes
       and  other  SCSI  device  nodes  in terms of major and minor numbers. While major 8, minor 16 will usually be /dev/sdb this is not necessarily so. Facilities associated with udev may assign major 8,
       minor 16 some other device node name. This version of sg_map has been extended to cope with sparse disk device node names of the form "/dev/sd<str>" where <str> can be  one  of  [a-z,aa-zz,aaa-zzz].
       See the sg_map26 utility for a more precise way (i.e. less directory scanning) for mapping between sg device names and higher level names; including finding user defined names.

       This  utility  was written at a time when hotplugging of SCSI devices was not supported in Linux. It used a simple algorithm to scan sg device nodes in ascending numeric or alphabetical order, stop-
       ping after there were 5 consecutive errors.

       In the Linux kernel 2.6 series, this utility uses sysfs to find which sg device nodes are active and only checks those. Hence there can be large "holes" in the numbering of  sg  device  nodes  (e.g.
       after an adapter has been removed) and still all active sg device nodes will be listed. This utility assumes that sg device nodes are named using the normal conventions and searches from /dev/sg0 to
       /dev/sg4095 inclusive.

EXAMPLES
       My system has a SCSI disk, a cd writer and a dvd player:
          $ sg_map
          # Note: the devfs pseudo file system is present
          /dev/sg0  /dev/sda
          /dev/sg1  /dev/sr0
          /dev/sg2  /dev/sr1

       In order to find which sg device name corresponds to the disk:
          $ sg_map -sd
          # Note: the devfs pseudo file system is present
          /dev/sg0  /dev/sda
          /dev/sg1
          /dev/sg2

       The "-x" option gives the following output:
          sg_map -x
          # Note: the devfs pseudo file system is present
          /dev/sg0  1 0 1 0  0  /dev/sda
          /dev/sg1  2 0 4 0  5  /dev/sr0
          /dev/sg2  2 0 6 0  5  /dev/sr1

       When a SCSI scanner is added the output becomes:
          $ sg_map
          # Note: the devfs pseudo file system is present
          /dev/sg0  /dev/sda
          /dev/sg1  /dev/sr0
          /dev/sg2  /dev/sr1
          /dev/sg3

       By process of elimination /dev/sg3 must be the scanner.

EXIT STATUS
       The exit status of sg_map is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHOR
       Written by Douglas Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2000-2013 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_map26(8) , scsi_info(8) , scsidev(8) , devfsd(8) , lsscsi(8) , udev(7)



sg3_utils-1.36                                                                                     May 2013                                                                                         SG_MAP(8)
