INTELTOOL(8)                                                  System Manager's Manual                                                 INTELTOOL(8)

NAME
       inteltool - a tool for dumping Intel(R) CPU / chipset configuration parameters

SYNOPSIS
       inteltool [-vh?grpmedPMa]

DESCRIPTION
       inteltool is a handy little tool for dumping the configuration space of Intel(R) CPUs, northbridges and southbridges.

       This tool has been developed for the coreboot project (see http://coreboot.org for details on coreboot).

OPTIONS
       -h, --help
              Show a help text and exit.

       -v, --version
              Show version information and exit.

       -a, --all
              Dump all known I/O Controller Hub (ICH) southbridge, Intel(R) northbridge and Intel(R) Core CPU MSRs.

       -g, --gpio
              Dump I/O Controller Hub (ICH) southbridge GPIO registers.

       -r, --rcba
              Dump I/O Controller Hub (ICH) southbridge RCBA registers.

       -p, --pmbase
              Dump I/O Controller Hub (ICH) southbridge PMBASE registers.

       -m, --mchbar
              Dump Intel(R) northbridge MCHBAR registers.

       -e, --epbar
              Dump Intel(R) northbridge EPBAR registers.

       -d, --dmibar
              Dump Intel(R) northbridge DMIBAR registers.

       -P, --pciexbar
              Dump Intel(R) northbridge PCIEXBAR registers.

       -M, --msrs
              Dump Intel(R) CPU MSRs.

BUGS
       Please  report  any bugs at http://tracker.coreboot.org/trac/coreboot/newticket, or on the coreboot mailing list (http://coreboot.org/Mail‐
       inglist).

LICENCE
       inteltool is covered by the GNU General Public License (GPL), version 2.

COPYRIGHT
       Copyright (C) 2008 coresystems GmbH

AUTHORS
       Stefan Reinauer <stepan@coresystems.de>

       This manual page was written by Stefan Reinauer <stepan@coresystems.de>.  It is licensed under the terms of the GNU GPL (version 2).

       Intel(R) is a registered trademark of Intel Corporation. Other product and/or company names mentioned herein may be  trademarks  or  regis‐
       tered trademarks of their respective owners.

                                                                   May 14, 2008                                                       INTELTOOL(8)
