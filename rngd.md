RNGD(8)                                                                                    System Manager's Manual                                                                                    RNGD(8)



NAME
       rngd - Check and feed random data from hardware device to kernel random device


SYNOPSIS
       rngd  [-b,  --background]  [-f,  --foreground]  [-d,  --debug] [-l, --list] [-x, --exclude] [-i, --ignorefail] [-o, --random-device=file] [-p, --pid-file=file] [-r, --rng-device=file] [-s, --random-
       step=nnn] [-W, --fill-watermark=nnn] [-q, --quiet] [-?, --help] [-V, --version]


DESCRIPTION
       This daemon feeds data from a random number generator to the kernel's random number entropy pool, after first checking the data to ensure that it is properly random.

       The -f or --foreground options can be used to tell rngd to avoid forking on startup.  This is typically used for debugging.  The -b or --background options, which fork and put rngd  into  the  back‐
       ground automatically, are the default.

       The  -r or --rng-device options can be used to select an alternate source of input, besides the default /dev/hwrng.  The -o or --random-device options can be used to select an alternate entropy out‐
       put device, besides the default /dev/random.  Note that this device must support the Linux kernel /dev/random ioctl API.

OPTIONS
       -b, --background
              Become a daemon (default)

       -f, --foreground
              Do not fork and become a daemon

       -d, --debug
              Enable debug messages

       -l, --list
              List the indexes and names of available entropy sources. Exit code when listing sources is 0 if at least 1 entropy source was found and initialized, 1 otherwise.

       -x, --exclude
              Disable entropy sources based on index reported from --list option

       -p file, --pid-file=file
              File used for recording daemon PID, and multiple exclusion (default: /var/run/rngd.pid)

       -i, --ignorefail
              Ignore repeated fips failures

       -o file, --random-device=file
              Kernel device used for random number output (default: /dev/random)

       -r file, --rng-device=file
              Kernel device used for random number input (default: /dev/hwrng)

       -s nnn, --random-step=nnn
              Number of bytes written to random-device at a time (default: 64)

       -e nnn, --entropy-count=nnn
              Number of bits to consider random when adding entropy. 1<=e<=8 (default: 8)

       -W n, --fill-watermark=nnn
              Once we start doing it, feed entropy to random-device until at least fill-watermark bits of entropy are available in its entropy pool.  By default, this value is set to  75%  of  the  entropy
              pool  size or 2048 bits if the entropy pool size couldn't be determined.  Setting this too high will cause rngd to dominate the contents of the entropy pool.  Low values will hurt system per‐
              formance during entropy starves.  Do not set fill-watermark above the size of the entropy pool (usually 4096 bits).

       -q, --quiet
              Suppress all messages

       -?, --help
              Give a short summary of all program options.

       -V, --version
              Print program version


AUTHORS
       Philipp Rumpf
       Jeff Garzik - jgarzik@pobox.com
       Matt Sottek
       Brad Hill
       Neil Horman - nhorman@tuxdriver.com



rng-tools 6                                                                                       March 2001                                                                                          RNGD(8)
