SIZE(1)                                                                                  GNU Development Tools                                                                                 SIZE(1)

NAME
       size - list section sizes and total size.

SYNOPSIS
       size [-A|-B|--format=compatibility]
            [--help]
            [-d|-o|-x|--radix=number]
            [--common]
            [-t|--totals]
            [--target=bfdname] [-V|--version]
            [objfile...]

DESCRIPTION
       The GNU size utility lists the section sizes---and the total size---for each of the object or archive files objfile in its argument list.  By default, one line of output is generated for each
       object file or each module in an archive.

       objfile... are the object files to be examined.  If none are specified, the file "a.out" will be used.

OPTIONS
       The command line options have the following meanings:

       -A
       -B
       --format=compatibility
           Using one of these options, you can choose whether the output from GNU size resembles output from System V size (using -A, or --format=sysv), or Berkeley size (using -B, or
           --format=berkeley).  The default is the one-line format similar to Berkeley's.

           Here is an example of the Berkeley (default) format of output from size:

                   $ size --format=Berkeley ranlib size
                   text    data    bss     dec     hex     filename
                   294880  81920   11592   388392  5ed28   ranlib
                   294880  81920   11888   388688  5ee50   size

           This is the same data, but displayed closer to System V conventions:

                   $ size --format=SysV ranlib size
                   ranlib  :
                   section         size         addr
                   .text         294880         8192
                   .data          81920       303104
                   .bss           11592       385024
                   Total         388392

                   size  :
                   section         size         addr
                   .text         294880         8192
                   .data          81920       303104
                   .bss           11888       385024
                   Total         388688

       --help
           Show a summary of acceptable arguments and options.

       -d
       -o
       -x
       --radix=number
           Using one of these options, you can control whether the size of each section is given in decimal (-d, or --radix=10); octal (-o, or --radix=8); or hexadecimal (-x, or --radix=16).  In
           --radix=number, only the three values (8, 10, 16) are supported.  The total size is always given in two radices; decimal and hexadecimal for -d or -x output, or octal and hexadecimal if
           you're using -o.

       --common
           Print total size of common symbols in each file.  When using Berkeley format these are included in the bss size.

       -t
       --totals
           Show totals of all objects listed (Berkeley format listing mode only).

       --target=bfdname
           Specify that the object-code format for objfile is bfdname.  This option may not be necessary; size can automatically recognize many formats.

       -V
       --version
           Display the version number of size.

       @file
           Read command-line options from file.  The options read are inserted in place of the original @file option.  If file does not exist, or cannot be read, then the option will be treated
           literally, and not removed.

           Options in file are separated by whitespace.  A whitespace character may be included in an option by surrounding the entire option in either single or double quotes.  Any character
           (including a backslash) may be included by prefixing the character to be included with a backslash.  The file may itself contain additional @file options; any such options will be
           processed recursively.

SEE ALSO
       ar(1), objdump(1), readelf(1), and the Info entries for binutils.

COPYRIGHT
       Copyright (c) 1991-2018 Free Software Foundation, Inc.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or any later version published by the Free Software
       Foundation; with no Invariant Sections, with no Front-Cover Texts, and with no Back-Cover Texts.  A copy of the license is included in the section entitled "GNU Free Documentation License".

binutils-2.30-system                                                                          2018-09-12                                                                                       SIZE(1)
