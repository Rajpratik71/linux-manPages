GENCCODE(8)                                ICU 60.2 Manual                                GENCCODE(8)

NAME
       genccode - generate C or platform specific assembly code from an ICU data file.

SYNOPSIS
       genccode [ -h, -?, --help ] [ -a, --assembly name ] [ -d, --destdir destination ] [ -n, --name
       name ] [ -e, --entrypoint name ] [ -f, --filename name ] [ filename ...  ]

DESCRIPTION
       genccode reads each of the supplied filename and writes out a C file containing  a  compilable
       definition  of  the data in the data file.  The C file name is made by taking the base name of
       the data filename, replacing dots by underscores, and adding a .c file extension.

       If the -a option is used, platform specific assembly code is  generated  instead  of  C  code.
       Most  C compilers will accept both C and assembly files.  Instead of writing a filename with a
       .c file extension, a filename with a .s will be written instead.

       If genccode is called with no filename it terminates gracefully.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -a, --assembly name
              Output assembly code instead of C code.  Use -h to see the list of available  types  of
              assembly to generate and to specify for this option.

       -d, --destdir destination
              Set the destination directory to destination.  The default destination directory is the
              current directory.

       -n, --name name
              Set the data name to name instead of the default. This name is also used  as  the  base
              name  of  the  output. The default name is made of the icudt prefix, followed by a two-
              digit version number corresponding to the current version of the  ICU  release,  and  a
              single  letter indicating the endianness of the data (the letter b indicated big endian
              data, and the letter l indicates little endian ones).

       -f, --filename name
              Normally, an ICU data file such as mydata.icu will  be  turned  into  mydata_icu.c  and
              mydata_icu.o.   However, if this parameter was set to "somedata", the output files will
              be somedata.o and somedata.c, respectively.

       -e, --entrypoint name
              Set the data entry point (used for linking against the data in a shared  library  form)
              to  name.   The  default  entry  point  name is made of the data (set by the -n, --name
              option) followed by an underscore and the type of the  data  (set  by  the  -t,  --type
              option).

VERSION
       60.2

COPYRIGHT
       Copyright (C) 2000-2004 IBM, Inc. and others.

ICU MANPAGE                                 11 March 2004                                 GENCCODE(8)
