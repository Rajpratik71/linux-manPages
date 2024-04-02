RASM2(1)                                                    BSD General Commands Manual                                                   RASM2(1)

NAME
     rasm2 — radare2 assembler and disassembler tool

SYNOPSIS
     rasm2 [-ABdDeEfCLvwrq] [-a arch] [-b bits] [-c cpu] [-F in:out] [-o offset] [-O ofile] [-s syntax] [-i int] [-l int] [ARG]

DESCRIPTION
     This tool uses r_asm to assemble and disassemble files or hexpair strings. It supports a large list of architectures which can be listed
     using the -L flag.

     -a arch     Set architecture plugin

     -A          Show analysis information of given hexpair string

     -b bits     Set architecture bits

     -B          Binary input/output (-l is mandatory for binary input)

     -c cpu      Select specific CPU (depends on -a arch)

     -C          Output in C format

     -d          Disassemble hexpair bytes. rasm2 -d 9090

     -D          Disassemble showing hexpair and opcode

     -e          Use big endian (or swap endianness if used more than once)

     -E          Output disassembled instructions in ESIL format.

     -f          Read data from file instead of ARG.

     -F in:out   Specify input and/or output filters (att2intel, x86.pseudo, ...)

     -h          Show usage help message.

     -hh         Show long help message including supported assembler directives

     -l int      Input/Output length

     -i int      Ignore/skip N bytes from the beginning of the input buffer

     -L          List supported asm plugins

     -o offset   Offset of the opcode to assemble (default is 0)

     -O ofile    output to file, for example 'rasm2 -BF a a.asm'

     -r          Show output in r2 script

     -s syntax   Select syntax output (intel, att)

     -w          Describe opcode (whats op)

     -q          Quiet output (handy for -L, -v, ...)

different than filename
     -.intel_syntax
                 Use intel syntax rather than att:w

     -.att_syntax
                 Use ATT syntax rather than flu :w dentify the region fof aslerrger

     -string     dentify the region fof aslerrger

     -.ascii

     -.align

     -.arm

     -.thumb

     -.arch

     -.bits

     -.fill

     -.kernel

     -.os

     -.hex

     -.int16

     -.short

     -.int32

     -.int64

     -.glob

     -.equ

     -.org

     -.text

     -.data

EXAMPLES
     Assemble opcode:

       $ rasm2 -a x86 -b 32 'mov eax, 33'

     Disassemble opcode:

       $ rasm2 -d 90

SEE ALSO
     radare2(1), rafind2(1), rahash2(1), rabin2(1), radiff2(1), ragg2(1), rarun2(1), rax2(1),

AUTHORS
     pancake <pancake@nopcode.org>

                                                                   Sep 30, 2014
