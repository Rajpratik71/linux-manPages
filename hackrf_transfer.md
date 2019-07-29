hackrf_transfer(1)                                                 User Commands                                                hackrf_transfer(1)

NAME
       hackrf_transfer - file based transmit and receive sdr

DESCRIPTION
       The  HackRF  project  started  by  Michael Ossmann and Jared Boone to build software radio peripheral using Free Software and Free Hardware
       design. Care was taken to only use electronic components with published documentation (no NDAs!) and to avoid  software  libraries  without
       open source licenses.

       Jawbreaker is the first complete HackRF platform, a wideband software radio transceiver with a USB interface.

       This application lets the user receive data from RF and transmit data to RF.

SYNOPSIS
       hackrf_transfer [OPTIONS]

OPTIONS
       -r <filename> # Receive data into file.

       -t <filename> # Transmit data from file.

       -w # Receive data into file with WAV header and automatic name.

        # This is for SDR# compatibility and may not work with other software.

       [-f set_freq_hz] # Set Freq in Hz

       [-a set_amp] # Set Amp 1=Enable, 0=Disable.

       [-l gain_db] # Set lna gain, 0-40dB, 8dB steps

       [-i gain_db] # Set vga(if) gain, 0-62dB, 2dB steps

       [-x gain_db] # Set TX vga gain, 0-47dB, 1dB steps

       [-s sample_rate_hz] # Set sample rate in Hz (8/10/12.5/16/20MHz)

       [-n num_samples] # Number of samples to transfer (default is unlimited).

       [-b baseband_filter_bw_hz] # Set baseband filter bandwidth in MHz.
               Possible values:
               1.75/2.5/3.5/5/5.5/6/7/8/9/10/12/14/15/20/24/28MHz,
               default < sample_rate_hz.

SEE ALSO
       Great Scott Gadgets HackRF web page: http://greatscottgadgets.com/hackrf/

       Other hackrf programs:

       hackrf_cpldjtag(1), hackrf_info(1), hackrf_max2837(1), hackrf_rffc5071(1), hackrf_si5351c(1), hackrf_spiflash(1)

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

       This  program  is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

HACKRF                                                               2013.07.1                                                  hackrf_transfer(1)
