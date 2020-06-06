pactl(1)                                                                                 General Commands Manual                                                                                 pactl(1)

NAME
       pactl - Control a running PulseAudio sound server

SYNOPSIS
       pactl [options] COMMAND [ARGS ...]

       pactl --help

       pactl --version

DESCRIPTION
       pactl can be used to issue control commands to the PulseAudio sound server.

       pactl only exposes a subset of the available operations. For the full set use the pacmd(1).

OPTIONS
       -h | --help
              Show help.

       --version
              Show version information.

       -s | --server=SERVER
              Choose the server to connect to.

       -n | --client-name=NAME
              Specify the client name pactl shall pass to the server when connecting.

COMMANDS
       stat   Dump a few statistics about the memory usage of the PulseAudio daemon.

       info   Dump some info about the PulseAudio daemon.

       list [short] [TYPE]
              Dump all currently loaded modules, available sinks, sources, streams, etc. TYPE must be one of: modules, sinks, sources, sink-inputs, source-outputs, clients, samples, cards. If not spec‐
              ified, all info is listed. If short is given, output is in a tabular format, for easy parsing by scripts.

       exit   Asks the PulseAudio server to terminate.

       upload-sample FILENAME [NAME]
              Upload a sound from the specified audio file into the sample cache. The file types supported are those understood by libsndfile. The sample in the cache is named  after  the  audio  file,
              unless the name is explicitly specified.

       play-sample NAME [SINK]
              Play the specified sample from the sample cache. It is played on the default sink, unless the symbolic name or the numerical index of the sink to play it on is specified.

       remove-sample NAME
              Remove the specified sample from the sample cache.

       load-module NAME [ARGUMENTS ...]
              Load  the  specified  module  with the specified arguments into the running sound server. Prints the numeric index of the module just loaded to STDOUT. You can use it to unload the module
              later.

       unload-module ID|NAME
              Unload the module instance identified by the specified numeric index or unload all modules by the specified name.

       move-sink-input ID SINK
              Move the specified playback stream (identified by its numerical index) to the specified sink (identified by its symbolic name or numerical index).

       move-source-output ID SOURCE
              Move the specified recording stream (identified by its numerical index) to the specified source (identified by its symbolic name or numerical index).

       suspend-sink SINK 1|0
              Suspend or resume the specified sink (which my be specified either by its symbolic name, or by its numeric index), depending whether 1 (suspend) or 0 (resume) is passed as last  argument.
              Suspending  a  sink  will  pause all playback. Depending on the module implementing the sink this might have the effect that the underlying device is closed, making it available for other
              applications to use. The exact behaviour depends on the module.

       suspend-source SOURCE 1|0
              Suspend or resume the specified source (which my be specified either by its symbolic name, or by its numeric index), depending whether 1 (suspend) or 0 (resume) is passed  as  last  argu‐
              ment.  Suspending  a  source will pause all capturing. Depending on the module implementing the source this might have the effect that the underlying device is closed, making it available
              for other applications to use. The exact behaviour depends on the module.

       set-card-profile CARD PROFILE
              Set the specified card (identified by its symbolic name or numerical index) to the specified profile (identified by its symbolic name).

       set-default-sink SINK
              Make the specified sink (identified by its symbolic name) the default sink.

       set-sink-port SINK PORT
              Set the specified sink (identified by its symbolic name or numerical index) to the specified port (identified by its symbolic name).

       set-default-source SOURCE
              Make the specified source (identified by its symbolic name) the default source.

       set-source-port SOURCE PORT
              Set the specified source (identified by its symbolic name or numerical index) to the specified port (identified by its symbolic name).

       set-port-latency-offset CARD PORT OFFSET
              Set a latency offset to a specified port (identified by its symbolic name) that belongs to a card (identified by its symbolic name or numerical index). OFFSET is a number which represents
              the latency offset in microseconds

       set-sink-volume SINK VOLUME [VOLUME ...]
              Set  the  volume of the specified sink (identified by its symbolic name or numerical index). VOLUME can be specified as an integer (e.g. 2000, 16384), a linear factor (e.g. 0.4, 1.100), a
              percentage (e.g. 10%, 100%) or a decibel value (e.g. 0dB, 20dB). If the volume specification start with a + or - the volume adjustment will be relative to the current sink volume. A  sin‐
              gle volume value affects all channels; if multiple volume values are given their number has to match the sink's number of channels.

       set-source-volume SOURCE VOLUME [VOLUME ...]
              Set the volume of the specified source (identified by its symbolic name or numerical index). VOLUME can be specified as an integer (e.g. 2000, 16384), a linear factor (e.g. 0.4, 1.100), a
              percentage (e.g. 10%, 100%) or a decibel value (e.g. 0dB, 20dB). If the volume specification start with a + or - the volume adjustment will be relative to the  current  source  volume.  A
              single volume value affects all channels; if multiple volume values are given their number has to match the source's number of channels.

       set-sink-input-volume INPUT VOLUME [VOLUME ...]
              Set  the  volume of the specified sink input (identified by its numerical index). VOLUME can be specified as an integer (e.g. 2000, 16384), a linear factor (e.g. 0.4, 1.100), a percentage
              (e.g. 10%, 100%) or a decibel value (e.g. 0dB, 20dB). If the volume specification start with a + or - the volume adjustment will be relative to the current sink  input  volume.  A  single
              volume value affects all channels; if multiple volume values are given their number has to match the sink input's number of channels.

       set-source-output-volume OUTPUT VOLUME [VOLUME ...]
              Set  the volume of the specified source output (identified by its numerical index). VOLUME can be specified as an integer (e.g. 2000, 16384), a linear factor (e.g. 0.4, 1.100), a percent‐
              age (e.g. 10%, 100%) or a decibel value (e.g. 0dB, 20dB). If the volume specification start with a + or - the volume adjustment will be relative to the current  source  output  volume.  A
              single volume value affects all channels; if multiple volume values are given their number has to match the source output's number of channels.

       set-sink-mute SINK 1|0|toggle
              Set the mute status of the specified sink (identified by its symbolic name or numerical index).

       set-source-mute SOURCE 1|0|toggle
              Set the mute status of the specified source (identified by its symbolic name or numerical index).

       set-sink-input-mute INPUT 1|0|toggle
              Set the mute status of the specified sink input (identified by its numerical index).

       set-source-output-mute INPUT 1|0|toggle
              Set the mute status of the specified source output (identified by its numerical index).

       set-sink-formats SINK FORMATS
              Set  the  supported  formats  of the specified sink (identified by its numerical index) if supported by the sink. FORMATS is specified as a semi-colon (;) separated list of formats in the
              form 'encoding[, key1=value1, key2=value2, ...]' (for example, AC3 at 32000, 44100 and 48000 Hz would be specified as 'ac3-iec61937, format.rate = "[ 32000, 44100, 48000 ]"').

       subscribe
              Subscribe to events, pactl does not exit by itself, but keeps waiting for new events.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulseaudio(1), pacmd(1)

Manuals                                                                                            User                                                                                          pactl(1)
