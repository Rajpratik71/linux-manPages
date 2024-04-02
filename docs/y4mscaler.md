y4mscaler(1)                                                      y4mtools manual                                                     y4mscaler(1)

NAME
       y4mscaler - Scale/crop/translate a YUV4MPEG2 stream

SYNOPSIS
       y4mscaler [options] < Y4Mstream > Y4Mstream

DESCRIPTION
       y4mscaler is a general-purpose video scaler which operates on YUV4MPEG2 streams, as produced and consumed by the MJPEGtools such as lav2yuv
       and mpeg2enc(1).

       y4mscaler is meant to be used in a pipeline.  Thus, input is from stdin, and output is to stdout.

       The essential function of y4mscaler is to scale a specified "active" region of the input stream (the source) into a specified active region
       of  the  output stream (the target).  Pixels outside of the active region of the source are ignored; pixels outside of the active region of
       the target are filled with a background color.  The source may additionally have a matte applied to it; pixels outside the source matte are
       set to a separately specified background color.

       y4mscaler  correctly  handles chroma subsampling, and thus it can also perform chroma subsampling conversions.  The YUV4MPEG2 stream format
       supports three varieties of 4:2:0 subsampling, as well as 4:1:1, 4:2:2, 4:4:4, a 4:4:4 modes with an alpha channel, and a monochrome  luma-
       only mode.  (See "NOTES ON CHROMA MODES AND SUBSAMPLING".)

       y4mscaler can perform simple interlacing conversions:  switching from top-field-first to bottom-field-first and vice-versa (by lossily dis‐
       carding the first field), and creating a progressive stream from interlaced by discarding every other field (effectively halving the verti‐
       cal resolution).

       The  source  and  target  are  defined by many, many parameters, but y4mscaler has many, many heuristics built-in to automagically set them
       appropriately.  Most source parameters are taken from the input stream header.  Remaining source and target parameters which are not speci‐
       fied by the user are guessed in a sane manner.

       y4mscaler  includes  preset  parameters  for a number of common target streams: DVD, VideoCD (VCD), SuperVCD (SVCD), associated still image
       formats, and DV.

EXAMPLES
       To create a stream appropriate for use in an SVCD:

            y4mscaler -O preset=svcd

       To create a stream for a VideoCD (a non-interlaced format), from a DV source (an interlaced format), shifting the input frame 4  pixels  to
       the left:

            y4mscaler -I ilace=bottom-only -I active=-4+0cc -O preset=vcd

       To take a widescreen NTSC DV source, and convert it to a letterboxed stream, with blue bars on the top and bottom:

            y4mscaler -O sar=ntsc -O bg=RGB:0,0,255

       To take a widescreen NTSC DV source, and convert it to a "fullscreen" stream (i.e. the sides are clipped, just like on TV):

            y4mscaler -O sar=ntsc -O infer=clip

       To take a centered, letterboxed NTSC source, and convert it to a widescreen (16:9) format stream for DVD, with the black bars removed:

            y4mscaler -O preset=dvd -O sar=ntsc_wide -O infer=clip

       To  take  the  center  100x100 pixel chunk of an NTSC DV stream, surround it with a 20-pixel blue border, and blow that up to a full-screen
       SuperVCD stream:

            y4mscaler -I active=140x140+0+0cc -I matte=100x100+0+0cc -I bg=RGB:0,0,255 -O preset=svcd

OPTIONS
       The first three options, -v, -V, and -h, are simple straightforward options which take either no arguments or one numeric argument.

       -v [0,1,2]
            Set verbosity level.
             0 = warnings and errors only.
             1 = add informative messages, too (default).
             2 = add chatty debugging message, too.

       -V   Show version information and exit.

       -h   Show a help message (synopsis of options).

       The -I, -O, and -S options each take one argument of the form parameter=value, which specify parameters for the input, output, and scaling,
       respectively.  These options can be used repeatedly to specify multiple parameters.  The parameter names and values are not case-sensitive.
       Definitions of the form "parameter=[AAA|BBB|CCC]" mean that only one of the listed keywords AAA, BBB, or CCC  may  be  chosen.   Succeeding
       options will override earlier ones.

       -I input_parameter
            Specify  parameters  for  the source/input stream.  All '-I' arguments are evaluated in order, and later arguments on the command-line
            will override earlier ones.  All '-I' arguments are evaluated before any '-O' arguments.

            active=WxH+X+Yaa
               Specify the active region of the source frame, which is scaled to fit the active region of the target frame.  The  default  is  the
               full  frame.   (The  "WxH" may be omitted, and the region size defaults to the size of of the source frame.)  W and H are width and
               height.  X and Y are the offset of the anchor point.  "aa" is the anchor mode (default: TL); see "NOTES  ON  REGION  GEOMETRY"  for
               details.
               Example:  active=200x180+30+24cc

            matte=WxH+X+Y
               Specify a matte region for the source frame.  All pixels outside of this region are set to the source background color. The default
               matte is the full frame.  (The "WxH" may be omitted, and the region size defaults to the size of of the source frame.)  W and H are
               width  and height.  X and Y are the offset of the anchor point.  "aa" is the anchor mode (default: TL); see "NOTES ON REGION GEOME‐
               TRY" for details.
               Example:  matte=200x180+30+24cc

            bg=RGB:r,g,b
            bg=YCBCR:y,cb,cr
            bg=RGBA:r,g,b,a
            bg=YCBCRA:y,cb,cr,a
               Set the source background color.  Pixels outside of the source's matte region are set to this color. One can specify the  color  as
               either  a R'G'B' or Y'CbCr triplet.  For example, the default color is black, specified as "bg=YCBCR:16,128,128" or "bg=RGB:0,0,0".
               The 'A' versions will set the alpha (transparency) value of the color.  The alpha range  is  [0,255]  for  RGBA  and  [16,235]  for
               YCBCRA.  The default is fully-opaque (255 for RGBA, 235 for YCBCRA).

            norm=[NTSC|PAL|SECAM]
               Specify the "norm" of the source stream.  This is normally inferred from the stream header.

            ilace=[NONE|TOP_FIRST|BOTTOM_FIRST|TOP_ONLY|BOTTOM_ONLY]
               Specify  the  interlacing  used  by  the source stream.  NONE, TOP_FIRST, and BOTTOM_FIRST correspond to non-interlaced, top-field-
               first, and bottom-field-first.  These values are normally inferred from the stream header; specifying them will override the stream
               header.
               TOP_ONLY  and  BOTTOM_ONLY  specify  that  only the top or bottom field of each frame should be used; the other field is discarded.
               These options can only be used with an interlaced input, and cause the interlaced stream to be treated as a progressive stream with
               half  the  height.   (This  is  particularly useful in creating a VCD from a full-size interlaced input stream.)  These two special
               options can only be used when the source is a pure progressive stream (as opposed to a YUV4MPEG2 "mixed-mode" stream).

            chromass=[420JPEG|420MPEG2|420PALDV|444|422|411|mono|444alpha]
               Specify the chroma subsampling mode used in the source stream.  This parameter is inferred from the stream header, so this  keyword
               should  almost  never be used in a source specification.  The only useful reason to specify this keyword is to override one variety
               of 4:2:0 with another. Any other use will cause processing to fail.

            sar=N:D
            sar=[NTSC|PAL|NTSC_WIDE|PAL_WIDE]
               Specify the sample-aspect-ratio of the source stream.  The value can either be or numeric ratio (such as "10:11")  or  one  of  the
               keywords,  which correspond to the CCIR-601 values for 4:3 or 16:9 displays, respectively.  This parameter is usually inferred from
               the stream header.

       -O output_parameter
            Specify parameters for the destination/output stream.  All '-O' arguments are evaluated in order, and later arguments on the  command-
            line will override earlier ones.  All '-O' arguments are evaluated after any '-I' arguments.

            size=WxH
            size=SRC
               Set  the  output/target  frame  size, as width W and height H in pixels.  Use the keyword SRC to specify that the target frame size
               should match the source frame size.

            active=WxH+X+Yaa
               Specify the active region of the target frame, into which the active region of the source frame is scaled.  The default is the full
               target  frame.  (The "WxH" may be omitted, and the region size defaults to the size of of the target frame.)  W and H are width and
               height.  X and Y are the offset of the anchor point.  "aa" is the anchor mode (default: TL); see "NOTES  ON  REGION  GEOMETRY"  for
               details.
               Example:  active=200x180+30+24cc

            bg=RGB:r,g,b
            bg=YCBCR:y,cb,cr
            bg=RGBA:r,g,b,a
            bg=YCBCRA:y,cb,cr,a
               Set  the target background color.  Pixels outside of the target's active region are set to this color. One can specify the color as
               either a R'G'B' or Y'CbCr triplet.  For example, the default color is black, specified as "bg=YCBCR:16,128,128" or  "bg=RGB:0,0,0".
               The  'A'  versions  will  set  the  alpha  (transparency) value of the color.  The alpha range is [0,255] for RGBA and [16,235] for
               YCBCRA.  The default is fully-opaque (255 for RGBA, 235 for YCBCRA).

            ilace=[NONE|TOP_FIRST|BOTTOM_FIRST]
               Specify the interlacing used by the target stream.  NONE, TOP_FIRST, and  BOTTOM_FIRST  correspond  to  non-interlaced,  top-field-
               first, and bottom-field-first.  The default if to match the source stream.
               If the source and target are both interlaced, but with different modes (i.e. one is bottom-first, and the other is top-first), then
               y4mscaler will convert one mode to the other by dropping the first source field.

            chromass=[420JPEG|420MPEG2|420PALDV|444|422|411|mono|444alpha]
               Specify the chroma subsampling mode to be used in the target stream.  The default is to match  the  source  mode.   See  "NOTES  ON
               CHROMA MODES AND SUBSAMPLING" for more information.

            sar=N:D
            sar=[SRC|NTSC|PAL|NTSC_WIDE|PAL_WIDE]
               Specify  the  sample-aspect-ratio  of  the source stream.  The value can either be or numeric ratio (such as "10:11") or one of the
               keywords, which correspond to the CCIR-601 values for 4:3 or 16:9 displays, respectively.  The keyword SRC specifies that the  tar‐
               get SAR should match the source.

            scale=N/D
            Xscale=N/D
            Yscale=N/D
               Set  the  scaling ratios, as a fraction; for example, scale=1/2.  "scale=" sets both X and Y factors simultaneously.  "Xscale=" and
               "Yscale=" can be used to set them independently.

            infer=[PAD|CLIP|PRESERVE_X|PRESERVE_Y]
               Set the mode used to infer scaling ratios from active regions and SAR's.  The keywords are mutually exclusive. The default is PAD.

            infer=[SIMPLIFY|EXACT]
               Set whether the above heuristic uses exact ratios, or whether it is allowed to slightly adjust active regions to simplify the scal‐
               ing ratios.  The keywords are mutually exclusive.  The default is SIMPLIFY.

            align=[TL|TC|TR|CL|CC|CR|BL|BC|BR]
               Set  the alignment point between the source and target active regions.  The keywords specify "top-left", "top-center", "top-right",
               etc.  The specified corner or point from the source region will be mapped to the same spot in the target region;  and  cropping  or
               padding which is applied to the active regions will preserve this mapping.  The default is CC, for "center-center", i.e. the source
               and target regions are mutually centered.  The keywords are mutually exclusive.  The default is CC.  See "NOTES ON SOURCE AND  TAR‐
               GET ALIGNMENT" for details.

            preset=[VCD|CVD|SVCD|DVD|DVD_WIDE|DV|DV_WIDE|
                    SVCD_STILL_HI|SVCD_STILL_LO|VCD_STILL_HI|VCD_STILL_LO|
                    ATSC_720P|ATSC_1080I|ATSC_1080P]
               Use  preset  target  parameters  for several common output formats.  Individual parameters can be overridden by following with more
               "-O" settings.  These keywords are mutually exclusive.  For the details of what settings these preset keywords imply, see "NOTES ON
               TARGET PRESETS".

               VCD - 352-wide VideoCD, progressive

               CVD - 352-wide (full-height) ChinaVideoDisc

               SVCD - 480-wide SuperVCD

               DVD - 720-wide DVD

               DVD_WIDE - 720-wide DVD, anamorphic pixels

               DV - 720-wide DV (bottom-field-first, 4:1:1)

               DV_WIDE - 720-wide DV, anamorphic pixels

               SVCD_STILL_HI - high-resolution SVCD still image

               SVCD_STILL_LO - low-resolution SVCD still image

               VCD_STILL_HI - high-resolution VCD still image

               VCD_STILL_LO - low-resolution SVCD still image

               ATSC_720P - ATSC 720p (progressive HDTV)

               ATSC_1080I - ATSC 1080i (interlaced HDTV)

               ATSC_1080P - ATSC 1080p (HDTV)

       -S scaling_parameter
            Specify  parameters  for  the scaling engine.  All '-S' arguments are evaluated in order, and later arguments on the command-line will
            override earlier ones.

            mode=MONO
               Request monochrome scaling.  The source is treated as monochrome and its chroma channels are ignored.  The chroma channels  of  the
               output stream will be zeroed to yield a grayscale output.

            mode=LINESWITCH
               Request  line  swapping.   Effectively,  the top and bottom fields within each frame will be swapped.  This may help with malformed
               streams that have a messed up spatial order.  This option is only effective on interlaced streams.

            scaler=scaler-name
               Use a particular scaling engine.  The available engines are:
                'default' - Matto's Generic Scaler (the default)

            option=scaler-option
               Specify an option for the chosen scaling engine.  To see all the available options, use "option=help".

               For the default engine, the available scaler-options select the filter kernel:

                  box - box filter

                  linear - linear interpolation

                  quadratic - quadratic interpolation

                  cubic - cubic interpolation, Mitchell-Netravali spline

                  cubicCR - cubic interpolation, Catmull-Rom spline

                  cubicB - cubic interpolation, B-spline

                  cubicK4 - Keys 4th-order cubic

                  sinc:N - sinc with Lanczos window, N cycles

               To select kernels for the x and y scaling directions independently, use two kernel names separated by a comma, e.g. option=box,qua‐
               dratic.

               sinc:N  will  give the best quality results (least aliasing), but is the slowest.  The quality improves with larger values of N, as
               does processing time.  cubic is generally regarded in the graphics world as the 3rd-order cubic  spline  with  the  best  trade-off
               between  smoothing  and aliasing.  box yields the worst quality results (most aliasing), but is the fastest.  The default kernel is
               cubicK4, which has a flatter passband and sharper cutoff than cubic.  (It requires the same computational power as sinc:4, but pro‐
               duces less ringing artifacts.)

NOTES ON TARGET PRESETS
       The  following  table details the settings provided by the various target "preset=" keywords.  When two values are given the primary is for
       NTSC streams; the value in {braces} is for PAL streams.  If interlace value is unspecified, it is inherited from the source, otherwise  the
       indicated target interlacing is required.

        Preset         Frame Size    Interlace     SAR            Subsampling
       -----------------------------------------------------------------------
         VCD           352x240{288}  none          10:11{59:54}   4:2:0-JPEG
         CVD           352x480{576}  ---           20:11{59:27}   4:2:0-MPEG2
        SVCD           480x480{576}  ---           15:11{59:36}   4:2:0-MPEG2
         DVD           720x480{576}  ---           10:11{59:54}   4:2:0-MPEG2
         DVD_WIDE      720x480{576}  ---           40:33{118:81}  4:2:0-MPEG2
         DV            720x480{576}  bottom-first  10:11{59:54}   4:1:1
         DV_WIDE       720x480{576}  bottom-first  40:33{118:81}  4:1:1
        SVCD_STILL_HI  704x480{576}  none          10:11{59:54}   4:2:0-MPEG2
        SVCD_STILL_LO  480x480{576}  none          15:11{59:36}   4:2:0-MPEG2
         VCD_STILL_HI  704x480{576}  none          10:11{59:54}   4:2:0-JPEG
         VCD_STILL_LO  352x240{288}  none          10:11{59:54}   4:2:0-JPEG
        ATSC_720p         1280x720   none          1:1            4:2:0-MPEG2
        ATSC_1080i        1920x1080  (required)    1:1            4:2:0-MPEG2
        ATSC_1080p        1920x1080  none          1:1            4:2:0-MPEG2

NOTES ON REGION GEOMETRY
       Active  and  matte regions are specified using a geometry string of the form "WxH+X+Yaa".  The "WxH" part specifies the size of the region,
       as a Width and Height in pixels.  (In some cases, the "WxH" may be omitted, and the region size defaults to  the  full  frame  size.)   The
       "+X+Y" specifies the position of the region, as an offset relative to the anchor point specified by "aa".

       The  "aa"  code can be one of TL, TC, TR, CL, CC, CR, BL, BC, or BR.  These stand for "top-left", "top-center", ..., "bottom-center", "bot‐
       tom-right".  These codes are not case-sensitive.

       The "+X+Y" specifies the offset of the region's anchor point from the frame's anchor point.  For example, "+20+30TL" means  that  the  top-
       left corner of the region will be offset 20 pixels to the right and 30 pixels down from the top-left corner of the frame.

       The  offset  values  can also be negative.  For example, "-4+0CC" means that the center (vertical and horizontal) of the region is offset 4
       pixels to the left of the center of the frame.

       The default anchoring point for geometry strings is TL, i.e. the top-left corner.

NOTES ON SOURCE AND TARGET ALIGNMENT
       Often, the source and target active regions do not match exactly.  This happens when, using the given or  calculated  scaling  ratios,  the
       source  region  scales  to  a  different  size  or  shape than the target region.  In this case, the source and target regions are mutually
       clipped, so that only the portion of the source which fits will be scaled into the target.

       Before any clipping or padding, the source and target regions are aligned so that the points specified via the "align=aa"  parameter  coin‐
       cide.  The "aa" code specifies an anchor point as described above.

       For  example, "align=BC" specifies that the bottom-center of the source region should get mapped to the bottom-center of the target region.
       In other words, the source region will be horizontally centered and vertically aligned to the bottom of the target region before clipping:

               ----------------  source
               |abcdefghijklmn|
            ---|opqrstuvwxyz01|---  target      ----------------
            |  |234567890ABCDE|  |              |234567890ABCDE|
            |  |FGHIJKLMNOPQRS|  |              |FGHIJKLMNOPQRS|
            |  |TUVWXYZabcdefg|  |              |TUVWXYZabcdefg|
            ----------------------              ----------------
                   Before                       Mutually Clipped

       If instead "align=TR" were centered, the source would be clipped in a different place, and scaled into a different  region  of  the  target
       frame:

            ----------------------                 ----------------
            |     |abcdefghijklmn|                 |abcdefghijklmn|
            |     |opqrstuvwxyz01|                 |opqrstuvwxyz01|
            |     |234567890ABCDE|                 |234567890ABCDE|
            ------|FGHIJKLMNOPQRS|                 ----------------
         target   |TUVWXYZabcdefg| source
                  ----------------
                   Before                       Mutually Clipped

       The default alignment mode is "CC", that is, the source and target are mutually centered.

NOTES ON SCALE FACTOR INFERENCE
       If  the X and Y scaling factors are not explicitly provided, y4mscaler will infer the factors from the source and target active regions and
       sample aspect ratios (SAR's).

       If the active regions are not compatible shape-wise (given the SAR's), the source and target regions will be clipped or padded according to
       one  of  four  policies.  The policy is selected using the "infer=" parameter and one of the keywords PAD, CLIP, PRESERVE_X, or PRESERVE_Y.
       (The default is PAD.)

          PAD
             Pick scaling factors which will pad the source, but ensure that all of the source image content ends up in the target.

          CLIP
             Pick scaling factors which will clip the source, but which will fill the target region as much as possible.

          PRESERVE_X
             Pick scaling factors which preserve as much of the horizontal source content as possible.

          PRESERVE_Y
             Pick scaling factors which preserve as much of the vertical source content as possible.

       The policy is further affected by a choice of two other keywords, SIMPLIFY, or EXACT.  (The default is SIMPLIFY.)

          EXACT
             Calculate exact scaling factors.

          SIMPLIFY
             Adjust the active regions and scaling factors (within 10% or so), to simplify the ratios as much as possible.  (For example, crop  or
             pad slightly to achieve a ratio of 2/1 rather than 45/22.)

NOTES ON CHROMA MODES AND SUBSAMPLING
       y4mscaler can convert streams from one chroma subsampling mode to another.  Such conversions are always lossy operations, even if the over‐
       all frame is undergoing 1/1 scaling.

       y4mscaler will infer the source's subsampling mode from tags in the input stream header.  The target presets ("preset=XXX") will attempt to
       set  the  target subsampling mode appropriately.  Otherwise, by default the target subsampling mode will match the source.  One can explic‐
       itly set the subsampling mode for the source and/or the target by using the "chromass=" parameter.

       y4mscaler is capable of reading and writing streams in the 4:4:4, 4:2:2, 4:1:1, and 4:2:0 (all three  varieties)  subsampling  modes.   The
       first  three, however, are a relatively new addition to the YUV4MPEG2 standard, and many MJPEGtools will fail to process them correctly, if
       at all.  smil2yuv and raw2yuv can produce native 4:1:1 streams from NTSC DV video, which can then be converted to 4:2:0 by y4mscaler before
       further processing by other tools.

       If  the source has an alpha-channel (i.e. 444ALPHA mode) and the target does not, the alpha channel will simply be discarded.  On the other
       hand, if the target has an alpha-channel but the source does not, a constant alpha-channel will be created using  the  alpha-value  of  the
       target's background color (as set by "-O bg=").  The default is fully-opaque.

       Similarly, if the target has chroma channels but the source does not (i.e. a luma-only MONO stream), then the chroma channels in the output
       will be set according to the background color.

NOTES ON ANOMALOUS INTERLACE MIXTURES
       The YUV4MPEG2 format allows for "mixed-mode interlacing" streams, which may contain a mixture of progressive and interlaced  frames.   Each
       frame  is  tagged as temporally interlaced or progressive, and vertically-subsampled frames (4:2:0 formats) are further tagged as spatially
       interlaced or not.  Unfortunately, this allows for the possibility of anomalous frames, which happen to be  temporally  interlaced  (fields
       sampled  at  different  times)  but  spatially progressive (subsampling performed across entire frame), or vice-versa.  The only reasonable
       thing to do with such anomalous frames is to vertically-upsample the chroma, essentially making to problem go away as quickly as possible.

       y4mscaler will only process such frames if the target output format is non-vertically-subsampled (e.g. 4:4:4, 4:2:2,  etc.)  and  no  other
       vertical processing is required.  Otherwise y4mscaler will bail on processing in midstream when it encounters an anomalous frame.  If there
       is any possibility of encountering such an error, y4mscaler will print a warning when processing begins.

EXIT STATUS
       0      Successful program execution.

       1      Usage, syntax, or operational error.

AUTHOR
       This manual page is copyright 2005 by Matthew Marjanovic.
       Feel free to direct any questions, remarks, problems, or bug reports concerning this tool to <dmg @ mir.com>.

       For more info, see our website at:
              <http://www.mir.com/DMG/> ⟨http://www.mir.com/DMG/⟩

       For more information on MJPEGtools, consult:
              <http://mjpeg.sourceforge.net/> ⟨http://mjpeg.sourceforge.net/⟩

SEE ALSO
       mjpegtools(1), yuv2lav(1), mpeg2enc(1), ppmtoy4m(1), raw2yuv(1), smil2yuv(1), yuvplay(1), yuvscaler(1)

y4mtools                                                         February 14, 2003                                                    y4mscaler(1)
