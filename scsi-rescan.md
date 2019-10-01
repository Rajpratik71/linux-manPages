RESCAN-SCSI-BUS.SH(1)                                                                           User Commands                                                                           RESCAN-SCSI-BUS.SH(1)



NAME
       rescan-scsi-bus.sh - script for adding and removing SCSI devices without rebooting

SYNOPSIS
       rescan-scsi-bus.sh [options] [host [host ...]]

OPTIONS
       -a, --alltargets
              scan all targets, not just currently existing [default: disabled]

       -d     enable debug                       [default: 0]

       -l     activates scanning for LUNs 0--7   [default: 0]

       -L NUM activates scanning for LUNs 0--NUM [default: 0]

       -w, --wide
              scan for target device IDs 0--15   [default: 0--7]

       -c     enables scanning of channels 0 1   [default: 0 / all detected ones]

       -r, --remove
              enables removing of devices        [default: disabled]

       -f, --flush
              flush failed multipath devices     [default: disabled]

       -i, --issue-lip
              issue a FibreChannel LIP reset     [default: disabled]

       -m, --multipath
              update multipath devices           [default: disabled]

       -u, --update
              look for existing disks that have been remapped

       -s, --resize
              look for resized disks and reload associated multipath devices, if applicable

       --forcerescan
              remove and readd existing devices (DANGEROUS)

       --forceremove
              remove stale devices (DANGEROUS)

       --nooptscan
              don't stop looking for LUNs if 0 is not found

       --color
              use coloured prefixes OLD/NEW/DEL

       --hosts=LIST
              scan only host(s) in LIST

       --channels=LIST
              scan only channel(s) in LIST

       --ids=LIST
              scan only target ID(s) in LIST

       --luns=LIST
              scan only lun(s) in LIST

       --sync, --nosync
              issue a sync / no sync [default: sync if remove]

       --attachpq3
              tell kernel to attach sg to LUN 0 that reports PQ=3

       --reportlun2
              tell kernel to try REPORT_LUN even on SCSI2 devices

       --largelun
              tell kernel to support LUNs > 7 even on SCSI2 devs

       --sparselun
              tell kernel to support sparse LUN numbering

              Host numbers may thus be specified either directly on cmd line (deprecated) or or with the --hosts=LIST parameter (recommended).

       LIST: A[-B][,C[-D]]... is a comma separated list of single values and ranges (No spaces allowed.)

SEE ALSO
       rescan-scsi-bus.sh Homepage: http://www.garloff.de/kurt/linux/#rescan-scsi

       sg3_utils Homepage: http://sg.danny.cz/sg



rescan-scsi-bus.sh 1.57                                                                           leden 2014                                                                            RESCAN-SCSI-BUS.SH(1)
