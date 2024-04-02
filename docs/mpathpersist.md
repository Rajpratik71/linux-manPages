MPATHPERSIST(8)                                                                            System Manager's Manual                                                                            MPATHPERSIST(8)



NAME
       mpathpersist - Manages SCSI persistent reservations on dm multipath devices.

SYNOPSIS
       mpathpersist [OPTIONS] device

DESCRIPTION
       This utility is used to manage SCSI persistent reservations on Device Mapper Multipath devices. To be able to use this functionality, the reservation_key attribute must be defined in the /etc/multi-
       path.conf file. Otherwise the multipathd daemon will not check for persistent reservation for newly discovered paths or reinstated paths.

OPTIONS
       -verbose|-v level
              Verbosity:

              0    Critical messages.

              1    Error messages.

              2    Warning messages.

              3    Informational messages.

              4    Informational messages with trace enabled.

       --device=DEVICE|-d DEVICE
              Query or change DEVICE.

       --help|-h
              Output this usage message.

       --hex|-H
              Output response in hex.

       --in|-i
              Request PR In command.

       --out|-o
              Request PR Out command.

       --param-aptpl|-Z
              PR Out parameter 'APTPL'.

       --read-keys|-k
              PR In: Read Keys.

       --param-sark=SARK|-S SARK
              PR Out parameter service action reservation key (SARK is in hex).

       --preempt|-P
              PR Out: Preempt.

       --preempt-abort|-A
              PR Out: Preempt and Abort.

       --prout-type=TYPE|-T TYPE
              PR Out command type.

       --read-full-status|-s
              PR In: Read Full Status.

       --read-keys|-k
              PR In: Read Keys.

       --read-reservation|-r
              PR In: Read Reservation.

       --register|-G
              PR Out: Register.

       --register-ignore|-I
              PR Out: Register and Ignore.

       --release|-L
              PR Out: Release.

       --report-capabilities|-c
              PR In: Report Capabilities.

       --reserve|-R
              PR Out: Reserve.

       --transport-id=TIDS|-X TIDS
              TransportIDs can be mentioned in several forms.

EXAMPLE
       Register the Service Action Reservation Key for the /dev/mapper/mpath9 device:
              mpathpersist --out --register --param-sark=123abc --prout-type=5 /dev/mapper/mpath9

       Read the Service Action Reservation Key for the /dev/mapper/mpath9 device:
              mpathpersist -i -k /dev/mapper/mpath9

       Reserve the Service Action Reservation Key for the /dev/mapper/mpath9 device:
              mpathpersist --out --reserve --param-sark=123abc --prout-type=8 -d /dev/mapper/mpath9

       Read the reservation status of the /dev/mapper/mpath9 device:
              mpathpersist -i -s -d /dev/mapper/mpath9

SEE ALSO
       multipath(8), multipathd(8).

AUTHORS
       multipath-tools was developed by Christophe Varoqui <christophe.varoqui@opensvc.com> and others.



Linux                                                                                             2016-10-30                                                                                  MPATHPERSIST(8)
