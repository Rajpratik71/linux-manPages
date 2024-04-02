CANFDTEST(1)                                                       User Commands                                                      CANFDTEST(1)

NAME
       canfdtest - manual page for canfdtest 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       canfdtest [options] <can-interface>

DESCRIPTION
       canfdtest - Full-duplex test program (DUT and host part).

OPTIONS
       -v     (low verbosity)

       -vv    (high verbosity)

       -g     (generate messages)

       -l COUNT (test loop count)

       With  the option '-g' CAN messages are generated and checked on <can-interface>, otherwise all messages received on the <can-interface> are
       sent back incrementing the CAN id and all data bytes. The program can be aborted with ^C.

EXAMPLES
              on DUT:

       canfdtest -v can0

              on Host:

       canfdtest -g -v can2

canfdtest 2018.02.0-1~ubuntu16.04.1~ppa1                           October 2018                                                       CANFDTEST(1)
