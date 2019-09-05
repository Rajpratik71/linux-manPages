hackrf_cpldjtag(1)                                                 User Commands                                                hackrf_cpldjtag(1)

NAME
       hackrf_cpldjtag - program CPLD

DESCRIPTION
       The  HackRF  project  started  by  Michael Ossmann and Jared Boone to build software radio peripheral using Free Software and Free Hardware
       design. Care was taken to only use electronic components with published documentation (no NDAs!) and to avoid  software  libraries  without
       open source licenses.

       Jawbreaker is the first complete HackRF platform, a wideband software radio transceiver with a USB interface.

       This application lets the user configure the on-board CPLD.

SYNOPSIS
       hackrf_cpldjtag -x <filename>

OPTIONS
       -x <filename>: XSVF file to be written to CPLD.

SEE ALSO
       Great Scott Gadgets HackRF web page: http://greatscottgadgets.com/hackrf/

       Other hackrf programs:

       hackrf_info(1), hackrf_max2837(1), hackrf_rffc5071(1), hackrf_si5351c(1), hackrf_spiflash(1), hackrf_transfer(1)

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

       This  program  is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

HACKRF                                                               2013.07.1                                                  hackrf_cpldjtag(1)
