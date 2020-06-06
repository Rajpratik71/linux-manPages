TOSHSAT1800-IRDASETUP(1)                                                                      User Commands                                                                      TOSHSAT1800-IRDASETUP(1)

NAME
       toshsat1800-irdasetup - IrDA setup utility for Toshiba Satellite 1800

SYNOPSIS
       toshsat1800-irdasetup [options]

DESCRIPTION
       IrDA configurator for laptops with ALI1533 bridge (LPC47N227 SuperIO), smc-ircc and not initializing BIOS (tested on Toshiba Satellite 1800-514) to be used with Linux kernel.

OPTIONS
       -a, --skip-decoding-cfg skip ISA bridge decoding configuration

       -b, --skip-smc-ircc-cfg skip SMC-IRCC configuration

       -v, --vendor=VALUE      look for the specified ISA bridge PCI vendor id

       -x, --device=VALUE      look for the specified ISA bridge PCI device id

       -c, --cfgbase=VALUE     set SMC-IRCC IO cfgbase address

       -s, --sirbase=VALUE     set SMC-IRCC IO sirbase address

       -f, --firbase=VALUE     set SMC-IRCC IO firbase address

       -m, --dma=VALUE         set SMC-IRCC DMA channel

       -i, --irq=VALUE         set SMC-IRCC IRQ

       -p, --print             print ISA bridge configuration

       -h, --help              show this help

SEE ALSO
       More detailed information in /usr/share/doc/toshset/README.IrDA or online at http://www.csai.unipa.it/peri/toshsat1800-irdasetup/

AUTHOR
       toshsat1800-irdasetup was written by Daniele Peri <peri@csai.unipa.it>.

       This manual page was written by Roberto C. Sanchez <roberto@connexer.com>, for the Debian project (but may be used by others).

toshsat1800-irdasetup                                                                          August 2005                                                                       TOSHSAT1800-IRDASETUP(1)
