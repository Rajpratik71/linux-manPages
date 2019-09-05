ALSABAT(1)                                                                              General Commands Manual                                                                             ALSABAT(1)

NAME
       alsabat - command-line sound tester for ALSA sound card driver

SYNOPSIS
       alsabat [flags]

DESCRIPTION
       ALSABAT(ALSA  Basic  Audio  Tester) is a simple command-line utility intended to help automate audio driver and sound server testing with little human interaction. ALSABAT can be used to test
       audio quality, stress test features and test audio before and after PM state changes.

       ALSABAT's design is relatively simple. ALSABAT plays an audio stream and captures the same stream in either a digital or analog loop back. It then compares the captured stream using a FFT  to
       the original to determine if the test case passes or fails.

       ALSABAT can either run wholly on the target machine being tested (standalone mode) or can run as a client/server mode where by alsabat client runs on the target and runs as a server on a sep‐
       arate tester machine. The client/server mode still requires some manual interaction for synchronization, but this is actively being developed for future releases.

       The hardware testing configuration may require the use of an analog cable connecting target to tester machines or a cable to create an analog loopback if no loopback mode is not available  on
       the  sound  hardware  that  is being tested.  An analog loopback cable can be used to connect the "line in" to "line out" jacks to create a loopback. If only headphone and mic jacks (or combo
       jack) are available then the following simple circuit can be used to create an analog loopback :-

       https://source.android.com/devices/audio/loopback.html

       If tinyalsa is installed in system, user can choose tinyalsa as backend lib of alsabat, with configure option "--enable-alsabat-backend-tiny".

OPTIONS
       -h, --help
              Help: show syntax.

       -D     Select sound card to be tested by name.

       -P     Select the playback PCM device.

       -C     Select the capture PCM device.

       -f     Sample format
              Recognized sample formats are: U8 S16_LE S24_3LE S32_LE
              Some of these may not be available on selected hardware
              The available format shortcuts are:
              -f cd (16 bit little endian, 44100, stereo) [-f S16_LE -c2 -r44100]
              -f dat (16 bit little endian, 48000, stereo) [-f S16_LE -c2 -r48000]
              If no format is given S16_LE is used.

       -c     The number of channels. The default is one channel.  Valid values at the moment are 1 or 2.

       -r     Sampling rate in Hertz. The default rate is 44100 Hertz.  Valid values depends on hardware support.

       -n     Duration of generated signal.  The value could be either of the two forms:
              1. Decimal integer, means number of frames;
              2. Floating point with suffix 's', means number of seconds.
              The default is 2 seconds.

       -k     Sigma k value for analysis.
              The analysis function reads data from WAV file, run FFT against the data to get magnitude of frequency vectors, and then calculates the average value and  standard  deviation  of  fre‐
              quency vectors. After that, we define a threshold:
              threshold = k * standard_deviation + mean_value
              Frequencies with amplitude larger than threshold will be recognized as a peak, and the frequency with largest peak value will be recognized as a detected frequency.
              ALSABAT then compares the detected frequency to target frequency, to decide if the detecting passes or fails.
              The default value is 3.0.

       -F     Target frequency for signal generation and analysis, in Hertz.  The default is 997.0 Hertz.  Valid range is (DC_THRESHOLD, 40% * Sampling rate).

       -p     Total number of periods to play or capture.

       --log=#
              Write stderr and stdout output to this log file.

       --file=#
              Input WAV file for playback.

       --saveplay=#
              Target WAV file to save capture test content.

       --local
              Internal loopback mode.  Playback, capture and analysis internal to ALSABAT only. This is intended for developers to test new ALSABAT features as no audio is routed outside of ALSABAT.

       --standalone
              Add  support for standalone mode where ALSABAT will run on a different machine to the one being tested.  In standalone mode, the sound data can be generated, playback and captured just
              like in normal mode, but will not be analyzed.  The ALSABAT being built without libfftw3 support is always in standalone mode.  The ALSABAT in normal mode can also bypass data analysis
              using option "--standalone".

       --roundtriplatency
              Round  trip  latency  test.   Audio latency is the time delay as an audio signal passes through a system.  There are many kinds of audio latency metrics. One useful metric is the round
              trip latency, which is the sum of output latency and input latency.

       --snr-db=#
              Noise detection threshold in SNR (dB). 26dB indicates 5% noise in amplitude.  ALSABAT will return error if signal SNR is smaller than the threshold.

       --snr-pc=#
              Noise detection threshold in percentage of noise amplitude (%).  ALSABAT will return error if the noise amplitude is larger than the threshold.

EXAMPLES
       alsabat -P plughw:0,0 -C plughw:0,0 -c 2 -f S32_LE -F 250
              Generate and play a sine wave of 250 Hertz with 2 channel and S32_LE format, and then capture and analyze.

       alsabat -P plughw:0,0 -C plughw:0,0 --file 500Hz.wav
              Play the RIFF WAV file "500Hz.wav" which contains 500 Hertz waveform LPCM data, and then capture and analyze.

RETURN VALUE
       On success, returns 0.
       If no peak be detected, returns -1001;
       If only DC be detected, returns -1002;
       If peak frequency does not match with the target frequency, returns -1003.

SEE ALSO
        aplay(1)

BUGS
       Currently only support RIFF WAV format with PCM data. Please report any bugs to the alsa-devel mailing list.

AUTHOR
       alsabat is by Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bernard Gautier <bernard.gautier@intel.com> and Han Lu <han.lu@intel.com>.  This document  is  by  Liam  Girdwood  <liam.r.gird‐
       wood@linux.intel.com> and Han Lu <han.lu@intel.com>.

                                                                                           20th October 2015                                                                                ALSABAT(1)
