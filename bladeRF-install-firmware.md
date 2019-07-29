bladeRF-install-firmware(1)                                          GNU Radio                                         bladeRF-install-firmware(1)

NAME
       bladeRF-install-firmware - BladeRF Firmware Utility

SYNOPSIS
       bladeRF-install-firmware [-h] [show help] [-i imagedir] [image_directory] [-f fpgaimage] [fpkg_image_file] [-u usbimage] [fx3_image_file]

OPTIONS
       This  program  works best without any arguments. If you already have the firmware tarball and are wanting to install it on a system without
       Internet access, then you can run this script with that file as an argument.

DESCRIPTION
       The FPGA image is built using non-free software and is not distributed by Debian. This program makes it easier for the end user to get rec‐
       ommended images from Nuand.com.

       The bladeRF-cli application is used to load the FX3 firmware and the FPGA firmware.

       The  FX3  firmware only needs to be loaded once: it is stored in flash, and survives power cycling. The FPGA image needs to be loaded every
       time.

       Recommended firmware and FPGA images to use: FX3 Image: http://nuand.com/fx3/latest.img FPGA: http://nuand.com/fpga

AUTHOR
       This manual page was written by Maitland Bottoms for the Debian project (but may be used by others).

COPYRIGHT
       Copyright (c) 2013 A. Maitland Bottoms <bottoms@debian.org>

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in
        all copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
        THE SOFTWARE.

SEE ALSO
       bladeRF-cli(1)

BLADERF                                                                3.7.1                                           bladeRF-install-firmware(1)
