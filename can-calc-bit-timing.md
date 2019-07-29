CAN-CALC-BIT-TIMING(1)                                             User Commands                                            CAN-CALC-BIT-TIMING(1)

NAME
       can-calc-bit-timing - manual page for can-calc-bit-timing 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       can-calc-bit-timing [options] [<CAN-contoller-name>]

DESCRIPTION
       ./can-calc-bit-timing - calculate CAN bit timing parameters.

OPTIONS
       -q     don't print header line

       -l     list all support CAN controller names

       -b <bitrate>
              bit-rate in bits/sec

       -s <samp_pt>
              sample-point in one-tenth of a percent or 0 for CIA recommended sample points

       -c <clock>
              real CAN system clock in Hz

can-calc-bit-timing 2018.02.0-1~ubuntu16.04.1~ppa1                 October 2018                                             CAN-CALC-BIT-TIMING(1)
