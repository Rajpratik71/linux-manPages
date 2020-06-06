MKNTFS(8)                                                                                System Manager's Manual                                                                                MKNTFS(8)

NAME
       mkntfs - create an NTFS file system

SYNOPSIS
       mkntfs [options] device [number-of-sectors]

       mkntfs [ -C ] [ -c cluster-size ] [ -F ] [ -f ] [ -H heads ] [ -h ] [ -I ] [ -L volume-label ] [ -l ] [ -n ] [ -p part-start-sect ] [ -Q ] [ -q ] [ -S sectors-per-track ] [ -s sector-size ] [ -T
       ] [ -U ] [ -V ] [ -v ] [ -z mft-zone-multiplier ] [ --debug ] device [ number-of-sectors ]

DESCRIPTION
       mkntfs is used to create an NTFS file system on a device (usually a disk partition) or file.  device is the special file corresponding to the device (e.g /dev/hdXX).   number-of-sectors  is  the
       number of sectors on the device. If omitted, mkntfs automagically figures the file system size.

OPTIONS
       Below is a summary of all the options that mkntfs accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the long name is preceded by --.  Any single letter
       options, that don't take an argument, can be combined into a single command, e.g.  -fv is equivalent to -f -v.  Long named options can be abbreviated to any unique prefix of their name.

   Basic options
       -f, --fast, -Q, --quick
              Perform quick (fast) format. This will skip both zeroing of the volume and bad sector checking.

       -L, --label STRING
              Set the volume label for the filesystem.

       -C, --enable-compression
              Enable compression on the volume.

       -n, --no-action
              Causes mkntfs to not actually create a filesystem, but display what it would do if it were to create a filesystem. All steps of the format are carried out except the actual writing to the
              device.

   Advanced options
       -c, --cluster-size BYTES
              Specify  the  size  of  clusters  in  bytes. Valid cluster size values are powers of two, with at least 256, and at most 65536 bytes per cluster. If omitted, mkntfs uses 4096 bytes as the
              default cluster size.

              Note that the default cluster size is set to be at least equal to the sector size as a cluster cannot be smaller than a sector. Also, note that values greater  than  4096  have  the  side
              effect that compression is disabled on the volume (due to limitations in the NTFS compression algorithm currently in use by Windows).

       -s, --sector-size BYTES
              Specify  the  size of sectors in bytes. Valid sector size values are 256, 512, 1024, 2048 and 4096 bytes per sector. If omitted, mkntfs attempts to determine the sector-size automatically
              and if that fails a default of 512 bytes per sector is used.

       -p, --partition-start SECTOR
              Specify the partition start sector. The maximum is 4294967295 (2^32-1). If omitted, mkntfs attempts to determine part-start-sect automatically and if that fails or the value is oversized,
              a default of 0 is used. The partition is usable despite a wrong value, however note that a correct part-start-sect is required for Windows to be able to boot from the created volume.

       -H, --heads NUM
              Specify  the number of heads. The maximum is 65535 (0xffff). If omitted, mkntfs attempts to determine the number of heads automatically and if that fails a default of 0 is used. Note that
              heads is required for Windows to be able to boot from the created volume.

       -S, --sectors-per-track NUM
              Specify the number of sectors per track. The maximum is 65535 (0xffff). If omitted, mkntfs attempts to determine the number of sectors-per-track automatically and if that fails a  default
              of 0 is used. Note that sectors-per-track is required for Windows to be able to boot from the created volume.

       -z, --mft-zone-multiplier NUM
              Set  the  MFT  zone  multiplier, which determines the size of the MFT zone to use on the volume. The MFT zone is the area at the beginning of the volume reserved for the master file table
              (MFT), which stores the on disk inodes (MFT records).  It is noteworthy that small files are stored entirely within the inode; thus, if you expect to use the volume for storing large num‐
              bers  of  very  small  files,  it is useful to set the zone multiplier to a higher value. Note, that the MFT zone is resized on the fly as required during operation of the NTFS driver but
              choosing a good value will reduce fragmentation. Valid values are 1, 2, 3 and 4. The values have the following meaning:

              ┌────────────────────────────────┐
              │MFT zone     MFT zone size      │
              │multiplier   (% of volume size) │
              │    1        12.5% (default)    │
              │    2        25.0%              │
              │    3        37.5%              │
              │    4        50.0%              │
              └────────────────────────────────┘

       -T, --zero-time
              Fake the time to be 00:00:00 UTC, Jan 1, 1970 instead of the current system time.  This is only really useful for debugging purposes.

       -U, --with-uuid
              Generate a random volume UUID.

       -I, --no-indexing
              Disable content indexing on the volume. (This is only meaningful on Windows 2000 and later. Windows NT 4.0 and earlier ignore this as they do not implement content indexing at all.)

       -F, --force
              Force mkntfs to run, even if the specified device is not a block special device, or appears to be mounted.

   Output options
       -q, --quiet
              Quiet execution; only errors are written to stderr, no output to stdout occurs at all. Useful if mkntfs is run in a script.

       -v, --verbose
              Verbose execution.

       --debug
              Really verbose execution; includes the verbose output from the -v option as well as additional output useful for debugging mkntfs.

   Help options
       -V, --version
              Print the version number of mkntfs and exit.

       -l, --license
              Print the licensing information of mkntfs and exit.

       -h, --help
              Show a list of options with a brief description of each one.

KNOWN ISSUES
       When applying chkdsk to a file system, it sometimes throws a warning "Correcting errors in the uppercase file." The uppercase file is created while formatting and it defines the mapping of lower
       case  characters to upper case ones, as needed to sort file names in directories. The warning means that the uppercase file defined on the file system is not the same as the one used by the Win‐
       dows OS on which chkdsk is running, and this may happen because newer versions of Windows take into account new characters defined by the Unicode consortium.

       Currently, mkntfs creates the uppercase table so that no warning is thrown by Windows Vista, Windows 7 or Windows 8. A warning may be thrown by other Windows versions, or if chkdsk is applied in
       succession on different Windows versions.

BUGS
       If you find a bug please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       mkntfs was written by Anton Altaparmakov, Richard Russon, Erik Sornes and Szabolcs Szakacsits.  It was ported to ntfs-3g by Erik Larsson and Jean-Pierre Andre.

AVAILABILITY
       mkntfs is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       badblocks(8), ntfsprogs(8)

ntfs-3g 2015.3.14AR.1                                                                          January 2006                                                                                     MKNTFS(8)
