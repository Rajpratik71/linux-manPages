rtl_sdr(1)                                                         User Commands                                                        rtl_sdr(1)

NAME
       rtl-sdr - an I/Q recorder for RTL2832 based DVB-T receivers

DESCRIPTION
       Uses  a  re-purposed  DVB-T  receiver  as a software defined radio to receive signals in I/Q data form. Written for and incorporated in the
       osmocom rtl-sdr project.

       In-Phase and Quadrature Phase data can faithfully represent all of the information in a band of frequencies centered on  a  carrier  signal
       frequency.

       Much  software  is available for the RTL2832. Most of the user-level packages rely on the librtlsdr library which comes as part of the rtl-
       sdr codebase. This codebase contains both the library itself and also a number of command line tools such as  rtl_test,  rtl_sdr,  rtl_tcp,
       and  rtl_fm. These command line tools use the library to test for the existence of RTL2832 devices and to perform basic data transfer func‐
       tions to and from the device.

       Because most of the RTL2832 devices are connected using USB, the librtlsdr library depends on the libusb library to  communicate  with  the
       device.

USAGE
       This program captures information from a band of frequencies and outputs the data in a form useful to other software radio programs.

SYNOPSIS
       rtl_adsb [-f freq] [OPTIONS] [output file]

OPTIONS
       -f frequency_to_tune_to [Hz]

       -s samplerate (default: 2048000 Hz)

       -d device_index (default: 0)

       -g gain (default: 0 for auto)

       -p ppm_error (default: 0)

       -b output_block_size (default: 16 * 16384)

       -n number of samples to read (default: 0, infinite)

       -S force sync output (default: async)

       tfilename
               (a '-' dumps samples to stdout)

EXAMPLES
       Example: To tune to 392.0 MHz, and set the sample-rate to 1.8 MS/s, use:
               ./rtl_sdr /tmp/capture.bin -s 1.8e6 -f 392e6

       to record samples to a file or to forward the data to a fifo.

       If  the  device can't be opened, make sure you have the appropriate rights to access the device (install udev-rules from the repository, or
       run it as root).

SEE ALSO
       gnuradio(1)

       RTL-SDR wiki documentation: http://sdr.osmocom.org/trac/wiki/rtl-sdr

       Other rtl-sdr programs:

       rtl_adsb(1), rtl_eeprom(1), rtl_fm(1), rtl_power(1), rtl_tcp(1), rtl_test(1)

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

       This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

RTL-SDR                                                                0.5.0                                                            rtl_sdr(1)
