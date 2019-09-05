smistrip(1)                                                                                       SMI Tools                                                                                       smistrip(1)



NAME
       smistrip - extract MIB or PIB modules from text files, like RFCs or I-Ds

SYNOPSIS
       smistrip [ -Vhn ] [ -d dir ] [ -m module ] [ file(s) ]

DESCRIPTION
       The smistrip program is used to extract MIB and PIB module files from ASCII documents like RFCs or Internet Drafts. Modules are identified by a starting ASN.1 DEFINITIONS clause and the matching END
       clause. The output is written to files named by the modules' names.

OPTIONS
       -V     Show the smistrip version and exit.

       -h     Show a help text and exit.

       -n     Print only what would be extracted, but do not write any output file.

       -d dir Write module file(s) to directory dir instead of the current working directory.

       -m module
              Extract only the module module instead of all modules found in the input file(s).

       file(s)
              The input text file(s) from which modules will be extracted. If no file is given, input is read from stdin.

       Note that smistrip tries to be smart about locating module start and end, detecting page breaks and blank lines near page breaks. It also tries to cut off blank prefixing columns from all lines of a
       modules.  However,  there  might  by documents that cannot be parsed correctly by smistrip and probably produce incorrect output.  You might consider to use smilint on every extracted module file to
       check its syntactical correctness.

EXAMPLE
       This example extracts only the module IPV6-MIB from the file rfc2465 and writes it to the directory /usr/local/tmp.
         $ smistrip -d /usr/local/tmp -m IPV6-MIB rfc2465

SEE ALSO
       The libsmi(3) project is documented at http://www.ibr.cs.tu-bs.de/projects/libsmi/.

       smilint(1)

AUTHOR
       (C) 1999-2004 F. Strauss, TU Braunschweig, Germany <strauss@ibr.cs.tu-bs.de>
       (C) 2002 M. Bunkus, TU Braunschweig, Germany <bunkus@ibr.cs.tu-bs.de>
       and contributions by many other people.



IBR                                                                                            August 10, 2004                                                                                    smistrip(1)
