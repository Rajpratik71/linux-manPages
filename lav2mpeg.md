lav2mpeg(1)                                                     MJPEG tools manual                                                     lav2mpeg(1)

NAME
       lav2mpeg - easy conversion of lav files to mpeg

SYNOPSIS
       lav2mpeg [ options ] lavfile1 [lavfile2 ... lavfileN]

DESCRIPTION
       lav2mpeg  is  a shell script to ease the use of the mjpeg utilities, providing a convenient way to convert from MJPEG files to popular MPEG
       file formats.  It supports output in VCD, medium and high rate VCD, SVCD, high rate SVCD, and generic mpeg1 and mpeg2

       The input files may be any combination of AVI (.avi), Quicktime (.qt) or editlist files so long as they are all  lavtools-  readable  (e.g.
       MJPEG-encoded AVI/Quicktime or DV type 2 AVI).

OPTIONS
       -s/S   Turn stereo off/on                   (default auto)

       -k/K   Turn keeping of raw files off/on      (default off)

       -f/F   Turn use of fifos off/on              (default off)

       -l/L   Turn logging of entire process off/on (default off)

       -n/N   Turn "noisy logging" off/on           (default off)

       -y/Y   Turn use of yuvdenoise off/on         (default off)

       -m     one of MODES (see below)              (default vcd)

       -e     encoding quality : 0, 1, or 2         (default 2)

       -o     output file  ( defaults to firstInputFileName.mpg )

       -b     video bitrate in kbps  ( only used when -o is "mpeg1" or "mpeg2" )

       -a     audio bitrate in kpbs  ( only used when -o is not "vcd*" )

       -q     quality for mpeg2enc   ( only used when -o is "mpeg1" or "mpeg2" )

       -d     dimensions XxY         ( only used when -o is "mpeg1" or "mpeg2" ) defaults to same as input

MODES
       vcd -- standard VCD        (352x240 or 352x288)

       vcd_medium -- 1550kbps video VCD  (352x240 or 352x288)

       vcd_high -- 1800kbps video VCD  (352x240 or 352x288)

       svcd -- standard SVCD       (480x480 or 480x576)

       svcd_high -- 3000kbps(max) vbr @qual=5 (480x480 or 480x576)

       mpeg1 -- honor -a -b -q -d flags default resolution same as input

       mpeg2 -- honor -a -b -q -d flags default resolution same as input

FILES
       ~/.lav2mpegrc
              user  configuration  file.  It is bash sourceable, and can modify any of the environment variables mentioned in the ENVIRONMENT sec‐
              tion, or set the LAV2MPEG_OPTIONS variable to add default options.

ENVIRONMENT
       NICEVAL
              the nice value of each command, set using 'nice -n command'

       YUVSCALER
              modify which command is called for yuvscaler

       LAV2WAV
              modify which command is called for lav2wav

       MPLEX  modify which command is called for mplex

       YUVDENOISE
              modify which command is called for yuvdenoise

       MPEG2ENC
              modify which command is called for mpeg2enC

       AUDIOENC
              audioenc is similar to those above, however, if it is set to 'mp2enc' it will use mp2enc rather than toolame, and set  flags  appro‐
              priotely.

       NOISYLOGFILE
              set the file used for noisy logging (-N) defaults to outputfile.log

       QUIETLOG
              set the file used for quiet logging. defaults to lav2mpeg.log if set to "" it will log only to screen

       LOGDATE
              defaults to 1, set to 0 to not have the date logged in log or output (see man date for more info)

       LOGDATESTR
              will pass this on to 'date' to describe what time format to use.  Only used if LOGDATE is not 0

       LOGCOMMANDS
              if set to non-zero, will log to the quite log the commands used.  Commands are always logged to NOISYLOGFILE if used

       LOGONLY
              if set to non-zero, will only log the commands it would use but not actually run any commands

       LAV2MPEGRC
              the lav2mpegrc file.  Only beneficial if set from environment variable.

       VCD_MEDIUM_BR
              video bitrate for mode=vcd_medium

       VCD_HIGH_BR
              video bitrate for mode=vcd_high

       SVCD_HIGH_BR
              video bitrate for mode=svcd_high

       SVCD_HIGH_QUAL
              quality used (-q 0-30 to mpeg2enc) for SVCD_HIGH

       SVCD_HIGH_BUFFSIZE
              buffsize (-V to mpeg2enc) used for svcd_high defaults to 100

       EXTRA_LAV2YUV
              set extra command line arguments to lav2yuv, which will be added on the end

       EXTRA_YUVSCALER
              set extra command line arguments to yuvscaler, which will be added on the end

       EXTRA_MPEG2ENC
              set extra command line arguments to mpeg2enc, which will be added on the end

       EXTRA_LAV2WAV
              set extra command line arguments to lav2wav, which will be added on the end

       EXTRA_AUDIOENC
              set extra command line arguments to mp2enc or toolame (depending on AUDIOENC), which will be added on the end

       EXTRA_MPLEX
              set extra command line arguments to mplex, which will be added on the end

       EXTRA_YUVDENOISE
              set extra command line arguments to yuvdenoise, which will be added on the end

DIAGNOSTICS
       To simply see the commands that lav2mpeg would have called, run 'LOGONLY=1 lav2mpeg ...'

BUGS
       Possibly.  Please let the author know.

AUTHOR
       Scott Moser <smoser at brickies dot net>

EXAMPLES
       create a VCD compliant mpeg regardless of input named file.mpg
       lav2mpeg file.avi

       create a SVCD high rate mpeg from input named out.mpg
       lav2mpeg -o out.mpg -m svcd_high file.avi

       use lav2yuv.new for instead of lav2yuv, and add the '-M MMX' flag to
       yuvscaler:
       LAV2YUV="lav2yuv.new" EXTRA_YUVSCALER="-M MMX" lav2mpeg file.avi

       Please read other examples included in documentation for .lav2mpegrc
       usage

MJPEG Tools Team                                                   JANUARY 2002                                                        lav2mpeg(1)
