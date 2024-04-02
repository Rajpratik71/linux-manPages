y4mdenoise(1)                                                   MJPEG tools manual                                                   y4mdenoise(1)

NAME
       y4mdenoise - Motion-compensating YUV4MPEG-frame denoiser

SYNOPSIS
       y4mdenoise   [-v   verbosity]   [-p  parallelism]  [-r  motion-search_radius]  [-R  color_motion-search_radius]  [-t  error_tolerance]  [-T
       color_error_tolerance]  [-z  zero_motion_error_tolerance]  [-Z  color_zero_motion_error_tolerance]  [-m  match-count_throttle]  [-M  match-
       size_throttle] [-f reference_frames] [-B] [-I interlacing_type] < /dev/stdin > /dev/stdout

DESCRIPTION
       y4mdenoise  can  be used to remove noise from images in a YUV4MPEG2 stream. This is useful for cleaning old sources to increase video qual‐
       ity, and to reduce the bitrate needed to encode your video (e.g. for VCD and SVCD creation).

HOW IT WORKS
       It maintains a list of the last several frames, called reference frames.  Each reference frame is composed of reference pixels.  Every time
       a pixel in one frame is proven to be a moved instance of a pixel in another frame, the reference-pixel incorporates its value, and produces
       an average value for all instances of the pixel.  The oldest reference frame, therefore, gets a pretty good idea of the real value of every
       pixel, but of course output is delayed by the number of reference frames.

       The  search is not actually done one pixel at a time; it's done in terms of pixel groups.  An entire pixel-group has to match for any match
       to be found, but all possible pixel-groups are tested (i.e. all possible overlapping combinations are checked).  Using  pixel-groups  helps
       to  establish  a  minimum  standard for what may be considered a match, in order to avoid finding lots of really small (and really useless)
       matches.  Presently, intensity pixel-groups are 4x2 (i.e. 4 across and 2 down), and color pixel-groups are 2x2.

       It compares every pixel-group in the current frame with all pixel-groups in the previous frame, within a  given  search-radius,  and  sorts
       them  based  on  how close the match was, keeping the top contenders.  It then flood-fills each found pixel-group in turn, to determine the
       full size of the match.  The first match found to be big enough is applied to the image.  The number of contenders  to  consider,  and  the
       minimum size of a match, can be specified on the command line.

       At the end of the frame, any new-frame pixels not resolved yet are considered to be new information, and a new reference-pixel is generated
       for each one.

       A "zero-motion pass" happens each frame, before motion-detection, in an attempt to resolve most of the frame cheaply.  Its  error-tolerance
       can be set separately.

OPTIONS
       y4mdenoise accepts the following options:

       -v [0..2] verbosity
           0 = none, 1 = normal (per-frame pixel-detection totals), 2=debug.

       -p num
           Controls  the level of parallelism.  Since intensity and color are denoised separately by design, it's very easy to do each in parallel
           on a multiple-processor machine.  The default value is 1; that reads and writes video frames in parallel with denoising.  A value of  2
           causes  intensity  and color to be denoised in parallel.  A value of 3 does both types of concurrency.  A value of 0 turns off all con‐
           currency.

       -r [4..] search radius
           The search radius, i.e. the maximum distance that a pixel can move and still be found by motion-detection.  The default is  16.   There
           are no particular restrictions on the search radius, e.g. it doesn't have to be an even multiple of 4.

       -R [4..] color search radius
           The  search  radius  to  use  for  color.  Default is whatever the main search-radius was set to.  Note that this value ends up getting
           scaled by the relative size of intensity & color planes in your YUV4MPEG2 stream.

       -t [0..255] Error tolerance
           The largest difference between two pixels that's accepted for the two pixels to be considered equal.  The default is 3, which  is  good
           for  medium-noise  material  like  analog  cable TV.  (This value will have to be changed to whatever is appropriate for your YUV4MPEG2
           stream in order to avoid undesirable results.  See the instructions below.)

       -T [0..255] Error tolerance for color
           The default is whatever the main error-tolerance was set to.

       -z [0..255] Error tolerance for zero-motion pass
           The error-tolerance used on pixels that haven't moved.  Usually equal to the main error-tolerance or one less than that.  Default is 2.

       -Z [0..255] Error tolerance for color's zero-motion pass
           The default is whatever the main zero-motion error-tolerance was set to.

       -m [num] Match-count throttle
           The maximum number of pixel-group matches (within the search radius) to consider.  If more are found,  only  the  closest  matches  are
           kept.  Default is 15.

       -M [num] Match-size throttle
           The  minimum size of the flood-filled region generated from a match.  Matches smaller than this are thrown away.  Specified in terms of
           pixel-groups.  Default is 3.

       -f num
           The number of reference frames to keep.  Pixel values are averaged over this many frames before they're  written  to  standard  output;
           this also implies that output is delayed by this many frames.  Default is 10.

       -B  Black-and-white mode.  Denoise only the intensity plane, and set the color plane to all white.

       -I num
           Set  interlacing type.  Default is taken from the YUV4MPEG2 stream.  0 means not interlaced, 1 means top-field interlaced, 2 means bot‐
           tom-field interlaced.  This is useful when the signal is more naturally of some other interlacing type than its current  representation
           (e.g.  if  the  original  was  shot on film and then later it was transferred to interlaced video, it will denoise better if treated as
           film, i.e.  non-interlaced).

TYPICAL USAGE AND TIPS
       Keep in mind that all of this advice was gained through experience.  (Just because one writes a tool doesn't mean one  understands  how  it
       should be used, for the same reason that car designers aren't necessarily professional drivers.)

       The  error-threshold  must  be determined for every individual YUV4MPEG2 stream.  If the threshold is set too low, it'll leave noise in the
       video, and the denoiser will run a lot slower than it has to.  If it's set too high, the denoiser will start to remove  detail:  the  video
       will get blurrier, you may see topographical-like bands in the relatively flat areas of the video, and small parts of the video that should
       be moving will be stuck in place.  It may also run a little slower.  Additionally, just because the video came to you from a  clean  source
       (digital  cable  TV,  LaserDisc, etc.) doesn't mean the video itself is clean; y4mdenoise is capable of picking up on noise in the original
       recording as well as sampling error from the video-capture device.  You will have to generate small clips of representative parts  of  your
       video,  denoise  them  with various error thresholds, and see what looks the best.  As you gain experience with the tool, you may know what
       error threshold generally works with various types of sources, but you'll still want to double-check your assumptions.

       Flat, shiny surfaces, like gloss-painted walls, or the polished wood floor of an indoor gymnasium, seem to require a lower error  threshold
       than other types of video.

       Here is the author's experience:

        -t 1 : Digital cable TV, most LaserDiscs, DV camcorder video
        -t 2 : VHS camcorder video, commercially-produced videotapes
        -t 3 : Analog cable TV, VHS videotape (at the 2-hour speed)
        -t 4 : VHS videotape (at the 6-hour speed)

       Interlaced  video  that  was  made  from non-interlaced video (e.g. a videotape or LaserDisc of a film) must be denoised as non-interlaced.
       Otherwise the result tends to be grainy.

       y4mdenoise only removes temporal noise, i.e. noise that occurs over time.  And it tends to do such a good job of  this,  that  the  spatial
       noise  (i.e.  noise  that  occurs  in  nearby areas of the same frame) tends to become very distinct.  Therefore, always pipe the output of
       y4mdenoise through a spatial filter such as y4mspatialfilter or yuvmedianfilter.

       When producing very low bitrate video (e.g. VCD-compatible video less than 900 kbps), denoise at the output frame size, e.g. don't  denoise
       at  DVD frame size then downscale to VCD size.  That will denoise as well as condition the video for the motion-detection part of mpeg2enc.
       Not doing this will produce video where the less complex scenes will look really good, but high-motion scenes will blur significantly.

       JPEG compression of your video frames, even 100% compression, seems to be inaccurate enough to affect MPEG encoding.  Therefore, if  you're
       using  motion-JPEG  files  as  your  intermediary video format, you may want to use the denoiser in your MPEG-encoding pipeline, i.e. after
       lav2yuv and before mpeg2enc.  If you're generating multiple resolutions of the same video, e.g. DVD and VCD,  experience  shows  that  it's
       acceptable  to  run  y4mdenoise before yuv2lav, but you should still use the spatial-filter (e.g. y4mspatialfilter, yuvmedianfilter) in the
       MPEG-encoding pipeline, to try to smooth away JPEG encoding artifacts.

AUTHOR
       The bulk of the y4mdenoise code, and this manual page, was written by Steven Boswell <ulatec@users.sourceforge.net>.

FURTHER INFO
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:

       mjpeg-users@lists.sourceforge.net

       For more info, see our website at

       http://mjpeg.sourceforge.net/

SEE ALSO
       mjpegtools(1), mpeg2enc(1), yuvdenoise(1), yuvmedianfilter(1)

MJPEG Tools Team                                                    27 Apr 2004                                                      y4mdenoise(1)
