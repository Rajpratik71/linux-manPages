HDNG(1)                                                     BSD General Commands Manual                                                    HDNG(1)

NAME
     hdng — a hex dumper for the next generation

SYNOPSIS
     hdng {-h | -v}
     hdng {-X | -G} [-] [FILE ...]
     hdng [-oxsg] [-w WIDTH] [-] [FILE ...]

DESCRIPTION
     The basic concept for this utility is to emulate the base functionality of a hex dumper as found in bsdmainutil's hexdump(1) while providing
     better representation of the data. A special character set is used so that one might better observe patterns in the data. Additionally, the
     three areas of the hexdump(1) (offsets, hexits, glyphs) can be turned off and the width of data represented in each line of data can be
     changed.

     The available options are as follows:

     -h      usage information
     -v      the program's version
     -o      do not display offsets, including the total byte count
     -x      do not display hexits
     -s      do not abbreviate redundant data
     -g      do not display glyphs
     -w WIDTH
             the WIDTH of data to represent on each line of output
     FILE ...
             a list of files to dump.  ‘-’ may be used to signify stdin.  [default: stdin]

   Special Modes
     The following flags are mutually exclusive. When specified, hdng ignores all other flags.

     -X      turns on continuous hexdump mode
     -G      turns on continuous glyphdump mode

EXAMPLES
     With a file specified
           $ hdng data.bin

     As a filter
           $ ... | hdng | ...

SEE ALSO
     hexdump(1), repr(1), unhex(1), xor(1)

AUTHORS
     Zephyr ⟨zephyr@dirtbags.net⟩,
     pi-rho ⟨pi-rho@tyr.cx⟩

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
