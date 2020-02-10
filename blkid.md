BLKID(8)                                                                                  System Administration                                                                                  BLKID(8)

NAME
       blkid - locate/print block device attributes

SYNOPSIS
       blkid -L label | -U uuid

       blkid [-dghlv] [-c file] [-o format] [-s tag]
             [-t NAME=value] [device ...]

       blkid -p [-O offset] [-o format] [-S size] [-s tag]
                [-n list] [-u list] device ...

       blkid -i [-o format] [-s tag] device ...

DESCRIPTION
       The  blkid  program is the command-line interface to working with the libblkid(3) library.  It can determine the type of content (e.g. filesystem or swap) that a block device holds, and also the
       attributes (tokens, NAME=value pairs) from the content metadata (e.g. LABEL or UUID fields).

       It is recommended to use lsblk(8) command to get information about block devices rather than blkid.  lsblk(8) provides more information, better control on  output  formatting  and  it  does  not
       require root permissions to get actual information.

       When  device  is  specified,  tokens from only this device are displayed.  It is possible to specify multiple device arguments on the command line.  If none is given, all devices which appear in
       /proc/partitions are shown, if they are recognized.

       Note that blkid reads information directly from devices and for non-root users it returns cached unverified information.  It is better to use lsblk  --fs  to  get  a  user-friendly  overview  of
       filesystems and devices.  lsblk(8) is also easy to use in scripts.  blkid is mostly designed for system services and to test libblkid functionality.

       blkid has two main forms of operation: either searching for a device with a specific NAME=value pair, or displaying NAME=value pairs for one or more specified devices.

OPTIONS
       The size and offset arguments may be followed by the multiplicative suffixes like KiB (=1024), MiB (=1024*1024), and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g. "K" has
       the same meaning as "KiB"), or the suffixes KB (=1000), MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

       -c cachefile
              Read from cachefile instead of reading from the default cache file (see the CONFIGURATION FILE section for more details).  If you want to start with  a  clean  cache  (i.e.  don't  report
              devices previously scanned but not necessarily available at this time), specify /dev/null.

       -d     Don't encode non-printing characters.  The non-printing characters are encoded by ^ and M- notation by default.  Note that the -o udev output format uses a different encoding which cannot
              be disabled.

       -g     Perform a garbage collection pass on the blkid cache to remove devices which no longer exist.

       -h     Display a usage message and exit.

       -i     Display information about I/O Limits (aka I/O topology).  The 'export' output format is automatically enabled.  This option can be used together with the -p option.

       -k     List all known filesystems and RAIDs and exit.

       -l     Look up only one device that matches the search parameter specified with the -t option.  If there are multiple devices that match the specified search parameter, then the device with  the
              highest priority is returned, and/or the first device found at a given priority.  Device types in order of decreasing priority are: Device Mapper, EVMS, LVM, MD, and finally regular block
              devices.  If this option is not specified, blkid will print all of the devices that match the search parameter.

       -L label
              Look up the device that uses this filesystem label; this is equal to -l -o device -t LABEL=label.  This lookup method is able to reliably use /dev/disk/by-label udev  symlinks  (dependent
              on a setting in /etc/blkid.conf).  Avoid using the symlinks directly; it is not reliable to use the symlinks without verification.  The -L option works on systems with and without udev.

              Unfortunately,  the  original  blkid(8)  from  e2fsprogs  uses the -L option as a synonym for -o list.  For better portability, use -l -o device -t LABEL=label and -o list in your scripts
              rather than the -L option.

       -n list
              Restrict the probing functions to the specified (comma-separated) list of superblock types (names).  The list items may be prefixed with "no" to specify the types which should be ignored.
              For example:

                blkid -p -n vfat,ext3,ext4 /dev/sda1

              probes for vfat, ext3 and ext4 filesystems, and

                blkid -p -n nominix /dev/sda1

              probes for all supported formats except minix filesystems.  This option is only useful together with -p.

       -o format
              Use the specified output format.  Note that the order of variables and devices is not fixed.  See also option -s.  The format parameter may be:

              full   print all tags (the default)

              value  print the value of the tags

              list   print the devices in a user-friendly format; this output format is unsupported for low-level probing (-p or -i).

                     This output format is DEPRECATED in favour of the lsblk(8) command.

              device print the device name only; this output format is always enabled for the -L and -U options

              udev   print key="value" pairs for easy import into the udev environment; the keys are prefixed by ID_FS_ or ID_PART_ prefixes

                     The udev output returns the ID_FS_AMBIVALENT tag if more superblocks are detected, and ID_PART_ENTRY_* tags are always returned for all partitions including empty partitions.  This
                     output format is DEPRECATED.

              export print key=value pairs for easy import into the environment; this output format is automatically enabled when I/O Limits (-i option) are requested.

                     The non-printing characters are encoded by ^ and M- notation and all potentially unsafe characters are escaped.

       -O offset
              Probe at the given offset (only useful with -p).  This option can be used together with the -i option.

       -p     Switch to low-level superblock probing mode (bypassing the cache).

              Note that low-level probing also returns information about partition table type (PTTYPE tag) and partitions (PART_ENTRY_* tags). The tag names produced by low-level probing are  based  on
              names used internally by libblkid and it may be different than when executed without -p (for example PART_ENTRY_UUID= vs PARTUUID=).

       -s tag For  each  (specified)  device,  show  only the tags that match tag.  It is possible to specify multiple -s options.  If no tag is specified, then all tokens are shown for all (specified)
              devices.  In order to just refresh the cache without showing any tokens, use -s none with no other options.

       -S size
              Override the size of device/file (only useful with -p).

       -t NAME=value
              Search for block devices with tokens named NAME that have the value value, and display any devices which are found.  Common values for NAME include TYPE, LABEL, and UUID.  If there are no
              devices specified on the command line, all block devices will be searched; otherwise only the specified devices are searched.

       -u list
              Restrict  the  probing  functions to the specified (comma-separated) list of "usage" types.  Supported usage types are: filesystem, raid, crypto and other.  The list items may be prefixed
              with "no" to specify the usage types which should be ignored.  For example:

                blkid -p -u filesystem,other /dev/sda1

              probes for all filesystem and other (e.g. swap) formats, and

                blkid -p -u noraid /dev/sda1

              probes for all supported formats except RAIDs.  This option is only useful together with -p.

       -U uuid
              Look up the device that uses this filesystem uuid.  For more details see the -L option.

       -V     Display version number and exit.

RETURN CODE
       If the specified device or device addressed by specified token (option -t) was found and it's possible to gather any information about the device, an exit code 0 is returned.  Note the option -s
       filters output tags, but it does not affect return code.

       If the specified token was not found, or no (specified) devices could be identified, an exit code of 2 is returned.

       For usage or other errors, an exit code of 4 is returned.

       If an ambivalent low-level probing result was detected, an exit code of 8 is returned.

CONFIGURATION FILE
       The standard location of the /etc/blkid.conf config file can be overridden by the environment variable BLKID_CONF.  The following options control the libblkid library:

       SEND_UEVENT=<yes|not>
              Sends uevent when /dev/disk/by-{label,uuid,partuuid,partlabel}/ symlink does not match with LABEL, UUID, PARTUUID or PARTLABEL on the device.  Default is "yes".

       CACHE_FILE=<path>
              Overrides  the  standard location of the cache file.  This setting can be overridden by the environment variable BLKID_FILE.  Default is /run/blkid/blkid.tab, or /etc/blkid.tab on systems
              without a /run directory.

       EVALUATE=<methods>
              Defines LABEL and UUID evaluation method(s).  Currently, the libblkid library supports the "udev" and "scan" methods.  More than one method may be specified  in  a  comma-separated  list.
              Default is "udev,scan".  The "udev" method uses udev /dev/disk/by-* symlinks and the "scan" method scans all block devices from the /proc/partitions file.

AUTHOR
       blkid was written by Andreas Dilger for libblkid and improved by Theodore Ts'o and Karel Zak.

ENVIRONMENT
       Setting LIBBLKID_DEBUG=all enables debug output.

SEE ALSO
       libblkid(3), findfs(8), wipefs(8), lsblk(8),

AVAILABILITY
       The blkid command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                      March 2013                                                                                       BLKID(8)
