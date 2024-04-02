CANSEND(1)                                                         User Commands                                                        CANSEND(1)

NAME
       cansend - manual page for cansend 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       cansend - simple command line tool to send CAN-frames via CAN_RAW sockets.

DESCRIPTION
       Usage: ./cansend <device> <can_frame>.  <can_frame>:

       <can_id>#{R|data}
              for CAN 2.0 frames

       <can_id>##<flags>{data}
              for CAN FD frames

   <can_id>:
              can have 3 (SFF) or 8 (EFF) hex chars

   {data}:
              has 0..8 (0..64 CAN FD) ASCII hex-values (optionally separated by '.')

   <flags>:
              a single ASCII Hex value (0 .. F) which defines canfd_frame.flags

EXAMPLES
              5A1#11.2233.44556677.88 / 123#DEADBEEF / 5AA# / 123##1 / 213##311 1F334455#1122334455667788 / 123#R for remote transmission request.

cansend 2018.02.0-1~ubuntu16.04.1~ppa1                             October 2018                                                         CANSEND(1)
