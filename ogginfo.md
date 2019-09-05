ogginfo(1)                                                                                       Vorbis Tools                                                                                      ogginfo(1)



NAME
       ogginfo - gives information about Ogg files, and does extensive validity checking


SYNOPSIS
       ogginfo [ -q ] [ -v ] [ -h ] file1.ogg ...  fileN.ogg


DESCRIPTION
       ogginfo  reads  one or more Ogg files and prints information about stream contents (including chained and/or multiplexed streams) to standard output. It will detect (but not correct) a wide range of
       common defects, with many additional checks specifically for Ogg Vorbis streams.

       For all stream types ogginfo will print the filename being processed, the stream serial numbers, and various common error conditions.

       For Vorbis streams, information including the version used for encoding, the sample rate and number of channels, the bitrate and playback length, and the contents of the comment header are printed.

       Similarly, for Theora streams, basic information about the video is provided, including frame rate, aspect ratio, bitrate, length, and the comment header.


OPTIONS
       -h     Show a help and usage message.

       -q     Quiet mode. This may be specified multiple times. Doing so once will remove the detailed informative messages, twice will remove warnings as well.

       -v     Verbose mode. At the current time, this does not do anything.


AUTHORS
       Michael Smith <msmith@xiph.org>


SEE ALSO
       vorbiscomment(1), ogg123(1), oggdec(1), oggenc(1)



Xiph.Org Foundation                                                                             July 10, 2002                                                                                      ogginfo(1)
