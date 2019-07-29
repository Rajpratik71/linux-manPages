paplay(1)                                                                                  General Commands Manual                                                                                  paplay(1)



NAME
       paplay - Play back audio files on a PulseAudio sound server

SYNOPSIS
       paplay [options] FILE

       paplay --help

       paplay --version

DESCRIPTION
       paplay is a simple tool for playing back audio files on a PulseAudio sound server. It understands all audio file formats supported by libsndfile.

OPTIONS
       -h | --help
              Show help.

       --version
              Show version information.

       -v | --verbose
              Enable verbose operation. Dumps the current playback time to STDERR during playback.

       -s | --server=SERVER
              Choose the server to connect to.

       -d | --device=SINK
              Specify the symbolic name of the sink to play this file on.

       -n | --client-name=NAME
              Specify the client name paplay shall pass to the server when connecting.

       --stream-name=NAME
              Specify the stream name paplay shall pass to the server when creating the stream.

       --volume=VOLUME
              Specify the initial playback volume to use. Choose a value between 0 (silent) and 65536 (100% volume).

       --channel-map=CHANNELMAP
              Explicitly  choose  a  channel map when playing back this stream. The argument should be a comma separated list of channel names: front-left, front-right, mono, front-center, rear-left, rear-
              right, rear-center, lfe, front-left-of-center, front-right-of-center, side-left, side-right, top-center, top-front-center, top-front-left, top-front-right, top-rear-left, top-rear-right, top-
              rear-center, or any of the 32 auxiliary channel names aux0 to aux31.

LIMITATIONS
       Due  to  a limitation in libsndfile paplay currently does not always set the correct channel mapping for playback of multichannel (i.e. surround) audio files, even if the channel mapping information
       is available in the audio file.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulseaudio(1), pacat(1)



Manuals                                                                                              User                                                                                           paplay(1)
