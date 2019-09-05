lav2wav(1)                                                      MJPEG tools manual                                                      lav2wav(1)

NAME
       lav2wav - Extract the audio out of MJPEG container files to stdout

SYNOPSIS
       lav2wav [-s num] [-c num] [-v num] [-I] [-R] [-r samplerate, bitesize, channels] lavfile1 [lavfile2 ... lavfileN]

DESCRIPTION
       lav2wav  can  be  used to extract the audio to stdout.  This output goes to stdout and can be saved as a wav file or piped to another sound
       processing tool that is able to handle the wav format.  This can be mp2enc and toolame for mpeg layer 2 audio, or for example lame for mpeg
       layer 3 audio.

       The  input  files  may be any combination of AVI (.avi), Quicktime (.qt) or editlist files so long as they are all lavtools- readable (e.g.
       MJPEG-encoded AVI/Quicktime or DV type 2 AVI).

OPTIONS
       lav2wav accepts the following options:

       -s num
            Start extracting at video frame (num)

       -c num
            Extract (num) frames of audio

       -v num
            Verbosity level (0, 1 or 2)

       -I   Ignore unsupported bitrates/bits per sample

       -R   If the file does not contain any sound. lav2wav will create silence with 44100kHz Sampelrate, 16 Bit audio bitsize and 2 Chanels

       -r sr,bs,ch
            If the file does not contain any sound lav2wav will generate silence with the values you supply  the  samplerate  (sr),  audio-bitsize
            (bs) and channel (ch).

BUGS
       The  "WAV"  file  format (technically: RIFF) is really very much less than ideal for a tool intended to be used in pipelines as lav2wav is.
       The problem is that the header includes a field specifying the length of the file.  This can't be filled in except by seeking back  to  the
       begining  and  over-writing.  If the output is unseekable (e.g. pipe) lav2wav simply writes a large length into the header and leaves it at
       that.  Most tools like sox(1) or mp2enc(1) either ignore the length field anyway or only give a warning.
       The audio length is inacurate calculated when lav2wav generates silence.  This happens only if you have NTSC framerate and than it  creates
       for every hour of video 1.1498sec too less of silence.

AUTHOR
       This man page was written by Bernhard Praschinger.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       mjpegtools(1), mp2enc(1), sox(1)

MJPEG Tools Team                                                    2 June 2001                                                         lav2wav(1)
