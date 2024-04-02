REPR(1)                                                     BSD General Commands Manual                                                    REPR(1)

NAME
     repr — escape unprintable characters

SYNOPSIS
     repr [-h | -v]
     repr [-] [FILE ...]

DESCRIPTION
     The basic concept for this utility is to emulate Python's repr() function. Input bytes are escaped using Python's byte notation if they do
     not fall within the printable range.

     The available options are as follows:

     -h      usage information
     -v      the program's version
     FILE ...
             Ar FILE specifies input filenames.  ‘-’ may be used to signify stdin.  [default: stdin]

EXAMPLES
     With a file specified:
           $ repr data.bin

     As a filter:
           $ ... | repr | ...

SEE ALSO
     hdng(1), xor(1)

AUTHORS
     Zephyr <zephyr@dirtbags.net>,
     pi-rho <pi-rho@tyr.cx>

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
