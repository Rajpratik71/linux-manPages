XDELTA3(1)                                                    General Commands Manual                                                   XDELTA3(1)

NAME
       xdelta3 - VCDIFF (RFC 3284) binary diff tool

SYNOPSIS
       xdelta3 [command] [options] [input [output]]

DESCRIPTION
       xdelta3 is a binary diff tool that uses the VCDIFF (RFC 3284) format and compression.

COMMANDS
       config prints xdelta3 configuration

       decode decompress the input, also set by -d

       encode compress the input, also set by -e (default)

       test   run the builtin tests

       printdelta
              print information about the entire delta

       printhdr
              print information about the first window

       printhdrs
              print information about all windows

       recode encode with new application/secondary settings

OPTIONS
       standard options:

       -0 .. -9
              compression level

       -c     use stdout

       -d     decompress

       -e     compress

       -f     force overwrite

       -h     show help

       -q     be quiet

       -v     be verbose (max 2)

       -V     show version

       memory options:

       -B     bytes source window size

       -W     bytes input window size

       -P     size compression duplicates window

       -I     size instruction buffer size (0 = unlimited)

       compression options:

       -s     source source file to copy from (if any)

       -S [djw|fgk|lzma|none]
              enable/disable secondary compression

       -N     disable small string-matching compression

       -D     disable external decompression (encode/decode)

       -R     disable external recompression (decode)

       -n     disable checksum (encode/decode)

       -C     soft config (encode, undocumented)

       -A [apphead]
              disable/provide application header (encode)

       -J     disable output (check/compute only)

       -T     use alternate code table (test)

NOTES
       The XDELTA environment variable may contain extra args:

              XDELTA="-s source-x.y.tar.gz" \
              tar --use-compress-program=xdelta3 -cf \
              target-x.z.tar.gz.vcdiff target-x.y/

EXAMPLES
       Compress the differences between SOURCE and TARGET, yielding OUT, using "djw" secondary compression:

       xdelta3 -S djw -s SOURCE TARGET OUT

       Do the same, using standard input and output:

       xdelta3 -S djw -s SOURCE < TARGET > OUT

       To decompress OUT, using SOURCE, yielding TARGET:

       xdelta3 -d -s SOURCE OUT TARGET

AUTHOR
       xdelta3 was written by Josh MacDonald <josh.macdonald@gmail.com>.

       This manual page was written by Leo 'costela' Antunes <costela@debian.org> for the Debian project (but may be used by others).

Xdelta3                                                             August 2009                                                         XDELTA3(1)
