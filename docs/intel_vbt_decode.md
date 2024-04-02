INTEL_VBT_DECODE(1)                    General Commands Manual                    INTEL_VBT_DECODE(1)

NAME
       intel_vbt_decode - Intel Video BIOS Table parser

SYNOPSIS
       intel_vbt_decode [OPTIONS]

DESCRIPTION
       intel_vbt_decode is a tool to parse the Intel Video BIOS Tables (VBT) and present the informa‐
       tion in a human readable format.

       The preferred ways of getting the binary VBT to parse are:

       1. /sys/kernel/debug/dri/0/i915_vbt (since kernel version 4.5)

       2. /sys/kernel/debug/dri/0/i915_opregion

       3. Using the intel_bios_dumper(1) tool.

       The VBT consists of a VBT header, a BIOS Data Block (BDB) header, and a number  of  BIOS  Data
       Blocks.

OPTIONS
       --file=FILE
              Parse Video BIOS Tables from FILE.

       --devid=DEVID
              Pretend  to be PCI ID DEVID. Some details can be parsed more accurately if the platform
              is known.

       --panel-type=N
              Parse the details for flat panel N. Usually this  is  retrieved  from  the  Video  BIOS
              Tables, but this can be used to override.

       --all-panels
              Parse the details for all flat panels present in the Video BIOS Tables.

       --hexdump
              Hex dump the blocks.

       --block=N
              Dump only the BIOS Data Block number N.

REPORTING BUGS
       Report bugs to https://bugs.freedesktop.org.

SEE ALSO
       intel_bios_dumper(1)

AUTHOR
       IGT Developers <igt-dev@lists.freedesktop.org>

COPYRIGHT
       2010,2012,2016 Intel Corporation

intel-gpu-tools 1.22                          2016-03-01                          INTEL_VBT_DECODE(1)
