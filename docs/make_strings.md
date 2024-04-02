make_strings(1)                                                GNUstep System Manual                                               make_strings(1)

NAME
       make_strings - tool to build lists of localizable strings from Objective-C files

SYNOPSIS
       make_strings [--help] [--verbose] [--aggresive-import] [--aggressive-match] [--aggressive-remove] [-L languages] files.[hmc...]

DESCRIPTION
       make_strings  parses  Objective-C  files and builds lists of localizable strings.  It then creates new .strings files or merges the strings
       with existing .strings files.  It's fairly intelligent when matching old and new strings, and produces .strings files that are (supposed to
       be) easy for a translator to work with.

       make_strings accepts the following options:

OPTIONS
       --help Prints a short list of available options.

       --verbose
              Prints additional information while processing.

       -L languages
              Specify which languages to process.  Multuple -L options are accepted, or multiple languages defined in one -L flag.

       --aggressive-import
              Activates --aggresive-match and automatically removes "dummy" entries that are added by importing .strings files which were not cre‐
              ated by make_strings program.  This option is suitable when make_strings is run for the first time and there is an existing .strings
              file which contains a fairly accurate translation.

       --aggressive-match
              This  option will make make_strings assume that matching keys should have matching translations.  This can save lots of work, but it
              increases the risk of erroneous translation.

       --aggressive-remove
              Removes obsolete strings/keys.

EXAMPLES
       make_strings -L "English Swedish Russian" *.[hm]

SEE ALSO
       GNUstep(7).

AUTHORS
       make_strings was written Alexander Malmberg <alexander@malmberg.org>.

       This manual page was added by Yavor Doganov <yavor@gnu.org>.

COPYRIGHT
       Copyright (C) 2009 Free Software Foundation, Inc.

       Copying and distribution of this file, with or without modification, are permitted in any medium without  royalty  provided  the  copyright
       notice and this notice are preserved.

GNUstep                                                           August 16, 2009                                                  make_strings(1)
