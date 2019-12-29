IPPUSBXD(8)                             System Manager's Manual                            IPPUSBXD(8)

NAME
       ippusbxd - Communication driver for IPP-over-USB class printers

SYNOPSIS
       ippusbxd [-v|--vid  VENDOR_ID] [-m|--pid  PRODUCT_ID] [-s|--serial  SERIAL_NUMBER] [--bus  BUS]
       [--device  DEVICE] [--bus-device   BUS:DEVICE]  [-p|--only-port   PORT_NUMBER]  [-P|--from-port
       PORT_NUMBER]  [-i|--interface   INTERFACE] [-l|--logging] [-q|--verbose] [-d|--debug] [-n|--no-
       fork] [-B|--no-broadcast] [-N|--no-printer]

DESCRIPTION
       ippusbxd connects to a IPP-over-USB printer and exposes it to a network interface (like  local‐
       host  or  dummy0)  on  a  given  port,  so that the printer can be accessed like an IPP network
       printer. The printer is also registered at Avahi to be advertised via DNS-SD on the  interface,
       so  CUPS  and  cups-browsed(8)  will auto-discover the printer for easy setup of a print queue.
       This requires avahi-daemon to be running and the network interface to be supported by the Avahi
       version in use.

       Upon  successful  startup  the TCP port it is listening on and the process ID of the daemon are
       printed to stdout. ippusbxd will shut itself down when the connected printer disconnects.  When
       not  specifying  information  about the desired printer, ippusbxd scans the USB and connects to
       the first available IPP-over-USB printer.

OPTIONS
       -h, --help
              Show help message.

       -v VENDOR_ID, --vid VENDOR_ID
              USB vendor ID of desired printer.

       -m PRODUCT_ID, --pid PRODUCT_ID
              USB product ID of desired printer.

       -s SERIAL_NUMBER, --serial SERIAL_NUMBER
              Serial number of desired printer.

       --bus BUS --device DEVICE, --bus-device BUS:DEVICE
              USB bus and device numbers where the  device  is  currently  connected  (see  output  of
              lsusb(8)).  Note  that  these  numbers change when the device is disconnected and recon‐
              nected. This method of calling ippusbxd is only for calling via  UDEV.  BUS  and  DEVICE
              have to be given in decimal numbers.

       -p PORT_NUMBER, --only-port PORT_NUMBER
              Port number ippusbxd will expose the printer over. If this port is already taken, ippus‐
              bxd will error out.

       -P PORT_NUMBER, --from-port PORT_NUMBER
              Port number ippusbxd will expose the printer over. If this port is already taken, ippus‐
              bxd will increase the port number by 1 and try again until it finds a free port.

       -i INTERFACE, --interface INTERFACE
              Network interface to use. Default is the loopback interface (lo, localhost).

       -l, --logging
              Send all logging to syslog.

       -q, --verbose
              Enable verbose logging.

       -d, --debug
              Enables debug mode.  Implies -q and -n.  Verbose logging will be sent to stdout

       -n, --no-fork
              Enables no fork mode.  Disables deamonization.

       -B, --no-broadcast
              No-broadcast mode, do not DNS-SD-broadcast

       -N, --no-printer
              No-printer  mode,  debug/developer  mode  which  makes ippusbxd run without IPP-over-USB
              printer

BUGS
       ippusbxd does not detect whether a USB printer is already connected by another instance of  ip‐
       pusbxd,  so  the  system/the user has to take care to not start ippusbxd more than once for one
       and the same printer. Especially one should never start ippusbxd repeatedly without  specifying
       a printer to assure that all connected IPP-over-USB printers get their ippusbxd instance.

                                                                                           IPPUSBXD(8)
