MPATHPERSIST(8)                                                                                 User Commands                                                                                 MPATHPERSIST(8)



NAME
       mpathpersist

SYNOPSIS
       mpathpersist [OPTIONS] [DEVICE]

DESCRIPTION
              Options:

       --verbose|-v level
              verbosity level

       0      Critical and error messages

       1      Warning messages

       2      Informational messages

       3      Informational messages with trace enabled

       --clear|-C
              PR Out: Clear

       --device=DEVICE|-d DEVICE
              query or change DEVICE

       --help|-h
              output this usage message

       --hex|-H
              output response in hex

       --in|-i
              request PR In command

       --out|-o
              request PR Out command

       --param-aptpl|-Z
              PR Out parameter 'APTPL'

       --read-keys|-k
              PR In: Read Keys

       --param-rk=RK|-K RK
              PR Out parameter reservation key (RK is in hex)

       --param-sark=SARK|-S SARK
              PR Out parameter service action reservation key (SARK is in hex)

       --preempt|-P
              PR Out: Preempt

       --preempt-abort|-A
              PR Out: Preempt and Abort

       --prout-type=TYPE|-T TYPE
              PR Out command type

       --read-status|-s
              PR In: Read Full Status

       --read-keys|-k
              PR In: Read Keys

       --read-reservation|-r
              PR In: Read Reservation

       --register|-G
              PR Out: Register

       --register-ignore|-I
              PR Out: Register and Ignore

       --release|-L
              PR Out: Release

       --report-capabilities|-c
              PR In: Report Capabilities

       --reserve|-R
              PR Out: Reserve

       --transport-id=TIDS|-X TIDS
              TransportIDs can be mentioned in several forms

              Examples:

              mpathpersist --out --register --param-sark=123abc --prout-type=5 /dev/mapper/mpath9 mpathpersist -i -k /dev/mapper/mpath9

mpathpersist                                                                                      April 2011                                                                                  MPATHPERSIST(8)
