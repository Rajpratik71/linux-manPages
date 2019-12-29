usbhid-dump(8)                          System Manager's Manual                         usbhid-dump(8)

NAME
       usbhid-dump - dump USB HID device report descriptors and streams

SYNOPSIS
       usbhid-dump [OPTION]...

DESCRIPTION
       usbhid-dump  uses  libusb  to dump report descriptors and streams from HID (human interface de‐
       vice) interfaces of USB devices.  By default, it dumps HID interfaces of all connected USB  de‐
       vices, but could be limited to a subset of them, or to a single interface, using options.

       NOTE:  usbhid-dump  detaches  kernel  drivers from the interfaces it dumps and uses them exclu‐
       sively, so no other program receives the input in the meantime.  The report descriptor  dumping
       is  instantaneous,  but  the stream dumping continues until terminated with SIGINT (^C from the
       terminal) or a timeout expires.

       If you accidentally start dumping a stream from the USB keyboard you use to control the  termi‐
       nal,  the  system will stop receiving the input and you won't be able to terminate usbhid-dump.
       Just stop your input and wait until the timeout expires. The stream dumping will stop, the key‐
       board will be reattached to the kernel driver and you will regain control.

       The default stream dumping timeout is 60 seconds and could be changed with the -t option.

OPTIONS
       -h, --help
              Output a help message and exit.

       -v, --version
              Output version information and exit.

       -s, -a, --address=bus[:dev]
              Limit  interfaces  by  bus number and device address. Both 1-255, decimal.  Zeroes match
              any bus or device.

       -d, -m, --model=vid[:pid]
              Limit interfaces by device vendor and product IDs.  Both  1-FFFF,  hexadecimal.   Zeroes
              match any vendor or product.

       -i, --interface=NUMBER
              Limit interfaces by number (0-254), decimal. 255 matches any interface.

       -e, --entity=STRING
              The entity to dump: either "descriptor", "stream" or "all". The value can be abbreviated
              down to one letter. The default is "descriptor".

       -t, --stream-timeout=NUMBER
              Stream interrupt transfer timeout, ms. Zero means infinity. The  default  is  60000  (60
              seconds).

       -p, --stream-paused
              Start with the stream dump output paused.

       -f, --stream-feedback
              Enable stream dumping feedback: print a dot to stderr for every transfer dumped.

SIGNALS
       USR1/USR2
              Pause/resume stream dump output.

OUTPUT FORMAT
       usbhid-dump  outputs  dumps in chunks. Each chunk is separated by an empty line and starts with
       the following header line:

       BUS:DEVICE:INTERFACE:ENTITY TIMESTAMP

       Here, BUS, DEVICE and INTERFACE are bus, device and interface numbers respectively.  ENTITY  is
       either "DESCRIPTOR" or "STREAM". TIMESTAMP is timestamp in seconds since epoch.

       After  the  header  the  actual dump data follows as hex bytes. A descriptor chunk includes the
       whole report descriptor. Every stream chunk includes a whole report, usually, but if  a  report
       is bigger than endpoint's wMaxPacketSize, it will span several chunks.

EXAMPLES
       Dump report descriptor for a device with address 3 on bus number 2:
              usbhid-dump -a 2:3

       Dump report stream for a device with vendor ID 0x5543 and product ID 0x0005:
              usbhid-dump -m 5543:0005 -es

       Dump report descriptor from interface 1 of a device with vendor ID 0x5543:
              usbhid-dump -m 5543 -i 1 -ed

       Dump  report streams from all HID interfaces of all USB devices (caution: you will lose control
       over the terminal if you use USB keyboard):
              usbhid-dump -es

AUTHOR
       Nikolai Kondrashov <spbnick@gmail.com>

                                             February 2012                              usbhid-dump(8)
