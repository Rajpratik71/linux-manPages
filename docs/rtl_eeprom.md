rtl_eeprom(1)                                                      User Commands                                                     rtl_eeprom(1)

NAME
       rtl-eeprom - EEPROM programming tool for RTL2832 based DVB-T receivers

DESCRIPTION
       Dumps configuration and also writes EEPROM configuration.  Written by Steve Markgraf and incorporated in the osmocom rtl-sdr project.

       Use at your own risk, especially -w!

       Much  software  is available for the RTL2832. Most of the user-level packages rely on the librtlsdr library which comes as part of the rtl-
       sdr codebase. This codebase contains both the library itself and also a number of command line tools such as  rtl_test,  rtl_sdr,  rtl_tcp,
       and  rtl_fm. These command line tools use the library to test for the existence of RTL2832 devices and to perform basic data transfer func‐
       tions to and from the device.

       Because most of the RTL2832 devices are connected using USB, the librtlsdr library depends on the libusb library to  communicate  with  the
       device.

USAGE
       Writing bad information to the EEPROM will make your device useless.

SYNOPSIS
       rtl_eeprom [OPTIONS]

OPTIONS
       -d device_index (default: 0)

       -m <str> set manufacturer string

       -p <str> set product string

       -s <str> set serial number string

       -i <0,1> disable/enable IR-endpoint

       -g <conf> generate default config and write to device
                 <conf> can be one of:
                 realtek  Realtek default (as without EEPROM)
                 realtek_oem  Realtek default OEM with EEPROM
                 noxon  Terratec NOXON DAB Stick
                 terratec_black  Terratec T Stick Black
                 terratec_plus  Terratec T Stick+ (DVB-T/DAB)

       -w <filename> write dumped file to device

       -r <filename> dump EEPROM to file

       -h display this help text

       Use on your own risk, especially -w!

SEE ALSO
       RTL-SDR wiki documentation: http://sdr.osmocom.org/trac/wiki/rtl-sdr

       Other rtl-sdr programs:

       rtl_adsb(1), rtl_fm(1), rtl_sdr(1), rtl_tcp(1), rtl_test(1)

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

       This  program  is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

RTL-SDR                                                                0.5.0                                                         rtl_eeprom(1)
