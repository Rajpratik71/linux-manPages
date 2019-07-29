APLAY(1)                                                      General Commands Manual                                                     APLAY(1)

NAME
       arecord, aplay - command-line sound recorder and player for ALSA soundcard driver

SYNOPSIS
       arecord [flags] [filename]
       aplay [flags] [filename [filename]] ...

DESCRIPTION
       arecord  is  a command-line soundfile recorder for the ALSA soundcard driver. It supports several file formats and multiple soundcards with
       multiple devices. If recording with interleaved mode samples the file is automatically split before the 2GB filesize.

       aplay is much the same, only it plays instead of recording. For supported soundfile formats, the sampling rate, bit depth, and so forth can
       be automatically determined from the soundfile header.

       If filename is not specified, the standard output or input is used. The aplay utility accepts multiple filenames.

OPTIONS
       -h, --help
              Help: show syntax.

       --version
              Print current version.

       -l, --list-devices
              List all soundcards and digital audio devices

       -L, --list-pcms
              List all PCMs defined

       -D, --device=NAME
              Select PCM by name

       -q --quiet
              Quiet mode. Suppress messages (not sound :))

       -t, --file-type TYPE
              File type (voc, wav, raw or au).  If this parameter is omitted the WAVE format is used.

       -c, --channels=#
              The number of channels.  The default is one channel.  Valid values are 1 through 32.

       -f --format=FORMAT
              Sample format
              Recognized  sample  formats  are: S8 U8 S16_LE S16_BE U16_LE U16_BE S24_LE S24_BE U24_LE U24_BE S32_LE S32_BE U32_LE U32_BE FLOAT_LE
              FLOAT_BE FLOAT64_LE FLOAT64_BE IEC958_SUBFRAME_LE IEC958_SUBFRAME_BE MU_LAW A_LAW IMA_ADPCM MPEG GSM SPECIAL S24_3LE S24_3BE U24_3LE
              U24_3BE S20_3LE S20_3BE U20_3LE U20_3BE S18_3LE S18_3BE U18_3LE
              Some of these may not be available on selected hardware
              The available format shortcuts are:
              -f cd (16 bit little endian, 44100, stereo) [-f S16_LE -c2 -r44100]
              -f cdr (16 bit big endian, 44100, stereo) [-f S16_BE -c2 -f44100]
              -f dat (16 bit little endian, 48000, stereo) [-f S16_LE -c2 -r48000]
              If no format is given U8 is used.

       -r, --rate=#<Hz>
              Sampling  rate  in Hertz. The default rate is 8000 Hertz.  If the value specified is less than 300, it is taken as the rate in kilo‐
              hertz.  Valid values are 2000 through 192000 Hertz.

       -d, --duration=#
              Interrupt after # seconds.  A value of zero means infinity.  The default is zero, so if this option  is  omitted  then  the  arecord
              process will run until it is killed.

       -s, --sleep-min=#
              Min ticks to sleep. The default is not to sleep.

       -M, --mmap
              Use memory-mapped (mmap) I/O mode for the audio stream.  If this option is not set, the read/write I/O mode will be used.

       -N, --nonblock
              Open  the audio device in non-blocking mode. If the device is busy the program will exit immediately.  If this option is not set the
              program will block until the audio device is available again.

       -F, --period-time=#
              Distance between interrupts is # microseconds.  If no period time and no period size is given then a quarter of the buffer  time  is
              set.

       -B, --buffer-time=#
              Buffer  duration  is  # microseconds If no buffer time and no buffer size is given then the maximal allowed buffer time but not more
              than 500ms is set.

       --period-size=#
              Distance between interrupts is # frames If no period size and no period time is given then a quarter of the buffer size is set.

       --buffer-size=#
              Buffer duration is # frames If no buffer time and no buffer size is given then the maximal allowed buffer time  but  not  more  than
              500ms is set.

       -A, --avail-min=#
              Min available space for wakeup is # microseconds

       -R, --start-delay=#
              Delay for automatic PCM start is # microseconds (relative to buffer size if <= 0)

       -T, --stop-delay=#
              Delay for automatic PCM stop is # microseconds from xrun

       -v, --verbose
              Show PCM structure and setup.  This option is accumulative.  The VU meter is displayed when this is given twice or three times.

       -V, --vumeter=TYPE
              Specifies  the VU-meter type, either stereo or mono.  The stereo VU-meter is available only for 2-channel stereo samples with inter‐
              leaved format.

       -I, --separate-channels
              One file for each channel.  This option disables max-file-time and use-strftime, and ignores SIGUSR1.  The stereo VU  meter  is  not
              available with separate channels.

       -P     Playback.  This is the default if the program is invoked by typing aplay.

       -C     Record.  This is the default if the program is invoked by typing arecord.

       -i, --interactive
              Allow interactive operation via stdin.  Currently only pause/resume via space or enter key is implemented.

       -m, --chmap=ch1,ch2,...
              Give the channel map to override or follow.  Pass channel position strings like FL, FR, etc.

              If  a device supports the override of the channel map, aplay tries to pass the given channel map.  If it doesn't support the channel
              map override but still it provides the channel map information, aplay tries to rearrange the channel order in the  buffer  to  match
              with the returned channel map from the device.

       --disable-resample
              Disable automatic rate resample.

       --disable-channels
              Disable automatic channel conversions.

       --disable-format
              Disable automatic format conversions.

       --disable-softvol
              Disable software volume control (softvol).

       --test-position
              Test ring buffer position.

       --test-coef=<coef>
              Test  coefficient for ring buffer position; default is 8.  Expression for validation is: coef * (buffer_size / 2).  Minimum value is
              1.

       --test-nowait
              Do not wait for the ring buffer ‐ eats the whole CPU.

       --max-file-time
              While recording, when the output file has been accumulating sound for this long, close it and open a new output  file.   Default  is
              the maximum size supported by the file format: 2 GiB for WAV files.  This option has no effect if  --separate-channels is specified.

       --process-id-file <file name>
              aplay writes its process ID here, so other programs can send signals to it.

       --use-strftime
              When  recording,  interpret  %-codes in the file name parameter using the strftime facility whenever the output file is opened.  The
              important strftime codes are: %Y is the year, %m month, %d day of the month, %H hour, %M minute and %S second.  In addition,  %v  is
              the  file  number, starting at 1.  When this option is specified, intermediate directories for the output file are created automati‐
              cally.  This option has no effect if --separate-channels is specified.

       --dump-hw-params
              Dump hw_params of the device preconfigured status to stderr. The dump lists capabilities of the selected device  such  as  supported
              formats,  sampling rates, numbers of channels, period and buffer bytes/sizes/times.  For raw device hw:X this option basically lists
              hardware capabilities of the soundcard.

       --fatal-errors
              Disables recovery attempts when errors (e.g. xrun) are encountered; the aplay process instead aborts immediately.

SIGNALS
       When recording, SIGINT, SIGTERM and SIGABRT will close the output file and exit.  SIGUSR1 will close the output file, open a new  one,  and
       continue recording.  However, SIGUSR1 does not work with --separate-channels.

EXAMPLES
       aplay -c 1 -t raw -r 22050 -f mu_law foobar
              will play the raw file "foobar" as a 22050-Hz, mono, 8-bit, Mu-Law .au file.

       arecord -d 10 -f cd -t wav -D copy foobar.wav
              will  record  foobar.wav  as a 10-second, CD-quality wave file, using the PCM "copy" (which might be defined in the user's .asoundrc
              file as:
              pcm.copy {
                type plug
                slave {
                  pcm hw
                }
                route_policy copy
              }

       arecord -t wav --max-file-time 30 mon.wav
              Record from the default audio source in monaural, 8,000 samples per second, 8 bits per sample.  Start a new file every  30  seconds.
              File names are mon-nn.wav, where nn increases from 01.  The file after mon-99.wav is mon-100.wav.

       arecord -f cd -t wav --max-file-time 3600 --use-strftime %Y/%m/%d/listen-%H-%M-%v.wav
              Record  in  stereo from the default audio source.  Create a new file every hour.  The files are placed in directories based on their
              start dates and have names which include their start times and file numbers.

SEE ALSO
        alsamixer(1), amixer(1)

BUGS
       Note that .aiff files are not currently supported.

AUTHOR
       arecord and aplay are by Jaroslav Kysela <perex@perex.cz> This document is by Paul Winkler <zarmzarm@erols.com>.  Updated for Alsa  0.9  by
       James Tappin <james@xena.uklinux.net>

                                                                  1 January 2010                                                          APLAY(1)
