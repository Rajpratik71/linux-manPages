ALSA-DELAY(1)                                                                              General Commands Manual                                                                              ALSA-DELAY(1)



NAME
       alsadelay - a command to (re)initialize sound hardware


SYNOPSIS
       alsa-delay [options] requested_delay_in_ms [output_card[,device]]


DESCRIPTION
       alsa-delay is a command-line utility to setup an audio delay. The snd-aloop ALSA driver is used to send all PCM streams back to the user space and the alsaloop utility is used to send this stream to
       a real hardware.

       The parameter output_card is ALSA card index (number) or string card identifier. The parameter device is ALSA device number.

       Use aplay -l to list available cards and devices.



OPTIONS
       --h,--help
              Print help.

       --q,--quiet
              Quiet mode.

       --y,--yes
              Do not ask any questions - answer is always yes.

       --c,--clean
              Clean temporary directory.

       --r,--remove
              Remove the alsa-delay config modifications (modprobe, pulse-audio).

       --tmpdir=<DIR>
              Set temporary directory.


OPTIONS (for alsaloop daemon)
       --pdevice=<DEV>
              Force playback device.

       --cdevice=<DEV>
              Force capture device.

       --pctl=<DEV>
              Force playback control device.

       --cctl=<DEV>
              Force capture control device.

       --one=<ARG>
              Pass this argument to last thread.

       --arg=<ARG>
              Pass this argument to all threads.

       --mix=<ARG>
              Redirect ALSA mixer controls to OSS mixer (default is Master).

       --pa   Redirect pulse-audio to alsaloop.


NOTE
       For devices, the string %s is replaced with the card index and second string %s is replaced with the device index and third string %s is replaced the substream index (0-7).

       Example: hw:%s,%s,%s (card, device, substream)


SEE ALSO
        alsaloop(1) amixer(1) alsamixer(1)



                                                                                                 6 Jane 2016                                                                                    ALSA-DELAY(1)
