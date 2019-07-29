MCOOKIE(1)                      User Commands                      MCOOKIE(1)

NAME
       mcookie - generate magic cookies for xauth

SYNOPSIS
       mcookie [options]

DESCRIPTION
       mcookie generates a 128-bit random hexadecimal number for use with the
       X authority system.  Typical usage:

              xauth add :0 . `mcookie`

       The "random" number generated is actually the MD5  message  digest  of
       random  information  coming  from  one  of  the  sources /dev/urandom,
       /dev/random, or the libc pseudo-random functions, in  this  preference
       order.

OPTIONS
       -f, --file file
              Use this file as an additional source of randomness.  When file
              is '-', characters are read from standard input.

       -m, --max-size number
              Read from file only this number of bytes.  This option is meant
              to  be  used  when reading additional randomness from a file or
              device.

              The number argument may be followed by the multiplicative  suf‐
              fixes  KiB=1024,  MiB=1024*1024,  and  so on for GiB, TiB, PiB,
              EiB, ZiB and YiB (the "iB" is optional, e.g., "K" has the  same
              meaning as "KiB") or the suffixes KB=1000, MB=1000*1000, and so
              on for GB, TB, PB, EB, ZB and YB.

       -v, --verbose
              Inform where randomness originated, with amount of entropy read
              from each source.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

BUGS
       It is assumed that none of the randomness sources will block.

FILES
       /dev/urandom
       /dev/random

SEE ALSO
       md5sum(1), X(1), xauth(1), rand(3)

AVAILABILITY
       The mcookie command is part of the util-linux package and is available
       from  Linux  Kernel  Archive   ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                      December 2014                      MCOOKIE(1)
