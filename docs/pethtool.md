PETHTOOL(8)                                                                                                                                                                                       PETHTOOL(8)



NAME
       pethtool - Display or change ethernet card settings

SYNOPSIS
       pethtool [OPTIONS] [<INTERFACE>]

DESCRIPTION
       This script mimic ethtool behavior, but is written purely in python and python module ethtool.

OPTIONS
       INTERFACE
           Is the name of the ethernet device on which pethtool should operate.

       -h, --help
           Show help message and exit.

       -c|--show-coalesce
           Show coalesce options

       -C|--coalesce
           Set coalesce options

               adaptive-rx on|off
               adaptive-tx on|off
               rx-usecs N
               rx-frames N
               rx-usecs-irq N
               rx-frames-irq N
               tx-usecs N
               tx-frames N
               tx-usecs-irq N
               tx-frames-irq N
               stats-block-usecs N
               pkt-rate-low N
               rx-usecs-low N
               rx-frames-low N
               tx-usecs-low N
               tx-frames-low N
               pkt-rate-high N
               rx-usecs-high N
               rx-frames-high N
               tx-usecs-high N
               tx-frames-high N
               sample-interval N

       -i|--driver
           Show driver information

       -k|--show-offload
           Get protocol offload information

       -K|--offload

           Set protocol offload
               [ tso on|off ]

SEE ALSO
       ethtool(8)

AUTHORS
       Arnaldo Carvalho de Melo <acme@redhat.com>

       Man page written by Miroslav Suchý <msuchy@redhat.com>



                                                                                                  08/09/2019                                                                                      PETHTOOL(8)
