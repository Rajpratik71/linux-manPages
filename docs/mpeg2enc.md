mpeg2enc(1)                                                     MJPEG tools manual                                                     mpeg2enc(1)

NAME
       mpeg2enc - MPEG-1/2 encoder

SYNOPSIS
       mpeg2enc   [-v|--verbose   num]   [-M|--multi-thread  num_CPU]  [-f|--format  mpeg_profile]  [-l|--level]h|high|m|main  [-b|--video-bitrate
       bitrate_kbps] [-V|--video-buffer video_buf_size_kB] [-T|--target-still-size still_size_kB] [-q|--quantisation  quantisation]  [-r|--motion-
       search-radius  motion_search_radius] [-Q|--quantisation-reduction -4.0..5.0] [-X|--quant-reduction-max-var 0.0..2500.0] [-p|--3-2-pulldown]
       [-I|--interlace-mode 0|1|2] [-s|--sequence-header-every-gop] [-g|--min-gop-size min_gop_size] [-G|--max-gop-size max_gop_size] [-P|--force-
       b-b-p]   [-n|--video-norm   n|p|s]   [-F|--frame-rate  frame_rate_code]  [-x|--display-hsize]  32..38383]  [-y|--display-vsize]  32..38383]
       [-a|--aspect aspect_ratio_code] [-z|--playback-field-order b|t] [-4|--reduction-4x4 1..4] [-2|--reduction-2x2  1..4]  [-S|--sequence-length
       size_MB]  [-B|--nonvideo-bitrate bitrate_kbps] [-N|--reduce-hf 0.0..2.0] [-D|--intra_dc_prec 8..11] [-H|--keep-hf] [-d|--no-dummy-svcd-SOF]
       [-C|--correct-svcd-hds] [--no-constraints] [-K|--custom-quant-matrices  kvcd|tmpgenc|default|hi-res|file=inputfile|help]  [-E|--unit-coeff-
       elim  -40..40]  [-R|--b-per-refframe  0..2]  [--no-altscan-mpeg2]  [--dualprime-mpeg2]  [-A|--ratecontroller  0..1]  [-u|--cbr] [--chapters
       frame,...]  [-?|--help] -o|--output filename

DESCRIPTION
       mpeg2enc is heavily enhanced derivative of the MPEG Software Simulation Group's MPEG-2 reference encoder.  It accepts streams in  a  simple
       planar  YUV  format  "YUV4MPEG"  produced by the lav2yuv and related filters (e.g. yuvscaler(1)) from the mjpegtools(1) package.  An output
       plug-in to the mpeg2dec(1) MPEG decoder is available to permit its use in transcoding applications. The encoder  currently  fully  supports
       the  generation  of  elementary  MPEG-1, progressive and interlaced frame MPEG-2 streams.  Field encoded MPEG-2 is also possible but is not
       currently maintained or supported.

       For most purposes this elementary stream output will need to be multiplexed with one or more audio streams into  a  program/systems  stream
       using the mplex(1) tool.

       Note  that although this manual page aims to explain how mpeg2enc can be used effectively it is not intended as an introduction to MPEG-1/2
       video which is a fairly complex topic in its own right.  The MPEG video format is a somewhat baroque standard with many many  options,  not
       all of which necessarily easy to explain or even particular useful in the context of a software encoder.

       Much  useful  practical information for novices can be found in the mjpeg-HOWTO document that should have been installed with mjpegtools(1)
       package.  Further information and useful supporting software can be found on the mjpegtools web-site:

              http://mjpeg.sourceforge.net

SELECTING THE MPEG PROFILE
       Set the MPEG profile to use.  The MPEG standards support a vast number of options.  In practice, different applications of the MPEG  format
       place additional constraints of the form the MPEG stream.  Setting this flag selects the kind of stream to produce.

       -f|--format 0
               -       Generic MPEG1.

               A basic MPEG-1 profile that lets most parameters
               be adjusted for particular applications using the other flags.
               Typical applications would be to produce a variable bitrate MPEG-1
               stream with big buffers and a high data-rate software playback
               on a computer.

       -f|--format 1
               -       Standard VCD.

       An  MPEG1  profile  exactly  to  the  VCD2.0  specification.  Flag settings that would result in a non-standard stream structure are simply
       ignored.

       -f|--format 2
               -       User VCD.

       As for profile 2 but bitrate and video buffer size can be set to non-standard values. Frame size may also be  non-standard.   Bit-rate  and
       buffer sizes default to those for standard VCD.

       -f|--format 3
               -       Generic MPEG2.

       A basic MPEG-2 profile that lets most parameters be adjusted for particular applications using the other flags.  Typical applications would
       be to produce a MPEG-2 stream with big buffers and long GOP's for software playback on a computer.

       -f|--format 4
               -       Standard SVCD.

       An MPEG-2 profile exactly to the SVCD2.0 specification. Flag settings that would result in  a  non-standard  stream  structure  are  simply
       ignored.

       -f|--format 5
               -       Non-standard SVCD.

       As  for  profile  4  but bitrate, video buffer size, GOP sizes and structure can be set to non-standard values. Frame size may also be non-
       standard.  Bit-rate and buffer sizes default to those for standard SVCD.

       -f|--format 6
               -       VCD Stills sequence.

       Encodes the special style of MPEG stream used for still images on VCDs.  To use this profile you must set the target size you wish to  com‐
       press  the  images  to  using the -T flag.   Reasonable values are around 35KB for standard resolution stills (352 wide) and 120KB for high
       resolution stills (704 wide).

       -f|--format 7
               -       SVCD Stills sequence.

       Encodes the special style of MPEG stream used for still images on SVCDs.  Both standard (480 wide) and high resolution  (704  wide)  images
       are supported. As with VCD stills you select how big each compressed still should be using the -T flag.

       -f|--format 8
               -       DVD MPEG-2 for 'dvdauthor'

       This  version  adds  special  dummy  navigation  packets  into the output stream that the dvdauthor tool fills in to make a proper .VOB for
       authoring.  Bit-rate defaults to 7500kbps, buffer sizes to the maximum permitted by the DVD specification.

       -f|--format 9
               -       DVD MPEG-2.

       Just a very basic implementation. Useful with DXR2 board and similar hardware that can decode MPEG-2 only if it is presented in a DVD  like
       form.  Bit-rate defaults to 7500kbps, buffer sizes to the maximum permitted by the DVD specification.

       -f|--format 10
               -       ATSC 480i

       -f|--format 11
               -       ATSC 480p

       -f|--format 12
               -       ATSC 720p

       -f|--format 13
               -       ATSC 1080i

GENERAL FUNCTION LETTERS
       -v|--verbose num

       Set verbosity level to num.  0 = warnings and errors only, 1 = information as well, 2=really verbose.

       -K|--custom-quant-matriceskvcd|tmpgenc|
        default | hi-res | file=inputfile | help

       Specify  which  quantisation matrices to use instead of the defaults (which can be specified by using "-K default").   Using "-K hi-res" is
       identical to using the -H option. The value kvcd uses the Kvcd.Net matrices from http://www.kvcd.net/; the value tmpgenc invokes  the  TMP‐
       GEnc  matrices  from  http://www.tmpgenc.net/e_main.html.  On  average (this depends on the source material), the tmpgenc tables reduce the
       average bitrate by about 10% and the kvcd tables reduce bitrate by about 16% (compared to the default tables).

       -E|--unit-coeff-elim -40..40

       Specify when a special 'unit coefficient elimination' algorithm should be applied to the encoded picture blocks.  Basically, this procedure
       forces blocks of a type that don't carry much information but are expensive to encode to be simply skipped.  The larger the number the more
       potentially visible this skipping is likely to be but the more compression is boosted.  A negative value means that  all  coefficients  are
       zeroed, positive means only texture but not base intensity coefficients are zeroed.  Values of around 10 or -10 seem to work well with high
       quality source material. For noisier material it might be worth trying 20 or -20.

       -R|--b-per-refframe 0..2

       Specify how many bi-directionally (B type) difference-encoded frames should be encoded between reference (I or P) frames.  The default is 0
       except  for  VCD  encoding where it is 2 B frames as required by the standard.  Experts differ on how much using B frames improves compres‐
       sion. In practice unless you have really clean material they tend to be fairly useless and sometimes even harmful.   Encoding  is  signifi‐
       cantly faster and uses less memory if no B frames are encoded and compression is rarely more than marginally worse.

       -?|--help

       Display a synopsis of the command syntax.

FUNCTION LETTERS ADJUSTING THE SELECTED PROFILE
       N.b. If the profile you have selected sets particular values for these parameters it will over-ride these adjustment flags.  In particular,
       there is almost nothing that can be adjusted for the standard VCD and SVCD profiles.

       -b|--video-bitrate num

       The bitrate of the output video stream in kBits/sec.  The default is exactly the bitrate required for VCD  streams.   If  variable  bitrate
       (VBR)  mode has been selected (see the -q option) this is the maximum bitrate of the stream. NOTE: By default MPEG-2 streams (-f 3, 4, 5, 8
       and 9 are VBR.  Use the --cbr option for generating CBR (Constant Bit Rate) streams.

       -A|--ratecontroller 0..1

       Specify which of the rate control algorithms to use.   Default is 0.

       -V|--video-buffer num

       The maximum video buffer usage required to decode the stream in KBytes.  The default is 46KB the (tiny) size specified for VCD.   The  size
       to  use  for SVCD is the (more reasonable) 230KB.  If you are encoding for a half-decent software decoder it makes sense to push this up to
       500K or more.

       -T|--target-still-size num

       Set the target size for (S)VCD still images in KB.

       -s|--sequence-header-every-gop

       This flag forces the encoder to generate a "sequence header" at the start of every group-of-pictures.  This is needed by some player  hard‐
       ware to support fast forward/rewind/random access functions but is a waste of bits otherwise.

       -d|--no-dummy-svcd-SOF

       The  SVCD  MPEG-2  profile  demands that special "Scan OFfset" which are (in effect) pointers to the place on the final SVCD disk where the
       video for 0.5 and around 5-10 seconds behind and ahead in the stream is located.  The intended use of this information is  to  support"Fast
       forward/Rewind"  functions.   Unfortunately, at the time mpeg2enc encodes the video it doesn't know where the video is going to finally end
       up.  So special dummy "Scan OFfset" values are written which are intended to be filled in during the creation of the SVCD image.  Currently
       the GNU vcdimager tool handles this task.  However, in some circumstances the dummy offsets can cause problems.   This flags stops mpeg2enc
       generating them.

       --correct-svcd-hds

       In the official SVCD standards the field in the MPEG-2 header information that passes on the encoders "recommended"  horizontal  resolution
       to decode the stream to is supposed to take the values 540 (for 4:3 sequences) or 720 (for 16:9 sequences).  In practice many players don't
       work unless the value is 480. This flag, forces mpeg2enc to follow the official standard. It is worth trying if 16:9 sequences play at  4:3
       aspect ratio.

       --no-constraints

       This flag deactivates all constraints for the maximum video samplerate or video resolution. Its purpose is to allow the encoding of unusual
       resolutions of MPEG-video (e.g. 2200 x 576, 160 degrees FOV VR-theatre MPEG movies), but should be used with care: It can possible  circum‐
       vent a number of other security checks, and untested settings can cause mpeg2enc to crash in this mode.  -l|--level h|high|m|main

       This  flag  allows  the MPEG-2 implementation level against which the coding parameters are checked to be set.  You may need to set this to
       'high' if you're encoding HDTV material.

       --no-altscan-mpeg2

       This flag deactivates the use of the 'alternate' macroblock scan pattern for MPEG2 encoding.  Normally this  pattern  is  used  but  a  few
       elderly software decoders had bugs relating to this feature.  You should never need to use this flag.

       --dualprime-mpeg2

       MPEG-2  supports a special motion estimation mode (DPME, Dual Prime Motion Estimation) for I/P-frame only streams that can somewhat improve
       compression.  A number of players (both hardware and software) do not support this mode.  Those players  may or may not be MPEG-2 compliant
       depending  if  DPME  is  an option or not in the MPEG-2 specs.  If you need to generate content for  such players (e.g. Ogle or Apple's DVD
       player application) you should NOT turn on dualprime-mpeg2!  Surprisingly at least one hardware/set-top player is known to be  allergic  to
       DPME being used.

       -z|--playback-field-order b|t

       This  flag  overrides the field-order specified in the interlacing tag of the input stream header. (If you need this option, it indicates a
       problem in the capturing/encoding process where the temporal order of the two fields in each frame has been mislabeled. The effect of  this
       is weird "juddering" when playing back the stream on a TV. Check the mjpeg-howto for more information about interlacing problems.)

OPTION LETTERS CONTROLLING VIDEO PARAMETERS
       -n|--video-norm n|p|s

       Force  the  input  stream to be treated as NTSC|PAL|SECAM regardless of what the stream header might suggest.  Basically this just sets the
       defaults for a bunch of other options.

       -F|--frame-rate num

       Set the frame-rate of the output-stream. By default, this value is inferred from the input header. Currently only the standard  MPEG  rates
       are supported.  Eventually more-or-less arbitrary rates will be possible.
        0 - illegal
        1 - 24000.0/1001.0 (NTSC 3:2 pulldown converted FILM)
        2 - 24.0 (NATIVE FILM)
        3 - 25.0 (PAL/SECAM VIDEO / converted FILM)
        4 - 30000.0/1001.0 (NTSC VIDEO)
        5 - 30.0
        6 - 50.0 (PAL FIELD RATE)
        7 - 60000.0/1001.0 (NTSC FIELD RATE)
        8 - 60.0

       -a|--aspect num

       Set the playback aspect ratio code of the encoded video. By default, this value is inferred from the input header.
        1 - 1  - 1:1 display
        2 - 2  - 4:3 display
        3 - 3  - 16:9 display
        4 - 4  - 2.21:1 display

              For  MPEG-2  the  specified  aspect ratios are used directly. For MPEG-1 mpeg2enc infers the MPEG-1 pixel aspect code from the video
              norm specified and the specified playback aspect ratio.

       -x|--display-hsize num

       -y|--display-vsize num

       These set the display-horizontal-size and display-vertical-size hints in the MPEG-2.  By default these are simply the encode  frame  dimen‐
       sions.  However, if they are set to different values the player gets a hint that the appropriate 'black bars' or cropping/scaling should be
       performed. The main use for these parameters is to set a display-vertical-size of 1080 for HDTV 1080i or 1080p material.  Here,  since  the
       frame  height has to be a multiple of 16, the encoded frame height is forced to be 1088, even though HDTV standards specify only 1080 lines
       of picture content.  Standards committees ... love' em.

       -p|--3-2-pulldown

       Setting -p only makes sense for 24frame/sec Movie source material.  It sets flags in the output stream that tell the decoder  to  play  the
       movie  as  NTSC  60field/sec  video  using  "3:2 pulldown".  This is vastly more efficient than encoding as 60field/sec video.  The classic
       application is to transcode a PAL-encoded movie (24fps played too fast at 25 fps!)  into NTSC (see the -f flag).

OPTION LETTERS FOR CONTROLLING COMPRESSION AND SPEED
       -M|--multi-thread num_CPU

       MPEG encoding is a task that can be split over a small number of CPU's quite efficiently.  Mpeg2enc can be internally set  to  split  major
       processing  tasks  between  a number of concurrent threads.   This flag adjusts the multi-threading to the optimum to utilise the specified
       number of CPU's.

       It should be noted that even with 1 CPU present some multi-threading is performed: frame input takes place in parallel with encoding.   The
       default -M value is 1.  This allows good performance to be achieved when when a seperate machine is being used for pre-processing (decoding
       from MJPEG, scaling, denoising etc) with the final result pipe to mpeg2enc (e.g. using rsh or ssh).

       Setting -M 0 disables all multithreading.  This is sometimes useful for debugging or to achieve maximum CPU efficiency on a shared machine.
       Setting  -M  3  on a dual-CPU machine will produce slightly faster results than -M 2 at the price of slightly less CPU efficiency.  This is
       useful if nothing else needs to be done on the encoding machine.  In practice there is little point setting -M greater than 4 even  if  the
       CPU's are available due to the fairly coarse-grained parallelism used.  Indeed there is a hardcoded limit of 4 worker threads.

       The default has been changed to be 0 instead of 1 to avoid the crash at end of encoding:

       INFO: [mpeg2enc] Signaling last frame = 499
       mpeg2enc: seqencoder.cc:433: void SeqEncoder::EncodeStream(): Assertion `pass1coded.size() == 0' failed.
       Abort

       -q|--quantisation 1..31

       Minimum  quantisation  of  the  output stream.  Quantisation controls the precision with which image information is encoded.  The lower the
       number the higher the quality but the greater the required data-rate.  NOTE: on IA32 systems it is possible to cause artifacting by setting
       the  value  too  low  (3 or less) due to arithmetic overflow/truncation in the DCT/iDCT routines.  If this option is set a variable bitrate
       stream is produced.  This is more efficient but variable bitrate MPEG-1 cannot be played by some hardware decoders and is rejected by  some
       DVD authoring packages.  If you intend to use a software decoder you'd be insane not to use variable bitrate.

       If this option is set without a maximum bitrate being specified then quantisation is fixed at the specified value.  It should be noted that
       not specifying a bitrate is probably an error and may produce unexpected results.

       For MPEG-2 streams a default of 8 is used if -q is not explicitly given.  To force constant bitrate streams use --cbr and -b NOT -q!

       -I|--interlace-mode 0|1|2

       Set the sequence picture structure and block encoding type for MPEG-2 streams.  By default, this value is inferred from the interlacing tag
       of  the  input stream. Setting 0 encodes frame-by-frame with support for interlaced video turned off, and specifies that progressive chroma
       subsampling has been used.  Setting 1 encodes frame-by-frame with interlace-adapted motion compensation and block encoding,  and  specifies
       that  interlaced  chroma  subsampling has been used. Setting 2 encodes interlaced material field-by-field, which will produce more accurate
       results for highly textured interlaced material with lots of motion, at the expense of generally less efficiency.

              This setting should match the interlaced-ness of the input stream, otherwise chroma artifacts may be generated when the MPEG  stream
              is played back.

       -g|--min-gop-size num

       -G|--max-gop-size num

       These  flags  set  the minimum and maximum group-of-picture (GOP) size for the output MPEG stream.  The default values depend on the output
       format.

       For MPEG-1 (for example VCD) the default is a fixed GOP size of 12 (-g and -G are both set to 12).

       For MPEG-2 the default value of -G (max) is set according to the video system: -G 15 for 625 line (PAL) and 18 for 525 line (NTSC).  If  -g
       (min) has not been specified then the minimum GOP size is set to be one half of the maximum (-G).

       To force a fixed GOP size specify both -g and -G with the same value.

       If  the  minimum and maximum GOP sizes are not identical then mpeg2enc will start a new GOP if more than 60% of the macroblocks in a P or B
       frame are Intra encoded.  This ensure big changes of image coincide with a fully-encoded I-frame by starting  a new  GOP.   This  can  help
       prevent transient "blockiness".

       Reasonable minimum GOP sizes are 6 or 9.  If a minimum is not specified but a maximum is given then the minimum will be set to one half the
       maximum.  A larger GOP size can help reduce the bitrate required for a given quality.  However, this really only  applies  to  high-quality
       source  material  with  little noise (e.g. digital video).  For broadcast material there is little point setting GOP size much beyond 21 or
       24.  Even with good source material diminishing returns set in quite rapidly.  Also it must be noted that specific MPEG-2 formats (such  as
       for DVD) are constrained in the maximum allowable GOP size.

       Note:  mpeg2enc  is  currently hard-wired to produce 2 B frames between each I/P frame unless the GOP size forces less.  This is reasonable
       for medium to high bitrates (>= 1Mbps) but probably sub-optimal for low-bitrate encoding.

       -c|--closed-GOPs

       Setting this flag causes the encoder to generate only "closed" GOPs (Groups of Pictures) that can be decoded  without  reference  to  their
       predecessor.   This  is  useful  for streams that are supposed to be used in multi-angle DVD's and applications where more easily edittable
       MPEG is required.

       -P|--force-b-b-p

       This flag forces the GOP size selection to choose sizes that ensure 2 B frames appear between adjacent I/P frames.  Several  common  MPEG-1
       decoders can't handle streams where less than 2 B-frames appear between I/P frames.

       -Q|--quantisation-reduction -4.0..5.0

       This  flag  sets the amount quantisation is reduced for blocks containing large amounts of sharp image detail.  Large values produces effi‐
       cient use of bits but may cause visible artifacting around detailed sections.  With noisy source material this option may  cause  a  "swim‐
       ming" effect on textured backgrounds as the noise cause the quantisation of blocks to be boosted at random.  The default is 0.0 (off).  See
       also the -X option.

       -X|--quant-reduction-max-var 0.0..2500.0

       Luma variance below which quantisation boost (-Q) is activated.

       -r|--motion-search-radius num

       This flag sets the motion estimation search radius.  For most purposes the default (16) should be just fine.   For  high-resolution  MPEG-2
       and  active  scenes  it may be worth bumping it up.  However, this will make encoding significantly slower.  There is little point reducing
       the radius.  Speed gains are not huge and the impact on quality can be marked.

       -4|--reduction-4x4 1..4

       -2|--reduction-2x2 1..4

       These options control how radical the encoder is in throwing away apparently poor candidate estimates during motion estimation.  A  setting
       of  1 means very few blocks are discarded early which makes for slow encoding but quality as good as it gets. A setting of 4 makes for fast
       encoding but can impact quality.  The -4 flag controls discarding during the initial 4*4 sub-sampled search stage,  the  -2  flag  controls
       discarding during the secondary 2*2 sub-sampled stage.

              These flags are useful as the speed quality trade-off is markedly different depending on which CPU you have.  On modern machines the
              impact on speed is around a factor 2 on older machines a factor 3.  The impact on quality is around 10% quantisation (0.2 of  a  bit
              of  precision  in  encoding  textures).  For most purposes the default settings will be fine.  However on P-III Katmai etc -4 2 -2 1
              gives a good near-optimum quality setting with reasonably speed.

       -N|--reduce-hf num

       Setting this flag adjusts the way texture detail is quantised to reduce the precision with which  of  high-frequency  information  encoded.
       This  is  very  useful  for mildly noisy sources.  If you have really noisy material the filtering tools available in mjpegtools are a much
       better bet.  The specified number must be in the range 0.0 to 2.0 gives the maxium quantisation boost.  A useful number to use would be 1.5
       or 1.0.

       -H|--keep-hf

       Setting  this flag makes the encoder encode as much high-frequency information as possible.   This is a good setting for maximising quality
       at VCD resolution with good quality low-noise source material.  It can also help with "swimmy" material if you can spare the bitrate!

       -D|--intra_dc_prec num

       Specifies the precision of the DC component. The default is 9. Most commercial DVDs use 10. Using 9 instead saves  a  few  bits.  Using  10
       might  help to avoid looking larger areas of nearly the same color blocky.  A value of 11 is only valid at the next MPEG-2 profile/level so
       it's not a currently meaningful value to use.

OPTION LETTERS FOR CHUNKING THE OUTPUT STREAM
       -S|--sequence-length num

       This flag allows the target size of individual sequences in the final multiplexed stream to be set in MBytes. If set  mpeg2enc keeps  track
       of  how  large the eventual stream is getting and inserts a sequence split (actually: sequence end / sequence start) into the output stream
       each time it reaches the specified limit.  The multiplexer mplex(1) can recognise these splits and start a new multiplexed output file each
       time it encounters one.   In this way it is easy to automatically ensure each component sequence file can be burnt onto a CD-R and still be
       played as a stand-alone MPEG sequence.   For the SVCD and VCD profiles the default target sequence length is 700M bytes. For other profiles
       the default is that sequence length is unlimited.

       -B|--nonvideo-bitrate num

       Since  mpeg2enc  can't  read minds it cannot know in advance what other material will be multiplexed with the output video stream.  Thus to
       get its calculations of where to insert split point right it needs to be told the combined data-rate of the other material that is  eventu‐
       ally to be multiplexed with the video.  This flag allows this rate to be specified in K bits/sec.

       A good rule of thumb is to use the total rate of all the other streams plus 1% of the total rate including video.

       -u|--cbr

       Force  the  use  of Constant Bit Rate encoding.  Less than optimal (and inefficient in almost all cases) but some folks insist on it. NOTE:
       this disables (overrides) the use of the -q option!

       It is an error to use this option and not specify a bitrate using -b since a constant bitrate of 0 makes no sense.

       --chapters frame,...

       This flag allows you to define chapter points within the mpeg stream.  This is most useful when generating DVD video.  Each  chapter  point
       is  specified  by  frame number, with the first frame being number 0.  Every chapter point defined will end up at the beginning of a closed
       GOP as an I frame.

SSE, 3D-Now!, MMX !
       mpeg2enc makes extensive use of these SIMD instruction set extension on x86 family CPU's.  The routines used are determined dynamically  at
       run-time.   It should be noted that using SSE requires operating system support.  Old 2.2.x Linux kernels (unless patched ones like RedHat)
       do not have this and so SSE, although physically present, won't be activated.

BUGS
       There should be an option to force GOP sizes that permit 2 B frames between I/P frames.  Some decoders (even software)   can't  handle  the
       case where I/P frames come back to back or with only 1 B frame between them.

       There  needs  to  be a facility for writing dummy user-data fields so that the multiplexer/imager can insert forward/backward pointers when
       muxing/imaging an SVCD.

AUTHOR
       This man page was written by Andrew Stevens.  If you have questions, remarks, problems or you just want to contact the developers, the main
       mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
         http://mjpeg.sourceforge.net

SEE ALSO
       mplex(1), mp2enc(1), lavrec(1), lavplay(1), lav2yuv(1), lav2wav(1), yuvscaler(1), yuvdenoise(1), y4mdenoise(1), mjpegtools(1)

MJPEG Tools Team                                                    25 Aug 2002                                                        mpeg2enc(1)
