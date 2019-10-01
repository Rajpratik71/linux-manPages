oggdec(1)                                                                                        Vorbis Tools                                                                                       oggdec(1)



NAME
       oggdec - simple decoder, Ogg Vorbis file to PCM audio file (Wave or RAW).


SYNOPSIS
       oggdec [ -QhV ] [ -b bits_per_sample ] [ -e endianness ] [ -R ] [ -s signedness ] [ -o outputfile ] file ...


DESCRIPTION
       oggdec decodes Ogg Vorbis files into PCM-encoded ("uncompressed") audio files, either Wave or RAW format.

       For each input file, oggdec writes to a filename based on the input filename, but with the extension changed to ".wav" or ".raw" as appropriate.

       If  the input file is specified as - , then oggdec will read from stdin, and write to stdout unless an output filename is specified. Likewise, an output filename of - will cause output to be to std‐
       out.

       Writing Wave format to stdout is a bad idea.  Wave requires a seekable medium for the header to be rewritten after all the data is written out; stdout is not seekable.


OPTIONS
       -Q, --quiet
              Suppresses program output.

       -h, --help
              Print help message.

       -V, --version
              Display version information.

       -b n, --bits=n
              Bits per sample.  Valid values are 8 or 16.

       -e n, --endianness=n
              Set endianness for 16-bit output.  0 (default) is little-endian (Intel byte order).  1 is big-endian (sane byte order).

       -R, --raw
              Output in raw format.  If not specified, writes Wave file (RIFF headers).

       -s n, --sign=n
              Set signedness for output.  0 for unsigned, 1 (default) for signed.

       -o filename, --output=filename
              Write output to specified filename.  This option is only valid if one input [file] is specified, or if raw mode is used.


EXAMPLES
       Decode a file enabler.ogg to enabler.wav
        as little-endian unsigned 16-bit (default options):
              oggdec enabler.ogg

       Decode a file enabler.ogg to enabler.raw as headerless little-endian unsigned 16-bit:
              oggdec --raw=1 enabler.ogg

       Decode enabler.ogg to enabler.crazymonkey as unsigned 8-bit:
              oggdec -b 8 -s 0 -o enabler.crazymonkey enabler.ogg

       Decode enabler.ogg to enabler.raw as big-endian signed 16-bit (any of the following):
              oggdec -R -e 1 -b 16 enabler.ogg
              oggdec -R -e 1 -b 16 -o enabler.raw - < enabler.ogg
              oggdec -R -e 1 -b 16 - < enabler.ogg > enabler.raw

       Mass decoding (foo.ogg to foo.wav, bar.ogg to bar.wav, quux.ogg to quux.wav, etc.):
              oggdec *.ogg


AUTHORS
   Program Authors
       Michael Smith <msmith@xiph.org>

   Manpage Authors
       Frederick Lee <phaethon@linux.ucla.edu>, assisted by a few million monkeys armed with keyboards in irc://irc.openprojects.net/#vorbis


SEE ALSO
       ogg123(1), oggenc(1), vorbiscomment(1), flac(1), speexdec(1)



Xiph.Org Foundation                                                                            2008 September 9                                                                                     oggdec(1)
