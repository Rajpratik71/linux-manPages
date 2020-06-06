UUIDGEN(1)                                                                                    User Commands                                                                                    UUIDGEN(1)

NAME
       uuidgen - create a new UUID value

SYNOPSIS
       uuidgen [options]

DESCRIPTION
       The uuidgen program creates (and prints) a new universally unique identifier (UUID) using the libuuid(3) library.  The new UUID can reasonably be considered unique among all UUIDs created on the
       local system, and among UUIDs created on other systems in the past and in the future.

       There are two types of UUIDs which uuidgen can generate: time-based UUIDs and random-based UUIDs.  By default uuidgen will generate a random-based UUID if a high-quality random number  generator
       is present.  Otherwise, it will choose a time-based UUID.  It is possible to force the generation of one of these two UUID types by using the -r or -t options.

OPTIONS
       -r, --random
              Generate  a  random-based  UUID.   This method creates a UUID consisting mostly of random bits.  It requires that the operating system have a high quality random number generator, such as
              /dev/random.

       -t, --time
              Generate a time-based UUID.  This method creates a UUID based on the system clock plus the system's ethernet hardware address, if present.

       -h, --help
              Display help text and exit.

       -V, --version
              Display version information and exit.

CONFORMING TO
       OSF DCE 1.1

AUTHOR
       uuidgen was written by Andreas Dilger for libuuid.

SEE ALSO
       libuuid(3)

AVAILABILITY
       The uuidgen command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                      June 2011                                                                                      UUIDGEN(1)
