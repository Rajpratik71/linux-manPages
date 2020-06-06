APLAYMIDI(1)                                                                             General Commands Manual                                                                             APLAYMIDI(1)

NAME
       aplaymidi - play Standard MIDI Files

SYNOPSIS
       aplaymidi -p client:port[,...] [-d delay] midifile ...

DESCRIPTION
       aplaymidi is a command-line utility that plays the specified MIDI file(s) to one or more ALSA sequencer ports.

OPTIONS
       -h, --help
              Prints a list of options.

       -V, --version
              Prints the current version.

       -l, --list
              Prints a list of possible output ports.

       -p, --port=client:port,...
              Sets the sequencer port(s) to which the events in the MIDI file(s) are sent.

              A client can be specified by its number, its name, or a prefix of its name. A port is specified by its number; for port 0 of a client, the ":0" part of the port specification can be omit‐
              ted.

              Multiple ports can be specified to allow playback of MIDI file(s) that contain events for multiple devices (ports), as specified by "Port Number" meta events.

              For compatibility with pmidi(1), the port specification is taken from the ALSA_OUTPUT_PORTS environment variable if none is given on the command line.

       -d, --delay=seconds
              Specifies how long to wait after the end of each MIDI file, to allow the last notes to die away.

BUGS
       aplaymidi handles "Port Number" meta events, but not "Port Name" meta events.

SEE ALSO
       pmidi(1)
       playmidi(1)

AUTHOR
       Clemens Ladisch <clemens@ladisch.de>

                                                                                                2 Nov 2011                                                                                   APLAYMIDI(1)
