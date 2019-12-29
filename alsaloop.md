ALSALOOP(1)                             General Commands Manual                            ALSALOOP(1)

NAME
       alsaloop - command-line PCM loopback

SYNOPSIS
       alsaloop [-option] [cmd]

DESCRIPTION
       alsaloop allows create a PCM loopback between a PCM capture device and a PCM playback device.

       alsaloop supports multiple soundcards, adaptive clock synchronization, adaptive rate resampling
       using the samplerate library (if available in the system). Also, mixer controls  can  be  redi‐
       rected from one card to another (for example Master and PCM).

OPTIONS
       -h | --help

              Prints the help information.

       -g <file> | --config=<file>

              Use  given  configuration file. The syntax of this file is simple: one line contains the
              command line options for one job. The '#' means comment and rest of line is ignored. Ex‐
              ample:

                # First line - comment, second line - first job
                -C hw:1,0 -P hw:0,0 -t 50000 -T 1
                # Third line - comment, fourth line - second job
                -C hw:1,1 -P hw:0,1 -t 40000 -T 2

       -d | --daemonize

              Daemonize the main process and use syslog for messages.

       -P <device> | --pdevice=<device>

              Use given playback device.

       -C <device> | --cdevice=<device>

              Use given capture device.

       -X <device> | --pctl=<device>

              Use given CTL device for playback.

       -Y <device> | --cctl=<device>

              Use given CTL device for capture.

       -l <latency> | --latency=<frames>

              Requested latency in frames.

       -t <usec> | --tlatency=<usec>

              Requested latency in usec (1/1000000sec).

       -f <format> | --format=<format>

              Format  specification (usually S16_LE S32_LE). Use -h to list all formats.  Default for‐
              mat is S16_LE.

       -c <channels> | --channels=<channels>

              Channel count specification. Default value is 2.

       -c <rate> | --rate=<rate>

              Rate specification. Default value is 48000 (Hz).

       -n | --resample

              Allow rate resampling using alsa-lib.

       -A <converter> | --samplerate=<converter>

              Use libsamplerate and choose a converter:

                0 or sincbest     - best quality
                1 or sincmedium   - medium quality
                2 or sincfastest  - lowest quality
                3 or zerohold     - hold zero samples
                4 or linear       - worst quality - linear resampling
                5 or auto         - choose best method

       -B <size> | --buffer=<size>

              Buffer size in frames.

       -E <size> | --period=<size>

              Period size in frames.

       -s <secs> | --seconds=<secs>

              Duration of loop in seconds.

       -b | --nblock

              Non-block mode (very early process wakeup). Eats more CPU.

       -S <mode> | --sync=<mode>

              Sync mode specification for capture to playback stream:
                0 or none       - do not touch the stream
                1 or simple     - add or remove samples to keep
                                  both streams synchronized
                2 or captshift  - use driver for the capture device
                                  (if supported) to compensate
                                  the rate shift
                3 or playshift  - use driver for the playback device
                                  (if supported) to compensate
                                  the rate shift
                4 or samplerate - use samplerate library to do rate resampling
                5 or auto       - automatically selects the best method
                                  in this order: captshift, playshift,
                                  samplerate, simple

       -T <num> | --thread=<num>

              Thread number (-1 means create a unique thread). All jobs with same thread  numbers  are
              run within one thread.

       -m <mixid> | --mixer=<midid>

              Redirect  mixer  control  from the playback card to the capture card. Format of mixid is
              SRCID(PLAYBACK)[@DSTID(PLAYBACK)]:

                "name='Master Playback Switch'@name='Another Switch'"
                "name='PCM Playback Volume'"

              Known attributes:

                name      - control ID name
                index     - control ID index
                device    - control ID device
                subdevice - control ID subdevice
                iface     - control ID interface
                numid     - control ID numid

       -O <ossmixid> | --ossmixer=<midid>

              Redirect mixer control from the OSS Mixer emulation layer (capture  card)  to  the  ALSA
              layer (capture card). Format of ossmixid is ALSAID[,INDEX]@OSSID:

                "Master@VOLUME"
                "PCM,1@ALTPCM"

              Known OSS attributes:

                VOLUME, BASS, TREBLE, SYNTH, PCM, SPEAKER, LINE, MIC, CD, IMIX, ALTPCM,
                RECLEV, IGAIN, OGAIN, LINE1, LINE2, LINE3, DIGITAL1, DIGITAL2, DIGITAL3,
                PHONEIN, PHONEOUT, VIDEO, RADIO, MONITOR

       -v | --verbose

              Verbose mode. Use multiple times to increase verbosity.

       -U | --xrun

              Verbose xrun profiling.

       -W <timeout> | --wake=<timeout>

              Set process wake timeout.

EXAMPLES
       alsaloop -C hw:0,0 -P hw:1,0 -t 50000

BUGS
       None known.

AUTHOR
       alsaloop  is  by  Jaroslav  Kysela  <perex@perex.cz>.   This  document  is  by  Jaroslav Kysela
       <perex@perex.cz>.

                                              5 Aug 2010                                   ALSALOOP(1)
