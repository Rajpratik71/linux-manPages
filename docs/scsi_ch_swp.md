SCSI_CH_SWP(8)                                                        SDPARM                                                        SCSI_CH_SWP(8)

NAME
       scsi_ch_swp - change SCSI Software WRITE Protect and block device settings

SYNOPSIS
       scsi_ch_swp [--help] [--set 0|1] [--verbose] [--wr] BLK_DEVICE

DESCRIPTION
       This bash shell script attempts to read or change the Software Write Protect (SWP) bit in the SCSI Control mode page using the sdparm util‐
       ity.  If that change is successful then it uses the blockdev utility to change BLK_DEVICE's read-write or read-only  setting  in  sympathy.
       This script is only available in Linux since the blockdev utility is Linux specific.

       If  changing  the  SWP  bit  is supported, setting the SWP bit makes BLK_DEVICE read-only at the device (disk) itself. Clearing the SWP bit
       makes BLK_DEVICE read-write which is usually the default setting at device (disk) power up.

       If no options are given then the current state of the SWP bit is printed out (using sdparm) together with blockdev's RO bit.  If  they  are
       both 1 then BLK_DEVICE is in read-only mode; if they are both 0 then BLK_DEVICE is in read-write mode.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              print out the usage message then exit.

       -s, --set 0|1
              when 0 is given then the SWP bit in the Control mode page is cleared (i.e.  set that bit to 0) using sdparm; and blockdev is used to
              set BLK_DEVICE to read-write mode. When 1 is given then the SWP bit in the Control mode page is set using sdparm;  and  blockdev  is
              used  to  set BLK_DEVICE to read-only mode. The default (i.e. when this option is not given) is to read the state of the SWP bit and
              BLK_DEVICE's read-only mode and print those values out.

       -v, --verbose
              increase level or verbosity.

       -w, --wr
              when the BLK_DEVICE is in read-only mode, Linux will not typically allow BLK_DEVICE to  be  opened  read-write  by  sdparm,  so  the
              default  action  of this script is to use the sdparm --readonly option when --set 0 has been invoked. It is possible that BLK_DEVICE
              could be a generic device (e.g. /dev/sg3) which has a different interpretation of the read-only open flag and  may  fail.  For  such
              rare cases the --wr option makes sdparm open BLK_DEVICE read-write when --set 0 is invoked.

EXIT STATUS
       The  exit status of this script is 0 when it is successful. Otherwise the exit status is that of the sdparm or the blockdev utility, which‐
       ever is called last. See the sdparm(8) man page.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A  PARTICULAR  PUR‐
       POSE.

SEE ALSO
       sdparm(sdparm), blockdev(8)

sdparm-1.08                                                          May 2013                                                       SCSI_CH_SWP(8)
