RAX2(1)                                                     BSD General Commands Manual                                                    RAX2(1)

NAME
     rax2 — radare base converter

SYNOPSIS
     rax2 [-ebBsSvxkKh] [[expr] ...]

DESCRIPTION
     This command is part of the radare project.

     This command allows you to convert values between positive and negative integer, float, octal, binary and hexadecimal values.

OPTIONS
     -b          Convert from binary string to character (rax2 -b 01000101)

     -k          Keep the same base as the input data

     -e          Swap endian.

     -F          Read C strings from stdin and output in hexpairs. Useful to load shellcodes

     -l          Append newline to the decoded output for human friendly-ness

     -K          Show randomart key asciiart for values or hexpairs

     -s          Convert from hex string to character (rax2 -s 43 4a 50)

     -S          Convert from character to hex string (rax2 -S C J P)

     -n          Show hexpairs from integer value

     -N          Show hexadecimal C string from integer value

     -u          Convert given value to human readable units format

     -v          Show program version

     -x          Convert a string into a hash

     -h          Show usage help message

USAGE
     Force output mode (numeric base)

       =f    floating point
       =2    binary
       =3    ternary
       =8    octal
       =10   decimal
       =16   hexadecimal

     Available variable types are:

       int   ->  hex    rax2 10
       hex   ->  int    rax2 0xa
       -int  ->  hex    rax2 -77
       -hex  ->  int    rax2 0xffffffb3
       int   ->  bin    rax2 b30
       bin   ->  int    rax2 1010d
       float ->  hex    rax2 3.33f
       hex   ->  float  rax2 Fx40551ed8
       oct   ->  hex    rax2 35o
       hex   ->  oct    rax2 Ox12 (O is a letter)
       bin   ->  hex    rax2 1100011b
       hex   ->  bin    rax2 Bx63

     With no arguments, rax2 reads values from stdin. You can pass one or more values as arguments.

       $ rax2 33 0x41 0101b
       0x21
       65
       0x5

     You can do 'unpack' hexpair encoded strings easily.

       $ rax2 -s 41 42 43
       ABC

     And it supports some math operations.

       $ rax2
       0x5*101b+5
       30

     It is a very useful tool for scripting, so you can read floating point values, or get the integer offset of a jump or a stack delta when ana‐
     lyzing programs.

SEE ALSO
     radare2(1), rahash2(1), rafind2(1), rabin2(1), radiff2(1), ragg2(1), rarun2(1), rasm2(1)

AUTHORS
     Written by pancake <pancake@nopcode.org>.

                                                                   Jul 28, 2017
