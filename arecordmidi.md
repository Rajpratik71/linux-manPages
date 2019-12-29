ARECORDMIDI(1)                          General Commands Manual                         ARECORDMIDI(1)

NAME
       arecordmidi - record Standard MIDI Files

SYNOPSIS
       arecordmidi -p client:port[,...] [options] midifile

DESCRIPTION
       arecordmidi  is  a command-line utility that records a Standard MIDI File from one or more ALSA
       sequencer ports.

       To stop recording, press Ctrl+C.

OPTIONS
       -h,--help
              Prints a list of options.

       -V,--version
              Prints the current version.

       -l,--list
              Prints a list of possible input ports.

       -p,--port=client:port,...
              Sets the sequencer port(s) from which events are recorded.

              A client can be specified by its number, its name, or a prefix of its name.  A  port  is
              specified by its number; for port 0 of a client, the ":0" part of the port specification
              can be omitted.

       -b,--bpm=beats
              Sets the musical tempo of the MIDI file, in beats per minute.  The default value is  120
              BPM.

       -f,--fps=frames
              Sets the SMPTE resolution, in frames per second.  Possible values are 24, 25, 29.97 (for
              30 drop-frame), and 30.

       -t,--ticks=ticks
              Sets the resolution of timestamps (ticks) in the MIDI file, in ticks per beat (when  us‐
              ing  musical  tempo) or ticks per frame (when using SMPTE timing).  The default value is
              384 ticks/beat or 40 ticks/frame, respectively.

       -s,--split-channels
              Specifies that the data for each MIDI channel should be written to a separate  track  in
              the  MIDI  file.   This will result in a "format 1" file.  Otherwise, when there is only
              one track, arecordmidi will generate a "format 0" file.

       -m,--metronome=client:port
              Plays a metronome signal on the specified sequencer port.

              Metronome sounds are played on channel 10, MIDI notes 33 & 34 (GM2/GS/XG metronome stan‐
              dard notes), with velocity 100 and duration 1.

       -i,--timesig=numerator:denominator
              Sets the time signature for the MIDI file and metronome.

              The  time  signature  is specified as usual with two numbers, representing the numerator
              and denominator of the time signature as it would be notated. The denominator must be  a
              power  of two. Both numbers should be separated by a colon. The time signature is 4:4 by
              default.

AUTHOR
       Clemens Ladisch <clemens@ladisch.de>

                                              17 Sep 2007                               ARECORDMIDI(1)
