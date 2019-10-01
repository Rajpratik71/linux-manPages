MCOOKIE(1)                                                                                      User Commands                                                                                      MCOOKIE(1)



NAME
       mcookie - generate magic cookies for xauth

SYNOPSIS
       mcookie [options]

DESCRIPTION
       mcookie generates a 128-bit random hexadecimal number for use with the X authority system.  Typical usage:
              xauth add :0 . `mcookie`

       The  "random" number generated is actually the output of the MD5 message digest fed with various pieces of random information: the current time, the process id, the parent process id, and optionally
       the contents of an input file. and several bytes of information from the first of the following devices which is present: /dev/random, /dev/urandom, files in /proc, /dev/audio.

OPTIONS
       -f, --file=FILE
              Use file as a macig cookie seed. When file is defined as `-' character input is read from stdin.

       -v, --verbose
              Explain what is being done.

       -V, --version
              Output version information and exit.

       -h, --help
              Display this help and exit.

BUGS
       The entropy in the generated 128-bit is probably quite small (and, therefore, vulnerable to attack) unless a non-pseudorandom number generator is used (e.g., /dev/random under Linux).

       It is assumed that none of the devices opened will block.

FILES
       /dev/random
       /dev/urandom
       /dev/audio
       /proc/stat
       /proc/loadavg

SEE ALSO
       X(1), xauth(1), md5sum(1)

AVAILABILITY
       The mcookie command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        June 2011                                                                                        MCOOKIE(1)
