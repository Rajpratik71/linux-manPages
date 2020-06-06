PREZIP(1)                                                                            Aspell Abbreviated User's Manual                                                                           PREZIP(1)

NAME
       prezip, preunzip, precat -  prefix delta compressor for Aspell

SYNOPSIS
       precat [-dzhLV] [-cfksSq] [file ...]

DESCRIPTION
       prezip  is  a  a  prefix  delta compressor.  It is not a general purpose compressor and should only be used on sorted word lists or other similar text files.  It will likely increase the size of
       binary data.

       If invoked as prezip, the default action is to compress.  If invoked as preunzip, the default action is to decompress.  If invoked as precat, the default action is to decompress to stdout.

       If no file names are given then prezip will compress or decompress from the standard input to the standard output.  Short flags can be combined so that "-c -s" is the same as "-cs".

OPTIONS
       -h --help
              display help

       -d --decompress
              force decompression

       -z --compress
              dorce compression

       -L --license
              display software license

       -V --version
              display version

       -c --stdout
              decompress to standard output

       -f --force
              force

       -k --keep
              keep input files

       -s --sort
              sort and remove duplicates before compressing

       -S --nocwl
              do not rename .wl suffix to .cwl (use .wl.pz instead)

       -q --quiet
              suppress all warnings

AUTHOR
       This manual page was written by Brian Nelson <pyro@debian.org> based on the output of help2man.  Aspell is Copyright © 2002 Kevin Atkinson.

GNU                                                                                             March 2010                                                                                      PREZIP(1)
