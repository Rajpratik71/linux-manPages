TRANSFORMER(1)                                              BSD General Commands Manual                                             TRANSFORMER(1)

NAME
     xor — apply bytes to the pipeline using XOR
     rot — apply bytes to the pipeline using ROT
     rol — apply bytes to the pipeline using ROL
     caesar — apply bytes to the pipeline using Caesar's Cipher

SYNOPSIS
     <transform> {-h | -v}
     <transform> [-u] [-x] BYTE [BYTE ...]
     <transform> [-u] -s STRING [STRING ...]

DESCRIPTION
     The basic concept for this utility is to apply a set of bytes, repeatedly, to a stream of input.

     The available options are as follows:

     -h      usage information
     -v      the program's version
     -x      explicitly interpret bytes as hexadecimal digits
     -s      use a string of characters as the byte source
     -u      undo - reverse the transform (this is ignored for xor)
     BYTE [BYTE ...]
             a list of bytes to apply to the input stream
     STRING [STRING ...]
             use every character in every given string as the byte mask

IMPLEMENTATION NOTES
     The application of the key bytes is accomplished using one of the following transforms:

     ┌───────┬──────────────────────┬───────┬─────────────┬──────────────┐
     │Name   │ Description          │ Subj  │ Argument    │ Undo         │
     ├───────┼──────────────────────┼───────┼─────────────┼──────────────┤
     │xor    │ bitwise exclusive OR │ bytes │ int [0-255] │ N/A          │
     │rot    │ rotate left          │ bits  │ int [0-7]   │ rotate right │
     │rol    │ rotate (-)           │ bytes │ int [0-255] │ rotate (+)   │
     │caesar │ shift (+)            │ alpha │ int [0-26]  │ shift (-)    │
     └───────┴──────────────────────┴───────┴─────────────┴──────────────┘
EXAMPLES
     As a filter with the hexadecimal bytes [0x20, 0x2f] applied to the input stream using xor.  The bytes are applied repeatedly until the end-
     of-file (i.e., [0x20, 0x2f, 0x20, 0x2f, ...]).
           $ ... | xor -x 20 2f | ...

     As a filter with a string of characters used as a byte source (i.e., "key" becomes [0x6b, 0x65, 0x79, ...]).
           $ ... | xor -s "key" | ...

SEE ALSO
     hdng(1), unhex(1)

AUTHORS
     Zephyr <zephyr@dirtbags.net>,
     pi-rho <pi-rho@tyr.cx>

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
