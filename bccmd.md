BCCMD(1)                 Linux System Administration                 BCCMD(1)

NAME
       bccmd - Utility for the CSR BCCMD interface

SYNOPSIS
       bccmd
       bccmd [-t <transport>] [-d <device>] <command> [<args>]
       bccmd [-h --help]

DESCRIPTION
       bccmd  issues BlueCore commands to Cambridge Silicon Radio devices. If
       run without the <command> argument, a short help  page  will  be  dis‐
       played.

OPTIONS
       -t <transport>
              Specify the communication transport. Valid options are:

              HCI    Local device with Host Controller Interface (default).

              USB    Direct USB connection.

              BCSP   Blue Core Serial Protocol.

              H4     H4 serial protocol.

              3WIRE  3WIRE protocol (not implemented).

       -d <dev>
              Specify  a  particular  device to operate on. If not specified,
              default is the first available HCI  device  or  /dev/ttyS0  for
              serial transports.

COMMANDS
       builddef
              Get build definitions

       keylen <handle>
              Get current crypt key length

       clock  Get local Bluetooth clock

       rand   Get random number

       chiprev
              Get chip revision

       buildname
              Get the full build name

       panicarg
              Get panic code argument

       faultarg
              Get fault code argument

       coldreset
              Perform cold reset

       warmreset
              Perform warm reset

       disabletx
              Disable TX on the device

       enabletx
              Enable TX on the device

       singlechan <channel>
              Lock radio on specific channel

       hoppingon
              Revert to channel hopping

       rttxdata1 <decimal freq MHz> <level>
              TXData1 radio test

       radiotest <decimal freq MHz> <level> <id>
              Run radio tests, tests 4, 6 and 7 are transmit tests

       memtypes
              Get memory types

       psget [-r] [-s <stores>] <key>
              Get value for PS key.  -r sends a warm reset afterwards

       psset [-r] [-s <stores>] <key> <value>
              Set value for PS key.  -r sends a warm reset afterwards

       psclr [-r] [-s <stores>] <key>
              Clear value for PS key.  -r sends a warm reset afterwards

       pslist [-r] [-s <stores>]
              List all PS keys.  -r sends a warm reset afterwards

       psread [-r] [-s <stores>]
              Read all PS keys.  -r sends a warm reset afterwards

       psload [-r] [-s <stores>] <file>
              Load  all  PS keys from PSR file.  -r sends a warm reset after‐
              wards

       pscheck [-r] [-s <stores>] <file>
              Check syntax of PSR file.  -r sends a warm reset afterwards

KEYS
       bdaddr country devclass keymin keymax features commands version remver
       hciextn mapsco baudrate hostintf anafreq anaftrim usbvid usbpid dfupid
       bootmode

AUTHORS
       Written by Marcel Holtmann <marcel@holtmann.org>,  man  page  by  Adam
       Laurie <adam@algroup.co.uk>

BlueZ                            Jun 20 2006                         BCCMD(1)
