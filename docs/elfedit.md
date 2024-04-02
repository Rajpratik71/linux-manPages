ELFEDIT(1)                                                                               GNU Development Tools                                                                              ELFEDIT(1)

NAME
       elfedit - Update the ELF header of ELF files.

SYNOPSIS
       elfedit [--input-mach=machine]
               [--input-type=type]
               [--input-osabi=osabi]
               --output-mach=machine
               --output-type=type
               --output-osabi=osabi
               [-v|--version]
               [-h|--help]
               elffile...

DESCRIPTION
       elfedit updates the ELF header of ELF files which have the matching ELF machine and file types.  The options control how and which fields in the ELF header should be updated.

       elffile... are the ELF files to be updated.  32-bit and 64-bit ELF files are supported, as are archives containing ELF files.

OPTIONS
       The long and short forms of options, shown here as alternatives, are equivalent. At least one of the --output-mach, --output-type and --output-osabi options must be given.

       --input-mach=machine
           Set the matching input ELF machine type to machine.  If --input-mach isn't specified, it will match any ELF machine types.

           The supported ELF machine types are, i386, IAMCU, L1OM, K1OM and x86-64.

       --output-mach=machine
           Change the ELF machine type in the ELF header to machine.  The supported ELF machine types are the same as --input-mach.

       --input-type=type
           Set the matching input ELF file type to type.  If --input-type isn't specified, it will match any ELF file types.

           The supported ELF file types are, rel, exec and dyn.

       --output-type=type
           Change the ELF file type in the ELF header to type.  The supported ELF types are the same as --input-type.

       --input-osabi=osabi
           Set the matching input ELF file OSABI to osabi.  If --input-osabi isn't specified, it will match any ELF OSABIs.

           The supported ELF OSABIs are, none, HPUX, NetBSD, GNU, Linux (alias for GNU), Solaris, AIX, Irix, FreeBSD, TRU64, Modesto, OpenBSD, OpenVMS, NSK, AROS and FenixOS.

       --output-osabi=osabi
           Change the ELF OSABI in the ELF header to osabi.  The supported ELF OSABI are the same as --input-osabi.

       -v
       --version
           Display the version number of elfedit.

       -h
       --help
           Display the command line options understood by elfedit.

       @file
           Read command-line options from file.  The options read are inserted in place of the original @file option.  If file does not exist, or cannot be read, then the option will be treated
           literally, and not removed.

           Options in file are separated by whitespace.  A whitespace character may be included in an option by surrounding the entire option in either single or double quotes.  Any character
           (including a backslash) may be included by prefixing the character to be included with a backslash.  The file may itself contain additional @file options; any such options will be
           processed recursively.

SEE ALSO
       readelf(1), and the Info entries for binutils.

COPYRIGHT
       Copyright (c) 1991-2018 Free Software Foundation, Inc.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or any later version published by the Free Software
       Foundation; with no Invariant Sections, with no Front-Cover Texts, and with no Back-Cover Texts.  A copy of the license is included in the section entitled "GNU Free Documentation License".

binutils-2.30-system                                                                          2018-09-12                                                                                    ELFEDIT(1)
