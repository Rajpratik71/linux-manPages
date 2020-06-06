FDFORMAT(8)                                                                               System Administration                                                                               FDFORMAT(8)

NAME
       fdformat - low-level format a floppy disk

SYNOPSIS
       fdformat [options] device

DESCRIPTION
       fdformat does a low-level format on a floppy disk.  device is usually one of the following (for floppy devices the major = 2, and the minor is shown for informational purposes only):

              /dev/fd0d360  (minor = 4)
              /dev/fd0h1200 (minor = 8)
              /dev/fd0D360  (minor = 12)
              /dev/fd0H360  (minor = 12)
              /dev/fd0D720  (minor = 16)
              /dev/fd0H720  (minor = 16)
              /dev/fd0h360  (minor = 20)
              /dev/fd0h720  (minor = 24)
              /dev/fd0H1440 (minor = 28)

              /dev/fd1d360  (minor = 5)
              /dev/fd1h1200 (minor = 9)
              /dev/fd1D360  (minor = 13)
              /dev/fd1H360  (minor = 13)
              /dev/fd1D720  (minor = 17)
              /dev/fd1H720  (minor = 17)
              /dev/fd1h360  (minor = 21)
              /dev/fd1h720  (minor = 25)
              /dev/fd1H1440 (minor = 29)

       The  generic  floppy  devices, /dev/fd0 and /dev/fd1, will fail to work with fdformat when a non-standard format is being used, or if the format has not been autodetected earlier.  In this case,
       use setfdprm(8) to load the disk parameters.

OPTIONS
       -f, --from N
              Start at the track N (default is 0).

       -t, --to N
              Stop at the track N.

       -r, --repair N
              Try to repair tracks failed during the verification (max N retries).

       -n, --no-verify
              Skip the verification that is normally performed after the formatting.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

SEE ALSO
       fd(4), setfdprm(8), mkfs(8), emkfs(8)

AUTHOR
       Werner Almesberger (almesber@nessie.cs.id.ethz.ch)

AVAILABILITY
       The fdformat command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                      July 2014                                                                                     FDFORMAT(8)
