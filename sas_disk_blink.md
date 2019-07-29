SAS_DISK_BLINK(8)                                                     SDPARM                                                     SAS_DISK_BLINK(8)

NAME
       sas_disk_blink - blink the LED on a SAS disk

SYNOPSIS
       sas_disk_blink [--help] [--set NUM] [--verbose] DEVICE

DESCRIPTION
       This  bash shell script attempts to blink the LED on the SAS disk referred to by DEVICE. By default the LED will blink for 30 seconds. This
       is meant to help identify which disk corresponds to a given DEVICE.

       The script use the sdparm utility and manipulates the "Ready LED Meaning" (RLM) field in the Protocol specific port mode page in  order  to
       blink the LED.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              print out the usage message then exit.

       -s, --set NUM
              when  NUM is 0 then the RLM field is cleared. When NUM is 1 then the RLM field is set. When NUM > 1 then the SAS disk LED is made to
              blink for NUM seconds. If this option is not given then the SAS disk LED is made to blink for 30 seconds.

       -v, --verbose
              increase level or verbosity.

EXIT STATUS
       The exit status of this script is 0 when it is successful. Otherwise the exit status is that of the last sdparm  utility  called.  See  the
       sdparm(8) man page.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2013 Douglas Gilbert
       This  software  is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR‐
       POSE.

SEE ALSO
       sdparm (sdparm)

sdparm-1.08                                                          May 2013                                                    SAS_DISK_BLINK(8)
