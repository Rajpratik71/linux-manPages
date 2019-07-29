SPEAKER-TEST(1)                                               General Commands Manual                                              SPEAKER-TEST(1)

NAME
       speaker-test - command-line speaker test tone generator for ALSA

SYNOPSIS
       speaker-test [-options]

DESCRIPTION
       speaker-test generates a tone that can be used to test the speakers of a computer.

       speaker-test  by default will test the default device. If you want to test another sound device you will have first to get a list of all of
       the sound cards in your system and the devices associated with those cards. Notice that there might be for example, one device  for  analog
       sound, one for digital sound and one for HDMI sound.  To get the list of available cards and devices you can run aplay -L.

       $ aplay -L
       null
           Discard all samples (playback) or generate zero samples (capture)
       default:CARD=ICH5
           Intel ICH5, Intel ICH5
           Default Audio Device
       front:CARD=ICH5,DEV=0
           Intel ICH5, Intel ICH5
           Front speakers
       surround40:CARD=ICH5,DEV=0
           Intel ICH5, Intel ICH5
           4.0 Surround output to Front and Rear speakers
       (...)

       in  the  above example, there are four devices listed: null, default, front and surround40. So, if you want to test the last device you can
       run speaker-test -Dsurround40:ICH5 -c 6. The -c option will indicate that the six audio channels in the device have to be tested.

OPTIONS
       -c | --channels NUM
              NUM channels in stream

       -D | --device NAME
              PCM device name NAME

       -f | --frequency FREQ
              sine wave of FREQ Hz

       --help Print usage help

       -b | --buffer TIME
              Use buffer size of TIME microseconds.  When 0 is given, use the maximal buffer size.  The default value is 0.

       -p | --period TIME
              Use period size of TIME microseconds.  When 0 is given, the periods given by -P option is used.  The default value is 0.

       -P | --nperiods PERIODS
              Use number of periods.  The default value is 4.

       -r | --rate RATE
              stream of RATE Hz

       -t | --test pink|sine|wav
              -t pink means use pink noise (default).

              Pink noise is perceptually uniform noise -- that is, it sounds like every frequency at once.  If you can hear any tone it may  indi‐
              cate resonances in your speaker system or room.

              -t sine means to use sine wave.

              -t wav means to play WAV files, either pre-defined files or given via -w option.

              You can pass the number from 1 to 3 as a backward compatibility.

       -l | --nloops COUNT

              Specifies the number of loops.  Zero means to run infinitely.

              When -s option below with a valid channel is given, speaker-test will perform always a single-shot without looping.

       -s | --speaker CHANNEL
              Do  a  single-shot  speaker  test for the given channel.  The channel number starts from 1.  The channel number corresponds to left,
              right, rear-left, rear-right, center, LFE, side-left, side-right, and so on.

              For example, when 1 is passed, it tests the left channel only once rather than both channels with looping.

       -w | --wavfile FILE
              Use the given WAV file for the playback instead of pre-defined WAV files.

       -W | --wavdir DIRECTORY
              Specify the directory containing WAV files for playback.  The default path is /usr/share/sounds/alsa.

       -m | --chmap MAP
              Pass the channel map to override.  If the playback in a specific channel order or channel positions is required,  pass  the  channel
              position strings to this option.

       -X | --force-frequency
              Allow supplied FREQ to be outside the default range of 30-8000Hz. A minimum of 1Hz is still enforced.

USAGE EXAMPLES
       Produce stereo sound from one stereo jack:
         speaker-test -Dplug:front -c2

       Produce 4 speaker sound from two stereo jacks:
         speaker-test -Dplug:surround40 -c4

       Produce 5.1 speaker sound from three stereo jacks:
         speaker-test -Dplug:surround51 -c6

       To send a nice low 75Hz tone to the Woofer and then exit without touching any other speakers:
         speaker-test -Dplug:surround51 -c6 -s1 -f75

       To do a 2-speaker test using the spdif (coax or optical) output:
         speaker-test -Dplug:spdif -c2

       Play in the order of front-right and front-left from the front PCM
         speaker-test -Dplug:front -c2 -mFR,FL

SEE ALSO
       aplay(1)

AUTHOR
       The  speaker-test  program  was  written  by  James  Courtier-Dutton.  Pink noise support was added by Nathan Hurst.  Further extensions by
       Takashi Iwai.

speaker-test                                                      April 2nd, 2011                                                  SPEAKER-TEST(1)
