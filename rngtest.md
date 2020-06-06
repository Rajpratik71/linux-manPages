RNGTEST(1)                                                                                 General Commands Manual                                                                                 RNGTEST(1)



NAME
       rngtest - Check the randomness of data using FIPS 140-2 tests


SYNOPSIS
       rngtest [-c n | --blockcount=n] [-b n | --blockstats=n] [-t n | --timedstats=n] [-p | --pipe] [-?] [--help] [-V] [--version]


DESCRIPTION
       rngtest works on blocks of 20000 bits at a time, using the FIPS 140-2 (errata of 2001-10-10) tests to verify the randomness of the block of data.

       It takes input from stdin, and outputs statistics to stderr, optionally echoing blocks that passed the FIPS tests to stdout (when operating in pipe mode).  Errors are sent to stderr.

       At  startup,  rngtest  will trow away the first 32 bits of data when operating in pipe mode.  It will use the next 32 bits of data to bootstrap the FIPS tests (even when not operating in pipe mode).
       These bits are not tested for randomness.

       Statistics are dumped to stderr when the program exits.


OPTIONS
       -p, --pipe
              Enable pipe mode.  All data blocks that pass the FIPS tests are echoed to stdout, and rngtest operates in silent mode.

       -c n, --blockcount=n (default: 0)
              Exit after processing n input blocks, if n is not zero.

       -b n, --blockstats=n (default: 0)
              Dump statistics every n blocks, if n is not zero.

       -t n, --timedstats=n (default: 0)
              Dump statistics every n seconds, if n is not zero.

       -?, --help
              Give a short summary of all program options.

       -V, --version
              Print program version


STATISTICS
       rngtest will dump statistics to stderr when it exits, and when told to by blockstats or timedstats.

       FIPS 140-2 successes and FIPS 140-2 failures counts the number of 20000-bit blocks either accepted or rejected by the FIPS 140-2 tests.  The other statistics show a breakdown of the FIPS 140-2 fail‐
       ures  by  FIPS  140-2  test.   See  the FIPS 140-2 document for more information (note that these tests are defined on FIPS 140-1 and FIPS 140-2 errata of 2001-10-10. They were removed in FIPS 140-2
       errata of 2002-12-03).

       The speed statistics are taken for every 20000-bit block transferred or processed.


EXIT STATUS
       0 if no errors happen, and no blocks fail the FIPS tests.

       1 if no errors happen, but at least one block fails the FIPS tests.

       10 if there are problems with the parameters.

       11 if an input/output error happens.

       12 if an operating system or resource starvation error happens.


SEE ALSO
       random(4), rngd(8)

       FIPS PUB 140-2 Security Requirements for Cryptographic Modules, NIST,
              http://csrc.nist.gov/groups/STM/cmvp/standards.html


AUTHORS
       Henrique de Moraes Holschuh <hmh@debian.org>




rng-tools 6                                                                                       March 2004                                                                                       RNGTEST(1)
