lavplay(1)                                                      MJPEG tools manual                                                      lavplay(1)

NAME
       lavplay - Playback and edit MJPEG video

SYNOPSIS
       lavplay [options] lavfile1 [lavfile2 ... lavfileN]

DESCRIPTION
       lavplay  can be used to playback video in MJPEG format (either quicktime or AVI) on a zoran video-capture device, such as the Miro/Pinnacle
       DC10(+), the Iomega Buz or Linux Media Labs' LML33, or in software mode (using SDL).

       It also provides mechanisms for non-destructive editting video using an interactive front-end such as glav(1).  See SEARCHING  AND  EDITING
       below for details.

OPTIONS
       lavplay accepts the following options:

       -p/--playback [S|C|H]
               The playback mode to be used. 'S' means software-playback using SDL.
                'H'  means  hardware-playback  on the monitor (on-screen). 'C' means hardware-playback to the video-out of the zoran video-capture
               device.  Obviously, 'C' and 'H' only work on computers with zoran video-capture devices.

       -Z/--full-screen
               Full-screen playback. This works if SDL- or onscreen-playback is chosen.

       --size NxN
               Size of the video window (default: size of the input video) when using software (SDL) or hardware onscreen playback

       -a/--audio num
               When play audio, 0 means never, or sum of
                 1: while playing forward,
                 2: while playing reverse,
                 4: even fast playing,
                 8: while pausing
               (default: 7: forward/reverse/fast).  If 8(pausing) was contained, lavplay will be very noisy, but useful when you want to  edit  by
               sound.

       -z/--zoom
               Zooms the video to fit the screen as good as possible.

       -x      Exchange  fields  of  an  interlaced video. Try this if the video looks weird.  It shouldn't be necessary with stuff captured using
               lavrec(1) but could be needed for other sources.

       -s/--skip num
               Skip <num> seconds of video at the beginning.

       -x/--exchange-fields
               Invert field order (for videos which are recorded with wrong field order interlacing settings)

       -F/--flicker
               Disable stills flicker reduction.  This is useful if you want to see stills exactly as they were recorded rather than flicker-free!

       -c/--synchronization [0|1]
               Enables (1) or disables (0) the use of sync corrections. Basically, you almost certainly want this.  Disabling is really there  for
               diagnostic purposes and not much else.

       -H/--H-offset num, -V/--V-offset num
               Horizontal (-H) and vertical (-V) offset when using hardware-playback.  Offset plus width or height should be smaller than or equal
               to the playback device's maximum allowed size (DC10+: 640x480 or 768x576, LML33/Marvel/Buz: 720x480/576).

       --s-x-offset num, --s-y-offset num
               Offset for the video window (from top left screen corner) when using hardware onscreen playback in non-fullscreen mode.

       --display :x.x
               When using hardware fullsreen video playback (-pH), this setting can be used to specify the video display (default:  :0.0)  to  use
               for video display.

       -q/--no-quit
               Makes  lavplay  stay  alive  at  the end of the video (lavplay won't quit).  Use 'q<enter>' on the command line to quit (see below,
               SEARCHING AND EDITING).

       -g/--gui-mode
               Enables GUI-mode. This is used by glav and Linux Video Studio. It will output the current position in the video each frame, so that
               the glav or LVS can keep track of where we are in the video which is being played back.

       -P/--preserve-pathnames
               This  is  used  by  glav  and Linux Video Studio.  When editlists are created the original pathnames for files are used and not the
               canonicalised pathnames from the root directory.  Useful if you've got things like automounters active that make  directories  with
               the same non-canonical name have different canonical names on different machines.

       -U/--use-write
               Use  the  write()  system  call rather than the mmap() system call for audio writing to the sound device.   This may fix some audio
               playback problems.

       -n/--mjpeg-buffers num
               Number of MJPEG-buffers. Default is 32. Try changing this number if you have many lost frames.

       -v/--verbose num
               Verbosity level (0, 1 or 2)

ENVIRONMENT VARIABLES
       The following environment variables can be recognized by lavrec:

       LAV_VIDEO_DEV
               The video device. Default is /dev/video

       LAV_AUDIO_DEV
               The audio device. Default is /dev/dsp

SEARCHING AND EDITING
       lavplay can do more than simple plain playback. It is also intended to be controlled using commands sent via stdin from  a  front-end  like
       glav(1)  or  similar, more sophisticated tools.  The most significant aspect of this functionality is the ability to create edit list files
       giving the playback sequence of an editted version of the input video.  The edit list file can be read by any of the mjpegtools(1) (includ‐
       ing  lavplay!)  wherever an actual video file would be acceptable.  Such edit lists record only the original source file and start and stop
       frames of the components of the editted video editting rather than the video itself.  As such editting leaves the original files  unchanged
       and  requires only tiny amounts of data-movement.  The drawback is that for the edit list to work the original files must remain unchanged,
       and that interactive play may be jumpy due to the playback sequence  "skipping  about"  between  different  parts  of  the  original  video
       sequence.

       If a stand-alone consolidated versions of editted video is required it can be produced by running the lavtrans(1) utility on the edit list.

       Edit  list files are plain text with a very simple syntax to allow easy manual editting using a text-editor or writing of scripted editting
       tools.

STDIN COMMANDS
       The commands accepted on standard input sre as follows (and can of course be entered directly by command-line junkies):

       +, -    Goes to next/previous frame. Only makes sense when the video is paused.

       pN      Sets playback speed to N (N=..., -1, 0, 1, ...)

       a[01]   Enables/disables audio playback

       sN      if N is a number, this means to go to frame N. if N is prefixed by a + or -, this means to go N frames back- or forward.

       om editlist [N1 N2 [N3 N4]]
               Opens a movie or editlist. A second and third argument can specify to only open a specific range of frames from this  video  (N1=-1
               means  whole  video).  N3 and N4 can specify to show only a specific range of frames from the frames which were just opened (useful
               for trimming).

       w[as] file
               Save the current editlist (a) or the current selection (s) to a file.

       q       Quit lavplay.

       e[ou] N1 N2
               Cuts (u) or copies (o) frames N1-N2 from the current editlist into an internal selection.

       ep      Pastes the contents of the selection into the current position in the editlist.

       em N1 N2 N3
               Moves frames N1-N2 to position N3 in the video.

       ed N1 N2
               Deletes frames N1-N2 from the editlist.

       ea video N1 N2 N3
               Adds frames N1-N2 of the video into position N3 within the editlist.  N1=-1 means to add the whole video.

       es N1 N2
               Sets the current viewable frames within the whole video to N1-N2. This is useful for trimming.

BUGS
       Editlists record absolute pathnames.  This more or less forces manual editting of the pathnames in them if it is desired to move  editlists
       and source video files.

       lavplay  really  ought  to  make a decent job of detecting what playback options are feasible (on-screen hardware, video-out port hardware,
       software) and set the default playback mode appropriately.  Alas, it does not.

AUTHOR
       This man page was written by Ronald Bultje.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
           mjpeg-users@lists.sourceforge.net
       For more info, see our website at
           http://mjpeg.sourceforge.net/

SEE ALSO
       mjpegtools(1), lavrec(1), glav(1)

MJPEG Tools Team                                                  6 December 2001                                                       lavplay(1)
