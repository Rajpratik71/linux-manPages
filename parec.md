pacat(1)                                                                                 General Commands Manual                                                                                 pacat(1)

NAME
       pacat - Play back or record raw or encoded audio streams on a PulseAudio sound server

SYNOPSIS
       paplay [options] [FILE]

       parecord [options] [FILE]

       pacat [options] [FILE]

       parec [options] [FILE]

       pamon [options] [FILE]

       pacat --help

       pacat --version

DESCRIPTION
       pacat is a simple tool for playing back or capturing raw or encoded audio files on a PulseAudio sound server. It understands all audio file formats supported by libsndfile.

OPTIONS
       -h | --help
              Show help.

       --version
              Show version information.

       -r | --record
              Capture audio data and write it to the specified file or to STDOUT if none is specified. If the tool is called under the name parec this is the default.

       -p | --playback
              Read audio data from the specified file or STDIN if none is specified, and play it back. If the tool is called under the name pacat this is the default.

       -v | --verbose
              Enable verbose operation. Dumps the current playback time to STDERR during playback/capturing.

       -s | --server=SERVER
              Choose the server to connect to.

       -d | --device=SINKORSOURCE
              Specify the symbolic name of the sink/source to play/record this stream on/from.

       --monitor-stream=INDEX
              Record from the sink input with index INDEX.

       -n | --client-name=NAME
              Specify the client name paplay shall pass to the server when connecting.

       --stream-name=NAME
              Specify the stream name paplay shall pass to the server when creating the stream.

       --volume=VOLUME
              Specify the initial playback volume to use. Choose a value between 0 (silent) and 65536 (100% volume).

       --rate=SAMPLERATE
              Capture or play back audio with the specified sample rate. Defaults to 44100 Hz.

       --format=FORMAT
              Capture  or  play  back  audio  with  the  specified  sample format. Specify one of u8, s16le, s16be, s32le, s32be, float32le, float32be, ulaw, alaw, s32le, s32be, s24le, s24be, s24-32le,
              s24-32be. Depending on the endianness of the CPU the formats s16ne, s16re, s32ne, s32re, float32ne, float32re, s32ne, s32re, s24ne, s24re, s24-32ne, s24-32re (for  native,  resp.  reverse
              endian) are available as aliases. Defaults to s16ne.

       --channels=CHANNELS
              Capture or play back audio with the specified number of channels. If more than two channels are used it is recommended to use the --channel-map option below. Defaults to 2.

       --channel-map=CHANNELMAP
              Explicitly  choose  a  channel  map  when playing back this stream. The argument should be a comma separated list of channel names: front-left, front-right, mono, front-center, rear-left,
              rear-right, rear-center, lfe, front-left-of-center, front-right-of-center, side-left, side-right, top-center, top-front-center, top-front-left, top-front-right,  top-rear-left,  top-rear-
              right, top-rear-center, or any of the 32 auxiliary channel names aux0 to aux31.

       --fix-format
              If passed, the sample format of the stream is changed to the native format of the sink the stream is connected to.

       --fix-rate
              If passed, the sampling rate of the stream is changed to the native rate of the sink the stream is connected to.

       --fix-channels
              If passed, the number of channels and the channel map of the stream is changed to the native number of channels and the native channel map of the sink the stream is connected to.

       --no-remix
              Never upmix or downmix channels.

       --no-remap
              Never remap channels. Instead of mapping channels by their name this will match them solely by their index/order.

       --latency=BYTES
              Explicitly configure the latency, with a time specified in bytes in the selected sample format. If left out the server will pick the latency, usually relatively high for power saving rea‐
              sons. Use either this option or --latency-msec, but not both.

       --latency-msec=MSEC
              Explicitly configure the latency, with a time specified in milliseconds. If left out the server will pick the latency, usually relatively high for power saving reasons.  Use  either  this
              option or --latency, but not both.

       --process-time=BYTES
              Explicitly  configure  the  process  time,  with  a  time  specified  in  bytes in the selected sample format. If left out the server will pick the process time. Use either this option or
              --process-time-msec, but not both.

       --process-time-msec=MSEC
              Explicitly configure the process time, with a time specified in miliseconds. If left out the server will pick the process time. Use either this option or --process-time, but not both.

       --property=PROPERTY=VALUE
              Attach a property to the client and stream. May be used multiple times

       --raw  Play/record raw audio data. This is the default if this program is invoked as pacat , parec or pamon

       --file-format[=FFORMAT]
              Play/record encoded audio data in the file format specified. This is the default if this program is invoked as paplay and parecord

       --list-file-formats
              List supported file formats.

LIMITATIONS
       Due to a limitation in libsndfile paplay currently does not always set the correct channel mapping for playback of multichannel (i.e. surround) audio files, even if the channel mapping  informa‐
       tion is available in the audio file.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulseaudio(1), pactl(1)

Manuals                                                                                            User                                                                                          pacat(1)
