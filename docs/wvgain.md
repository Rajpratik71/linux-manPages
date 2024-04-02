WVGAIN(1)                                                                                                                                                                                           WVGAIN(1)



NAME
       wvgain - adds ReplayGain information to wavpack files

SYNOPSIS
       wvgain [-options] INFILE...

DESCRIPTION
       wvgain perceptually analyzes WavPack audio files for volume, calculates ReplayGain information based on this, and adds the appropriate APEv2 tag fields. ReplayGain-enabled players will use this
       information to produce the same perceived loudness on all tracks. Both individual track and whole album ReplayGain information can be calculated.

OPTIONS
       -a
           album mode (all files scanned are considered an album)

       -c
           clean ReplayGain values from all files

       -d
           display calculated values only (no files are modified)

       -i
           ignore .wvc file (forces hybrid lossy)

       -n
           new files only (skip files with track info, or album info if album mode specified)

       -s
           show stored values only (no analysis)

       -q
           quiet (keep console output to a minimum)

SEE ALSO
       wavpack(1), wvunpack(1)

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



                                                                                                  2009-10-17                                                                                        WVGAIN(1)
