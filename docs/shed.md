shed(1)                                                       General Commands Manual                                                      shed(1)

NAME
       shed - simple hex editor with a pico-style interface

SYNOPSIS
       shed [OPTIONS] [FILE]

DESCRIPTION
       A simple hex editor with a pico-style interface.

       Each  line  of the shed display represents one byte of the file. Each lines consists of the offset of that byte from the start of the file,
       the ascii value of the byte, and then the byte's value in various bases. All values are unsigned.

       When a command asks you for input, entering a zero-length string or pressing ^C will cancel the command.  When searching, entering a  zero-
       length string will use the previous search word, if one exists.

       Note  that  there  is  no  save key. This is because the file is not loaded into memory, so when you edit it the change is made directly to
       disk.

OPTIONS
       -r / --readonly
              open FILE read only

       -s / --start=OFFSET
              position cursor to offset

       -H / --hex
              start in hex mode (hex offsets etc.)

       -L / --length=LENGTH
              set length of file to LENGTH. Useful for special files where shed cannot obtain the length with stat.

       -h / --help
              show help and exit

       -v / --version
              show version and exit

KEYS
       arrow keys
              move cursor around

       pgup / ^Y
              cursor up 16 pgdown / ^V cursor down 16

       home / ^A
              start of line (ascii column)

       end / ^E
              end of line (binary column)

       space / e
              edit value at cursor. You are asked to enter the new value in the format of the current column the cursor is in - eg. if you are  in
              the hex column, it will ask for the new value in hex.

       1 / 2 / 4
              set size of cursor in bytes, in the hex/dec/oct columns (and binary if in traditional mode).

       ` (backtick)
              toggle the endianness of multi-byte values (when cursor size is 2 or 4)

       s / w / ^w / f / F3
              search.  Search  string  is  asked for in the format of the current cursor column.  In ascii, just enter the string in ascii. In the
              others, enter the values  separated by spaces.  eg to search for ABC from the decimal column you would enter "65 66 67" (without the
              quotes).

       ^f / ^b
              search shortcut for forwards/backwards respectivly.

       r / n / F3
              repeat previous search

       t      toggle whether offset numbers and cursor position etc are in dec or hex.

       b      toggle binary mode column behaviour (bit edit mode vs traditional)

       d      dump to file.

       j      jump to byte. enter a byte number, or 'top' or 'end'. Can be suffixed with K, M or G.

       a      change the mode of the ascii column (printable only/c-style extended chars/'man ascii' descriptions)

       p      toggle 'preview' mode.

       x / ^x exit

AUTHOR
       Alex Sisson (alexsisson@gmail.com)

HOMEPAGE
       Check for updates at http://shed.sourceforge.net

shed-1.15                                                           24-MAR-2009                                                            shed(1)
