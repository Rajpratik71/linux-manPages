rtl_test(1)                                                        User Commands                                                       rtl_test(1)

NAME
       rtl_test - a benchmark tool for RTL2832 based DVB-T receivers

DESCRIPTION
       Test  tuning  range  and  functional  sample  rates of your device on your system.  Uses a re-purposed DVB-T receiver as a software defined
       radio. Written for and incorporated into the osmocom rtl-sdr project.

       Much software is available for the RTL2832. Most of the user-level packages rely on the librtlsdr library which comes as part of  the  rtl-
       sdr  codebase.  This  codebase contains both the library itself and also a number of command line tools such as rtl_test, rtl_sdr, rtl_tcp,
       and rtl_fm. These command line tools use the library to test for the existence of RTL2832 devices and to perform basic data transfer  func‐
       tions to and from the device.

       Because  most  of  the RTL2832 devices are connected using USB, the librtlsdr library depends on the libusb library to communicate with the
       device.

SYNOPSIS
       rtl_test [OPTIONS]

OPTIONS
       -s samplerate (default: 2048000 Hz)

       -d device_index (default: 0)

       -t enable Elonics E4000 tuner benchmark]

       -p enable PPM error measurement

       -b output_block_size (default: 16 * 16384)

       -S force sync output (default: async)

EXAMPLES
       To check the possible tuning range (may heavily vary by some MHz depending on device and temperature), call
               rtl_test -t

       To check the maximum samplerate possible on your machine, type (change the rate down until no sample loss occurs):
               rtl_test -s 3.2e6

       A samplerate of 2.4e6 is known to work even over tcp connections (see rtl_tcp above). A sample rate of 2.88e6 may work without lost samples
       but this may depend on your PC/Laptop's host interface.

SEE ALSO
       RTL-SDR wiki documentation: http://sdr.osmocom.org/trac/wiki/rtl-sdr

       Other rtl-sdr programs:

       rtl_adsb(1), rtl_eeprom(1), rtl_fm(1), rtl_sdr(1), rtl_tcp(1)

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

       This  program  is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

RTL-SDR                                                                0.5.0                                                           rtl_test(1)
