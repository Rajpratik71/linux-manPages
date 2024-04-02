rtl_adsb(1)                                                        User Commands                                                       rtl_adsb(1)

NAME
       rtl_adsb - a simple ADS-B decoder

DESCRIPTION
       Uses  a  re-purposed  DVB-T receiver as a software defined radio to receive and decode ADS-B data. Written by Kyle Keen and incorporated in
       the osmocom rtl-sdr project.

       Automatic dependent surveillance-broadcast, ADS-B, consists of position and other status data transmitted by aircraft  in  support  of  air
       traffic control in order to improve safety of flight.

       Much  software  is available for the RTL2832. Most of the user-level packages rely on the librtlsdr library which comes as part of the rtl-
       sdr codebase. This codebase contains both the library itself and also a number of command line tools such as  rtl_test,  rtl_sdr,  rtl_tcp,
       and  rtl_fm. These command line tools use the library to test for the existence of RTL2832 devices and to perform basic data transfer func‐
       tions to and from the device.

       Because most of the RTL2832 devices are connected using USB, the librtlsdr library depends on the libusb library to  communicate  with  the
       device.

USAGE
       With  a  suitable  antenna  for  receiving  the 1090 MHz signal attached to the rtl-sdr supported device, this program will output the data
       decoded from that signal.

SYNOPSIS
       rtl_adsb [-R] [-g gain] [-p ppm] [output file]

OPTIONS
       -d device_index (default: 0)

       -V verbove output (default: off)

       -S show short frames (default: off)

       -Q quality (0: no sanity checks, 0.5: half bit, 1: one bit (default), 2: two bits)

       -e allowed_errors (default: 5)

       -g tuner_gain (default: automatic)

       -p ppm_error (default: 0)

       tfilename
               (a '-' dumps samples to stdout)
               (omitting the filename also uses stdout)

EXAMPLES
       Streaming with netcat:
                rtl_adsb | netcat -lp 8080

                while true; do rtl_adsb | nc -lp 8080; done

       Streaming with socat:
                rtl_adsb | socat -u - TCP4:sdrsharp.com:47806

SEE ALSO
       RTL-SDR wiki documentation: http://sdr.osmocom.org/trac/wiki/rtl-sdr

       Other rtl-sdr programs:

       rtl_eeprom(1), rtl_fm(1), rtl_sdr(1), rtl_tcp(1), rtl_test(1)

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

       This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

RTL-SDR                                                                0.5.0                                                           rtl_adsb(1)
