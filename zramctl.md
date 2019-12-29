ZRAMCTL(8)                               System Administration                              ZRAMCTL(8)

NAME
       zramctl - set up and control zram devices

SYNOPSIS
       Get info:

            zramctl [options]

       Reset zram:

            zramctl -r zramdev...

       Print name of first unused zram device:

            zramctl -f

       Set up a zram device:

            zramctl [-f | zramdev] [-s size] [-t number] [-a algorithm]

DESCRIPTION
       zramctl  is  used to quickly set up zram device parameters, to reset zram devices, and to query
       the status of used zram devices.

       If no option is given, all non-zero size zram devices are shown.

       Note that zramdev node specified on command line has to already exist. The command zramctl cre‐
       ates  a  new  /dev/zram<N>  nodes only when --find option specified. It's possible (and common)
       that after system boot /dev/zram<N> nodes are not created yet.

OPTIONS
       -a, --algorithm lzo|lz4|lz4hc|deflate|842
              Set the compression algorithm to be used for compressing data in the zram device.

       -f, --find
              Find the first unused zram device.  If a --size argument is present, then initialize the
              device.

       -n, --noheadings
              Do not print a header line in status output.

       -o, --output list
              Define  the  status  output  columns to be used.  If no output arrangement is specified,
              then a default set is used.  Use --help to get a list of all supported columns.

       --output-all
              Output all available columns.

       --raw  Use the raw format for status output.

       -r, --reset
              Reset the options of the specified zram device(s).  Zram device settings can be  changed
              only after a reset.

       -s, --size size
              Create  a  zram device of the specified size.  Zram devices are aligned to memory pages;
              when the requested size is not a multiple of the page size, it will be rounded up to the
              next multiple.  When not otherwise specified, the unit of the size parameter is bytes.

              The  size  argument  may  be  followed  by  the multiplicative suffixes KiB (=1024), MiB
              (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g.,
              "K"  has  the same meaning as "KiB") or the suffixes KB (=1000), MB (=1000*1000), and so
              on for GB, TB, PB, EB, ZB and YB.

       -t, --streams number
              Set the maximum number of compression streams that can be used for the device.  The  de‐
              fault is one stream.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

RETURN VALUE
       zramctl returns 0 on success, nonzero on failure.

FILES
       /dev/zram[0..N]
              zram block devices

EXAMPLE
       The  following commands set up a zram device with a size of one gigabyte and use it as swap de‐
       vice.

              # zramctl --find --size 1024M
              /dev/zram0
              # mkswap /dev/zram0
              # swapon /dev/zram0
               ...
              # swapoff /dev/zram0
              # zramctl --reset /dev/zram0

SEE ALSO
       Linux kernel documentation ⟨http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree
       /Documentation/blockdev/zram.txt⟩.

AUTHORS
       Timofey Titovets <nefelim4ag@gmail.com>
       Karel Zak <kzak@redhat.com>

AVAILABILITY
       The  zramctl  command  is part of the util-linux package and is available from https://www.ker‐
       nel.org/pub/linux/utils/util-linux/.

util-linux                                     July 2014                                    ZRAMCTL(8)
