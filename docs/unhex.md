UNHEX(1)                                                    BSD General Commands Manual                                                   UNHEX(1)

NAME
     unhex — translate hexits to their binary equivalent

SYNOPSIS
     unhex [-h | -v]
     unhex [-] [FILE ...]

DESCRIPTION
     The basic concept for this utility is to translate hexits (00-ff) to their binary equivalent. Spaces and other non-hexadecimal characters are
     ignored in the input stream. If non-hexadecimal characters appear between hexit pairs, an error is produced.

     The available options are as follows:

     -h      usage information
     -v      the program's version
     FILE ...
             Ar FILE specifies input filenames.  ‘-’ may be used to signify stdin.  [default: stdin]

EXAMPLES
     With a file specified:
           $ unhex data.bin

     As a filter:
           $ ... | unhex | ...

SEE ALSO
     hdng(1), xor(1)

AUTHORS
     Zephyr <zephyr@dirtbags.net>,
     pi-rho <pi-rho@tyr.cx>

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
