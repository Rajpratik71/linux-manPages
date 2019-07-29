btattach(1)              Linux System Administration              btattach(1)

NAME
       btattach - attach serial devices to BlueZ stack

SYNOPSIS
       btattach [-B device] [-A device] [-P protocol] [-R]

DESCRIPTION
       btattach  is  used to attach a serial UART to the Bluetooth stack as a
       transport interface.

OPTIONS
       -B device, --bredr device
              Attach a BR/EDR controller.

       -A device, --amp device
              Attach an AMP controller.

       -P protocol, --protocol protocol
              Specify the protocol type for talking to the device.  Supported
              values are:

              · h4

              · bcsp

              · 3wire

              · h4ds

              · ll

              · ath3k

              · intel

              · bcm

              · qca

       -R     Set  the  device  into raw mode (the kernel and bluetoothd will
              ignore it).

BlueZ                           November 2015                     btattach(1)
