rtl_tcp(1)                                                         User Commands                                                        rtl_tcp(1)

NAME
       rtl_tcp - an I/Q spectrum server for RTL2832 based DVB-T receivers

DESCRIPTION
       Uses  a re-purposed DVB-T receiver as a software defined radio to receive and send I/Q data via TCP network to another demodulation, decod‐
       ing or logging apllication. Written for and incorporated into the osmocom rtl-sdr project.

       Much software is available for the RTL2832. Most of the user-level packages rely on the librtlsdr library which comes as part of  the  rtl-
       sdr  codebase.  This  codebase contains both the library itself and also a number of command line tools such as rtl_test, rtl_sdr, rtl_tcp,
       and rtl_fm. These command line tools use the library to test for the existence of RTL2832 devices and to perform basic data transfer  func‐
       tions to and from the device.

       Because  most  of  the RTL2832 devices are connected using USB, the librtlsdr library depends on the libusb library to communicate with the
       device.

USAGE
       Run this program on a machine with an rtl-sdr supported device connected and it will provide I/Q data to other applications via TCP/IP.

SYNOPSIS
       rtl_tcp [OPTIONS]

OPTIONS
       -a listen address

       -p listen port (default: 1234)

       -f frequency to tune to [Hz]

       -g gain (default: 0 for auto)

       -s samplerate in Hz (default: 2048000 Hz)

       -b number of buffers (default: 32, set by library)

       -n max number of linked list buffers to keep (default: 500)

       -d device_index (default: 0)

       -P ppm_error (default: 0)

Example:
       rtl_tcp -a 10.0.0.2 [-p listen port (default: 1234)]
               Found 1 device(s).
               Found Elonics E4000 tuner
               Using Generic RTL2832U (e.g. hama nano)
               Tuned to 100000000 Hz.
               listening...

       Use the device argument 'rtl_tcp=10.0.0.2:1234' in OsmoSDR (gr-osmosdr) source to receive samples in GRC  and  control  rtl_tcp  parameters
       (frequency, gain, ...).

       use the rtl_tcp=... device argument in gr-osmosdr source to receive the samples in GRC and control the rtl settings remotely.

       This application has been successfully crosscompiled for ARM and MIPS devices and is providing IQ data in a networked ADS-B setup at a rate
       of 2.4MSps. The gr-osmosdr source is being used together with an optimized gr-air-modes version (see Known Apps below). It is  also  avail‐
       able as a package in OpenWRT.

       A use case is described https://sites.google.com/site/embrtlsdr/

SEE ALSO
       gnuradio(1)

       RTL-SDR wiki documentation: http://sdr.osmocom.org/trac/wiki/rtl-sdr

       Other rtl-sdr programs:

       rtl_adsb(1), rtl_eeprom(1), rtl_fm(1), rtl_sdr(1), rtl_test(1)

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

       This  program  is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

RTL-SDR                                                                0.5.0                                                            rtl_tcp(1)
