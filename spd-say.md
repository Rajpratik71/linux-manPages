SPD-SAY(1)                                                                                                                                           User Commands                                                                                                                                           SPD-SAY(1)

NAME
       spd-say - manual page for spd-say 0.9.1

SYNOPSIS
       spd-say [options] "some text"

DESCRIPTION
       send text-to-speech output request to speech-dispatcher

OPTIONS
       -r, --rate
              Set the rate of the speech (between -100 and +100, default: 0)

       -p, --pitch
              Set the pitch of the speech (between -100 and +100, default: 0)

       -R, --pitch-range
              Set the pitch range of the speech (between -100 and +100, default: 0)

       -i, --volume
              Set the volume (intensity) of the speech (between -100 and +100, default: 0)

       -o, --output-module
              Set the output module

       -O, --list-output-modules
              Get the list of output modules

       -I, --sound-icon
              Play the sound icon

       -l, --language
              Set the language (ISO code)

       -t, --voice-type
              Set the preferred voice type (male1, male2, male3, female1, female2 female3, child_male, child_female)

       -L, --list-synthesis-voices
              Get the list of synthesis voices

       -y, --synthesis-voice
              Set the synthesis voice

       -m, --punctuation-mode
              Set the punctuation mode (none, some, all)

       -s, --spelling
              Spell the message

       -x, --ssml
              Set SSML mode on (default: off)

       -e, --pipe-mode
              Pipe from stdin to stdout plus Speech Dispatcher

       -P, --priority
              Set priority of the message (important, message, text, notification, progress;default: text)

       -N, --application-name
              Set the application name used to establish the connection to specified string value (default: spd-say)

       -n, --connection-name
              Set the connection name used to establish the connection to specified string value (default: main)

       -w, --wait
              Wait till the message is spoken or discarded

       -S, --stop
              Stop speaking the message being spoken

       -C, --cancel
              Cancel all messages

       -v, --version
              Print version and copyright info

       -h, --help
              Print this info

       Please report bugs to speechd-discuss@nongnu.org

COPYRIGHT
       Copyright © 2002-2012 Brailcom, o.p.s.
       This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2, or (at your option) any later version. Please see COPYING for more details.

SEE ALSO
       The full documentation for spd-say is maintained as a Texinfo manual.  If the info and spd-say programs are properly installed at your site, the command

              info spd-say

       should give you access to the complete manual.

spd-say 0.9.1                                                                                                                                         August 2019                                                                                                                                            SPD-SAY(1)
