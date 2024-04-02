WVUNPACK(1)                                                                                                                                                                                       WVUNPACK(1)



NAME
       wvunpack - decodes wavpack encoded files

SYNOPSIS
       wvunpack [-options] INFILE... [-o OUTFILE]

DESCRIPTION
       wvunpack decodes WavPack files back to their uncompressed wav or raw form using the options provided. Unless overridden with the -o switch, the resulting filename will be source-name.wav (or
       source-name.raw when -r used). Multiple WavPack input files may be specified resulting in multiple output files, and in that case -o may be used to specify an alternate target directory.  Stdin and
       stdout may be specified with “-”. WavPack files are generally created with the wavpack program.

OPTIONS
       -b
           blindly decode all stream blocks and ignore length info

       -c
           do not decode audio but instead just extract cuesheet stored in APEv2 tag to stdout (equivalent to -x “cuesheet”)

       -cc
           extract cuesheet stored in APEv2 tag to source-name.cue file in same directory as decoded audio file (equivalent to -xx “cuesheet=%a.cue”)

       -d
           delete source file if successful (use with caution!)

       --help
           display extended help

       -i
           ignore .wvc file (forces hybrid lossy decompression)

       -m
           calculate and display MD5 signature; verify if lossless

       --no-utf8-convert
           leave extracted text tags in UTF-8 encoding during extraction or display

       -o OUTFILE
           specify output filename (only if single source file) or target directory (must exist)

       -q
           quiet (keep console output to a minimum)

       -r
           force raw audio decode by skipping RIFF headers & trailers, results in source-name.raw

       -s
           do not decode audio but simply display summary information about WavPack file to stdout

       -ss
           do not decode audio but simply display summary and tag information about WavPack file to stdout

        --skip=[sample|hh:mm:ss.ss]
           start decoding at specified sample or time index

       -t
           copy input file´s time stamp to output file(s)

        --until=[+|-][sample|hh:mm:ss.ss]
           stop decoding at specified sample or time index, specifying a + causes sample/time to be relative to --skip point, specifying a - causes sample/time to be relative to EOF

       -v
           verify source data only (no output file created)

       -w
           regenerate fresh wav header (ingore RIFF data stored in WavPack file)

       -x “Field”
           do not decode audio but instead just extract the specified tag field to stdout

       -xx “Field[=file]”
           extract the specified tag field to named file in same directory as decoded audio file; optional filename specification may contain %a which is replaced with the audio file base name, %t replaced
           with the tag field name (note: comes from data for binary tags) and %e replaced with the extension from the binary tag source file (or “txt” for text tag).

       -y
           yes to overwrite warning (use with caution!)

SEE ALSO
       wavpack(1), wvgain(1)

       Please visit www.wavpack.com for more information

COPYRIGHT
       This manual page was written by Sebastian Dröge <slomo@debian.org> and David Bryant <david@wavpack.com>. Permission is granted to copy, distribute and/or modify this document under the terms of the
       BSD License.

AUTHORS
       Sebastian Dröge <slomo@debian.org>
           Author.

       David Bryant <david@wavpack.com>
           Author.

COPYRIGHT
       Copyright © 2005 Sebastian Dröge
       Copyright © 2009 David Bryant



                                                                                                  2009-10-17                                                                                      WVUNPACK(1)
