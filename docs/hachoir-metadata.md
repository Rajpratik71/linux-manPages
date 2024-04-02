METADATA(1)                                                        User Commands                                                       METADATA(1)

NAME
       Metadata - extract meta-datas from a file

DESCRIPTION
       usage: hachoir-metadata [options] files

   options:
       -h, --help
              show this help message and exit

              Metadata:

              Option of metadata extraction and display

       --type Only display file type (description)

       --mime Only display MIME type

       --level=LEVEL
              Quantify of information to display from 1 to 9 (9 is the maximum)

       --raw  Raw output

       --bench
              Run benchmark

       --parser-list
              List all parsers then exit

       --profiler
              Run profiler

       --version
              Display version and exit

       --quality=QUALITY
              Information quality (0.0=fastest, 1.0=best, and default is 0.5)

       --maxlen=MAXLEN
              Maximum string length in characters, 0 means unlimited (default: 300)

              Hachoir library:

              Configure Hachoir library

       --verbose
              Verbose mode

       --log=LOG
              Write log in a file

       --quiet
              Quiet mode (don't display warning)

       --debug
              Debug mode

Metadata extractor version 1.3                                     January 2010                                                        METADATA(1)
