rtl_adsb(1)                                                        User Commands                                                       rtl_adsb(1)

NAME
       rtl_fm - a simple FM demodulator for RTL2832 based DVB-T receivers

DESCRIPTION
       Uses  a  re-purposed  DVB-T receiver as a software defined radio to receive narrow band FM signals and demodulate to audio. Written for and
       incorporated in the osmocom rtl-sdr project.

       Narrowband FM is commonly used by public service agencies and commercial dispatch operations in the VHF and UHF bands.  Also can demodulate
       Wideband FM, as found in the 88-108 MHz FM broadcast band.  Experimental options include AM, LSB, USB and DSB demodulation.

       Much  software  is available for the RTL2832. Most of the user-level packages rely on the librtlsdr library which comes as part of the rtl-
       sdr codebase. This codebase contains both the library itself and also a number of command line tools such as  rtl_test,  rtl_sdr,  rtl_tcp,
       and  rtl_fm. These command line tools use the library to test for the existence of RTL2832 devices and to perform basic data transfer func‐
       tions to and from the device.

       Because most of the RTL2832 devices are connected using USB, the librtlsdr library depends on the libusb library to  communicate  with  the
       device.

USAGE
       With  a suitable antenna for receiving the signal attached to the rtl-sdr supported device, this program will output the digital audio data
       decoded from that signal. The data can be listened to by piping to Sox or aplay applications to play the stream on the computer sound card.

SYNOPSIS
       rtl_fm [-f freq] [-options] [filename]

OPTIONS
       -f frequency_to_tune_to [Hz]
               use multiple -f for scanning, (requires squelch)
               ranges supported, -f 118M:137M:25k

       [-M modulation (default: fm)]
               fm, wbfm, raw, am, usb, lsb
               wbfm == -M fm -s 170k -o 4 -A fast -r 32k -l 0 -E deemp
               raw mode outputs 2x16 bit IQ pairs

       -s sample_rate (default: 24k)

       -d device_index (default: 0)

       -g tuner_gain (default: automatic)

       -l squelch_level (default: 0/off)

       -o oversampling (default: 1, 4 recommended)
               for fm squelch is inverted

       [-o oversampling (default: 1, 4 recommended)]

       -p ppm_error (default: 0)

       [-E enable_option (default: none)]
               use multiple -E to enable multiple options
                  edge:   enable lower edge tuning
                  dc:     enable dc blocking filter
                  deemp:  enable de-emphasis filter
                  direct: enable direct sampling
                  offset: enable offset tuning

       filename ('-' means stdout)
               omitting the filename also uses stdout

Experimental options
       [-r resample_rate (default: none / same as -s)]

       [-t squelch_delay (default: 10)]
                +values will mute/scan, -values will exit

       [-F fir_size (default: off)]
                  enables low-leakage downsample filter
                  size can be 0 or 9.  0 has bad roll off

       -A std/fast/lut choose atan math (default: std)

       filename
               (a '-' dumps samples to stdout)
               (omitting the filename also uses stdout)

EXAMPLES
       Produces signed 16 bit ints, use Sox or aplay to hear them.

       rtl_fm ... - | play -t raw -r 24k -es -b 16 -c 1 -V1 -
                                | aplay -r 24k -f S16_LE -t raw -c 1
                       -M wbfm  | play -r 32k ...

       rtl_fm ...  -s 22050 - | multimon -t raw /dev/stdin

SEE ALSO
       RTL-SDR wiki documentation: http://sdr.osmocom.org/trac/wiki/rtl-sdr

       Rtl_fm Guide: http://kmkeen.com/rtl-demod-guide/

       sox(1), play(1), aplay(1)

       Other rtl-sdr programs:

       rtl_adsb(1), rtl_eeprom(1), rtl_sdr(1), rtl_tcp(1), rtl_test(1)

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

       This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

RTL-SDR                                                                0.5.0                                                           rtl_adsb(1)
