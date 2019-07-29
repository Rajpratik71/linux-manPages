HCIATTACH(1)             Linux System Administration             HCIATTACH(1)

NAME
       hciattach - attach serial devices via UART HCI to BlueZ stack

SYNOPSIS
       hciattach [-b] [-n] [-p] [-t timeout] [-s speed] [-l] [-r] tty type|id
       speed flow bdaddr

DESCRIPTION
       Hciattach is used to attach a serial UART to the  Bluetooth  stack  as
       HCI transport interface.

OPTIONS
       -b     Send break.

       -n     Don't detach from controlling terminal.

       -p     Print the PID when detaching.

       -t timeout
              Specify an initialization timeout.  (Default is 5 seconds.)

       -s speed
              Specify an initial speed instead of the hardware default.

       -l     List all available configurations.

       -r     Set  the  HCI  device  into raw mode (the kernel and bluetoothd
              will ignore it).

       tty    This specifies the serial device to attach. A leading /dev  can
              be omitted. Examples: /dev/ttyS1 ttyS2

       type|id
              The  type or id of the Bluetooth device that is to be attached,
              i.e. vendor or other device specific identifier. Currently sup‐
              ported types are

              type   description

              any    Unspecified   HCI_UART  interface,  no  vendor  specific
                     options

              ericsson
                     Ericsson based modules

              digi   Digianswer based cards

              xircom Xircom PCMCIA cards: Credit Card Adapter and  Real  Port
                     Adapter

              csr    CSR  Casira  serial  adapter or BrainBoxes serial dongle
                     (BL642)

              bboxes BrainBoxes PCMCIA card (BL620)

              swave  Silicon Wave kits

              bcsp   Serial adapters using CSR chips with BCSP serial  proto‐
                     col

              ath3k  Atheros AR300x based serial Bluetooth device

              intel  Intel Bluetooth device

       Supported IDs are (manufacturer id, product id)

              0x0105, 0x080a
                     Xircom  PCMCIA  cards: Credit Card Adapter and Real Port
                     Adapter

              0x0160, 0x0002
                     BrainBoxes PCMCIA card (BL620)

       speed  The speed specifies the UART speed  to  use.  Baudrates  higher
              than  115.200bps  require  vendor specific initializations that
              are not implemented for all types of devices.  In  general  the
              following speeds are supported:

              9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600

              Supported vendor devices are automatically initialised to their
              respective best settings.

       flow   If the keyword flow is appended to the  list  of  options  then
              hardware flow control is forced on the serial link ( CRTSCTS ).
              All above mentioned device types have flow set by  default.  To
              force no flow control use noflow instead.

       sleep  Enables hardware specific power management feature. If sleep is
              appended to the list of options then this feature  is  enabled.
              To  disable  this  feature use nosleep instead.  All above men‐
              tioned device types have nosleep set by default.

              Note: This option will only be valid for hardware which support
              hardware specific power management enable option from host.

       bdaddr The  bdaddr  specifies  the  Bluetooth  Address  to  use.  Some
              devices (like the STLC2500) do not store the Bluetooth  address
              in  hardware  memory.   Instead  it must be uploaded during the
              initialization process.  If this argument  is  specified,  then
              the  address will be used to initialize the device.  Otherwise,
              a default address will be used.

AUTHORS
       Written by Maxim Krasnyansky <maxk@qualcomm.com>

       Manual page by Nils Faerber <nils@kernelconcepts.de>

BlueZ                            Jan 22 2002                     HCIATTACH(1)
