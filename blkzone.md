BLKZONE(8)                               System Administration                              BLKZONE(8)

NAME
       blkzone - run zone command on a device

SYNOPSIS
       blkzone command [options] device

DESCRIPTION
       blkzone  is  used  to run zone command on device that support the Zoned Block Commands (ZBC) or
       Zoned-device ATA Commands (ZAC). The zones to operate on can be  specified  using  the  offset,
       count and length options.

       The device argument is the pathname of the block device.

COMMANDS
   report
       The command blkzone report is used to report device zone information.

       By  default,  the command will report all zones from the start of the block device. Options may
       be used to modify this behavior, changing the starting zone or the size of the report,  as  ex‐
       plained below.

       Report output

       start     Zone start sector
       len       Zone length in number of sectors
       wptr      Zone write pointer position
       reset     Reset write pointer recommended
       non-seq   Non-sequential write resources active
       cond      Zone condition
       type      Zone type

       Zone conditions

       cl   Closed
       nw   Not write pointer
       em   Empty
       fu   Full
       oe   Explicitly opened
       oi   Implicitly opened
       ol   Offline
       ro   Read only
       x?   Reserved conditions (should not be reported)

   reset
       The  command blkzone reset is used to reset one or more zones. Unlike sg_reset_wp(8), this com‐
       mand operates from the block layer and can reset a range of zones.

       By default, the command will operate from the zone at device sector 0 and reset all zones.  Op‐
       tions  may  be used to modify this behavior as well as specify the operation to be performed on
       the zone, as explained below.

OPTIONS
       The offset and length option arguments may be  followed  by  the  multiplicative  suffixes  KiB
       (=1024), MiB (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional,
       e.g., "K" has the same meaning as "KiB") or the suffixes KB (=1000), MB (=1000*1000), and so on
       for  GB,  TB, PB, EB, ZB and YB.  Additionally, the 0x prefix can be used to specify offset and
       length in hex.

       -o, --offset sector
              The starting zone specified as a sector offset. The provided offset in sector units (512
              bytes) should match the start of a zone. The default value is zero.

       -l, --length sectors
              The  maximum  number  of sectors the command should operate on. The default value is the
              number of sectors remaining after offset. This option cannot be used together  with  the
              option --count.

       -c, --count count
              The maximum number of zones the command should operate on. The default value is the num‐
              ber of zones starting from offset. This option cannot be used together with  the  option
              --length.

       -v, --verbose
              Display the number of zones returned in the report or the range of sectors reset..

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

AUTHORS
       Shaun Tancheff <shaun@tancheff.com>
       Karel Zak <kzak@redhat.com>

SEE ALSO
       sg_rep_zones(8)

AVAILABILITY
       The  blkzone  command  is  part  of  the  util-linux package and is available from Linux Kernel
       Archive ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                   February 2017                                  BLKZONE(8)
