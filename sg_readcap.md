SG_READCAP(8)                                                                                     SG3_UTILS                                                                                     SG_READCAP(8)



NAME
       sg_readcap - send SCSI READ CAPACITY command

SYNOPSIS
       sg_readcap [--16] [--brief] [--help] [--hex] [--lba=LBA] [--long] [--pmi] [--raw] [--verbose] [--version] DEVICE

       sg_readcap [-16] [-b] [-h] [-H] [-lba=LBA] [-pmi] [-r] [-v] [-V] DEVICE

DESCRIPTION
       The normal action of the SCSI READ CAPACITY command is to fetch the number of blocks (and block size) from the DEVICE.

       The  SCSI  READ CAPACITY command (both 10 and 16 byte cdbs) actually yield the block address of the last block and the block size. The number of blocks is thus one plus the block address of the last
       block (as blocks are counted origin zero (i.e. starting at block zero)). This is the source of many "off by one" errors.

       The READ CAPACITY(16) response provides additional information not found in the READ CAPACITY(10) response. This includes protection and logical block provisioning information, plus  the  number  of
       logical  blocks per physical block. So even though the media size may not exceed what READ CAPACITY(10) can show, it may still be useful to examine the response to READ CAPACITY(16). Sadly there are
       horrible SCSI command set implementations in the wild that crash when the READ CAPACITY(16) command is sent to them.

       Device capacity is the product of the number of blocks by the block size.  This utility outputs this figure in bytes, MiB (1048576 bytes per MiB) and GB (1000000000 bytes per GB).

       If sg_readcap is called without the --long option then the 10 byte cdb version (i.e. READ CAPACITY (10)) is sent to the DEVICE. If the number of blocks in the  response  is  reported  as  0xffffffff
       (i.e. (2**32 - 1) ) and the --hex option has not been given, then READ CAPACITY (16) is called and its response is output.

       This  utility  supports  two command line syntaxes, the preferred one is shown first in the synopsis and explained in this section. A later section on the old command line syntax outlines the second
       group of options.

OPTIONS
       Arguments to long options are mandatory for short options as well.


       --16   Use the 16 byte cdb variant of the READ CAPACITY command. See the '--long' option.  -b, --brief outputs two hex numbers (prefixed with '0x' and space separated) to  stdout.  The  first
              number  is  the  maximum number of blocks on the device (which is one plus the lba of the last accessible block). The second number is the size in bytes of each block. If the operation
              fails then "0x0 0x0" is written to stdout.

       -h, --help
              print out the usage message then exit.

       -H, --hex
              output the response to the READ CAPACITY command (either the 10 or 16 byte cdb variant) in ASCII hexadecimal on stdout.

       -L, --lba=LBA
              used in conjunction with --pmi option. This variant of READ CAPACITY will yield the last block address after LBA prior to a delay. For a disk, given a LBA it yields  the  highest  num‐
              bered  block  on  the same cylinder (i.e. before the heads need to move). LBA is assumed to be decimal unless prefixed by "0x" or it has a trailing "h". Defaults to 0.  This option was
              made obsolete in SBC-3 revision 26.

       -l, --long
              Use the 16 byte cdb variant of the READ CAPACITY command. The default action is to use the 10 byte cdb variant which limits the maximum block address to (2**32 - 2). When a 10 byte cdb
              READ CAPACITY command is used on a device whose size is too large then a last block address of 0xffffffff is returned (if the device complies with SBC-2 or later).

       -O, --old
              Switch to older style options. Please use as first option.

       -p, --pmi
              partial  medium  indicator: for finding the next block address prior to some delay (e.g. head movement). In the absence of this option, the total number of blocks and the block size of
              the device are output.  Used in conjunction with the --lba=LBA option. This option was made obsolete in SBC-3 revision 26.

       -r, --raw
              output response in binary to stdout.

       -v, --verbose
              increase level of verbosity. Can be used multiple times.

       -V, --version
              outputs version string then exits.

NOTES
       In the 2.4 series of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. SCSI disks and DVD drives) can also be specified. For example "sg_read‐
       cap /dev/sda" and "sg_readcap /dev/hdd" (if /dev/hdd is a ATAPI CD/DVD device) will work in the 2.6 series kernels.

EXIT STATUS
       The exit status of sg_readcap is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

OLDER COMMAND LINE OPTIONS
       The  options  in  this  section  were  the  only ones available prior to sg3_utils version 1.23 . In sg3_utils version 1.23 and later these older options can be selected by either setting the
       SG3_UTILS_OLD_OPTS environment variable or using '--old' (or '-O) as the first option.

       -16    Use the 16 byte cdb variant of the READ CAPACITY command.  Equivalent to --long in the main description.

       -b     utility outputs two hex numbers (prefixed with '0x' and space separated) to stdout. The first number is the maximum number of blocks on the device (which is one plus  the  lba  of  the
              last accessible block). The second number is the size of each block. If the operation fails then "0x0 0x0" is written to stdout.  Equivalent to --brief in the main description.

       -h     output the usage message then exit. Giving the -? option also outputs the usage message then exits.

       -H     output the response to the READ CAPACITY command (either the 10 or 16 byte cdb variant) in ASCII hexadecimal on stdout.

       -lba=LBA
              used in conjunction with -pmi option. This variant of READ CAPACITY will yield the last block address after LBA prior to a delay.  Equivalent to --lba=LBA in the main description.

       -N, --new
              Switch to the newer style options.

       -pmi   partial  medium  indicator: for finding the next block address prior to some delay (e.g. head movement). In the absence of this switch, the total number of blocks and the block size of
              the device are output.  Equivalent to --pmi in the main description.

       -r     output response in binary (to stdout).

       -v     verbose: print out cdb of issued commands prior to execution. '-vv' and '-vvv' are also accepted yielding greater verbosity.

       -V     outputs version string then exits.

AUTHORS
       Written by Douglas Gilbert

COPYRIGHT
       Copyright © 1999-2013 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq(sg3_utils)



sg3_utils-1.36                                                                                     May 2012                                                                                     SG_READCAP(8)
