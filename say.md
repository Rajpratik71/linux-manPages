say(1)                                                         GNUstep System Manual                                                        say(1)

NAME
       say - convert text to audible speech using the GNUstep speech engine

SYNOPSIS
       say [-f filename] [some_text]

DESCRIPTION
       say  is  a  simple  GNUstep tool which uses the GNUstep Speech Engine to convert input text to audible speech and play it through the sound
       device.

OPTIONS
       -f filename
              Read input text from filename

       some text
              Any text passed on the command line

EXAMPLES
       say -f foo.txt

       say Hello, world!

SEE ALSO
       GSSpeechServer(1), GNUstep(7).

AUTHORS
       say was written by David Chisnall <theraven@sucs.org>.  This man page was written by Yavor Doganov <yavor@gnu.org>.

COPYRIGHT
       Copyright (C) 2010 Free Software Foundation, Inc.

       Copying and distribution of this file, with or without modification, are permitted in any medium without  royalty  provided  the  copyright
       notice and this notice are preserved.

GNUstep                                                              June 2010                                                              say(1)
