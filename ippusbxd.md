IPPUSBXD(1)                                                   General Commands Manual                                                  IPPUSBXD(1)

NAME
       ippusbxd - userland driver for IPP-over-USB class printers

SYNOPSIS
       ippusbxd [-v  VENDOR_ID] [-m  PRODUCT_ID] [-s  SERIAL_NUMBER] [-p  PORT_NUMBER] [-l] [-d] [-q] [-n] [-d]

DESCRIPTION
       ippusbxd  connects  to  a  IPP-over-USB  printer  and  exposes it to localhost.  Upon successful startup the TCP port it is listening on is
       printed to stdout.  It will shut itself down when the connected printer disconnects.  By default ippusbxd scans and connects to  the  first
       available IPP-over-USB printer.

OPTIONS
       -h     Show help message.

       -v=VENDOR_ID
              USB vendor id of desired printer.

       -m=PRODUCT_ID
              USB product id of desired printer.

       -s=SERIAL_NUMBER
              Serial number of desired printer.

       -p=PORT_NUMBER
              Port number ippusbxd will expose the printer over.

       -l     Send all logging to syslog.

       -q     Enable verbose logging.

       -n     Enables no fork mode.  Disables deamonization.

       -d     Enables debug mode.  Implies -q and -n.  Verbose logging will be sent to stdout

EXAMPLES
       To bind to the first available IPP-over-USB printer and see trace statements:

              ippusbxd -d

                                                                                                                                       IPPUSBXD(1)
