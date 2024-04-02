AFM2AFM(1)                                                                            Marc Penninga                                                                            AFM2AFM(1)

NAME
       afm2afm - reencode an afm file

SYNOPSIS
       afm2afm [-help] [-encoding encodingfile] [-kpx kpxfile] [-output outputfile] afmfile

DESCRIPTION
       afm2afm re-encodes an afm file.

       Metrics (including kerning data) for characters not present in the chosen encoding are excluded from the output, which resuls in (potentially much) smaller files.

       Additional kerning pairs can be added to the output file.  If you don't specify an encoding file, the afm file isn't re-encoded; however, all unused (unencoded) data is still
       pruned.

       The program also generates an entry for a dvips-style map file, but only if the afm file has been re-encoded and the output was written to file (i.e., if both the -encoding and
       -output options were specified).

OPTIONS AND ARGUMENTS
       -help
           Print a short description of the syntax

       -encoding encodingfile
           Re-encode to the enconding in encodingfile

       -kpx kpxfile
           Read additional kerning pairs from kpxfile and add these to the output.  This option cannot be used to override values from the input afm file, since afm2afm will write both
           old and new values to the output!

           The kpxfile should contain kerning data in standard afm format, i.e. for each kerning pair there should be a line

               KPX <left_glyph> <right_glyph> <amount>

           All other lines in the kpxfile are ignored.

       -output outputfile
           Write the result to outputfile instead of "stdout".

       afmfile
           The afm file to be re-encoded.

       You may use either one or two dashes before options, and option names may be shortened to a unique prefix.

AUTHOR
       Marc Penninga <marcpenninga@gmail.com>

COPYRIGHT
       Copyright (C) 2005-2013 Marc Penninga.

LICENSE
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either
       version 2 of the License, or (at your option) any later version.  A copy of the GNU General Public License is included with afm2afm; see the file GPLv2.txt.

DISCLAIMER
       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
       PURPOSE.  See the GNU General Public License for more details.

RECENT CHANGES
       (See the source code for the rest of the story.)

       2013-08-07  Added the -kpx command-line option.  Replaced all "given/when" constructions in the source code by "if"'s, to avoid warnings about experimental features in Perl 5.18
                   and later.

       2012-02-01  Refactored the code; added the "no re-encoding, only pruning" functionality.

fontools                                                                                2013-08-07                                                                             AFM2AFM(1)
