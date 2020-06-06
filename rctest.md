RCTEST(1)                                                                                                                                                                                       RCTEST(1)

NAME
       rctest - RFCOMM testing

SYNOPSIS
       rctest <mode> [options] [bdaddr]

DESCRIPTION
       rctest is used to test RFCOMM communications on the BlueZ stack

MODES
       -r     listen and receive

       -w     listen and send

       -d     listen and dump incoming data

       -s     connect and send

       -u     connect and receive

       -n     connect and be silent

       -c     connect, disconnect, connect, ...

       -m     multiple connects

OPTIONS
       -b bytes
              send/receive bytes bytes

       -i device
              select the specified device

       -P channel
              select the specified channel

       -U uuid
              select the specified uuid

       -L seconds
              enable SO_LINGER options for seconds

       -W seconds
              enable deferred setup for seconds

       -B filename
              use data packets from filename

       -N num send num frames

       -C num send num frames before delay (default: 1)

       -D milliseconds
              delay milliseconds after sending num frames (default: 0)

       -A     request authentication

       -E     request encryption

       -S     secure connection

       -M     become master

       -T     enable timestamps

AUTHORS
       Written by Marcel Holtmann <marcel@holtmann.org> and Maxim Krasnyansky <maxk@qualcomm.com>, man page by Filippo Giunchedi <filippo@debian.org>

BlueZ                                                                                           Jul 6 2009                                                                                      RCTEST(1)
