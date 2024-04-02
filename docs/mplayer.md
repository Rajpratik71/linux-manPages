MPlayer(1)                                                       The Movie Player                                                       MPlayer(1)

NAME
       mplayer  - movie player
       mencoder - movie encoder

SYNOPSIS
       mplayer [options] [file|URL|playlist|-]
       mplayer [options] file1 [specific options] [file2] [specific options]
       mplayer [options] {group of files and options} [group-specific options]
       mplayer [br]://[title][/device] [options]
       mplayer [dvd|dvdnav]://[title|[start_title]-end_title][/device] [options]
       mplayer vcd://track[/device]
       mplayer tv://[channel][/input_id] [options]
       mplayer radio://[channel|frequency][/capture] [options]
       mplayer pvr:// [options]
       mplayer dvb://[card_number@]channel [options]
       mplayer mf://[filemask|@listfile] [-mf options] [options]
       mplayer [cdda|cddb]://track[-endtrack][:speed][/device] [options]
       mplayer cue://file[:track] [options]
       mplayer [file|mms[t]|http|http_proxy|rt[s]p|ftp|udp|unsv|icyx|noicyx|smb]:// [user:pass@]URL[:port] [options]
       mplayer sdp://file [options]
       mplayer mpst://host[:port]/URL [options]
       mplayer tivo://host/[list|llist|fsid] [options]
       gmplayer [options] [-skin skin]
       mencoder [options] file [file|URL|-] [-o file | file://file | smb://[user:pass@]host/filepath]
       mencoder [options] file1 [specific options] [file2] [specific options]

DESCRIPTION
       mplayer  is  a movie player for Linux (runs on many other platforms and CPU architectures, see the documentation).  It plays most MPEG/VOB,
       AVI, ASF/WMA/WMV, RM, QT/MOV/MP4, Ogg/OGM, MKV, VIVO, FLI, NuppelVideo, yuv4mpeg, FILM and RoQ files, supported by many native  and  binary
       codecs.  You can watch VCD, SVCD, DVD, Blu-ray, 3ivx, DivX 3/4/5, WMV and even H.264 movies, too.

       MPlayer  supports  a wide range of video and audio output drivers.  It works with X11, Xv, DGA, OpenGL, SVGAlib, fbdev, AAlib, libcaca, Di‐
       rectFB, Quartz, Mac OS X CoreVideo, but you can also use GGI, SDL (and all their drivers), VESA (on every VESA-compatible card, even  with‐
       out  X11),  some low-level card-specific drivers (for Matrox, 3dfx and ATI) and some hardware MPEG decoder boards, such as the Siemens DVB,
       Hauppauge PVR (IVTV), DXR2 and DXR3/Hollywood+.  Most of them support software or hardware scaling, so you can enjoy movies  in  fullscreen
       mode.

       MPlayer  has  an onscreen display (OSD) for status information, nice big antialiased shaded subtitles and visual feedback for keyboard con‐
       trols.  European/ISO8859-1,2 (Hungarian, English, Czech, etc), Cyrillic and Korean fonts are supported along with 12 subtitle formats  (Mi‐
       croDVD,  SubRip,  OGM,  SubViewer, Sami, VPlayer, RT, SSA, AQTitle, JACOsub, PJS and our own: MPsub) and DVD subtitles (SPU streams, VOBsub
       and Closed Captions).

       mencoder (MPlayer's Movie Encoder) is a simple movie encoder, designed to encode MPlayer-playable movies  (see  above)  to  other  MPlayer-
       playable formats (see below).  It encodes to MPEG-4 (DivX/Xvid), one of the libavcodec codecs and PCM/MP3/VBRMP3 audio in 1, 2 or 3 passes.
       Furthermore it has stream copying abilities, a powerful filter system (crop, expand, flip, postprocess, rotate, scale, noise, RGB/YUV  con‐
       version) and more.

       gmplayer  is  MPlayer  with a graphical user interface.  Besides some own options (stored in gui.conf), it has the same options as MPlayer,
       however some MPlayer options will be stored in gui.conf so that they can be chosen independently from MPlayer. (See GUI CONFIGURATION  FILE
       below.)

       Usage examples to get you started quickly can be found at the end of this man page.

       Also see the HTML documentation!

INTERACTIVE CONTROL
       MPlayer  has  a fully configurable, command-driven control layer which allows you to control MPlayer using keyboard, mouse, joystick or re‐
       mote control (with LIRC).  See the -input option for ways to customize it.

       keyboard control
              LEFT and RIGHT
                   Seek backward/forward 10 seconds.
              UP and DOWN
                   Seek forward/backward 1 minute.
              PGUP and PGDWN
                   Seek forward/backward 10 minutes.
              [ and ]
                   Decrease/increase current playback speed by 10%.
              { and }
                   Halve/double current playback speed.
              BACKSPACE
                   Reset playback speed to normal.
              < and >
                   Go backward/forward in the playlist.
              ENTER
                   Go forward in the playlist, even over the end.
              HOME and END
                   next/previous playtree entry in the parent list
              INS and DEL (ASX playlist only)
                   next/previous alternative source.
              p / SPACE
                   Pause (pressing again unpauses).
              .
                   Step forward.  Pressing once will pause movie, every consecutive press will play one frame and then go into  pause  mode  again
                   (any other key unpauses).
              q / ESC
                   Stop playing and quit.
              U
                   Stop playing (and quit if -idle is not used).
              + and -
                   Adjust audio delay by +/- 0.1 seconds.
              / and *
                   Decrease/increase volume.
              9 and 0
                   Decrease/increase volume.
              ( and )
                   Adjust audio balance in favor of left/right channel.
              m
                   Mute sound.
              _ (MPEG-TS, AVI and libavformat only)
                   Cycle through the available video tracks.
              # (DVD, Blu-ray, MPEG, Matroska, AVI and libavformat only)
                   Cycle through the available audio tracks.
              TAB (MPEG-TS and libavformat only)
                   Cycle through the available programs.
              f
                   Toggle fullscreen (also see -fs).
              T
                   Toggle stay-on-top (also see -ontop).
              w and e
                   Decrease/increase pan-and-scan range.
              o
                   Toggle OSD states: none / seek / seek + timer / seek + timer + total time.
              d
                   Toggle frame dropping states: none / skip display / skip decoding (see -framedrop and -hardframedrop).
              v
                   Toggle subtitle visibility.
              j and J
                   Cycle through the available subtitles.
              y and g
                   Step forward/backward in the subtitle list.
              F
                   Toggle displaying "forced subtitles".
              a
                   Toggle subtitle alignment: top / middle / bottom.
              x and z
                   Adjust subtitle delay by +/- 0.1 seconds.
              c (-capture only)
                   Start/stop capturing the primary stream.
              r and t
                   Move subtitles up/down.
              i (-edlout mode only)
                   Set start or end of an EDL skip and write it out to the given file.
              s (-vf screenshot only)
                   Take a screenshot.
              S (-vf screenshot only)
                   Start/stop taking screenshots.
              I
                   Show filename on the OSD.
              P
                   Show progression bar, elapsed time and total duration on the OSD.
              ! and @
                   Seek to the beginning of the previous/next chapter.
              D (-vo xvmc, -vo vdpau, -vf yadif, -vf kerndeint only)
                   Activate/deactivate deinterlacer.
              A    Cycle through the available DVD angles.

              (The following keys are valid only when using a hardware accelerated video output (xv, (x)vidix, (x)mga, etc), the software equaliz‐
              er (-vf eq or -vf eq2) or hue filter (-vf hue).)

              1 and 2
                   Adjust contrast.
              3 and 4
                   Adjust brightness.
              5 and 6
                   Adjust hue.
              7 and 8
                   Adjust saturation.

              (The following keys are valid only when using the quartz or corevideo video output driver.)

              command + 0
                   Resize movie window to half its original size.
              command + 1
                   Resize movie window to its original size.
              command + 2
                   Resize movie window to double its original size.
              command + f
                   Toggle fullscreen (also see -fs).
              command + [ and command + ]
                   Set movie window alpha.

              (The following keys are valid only when using the sdl video output driver.)

              c
                   Cycle through available fullscreen modes.
              n
                   Restore original mode.

              (The following keys are valid if you have a keyboard with multimedia keys.)

              PAUSE
                   Pause.
              STOP
                   Stop playing and quit.
              PREVIOUS and NEXT
                   Seek backward/forward 1 minute.

              (The following keys are only valid if you compiled with TV or DVB input support and will  take  precedence  over  the  keys  defined
              above.)

              h and k
                   Select previous/next channel.
              n
                   Change norm.
              u
                   Change channel list.

              (The following keys are only valid if you compiled with dvdnav support: They are used to navigate the menus.)

              keypad 8
                   Select button up.
              keypad 2
                   Select button down.
              keypad 4
                   Select button left.
              keypad 6
                   Select button right.
              keypad 5
                   Return to main menu.
              keypad 7
                   Return to nearest menu (the order of preference is: chapter->title->root).
              keypad ENTER
                   Confirm choice.

              (The  following  keys  are  used for controlling TV teletext. The data may come from either an analog TV source or an MPEG transport
              stream.)

              X
                   Switch teletext on/off.
              Q and W
                   Go to next/prev teletext page.

       mouse control
              button 3 and button 4
                   Seek backward/forward 1 minute.
              button 5 and button 6
                   Decrease/increase volume.

       joystick control
              left and right
                   Seek backward/forward 10 seconds.
              up and down
                   Seek forward/backward 1 minute.
              button 1
                   Pause.
              button 2
                   Toggle OSD states: none / seek / seek + timer / seek + timer + total time.
              button 3 and button 4
                   Decrease/increase volume.

USAGE
       Every 'flag' option has a 'noflag' counterpart, e.g. the opposite of the -fs option is -nofs.

       If an option is marked as (XXX only), it will only work in combination with the XXX option or if XXX is compiled in.

       NOTE: The suboption parser (used for example for -ao pcm suboptions) supports a special kind of string-escaping intended for use  with  ex‐
       ternal GUIs.
       It has the following format:
       %n%string_of_length_n
       EXAMPLES:
       mplayer -ao pcm:file=%10%C:test.wav test.avi
       Or in a script:
       mplayer -ao pcm:file=%`expr length "$NAME"`%"$NAME" test.avi

CONFIGURATION FILES
       You can put all of the options in configuration files which will be read every time MPlayer/MEncoder is run.  The system-wide configuration
       file 'mplayer.conf' is in your configuration directory (e.g. /etc/mplayer or /usr/local/etc/mplayer), the user specific one is '~/.mplayer/
       config'.   The  configuration  file  for  MEncoder is 'mencoder.conf' in your configuration directory (e.g. /etc/mplayer or /usr/local/etc/
       mplayer), the user specific one is '~/.mplayer/mencoder.conf'.  User specific options override system-wide options (in  case  of  gmplayer,
       gui.conf options override user specific options) and options given on the command line override all.  The syntax of the configuration files
       is 'option=<value>', everything after a '#' is considered a comment.  Options that work without values can be enabled by  setting  them  to
       'yes' or '1' or 'true' and disabled by setting them to 'no' or '0' or 'false'.  Even suboptions can be specified in this way.

       You  can  also  write  file-specific configuration files.  If you wish to have a configuration file for a file called 'movie.avi', create a
       file named 'movie.avi.conf' with the file-specific options in it and put it in ~/.mplayer/.  You can also put the configuration file in the
       same  directory  as  the  file to be played, as long as you give the -use-filedir-conf option (either on the command line or in your global
       config file).  If a file-specific configuration file is found in  the  same  directory,  no  file-specific  configuration  is  loaded  from
       ~/.mplayer.   In  addition,  the -use-filedir-conf option enables directory-specific configuration files.  For this, MPlayer first tries to
       load a mplayer.conf from the same directory as the file played and then tries to load any file-specific configuration.

       EXAMPLE MPLAYER CONFIGURATION FILE:

       # Use Matrox driver by default.
       vo=xmga
       # I love practicing handstands while watching videos.
       flip=yes
       # Decode/encode multiple files from PNG,
       # start with mf://filemask
       mf=type=png:fps=25
       # Eerie negative images are cool.
       vf=eq2=1.0:-0.8
       # OSD progress bar vertical alignment
       progbar-align=50

       EXAMPLE MENCODER CONFIGURATION FILE:

       # Make MEncoder output to a default filename.
       o=encoded.avi
       # The next 4 lines allow mencoder tv:// to start capturing immediately.
       oac=pcm=yes
       ovc=lavc=yes
       lavcopts=vcodec=mjpeg
       tv=driver=v4l2:input=1:width=768:height=576:device=/dev/video0:audiorate=48000
       # more complex default encoding option set
       lavcopts=vcodec=mpeg4:autoaspect=1
       lameopts=aq=2:vbr=4
       ovc=lavc=1
       oac=lavc=1
       passlogfile=pass1stats.log
       noautoexpand=1
       subfont-autoscale=3
       subfont-osd-scale=6
       subfont-text-scale=4
       subalign=2
       subpos=96
       spuaa=20

       GUI CONFIGURATION FILE

       GUI's own options are (MPlayer option names in parentheses): ao_alsa_device (alsa:device=) (ALSA only), ao_alsa_mixer (mixer) (ALSA  only),
       ao_alsa_mixer_channel (mixer-channel) (ALSA only), ao_esd_device (esd:) (ESD only), ao_extra_stereo (af extrastereo) (default: 1.0), ao_ex‐
       tra_stereo_coefficient (af extrastereo=), ao_oss_device (oss:) (OSS only), ao_oss_mixer (mixer) (OSS  only),  ao_oss_mixer_channel  (mixer-
       channel)  (OSS  only),  ao_sdl_subdriver  (sdl:)  (SDL only), ao_surround (unused), ao_volnorm (af volnorm), autosync (enable/disable), au‐
       tosync_size (autosync), cache (enable/disable), cache_size (cache), enable_audio_equ  (af  equalizer),  equ_band_00  ...  equ_band_59,  (af
       equalizer=),  equ_channel_1  ...  equ_channel_6  (af  channels=),  gui_main_pos_x,  gui_main_pos_y,  gui_save_pos  (yes/no), gui_tv_digital
       (yes/no), gui_video_out_pos_x, gui_video_out_pos_y, load_fullscreen  (yes/no), playbar (enable/disable),  show_videowin  (yes/no),  vf_lavc
       (vf lavc) (DXR3 only), vf_pp (vf pp), vo_dxr3_device (unused) (DXR3 only).

       MPlayer  options  stored  in  gui.conf  (GUI  option names, MPlayer option names in parentheses) are: a_afm (afm), ao_driver (ao), ass_bot‐
       tom_margin (ass-bottom-margin) (ASS only), ass_enabled (ass) (ASS only), ass_top_margin (ass-top-margin) (ASS only), ass_use_margins  (ass-
       use-margins)  (ASS  only),  cdrom_device  (cdrom-device),  dvd_device  (dvd-device),  font_autoscale  (subfont-autoscale)  (FreeType only),
       font_blur (subfont-blur) (FreeType only), font_encoding (subfont-encoding), font_factor (ffactor), font_name (font),  font_osd_scale  (sub‐
       font-osd-scale)  (FreeType  only),  font_outline  (subfont-outline)  (FreeType only), font_text_scale (subfont-text-scale) (FreeType only),
       gui_skin (skin), idle (idle), osd_level (osdlevel),  softvol  (softvol),  stopxscreensaver  (stop-xscreensaver),  sub_auto_load  (autosub),
       sub_cp (subcp) (iconv only), sub_overlap (overlapsub), sub_pos (subpos), sub_unicode (unicode), sub_utf8 (utf8), v_flip (flip), v_framedrop
       (framedrop), v_idx (idx), v_ni (ni), v_vfm (vfm), vf_autoq (autoq), vo_direct_render (panscan), vo_doublebuffering  (dr),  vo_driver  (vo),
       vo_panscan (double).

PROFILES
       To  ease  working with different configurations profiles can be defined in the configuration files.  A profile starts with its name between
       square brackets, e.g. '[my-profile]'.  All following options will be part of the profile.  A description (shown by -profile  help)  can  be
       defined  with the profile-desc option.  To end the profile, start another one or use the profile name 'default' to continue with normal op‐
       tions.

       EXAMPLE MPLAYER PROFILE:

       [protocol.dvd]
       profile-desc="profile for dvd:// streams"
       vf=pp=hb/vb/dr/al/fd
       alang=en

       [protocol.dvdnav]
       profile-desc="profile for dvdnav:// streams"
       profile=protocol.dvd
       mouse-movements=yes
       nocache=yes

       [extension.flv]
       profile-desc="profile for .flv files"
       flip=yes

       [vo.pnm]
       outdir=/tmp

       [ao.alsa]
       device=spdif

       EXAMPLE MENCODER PROFILE:

       [mpeg4]
       profile-desc="MPEG4 encoding"
       ovc=lacv=yes
       lavcopts=vcodec=mpeg4:vbitrate=1200

       [mpeg4-hq]
       profile-desc="HQ MPEG4 encoding"
       profile=mpeg4
       lavcopts=mbd=2:trell=yes:v4mv=yes

GENERAL OPTIONS
       -codecpath <dir>
              Specify a directory for binary codecs.

       -codecs-file <filename> (also see -afm, -ac, -vfm, -vc)
              Override the standard search path and use the specified file instead of the builtin codecs.conf.

       -include <configuration file> (also see -gui-include)
              Specify configuration file to be parsed after the default ones.

       -list-options
              Prints all available options.

       -msgcharset <charset>
              Convert console messages to the specified character set (default: autodetect).  Text will be in  the  encoding  specified  with  the
              --charset configure option.  Set this to "noconv" to disable conversion (for e.g. iconv problems).
              NOTE:  The  option  takes effect after command line parsing has finished.  The MPLAYER_CHARSET environment variable can help you get
              rid of the first lines of garbled output.

       -msgcolor
              Enable colorful console output on terminals that support ANSI color.

       -msglevel <all=<level>:<module>=<level>:...>
              Control verbosity directly for each module.  The 'all' module changes the verbosity of all the modules not explicitly  specified  on
              the command line.  See '-msglevel help' for a list of all modules.
              NOTE:  Some  messages  are  printed before the command line is parsed and are therefore not affected by -msglevel.  To control these
              messages you have to use the MPLAYER_VERBOSE environment variable, see its description below for details.
              Available levels:
                 -1   complete silence
                  0   fatal messages only
                  1   error messages
                  2   warning messages
                  3   short hints
                  4   informational messages
                  5   status messages (default)
                  6   verbose messages
                  7   debug level 2
                  8   debug level 3
                  9   debug level 4

       -msgmodule
              Prepend module name in front of each console message.

       -noconfig <options>
              Do not parse selected configuration files.
              NOTE: If -include or -use-filedir-conf options are specified at the command line, they will be honoured.

              Available options are:
                 all
                      all configuration files
                 gui (GUI only)
                      GUI configuration file
                 system
                      system configuration file
                 user
                      user configuration file

       -quiet
              Make console output less verbose; in particular, prevents the status line (i.e. A:   0.7 V:   0.6 A-V:  0.068 ...) from  being  dis‐
              played.  Particularly useful on slow terminals or broken ones which do not properly handle carriage return (i.e. \r).

       -priority <prio> (Windows and OS/2 only)
              Set  process  priority  for  MPlayer  according  to  the predefined priorities available under Windows and OS/2.  Possible values of
              <prio>:
                 idle|belownormal|normal|abovenormal|high|realtime

              WARNING: Using realtime priority can cause system lockup.

       -profile <profile1,profile2,...>
              Use the given profile(s), -profile help displays a list of the defined profiles.

       -really-quiet (also see -quiet)
              Display even less output and status messages than with -quiet.  Also suppresses the GUI error message boxes.

       -show-profile <profile>
              Show the description and content of a profile.

       -use-filedir-conf
              Look for a file-specific configuration file in the same directory as the file that is being played.
              WARNING: May be dangerous if playing from untrusted media.

       -v
              Increment verbosity level, one level for each -v found on the command line.

PLAYER OPTIONS (MPLAYER ONLY)
       -autoq <quality> (use with -vf [s]pp)
              Dynamically changes the level of postprocessing depending on the available spare CPU time.  The number you specify will be the maxi‐
              mum level used.  Usually you can use some big number.  You have to use -vf [s]pp without parameters in order for this to work.

       -autosync <factor>
              Gradually  adjusts  the A/V sync based on audio delay measurements.  Specifying -autosync 0, the default, will cause frame timing to
              be based entirely on audio delay measurements.  Specifying -autosync 1 will do the same, but will subtly change the  A/V  correction
              algorithm.   An  uneven  video framerate in a movie which plays fine with -nosound can often be helped by setting this to an integer
              value greater than 1.  The higher the value, the closer the timing will be to -nosound.  Try -autosync 30  to  smooth  out  problems
              with sound drivers which do not implement a perfect audio delay measurement.  With this value, if large A/V sync offsets occur, they
              will only take about 1 or 2 seconds to settle out.  This delay in reaction time to sudden A/V offsets should be the only side-effect
              of turning this option on, for all sound drivers.

       -benchmark
              Prints  some  statistics  on CPU usage and dropped frames at the end of playback.  Use in combination with -nosound and -vo null for
              benchmarking only the video codec.
              NOTE: With this option MPlayer will also ignore frame duration when playing only video (you can think of that as infinite fps).

       -colorkey <number>
              Changes the colorkey to an RGB value of your choice.  0x000000 is black and 0xffffff is white.  Only supported by the cvidix, fbdev,
              svga, vesa, winvidix, xmga, xvidix, xover, xv (see -vo xv:ck), xvmc (see -vo xv:ck) and directx video output drivers.

       -nocolorkey
              Disables colorkeying.  Only supported by the cvidix, fbdev, svga, vesa, winvidix, xmga, xvidix, xover, xv (see -vo xv:ck), xvmc (see
              -vo xv:ck) and directx video output drivers.

       -correct-pts (EXPERIMENTAL)
              Switches MPlayer to an experimental mode where timestamps for video frames are calculated differently and video  filters  which  add
              new  frames or modify timestamps of existing ones are supported.  The more accurate timestamps can be visible for example when play‐
              ing subtitles timed to scene changes with the -ass option.  Without -correct-pts the subtitle timing will typically be off  by  some
              frames.  This option does not work correctly with some demuxers and codecs.

       -crash-debug (DEBUG CODE)
              Automatically attaches gdb upon crash or SIGTRAP.  Support must be compiled in by configuring with --enable-crash-debug.

       -doubleclick-time
              Time  in  milliseconds to recognize two consecutive button presses as a double-click (default: 300).  Set to 0 to let your windowing
              system decide what a double-click is (-vo directx only).
              NOTE: You will get slightly different behaviour depending on whether you bind MOUSE_BTN0_DBL or MOUSE_BTN0-MOUSE_BTN0_DBL.

       -edlout <filename>
              Creates a new file and writes edit decision list (EDL) records to it.  During playback, the user hits 'i' to mark the start  or  end
              of  a skip block.  This provides a starting point from which the user can fine-tune EDL entries later.  See http://www.mplayerhq.hu/
              DOCS/HTML/en/edl.html for details.

       -edl-backward-delay <number>
              When using EDL during playback and jumping backwards it is possible to end up in the middle of an EDL record.  In that case  MPlayer
              will seek further backwards to the start position of the EDL record and then immediately skip the scene specified in the EDL record.
              To avoid this kind of behavior, MPlayer jumps to a fixed time interval before the start of the EDL record.   This  parameter  allows
              you to specify that time interval in seconds (default: 2 seconds).

       -edl-start-pts
              Adjust positions in EDL records according to playing file's start time.  Some formats, especially MPEG TS usually start with non-ze‐
              ro PTS values and when producing EDL file with -edlout option, EDL records contain absolute values that are correct  only  for  this
              particular  file.  If re-encoded into a different format, this EDL file no longer applies.  Specifying -edl-start-pts will automati‐
              cally adjust EDL positions according to start time: when producing EDL file, it will substract start time  from  every  EDL  record,
              when playing with EDL file, it will add file's start time to every EDL position.

       -noedl-start-pts
              Disable adjusting EDL positions.

       -enqueue (GUI only)
              Enqueue files given on the command line in the playlist instead of playing them immediately.

       -fixed-vo
              Enforces  a  fixed video system for multiple files (one (un)initialization for all files).  Therefore only one window will be opened
              for all files.  Currently the following drivers are fixed-vo compliant: gl, gl_tiled, mga, svga, x11, xmga, xv, xvidix and dfbmga.

       -framedrop (also see -hardframedrop, experimental without -nocorrect-pts)
              Skip displaying some frames to maintain A/V sync on slow systems.  Video filters are not applied to such frames.  For B-frames  even
              decoding is skipped completely.

       -(no)gui
              Enable  or  disable the GUI interface (default depends on binary name).  Only works as the first argument on the command line.  Does
              not work as a config-file option.

       -gui-include <GUI configuration file> (also see -include) (GUI only)
              Specify a GUI configuration file to be parsed after the default gui.conf.

       -h, -help, --help
              Show short summary of options.

       -hardframedrop (experimental without -nocorrect-pts)
              More intense frame dropping (breaks decoding).  Leads to image distortion!  Note that especially the libmpeg2 decoder may crash with
              this, so consider using "-vc ffmpeg12,".

       -heartbeat-cmd
              Command that is executed every 30 seconds during playback via system() - i.e. using the shell.

              NOTE:  MPlayer uses this command without any checking, it is your responsibility to ensure it does not cause security problems (e.g.
              make sure to use full paths if "." is in your path like on Windows).  It also only works when playing video (i.e. not with  -novideo
              but works with -vo null).

              This can be "misused" to disable screensavers that do not support the proper X API (also see -stop-xscreensaver).  If you think this
              is too complicated, ask the author of the screensaver program to support the proper X APIs.

              EXAMPLE for xscreensaver: mplayer -heartbeat-cmd "xscreensaver-command -deactivate" file

              EXAMPLE for GNOME screensaver: mplayer -heartbeat-cmd "gnome-screensaver-command -p" file

       -heartbeat-interval
              Specify how often the -heartbeat-cmd should be executed, in seconds between executions (default: 30.0).

       -identify
              Shorthand for -msglevel identify=4.  Show file parameters in an easily parseable format.   Also  prints  more  detailed  information
              about  subtitle  and  audio track languages and IDs.  In some cases you can get more information by using -msglevel identify=6.  For
              example, for a DVD or Blu-ray it will list the chapters and time length of each title, as well as a  disk  ID.   Combine  this  with
              -frames  0  to suppress all video output.  The wrapper script TOOLS/midentify.sh suppresses the other MPlayer output and (hopefully)
              shellescapes the filenames.

       -idle (also see -slave)
              Makes MPlayer wait idly instead of quitting when there is no file to play.  Mostly useful in slave mode where MPlayer  can  be  con‐
              trolled through input commands.
              For gmplayer -idle is the default, -noidle will quit the GUI after all files have been played.

       -input <commands>
              This option can be used to configure certain parts of the input system.  Paths are relative to ~/.mplayer/.
              NOTE: Autorepeat is currently only supported by joysticks.

              Available commands are:

                 conf=<filename>
                      Specify  input configuration file other than the default ~/.mplayer/input.conf.  ~/.mplayer/<filename> is assumed if no full
                      path is given.
                 ar-dev=<device>
                      Device to be used for Apple IR Remote (default is autodetected, Linux only).
                 ar-delay
                      Delay in milliseconds before we start to autorepeat a key (0 to disable).
                 ar-rate
                      Number of key presses to generate per second on autorepeat.
                 (no)default-bindings
                      Use the key bindings that MPlayer ships with by default.
                 keylist
                      Prints all keys that can be bound to commands.
                 cmdlist
                      Prints all commands that can be bound to keys.
                 js-dev
                      Specifies the joystick device to use (default: /dev/input/js0).
                 file=<filename>
                      Read commands from the given file.  Mostly useful with a FIFO.
                      NOTE: When the given file is a FIFO MPlayer opens both ends so you can do several 'echo "seek 10" > mp_pipe'  and  the  pipe
                      will stay valid.

       -key-fifo-size <2-65000>
              Specify  the  size  of the FIFO that buffers key events (default: 7).  A FIFO of size n can buffer (n-1) events.  If it is too small
              some events may be lost.  If it is too big, MPlayer may seem to hang while it processes the buffered events.  To get the same behav‐
              ior  as  before  this  option was introduced, set it to 2 for Linux or 1024 for Windows.  For small value you should disable double-
              clicks by setting -doubleclick-time to 0 so they do not compete with regular events for buffer space.

       -lircconf <filename> (LIRC only)
              Specifies a configuration file for LIRC (default: ~/.lircrc).

       -list-properties
              Print a list of the available properties.

       -loop <number>
              Loops movie playback <number> times.  0 means forever.

       -menu (OSD menu only)
              Turn on OSD menu support.

       -menu-cfg <filename> (OSD menu only)
              Use an alternative menu.conf.

       -menu-chroot <path> (OSD menu only)
              Chroot the file selection menu to a specific location.

              EXAMPLE:
                 -menu-chroot /home
                      Will restrict the file selection menu to /home and downward (i.e. no access to  /  will  be  possible,  but  /home/user_name
                      will).

       -menu-keepdir (OSD menu only)
              File browser starts from the last known location instead of current directory.

       -menu-root <value> (OSD menu only)
              Specify the main menu.

       -menu-startup (OSD menu only)
              Display the main menu at MPlayer startup.

       -mouse-movements
              Permit  MPlayer  to receive pointer events reported by the video output driver.  Necessary to select the buttons in DVD menus.  Sup‐
              ported for X11-based VOs (x11, xv, xvmc, etc) and the gl, gl_tiled, direct3d and corevideo VOs.

       -noar  Turns off AppleIR remote support.

       -noconsolecontrols
              Prevent MPlayer from reading key events from standard input.  Useful when reading data from standard input.  This  is  automatically
              enabled  when  -  is found on the command line.  There are situations where you have to set it manually, e.g. if you open /dev/stdin
              (or the equivalent on your system), use stdin in a playlist or intend to read from stdin later on via the loadfile or loadlist slave
              commands.

       -nojoystick
              Turns off joystick support.

       -nolirc
              Turns off LIRC support.

       -nomouseinput
              Disable mouse button press/release input (mozplayerxp's context menu relies on this option).

       -rtc (RTC only)
              Turns  on usage of the Linux RTC (realtime clock - /dev/rtc) as timing mechanism.  This wakes up the process every 1/1024 seconds to
              check the current time.  Useless with modern Linux kernels configured for desktop use as they already wake up the process with simi‐
              lar accuracy when using normal timed sleep.

       -pausing <0-3> (MPlayer only)
              Specifies  the  default  pausing behaviour of commands, i.e. whether MPlayer will continue playback or stay paused after the command
              has finished.  See DOCS/tech/slave.txt for further details.
                 0    resume
                 1    pause (pausing)
                 2    keep the paused / playing status (pausing_keep)
                 3    toggle the paused / playing status (pausing_toggle)
                 4    pause without frame step (experimental) (pausing_keep_force)

       -playing-msg <string>
              Print out a string before starting playback.  The following expansions are supported:

                 ${NAME}
                      Expand to the value of the property NAME.

                 ?(NAME:TEXT)
                      Expand TEXT only if the property NAME is available.

                 ?(!NAME:TEXT)
                      Expand TEXT only if the property NAME is not available.

       -playlist <filename>
              Play files according to a playlist file (ASX, Winamp, SMIL, or one-file-per-line format).
              WARNING: The way MPlayer parses and uses playlist files is not safe against maliciously constructed files.  Such files  may  trigger
              harmful  actions.  This has been the case for all MPlayer versions, but unfortunately this fact was not well documented earlier, and
              some people have even misguidedly recommended use of -playlist with untrusted sources.  Do NOT use -playlist  with  random  internet
              sources or files you don't trust!
              NOTE: This option is considered an entry so options found after it will apply only to the elements of this playlist.
              FIXME: This needs to be clarified and documented thoroughly.

       -allow-dangerous-playlist-parsing
              This enables parsing any file as a playlist if e.g. a server advertises a file as playlist.  Only enable if you know all servers in‐
              volved are trustworthy.  MPlayer's playlist code is not designed to handle malicious playlist files.

       -rtc-device <device>
              Use the specified device for RTC timing.

       -shuffle
              Play files in random order.

       -skin <name> (GUI only)
              Loads a skin from the directory given as parameter below the default skin directories, ~/.mplayer/skins/ and /usr/local/share/mplay‐
              er/skins/.

              EXAMPLE:
                 -skin fittyfene
                      Tries ~/.mplayer/skins/fittyfene and afterwards /usr/local/share/mplayer/skins/fittyfene.

       -slave (also see -input)
              Switches  on  slave  mode, in which MPlayer works as a backend for other programs.  Instead of intercepting keyboard events, MPlayer
              will read commands separated by a newline (\n) from stdin.
              NOTE: See -input cmdlist for a list of slave commands and DOCS/tech/slave.txt for their description.  Also, this is not intended  to
              disable other inputs, e.g. via the video window, use some other method like -input nodefault-bindings:conf=/dev/null for that.

       -softsleep
              Time  frames by repeatedly checking the current time instead of asking the kernel to wake up MPlayer at the correct time.  Useful if
              your kernel timing is imprecise and you cannot use the RTC either.  Comes at the price of higher CPU consumption.

       -sstep <sec>
              Skip <sec> seconds after every frame.  The normal framerate of the movie is kept, so playback is accelerated.  Since MPlayer can on‐
              ly seek to the next keyframe this may be inexact.

       -udp-ip <ip>
              Sets the destination address for datagrams sent by the -udp-master.  Setting it to a broadcast address allows multiple slaves having
              the same broadcast address to sync to the master (default: 127.0.0.1).

       -udp-master
              Send a datagram to -udp-ip on -udp-port just before playing each frame.  The datagram indicates the master's position in the file.

       -udp-port <port>
              Sets the destination port for datagrams sent by the -udp-master, and the port a -udp-slave listens on (default: 23867).

       -udp-seek-threshold <sec>
              When the master seeks, the slave has to decide whether to seek as well, or to catch up by decoding frames  without  pausing  between
              frames.   If  the master is more than <sec> seconds away from the slave, the slave seeks.  Otherwise, it "runs" to catch up or waits
              for the master.  This should almost always be left at its default setting of 1 second.

       -udp-slave
              Listen on -udp-port and match the master's position.

DEMUXER/STREAM OPTIONS
       -a52drc <level>
              Select the Dynamic Range Compression level for AC-3 audio streams.  <level> is a float value ranging from 0 to 1, where 0  means  no
              compression and 1 (which is the default) means full compression (make loud passages more silent and vice versa).  Values up to 2 are
              also accepted, but are purely experimental.  This option only shows an effect if the AC-3 stream contains the  required  range  com‐
              pression information.

       -aid <ID> (also see -alang)
              Select  audio  channel (MPEG: 0-31, AVI/OGM: 1-99, ASF/RM: 0-127, VOB(AC-3): 128-159, VOB(LPCM): 160-191, MPEG-TS 17-8190).  MPlayer
              prints the available audio IDs when run in verbose (-v) mode.  When playing an MPEG-TS stream, MPlayer/MEncoder will use  the  first
              program (if present) with the chosen audio stream.

       -ausid <ID> (also see -alang)
              Select  audio substream channel.  Currently the valid range is 0x55..0x75 and applies only to MPEG-TS when handled by the native de‐
              muxer (not by libavformat).  The format type may not be correctly identified because of how this information (or  lack  thereof)  is
              embedded  in  the  stream,  but  it will demux correctly the audio streams when multiple substreams are present.  MPlayer prints the
              available substream IDs when run with -identify.

       -alang <language code[,language code,...]> (also see -aid)
              Specify a priority list of audio languages to use.  Different container formats employ different language codes.  DVDs use ISO 639-1
              two  letter language codes, Matroska, MPEG-TS and NUT use ISO 639-2 three letter language codes while OGM uses a free-form identifi‐
              er.  MPlayer prints the available languages when run in verbose (-v) mode.

              EXAMPLE:
                 mplayer dvd://1 -alang hu,en
                      Chooses the Hungarian language track on a DVD and falls back on English if Hungarian is not available.
                 mplayer -alang jpn example.mkv
                      Plays a Matroska file in Japanese.

       -audio-demuxer <[+]name> (-audiofile only)
              Force audio demuxer type for -audiofile.  Use a '+' before the name to force it, this will skip some checks!  Give the demuxer  name
              as  printed  by  -audio-demuxer help.  For backward compatibility it also accepts the demuxer ID as defined in libmpdemux/demuxer.h.
              -audio-demuxer audio or -audio-demuxer 17 forces MP3.

       -audiofile <filename>
              Play audio from an external file (WAV, MP3 or Ogg Vorbis) while viewing a movie.

       -audiofile-cache <kBytes>
              Enables caching for the stream used by -audiofile, using the specified amount of memory.

       -reuse-socket (udp:// only)
              Allows a socket to be reused by other processes as soon as it is closed.

       -bandwidth <Bytes> (network only)
              Specify the maximum bandwidth for network streaming (for servers that are able to send content in different  bitrates).   Useful  if
              you want to watch live streamed media behind a slow connection.  With Real RTSP streaming, it is also used to set the maximum deliv‐
              ery bandwidth allowing faster cache filling and stream dumping.

       -bluray-angle <angle ID> (Blu-ray only)
              Some Blu-ray discs contain scenes that can be viewed from multiple angles.  Here you can tell MPlayer which angles to use  (default:
              1).

       -bluray-device <path to disc> (Blu-ray only)
              Specify the Blu-ray disc location. Must be a directory with Blu-ray structure.

       -cache <kBytes>
              This option specifies how much memory (in kBytes) to use when precaching a file or URL.  Especially useful on slow media.

       -nocache
              Turns off caching.

       -cache-min <percentage>
              Playback will start when the cache has been filled up to <percentage> of the total.

       -cache-seek-min <percentage>
              If  a  seek  is  to be made to a position within <percentage> of the cache size from the current position, MPlayer will wait for the
              cache to be filled to this position rather than performing a stream seek (default: 50).

       -capture (MPlayer only)
              Allows capturing the primary stream (not additional audio tracks or other kind of streams) into the file specified by  -dumpfile  or
              by  default.   If this option is given, capturing can be started and stopped by pressing the key bound to this function (see section
              INTERACTIVE CONTROL).  Same as for -dumpstream, this will likely not produce usable results for anything  else  than  MPEG  streams.
              Note that, due to cache latencies, captured data may begin and end somewhat delayed compared to what you see displayed.

       -cdda <option1:option2> (CDDA only)
              This option can be used to tune the CD Audio reading feature of MPlayer.

              Available options are:

                 speed=<value>
                      Set CD spin speed.

                 paranoia=<0-2>
                      Set paranoia level.  Values other than 0 seem to break playback of anything but the first track.
                         0: disable checking (default)
                         1: overlap checking only
                         2: full data correction and verification

                 generic-dev=<value>
                      Use specified generic SCSI device.

                 sector-size=<value>
                      Set atomic read size.

                 overlap=<value>
                      Force minimum overlap search during verification to <value> sectors.

                 toc-bias
                      Assume  that  the  beginning  offset of track 1 as reported in the TOC will be addressed as LBA 0.  Some Toshiba drives need
                      this for getting track boundaries correct.

                 toc-offset=<value>
                      Add <value> sectors to the values reported when addressing tracks.  May be negative.

                 (no)skip
                      (Never) accept imperfect data reconstruction.

       -cdrom-device <path to device>
              Specify the CD-ROM device (default: /dev/cdrom).

       -channels <number> (also see -af channels)
              Request the number of playback channels (default: 2).  MPlayer asks the decoder to decode the audio into as many channels as  speci‐
              fied.   Then it is up to the decoder to fulfill the requirement.  This is usually only important when playing videos with AC-3 audio
              (like DVDs).  In that case liba52 does the decoding by default and correctly downmixes the audio into the requested number of  chan‐
              nels.  To directly control the number of output channels independently of how many channels are decoded, use the channels filter.
              NOTE: This option is honored by codecs (AC-3 only), filters (surround) and audio output drivers (OSS at least).

              Available options are:

                 2    stereo
                 4    surround
                 6    full 5.1
                 8    full 7.1

       -chapter <chapter ID>[-<endchapter ID>]
              Specify which chapter to start playing at.  Optionally specify which chapter to end playing at (default: 1).

       -cookies (network only)
              Send cookies when making HTTP requests.

       -cookies-file <filename> (network only)
              Read  HTTP cookies from <filename> (default: ~/.mozilla/ and ~/.netscape/) and skip reading from default locations.  The file is as‐
              sumed to be in Netscape format.

       -delay <sec>
              audio delay in seconds (positive or negative float value)
              Negative values delay the audio, and positive values delay the video.  Note that this is the exact opposite of the -audio-delay MEn‐
              coder option.
              NOTE: When used with MEncoder, this is not guaranteed to work correctly with -ovc copy; use -audio-delay instead.

       -ignore-start
              Ignore  the  specified  starting  time for streams in AVI files.  In MPlayer, this nullifies stream delays in files encoded with the
              -audio-delay option.  During encoding, this option prevents MEncoder from transferring original stream start times to the new  file;
              the -audio-delay option is not affected.  Note that MEncoder sometimes adjusts stream starting times automatically to compensate for
              anticipated decoding delays, so do not use this option for encoding without testing it first.

       -demuxer <[+]name>
              Force demuxer type.  Use a '+' before the name to force it, this will skip some checks!  Give the demuxer name as printed by -demux‐
              er help.  For backward compatibility it also accepts the demuxer ID as defined in libmpdemux/demuxer.h.

       -dumpaudio (MPlayer only)
              Dumps  raw  compressed  audio  stream  to  ./stream.dump  (useful with MPEG/AC-3, in most other cases the resulting file will not be
              playable).  If you give more than one of -dumpaudio, -dumpvideo, -dumpstream on the command line only the last one will work.

       -dumpfile <filename> (MPlayer only)
              Specify which file MPlayer should dump to.  Should be used together with -dumpaudio / -dumpvideo / -dumpstream / -capture.

       -dumpstream (MPlayer only)
              Dumps the raw stream to ./stream.dump.  Useful when ripping from DVD  or  network.   If  you  give  more  than  one  of  -dumpaudio,
              -dumpvideo, -dumpstream on the command line only the last one will work.

       -dumpvideo (MPlayer only)
              Dump  raw  compressed  video stream to ./stream.dump (not very usable).  If you give more than one of -dumpaudio, -dumpvideo, -dump‐
              stream on the command line only the last one will work.

       -dvbin <options> (DVB only)
              Pass the following parameters to the DVB input module, in order to override the default ones:

                 card=<1-4>
                      Specifies using card number 1-4 (default: 1).
                 file=<filename>
                      Instructs MPlayer to read the channels list from <filename>.  Default is ~/.mplayer/channels.conf.{sat,ter,cbl,atsc}  (based
                      on your card type) or ~/.mplayer/channels.conf as a last resort.
                 timeout=<1-240>
                      Maximum number of seconds to wait when trying to tune a frequency before giving up (default: 30).

       -dvd-device <path to device> (DVD only)
              Specify the DVD device or .iso filename (default: /dev/dvd).  You can also specify a directory that contains files previously copied
              directly from a DVD (with e.g. vobcopy).

       -dvd-speed <factor or speed in KB/s> (DVD only)
              Try to limit DVD speed (default: 0, no change).  DVD base speed is about 1350KB/s, so a 8x drive can read at speeds up to 10800KB/s.
              Slower  speeds  make  the drive more quiet, for watching DVDs 2700KB/s should be quiet and fast enough.  MPlayer resets the speed to
              the drive default value on close.  Values less than 100 mean multiples of 1350KB/s, i.e. -dvd-speed 8 selects 10800KB/s.
              NOTE: You need write access to the DVD device to change the speed.

       -dvdangle <angle ID> (DVD only)
              Some DVD discs contain scenes that can be viewed from multiple angles.  Here you can tell MPlayer which angles to use (default: 1).

       -edl <filename>
              Enables edit decision list (EDL) actions during playback.  Video will be skipped over and audio will be muted and unmuted  according
              to the entries in the given file.  See http://www.mplayerhq.hu/DOCS/HTML/en/edl.html for details on how to use this.

       -endpos <[[hh:]mm:]ss[.ms]|size[b|kb|mb]> (also see -ss and -sb)
              Stop at given time or byte position.
              NOTE: Byte position may not be accurate, as it can only stop at a frame boundary.  When used in conjunction with -ss option, -endpos
              time will shift forward by seconds specified with -ss if not a byte position.  In addition it may not work well or not at  all  when
              used with any of the -dump options.

              EXAMPLE:
                 -endpos 56
                      Stop at 56 seconds.
                 -endpos 01:10:00
                      Stop at 1 hour 10 minutes.
                 -ss 10 -endpos 56
                      Stop at 1 minute 6 seconds.
                 mplayer -endpos 100mb
                      Stop playback after reading 100MB of the input file.
                 mencoder -endpos 100mb
                      Encode only 100 MB.

       -forceidx
              Force  index rebuilding.  Useful for files with broken index (A/V desync, etc).  This will enable seeking in files where seeking was
              not possible.  You can fix the index permanently with MEncoder (see the documentation).
              NOTE: This option only works if the underlying media supports seeking (i.e. not with stdin, pipe, etc).

       -fps <float value>
              Override video framerate.  Useful if the original value is wrong or missing.

       -frames <number>
              Play/convert only first <number> frames, then quit.

       -hr-mp3-seek (MP3 only)
              Hi-res MP3 seeking.  Enabled when playing from an external MP3 file, as we need to seek to the very exact position to keep A/V sync.
              Can be slow especially when seeking backwards since it has to rewind to the beginning to find an exact frame position.

       -http-header-fields <field1,field2>
              Set custom HTTP fields when accessing HTTP stream.

              EXAMPLE:
                      mplayer -http-header-fields 'Field1: value1','Field2: value2' http://localhost:1234
                      Will generate HTTP request:
                         GET / HTTP/1.0
                         Host: localhost:1234
                         User-Agent: MPlayer
                         Icy-MetaData: 1
                         Field1: value1
                         Field2: value2
                         Connection: close

       -idx (also see -forceidx)
              Rebuilds index of files if no index was found, allowing seeking.  Useful with broken/incomplete downloads, or badly created files.
              NOTE: This option only works if the underlying media supports seeking (i.e. not with stdin, pipe, etc).

       -noidx Skip rebuilding index file.  MEncoder skips writing the index with this option.

       -ipv4-only-proxy (network only)
              Skip the proxy for IPv6 addresses.  It will still be used for IPv4 connections.

       -loadidx <index file>
              The  file from which to read the video index data saved by -saveidx.  This index will be used for seeking, overriding any index data
              contained in the AVI itself.  MPlayer will not prevent you from loading an index file generated from a different AVI,  but  this  is
              sure to cause unfavorable results.
              NOTE: This option is obsolete now that MPlayer has OpenDML support.

       -mc <seconds/frame>
              maximum A-V sync correction per frame (in seconds)
              -mc 0 should always be combined with -noskip for mencoder, otherwise it will almost certainly cause A-V desync.

       -mf <option1:option2:...>
              Used when decoding from multiple PNG or JPEG files.

              Available options are:

                 w=<value>
                      input file width (default: autodetect)
                 h=<value>
                      input file height (default: autodetect)
                 fps=<value>
                      output fps (default: 25)
                 type=<value>
                      input file type (available: jpeg, png, tga, sgi)

       -ni    Force  treating  files as non-interleaved.  In particular forces usage of non-interleaved AVI parser (fixes playback of some bad AVI
              files).  Can also help playing files that otherwise play audio and video alternating instead of at the same time.

       -nobps (AVI only)
              Do not use average byte/second value for A-V sync.  Helps with some AVI files with broken header.

       -noextbased
              Disables extension-based demuxer selection.  By default, when the file type (demuxer) cannot be detected reliably (the file  has  no
              header  or it is not reliable enough), the filename extension is used to select the demuxer.  Always falls back on content-based de‐
              muxer selection.

       -passwd <password> (also see -user) (network only)
              Specify password for HTTP authentication.

       -prefer-ipv4 (network only)
              Use IPv4 on network connections.  Falls back on IPv6 automatically.

       -prefer-ipv6 (IPv6 network only)
              Use IPv6 on network connections.  Falls back on IPv4 automatically.

       -psprobe <byte position>
              When playing an MPEG-PS or MPEG-PES streams, this option lets you specify how many bytes in the stream you want MPlayer to  scan  in
              order to identify the video codec used.  This option is needed to play EVO or VDR files containing H.264 streams.

       -pvr <option1:option2:...> (PVR only)
              This  option  tunes  various  encoding properties of the PVR capture module.  It has to be used with any hardware MPEG encoder based
              card supported by the V4L2 driver.  The Hauppauge WinTV PVR-150/250/350/500 and all IVTV based cards are known as PVR capture cards.
              Be  aware that only Linux 2.6.18 kernel and above is able to handle MPEG stream through V4L2 layer.  For hardware capture of an MPEG
              stream and watching it with MPlayer/MEncoder, use 'pvr://' as a movie URL.

              Available options are:

                 aspect=<0-3>
                      Specify input aspect ratio:
                         0: 1:1
                         1: 4:3 (default)
                         2: 16:9
                         3: 2.21:1

                 arate=<32000-48000>
                      Specify encoding audio rate (default: 48000 Hz, available: 32000, 44100 and 48000 Hz).

                 alayer=<1-3>
                      Specify MPEG audio layer encoding (default: 2).

                 abitrate=<32-448>
                      Specify audio encoding bitrate in kbps (default: 384).

                 amode=<value>
                      Specify audio encoding mode.  Available preset values are 'stereo', 'joint_stereo', 'dual' and 'mono' (default: stereo).

                 vbitrate=<value>
                      Specify average video bitrate encoding in Mbps (default: 6).

                 vmode=<value>
                      Specify video encoding mode:
                         vbr: Variable BitRate (default)
                         cbr: Constant BitRate

                 vpeak=<value>
                      Specify peak video bitrate encoding in Mbps (only useful for VBR encoding, default: 9.6).

                 fmt=<value>
                      Choose an MPEG format for encoding:
                         ps:    MPEG-2 Program Stream (default)
                         ts:    MPEG-2 Transport Stream
                         mpeg1: MPEG-1 System Stream
                         vcd:   Video CD compatible stream
                         svcd:  Super Video CD compatible stream
                         dvd:   DVD compatible stream

       -radio <option1:option2:...> (radio only)
              These options set various parameters of the radio capture module.  For listening to radio with MPlayer use 'radio://<frequency>' (if
              channels  option is not given) or 'radio://<channel_number>' (if channels option is given) as a movie URL.  You can see allowed fre‐
              quency range by running MPlayer with '-v'.  To start the grabbing subsystem, use 'radio://<frequency or channel>/capture'.   If  the
              capture  keyword  is not given you can listen to radio using the line-in cable only.  Using capture to listen is not recommended due
              to synchronization problems, which makes this process uncomfortable.

              Available options are:

                 device=<value>
                      Radio device to use (default: /dev/radio0 for Linux and /dev/tuner0 for *BSD).

                 driver=<value>
                      Radio driver to use (default: v4l2 if available, otherwise v4l).  Currently, v4l and v4l2 drivers are supported.

                 volume=<0..100>
                      sound volume for radio device (default 100)

                 freq_min=<value> (*BSD BT848 only)
                      minimum allowed frequency (default: 87.50)

                 freq_max=<value> (*BSD BT848 only)
                      maximum allowed frequency (default: 108.00)

                 channels=<frequency>-<name>,<frequency>-<name>,...
                      Set channel list.  Use _ for spaces in names (or play with quoting ;-).  The channel names will then be  written  using  OSD
                      and  the  slave commands radio_step_channel and radio_set_channel will be usable for a remote control (see LIRC).  If given,
                      number in movie URL will be treated as channel position in channel list.
                      EXAMPLE: radio://1, radio://104.4, radio_set_channel 1

                 adevice=<value> (radio capture only)
                      Name of device to capture sound from.  Without such a name capture will be disabled, even if the capture keyword appears  in
                      the  URL.   For  ALSA devices use it in the form hw=<card>.<device>.  If the device name contains a '=', the module will use
                      ALSA to capture, otherwise OSS.

                 arate=<value> (radio capture only)
                      Rate in samples per second (default: 44100).
                      NOTE: When using audio capture set also -rawaudio rate=<value> option with the same value as arate.  If  you  have  problems
                      with sound speed (runs too quickly), try to play with different rate values (e.g. 48000,44100,32000,...).

                 achannels=<value> (radio capture only)
                      Number of audio channels to capture.

       -rawaudio <option1:option2:...>
              This  option lets you play raw audio files.  You have to use -demuxer rawaudio as well.  It may also be used to play audio CDs which
              are not 44kHz 16-bit stereo.  For playing raw AC-3 streams use -rawaudio format=0x2000 -demuxer rawaudio.

              Available options are:

                 channels=<value>
                      number of channels
                 rate=<value>
                      rate in samples per second
                 samplesize=<value>
                      sample size in bytes
                 bitrate=<value>
                      bitrate for rawaudio files
                 format=<value>
                      fourcc in hex

       -rawvideo <option1:option2:...>
              This option lets you play raw video files.  You have to use -demuxer rawvideo as well.

              Available options are:

                 fps=<value>
                      rate in frames per second (default: 25.0)
                 sqcif|qcif|cif|4cif|pal|ntsc
                      set standard image size
                 w=<value>
                      image width in pixels
                 h=<value>
                      image height in pixels
                 i420|yv12|yuy2|y8
                      set colorspace
                 format=<value>
                      colorspace (fourcc) in hex or string constant.  Use -rawvideo format=help for a list of possible strings.
                 size=<value>
                      frame size in Bytes

              EXAMPLE:
                 mplayer foreman.qcif -demuxer rawvideo -rawvideo qcif
                      Play the famous "foreman" sample video.
                 mplayer sample-720x576.yuv -demuxer rawvideo -rawvideo w=720:h=576
                      Play a raw YUV sample.

       -referrer <string> (network only)
              Specify a referrer path or URL for HTTP requests.

       -rtsp-port
              Used with 'rtsp://' URLs to force the client's port number.  This option may be useful if you are behind a router and want  to  for‐
              ward the RTSP stream from the server to a specific client.

       -rtsp-destination
              Used  with 'rtsp://' URLs to force the destination IP address to be bound.  This option may be useful with some RTSP server which do
              not send RTP packets to the right interface.  If the connection to the RTSP server fails, use -v to see  which  IP  address  MPlayer
              tries to bind to and try to force it to one assigned to your computer instead.

       -rtsp-stream-over-tcp (LIVE555 and NEMESI only)
              Used  with  'rtsp://' URLs to specify that the resulting incoming RTP and RTCP packets be streamed over TCP (using the same TCP con‐
              nection as RTSP).  This option may be useful if you have a broken internet connection that does not pass incoming UDP  packets  (see
              http://www.live555.com/mplayer/).

       -rtsp-stream-over-http (LIVE555 only)
              Used with 'http://' URLs to specify that the resulting incoming RTP and RTCP packets be streamed over HTTP.

       -saveidx <filename>
              Force index rebuilding and dump the index to <filename>.  Currently this only works with AVI files.
              NOTE: This option is obsolete now that MPlayer has OpenDML support.

       -sb <byte position> (also see -ss)
              Seek to byte position.  Useful for playback from CD-ROM images or VOB files with junk at the beginning.

       -speed <0.01-100>
              Slow  down  or  speed  up  playback  by  the  factor  given as parameter.  Not guaranteed to work correctly with -oac copy.  Add -af
              scaletempo to get past the 4x limit on playback.

       -srate <Hz>
              Select the output sample rate to be used (of course sound cards have limits on this).  If the sample frequency selected is different
              from that of the current media, the resample or lavcresample audio filter will be inserted into the audio filter layer to compensate
              for the difference.  The type of resampling can be controlled by the -af-adv option.  The default is fast resampling that may  cause
              distortion.

       -ss <time> (also see -sb)
              Seek to given time position.  Use -ss nopts to disable seeking, -ss 0 has different behaviour.

              EXAMPLE:
                 -ss 56
                      Seeks to 56 seconds.
                 -ss 01:10:00
                      Seeks to 1 hour 10 min.

       -tskeepbroken
              Tells MPlayer not to discard TS packets reported as broken in the stream.  Sometimes needed to play corrupted MPEG-TS files.

       -tsprobe <byte position>
              When playing an MPEG-TS stream, this option lets you specify how many bytes in the stream you want MPlayer to search for the desired
              audio and video IDs.

       -tsprog <1-65534>
              When playing an MPEG-TS stream, you can specify with this option which program (if present) you want to play.  Can be used with -vid
              and -aid.

       -tv <option1:option2:...> (TV/PVR only)
              This option tunes various properties of the TV capture module.  For watching TV with MPlayer, use 'tv://' or 'tv://<channel_number>'
              or even 'tv://<channel_name> (see option channels for channel_name below) as a movie URL.  You can also  use  'tv:///<input_id>'  to
              start watching a movie from a composite or S-Video input (see option input for details).

              Available options are:

                 noaudio
                      no sound

                 automute=<0-255> (v4l and v4l2 only)
                      If  signal  strength  reported by device is less than this value, audio and video will be muted.  In most cases automute=100
                      will be enough.  Default is 0 (automute disabled).

                 driver=<value>
                      See -tv driver=help for a list of compiled-in TV input drivers.  available: dummy, v4l, v4l2, bsdbt848 (default: autodetect)

                 device=<value>
                      Specify TV device (default: /dev/video0).  NOTE: For the bsdbt848 driver you can provide both bktr and  tuner  device  names
                      separating them with a comma, tuner after bktr (e.g. -tv device=/dev/bktr1,/dev/tuner1).

                 input=<value>
                      Specify input (default: 0 (TV), see console output for available inputs).

                 freq=<value>
                      Specify the frequency to set the tuner to (e.g. 511.250).  Not compatible with the channels parameter.

                 outfmt=<value>
                      Specify  the  output  format of the tuner with a preset value supported by the V4L driver (yv12, rgb32, rgb24, rgb16, rgb15,
                      uyvy, yuy2, i420) or an arbitrary format given as hex value.  Try outfmt=help for a list of all available formats.

                 width=<value>
                      output window width

                 height=<value>
                      output window height

                 fps=<value>
                      framerate at which to capture video (frames per second)

                 buffersize=<value>
                      maximum size of the capture buffer in megabytes (default: dynamical)

                 norm=<value>
                      For bsdbt848 and v4l, PAL, SECAM, NTSC are available.  For v4l2, see the console output for a list of all  available  norms,
                      also see the normid option below.

                 normid=<value> (v4l2 only)
                      Sets  the  TV  norm to the given numeric ID.  The TV norm depends on the capture card.  See the console output for a list of
                      available TV norms.

                 channel=<value>
                      Set tuner to <value> channel.

                 chanlist=<value>
                      available: argentina, australia, china-bcast, europe-east, europe-west, france, ireland,  italy,  japan-bcast,  japan-cable,
                      newzealand, russia, southafrica, us-bcast, us-cable, us-cable-hrc

                 channels=<chan>-<name>[=<norm>],<chan>-<name>[=<norm>],...
                      Set  names  for  channels.  NOTE: If <chan> is an integer greater than 1000, it will be treated as frequency (in kHz) rather
                      than channel name from frequency table.
                      Use _ for spaces in names (or play with quoting ;-).  The channel names will then be written using OSD, and the  slave  com‐
                      mands  tv_step_channel,  tv_set_channel  and tv_last_channel will be usable for a remote control (see LIRC).  Not compatible
                      with the frequency parameter.
                      NOTE: The channel number will then be the position in the 'channels' list, beginning with 1.
                      EXAMPLE: tv://1, tv://TV1, tv_set_channel 1, tv_set_channel TV1

                 [brightness|contrast|hue|saturation]=<-100-100>
                      Set the image equalizer on the card.

                 audiorate=<value>
                      Set input audio sample rate.

                 forceaudio
                      Capture audio even if there are no audio sources reported by v4l.

                 alsa
                      Capture from ALSA.

                 amode=<0-3>
                      Choose an audio mode:
                         0: mono
                         1: stereo
                         2: language 1
                         3: language 2

                 forcechan=<1-2>
                      By default, the count of recorded audio channels is determined automatically by querying the audio mode from  the  TV  card.
                      This option allows forcing stereo/mono recording regardless of the amode option and the values returned by v4l.  This can be
                      used for troubleshooting when the TV card is unable to report the current audio mode.

                 adevice=<value>
                      Set an audio device.  <value> should be /dev/xxx for OSS and a hardware ID for ALSA.  You must replace any ':' by a  '.'  in
                      the hardware ID for ALSA.

                 audioid=<value>
                      Choose an audio output of the capture card, if it has more than one.

                 [volume|bass|treble|balance]=<0-65535> (v4l1)

                 [volume|bass|treble|balance]=<0-100> (v4l2)
                      These  options  set parameters of the mixer on the video capture card.  They will have no effect, if your card does not have
                      one.  For v4l2 50 maps to the default value of the control, as reported by the driver.

                 gain=<0-100> (v4l2)
                      Set gain control for video devices (usually webcams) to the desired value and switch off automatic control.  A  value  of  0
                      enables automatic control.  If this option is omitted, gain control will not be modified.

                 immediatemode=<bool>
                      A  value  of 0 means capture and buffer audio and video together (default for MEncoder).  A value of 1 (default for MPlayer)
                      means to do video capture only and let the audio go through a loopback cable from the TV card to the sound card.

                 mjpeg
                      Use hardware MJPEG compression (if the card supports it).  When using this option, you do not need to specify the width  and
                      height of the output window, because MPlayer will determine it automatically from the decimation value (see below).

                 decimation=<1|2|4>
                      choose the size of the picture that will be compressed by hardware MJPEG compression:
                         1: full size
                             704x576    PAL
                             704x480    NTSC
                         2: medium size
                             352x288    PAL
                             352x240    NTSC
                         4: small size
                             176x144    PAL
                             176x120    NTSC

                 quality=<0-100>
                      Choose the quality of the JPEG compression (< 60 recommended for full size).

                 tdevice=<value>
                      Specify TV teletext device (example: /dev/vbi0) (default: none).

                 tformat=<format>
                      Specify TV teletext display format (default: 0):
                         0: opaque
                         1: transparent
                         2: opaque with inverted colors
                         3: transparent with inverted colors

                 tpage=<100-899>
                      Specify initial TV teletext page number (default: 100).

                 tlang=<-1-127>
                      Specify  default  teletext  language code (default: 0), which will be used as primary language until a type 28 packet is re‐
                      ceived.  Useful when the teletext system uses a non-latin character set, but language codes are not transmitted via teletext
                      type 28 packets for some reason.  To see a list of supported language codes set this option to -1.

                 hidden_video_renderer (dshow only)
                      Terminate  stream  with  video  renderer instead of Null renderer (default: off).  Will help if video freezes but audio does
                      not.  NOTE: May not work with -vo directx and -vf crop combination.

                 hidden_vp_renderer (dshow only)
                      Terminate VideoPort pin stream with video renderer instead of removing it from the graph (default:  off).   Useful  if  your
                      card has a VideoPort pin and video is choppy.  NOTE: May not work with -vo directx and -vf crop combination.

                 system_clock (dshow only)
                      Use  the  system  clock as sync source instead of the default graph clock (usually the clock from one of the live sources in
                      graph).

                 normalize_audio_chunks (dshow only)
                      Create audio chunks with a time length equal to video frame time length (default:  off).   Some  audio  cards  create  audio
                      chunks about 0.5s in size, resulting in choppy video when using immediatemode=0.

       -tvscan <option1:option2:...> (TV and MPlayer only)
              Tune the TV channel scanner.  MPlayer will also print value for "-tv channels=" option, including existing and just found channels.

              Available suboptions are:

                 autostart
                      Begin channel scanning immediately after startup (default: disabled).

                 period=<0.1-2.0>
                      Specify  delay in seconds before switching to next channel (default: 0.5).  Lower values will cause faster scanning, but can
                      detect inactive TV channels as active.

                 threshold=<1-100>
                      Threshold value for the signal strength (in percent), as reported by the device (default: 50).   A  signal  strength  higher
                      than this value will indicate that the currently scanning channel is active.

       -user <username> (also see -passwd) (network only)
              Specify username for HTTP authentication.

       -user-agent <string>
              Use <string> as user agent for HTTP streaming.

       -vid <ID>
              Select video channel (MPG: 0-15, ASF: 0-255, MPEG-TS: 17-8190).  When playing an MPEG-TS stream, MPlayer/MEncoder will use the first
              program (if present) with the chosen video stream.

       -vivo <suboption> (DEBUG CODE)
              Force audio parameters for the VIVO demuxer (for debugging purposes).  FIXME: Document this.

OSD/SUBTITLE OPTIONS
       NOTE: Also see -vf expand.

       -ass (FreeType only)
              Turn on SSA/ASS subtitle rendering.  With this option, libass will be used for SSA/ASS external subtitles and Matroska tracks.   You
              may also want to use -embeddedfonts.
              NOTE: Unlike normal OSD, libass uses fontconfig by default. To disable it, use -nofontconfig.

       -ass-border-color <value>
              Sets the border (outline) color for text subtitles.  The color format is RRGGBBAA.

       -ass-bottom-margin <value>
              Adds a black band at the bottom of the frame.  The SSA/ASS renderer can place subtitles there (with -ass-use-margins).

       -ass-color <value>
              Sets the color for text subtitles.  The color format is RRGGBBAA.

       -ass-font-scale <value>
              Set the scale coefficient to be used for fonts in the SSA/ASS renderer.

       -ass-force-style <[Style.]Param=Value[,...]>
              Override some style or script info parameters.

              EXAMPLE:
                 -ass-force-style FontName=Arial,Default.Bold=1
                 -ass-force-style PlayResY=768

       -ass-hinting <type>
              Set hinting type.  <type> can be:
                 0    no hinting
                 1    FreeType autohinter, light mode
                 2    FreeType autohinter, normal mode
                 3    font native hinter
                 0-3 + 4
                      The same, but hinting will only be performed if the OSD is rendered at screen resolution and will therefore not be scaled.
                 The default value is 7 (use native hinter for unscaled OSD and no hinting otherwise).

       -ass-line-spacing <value>
              Set line spacing value for SSA/ASS renderer.

       -ass-styles <filename>
              Load  all  SSA/ASS  styles found in the specified file and use them for rendering text subtitles.  The syntax of the file is exactly
              like the [V4 Styles] / [V4+ Styles] section of SSA/ASS.

       -ass-top-margin <value>
              Adds a black band at the top of the frame.  The SSA/ASS renderer can place toptitles there (with -ass-use-margins).

       -ass-use-margins
              Enables placing toptitles and subtitles in black borders when they are available.

       -dumpjacosub (MPlayer only)
              Convert the given subtitle (specified with the -sub option) to the time-based JACOsub subtitle format.  Creates a dumpsub.js file in
              the current directory.

       -dumpmicrodvdsub (MPlayer only)
              Convert the given subtitle (specified with the -sub option) to the MicroDVD subtitle format.  Creates a dumpsub.sub file in the cur‐
              rent directory.

       -dumpmpsub (MPlayer only)
              Convert the given subtitle (specified with the -sub option) to MPlayer's subtitle format, MPsub.  Creates a dump.mpsub file  in  the
              current directory.

       -dumpsami (MPlayer only)
              Convert  the  given subtitle (specified with the -sub option) to the time-based SAMI subtitle format.  Creates a dumpsub.smi file in
              the current directory.

       -dumpsrtsub (MPlayer only)
              Convert the given subtitle (specified with the -sub option) to the time-based SubViewer (SRT)  subtitle  format.   Creates  a  dump‐
              sub.srt file in the current directory.
              NOTE:  Some  broken  hardware  players choke on SRT subtitle files with Unix line endings.  If you are unlucky enough to have such a
              box, pass your subtitle files through unix2dos or a similar program to replace Unix line endings with DOS/Windows line endings.

       -dumpsub (MPlayer only) (BETA CODE)
              Dumps the subtitle substream from VOB streams.  Also see the -dump*sub and -vobsubout* options.

       -embeddedfonts (FreeType only)
              Enables extraction of Matroska embedded fonts (default: disabled).  These fonts can be used for SSA/ASS subtitle rendering (-ass op‐
              tion).  Font files are created in the ~/.mplayer/fonts directory.
              NOTE: With FontConfig 2.4.2 or newer, embedded fonts are opened directly from memory, and this option is enabled by default.

       -ffactor <number>
              Resample the font alphamap.  Can be:
                 0    plain white fonts
                 0.75 very narrow black outline (default)
                 1    narrow black outline
                 10   bold black outline

       -flip-hebrew (FriBiDi only)
              Turns on flipping subtitles using FriBiDi.

       -noflip-hebrew-commas
              Change FriBiDi's assumptions about the placements of commas in subtitles.  Use this if commas in subtitles are shown at the start of
              a sentence instead of at the end.

       -font <path to font.desc file, path to font (FreeType), font pattern (Fontconfig)>
              Search for the OSD/subtitle fonts in an alternative directory (default for  normal  fonts:  ~/.mplayer/font/font.desc,  default  for
              FreeType fonts: ~/.mplayer/subfont.ttf, default for Fontconfig: "sans-serif").
              NOTE:  With FreeType, this option determines the path to the font file.  With Fontconfig, this option determines the Fontconfig font
              pattern.

              EXAMPLE:
                 -font ~/.mplayer/arial-14/font.desc
                 -font ~/.mplayer/arialuni.ttf
                 -font 'Bitstream Vera Sans'
                 -font 'Bitstream Vera Sans:style=Bold'

       -fontconfig (fontconfig only)
              Enables the usage of fontconfig managed fonts (default: autodetect).
              NOTE: By default fontconfig is used for libass-rendered subtitles and not used for OSD. With -fontconfig it is used for both  libass
              and OSD, with -nofontconfig it is not used at all, i.e. only then -font and -subfont will work with a given path to font.

       -forcedsubsonly
              Display only forced subtitles for the DVD subtitle stream selected by e.g. -slang.

       -fribidi-charset <charset name> (FriBiDi only)
              Specifies the character set that will be passed to FriBiDi when decoding non-UTF-8 subtitles (default: ISO8859-8).

       -ifo <VOBsub IFO file>
              Indicate the file that will be used to load palette and frame size for VOBsub subtitles.

       -noautosub
              Turns off automatic subtitle file loading.

       -osd-duration <time>
              Set the duration of the OSD messages in ms (default: 1000).

       -osd-fractions <0-2>
              Set how fractions of seconds of the current timestamp are printed on the OSD:
                 0    Do not display fractions (default).
                 1    Show the first two decimals.
                 2    Show approximated frame count within current second.  This frame count is not accurate but only an approximation.  For vari‐
                      able fps, the approximation is known to be far off the correct frame count.

       -osdlevel <0-3> (MPlayer only)
              Specifies which mode the OSD should start in.
                 0    subtitles only
                 1    volume + seek (default)
                 2    volume + seek + timer + percentage
                 3    volume + seek + timer + percentage + total time

       -overlapsub
              Allows the next subtitle to be displayed while the current one is still visible (default is to enable the support only for  specific
              formats).

       -progbar-align <0-100>
              Specify the vertical alignment of the progress bar (0: top, 100: bottom, default is 50, i.e. centered).

       -sid <ID> (also see -slang, -vobsubid)
              Display  the subtitle stream specified by <ID> (0-31).  MPlayer prints the available subtitle IDs when run in verbose (-v) mode.  If
              you cannot select one of the subtitles on a DVD, also try -vobsubid.

       -nosub Disables any otherwise auto-selected internal subtitles (as e.g. the Matroska/mkv demuxer supports).  Use -noautosub to disable  the
              loading of external subtitle files.

       -slang <language code[,language code,...]> (also see -sid)
              Specify  a  priority  list of subtitle languages to use.  Different container formats employ different language codes.  DVDs use ISO
              639-1 two letter language codes, Matroska uses ISO 639-2 three letter language codes while OGM uses a free-form identifier.  MPlayer
              prints the available languages when run in verbose (-v) mode.

              EXAMPLE:
                 mplayer dvd://1 -slang hu,en
                      Chooses the Hungarian subtitle track on a DVD and falls back on English if Hungarian is not available.
                 mplayer -slang jpn example.mkv
                      Plays a Matroska file with Japanese subtitles.

       -spuaa <mode>
              Antialiasing/scaling  mode  for  DVD/VOBsub.   A value of 16 may be added to <mode> in order to force scaling even when original and
              scaled frame size already match.  This can be employed to e.g. smooth subtitles with gaussian blur.  Available modes are:
                 0    none (fastest, very ugly)
                 1    approximate (broken?)
                 2    full (slow)
                 3    bilinear (default, fast and not too bad)
                 4    uses swscaler gaussian blur (looks very good)

       -spualign <-1-2>
              Specify how SPU (DVD/VOBsub) subtitles should be aligned.
                 -1   original position
                  0   Align at top (original behavior, default).
                  1   Align at center.
                  2   Align at bottom.

       -spugauss <0.0-3.0>
              Variance parameter of gaussian used by -spuaa 4.  Higher means more blur (default: 1.0).

       -sub <subtitlefile1,subtitlefile2,...>
              Use/display these subtitle files.  Only one file can be displayed at the same time.

       -sub-bg-alpha <0-255>
              Specify the alpha channel value for subtitles and OSD backgrounds.  Big values mean more transparency.  0 means completely transpar‐
              ent.

       -sub-bg-color <0-255>
              Specify the color value for subtitles and OSD backgrounds.  Currently subtitles are grayscale so this value is equivalent to the in‐
              tensity of the color.  255 means white and 0 black.

       -sub-demuxer <[+]name> (-subfile only) (BETA CODE)
              Force subtitle demuxer type for -subfile.  Use a '+' before the name to force it, this will skip some checks!  Give the demuxer name
              as printed by -sub-demuxer help.  For backward compatibility it also accepts the demuxer ID as defined in subreader.h.

       -sub-fuzziness <mode>
              Adjust matching fuzziness when searching for subtitles:
                 0    exact match (default)
                 1    Load all subs containing movie name.
                 2    Load all subs in the current and -sub-paths directories.

       -sub-no-text-pp
              Disables any kind of text post processing done after loading the subtitles.  Used for debug purposes.

       -subalign <0-2>
              Specify which edge of the subtitles should be aligned at the height given by -subpos.
                 0    Align subtitle top edge (original behavior).
                 1    Align subtitle center.
                 2    Align subtitle bottom edge (default).

       -subcc <1-8>
              Display DVD Closed Caption (CC) subtitles from the specified channel.  Values 5 to 8 select a mode that can extract EIA-608 compati‐
              bility streams from EIA-708 data.  These are not the VOB subtitles, these are special ASCII subtitles for the hearing  impaired  en‐
              coded in the VOB userdata stream on most region 1 DVDs.  CC subtitles have not been spotted on DVDs from other regions so far.

       -subcp <codepage> (iconv only)
              If  your  system  supports iconv(3), you can use this option to specify the subtitle codepage. It takes priority over both -utf8 and
              -unicode.

              EXAMPLE:
                 -subcp latin2
                 -subcp cp1250

       -subcp enca:<language>:<fallback codepage> (ENCA only)
              You can specify your language using a two letter language code to make ENCA detect the codepage  automatically.   If  unsure,  enter
              anything  and  watch mplayer -v output for available languages.  Fallback codepage specifies the codepage to use, when autodetection
              fails.

              EXAMPLE:
                 -subcp enca:cs:latin2
                      Guess the encoding, assuming the subtitles are Czech, fall back on latin 2, if the detection fails.
                 -subcp enca:pl:cp1250
                      Guess the encoding for Polish, fall back on cp1250.

       -sub-paths <path1,path2,...>
              Specify extra subtitle paths to track in the media directory.

              EXAMPLE: Assuming that /path/to/movie/movie.avi is played and -sub-paths sub,subtitles,/tmp/subs is specified, MPlayer searches  for
              subtitle files in these directories:
                 /path/to/movie/
                 /path/to/movie/sub/
                 /path/to/movie/subtitles/
                 /tmp/subs/
                 ~/.mplayer/sub/

       -subdelay <sec>
              Delays subtitles by <sec> seconds.  Can be negative.

       -subfile <filename> (BETA CODE)
              Currently useless.  Same as -audiofile, but for subtitle streams (OggDS?).

       -subfont <path to font (FreeType), font pattern (Fontconfig)> (FreeType only)
              Sets the subtitle font (see -font).  If no -subfont is given, -font is used.

       -subfont-autoscale <0-3> (FreeType only)
              Sets the autoscale mode.
              NOTE: 0 means that text scale and OSD scale are font heights in points.

              The mode can be:

                 0    no autoscale
                 1    proportional to movie height
                 2    proportional to movie width
                 3    proportional to movie diagonal (default)

       -subfont-blur <0-8> (FreeType only)
              Sets the font blur radius (default: 2).

       -subfont-encoding <value>
              Sets  the  font  encoding.   When set to 'unicode', all the glyphs from the font file will be rendered and unicode will be used (de‐
              fault: unicode). (Without FreeType, setting any other value than 'unicode' will  disable  unicode  glyphs  rendering  for  font.desc
              files. With FreeType and for other values than 'unicode' your system has to support iconv(3) in order for this to work.)

       -subfont-osd-scale <0-100> (FreeType only)
              Sets the autoscale coefficient of the OSD elements (default: 6).

       -subfont-outline <0-8> (FreeType only)
              Sets the font outline thickness (default: 2).

       -subfont-text-scale <0-100> (FreeType only)
              Sets the subtitle text autoscale coefficient as percentage of the screen size (default: 5).

       -subfps <rate>
              Specify the framerate of the subtitle file (default: movie fps).
              NOTE: <rate> > movie fps speeds the subtitles up for frame-based subtitle files and slows them down for time-based ones.

       -subpos <0-150> (useful with -vf expand)
              Specify  the  position  of  subtitles  on the screen.  The value is the vertical position of the subtitle in % of the screen height.
              Values larger than 100 allow part of the subtitle to be cut off.

       -subwidth <10-100>
              Specify the maximum width of subtitles on the screen.  Useful for TV-out.  The value is the width of the subtitle in % of the screen
              width.

       -noterm-osd
              Disable the display of OSD messages on the console when no video output is available.

       -term-osd-esc <escape sequence>
              Specify the escape sequence to use before writing an OSD message on the console.  The escape sequence should move the pointer to the
              beginning of the line used for the OSD and clear it (default: ^[[A\r^[[K).

       -unicode
              Tells MPlayer to handle the subtitle file as unicode. (It will only take effect if neither -subcp nor -utf8 is given.)

       -unrarexec <path to unrar executable> (not supported on MingW)
              Specify the path to the unrar executable so MPlayer can use it to access rar-compressed VOBsub files (default: not set, so the  fea‐
              ture is off).  The path must include the executable's filename, i.e. /usr/local/bin/unrar.

       -utf8
              Tells  MPlayer  to  handle  the  subtitle file as UTF-8. (It will only take effect if -subcp isn't given, and it takes priority over
              -unicode.)

       -vobsub <VOBsub file without extension>
              Specify a VOBsub file to use for subtitles.  Has to be the full pathname without extension,  i.e.  without  the  '.idx',  '.ifo'  or
              '.sub'.

       -vobsubid <0-31>
              Specify the VOBsub subtitle ID.

AUDIO OUTPUT OPTIONS (MPLAYER ONLY)
       -abs <value> (-ao oss only) (OBSOLETE)
              Override audio driver/card buffer size detection.

       -format <format> (also see the format audio filter)
              Select  the  sample  format  used  for output from the audio filter layer to the sound card.  The values that <format> can adopt are
              listed below in the description of the format audio filter.

       -mixer <device>
              Use a mixer device different from the default /dev/mixer.  For ALSA this is the mixer name.

       -mixer-channel <mixer line>[,mixer index] (-ao oss and -ao alsa only)
              This option will tell MPlayer to use a different channel for controlling volume than the default PCM.  Options for OSS include  vol,
              pcm,  line.  For a complete list of options look for SOUND_DEVICE_NAMES in /usr/include/linux/soundcard.h.  For ALSA you can use the
              names e.g. alsamixer displays, like Master, Line, PCM.
              NOTE: ALSA mixer channel names followed by a number must be specified in the <name,number> format, i.e. a channel labeled 'PCM 1' in
              alsamixer must be converted to PCM,1.

       -softvol
              Force the use of the software mixer, instead of using the sound card mixer.

       -softvol-max <10.0-10000.0>
              Set  the  maximum amplification level in percent (default: 110).  A value of 200 will allow you to adjust the volume up to a maximum
              of double the current level.  With values below 100 the initial volume (which is 100%) will be above the maximum, which e.g. the OSD
              cannot display correctly.

       -volstep <0-100>
              Set the step size of mixer volume changes in percent of the whole range (default: 3).

       -volume <-1-100> (also see -af volume)
              Set  the  startup  volume  in  the mixer, either hardware or software (if used with -softvol).  A value of -1 (the default) will not
              change the volume.

AUDIO OUTPUT DRIVERS (MPLAYER ONLY)
       Audio output drivers are interfaces to different audio output facilities.  The syntax is:

       -ao <driver1[:suboption1[=value]:...],driver2,...[,]>
              Specify a priority list of audio output drivers to be used.

       If the list has a trailing ',' MPlayer will fall back on drivers not contained in the list.  Suboptions are  optional  and  can  mostly  be
       omitted.
       NOTE: See -ao help for a list of compiled-in audio output drivers.

       EXAMPLE:
                 -ao alsa,oss,
                      Try the ALSA driver, then the OSS driver, then others.
                 -ao alsa:noblock:device=hw=0.3
                      Sets noblock-mode and the device-name as first card, fourth device.

       Available audio output drivers are:

       alsa
              ALSA 0.9/1.x audio output driver
                 noblock
                      Sets noblock-mode.
                 device=<device>
                      Sets  the device name.  Replace any ',' with '.' and any ':' with '=' in the ALSA device name.  For hwac3 output via S/PDIF,
                      use an "iec958" or "spdif" device, unless you really know how to set it correctly.

       oss
              OSS audio output driver
                 <dsp-device>
                      Sets the audio output device (default: /dev/dsp).
                 <mixer-device>
                      Sets the audio mixer device (default: /dev/mixer).
                 <mixer-channel>
                      Sets the audio mixer channel (default: pcm).

       sdl (SDL only)
              highly platform independent SDL (Simple Directmedia Layer) library audio output driver
                 <driver>
                      Explicitly choose the SDL audio driver to use (default: let SDL choose).

       arts
              audio output through the aRts daemon

       esd
              audio output through the ESD daemon
                 <server>
                      Explicitly choose the ESD server to use (default: localhost).

       jack
              audio output through JACK (Jack Audio Connection Kit)
                 (no)connect
                      Automatically create connections to output ports (default: enabled).  When enabled, the maximum number  of  output  channels
                      will be limited to the number of available output ports.
                 port=<name>
                      Connects to the ports with the given name (default: physical ports).
                 name=<client
                      Client  name  that is passed to JACK (default: MPlayer [<PID>]).  Useful if you want to have certain connections established
                      automatically.
                 (no)estimate
                      Estimate the audio delay, supposed to make the video playback smoother (default: enabled).
                 (no)autostart
                      Automatically start jackd if necessary (default: disabled).  Note that this seems unreliable and will spam stdout with serv‐
                      er messages.

       nas
              audio output through NAS

       coreaudio (Mac OS X only)
              native Mac OS X audio output driver
                 device_id=<id>
                      ID of output device to use (0 = default device)
                 help List all available output devices with their IDs.

       openal
              Experimental OpenAL audio output driver

       pulse
              PulseAudio audio output driver
                 [<host>[:<output sink>[:broken_pause]]]
                      Specify  the  host and optionally output sink to use.  An empty <host> string uses a local connection, "localhost" uses net‐
                      work transfer (most likely not what you want).  You can also explicitly force the workaround for broken pause  functionality
                      (default: autodetected).  To only enable that without specifying a host/sink the syntax is -ao pulse:::broken_pause

       sgi (SGI only)
              native SGI audio output driver
                 <output device name>
                      Explicitly  choose the output device/interface to use (default: system-wide default).  For example, 'Analog Out' or 'Digital
                      Out'.

       sun (Sun only)
              native Sun audio output driver
                 <device>
                      Explicitly choose the audio device to use (default: /dev/audio).

       win32 (Windows only)
              native Windows waveout audio output driver

       dsound (Windows only)
              DirectX DirectSound audio output driver
                 device=<devicenum>
                      Sets the device number to use.  Playing a file with -v will show a list of available devices.

       kai (OS/2 only)
              OS/2 KAI audio output driver
                 uniaud
                      Force UNIAUD mode.
                 dart Force DART mode.
                 (no)share
                      Open audio in shareable or exclusive mode.
                 bufsize=<size>
                      Set buffer size to <size> in samples (default: 2048).

       dart (OS/2 only)
              OS/2 DART audio output driver
                 (no)share
                      Open DART in shareable or exclusive mode.
                 bufsize=<size>
                      Set buffer size to <size> in samples (default: 2048).

       dxr2 (also see -dxr2) (DXR2 only)
              Creative DXR2 specific output driver

       ivtv (IVTV only)
              IVTV specific MPEG audio output driver.  Works with -ac hwmpa only.

       v4l2 (requires Linux 2.6.22+ kernel)
              Audio output driver for V4L2 cards with hardware MPEG decoder.

       mpegpes (DVB only)
              Audio output driver for DVB cards that writes the output to an MPEG-PES file if no DVB card is installed.
                 card=<1-4>
                      DVB card to use if more than one card is present.  If not specified MPlayer will search the first usable card.
                 file=<filename>
                      output filename

       null
              Produces no audio output but maintains video playback speed.  Use -nosound for benchmarking.

       pcm
              raw PCM/wave file writer audio output
                 (no)waveheader
                      Include or do not include the wave header (default: included).  When not included, raw PCM will be generated.
                 file=<filename>
                      Write the sound to <filename> instead of the default audiodump.wav.  If nowaveheader is specified,  the  default  is  audio‐
                      dump.pcm.
                 fast
                      Try to dump faster than realtime.  Make sure the output does not get truncated (usually with "Too many video packets in buf‐
                      fer" message).  It is normal that you get a "Your system is too SLOW to play this!" message.

       plugin
              plugin audio output driver

VIDEO OUTPUT OPTIONS (MPLAYER ONLY)
       -adapter <value>
              Set the graphics card that will receive the image.  You can get a list of available cards when you run this option  with  -v.   Cur‐
              rently only works with the directx video output driver.

       -bpp <depth>
              Override the autodetected color depth.  Only supported by the fbdev, dga, svga, vesa video output drivers.

       -border
              Play  movie  with  window border and decorations.  Since this is on by default, use -noborder to disable the standard window decora‐
              tions.

       -brightness <-100-100>
              Adjust the brightness of the video signal (default: 0).  Not supported by all video output drivers.

       -contrast <-100-100>
              Adjust the contrast of the video signal (default: 0).  Not supported by all video output drivers.

       -display <name> (X11 only)
              Specify the hostname and display number of the X server you want to display on.

              EXAMPLE:
                 -display xtest.localdomain:0

       -dr
              Turns on direct rendering (not supported by all codecs and video outputs).  This can result in significantly faster blitting on some
              systems,  on  most  the  difference will be minimal.  In some cases, particularly with decoders specifying their buffer requirements
              badly, it can be vastly slower.
              WARNING: May cause OSD/SUB corruption!

       -dxr2 <option1:option2:...>
              This option is used to control the dxr2 video output driver.

                 ar-mode=<value>
                      aspect ratio mode (0 = normal, 1 = pan-and-scan, 2 = letterbox (default))

                 iec958-encoded
                      Set iec958 output mode to encoded.

                 iec958-decoded
                      Set iec958 output mode to decoded (default).

                 macrovision=<value>
                      macrovision mode (0 = off (default), 1 = agc, 2 = agc 2 colorstripe, 3 = agc 4 colorstripe)

                 mute
                      mute sound output

                 unmute
                      unmute sound output

                 ucode=<value>
                      path to the microcode

              TV output

                 75ire
                      enable 7.5 IRE output mode

                 no75ire
                      disable 7.5 IRE output mode (default)

                 bw
                      b/w TV output

                 color
                      color TV output (default)

                 interlaced
                      interlaced TV output (default)

                 nointerlaced
                      disable interlaced TV output

                 norm=<value>
                      TV norm (ntsc (default), pal, pal60, palm, paln, palnc)

                 square-pixel
                      set pixel mode to square

                 ccir601-pixel
                      set pixel mode to ccir601

              overlay

                 cr-left=<0-500>
                      Set the left cropping value (default: 50).

                 cr-right=<0-500>
                      Set the right cropping value (default: 300).

                 cr-top=<0-500>
                      Set the top cropping value (default: 0).

                 cr-bottom=<0-500>
                      Set the bottom cropping value (default: 0).

                 ck-[r|g|b]=<0-255>
                      Set the r(ed), g(reen) or b(lue) gain of the overlay color-key.

                 ck-[r|g|b]min=<0-255>
                      minimum value for the respective color key

                 ck-[r|g|b]max=<0-255>
                      maximum value for the respective color key

                 ignore-cache
                      Ignore cached overlay settings.

                 update-cache
                      Update cached overlay settings.

                 ol-osd
                      Enable overlay onscreen display.

                 nool-osd
                      Disable overlay onscreen display (default).

                 ol[h|w|x|y]-cor=<-20-20>
                      Adjust the overlay size (h,w) and position (x,y) in case it does not match the window perfectly (default: 0).

                 overlay
                      Activate overlay (default).

                 nooverlay
                      Activate TV-out.

                 overlay-ratio=<1-2500>
                      Tune the overlay (default: 1000).

       -fbmode <modename> (-vo fbdev only)
              Change video mode to the one that is labeled as <modename> in /etc/fb.modes.
              NOTE: VESA framebuffer does not support mode changing.

       -fbmodeconfig <filename> (-vo fbdev only)
              Override framebuffer mode configuration file (default: /etc/fb.modes).

       -fs (also see -zoom)
              Fullscreen playback (centers movie, and paints black bands around it).  Not supported by all video output drivers.

       -fsmode-dontuse <0-31> (OBSOLETE, use the -fs option)
              Try this option if you still experience fullscreen problems.

       -fstype <type1,type2,...> (X11 only)
              Specify a priority list of fullscreen modes to be used.  You can negate the modes by prefixing them with  '-'.   If  you  experience
              problems like the fullscreen window being covered by other windows try using a different order.
              NOTE: See -fstype help for a full list of available modes.

              The available types are:

                 above
                      Use the _NETWM_STATE_ABOVE hint if available.
                 below
                      Use the _NETWM_STATE_BELOW hint if available.
                 fullscreen
                      Use the _NETWM_STATE_FULLSCREEN hint if available.
                 layer
                      Use the _WIN_LAYER hint with the default layer.
                 layer=<0...15>
                      Use the _WIN_LAYER hint with the given layer number.
                 netwm
                      Force NETWM style.
                 none
                      Clear the list of modes; you can add modes to enable afterward.
                 stays_on_top
                      Use _NETWM_STATE_STAYS_ON_TOP hint if available.

              EXAMPLE:
                 layer,stays_on_top,above,fullscreen
                      Default order, will be used as a fallback if incorrect or unsupported modes are specified.
                 -fullscreen
                      Fixes fullscreen switching on OpenBox 1.x.

       -fs-border-left <pixels>

       -fs-border-right <pixels>

       -fs-border-top <pixels>

       -fs-border-bottom <pixels>
              Specify  extra borders in full screen mode.  The borders apply to all displayed elements: video, OSD and EOSD.  The number of pixels
              is specified in terms of screen resolution.  Currently only supported with by the gl video output driver.

       -gamma <-100-100>
              Adjust the gamma of the video signal (default: 0).  Not supported by all video output drivers.

       -geometry x[%][:y[%]] or [WxH][+-x+-y]
              Adjust where the output is on the screen initially.  The x and y specifications are in pixels measured  from  the  top-left  of  the
              screen to the top-left of the image being displayed, however if a percentage sign is given after the argument it turns the value in‐
              to a percentage of the screen size in that direction.  It also supports the standard X11 -geometry  option  format,  in  which  e.g.
              +10-50 means "place 10 pixels from the left border and 50 pixels from the lower border" and "--20+-10" means "place 20 pixels beyond
              the right and 10 pixels beyond the top border".  If an external window is specified using the -wid option, then the x and y  coordi‐
              nates  are  relative  to the top-left corner of the window rather than the screen.  The coordinates are relative to the screen given
              with -screen for the video output drivers that fully support -screen (direct3d, gl, gl_tiled, vdpau, x11, xv, xvmc, corevideo).
              NOTE: This option is only supported by the x11, xmga, xv, xvmc, xvidix, gl, gl_tiled, direct3d, directx, fbdev, sdl, dfxfb and core‐
              video video output drivers.

              EXAMPLE:
                 50:40
                      Places the window at x=50, y=40.
                 50%:50%
                      Places the window in the middle of the screen.
                 100%
                      Places the window at the middle of the right edge of the screen.
                 100%:100%
                      Places the window at the bottom right corner of the screen.

       -gui-wid <window ID> (also see -wid) (GUI only)
              This  tells  the GUI to also use an X11 window and stick itself to the bottom of the video, which is useful to embed a mini-GUI in a
              browser (with the MPlayer plugin for instance).

       -hue <-100-100>
              Adjust the hue of the video signal (default: 0).  You can get a colored negative of the image with this option.   Not  supported  by
              all video output drivers.

       -monitor-dotclock <range[,range,...]> (-vo fbdev and vesa only)
              Specify the dotclock or pixelclock range of the monitor.

       -monitor-hfreq <range[,range,...]> (-vo fbdev and vesa only)
              Specify the horizontal frequency range of the monitor.

       -monitor-vfreq <range[,range,...]> (-vo fbdev and vesa only)
              Specify the vertical frequency range of the monitor.

       -monitoraspect <ratio> (also see -aspect)
              Set  the  aspect ratio of your monitor or TV screen.  A value of 0 disables a previous setting (e.g. in the config file).  Overrides
              the -monitorpixelaspect setting if enabled.

              EXAMPLE:
                 -monitoraspect 4:3  or 1.3333
                 -monitoraspect 16:9 or 1.7777

       -monitorpixelaspect <ratio> (also see -aspect)
              Set the aspect of a single pixel of your monitor or TV screen (default: 1).  A value of 1 means square pixels (correct for (almost?)
              all LCDs).

       -name (X11 only)
              Set the window class name.

       -nodouble
              Disables  double buffering, mostly for debugging purposes.  Double buffering fixes flicker by storing two frames in memory, and dis‐
              playing one while decoding another.  It can affect OSD negatively, but often removes OSD flickering.

       -nograbpointer
              Do not grab the mouse pointer after a video mode change (-vm).  Useful for multihead setups.

       -nokeepaspect
              Do not keep window aspect ratio when resizing windows.  Only works with the x11, xv, xmga, xvidix,  directx  video  output  drivers.
              Furthermore under X11 your window manager has to honor window aspect hints.

       -ontop
              Makes  the  player window stay on top of other windows.  Supported by video output drivers which use X11, except SDL, as well as di‐
              rectx, corevideo, quartz, ggi and gl_tiled.

       -panscan <0.0-1.0>
              Enables pan-and-scan functionality (cropping the sides of e.g. a 16:9 movie to make it fit a 4:3 display without black bands).   The
              range  controls  how  much of the image is cropped.  Only works with the directx, xv, xmga, mga, gl, gl_tiled, quartz, corevideo and
              xvidix video output drivers.
              NOTE: Values between -1 and 0 are allowed as well, but highly experimental and may crash or worse.  Use at your own risk!

       -panscanrange <-19.0-99.0> (experimental)
              Change the range of the pan-and-scan functionality (default: 1).  Positive values mean multiples of  the  default  range.   Negative
              numbers  mean  you can zoom in up to a factor of -panscanrange+1.  E.g. -panscanrange -3 allows a zoom factor of up to 4.  This fea‐
              ture is experimental.

       -border-pos-x <0.0-1.0> (-vo gl,xv,xvmc,vdpau,direct3d only, default 0.5)
              When black borders are added to adjust for aspect, this determines where they are placed.  0.0 places borders on the right,  1.0  on
              the  left.   Values  outside  the range 0.0 - 1.0 will add extra black borders on one side and remove part of the image on the other
              side.

       -border-pos-y <0.0-1.0> (-vo gl,xv,xvmc,vdpau,direct3d only, default 0.5)
              As -border-pos-x but for top/bottom borders.  0.0 places borders on the bottom, 1.0 on the top.

       -monitor-orientation <0-3> (experimental)
              Rotate display by 90, 180 or 270 degrees.  Rotates also the OSD, not just the video image itself.  Currently only supported  by  the
              gl video output driver.  For all other video outputs -vf ass,expand=osd=1,rotate=n can be used, in the future this might even happen
              automatically.

       -refreshrate <Hz>
              Set the monitor refreshrate in Hz.  Currently only supported by -vo directx combined with the -vm option.

       -rootwin
              Play movie in the root window (desktop background).  Desktop background images may cover the movie window, though.  Only works  with
              the x11, xv, xmga, xvidix, quartz, corevideo and directx video output drivers.

       -saturation <-100-100>
              Adjust  the saturation of the video signal (default: 0).  You can get grayscale output with this option.  Not supported by all video
              output drivers.

       -screenh <pixels>
              Specify the screen height for video output drivers which do not know the screen resolution like fbdev, x11 and TV-out.

       -screenw <pixels>
              Specify the screen width for video output drivers which do not know the screen resolution like fbdev, x11 and TV-out.

       -(no)stop-xscreensaver (X11 only)
              Turns off xscreensaver at startup and turns it on again on exit (default: enabled).  If your screensaver supports  neither  the  XSS
              nor XResetScreenSaver API please use -heartbeat-cmd instead.

       -title (also see -use-filename-title)
              Set the window title.  Supported by X11-based video output drivers.

       -use-filename-title (also see -title)
              Set the window title using the media filename, when not set with -title.  Supported by X11-based video output drivers.

       -vm
              Try to change to a different video mode.  Supported by the dga, x11, xv, sdl and directx video output drivers.  If used with the di‐
              rectx video output driver the -screenw, -screenh, -bpp and -refreshrate options can be used to set the new display mode.

       -vsync
              Enables VBI for the vesa, dfbmga and svga video output drivers.

       -wid <window ID> (also see -gui-wid) (X11, OpenGL and DirectX only)
              This tells MPlayer to attach to an existing window.  Useful to embed MPlayer in a browser (e.g. the plugger extension).  This option
              fills the given window completely, thus aspect scaling, panscan, etc are no longer handled by MPlayer but must be managed by the ap‐
              plication that created the window.

       -screen <-2-...> (alias for -xineramascreen)
              In Xinerama configurations (i.e. a single desktop that spans across multiple displays) this option tells  MPlayer  which  screen  to
              display  the  movie  on.  A value of -2 means fullscreen across the whole virtual display (in this case Xinerama information is com‐
              pletely ignored), -1 means fullscreen on the display the window currently is on.  The initial position set via the -geometry  option
              is relative to the specified screen.  Will usually only work with "-fstype -fullscreen" or "-fstype none".  This option is not suit‐
              able to only set the startup screen (because it will always display on the given screen in fullscreen mode), -geometry is  the  best
              that  is available for that purpose currently.  Supported by at least the direct3d, gl, gl_tiled, x11, xv and corevideo video output
              drivers.

       -zrbw (-vo zr only)
              Display in black and white.  For optimal performance, this can be combined with '-lavdopts gray'.

       -zrcrop <[width]x[height]+[x offset]+[y offset]> (-vo zr only)
              Select a part of the input image to display, multiple occurrences of this option switch on cinerama  mode.   In  cinerama  mode  the
              movie  is distributed over more than one TV (or beamer) to create a larger image.  Options appearing after the n-th -zrcrop apply to
              the n-th MJPEG card, each card should at least have a -zrdev in addition to the -zrcrop.  For examples, see the  output  of  -zrhelp
              and the Zr section of the documentation.

       -zrdev <device> (-vo zr only)
              Specify the device special file that belongs to your MJPEG card, by default the zr video output driver takes the first v4l device it
              can find.

       -zrfd (-vo zr only)
              Force decimation: Decimation, as specified by -zrhdec and -zrvdec, only happens if the hardware scaler can stretch the image to  its
              original size.  Use this option to force decimation.

       -zrhdec <1|2|4> (-vo zr only)
              Horizontal  decimation:  Ask  the  driver  to send only every 2nd or 4th line/pixel of the input image to the MJPEG card and use the
              scaler of the MJPEG card to stretch the image to its original size.

       -zrhelp (-vo zr only)
              Display a list of all -zr* options, their default values and a cinerama mode example.

       -zrnorm <norm> (-vo zr only)
              Specify the TV norm as PAL or NTSC (default: no change).

       -zrquality <1-20> (-vo zr only)
              A number from 1 (best) to 20 (worst) representing the JPEG encoding quality.

       -zrvdec <1|2|4> (-vo zr only)
              Vertical decimation: Ask the driver to send only every 2nd or 4th line/pixel of the input image to the MJPEG card and use the scaler
              of the MJPEG card to stretch the image to its original size.

       -zrxdoff <x display offset> (-vo zr only)
              If the movie is smaller than the TV screen, this option specifies the x offset from the upper-left corner of the TV screen (default:
              centered).

       -zrydoff <y display offset> (-vo zr only)
              If the movie is smaller than the TV screen, this option specifies the y offset from the upper-left corner of the TV screen (default:
              centered).

VIDEO OUTPUT DRIVERS (MPLAYER ONLY)
       Video output drivers are interfaces to different video output facilities.  The syntax is:

       -vo <driver1[:suboption1[=value]:...],driver2,...[,]>
              Specify a priority list of video output drivers to be used.

       If  the  list  has  a  trailing ',' MPlayer will fall back on drivers not contained in the list.  Suboptions are optional and can mostly be
       omitted.
       NOTE: See -vo help for a list of compiled-in video output drivers.

       EXAMPLE:
                 -vo xmga,xv,
                      Try the Matrox X11 driver, then the Xv driver, then others.
                 -vo directx:noaccel
                      Uses the DirectX driver with acceleration features turned off.

       Available video output drivers are:

       xv (X11 only)
              Uses the XVideo extension of XFree86 4.x to enable hardware accelerated playback.  If you cannot use  a  hardware  specific  driver,
              this  is  probably  the best option.  For information about what colorkey is used and how it is drawn run MPlayer with -v option and
              look out for the lines tagged with [xv common] at the beginning.
                 adaptor=<number>
                      Select a specific XVideo adaptor (check xvinfo results).
                 port=<number>
                      Select a specific XVideo port.
                 ck=<cur|use|set>
                      Select the source from which the colorkey is taken (default: cur).
                         cur  The default takes the colorkey currently set in Xv.
                         use  Use but do not set the colorkey from MPlayer (use -colorkey option to change it).
                         set  Same as use but also sets the supplied colorkey.
                 ck-method=<man|bg|auto>
                      Sets the colorkey drawing method (default: man).
                         man  Draw the colorkey manually (reduces flicker in some cases).
                         bg   Set the colorkey as window background.
                         auto Let Xv draw the colorkey.

       x11 (X11 only)
              Shared memory video output driver without hardware acceleration that works whenever X11 is present.

       xover (X11 only)
              Adds X11 support to all overlay based video output drivers.  Currently only supported by tdfx_vid.
                 <vo_driver>
                      Select the driver to use as source to overlay on top of X11.

       vdpau (with -vc ffmpeg12vdpau, ffwmv3vdpau, ffvc1vdpau, ffh264vdpau or ffodivxvdpau)
              Video output that uses VDPAU to decode video via hardware.  Also supports displaying of software-decoded video.
                 sharpen=<-1-1>
                      For positive values, apply a sharpening algorithm to the video, for negative values a blurring algorithm (default: 0).
                 denoise=<0-1>
                      Apply a noise reduction algorithm to the video (default: 0, no noise reduction).
                 deint=<0-4>
                      Select the deinterlacer (default: 0).  All modes > 0 respect -field-dominance.
                         0    no deinterlacing
                         1    Show only first field, similar to -vf field.
                         2    Bob deinterlacing, similar to -vf tfields=1.
                         3    motion adaptive temporal deinterlacing May lead to A/V desync with slow video hardware and/or high resolution.  This
                              is the default if "D" is used to enable deinterlacing.
                         4    motion adaptive temporal deinterlacing with edge-guided spatial interpolation Needs fast video hardware.
                 chroma-deint
                      Makes  temporal deinterlacers operate both on luma and chroma (default).  Use nochroma-deint to solely use luma and speed up
                      advanced deinterlacing.  Useful with slow video memory.
                 pullup
                      Try to skip deinterlacing for progressive frames, useful for watching telecined content, needs fast video hardware for  high
                      resolutions.  Only works with motion adaptive temporal deinterlacing.
                 colorspace
                      Select the color space for YUV to RGB conversion.  In general BT.601 should be used for standard definition (SD) content and
                      BT.709 for high definition (HD) content.  Using incorrect color space results in slightly under or over saturated and shift‐
                      ed colors.
                         0    Guess  the  color space based on video resolution.  Video with width >= 1280 or height > 576 is assumed to be HD and
                              BT.709 color space will be used.
                         1    Use ITU-R BT.601 color space (default).
                         2    Use ITU-R BT.709 color space.
                         3    Use SMPTE-240M color space.
                 hqscaling
                         0    Use default VDPAU scaling (default).
                         1-9  Apply high quality VDPAU scaling (needs capable hardware).
                 force-mixer
                      Forces the use of the VDPAU mixer, which implements all above options (default).  Use noforce-mixer to allow displaying BGRA
                      colorspace.  (Disables all above options and the hardware equalizer if image format BGRA is actually used.)

       xvmc (X11 with FFmpeg MPEG-1/2 decoder only)
              Video  output  driver that uses the XvMC (X Video Motion Compensation) extension of XFree86 4.x to speed up MPEG-1/2 and VCR2 decod‐
              ing.
                 adaptor=<number>
                      Select a specific XVideo adaptor (check xvinfo results).
                 port=<number>
                      Select a specific XVideo port.
                 (no)benchmark
                      Disables image display.  Necessary for proper benchmarking of drivers that change image  buffers  on  monitor  retrace  only
                      (nVidia).  Default is not to disable image display (nobenchmark).
                 (no)bobdeint
                      Very  simple  deinterlacer.   Might  not  look better than -vf tfields=1, but it is the only deinterlacer for xvmc (default:
                      nobobdeint).
                 (no)queue
                      Queue frames for display to allow more parallel work of the video hardware.  May add a small (not noticeable)  constant  A/V
                      desync (default: noqueue).
                 (no)sleep
                      Use sleep function while waiting for rendering to finish (not recommended on Linux) (default: nosleep).
                 ck=cur|use|set
                      Same as -vo xv:ck (see -vo xv).
                 ck-method=man|bg|auto
                      Same as -vo xv:ck-method (see -vo xv).

       dga (X11 only)
              Play video through the XFree86 Direct Graphics Access extension.  Considered obsolete.

       sdl (SDL only, buggy/outdated)
              Highly  platform  independent SDL (Simple Directmedia Layer) library video output driver.  Since SDL uses its own X11 layer, MPlayer
              X11 options do not have any effect on SDL.  Note that it has several minor bugs (-vm/-novm is mostly ignored, -fs behaves like -novm
              should, window is in top-left corner when returning from fullscreen, panscan is not supported, ...).
                 driver=<driver>
                      Explicitly choose the SDL driver to use.
                 (no)forcexv
                      Use XVideo through the sdl video output driver (default: forcexv).
                 (no)hwaccel
                      Use hardware accelerated scaler (default: hwaccel).

       vidix
              VIDIX  (VIDeo  Interface  for *niX) is an interface to the video acceleration features of different graphics cards.  Very fast video
              output driver on cards that support it.
                 <subdevice>
                      Explicitly choose the VIDIX subdevice driver to use.  Available subdevice drivers are cyberblade, ivtv,  mach64,  mga_crtc2,
                      mga, nvidia, pm2, pm3, radeon, rage128, s3, sh_veu, sis_vid and unichrome.

       xvidix (X11 only)
              X11 frontend for VIDIX
                 <subdevice>
                      same as vidix

       cvidix
              Generic and platform independent VIDIX frontend, can even run in a text console with nVidia cards.
                 <subdevice>
                      same as vidix

       winvidix (Windows only)
              Windows frontend for VIDIX
                 <subdevice>
                      same as vidix

       direct3d (Windows only) (BETA CODE!)
              Video output driver that uses the Direct3D interface (useful for Vista).

       directx (Windows only)
              Video output driver that uses the DirectX interface.
                 noaccel
                      Turns off hardware acceleration.  Try this option if you have display problems.

       kva (OS/2 only)
              Video output driver that uses the libkva interface.
                 snap Force SNAP mode.
                 wo   Force WarpOverlay! mode.
                 dive Force DIVE mode.
                 (no)t23
                      Enable  or disable workaround for T23 laptop (default: disabled).  Try to enable this option if your video card supports up‐
                      scaling only.

       quartz (Mac OS X only)
              Mac OS X Quartz video output driver.  Under some circumstances, it might be more efficient to force a packed YUV output format, with
              e.g. -vf format=yuy2.
                 device_id=<number>
                      Choose the display device to use in fullscreen.
                 fs_res=<width>:<height>
                      Specify the fullscreen resolution (useful on slow systems).

       corevideo (Mac OS X 10.4 or 10.3.9 with QuickTime 7)
              Mac OS X CoreVideo video output driver
                 device_id=<number>
                      DEPRECATED,  use  -screen  instead.   Choose the display device to use for fullscreen or set it to -1 to always use the same
                      screen the video window is on (default: -1 - auto).
                 shared_buffer
                      Write output to a shared memory buffer instead of displaying it and try to open an existing NSConnection  for  communication
                      with a GUI.
                 buffer_name=<name>
                      Name  of  the shared buffer created with shm_open as well as the name of the NSConnection MPlayer will try to open (default:
                      "mplayerosx").  Setting buffer_name implicitly enables shared_buffer.

       fbdev (Linux only)
              Uses the kernel framebuffer to play video.
                 <device>
                      Explicitly choose the fbdev device name to use (e.g. /dev/fb0) or the name of the VIDIX subdevice if the device name  starts
                      with 'vidix' (e.g. 'vidixsis_vid' for the sis driver).

       fbdev2 (Linux only)
              Uses the kernel framebuffer to play video, alternative implementation.
                 <device>
                      Explicitly choose the fbdev device name to use (default: /dev/fb0).

       vesa
              Very general video output driver that should work on any VESA VBE 2.0 compatible card.
                 (no)dga
                      Turns DGA mode on or off (default: on).
                 neotv_pal
                      Activate the NeoMagic TV out and set it to PAL norm.
                 neotv_ntsc
                      Activate the NeoMagic TV out and set it to NTSC norm.
                 vidix
                      Use the VIDIX driver.
                 lvo:
                      Activate the Linux Video Overlay on top of VESA mode.

       svga
              Play video using the SVGA library.
                 <video mode>
                      Specify  video  mode to use.  The mode can be given in a <width>x<height>x<colors> format, e.g. 640x480x16M or be a graphics
                      mode number, e.g. 84.
                 bbosd
                      Draw OSD into black bands below the movie (slower).
                 native
                      Use only native drawing functions.  This avoids direct rendering, OSD and hardware acceleration.
                 retrace
                      Force frame switch on vertical retrace.  Usable only with -double.  It has the same effect as the -vsync option.
                 sq
                      Try to select a video mode with square pixels.
                 vidix
                      Use svga with VIDIX.

       gl
              OpenGL video output driver, simple version.  Video size must be smaller than the maximum texture size of your OpenGL implementation.
              Intended  to  work  even with the most basic OpenGL implementations, but also makes use of newer extensions, which allow support for
              more colorspaces and direct rendering.  For optimal speed try adding the options
              -dr -noslices
              The code performs very few checks, so if a feature does not work, this might be because it is not supported by your card/OpenGL  im‐
              plementation even if you do not get any error message.  Use glxinfo or a similar tool to display the supported OpenGL extensions.
                 backend=<n>
                      Select the backend/OpenGL implementation to use (default: -1).
                         -1: Autoselect
                         0: Win32/WGL
                         1: X11/GLX
                         2: SDL
                         3: X11/EGL (highly experimental)
                         4: OSX/Cocoa
                         5: Android (very bad hack, only for testing)
                 (no)ati-hack
                      ATI drivers may give a corrupted image when PBOs are used (when using -dr or force-pbo).  This option fixes this, at the ex‐
                      pense of using a bit more memory.
                 (no)force-pbo
                      Always uses PBOs to transfer textures even if this involves an extra copy.  Currently this gives a little extra  speed  with
                      NVidia drivers and a lot more speed with ATI drivers.  May need -noslices and the ati-hack suboption to work correctly.
                 (no)scaled-osd
                      Changes the way the OSD behaves when the size of the window changes (default: disabled).  When enabled behaves more like the
                      other video output drivers, which is better for fixed-size fonts.  Disabled looks much better with FreeType fonts  and  uses
                      the  borders in fullscreen mode.  Does not work correctly with ass subtitles (see -ass), you can instead render them without
                      OpenGL support via -vf ass.
                 osdcolor=<0xAARRGGBB>
                      Color for OSD (default: 0x00ffffff, corresponds to non-transparent white).
                 rectangle=<0,1,2>
                      Select usage of rectangular textures which saves video RAM, but often is slower (default: 0).
                         0: Use power-of-two textures (default).
                         1: Use the GL_ARB_texture_rectangle extension.
                         2: Use the GL_ARB_texture_non_power_of_two extension.  In some cases only supported in software and thus very slow.
                 swapinterval=<n>
                      Minimum interval between two buffer swaps, counted in displayed frames (default: 1).  1 is equivalent to enabling  VSYNC,  0
                      to  disabling  VSYNC.  Values below 0 will leave it at the system default.  This limits the framerate to (horizontal refresh
                      rate / n).  Requires GLX_SGI_swap_control support to work.   With  some  (most/all?)  implementations  this  only  works  in
                      fullscreen mode.
                 ycbcr
                      Use  the GL_APPLE_ycbcr_422 extension to convert YUV to RGB.  Default is disabled if yuv= is specified, auto-detected other‐
                      wise.  Note that this will enable a few special settings to get into a special driver fast-path.
                 yuv=<n>
                      Select the type of YUV to RGB conversion.  The default is auto-detection deciding between values 0 and 2.
                         0: Use software conversion.  Compatible with all OpenGL versions.  Provides brightness, contrast and saturation control.
                         1: Use register combiners.  This uses an nVidia-specific extension (GL_NV_register_combiners).  At  least  three  texture
                         units are needed.  Provides saturation and hue control.  This method is fast but inexact.
                         2: Use a fragment program using the POW instruction.  Needs the GL_ARB_fragment_program extension and at least three tex‐
                         ture units.  Provides brightness, contrast, saturation, hue and gamma control.  Gamma can also be set  independently  for
                         red, green and blue.  Method 4 is usually faster.
                         3:  Same  as  2.   They exist as distinct values for legacy reasons, MPlayer now inserts the extra instructions for gamma
                         control on-demand.
                         4: Use a fragment program with additional lookup.  Needs the GL_ARB_fragment_program extension and at least four  texture
                         units.   Provides  brightness, contrast, saturation, hue and gamma control.  Gamma can also be set independently for red,
                         green and blue.
                         5: Use ATI-specific method (for older  cards).   This  uses  an  ATI-specific  extension  (GL_ATI_fragment_shader  -  not
                         GL_ARB_fragment_shader!).  At least three texture units are needed.  Provides saturation and hue control.  This method is
                         fast but inexact.
                         6: Use a 3D texture to do conversion via lookup.  Needs the GL_ARB_fragment_program extension and at least  four  texture
                         units.   Extremely  slow  (software emulation) on some (all?) ATI cards since it uses a texture with border pixels.  Pro‐
                         vides brightness, contrast, saturation, hue and gamma control.  Gamma can also be set independently for  red,  green  and
                         blue.  Speed depends more on GPU memory bandwidth than other methods.
                 colorspace
                      Select the color space for YUV to RGB conversion.
                         0    Use the formula used normally by MPlayer (default).
                         1    Use ITU-R BT.601 color space.
                         2    Use ITU-R BT.709 color space.
                         3    Use SMPTE-240M color space.
                 levelconv=<n>
                      Select the brightness level conversion to use for the YUV to RGB conversion
                         0    Convert TV to PC levels (default).
                         1    Convert PC to TV levels.
                         2    Do not do any conversion.
                 lscale=<n>
                      Select the scaling function to use for luminance scaling.  Only valid for yuv modes 2, 3, 4 and 6.
                         0    Use simple linear filtering (default).
                         1    Use  bicubic  B-spline filtering (better quality).  Needs one additional texture unit.  Older cards will not be able
                              to handle this for chroma at least in fullscreen mode.
                         2    Use cubic filtering in horizontal, linear filtering in vertical direction.  Works on a few more cards than method 1.
                         3    Same as 1 but does not use a lookup texture.  Might be faster on some cards.
                         4    Use experimental unsharp masking with 3x3 support and a default strength of 0.5 (see filter-strength).
                         5    Use experimental unsharp masking with 5x5 support and a default strength of 0.5 (see filter-strength).
                         64   Use nearest-neighbor scaling.
                 cscale=<n>
                      Select the scaling function to use for chrominance scaling.  For details see lscale.
                 filter-strength=<value>
                      Set the effect strength for the lscale/cscale filters that support it.
                 noise-strength=<value>
                      Set how much noise to add. 0 to disable (default), 1.0 for level suitable for dithering to 6 bit.
                 stereo=<value>
                      Select a method for stereo display.  You may have to use -aspect to fix the aspect value.  Add 32 to  swap  left  and  right
                      side.  Experimental, do not expect too much from it.
                         0    normal 2D display
                         1    Convert side by side input to full-color red-cyan stereo.
                         2    Convert side by side input to full-color green-magenta stereo.
                         3    Convert side by side input to quadbuffered stereo.  Only supported by very few OpenGL cards.
                         4    Mix left and right in a pixel pattern.  Pattern is given by stipple option.
                 stipple=<bit
                      Lowest  16  bit  give  the 4x4 pattern to use (default: 0x0f0f).  Examples to try: 0x0f0f, 0xf0f0: horizontal lines; 0xaaaa,
                      0x5555: vertical lines; 0xa5a5, 0x5a5a: checkerboard pattern

              The following options are only useful if writing your own fragment programs.

                 customprog=<filename>
                      Load a custom fragment program from <filename>.  See TOOLS/edgedect.fp for an example.
                 customtex=<filename>
                      Load a custom "gamma ramp" texture from <filename>.  This can be used in combination with yuv=4 or with the  customprog  op‐
                      tion.
                 (no)customtlin
                      If enabled (default) use GL_LINEAR interpolation, otherwise use GL_NEAREST for customtex texture.
                 (no)customtrect
                      If enabled, use texture_rectangle for customtex texture.  Default is disabled.
                 (no)mipmapgen
                      If  enabled,  mipmaps for the video are automatically generated.  This should be useful together with the customprog and the
                      TXB instruction to implement blur filters with a large radius.  For most OpenGL implementations this is very  slow  for  any
                      non-RGB formats.  Default is disabled.

              Normally there is no reason to use the following options, they mostly exist for testing purposes.

                 (no)glfinish
                      Call glFinish() before swapping buffers.  Slower but in some cases more correct output (default: disabled).
                 (no)manyfmts
                      Enables support for more (RGB and BGR) color formats (default: enabled).  Needs OpenGL version >= 1.2.
                 slice-height=<0-...>
                      Number of lines copied to texture in one piece (default: 0).  0 for whole image.
                      NOTE: If YUV colorspace is used (see yuv suboption), special rules apply:
                         If  the  decoder  uses slice rendering (see -noslices), this setting has no effect, the size of the slices as provided by
                         the decoder is used.
                         If the decoder does not use slice rendering, the default is 16.
                 (no)osd
                      Enable or disable support for OSD rendering via OpenGL (default: enabled).  This option is for testing; to disable  the  OSD
                      use -osdlevel 0 instead.
                 (no)aspect
                      Enable or disable aspect scaling and pan-and-scan support (default: enabled).  Disabling might increase speed.

       gl_tiled
              Variant of the OpenGL video output driver.  Supports videos larger than the maximum texture size but lacks many of the advanced fea‐
              tures and optimizations of the gl driver and is unlikely to be extended further.
                 (no)glfinish
                      same as gl (default: enabled)
                 yuv=<n>
                      Select the type of YUV to RGB conversion.  If set to anything except 0 OSD will be disabled  and  brightness,  contrast  and
                      gamma  setting  is only available via the global X server settings.  Apart from this the values have the same meaning as for
                      -vo gl.

       matrixview
              OpenGL-based renderer creating a Matrix-like running-text effect.
                 cols=<n>
                      Number of text columns to display.  Very low values (< 16) will probably fail due to scaler limitations.  Values not divisi‐
                      ble by 16 may cause issues as well.
                 rows=<n>
                      Number  of text rows to display.  Very low values (< 16) will probably fail due to scaler limitations.  Values not divisible
                      by 16 may cause issues as well.

       null
              Produces no video output.  Useful for benchmarking.

       aa
              ASCII art video output driver that works on a text console.
              NOTE: The driver does not handle -aspect correctly.
              HINT: You probably have to specify -monitorpixelaspect.  Try 'mplayer -vo aa -monitorpixelaspect 0.5'.

       caca
              Color ASCII art video output driver that works on a text console.

       bl
              Video playback using the Blinkenlights UDP protocol.  This driver is highly hardware specific.
                 <subdevice>
                      Explicitly choose  the  Blinkenlights  subdevice  driver  to  use.   It  is  something  like  arcade:host=localhost:2323  or
                      hdl:file=name1,file=name2.  You must specify a subdevice.

       ggi
              GGI graphics system video output driver
                 <driver>
                      Explicitly choose the GGI driver to use.  Replace any ',' that would appear in the driver string by a '.'.

       directfb
              Play video using the DirectFB library.
                 (no)input
                      Use the DirectFB instead of the MPlayer keyboard code (default: enabled).
                 buffermode=single|double|triple
                      Double  and triple buffering give best results if you want to avoid tearing issues.  Triple buffering is more efficient than
                      double buffering as it does not block MPlayer while waiting for the vertical retrace.  Single buffering  should  be  avoided
                      (default: single).
                 fieldparity=top|bottom
                      Control  the output order for interlaced frames (default: disabled).  Valid values are top = top fields first, bottom = bot‐
                      tom fields first.  This option does not have any effect on progressive film material like most MPEG movies are.  You need to
                      enable this option if you have tearing issues or unsmooth motions watching interlaced film material.
                 layer=N
                      Will force layer with ID N for playback (default: -1 - auto).
                 dfbopts=<list>
                      Specify a parameter list for DirectFB.

       dfbmga
              Matrox G400/G450/G550 specific video output driver that uses the DirectFB library to make use of special hardware features.  Enables
              CRTC2 (second head), displaying video independently of the first head.
                 (no)input
                      same as directfb (default: disabled)
                 buffermode=single|double|triple
                      same as directfb (default: triple)
                 fieldparity=top|bottom
                      same as directfb
                 (no)bes
                      Enable the use of the Matrox BES (backend scaler) (default: disabled).  Gives very good results concerning speed and  output
                      quality as interpolated picture processing is done in hardware.  Works only on the primary head.
                 (no)spic
                      Make use of the Matrox sub picture layer to display the OSD (default: enabled).
                 (no)crtc2
                      Turn on TV-out on the second head (default: enabled).  The output quality is amazing as it is a full interlaced picture with
                      proper sync to every odd/even field.
                 tvnorm=pal|ntsc|auto
                      Will set the TV norm of the Matrox card without the need for modifying /etc/directfbrc (default: disabled).  Valid norms are
                      pal  =  PAL, ntsc = NTSC.  Special norm is auto (auto-adjust using PAL/NTSC) because it decides which norm to use by looking
                      at the framerate of the movie.

       mga (Linux only)
              Matrox specific video output driver that makes use of the YUV back end scaler on Gxxx cards through a kernel module.  If you have  a
              Matrox card, this is the fastest option.
                 <device>
                      Explicitly choose the Matrox device name to use (default: /dev/mga_vid).

       xmga (Linux, X11 only)
              The mga video output driver, running in an X11 window.
                 <device>
                      Explicitly choose the Matrox device name to use (default: /dev/mga_vid).

       s3fb (Linux only) (also see -dr)
              S3 Virge specific video output driver.  This driver supports the card's YUV conversion and scaling, double buffering and direct ren‐
              dering features.  Use -vf format=yuy2 to get hardware-accelerated YUY2 rendering, which is much faster than YV12 on this card.
                 <device>
                      Explicitly choose the fbdev device name to use (default: /dev/fb0).

       wii (Linux only)
              Nintendo Wii/GameCube specific video output driver.

       3dfx (Linux only)
              3dfx-specific video output driver that directly uses the hardware on top of X11.  Only 16 bpp are supported.

       tdfxfb (Linux only)
              This driver employs the tdfxfb framebuffer driver to play movies with YUV acceleration on 3dfx cards.
                 <device>
                      Explicitly choose the fbdev device name to use (default: /dev/fb0).

       tdfx_vid (Linux only)
              3dfx-specific video output driver that works in combination with the tdfx_vid kernel module.
                 <device>
                      Explicitly choose the device name to use (default: /dev/tdfx_vid).

       dxr2 (also see -dxr2) (DXR2 only)
              Creative DXR2 specific video output driver.
                 <vo_driver>
                      Output video subdriver to use as overlay (x11, xv).

       dxr3 (DXR3 only)
              Sigma Designs em8300 MPEG decoder chip (Creative DXR3, Sigma Designs Hollywood Plus) specific video output  driver.   Also  see  the
              lavc video filter.
                 overlay
                      Activates the overlay instead of TV-out.
                 prebuf
                      Turns on prebuffering.
                 sync
                      Will turn on the new sync-engine.
                 norm=<norm>
                      Specifies the TV norm.
                         0: Does not change current norm (default).
                         1: Auto-adjust using PAL/NTSC.
                         2: Auto-adjust using PAL/PAL-60.
                         3: PAL
                         4: PAL-60
                         5: NTSC
                 <0-3>
                      Specifies the device number to use if you have more than one em8300 card.

       ivtv (IVTV only)
              Conexant   CX23415   (iCompression   iTVC15)   or  Conexant  CX23416  (iCompression  iTVC16)  MPEG  decoder  chip  (Hauppauge  WinTV
              PVR-150/250/350/500) specific video output driver for TV-out.  Also see the lavc video filter.
                 <device>
                      Explicitly choose the MPEG decoder device name to use (default: /dev/video16).
                 <output>
                      Explicitly choose the TV-out output to be used for the video signal.

       v4l2 (requires Linux 2.6.22+ kernel)
              Video output driver for V4L2 compliant cards with built-in hardware MPEG decoder.  Also see the lavc video filter.
                 <device>
                      Explicitly choose the MPEG decoder device name to use (default: /dev/video16).
                 <output>
                      Explicitly choose the TV-out output to be used for the video signal.

       mpegpes (DVB only)
              Video output driver for DVB cards that writes the output to an MPEG-PES file if no DVB card is installed.
                 card=<1-4>
                      Specifies the device number to use if you have more than one DVB output card (V3 API only, such as  1.x.y  series  drivers).
                      If not specified MPlayer will search the first usable card.
                 <filename>
                      output filename (default: ./grab.mpg)

       zr (also see -zr* and -zrhelp)
              Video output driver for a number of MJPEG capture/playback cards.

       zr2 (also see the zrmjpeg video filter)
              Video output driver for a number of MJPEG capture/playback cards, second generation.
                 dev=<device>
                      Specifies the video device to use.
                 norm=<PAL|NTSC|SECAM|auto>
                      Specifies the video norm to use (default: auto).
                 (no)prebuf
                      (De)Activate prebuffering, not yet supported.

       md5sum
              Calculate MD5 sums of each frame and write them to a file.  Supports RGB24 and YV12 colorspaces.  Useful for debugging.
                 outfile=<value>
                      Specify the output filename (default: ./md5sums).

       yuv4mpeg
              Transforms  the  video stream into a sequence of uncompressed YUV 4:2:0 images and stores it in a file (default: ./stream.yuv).  The
              format is the same as the one employed by mjpegtools, so this is useful if you want to process the video with the mjpegtools  suite.
              It supports the YV12 format.  If your source file has a different format and is interlaced, make sure to use -vf scale=::1 to ensure
              the conversion uses interlaced mode.  You can combine it with the -fixed-vo option to concatenate files with the same dimensions and
              fps value.
                 interlaced
                      Write the output as interlaced frames, top field first.
                 interlaced_bf
                      Write the output as interlaced frames, bottom field first.
                 file=<filename>
                      Write the output to <filename> instead of the default stream.yuv.

              NOTE: If you do not specify any option the output is progressive (i.e. not interlaced).

       gif89a
              Output  each frame into a single animated GIF file in the current directory.  It supports only RGB format with 24 bpp and the output
              is converted to 256 colors.
                 <fps>
                      Float value to specify framerate (default: 5.0).
                 <output>
                      Specify the output filename (default: ./out.gif).

              NOTE: You must specify the framerate before the filename or the framerate will be part of the filename.

              EXAMPLE:
                 mplayer video.nut -vo gif89a:fps=15:output=test.gif

       jpeg
              Output each frame into a JPEG file in the current directory.  Each file takes the frame number padded with leading zeros as name.
                 [no]progressive
                      Specify standard or progressive JPEG (default: noprogressive).
                 [no]baseline
                      Specify use of baseline or not (default: baseline).
                 optimize=<0-100>
                      optimization factor (default: 100)
                 smooth=<0-100>
                      smooth factor (default: 0)
                 quality=<0-100>
                      quality factor (default: 75)
                 outdir=<dirname>
                      Specify the directory to save the JPEG files to (default: ./).
                 subdirs=<prefix>
                      Create numbered subdirectories with the specified prefix to save the files in instead of the current directory.
                 maxfiles=<value> (subdirs only)
                      Maximum number of files to be saved per subdirectory.  Must be equal to or larger than 1 (default: 1000).

       pnm
              Output each frame into a PNM file in the current directory.  Each file takes the frame number padded with leading zeros as name.  It
              supports PPM, PGM and PGMYUV files in both raw and ASCII mode.  Also see pnm(5), ppm(5) and pgm(5).
                 ppm
                      Write PPM files (default).
                 pgm
                      Write PGM files.
                 pgmyuv
                      Write PGMYUV files.  PGMYUV is like PGM, but it also contains the U and V plane, appended at the bottom of the picture.
                 raw
                      Write PNM files in raw mode (default).
                 ascii
                      Write PNM files in ASCII mode.
                 outdir=<dirname>
                      Specify the directory to save the PNM files to (default: ./).
                 subdirs=<prefix>
                      Create numbered subdirectories with the specified prefix to save the files in instead of the current directory.
                 maxfiles=<value> (subdirs only)
                      Maximum number of files to be saved per subdirectory.  Must be equal to or larger than 1 (default: 1000).

       png
              Output  each  frame  into  a PNG file in the current directory.  Each file takes the frame number padded with leading zeros as name.
              24bpp RGB and BGR formats are supported.
                 z=<0-9>
                      Specifies the compression level.  0 is no compression, 9 is maximum compression.
                 outdir=<dirname>
                      Specify the directory to save the PNG files to (default: ./).
                 prefix=<prefix>
                      Specify the prefix to be used for the PNG filenames (default: no prefix).
                 alpha
                      Create PNG files with an alpha channel.  Note that MPlayer in general does not support alpha, so this will only be useful in
                      some rare cases.

       mng
              Output video into an animated MNG file using 24 bpp RGB images with lossless compression.
                 output=<filename>
                      Specify the output filename (default: out.mng).

              EXAMPLE:
                 mplayer video.mkv -vo mng:output=test.mng

       tga
              Output  each  frame into a Targa file in the current directory.  Each file takes the frame number padded with leading zeros as name.
              The purpose of this video output driver is to have a simple lossless image writer to use without any external library.  It  supports
              the BGR[A] color format, with 15, 24 and 32 bpp.  You can force a particular format with the format video filter.

              EXAMPLE:
                 mplayer video.nut -vf format=bgr15 -vo tga

DECODING/FILTERING OPTIONS
       -ac <[-|+]codec1,[-|+]codec2,...[,]>
              Specify  a  priority list of audio codecs to be used, according to their codec name in codecs.conf.  Use a '-' before the codec name
              to omit it.  Use a '+' before the codec name to force it, this will likely crash!  If the list has a trailing ',' MPlayer will  fall
              back on codecs not contained in the list.
              NOTE: See -ac help for a full list of available codecs.

              EXAMPLE:
                 -ac mp3acm
                      Force the l3codeca.acm MP3 codec.
                 -ac mad,
                      Try libmad first, then fall back on others.
                 -ac hwac3,a52,
                      Try hardware AC-3 passthrough, software AC-3, then others.
                 -ac hwdts,
                      Try hardware DTS passthrough, then fall back on others.
                 -ac -ffmp3,
                      Skip FFmpeg's MP3 decoder.

       -af-adv <force=(0-7):list=(filters)> (also see -af)
              Specify advanced audio filter options:

                 force=<0-7>
                      Forces the insertion of audio filters to one of the following:
                         0: Use completely automatic filter insertion (currently identical to 1).
                         1: Optimize for accuracy (default).
                         2: Optimize for speed.  Warning: Some features in the audio filters may silently fail, and the sound quality may drop.
                         3:  Use  no  automatic insertion of filters and no optimization.  Warning: It may be possible to crash MPlayer using this
                         setting.
                         4: Use automatic insertion of filters according to 0 above, but use floating point processing when possible.
                         5: Use automatic insertion of filters according to 1 above, but use floating point processing when possible.
                         6: Use automatic insertion of filters according to 2 above, but use floating point processing when possible.
                         7: Use no automatic insertion of filters according to 3 above, and use floating point processing when possible.

                 list=<filters>
                      Same as -af.

       -afm <driver1,driver2,...>
              Specify a priority list of audio codec families to be used, according to their codec name in codecs.conf.  Falls back on the default
              codecs if none of the given codec families work.
              NOTE: See -afm help for a full list of available codec families.

              EXAMPLE:
                 -afm ffmpeg
                      Try FFmpeg's libavcodec codecs first.
                 -afm acm,dshow
                      Try Win32 codecs first.

       -aspect <ratio> (also see -zoom)
              Override movie aspect ratio, in case aspect information is incorrect or missing in the file being played.

              EXAMPLE:
                 -aspect 4:3  or -aspect 1.3333
                 -aspect 16:9 or -aspect 1.7777

       -noaspect
              Disable automatic movie aspect ratio compensation.

       -field-dominance <-1-1>
              Set  first  field  for  interlaced content.  Useful for deinterlacers that double the framerate: -vf tfields=1, -vf yadif=1, -vo vd‐
              pau:deint and -vo xvmc:bobdeint.
                 -1   auto (default): If the decoder does not export the appropriate information, it falls back to 0 (top field first).
                 0    top field first
                 1    bottom field first

       -flip
              Flip image upside-down.

       -lavdopts <option1:option2:...> (DEBUG CODE)
              Specify libavcodec decoding parameters.  Separate multiple options with a colon.

              EXAMPLE:
                 -lavdopts gray:skiploopfilter=all:skipframe=nonref

              Available options are:

                 bitexact
                      Only use bit-exact algorithms in all decoding steps (for codec testing).

                 bug=<value>
                      Manually work around encoder bugs.
                         0: nothing
                         1: autodetect bugs (default)
                         2 (msmpeg4v3): some old lavc generated msmpeg4v3 files (no autodetection)
                         4 (mpeg4): Xvid interlacing bug (autodetected if fourcc==XVIX)
                         8 (mpeg4): UMP4 (autodetected if fourcc==UMP4)
                         16 (mpeg4): padding bug (autodetected)
                         32 (mpeg4): illegal vlc bug (autodetected per fourcc)
                         64 (mpeg4): Xvid and DivX qpel bug (autodetected per fourcc/version)
                         128 (mpeg4): old standard qpel (autodetected per fourcc/version)
                         256 (mpeg4): another qpel bug (autodetected per fourcc/version)
                         512 (mpeg4): direct-qpel-blocksize bug (autodetected per fourcc/version)
                         1024 (mpeg4): edge padding bug (autodetected per fourcc/version)

                 debug=<value>
                      Display debugging information.
                         0: disabled
                         1: picture info
                         2: rate control
                         4: bitstream
                         8: macroblock (MB) type
                         16: per-block quantization parameter (QP)
                         32: motion vector
                         0x0040: motion vector visualization (use -noslices)
                         0x0080: macroblock (MB) skip
                         0x0100: startcode
                         0x0200: PTS
                         0x0400: error resilience
                         0x0800: memory management control operations (H.264)
                         0x1000: bugs
                         0x2000: Visualize quantization parameter (QP), lower QP are tinted greener.
                         0x4000: Visualize block types.

                 ec=<value>
                      Set error concealment strategy.
                         1: Use strong deblock filter for damaged MBs.
                         2: iterative motion vector (MV) search (slow)
                         3: all (default)

                 er=<value>
                      Set error resilience strategy.
                         0: disabled
                         1: careful (Should work with broken encoders.)
                         2: normal (default) (Works with compliant encoders.)
                         3: aggressive (More checks, but might cause problems even for valid bitstreams.)
                         4: very aggressive

                 fast (MPEG-2, MPEG-4, and H.264 only)
                      Enable optimizations which do not comply to the specification and might potentially cause problems, like simpler dequantiza‐
                      tion,  simpler  motion  compensation, assuming use of the default quantization matrix, assuming YUV 4:2:0 and skipping a few
                      checks to detect damaged bitstreams.

                 gray
                      grayscale only decoding (a bit faster than with color)

                 idct=<0-99> (see -lavcopts)
                      For best decoding quality use the same IDCT algorithm for decoding and encoding.  This may come  at  a  price  in  accuracy,
                      though.

                 lowres=<number>[,<w>]
                      Decode at lower resolutions.  Low resolution decoding is not supported by all codecs, and it will often result in ugly arti‐
                      facts.  This is not a bug, but a side effect of not decoding at full resolution.
                         0: disabled
                         1: 1/2 resolution
                         2: 1/4 resolution
                         3: 1/8 resolution
                      If <w> is specified lowres decoding will be used only if the width of the video is major than or equal to <w>.
                 o=<key>=<value>[,<key>=<value>[,...]]  Pass AVOptions to libavcodec decoder.  Note, a patch to make the o= unneeded and pass  all
                 unknown  options  through the AVOption system is welcome.  A full list of AVOptions can be found in the FFmpeg manual.  Note that
                 some options may conflict with MEncoder options.

                      EXAMPLE:
                           o=debug=pict

                 sb=<number> (MPEG-2 only)
                      Skip the given number of macroblock rows at the bottom.

                 st=<number> (MPEG-2 only)
                      Skip the given number of macroblock rows at the top.

                 skiploopfilter=<skipvalue> (H.264 only)
                      Skips the loop filter (AKA deblocking) during H.264 decoding.  Since the filtered frame is supposed to be used as  reference
                      for  decoding  dependent  frames  this has a worse effect on quality than not doing deblocking on e.g. MPEG-2 video.  But at
                      least for high bitrate HDTV this provides a big speedup with no visible quality loss.

                      <skipvalue> can be either one of the following:
                         none: Never skip.
                         default: Skip useless processing steps (e.g. 0 size packets in AVI).
                         nonref: Skip frames that are not referenced (i.e. not used for decoding other frames, the error cannot "build up").
                         bidir: Skip B-Frames.
                         nonkey: Skip all frames except keyframes.
                         all: Skip all frames.

                 skipidct=<skipvalue> (MPEG-1/2 only)
                      Skips the IDCT step.  This degrades quality a lot of in almost all cases (see skiploopfilter for available skip values).

                 skipframe=<skipvalue>
                      Skips decoding of frames completely.  Big speedup, but jerky motion and sometimes  bad  artifacts  (see  skiploopfilter  for
                      available skip values).

                 threads=<1-8> (MPEG-1/2 and H.264 only)
                      number of threads to use for decoding (default: 1)

                 vismv=<value>
                      Visualize motion vectors.
                         0: disabled
                         1: Visualize forward predicted MVs of P-frames.
                         2: Visualize forward predicted MVs of B-frames.
                         4: Visualize backward predicted MVs of B-frames.

                 vstats
                      Prints some statistics and stores them in ./vstats_*.log.

                 wait_keyframe
                      Wait for a keyframe before displaying anything.  Avoids broken frames at startup or after seeking with some formats.

       -noslices
              Disable  drawing video by 16-pixel height slices/bands, instead draws the whole frame in a single run.  May be faster or slower, de‐
              pending on video card and available cache.  It has effect only with libmpeg2 and libavcodec codecs.

       -nosound
              Do not play/encode sound.  Useful for benchmarking.

       -novideo
              Do not play/encode video.  In many cases this will not work, use -vc null -vo null instead.

       -pp <quality> (also see -vf pp)
              Set the DLL postprocess level.  This option is no longer usable with -vf pp.  It only works with Win32 DirectShow DLLs with internal
              postprocessing routines.  The valid range of -pp values varies by codec, it is mostly 0-6, where 0=disable, 6=slowest/best.

       -pphelp (also see -vf pp)
              Show a summary about the available postprocess filters and their usage.

       -ssf <mode>
              Specifies software scaler parameters.

              EXAMPLE:
                 -vf scale -ssf lgb=3.0
                 lgb=<0-100>
                      gaussian blur filter (luma)
                 cgb=<0-100>
                      gaussian blur filter (chroma)
                 ls=<-100-100>
                      sharpen filter (luma)
                 cs=<-100-100>
                      sharpen filter (chroma)
                 chs=<h>
                      chroma horizontal shifting
                 cvs=<v>
                      chroma vertical shifting

       -stereo <mode>
              Select type of MP2/MP3 stereo output.
                 0    stereo
                 1    left channel
                 2    right channel

       -sws <software scaler type> (also see -vf scale and -zoom)
              Specify  the  software scaler algorithm to be used with the -zoom option.  This affects video output drivers which lack hardware ac‐
              celeration, e.g. x11.

              Available types are:

                 0    fast bilinear
                 1    bilinear
                 2    bicubic (good quality) (default)
                 3    experimental
                 4    nearest neighbor (bad quality)
                 5    area
                 6    luma bicubic / chroma bilinear
                 7    gauss
                 8    sincR
                 9    lanczos
                 10   natural bicubic spline

              NOTE: Some -sws options are tunable.  The description of the scale video filter has further information.

       -vc <[-|+]codec1,[-|+]codec2,...[,]>
              Specify a priority list of video codecs to be used, according to their codec name in codecs.conf.  Use a '-' before the  codec  name
              to  omit it.  Use a '+' before the codec name to force it, this will likely crash!  If the list has a trailing ',' MPlayer will fall
              back on codecs not contained in the list.
              NOTE: See -vc help for a full list of available codecs.

              EXAMPLE:
                 -vc divx
                      Force Win32/VfW DivX codec, no fallback.
                 -vc -divxds,-divx,
                      Skip Win32 DivX codecs.
                 -vc ffmpeg12,mpeg12,
                      Try libavcodec's MPEG-1/2 codec, then libmpeg2, then others.

       -vfm <driver1,driver2,...>
              Specify a priority list of video codec families to be used, according to their names in codecs.conf.   Falls  back  on  the  default
              codecs if none of the given codec families work.
              NOTE: See -vfm help for a full list of available codec families.

              EXAMPLE:
                 -vfm ffmpeg,dshow,vfw
                      Try the libavcodec, then Directshow, then VfW codecs and fall back on others, if they do not work.
                 -vfm xanim
                      Try XAnim codecs first.

       -x <x> (also see -zoom) (MPlayer only)
              Scale image to width <x> (if software/hardware scaling is available).  Disables aspect calculations.

       -xvidopts <option1:option2:...>
              Specify additional parameters when decoding with Xvid.
              NOTE:  Since  libavcodec  is  faster than Xvid you might want to use the libavcodec postprocessing filter (-vf pp) and decoder (-vfm
              ffmpeg) instead.

              Xvid's internal postprocessing filters:
                 deblock-chroma (also see -vf pp)
                      chroma deblock filter
                 deblock-luma (also see -vf pp)
                      luma deblock filter
                 dering-luma (also see -vf pp)
                      luma deringing filter
                 dering-chroma (also see -vf pp)
                      chroma deringing filter
                 filmeffect (also see -vf noise)
                      Adds artificial film grain to the video.  May increase perceived quality, while lowering true quality.

              rendering methods:
                 dr2
                      Activate direct rendering method 2.
                 nodr2
                      Deactivate direct rendering method 2.

       -xy <value> (also see -zoom)
                 value<=8
                      Scale image by factor <value>.
                 value>8
                      Set width to value and calculate height to keep correct aspect ratio.

       -y <y> (also see -zoom) (MPlayer only)
              Scale image to height <y> (if software/hardware scaling is available).  Disables aspect calculations.

       -zoom
              Allow software scaling, where available.  This will allow scaling with output drivers (like x11, fbdev) that do not support hardware
              scaling where MPlayer disables scaling by default for performance reasons.

AUDIO FILTERS
       Audio filters allow you to modify the audio stream and its properties.  The syntax is:

       -af <filter1[=parameter1:parameter2:...],filter2,...>
              Setup a chain of audio filters.

       NOTE: To get a full list of available audio filters, see -af help.

       Audio filters are managed in lists.  There are a few commands to manage the filter list.

       -af-add <filter1[,filter2,...]>
              Appends the filters given as arguments to the filter list.

       -af-pre <filter1[,filter2,...]>
              Prepends the filters given as arguments to the filter list.

       -af-del <index1[,index2,...]>
              Deletes the filters at the given indexes.  Index numbers start at 0, negative numbers address the end of the list (-1 is the last).

       -af-clr
              Completely empties the filter list.

       Available filters are:

       resample[=srate[:sloppy[:type]]]
              Changes  the  sample rate of the audio stream.  Can be used if you have a fixed frequency sound card or if you are stuck with an old
              sound card that is only capable of max 44.1kHz.  This filter is automatically enabled if necessary.  It only supports 16-bit integer
              and float in native-endian format as input.
              NOTE: With MEncoder, you need to also use -srate <srate>.
                 <srate>
                      output  sample  frequency in Hz.  The valid range for this parameter is 8000 to 192000.  If the input and output sample fre‐
                      quency are the same or if this parameter is omitted the filter is automatically unloaded.  A high sample frequency  normally
                      improves the audio quality, especially when used in combination with other filters.
                 <sloppy>
                      Allow  (1) or disallow (0) the output frequency to differ slightly from the frequency given by <srate> (default: 1).  Can be
                      used if the startup of the playback is extremely slow.
                 <type>
                      Select which resampling method to use.
                         0: linear interpolation (fast, poor quality especially when upsampling)
                         1: polyphase filterbank and integer processing
                         2: polyphase filterbank and floating point processing (slow, best quality)

              EXAMPLE:
                 mplayer -af resample=44100:0:0
                      would set the output frequency of the resample filter to 44100Hz using exact output frequency scaling and linear  interpola‐
                      tion.

       lavcresample[=srate[:length[:linear[:count[:cutoff]]]]]
              Changes the sample rate of the audio stream to an integer <srate> in Hz.  It only supports the 16-bit native-endian format.
              NOTE: With MEncoder, you need to also use -srate <srate>.
                 <srate>
                      the output sample rate
                 <length>
                      length of the filter with respect to the lower sampling rate (default: 16)
                 <linear>
                      if 1 then filters will be linearly interpolated between polyphase entries
                 <count>
                      log2 of the number of polyphase entries (..., 10->1024, 11->2048, 12->4096, ...)  (default: 10->1024)
                 <cutoff>
                      cutoff frequency (0.0-1.0), default set depending upon filter length

       lavcac3enc[=tospdif[:bitrate[:minchn]]]
              Encode  multi-channel  audio  to  AC-3 at runtime using libavcodec.  Supports 16-bit native-endian input format, maximum 6 channels.
              The output is big-endian when outputting a raw AC-3 stream, native-endian when outputting to S/PDIF.  The output sample rate of this
              filter is same with the input sample rate.  When input sample rate is 48kHz, 44.1kHz, or 32kHz, this filter directly use it.  Other‐
              wise a resampling filter is auto-inserted before this filter to make the input and output sample rate be 48kHz.  You need to specify
              '-channels N' to make the decoder decode audio into N-channel, then the filter can encode the N-channel input to AC-3.
                 <tospdif>
                      Output raw AC-3 stream if zero or not set, output to S/PDIF for passthrough when <tospdif> is set non-zero.
                 <bitrate>
                      The  bitrate  to encode the AC-3 stream.  Set it to either 384 or 384000 to get 384kbits.  Valid values: 32, 40, 48, 56, 64,
                      80, 96, 112, 128, 160, 192, 224, 256,
                                    320, 384, 448, 512, 576, 640 Default bitrate is based on the input channel number: 1ch: 96,  2ch:  192,   3ch:
                      224,  4ch: 384,  5ch: 448,  6ch: 448
                 <minchn>
                      If the input channel number is less than <minchn>, the filter will detach itself (default: 5).

       sweep[=speed]
              Produces a sine sweep.
                 <0.0-1.0>
                      Sine function delta, use very low values to hear the sweep.

       sinesuppress[=freq:decay]
              Remove  a sine at the specified frequency.  Useful to get rid of the 50/60Hz noise on low quality audio equipment.  It probably only
              works on mono input.
                 <freq>
                      The frequency of the sine which should be removed (in Hz) (default: 50)
                 <decay>
                      Controls the adaptivity (a larger value will make the filter adapt to amplitude and phase changes quicker, a  smaller  value
                      will make the adaptation slower) (default: 0.0001).  Reasonable values are around 0.001.

       bs2b[=option1:option2:...]
              Bauer  stereophonic to binaural transformation using libbs2b.  Improves the headphone listening experience by making the sound simi‐
              lar to that from loudspeakers, allowing each ear to hear both channels and taking into account the distance difference and the  head
              shadowing effect.  It is applicable only to 2 channel audio.
                 fcut=<300-1000>
                      Set cut frequency in Hz.
                 feed=<10-150>
                      Set feed level for low frequencies in 0.1*dB.
                 profile=<value>
                      Several profiles are available for convenience:
                           default
                                will be used if nothing else was specified (fcut=700, feed=45)
                           cmoy
                                Chu Moy circuit implementation (fcut=700, feed=60)
                           jmeier
                                Jan Meier circuit implementation (fcut=650, feed=95)

              If fcut or feed options are specified together with a profile, they will be applied on top of the selected profile.

       hrtf[=flag]
              Head-related  transfer  function:  Converts  multichannel audio to 2 channel output for headphones, preserving the spatiality of the
              sound.

              Flag  Meaning
              m     matrix decoding of the rear channel
              s     2-channel matrix decoding
              0     no matrix decoding (default)

       equalizer=[g1:g2:g3:...:g10]
              10 octave band graphic equalizer, implemented using 10 IIR band pass filters.  This means that it works regardless of what  type  of
              audio is being played back.  The center frequencies for the 10 bands are:

              No. frequency
              0    31.25 Hz
              1    62.50 Hz
              2   125.00 Hz
              3   250.00 Hz
              4   500.00 Hz
              5    1.00 kHz
              6    2.00 kHz
              7    4.00 kHz
              8    8.00 kHz
              9   16.00 kHz

              If  the  sample  rate of the sound being played is lower than the center frequency for a frequency band, then that band will be dis‐
              abled.  A known bug with this filter is that the characteristics for the uppermost band are not completely symmetric if  the  sample
              rate  is  close  to the center frequency of that band.  This problem can be worked around by upsampling the sound using the resample
              filter before it reaches this filter.
                 <g1>:<g2>:<g3>:...:<g10>
                      floating point numbers representing the gain in dB for each frequency band (-12-12)

              EXAMPLE:
                 mplayer -af equalizer=11:11:10:5:0:-12:0:5:12:12 media.avi
                      Would amplify the sound in the upper and lower frequency region while canceling it almost completely around 1kHz.

       channels=nch[:nr:from1:to1:from2:to2:from3:to3:...]
              Can be used for adding, removing, routing and copying audio channels.  If only <nch> is given the default routing is used, it  works
              as  follows: If the number of output channels is bigger than the number of input channels empty channels are inserted (except mixing
              from mono to stereo, then the mono channel is repeated in both of the output channels).  If the number of output channels is smaller
              than the number of input channels the exceeding channels are truncated.
                 <nch>
                      number of output channels (1-8)
                 <nr>
                      number of routes (1-8)
                 <from1:to1:from2:to2:from3:to3:...>
                      Pairs of numbers between 0 and 7 that define where to route each channel.

              EXAMPLE:
                 mplayer -af channels=4:4:0:1:1:0:2:2:3:3 media.avi
                      Would change the number of channels to 4 and set up 4 routes that swap channel 0 and channel 1 and leave channel 2 and 3 in‐
                      tact.  Observe that if media containing two channels was played back, channels 2 and 3 would contain silence  but  0  and  1
                      would still be swapped.
                 mplayer -af channels=6:4:0:0:0:1:0:2:0:3 media.avi
                      Would  change  the number of channels to 6 and set up 4 routes that copy channel 0 to channels 0 to 3.  Channel 4 and 5 will
                      contain silence.

       format[=format] (also see -format)
              Convert between different sample formats.  Automatically enabled when needed by the sound card or another filter.
                 <format>
                      Sets the desired format.  The general form is 'sbe', where 's' denotes the sign (either 's' for signed or 'u' for unsigned),
                      'b' denotes the number of bits per sample (16, 24 or 32) and 'e' denotes the endianness ('le' means little-endian, 'be' big-
                      endian and 'ne' the endianness of the computer MPlayer is running on).  Valid values (amongst others) are: 's16le',  'u32be'
                      and 'u24ne'.  Exceptions to this rule that are also valid format specifiers: u8, s8, floatle, floatbe, floatne, mulaw, alaw,
                      mpeg2, ac3 and imaadpcm.

       volume[=v[:sc]]
              Implements software volume control.  Use this filter with caution since it can reduce the signal to noise ratio of  the  sound.   In
              most cases it is best to set the level for the PCM sound to max, leave this filter out and control the output level to your speakers
              with the master volume control of the mixer.  In case your sound card has a digital PCM mixer instead of an analog one, and you hear
              distortion,  use  the  MASTER mixer instead.  If there is an external amplifier connected to the computer (this is almost always the
              case), the noise level can be minimized by adjusting the master level and the volume knob on the amplifier until the  hissing  noise
              in the background is gone.
              This  filter  has  a second feature: It measures the overall maximum sound level and prints out that level when MPlayer exits.  This
              volume estimate can be used for setting the sound level in MEncoder such that the maximum dynamic range is utilized.   This  feature
              currently only works with floating-point data, use e.g. -af-adv force=5, or use -af stats.
              NOTE: This filter is not reentrant and can therefore only be enabled once for every audio stream.
                 <v>
                      Sets the desired gain in dB for all channels in the stream from -200dB to +60dB, where -200dB mutes the sound completely and
                      +60dB equals a gain of 1000 (default: 0).
                 <sc>
                      Turns soft clipping on (1) or off (0).  Soft-clipping can make the sound more smooth if very high volume  levels  are  used.
                      Enable this option if the dynamic range of the loudspeakers is very low.
                      WARNING: This feature creates distortion and should be considered a last resort.

              EXAMPLE:
                 mplayer -af volume=10.1:0 media.avi
                      Would amplify the sound by 10.1dB and hard-clip if the sound level is too high.

       pan=n[:L00:L01:L02:...L10:L11:L12:...Ln0:Ln1:Ln2:...]
              Mixes  channels  arbitrarily.  Basically a combination of the volume and the channels filter that can be used to down-mix many chan‐
              nels to only a few, e.g. stereo to mono or vary the "width" of the center speaker in a surround sound system.  This filter  is  hard
              to use, and will require some tinkering before the desired result is obtained.  The number of options for this filter depends on the
              number of output channels.  An example how to downmix a six-channel file to two channels with this filter can be found in the  exam‐
              ples section near the end.
                 <n>
                      number of output channels (1-8)
                 <Lij>
                      How  much  of input channel i is mixed into output channel j (0-1).  So in principle you first have n numbers saying what to
                      do with the first input channel, then n numbers that act on the second input channel etc.  If you do not specify any numbers
                      for some input channels, 0 is assumed.

              EXAMPLE:
                 mplayer -af pan=1:0.5:0.5 media.avi
                      Would down-mix from stereo to mono.
                 mplayer -af pan=3:1:0:0.5:0:1:0.5 media.avi
                      Would  give 3 channel output leaving channels 0 and 1 intact, and mix channels 0 and 1 into output channel 2 (which could be
                      sent to a subwoofer for example).

       sub[=fc:ch]
              Adds a subwoofer channel to the audio stream.  The audio data used for creating the subwoofer channel is an average of the sound  in
              channel 0 and channel 1.  The resulting sound is then low-pass filtered by a 4th order Butterworth filter with a default cutoff fre‐
              quency of 60Hz and added to a separate channel in the audio stream.
              Warning: Disable this filter when you are playing DVDs with Dolby Digital 5.1 sound, otherwise this filter will disrupt the sound to
              the subwoofer.
                 <fc>
                      cutoff  frequency  in  Hz for the low-pass filter (20Hz to 300Hz) (default: 60Hz) For the best result try setting the cutoff
                      frequency as low as possible.  This will improve the stereo or surround sound experience.
                 <ch>
                      Determines the channel number in which to insert the sub-channel audio.  Channel number can be between 0 and 7 (default: 5).
                      Observe that the number of channels will automatically be increased to <ch> if necessary.

              EXAMPLE:
                 mplayer -af sub=100:4 -channels 5 media.avi
                      Would add a sub-woofer channel with a cutoff frequency of 100Hz to output channel 4.

       center
              Creates  a  center  channel  from  the front channels.  May currently be low quality as it does not implement a high-pass filter for
              proper extraction yet, but averages and halves the channels instead.
                 <ch>
                      Determines the channel number in which to insert the center channel.  Channel number can be between 0 and  7  (default:  5).
                      Observe that the number of channels will automatically be increased to <ch> if necessary.

       surround[=delay]
              Decoder  for  matrix encoded surround sound like Dolby Surround.  Many files with 2 channel audio actually contain matrixed surround
              sound.  Requires a sound card supporting at least 4 channels.
                 <delay>
                      delay time in ms for the rear speakers (0 to 1000) (default: 20) This delay should be set as follows: If d1 is the  distance
                      from  the  listening position to the front speakers and d2 is the distance from the listening position to the rear speakers,
                      then the delay should be set to 15ms if d1 <= d2 and to 15 + 5*(d1-d2) if d1 > d2.

              EXAMPLE:
                 mplayer -af surround=15 -channels 4 media.avi
                      Would add surround sound decoding with 15ms delay for the sound to the rear speakers.

       delay[=ch1:ch2:...]
              Delays the sound to the loudspeakers such that the sound from the different channels arrives at the listening position simultaneous‐
              ly.  It is only useful if you have more than 2 loudspeakers.
                 ch1,ch2,...
                      The delay in ms that should be imposed on each channel (floating point number between 0 and 1000).

              To calculate the required delay for the different channels do as follows:

              1. Measure the distance to the loudspeakers in meters in relation to your listening position, giving you the distances s1 to s5 (for
                 a 5.1 system).  There is no point in compensating for the subwoofer (you will not hear the difference anyway).

              2. Subtract the distances s1 to s5 from the maximum distance, i.e. s[i] = max(s) - s[i]; i = 1...5.

              3. Calculate the required delays in ms as d[i] = 1000*s[i]/342; i = 1...5.

              EXAMPLE:
                 mplayer -af delay=10.5:10.5:0:0:7:0 media.avi
                      Would delay front left and right by 10.5ms, the two rear channels and the sub by 0ms and the center channel by 7ms.

       export[=mmapped_file[:nsamples]]
              Exports the incoming signal to other processes using memory mapping (mmap()).  Memory mapped areas contain a header:

              int nch                      /*number of channels*/
              int size                     /*buffer size*/
              unsigned long long counter   /*Used to keep sync, updated every
                                             time new data is exported.*/

              The rest is payload (non-interleaved) 16 bit data.
                 <mmapped_file>
                      file to map data to (default: ~/.mplayer/mplayer-af_export)
                 <nsamples>
                      number of samples per channel (default: 512)

              EXAMPLE:
                 mplayer -af export=/tmp/mplayer-af_export:1024 media.avi
                      Would export 1024 samples per channel to '/tmp/mplayer-af_export'.

       extrastereo[=mul]
              (Linearly) increases the difference between left and right channels which adds some sort of "live" effect to playback.
                 <mul>
                      Sets the difference coefficient (default: 2.5).  0.0 means mono sound (average of both channels), with 1.0 sound will be un‐
                      changed, with -1.0 left and right channels will be swapped.

       volnorm[=method:target]
              Maximizes the volume without distorting the sound.
                 <method>
                      Sets the used method.
                         1: Use a single sample to smooth the variations via the standard weighted mean over past samples (default).
                         2: Use several samples to smooth the variations via the standard weighted mean over past samples.

                 <target>
                      Sets the target amplitude as a fraction of the maximum for the sample type (default: 0.25).

       ladspa=file:label[:controls...]
              Load  a LADSPA (Linux Audio Developer's Simple Plugin API) plugin.  This filter is reentrant, so multiple LADSPA plugins can be used
              at once.
                 <file>
                      Specifies the LADSPA plugin library file.  If LADSPA_PATH is set, it searches for the specified file.  If it is not set, you
                      must supply a fully specified pathname.
                 <label>
                      Specifies the filter within the library.  Some libraries contain only one filter, but others contain many of them.  Entering
                      'help' here, will list all available filters within the specified library, which eliminates the use  of  'listplugins'  from
                      the LADSPA SDK.
                 <controls>
                      Controls are zero or more floating point values that determine the behavior of the loaded plugin (for example delay, thresh‐
                      old or gain).  In verbose mode (add -v to the MPlayer command line), all available  controls  and  their  valid  ranges  are
                      printed.  This eliminates the use of 'analyseplugin' from the LADSPA SDK.

       comp
              Compressor/expander  filter  usable  for  microphone input.  Prevents artifacts on very loud sound and raises the volume on very low
              sound.  This filter is untested, maybe even unusable.

       gate
              Noise gate filter similar to the comp audio filter.  This filter is untested, maybe even unusable.

       karaoke
              Simple voice removal filter exploiting the fact that voice is usually recorded with mono gear and later 'center' mixed onto the  fi‐
              nal  audio  stream.  Beware that this filter will turn your signal into mono.  Works well for 2 channel tracks; do not bother trying
              it on anything but 2 channel stereo.

       scaletempo[=option1:option2:...]
              Scales audio tempo without altering pitch, optionally synced to playback speed (default).
              This works by playing ´stride´ ms of audio at normal speed then consuming ´stride*scale´ ms of input audio.  It pieces  the  strides
              together  by  blending  ´overlap´%  of  stride with audio following the previous stride.  It optionally performs a short statistical
              analysis on the next ´search´ ms of audio to determine the best overlap position.
                 scale=<amount>
                      Nominal amount to scale tempo.  Scales this amount in addition to speed.  (default: 1.0)
                 stride=<amount>
                      Length in milliseconds to output each stride.  Too high of value will cause noticeable skips at high scale  amounts  and  an
                      echo at low scale amounts.  Very low values will alter pitch.  Increasing improves performance.  (default: 60)
                 overlap=<percent>
                      Percentage of stride to overlap.  Decreasing improves performance.  (default: .20)
                 search=<amount>
                      Length  in milliseconds to search for best overlap position.  Decreasing improves performance greatly.  On slow systems, you
                      will probably want to set this very low.  (default: 14)
                 speed=<tempo|pitch|both|none>
                      Set response to speed change.
                         tempo
                              Scale tempo in sync with speed (default).
                         pitch
                              Reverses effect of filter.  Scales pitch without altering tempo.   Add  ´[  speed_mult  0.9438743126816935´  and  ´]
                              speed_mult 1.059463094352953´ to your input.conf to step by musical semi-tones.  WARNING: Loses sync with video.
                         both Scale both tempo and pitch.
                         none Ignore speed changes.

              EXAMPLE:
                 mplayer -af scaletempo -speed 1.2 media.ogg
                      Would playback media at 1.2x normal speed, with audio at normal pitch.  Changing playback speed, would change audio tempo to
                      match.
                 mplayer -af scaletempo=scale=1.2:speed=none -speed 1.2 media.ogg
                      Would playback media at 1.2x normal speed, with audio at normal pitch, but changing playback speed has no  effect  on  audio
                      tempo.
                 mplayer -af scaletempo=stride=30:overlap=.50:search=10 media.ogg
                      Would tweak the quality and performace parameters.
                 mplayer -af format=floatne,scaletempo media.ogg
                      Would make scaletempo use float code.  Maybe faster on some platforms.
                 mplayer -af scaletempo=scale=1.2:speed=pitch audio.ogg
                      Would  playback  audio  file at 1.2x normal speed, with audio at normal pitch.  Changing playback speed, would change pitch,
                      leaving audio tempo at 1.2x.

       stats
              Collects and prints statistics about the audio stream, especially the volume.  These statistics are especially intended to help  ad‐
              justing the volume while avoiding clipping.  The volumes are printed in dB and compatible with the volume audio filter, they are al‐
              ways rounded towards -0dB.

              The 'n_samples' field is the total number of samples seen by the filter.  The 'mean_volume' field is  the  root  mean  square.   The
              'max_volume'  field  is  exactly  what  it  says.   The 'histogram_Xdb' fields count how many samples were at -XdB, for X just below
              max_volume.

              For example, if max_volume is -7dB and histogram_7dB is 19, 'volume=7' will not cause clipping and 'volume=8' will cause clipping on
              exactly 19 samples.

VIDEO FILTERS
       Video filters allow you to modify the video stream and its properties.  The syntax is:

       -vf <filter1[=parameter1:parameter2:...],filter2,...>
              Setup a chain of video filters.

       Many  parameters are optional and set to default values if omitted.  To explicitly use a default value set a parameter to '-1'.  Parameters
       w:h means width x height in pixels, x:y means x;y position counted from the upper left corner of the bigger image.
       NOTE: To get a full list of available video filters, see -vf help.

       Video filters are managed in lists.  There are a few commands to manage the filter list.

       -vf-add <filter1[,filter2,...]>
              Appends the filters given as arguments to the filter list.

       -vf-pre <filter1[,filter2,...]>
              Prepends the filters given as arguments to the filter list.

       -vf-del <index1[,index2,...]>
              Deletes the filters at the given indexes.  Index numbers start at 0, negative numbers address the end of the list (-1 is the last).

       -vf-clr
              Completely empties the filter list.

       With filters that support it, you can access parameters by their name.

       -vf <filter>=help
              Prints the parameter names and parameter value ranges for a particular filter.

       -vf <filter=named_parameter1=value1[:named_parameter2=value2:...]>
              Sets a named parameter to the given value.  Use on and off or yes and no to set flag parameters.

       Available filters are:

       crop[=w:h:x:y]
              Crops the given part of the image and discards the rest.  Useful to remove black bands from widescreen movies.
                 <w>,<h>
                      Cropped width and height, defaults to original width and height.
                 <x>,<y>
                      Position of the cropped picture, defaults to center.

       cropdetect[=limit:round[:reset]]
              Calculates necessary cropping parameters and prints the recommended parameters to stdout.
                 <limit>
                      Threshold, which can be optionally specified from nothing (0) to everything (255) (default: 24).
                 <round>
                      Value which the width/height should be divisible by (default: 16).  The offset  is  automatically  adjusted  to  center  the
                      video.  Use 2 to get only even dimensions (needed for 4:2:2 video).  16 is best when encoding to most video codecs.
                 <reset>
                      Counter  that  determines  after  how many frames cropdetect will reset the previously detected largest video area and start
                      over to detect the current optimal crop area (default: 0).  This can be useful when channel logos distort the video area.  0
                      indicates never reset and return the largest area encountered during playback.

       rectangle[=w:h:x:y]
              Draws a rectangle of the requested width and height at the specified coordinates over the image and prints current rectangle parame‐
              ters to the console.  This can be used to find optimal cropping parameters.  If you bind the input.conf directive 'change_rectangle'
              to keystrokes, you can move and resize the rectangle on the fly.
                 <w>,<h>
                      width and height (default: -1, maximum possible width where boundaries are still visible.)
                 <x>,<y>
                      top left corner position (default: -1, uppermost leftmost)

       expand[=w:h:x:y:o:a:r]
              Expands  (not  scales)  movie  resolution  to the given value and places the unscaled original at coordinates x, y.  Can be used for
              placing subtitles/OSD in the resulting black bands.

                 <w>,<h>
                      Expanded width,height (default: original width,height).  Negative values for w and h are treated as offsets to the  original
                      size.

                      EXAMPLE:
                           expand=0:-50:0:0
                                  Adds a 50 pixel border to the bottom of the picture.

                 <x>,<y>
                      position of original image on the expanded image (default: center)

                 <o>
                      OSD/subtitle rendering
                         0: disable (default)
                         1: enable

                 <a>
                      Expands to fit an aspect instead of a resolution (default: 0).

                      EXAMPLE:
                           expand=800:::::4/3
                                  Expands to 800x600, unless the source is higher resolution, in which case it expands to fill a 4/3 aspect.

                 <r>
                      Rounds up to make both width and height divisible by <r> (default: 1).

       flip (also see -flip)
              Flips the image upside down.

       mirror
              Mirrors the image on the Y axis.

       rotate[=<0-7>]
              Rotates the image by 90 degrees and optionally flips it.  For values between 4-7 rotation is only done if the movie geometry is por‐
              trait and not landscape.

                 0    Rotate by 90 degrees clockwise and flip (default).

                 1    Rotate by 90 degrees clockwise.

                 2    Rotate by 90 degrees counterclockwise.

                 3    Rotate by 90 degrees counterclockwise and flip.

       scale[=w:h[:interlaced[:chr_drop[:par[:par2[:presize[:noup[:arnd]]]]]]]]
              Scales the image with the software scaler (slow) and performs a YUV<->RGB colorspace conversion (also see -sws).

                 <w>,<h>
                      scaled width/height (default: original width/height)
                      NOTE: If -zoom is used, and underlying filters (including libvo) are incapable of scaling, it defaults to d_width/d_height!
                          0:   scaled d_width/d_height
                         -1:   original width/height
                         -2:   Calculate w/h using the other dimension and the prescaled aspect ratio.
                         -3:   Calculate w/h using the other dimension and the original aspect ratio.
                         -(n+8): Like -n above, but rounding the dimension to the closest multiple of 16.

                 <interlaced>
                      Toggle interlaced scaling.
                         0: off (default)
                         1: on

                 <chr_drop>
                      chroma skipping
                         0: Use all available input lines for chroma.
                         1: Use only every 2. input line for chroma.
                         2: Use only every 4. input line for chroma.
                         3: Use only every 8. input line for chroma.

                 <par>[:<par2>] (also see -sws)
                      Set some scaling parameters depending on the type of scaler selected with -sws.
                         -sws 2 (bicubic):  B (blurring) and C (ringing)
                         0.00:0.60 default
                         0.00:0.75 VirtualDub's "precise bicubic"
                         0.00:0.50 Catmull-Rom spline
                         0.33:0.33 Mitchell-Netravali spline
                         1.00:0.00 cubic B-spline
                         -sws 7 (gaussian): sharpness (0 (soft) - 100 (sharp))
                         -sws 9 (lanczos):  filter length (1-10)

                 <presize>
                      Scale to preset sizes.
                         qntsc:   352x240 (NTSC quarter screen)
                         qpal:    352x288 (PAL quarter screen)
                         ntsc:    720x480 (standard NTSC)
                         pal:     720x576 (standard PAL)
                         sntsc:   640x480 (square pixel NTSC)
                         spal:    768x576 (square pixel PAL)

                 <noup>
                      Disallow upscaling past the original dimensions.
                         0: Allow upscaling (default).
                         1: Disallow upscaling if one dimension exceeds its original value.
                         2: Disallow upscaling if both dimensions exceed their original values.

                 <arnd>
                      Accurate rounding for the vertical scaler, which may be faster or slower than the default rounding.
                         0: Disable accurate rounding (default).
                         1: Enable accurate rounding.

       dsize[=aspect|w:h:aspect-method:r]
              Changes the intended display size/aspect at an arbitrary point in the filter chain.  Aspect can be given  as  a  fraction  (4/3)  or
              floating  point  number  (1.33).   Alternatively, you may specify the exact display width and height desired.  Note that this filter
              does not do any scaling itself; it just affects what later scalers (software or hardware) will do when auto-scaling to  correct  as‐
              pect.

                 <w>,<h>
                      New display width and height.  Can also be these special values:
                          0:   original display width and height
                         -1:   original video width and height (default)
                         -2:   Calculate w/h using the other dimension and the original display aspect ratio.
                         -3:   Calculate w/h using the other dimension and the original video aspect ratio.

                 EXAMPLE:
                           dsize=800:-2
                                  Specifies a display resolution of 800x600 for a 4/3 aspect video, or 800x450 for a 16/9 aspect video.
                 <aspect-method>
                      Modifies width and height according to original aspect ratios.
                         -1: Ignore original aspect ratio (default).
                          0: Keep display aspect ratio by using <w> and <h> as maximum resolution.
                          1: Keep display aspect ratio by using <w> and <h> as minimum resolution.
                          2: Keep video aspect ratio by using <w> and <h> as maximum resolution.
                          3: Keep video aspect ratio by using <w> and <h> as minimum resolution.

                 EXAMPLE:
                           dsize=800:600:0
                                  Specifies a display resolution of at most 800x600, or smaller, in order to keep aspect.

                 <r>
                      Rounds up to make both width and height divisible by <r> (default: 1).

       yvu9
              Forces software YVU9 to YV12 colorspace conversion.  Deprecated in favor of the software scaler.

       yuvcsp
              Clamps YUV color values to the CCIR 601 range without doing real conversion.

       palette
              RGB/BGR 8 -> 15/16/24/32bpp colorspace conversion using palette.

       format[=fourcc[:outfourcc]]
              Restricts  the  colorspace  for the next filter without doing any conversion.  Use together with the scale filter for a real conver‐
              sion.
              NOTE: For a list of available formats see format=fmt=help.
                 <fourcc>
                      format name like rgb15, bgr24, yv12, etc (default: yuy2)
                 <outfourcc>
                      Format name that should be substituted for the output.  If this is not 100% compatible  with  the  <fourcc>  value  it  will
                      crash.
                      Valid examples:
                      format=rgb24:bgr24 format=yuyv:yuy2
                      Invalid examples (will crash):
                      format=rgb24:yv12

       noformat[=fourcc]
              Restricts the colorspace for the next filter without doing any conversion.  Unlike the format filter, this will allow any colorspace
              except the one you specify.
              NOTE: For a list of available formats see noformat=fmt=help.
                 <fourcc>
                      format name like rgb15, bgr24, yv12, etc (default: yv12)

       pp[=filter1[:option1[:option2...]]/[-]filter2...] (also see -pphelp)
              Enables the specified chain of postprocessing subfilters.  Subfilters must be separated by '/' and can be disabled by  prepending  a
              '-'.   Each  subfilter  and some options have a short and a long name that can be used interchangeably, i.e. dr/dering are the same.
              All subfilters share common options to determine their scope:
                 a/autoq
                      Automatically switch the subfilter off if the CPU is too slow.
                 c/chrom
                      Do chrominance filtering, too (default).
                 y/nochrom
                      Do luminance filtering only (no chrominance).
                 n/noluma
                      Do chrominance filtering only (no luminance).

              NOTE: -pphelp shows a list of available subfilters.

              Available subfilters are

                 hb/hdeblock[:difference[:flatness]]
                      horizontal deblocking filter
                         <difference>: Difference factor where higher values mean more deblocking (default: 32).
                         <flatness>: Flatness threshold where lower values mean more deblocking (default: 39).

                 vb/vdeblock[:difference[:flatness]]
                      vertical deblocking filter
                         <difference>: Difference factor where higher values mean more deblocking (default: 32).
                         <flatness>: Flatness threshold where lower values mean more deblocking (default: 39).

                 ha/hadeblock[:difference[:flatness]]
                      accurate horizontal deblocking filter
                         <difference>: Difference factor where higher values mean more deblocking (default: 32).
                         <flatness>: Flatness threshold where lower values mean more deblocking (default: 39).

                 va/vadeblock[:difference[:flatness]]
                      accurate vertical deblocking filter
                         <difference>: Difference factor where higher values mean more deblocking (default: 32).
                         <flatness>: Flatness threshold where lower values mean more deblocking (default: 39).

                 The horizontal and vertical deblocking filters share the difference and flatness values so you cannot  set  different  horizontal
                 and vertical thresholds.

                 h1/x1hdeblock
                      experimental horizontal deblocking filter

                 v1/x1vdeblock
                      experimental vertical deblocking filter

                 dr/dering
                      deringing filter

                 tn/tmpnoise[:threshold1[:threshold2[:threshold3]]]
                      temporal noise reducer
                         <threshold1>: larger -> stronger filtering
                         <threshold2>: larger -> stronger filtering
                         <threshold3>: larger -> stronger filtering

                 al/autolevels[:f/fullyrange]
                      automatic brightness / contrast correction
                         f/fullyrange: Stretch luminance to (0-255).

                 lb/linblenddeint
                      Linear blend deinterlacing filter that deinterlaces the given block by filtering all lines with a (1 2 1) filter.

                 li/linipoldeint
                      Linear interpolating deinterlacing filter that deinterlaces the given block by linearly interpolating every second line.

                 ci/cubicipoldeint
                      Cubic interpolating deinterlacing filter deinterlaces the given block by cubically interpolating every second line.

                 md/mediandeint
                      Median deinterlacing filter that deinterlaces the given block by applying a median filter to every second line.

                 fd/ffmpegdeint
                      FFmpeg deinterlacing filter that deinterlaces the given block by filtering every second line with a (-1 4 2 4 -1) filter.

                 l5/lowpass5
                      Vertically  applied FIR lowpass deinterlacing filter that deinterlaces the given block by filtering all lines with a (-1 2 6
                      2 -1) filter.

                 fq/forceQuant[:quantizer]
                      Overrides the quantizer table from the input with the constant quantizer you specify.
                         <quantizer>: quantizer to use

                 de/default
                      default pp filter combination (hb:a,vb:a,dr:a)

                 fa/fast
                      fast pp filter combination (h1:a,v1:a,dr:a)

                 ac
                      high quality pp filter combination (ha:a:128:7,va:a,dr:a)

              EXAMPLE:
                 -vf pp=hb/vb/dr/al
                      horizontal and vertical deblocking, deringing and automatic brightness/contrast
                 -vf pp=de/-al
                      default filters without brightness/contrast correction
                 -vf pp=default/tmpnoise:1:2:3
                      Enable default filters & temporal denoiser.
                 -vf pp=hb:y/vb:a
                      Horizontal deblocking on luminance only, and switch vertical deblocking on or off automatically depending on  available  CPU
                      time.

       spp[=quality[:qp[:mode]]]
              Simple  postprocessing  filter  that  compresses  and  decompresses the image at several (or - in the case of quality level 6 - all)
              shifts and averages the results.

                 <quality>
                      0-6 (default: 3)

                 <qp>
                      Force quantization parameter (default: 0, use QP from video).

                 <mode>
                      0: hard thresholding (default)
                      1: soft thresholding (better deringing, but blurrier)
                      4: like 0, but also use B-frames' QP (may cause flicker)
                      5: like 1, but also use B-frames' QP (may cause flicker)

       uspp[=quality[:qp]]
              Ultra simple & slow postprocessing filter that compresses and decompresses the image at several (or - in the case of quality level 8
              -  all) shifts and averages the results.  The way this differs from the behavior of spp is that uspp actually encodes & decodes each
              case with libavcodec Snow, whereas spp uses a simplified intra only 8x8 DCT similar to MJPEG.

                 <quality>
                      0-8 (default: 3)

                 <qp>
                      Force quantization parameter (default: 0, use QP from video).

       fspp[=quality[:qp[:strength[:bframes]]]]
              faster version of the simple postprocessing filter

                 <quality>
                      4-5 (equivalent to spp; default: 4)

                 <qp>
                      Force quantization parameter (default: 0, use QP from video).

                 <-15-32>
                      Filter strength, lower values mean more details but also more artifacts, while higher values make the image smoother but al‐
                      so blurrier (default: 0 - PSNR optimal).

                 <bframes>
                      0: do not use QP from B-frames (default)
                      1: use QP from B-frames too (may cause flicker)

       pp7[=qp[:mode]]
              Variant of the spp filter, similar to spp=6 with 7 point DCT where only the center sample is used after IDCT.

                 <qp>
                      Force quantization parameter (default: 0, use QP from video).

                 <mode>
                      0: hard thresholding
                      1: soft thresholding (better deringing, but blurrier)
                      2: medium thresholding (default, good results)

       qp=equation
              quantization parameter (QP) change filter

                 <equation>
                      some equation like "2+2*sin(PI*qp)"

       geq=equation
              generic equation change filter

                 <equation>
                      Some equation, e.g.  'p(W-X\,Y)' to flip the image horizontally.  You can use whitespace to make the equation more readable.
                      There are a couple of constants that can be used in the equation:
                         PI: the number pi
                         E: the number e
                         X / Y: the coordinates of the current sample
                         W / H: width and height of the image
                         SW / SH: width/height scale depending on the currently filtered plane, e.g. 1,1 and 0.5,0.5 for YUV 4:2:0.
                         p(x,y): returns the value of the pixel at location x/y of the current plane.

       test
              Generate various test patterns.

       rgbtest[=width:height]
              Generate an RGB test pattern useful for detecting RGB vs BGR issues.  You should see a red, green and blue stripe from top  to  bot‐
              tom.

                 <width>
                      Desired width of generated image (default: 0).  0 means width of input image.

                 <height>
                      Desired height of generated image (default: 0).  0 means height of input image.

       lavc[=quality:fps]
              Fast software YV12 to MPEG-1 conversion with libavcodec for use with DVB/DXR3/IVTV/V4L2.

                 <quality>
                      1-31: fixed qscale
                      32-:  fixed bitrate in kbits

                 <fps>
                      force output fps (float value) (default: 0, autodetect based on height)

       dvbscale[=aspect]
              Set  up optimal scaling for DVB cards, scaling the x axis in hardware and calculating the y axis scaling in software to keep aspect.
              Only useful together with expand and scale.

                 <aspect>
                      Control aspect ratio, calculate as DVB_HEIGHT*ASPECTRATIO (default: 576*4/3=768), set it to 576*(16/9)=1024 for a 16:9 TV.

              EXAMPLE:
                 -vf dvbscale,scale=-1:0,expand=-1:576:-1:-1:1,lavc
                      FIXME: Explain what this does.

       noise[=luma[u][t|a][h][p]:chroma[u][t|a][h][p]]
              Adds noise.
                 <0-100>
                      luma noise
                 <0-100>
                      chroma noise
                 u    uniform noise (gaussian otherwise)
                 t    temporal noise (noise pattern changes between frames)
                 a    averaged temporal noise (smoother, but a lot slower)
                 h    high quality (slightly better looking, slightly slower)
                 p    mix random noise with a (semi)regular pattern

       denoise3d[=luma_spatial:chroma_spatial:luma_tmp:chroma_tmp]
              This filter aims to reduce image noise producing smooth images and making still images really still (This should  enhance  compress‐
              ibility.).
                 <luma_spatial>
                      spatial luma strength (default: 4)
                 <chroma_spatial>
                      spatial chroma strength (default: 3)
                 <luma_tmp>
                      luma temporal strength (default: 6)
                 <chroma_tmp>
                      chroma temporal strength (default: luma_tmp*chroma_spatial/luma_spatial)

       hqdn3d[=luma_spatial:chroma_spatial:luma_tmp:chroma_tmp]
              High precision/quality version of the denoise3d filter.  Parameters and usage are the same.

       ow[=depth[:luma_strength[:chroma_strength]]]
              Overcomplete Wavelet denoiser.
                 <depth>
                      Larger depth values will denoise lower frequency components more, but slow down filtering (default: 8).
                 <luma_strength>
                      luma strength (default: 1.0)
                 <chroma_strength>
                      chroma strength (default: 1.0)

       eq[=brightness:contrast] (OBSOLETE)
              Software  equalizer with interactive controls just like the hardware equalizer, for cards/drivers that do not support brightness and
              contrast controls in hardware.  Might also be useful with MEncoder, either for fixing poorly captured movies, or for slightly reduc‐
              ing contrast to mask artifacts and get by with lower bitrates.
                 <-100-100>
                      initial brightness
                 <-100-100>
                      initial contrast

       eq2[=gamma:contrast:brightness:saturation:rg:gg:bg:weight]
              Alternative  software  equalizer that uses lookup tables (very slow), allowing gamma correction in addition to simple brightness and
              contrast adjustment.  Note that it uses the same MMX optimized code as -vf eq if all gamma values are 1.0.  The parameters are given
              as floating point values.
                 <0.1-10>
                      initial gamma value (default: 1.0)
                 <-2-2>
                      initial contrast, where negative values result in a negative image (default: 1.0)
                 <-1-1>
                      initial brightness (default: 0.0)
                 <0-3>
                      initial saturation (default: 1.0)
                 <0.1-10>
                      gamma value for the red component (default: 1.0)
                 <0.1-10>
                      gamma value for the green component (default: 1.0)
                 <0.1-10>
                      gamma value for the blue component (default: 1.0)
                 <0-1>
                      The  weight parameter can be used to reduce the effect of a high gamma value on bright image areas, e.g. keep them from get‐
                      ting overamplified and just plain white.  A value of 0.0 turns the gamma correction all the way down while 1.0 leaves it  at
                      its full strength (default: 1.0).

       hue[=hue:saturation]
              Software equalizer with interactive controls just like the hardware equalizer, for cards/drivers that do not support hue and satura‐
              tion controls in hardware.
                 <-180-180>
                      initial hue (default: 0.0)
                 <-100-100>
                      initial saturation, where negative values result in a negative chroma (default: 1.0)

       halfpack[=f]
              Convert planar YUV 4:2:0 to half-height packed 4:2:2, downsampling luma but keeping all chroma samples.  Useful for output  to  low-
              resolution display devices when hardware downscaling is poor quality or is not available.  Can also be used as a primitive luma-only
              deinterlacer with very low CPU usage.
                 <f>
                      By default, halfpack averages pairs of lines when downsampling.  Any value different from 0 or 1 gives the default  (averag‐
                      ing) behavior.
                         0: Only use even lines when downsampling.
                         1: Only use odd lines when downsampling.

       ilpack[=mode]
              When  interlaced  video is stored in YUV 4:2:0 formats, chroma interlacing does not line up properly due to vertical downsampling of
              the chroma channels.  This filter packs the planar 4:2:0 data into YUY2 (4:2:2) format with the chroma lines in their  proper  loca‐
              tions, so that in any given scanline, the luma and chroma data both come from the same field.
                 <mode>
                      Select the sampling mode.
                         0: nearest-neighbor sampling, fast but incorrect
                         1: linear interpolation (default)

       harddup
              Only useful with MEncoder.  If harddup is used when encoding, it will force duplicate frames to be encoded in the output.  This uses
              slightly more space, but is necessary for output to MPEG files or if you plan to demux and remux the video  stream  after  encoding.
              Should be placed at or near the end of the filter chain unless you have a good reason to do otherwise.

       softskip
              Only useful with MEncoder.  Softskip moves the frame skipping (dropping) step of encoding from before the filter chain to some point
              during the filter chain.  This allows filters which need to see all frames (inverse telecine, temporal denoising, etc.) to  function
              properly.  Should be placed after the filters which need to see all frames and before any subsequent filters that are CPU-intensive.

       decimate[=max:hi:lo:frac]
              Drops  frames  that  do not differ greatly from the previous frame in order to reduce framerate.  The main use of this filter is for
              very-low-bitrate encoding (e.g. streaming over dialup modem), but it could in theory be used for fixing movies  that  were  inverse-
              telecined incorrectly.
                 <max>
                      Sets  the  maximum  number of consecutive frames which can be dropped (if positive), or the minimum interval between dropped
                      frames (if negative).
                 <hi>,<lo>,<frac>
                      A frame is a candidate for dropping if no 8x8 region differs by more than a threshold of <hi>, and if not more  than  <frac>
                      portion  (1  meaning  the  whole image) differs by more than a threshold of <lo>.  Values of <hi> and <lo> are for 8x8 pixel
                      blocks and represent actual pixel value differences, so a threshold of 64 corresponds to 1 unit of difference for each  pix‐
                      el, or the same spread out differently over the block.

       dint[=sense:level]
              The drop-deinterlace (dint) filter detects and drops the first from a set of interlaced video frames.
                 <0.0-1.0>
                      relative difference between neighboring pixels (default: 0.1)
                 <0.0-1.0>
                      What part of the image has to be detected as interlaced to drop the frame (default: 0.15).

       lavcdeint (OBSOLETE)
              FFmpeg deinterlacing filter, same as -vf pp=fd

       lavfi=filtergraph
              FFmpeg  libavfilter  wrapper.   filtergraph  defines  a  whole libavfilter graph with one input and one output.  See http://www.ffm‐
              peg.org/libavfilter.html#SEC4 for details.

              As a special case, if filtergraph is $word then the value of the word environment variable is used; this is necessary if commas  are
              present in the graph description, as mplayer uses them as a delimiter between filters.

              NOTE: This filter is considered experimental, it may interact strangely with other filters.

              EXAMPLE:
              overlay="movie=$small_video, scale=160:120 [ca]; [in] [ca] overlay=16:8" mplayer -vf lavfi='$overlay' $big_video

       kerndeint[=thresh[:map[:order[:sharp[:twoway]]]]]
              Donald Graft's adaptive kernel deinterlacer.  Deinterlaces parts of a video if a configurable threshold is exceeded.
                 <0-255>
                      threshold (default: 10)
                 <map>
                         0: Ignore pixels exceeding the threshold (default).
                         1: Paint pixels exceeding the threshold white.

                 <order>
                         0: Leave fields alone (default).
                         1: Swap fields.

                 <sharp>
                         0: Disable additional sharpening (default).
                         1: Enable additional sharpening.

                 <twoway>
                         0: Disable twoway sharpening (default).
                         1: Enable twoway sharpening.

       unsharp[=l|cWxH:amount[:l|cWxH:amount]]
              unsharp mask / gaussian blur

                 l
                      Apply effect on luma component.

                 c
                      Apply effect on chroma components.

                 <width>x<height>
                      width and height of the matrix, odd sized in both directions (min = 3x3, max = 13x11 or 11x13, usually something between 3x3
                      and 7x7)

                 amount
                      Relative amount of sharpness/blur to add to the image (a sane range should be -1.5-1.5).
                         <0: blur
                         >0: sharpen

       swapuv
              Swap U & V plane.

       il[=d|i][s][:[d|i][s]]
              (De)interleaves lines.  The goal of this filter is to add the ability to process interlaced images pre-field  without  deinterlacing
              them.  You can filter your interlaced DVD and play it on a TV without breaking the interlacing.  While deinterlacing (with the post‐
              processing filter) removes interlacing permanently (by smoothing, averaging, etc) deinterleaving splits the frame into 2 fields  (so
              called half pictures), so you can process (filter) them independently and then re-interleave them.
                 d    deinterleave (placing one above the other)
                 i    interleave
                 s    swap fields (exchange even & odd lines)

       fil[=i|d]
              (De)interleaves  lines.  This filter is very similar to the il filter but much faster, the main disadvantage is that it does not al‐
              ways work.  Especially if combined with other filters it may produce randomly messed up images, so be happy if it works but  do  not
              complain if it does not for your combination of filters.
                 d    Deinterleave fields, placing them side by side.
                 i    Interleave fields again (reversing the effect of fil=d).

       field[=n]
              Extracts  a single field from an interlaced image using stride arithmetic to avoid wasting CPU time.  The optional argument n speci‐
              fies whether to extract the even or the odd field (depending on whether n is even or odd).

       detc[=var1=value1:var2=value2:...]
              Attempts to reverse the 'telecine' process to recover a clean, non-interlaced stream at film framerate.  This was the first and most
              primitive inverse telecine filter to be added to MPlayer/MEncoder.  It works by latching onto the telecine 3:2 pattern and following
              it as long as possible.  This makes it suitable for perfectly-telecined material, even in the presence of a fair  degree  of  noise,
              but  it  will  fail  in the presence of complex post-telecine edits.  Development on this filter is no longer taking place, as ivtc,
              pullup, and filmdint are better for most applications.  The following arguments (see syntax above) may be used to control detc's be‐
              havior:

                 <dr>
                      Set the frame dropping mode.
                         0: Do not drop frames to maintain fixed output framerate (default).
                         1: Always drop a frame when there have been no drops or telecine merges in the past 5 frames.
                         2: Always maintain exact 5:4 input to output frame ratio.
                         NOTE: Use mode 1 or 2 with MEncoder.

                 <am>
                      Analysis mode.
                         0: Fixed pattern with initial frame number specified by <fr>.
                         1: aggressive search for telecine pattern (default)

                 <fr>
                      Set  initial  frame  number in sequence.  0-2 are the three clean progressive frames; 3 and 4 are the two interlaced frames.
                      The default, -1, means 'not in telecine sequence'.  The number specified here is the type for the imaginary  previous  frame
                      before the movie starts.

                 <t0>, <t1>, <t2>, <t3>
                      Threshold values to be used in certain modes.

       ivtc[=1]
              Experimental  'stateless' inverse telecine filter.  Rather than trying to lock on to a pattern like the detc filter does, ivtc makes
              its decisions independently for each frame.  This will give much better results for material that has undergone heavy editing  after
              telecine  was  applied,  but  as  a  result  it  is not as forgiving of noisy input, for example TV capture.  The optional parameter
              (ivtc=1) corresponds to the dr=1 option for the detc filter, and should be used with MEncoder but not with MPlayer.  As  with  detc,
              you  must  specify the correct output framerate (-ofps 24000/1001) when using MEncoder.  Further development on ivtc has stopped, as
              the pullup and filmdint filters appear to be much more accurate.

       pullup[=jl:jr:jt:jb:sb:mp]
              Third-generation pulldown reversal (inverse telecine) filter, capable of handling mixed hard-telecine, 24000/1001  fps  progressive,
              and 30000/1001 fps progressive content.  The pullup filter is designed to be much more robust than detc or ivtc, by taking advantage
              of future context in making its decisions.  Like ivtc, pullup is stateless in the sense that it does not lock onto a pattern to fol‐
              low,  but it instead looks forward to the following fields in order to identify matches and rebuild progressive frames.  It is still
              under development, but believed to be quite accurate.

                 jl, jr, jt, and jb
                      These options set the amount of "junk" to ignore at the left, right, top, and bottom of the image, respectively.  Left/right
                      are in units of 8 pixels, while top/bottom are in units of 2 lines.  The default is 8 pixels on each side.

                 sb (strict breaks)
                      Setting  this option to 1 will reduce the chances of pullup generating an occasional mismatched frame, but it may also cause
                      an excessive number of frames to be dropped during high motion sequences.  Conversely, setting it to  -1  will  make  pullup
                      match fields more easily.  This may help processing of video where there is slight blurring between the fields, but may also
                      cause there to be interlaced frames in the output.

                 mp (metric plane)
                      This option may be set to 1 or 2 to use a chroma plane instead of the luma plane for doing pullup's computations.  This  may
                      improve  accuracy on very clean source material, but more likely will decrease accuracy, especially if there is chroma noise
                      (rainbow effect) or any grayscale video.  The main purpose of setting mp to a chroma plane is to reduce CPU  load  and  make
                      pullup usable in realtime on slow machines.

              NOTE: Always follow pullup with the softskip filter when encoding to ensure that pullup is able to see each frame.  Failure to do so
              will lead to incorrect output and will usually crash, due to design limitations in the codec/filter layer.

       filmdint[=options]
              Inverse telecine filter, similar to the pullup filter above.  It is designed to handle any pulldown pattern,  including  mixed  soft
              and  hard  telecine  and  limited support for movies that are slowed down or sped up from their original framerate for TV.  Only the
              luma plane is used to find the frame breaks.  If a field has no match, it is deinterlaced with simple linear approximation.  If  the
              source  is  MPEG-2,  this  must  be the first filter to allow access to the field-flags set by the MPEG-2 decoder.  Depending on the
              source MPEG, you may be fine ignoring this advice, as long as you do not see lots of "Bottom-first field" warnings.  With no options
              it  does  normal  inverse telecine, and should be used together with mencoder -fps 30000/1001 -ofps 24000/1001.  When this filter is
              used with MPlayer, it will result in an uneven framerate during playback, but it is still generally better than using  pp=lb  or  no
              deinterlacing at all.  Multiple options can be specified separated by /.

                 crop=<w>:<h>:<x>:<y>
                      Just  like the crop filter, but faster, and works on mixed hard and soft telecined content as well as when y is not a multi‐
                      ple of 4.  If x or y would require cropping fractional pixels from the chroma planes, the crop area is extended.  This  usu‐
                      ally means that x and y must be even.

                 io=<ifps>:<ofps>
                      For  each  ifps  input frames the filter will output ofps frames.  The ratio of ifps/ofps should match the -fps/-ofps ratio.
                      This could be used to filter movies that are broadcast on TV at a frame rate different from their original framerate.

                 luma_only=<n>
                      If n is nonzero, the chroma plane is copied unchanged.  This is useful for YV12 sampled TV, which discards one of the chroma
                      fields.

                 mmx2=<n>
                      On  x86, if n=1, use MMX2 optimized functions, if n=2, use 3DNow!  optimized functions, otherwise, use plain C.  If this op‐
                      tion is not specified, MMX2 and 3DNow! are auto-detected, use this option to override auto-detection.

                 fast=<n>
                      The larger n will speed up the filter at the expense of accuracy.  The default value is n=3.  If n is odd, a  frame  immedi‐
                      ately  following  a  frame  marked  with the REPEAT_FIRST_FIELD MPEG flag is assumed to be progressive, thus filter will not
                      spend any time on soft-telecined MPEG-2 content.  This is the only effect of this flag  if  MMX2  or  3DNow!  is  available.
                      Without  MMX2  and 3DNow, if n=0 or 1, the same calculations will be used as with n=2 or 3.  If n=2 or 3, the number of luma
                      levels used to find the frame breaks is reduced from 256 to 128, which results in a faster filter without losing much  accu‐
                      racy.   If  n=4 or 5, a faster, but much less accurate metric will be used to find the frame breaks, which is more likely to
                      misdetect high vertical detail as interlaced content.

                 verbose=<n>
                      If n is nonzero, print the detailed metrics for each frame.  Useful for debugging.

                 dint_thres=<n>
                      Deinterlace threshold.  Used during de-interlacing of unmatched frames.  Larger value means less deinterlacing, use n=256 to
                      completely turn off deinterlacing.  Default is n=8.

                 comb_thres=<n>
                      Threshold for comparing a top and bottom fields.  Defaults to 128.

                 diff_thres=<n>
                      Threshold to detect temporal change of a field.  Default is 128.

                 sad_thres=<n>
                      Sum of Absolute Difference threshold, default is 64.

       softpulldown
              This  filter  works only correct with MEncoder and acts on the MPEG-2 flags used for soft 3:2 pulldown (soft telecine).  If you want
              to use the ivtc or detc filter on movies that are partly soft telecined, inserting this filter before them should make them more re‐
              liable.

       divtc[=options]
              Inverse  telecine  for  deinterlaced  video.   If 3:2-pulldown telecined video has lost one of the fields or is deinterlaced using a
              method that keeps one field and interpolates the other, the result is a juddering video that  has  every  fourth  frame  duplicated.
              This filter is intended to find and drop those duplicates and restore the original film framerate.  When using this filter, you must
              specify -ofps that is 4/5 of the fps of the input file and place the softskip later in the filter chain to make sure that divtc sees
              all  the  frames.  Two different modes are available: One pass mode is the default and is straightforward to use, but has the disad‐
              vantage that any changes in the telecine phase (lost frames or bad edits) cause momentary judder until the filter can resync  again.
              Two  pass mode avoids this by analyzing the whole video beforehand so it will have forward knowledge about the phase changes and can
              resync at the exact spot.  These passes do not correspond to pass one and two of the encoding process.  You must run an  extra  pass
              using  divtc  pass  one  before  the actual encoding throwing the resulting video away.  Use -nosound -ovc raw -o /dev/null to avoid
              wasting CPU power for this pass.  You may add something like crop=2:2:0:0 after divtc to speed things up even more.  Then use  divtc
              pass two for the actual encoding.  If you use multiple encoder passes, use divtc pass two for all of them.  The options are:

                 pass=1|2
                      Use two pass mode.

                 file=<filename>
                      Set the two pass log filename (default: "framediff.log").

                 threshold=<value>
                      Set  the  minimum  strength  the telecine pattern must have for the filter to believe in it (default: 0.5).  This is used to
                      avoid recognizing false pattern from the parts of the video that are very dark or very still.

                 window=<numframes>
                      Set the number of past frames to look at when searching for pattern (default: 30).  Longer window improves  the  reliability
                      of  the  pattern  search, but shorter window improves the reaction time to the changes in the telecine phase.  This only af‐
                      fects the one pass mode.  The two pass mode currently uses fixed window that extends to both future and past.

                 phase=0|1|2|3|4
                      Sets the initial telecine phase for one pass mode (default: 0).  The two pass mode can see the future, so it is able to  use
                      the  correct phase from the beginning, but one pass mode can only guess.  It catches the correct phase when it finds it, but
                      this option can be used to fix the possible juddering at the beginning.  The first pass of the two pass mode also uses this,
                      so if you save the output from the first pass, you get constant phase result.

                 deghost=<value>
                      Set  the deghosting threshold (0-255 for one pass mode, -255-255 for two pass mode, default 0).  If nonzero, deghosting mode
                      is used.  This is for video that has been deinterlaced by blending the fields  together  instead  of  dropping  one  of  the
                      fields.  Deghosting amplifies any compression artifacts in the blended frames, so the parameter value is used as a threshold
                      to exclude those pixels from deghosting that differ from the previous frame less than specified value.  If two pass mode  is
                      used,  then  negative  value  can be used to make the filter analyze the whole video in the beginning of pass-2 to determine
                      whether it needs deghosting or not and then select either zero or the absolute value of the parameter.  Specify this  option
                      for pass-2, it makes no difference on pass-1.

       phase[=t|b|p|a|u|T|B|A|U][:v]
              Delay interlaced video by one field time so that the field order changes.  The intended use is to fix PAL movies that have been cap‐
              tured with the opposite field order to the film-to-video transfer.  The options are:

                 t    Capture field order top-first, transfer bottom-first.  Filter will delay the bottom field.

                 b    Capture bottom-first, transfer top-first.  Filter will delay the top field.

                 p    Capture and transfer with the same field order.  This mode only exists for the documentation of the other options  to  refer
                      to, but if you actually select it, the filter will faithfully do nothing ;-)

                 a    Capture  field  order  determined  automatically by field flags, transfer opposite.  Filter selects among t and b modes on a
                      frame by frame basis using field flags.  If no field information is available, then this works just like u.

                 u    Capture unknown or varying, transfer opposite.  Filter selects among t and b on a frame by frame basis by analyzing the  im‐
                      ages and selecting the alternative that produces best match between the fields.

                 T    Capture top-first, transfer unknown or varying.  Filter selects among t and p using image analysis.

                 B    Capture bottom-first, transfer unknown or varying.  Filter selects among b and p using image analysis.

                 A    Capture determined by field flags, transfer unknown or varying.  Filter selects among t, b and p using field flags and image
                      analysis.  If no field information is available, then this works just like U.  This is the default mode.

                 U    Both capture and transfer unknown or varying.  Filter selects among t, b and p using image analysis only.

                 v    Verbose operation.  Prints the selected mode for each frame and the average squared difference between fields for t, b,  and
                      p alternatives.

       telecine[=start]
              Apply  3:2  'telecine'  process  to increase framerate by 20%.  This most likely will not work correctly with MPlayer, but it can be
              used with 'mencoder -fps 30000/1001 -ofps 30000/1001 -vf telecine'.  Both fps options are essential!  (A/V sync will break  if  they
              are wrong.)  The optional start parameter tells the filter where in the telecine pattern to start (0-3).

       tinterlace[=mode]
              Temporal  field interlacing - merge pairs of frames into an interlaced frame, halving the framerate.  Even frames are moved into the
              upper field, odd frames to the lower field.  This can be used to fully reverse the effect of the tfields filter (in mode 0).  Avail‐
              able modes are:
                 0    Move odd frames into the upper field, even into the lower field, generating a full-height frame at half framerate.
                 1    Only output odd frames, even frames are dropped; height unchanged.
                 2    Only output even frames, odd frames are dropped; height unchanged.
                 3    Expand each frame to full height, but pad alternate lines with black; framerate unchanged.
                 4    Interleave even lines from even frames with odd lines from odd frames.  Height unchanged at half framerate.

       tfields[=mode[:field_dominance]]
              Temporal  field  separation  - split fields into frames, doubling the output framerate.  Like the telecine filter, tfields might not
              work completely right unless used with MEncoder and both -fps and -ofps set to the desired (double) framerate!
                 <mode>
                      0: Leave fields unchanged (will jump/flicker).
                      1: Interpolate missing lines. (The algorithm used might not be so good.)
                      2: Translate fields by 1/4 pixel with linear interpolation (no jump).
                      4: Translate fields by 1/4 pixel with 4tap filter (higher quality) (default).
                 <field_dominance> (DEPRECATED)
                      -1: auto (default) Only works if the decoder exports the appropriate information and no other filters which discard that in‐
                      formation come before tfields in the filter chain, otherwise it falls back to 0 (top field first).
                      0: top field first
                      1: bottom field first
                      NOTE: This option will possibly be removed in a future version.  Use -field-dominance instead.

       yadif=[mode[:field_dominance]]
              Yet another deinterlacing filter
                 <mode>
                      0: Output 1 frame for each frame.
                      1: Output 1 frame for each field.
                      2: Like 0 but skips spatial interlacing check.
                      3: Like 1 but skips spatial interlacing check.
                 <field_dominance> (DEPRECATED)
                      Operates like tfields.
                      NOTE: This option will possibly be removed in a future version.  Use -field-dominance instead.

       mcdeint=[mode[:parity[:qp]]]
              Motion  compensating deinterlacer.  It needs one field per frame as input and must thus be used together with tfields=1 or yadif=1/3
              or equivalent.
                 <mode>
                      0: fast
                      1: medium
                      2: slow, iterative motion estimation
                      3: extra slow, like 2 plus multiple reference frames
                 <parity>
                      0 or 1 selects which field to use (note: no autodetection yet!).
                 <qp>
                      Higher values should result in a smoother motion vector field but less optimal individual vectors.

       boxblur=radius:power[:radius:power]
              box blur
                 <radius>
                      blur filter strength
                 <power>
                      number of filter applications

       sab=radius:pf:colorDiff[:radius:pf:colorDiff]
              shape adaptive blur
                 <radius>
                      blur filter strength (~0.1-4.0) (slower if larger)
                 <pf>
                      prefilter strength (~0.1-2.0)
                 <colorDiff>
                      maximum difference between pixels to still be considered (~0.1-100.0)

       smartblur=radius:strength:threshold[:radius:strength:threshold]
              smart blur
                 <radius>
                      blur filter strength (~0.1-5.0) (slower if larger)
                 <strength>
                      blur (0.0-1.0) or sharpen (-1.0-0.0)
                 <threshold>
                      filter all (0), filter flat areas (0-30) or filter edges (-30-0)

       perspective=x0:y0:x1:y1:x2:y2:x3:y3:t
              Correct the perspective of movies not filmed perpendicular to the screen.
                 <x0>,<y0>,...
                      coordinates of the top left, top right, bottom left, bottom right corners
                 <t>
                      linear (0) or cubic resampling (1)

       2xsai
              Scale and smooth the image with the 2x scale and interpolate algorithm.

       1bpp
              1bpp bitmap to YUV/BGR 8/15/16/32 conversion

       down3dright[=lines]
              Reposition and resize stereoscopic images.  Extracts both stereo fields and places them side by side, resizing them to maintain  the
              original movie aspect.
                 <lines>
                      number of lines to select from the middle of the image (default: 12)

       bmovl=hidden:opaque:fifo
              The  bitmap overlay filter reads bitmaps from a FIFO and displays them on top of the movie, allowing some transformations on the im‐
              age.  Also see TOOLS/bmovl-test.c for a small bmovl test program.
                 <hidden>
                      Set the default value of the 'hidden' flag (0=visible, 1=hidden).
                 <opaque>
                      Set the default value of the 'opaque' flag (0=transparent, 1=opaque).
                 <fifo>
                      path/filename for the FIFO (named pipe connecting 'mplayer -vf bmovl' to the controlling application)

              FIFO commands are:
                 RGBA32 width height xpos ypos alpha clear
                      followed by width*height*4 Bytes of raw RGBA32 data.
                 ABGR32 width height xpos ypos alpha clear
                      followed by width*height*4 Bytes of raw ABGR32 data.
                 RGB24 width height xpos ypos alpha clear
                      followed by width*height*3 Bytes of raw RGB24 data.
                 BGR24 width height xpos ypos alpha clear
                      followed by width*height*3 Bytes of raw BGR24 data.
                 ALPHA width height xpos ypos alpha
                      Change alpha transparency of the specified area.
                 CLEAR width height xpos ypos
                      Clear area.
                 OPAQUE
                      Disable all alpha transparency.  Send "ALPHA 0 0 0 0 0" to enable it again.
                 HIDE
                      Hide bitmap.
                 SHOW
                      Show bitmap.

              Arguments are:
                 <width>, <height>
                      image/area size
                 <xpos>, <ypos>
                      Start blitting at position x/y.
                 <alpha>
                      Set alpha difference.  If you set this to -255 you can then send a sequence of ALPHA-commands to set the area to -225, -200,
                      -175 etc for a nice fade-in-effect! ;)
                         0:    same as original
                         255:  Make everything opaque.
                         -255: Make everything transparent.

                 <clear>
                      Clear the framebuffer before blitting.
                         0:  The  image  will  just be blitted on top of the old one, so you do not need to send 1.8MB of RGBA32 data every time a
                         small part of the screen is updated.
                         1: clear

       framestep=I|[i]step
              Renders only every nth frame or every intra frame (keyframe).

              If you call the filter with I (uppercase) as the parameter, then only keyframes are rendered.  For DVDs it generally  means  one  in
              every  15/12 frames (IBBPBBPBBPBBPBB), for AVI it means every scene change or every keyint value (see -lavcopts keyint= value if you
              use MEncoder to encode the video).

              When a keyframe is found, an 'I!' string followed by a newline character is printed, leaving the current  line  of  MPlayer/MEncoder
              output  on  the  screen, because it contains the time (in seconds) and frame number of the keyframe (You can use this information to
              split the AVI.).

              If you call the filter with a numeric parameter 'step' then only one in every 'step' frames is rendered.

              If you put an 'i' (lowercase) before the number then an 'I!' is printed (like the I parameter).

              If you give only the i then nothing is done to the frames, only I! is printed.

       tile=xtiles:ytiles:output:start:delta
              Tile a series of images into a single, bigger image.  If you omit a parameter or use a value less than 0, then the default value  is
              used.   You can also stop when you are satisfied (... -vf tile=10:5 ...).  It is probably a good idea to put the scale filter before
              the tile :-)

              The parameters are:

                 <xtiles>
                      number of tiles on the x axis (default: 5)
                 <ytiles>
                      number of tiles on the y axis (default: 5)
                 <output>
                      Render the tile when 'output' number of frames are reached, where 'output' should be a  number  less  than  xtile  *  ytile.
                      Missing tiles are left blank.  You could, for example, write an 8 * 7 tile every 50 frames to have one image every 2 seconds
                      @ 25 fps.
                 <start>
                      outer border thickness in pixels (default: 2)
                 <delta>
                      inner border thickness in pixels (default: 4)

       delogo[=x:y:w:h:t]
              Suppresses a TV station logo by a simple interpolation of the surrounding pixels.  Just set a rectangle covering the logo and  watch
              it disappear (and sometimes something even uglier appear - your mileage may vary).
                 <x>,<y>
                      top left corner of the logo
                 <w>,<h>
                      width and height of the cleared rectangle
                 <t>  Thickness  of  the fuzzy edge of the rectangle (added to w and h).  When set to -1, a green rectangle is drawn on the screen
                      to simplify finding the right x,y,w,h parameters.
                 file=<file>
                      You can specify a text file to load the coordinates from.  Each line must have a timestamp (in seconds, and in ascending or‐
                      der) and the "x:y:w:h:t" coordinates (t can be omitted).

       remove-logo=/path/to/logo_bitmap_file_name.pgm
              Suppresses  a  TV  station logo, using a PGM or PPM image file to determine which pixels comprise the logo.  The width and height of
              the image file must match those of the video stream being processed.  Uses the filter image and a circular blur algorithm to  remove
              the logo.

                 /path/to/logo_bitmap_file_name.pgm
                      [path] + filename of the filter image.

       zrmjpeg[=options]
              Software YV12 to MJPEG encoder for use with the zr2 video output device.

                 maxheight=<h>|maxwidth=<w>
                      These  options  set  the  maximum  width  and height the zr card can handle (the MPlayer filter layer currently cannot query
                      those).

                 {dc10+,dc10,buz,lml33}-{PAL|NTSC}
                      Use these options to set maxwidth and maxheight automatically to the values known for card/mode combo.  For  example,  valid
                      options are: dc10-PAL and buz-NTSC (default: dc10+PAL)

                 color|bw
                      Select color or black and white encoding.  Black and white encoding is faster.  Color is the default.

                 hdec={1,2,4}
                      Horizontal decimation 1, 2 or 4.

                 vdec={1,2,4}
                      Vertical decimation 1, 2 or 4.

                 quality=1-20
                      Set JPEG compression quality [BEST] 1 - 20 [VERY BAD].

                 fd|nofd
                      By  default, decimation is only performed if the Zoran hardware can upscale the resulting MJPEG images to the original size.
                      The option fd instructs the filter to always perform the requested decimation (ugly).

       screenshot=prefix
              Allows acquiring screenshots of the movie using slave mode commands that can be bound to keypresses.  See the slave mode  documenta‐
              tion and the INTERACTIVE CONTROL section for details.  By default files named 'shotNNNN.png' will be saved in the working directory,
              using the first available number - no files will be overwritten.  Specify a prefix to change the name or location, e.g.  -vf screen‐
              shot=shots/now  will  save  the files in the directory shots with nowNNNN.png as name.  The filter has no overhead when not used and
              accepts an arbitrary colorspace, so it is safe to add it to the configuration file.  Make sure that the screenshot filter  is  added
              after  all  other filters whose effect you want to record on the saved image.  E.g. it should be the last filter if you want to have
              an exact screenshot of what you see on the monitor.

       ass
              Moves SSA/ASS subtitle rendering to an arbitrary point in the filter chain.  Only useful with the -ass option.

              EXAMPLE:
                 -vf ass,screenshot
                      Moves SSA/ASS rendering before the screenshot filter.  Screenshots taken this way will contain subtitles.

       blackframe[=amount:threshold]
              Detect frames that are (almost) completely black.  Can be useful to detect chapter transitions or commercials.  Output lines consist
              of  the frame number of the detected frame, the percentage of blackness, the frame type and the frame number of the last encountered
              keyframe.

                 <amount>
                      Percentage of the pixels that have to be below the threshold (default: 98).

                 <threshold>
                      Threshold below which a pixel value is considered black (default: 32).

       stereo3d[=in:out]
              Stereo3d converts between different stereoscopic image formats.

                 <in> Stereoscopic image format of input. Possible values:
                      sbsl or side_by_side_left_first
                             side by side parallel (left eye left, right eye right)
                      sbsr or side_by_side_right_first
                             side by side crosseye (right eye left, left eye right)
                      sbs2l or side_by_side_half_width_left_first
                             side by side with half width resolution (left eye left, right eye right)
                      sbs2r or side_by_side_half_width_right_first
                             side by side with half width resolution (right eye left, left eye right)
                      abl or above_below_left_first
                             above-below (left eye above, right eye below)
                      abl or above_below_right_first
                             above-below (right eye above, left eye below)
                      ab2l or above_below_half_height_left_first
                             above-below with half height resolution (left eye above, right eye below)
                      ab2r or above_below_half_height_right_first
                             above-below with half height resolution (right eye above, left eye below)

                 <out>
                      Stereoscopic image format of output. Possible values are all the input formats as well as:
                      arcg or anaglyph_red_cyan_gray
                             anaglyph red/cyan gray (red filter on left eye, cyan filter on right eye)
                      arch or anaglyph_red_cyan_half_color
                             anaglyph red/cyan half colored (red filter on left eye, cyan filter on right eye)
                      arcc or anaglyph_red_cyan_color
                             anaglyph red/cyan color (red filter on left eye, cyan filter on right eye)
                      arcd or anaglyph_red_cyan_dubois
                             anaglyph red/cyan color optimized with the least squares projection of dubois (red filter on left eye, cyan filter on
                             right eye)
                      agmg or anaglyph_green_magenta_gray
                             anaglyph green/magenta gray (green filter on left eye, magenta filter on right eye)
                      agmh or anaglyph_green_magenta_half_color
                             anaglyph green/magenta half colored (green filter on left eye, magenta filter on right eye)
                      agmc or anaglyph_green_magenta_color
                             anaglyph green/magenta colored (green filter on left eye, magenta filter on right eye)
                      aybg or anaglyph_yellow_blue_gray
                             anaglyph yellow/blue gray (yellow filter on left eye, blue filter on right eye)
                      aybh or anaglyph_yellow_blue_half_color
                             anaglyph yellow/blue half colored (yellow filter on left eye, blue filter on right eye)
                      aybc or anaglyph_yellow_blue_color
                             anaglyph yellow/blue colored (yellow filter on left eye, blue filter on right eye)
                      irl or interleave_rows_left_first
                             Interleaved rows (left eye has top row, right eye starts on next row)
                      irr or interleave_rows_right_first
                             Interleaved rows (right eye has top row, left eye starts on next row)
                      ml or mono_left
                             mono output (left eye only)
                      mr or mono_right
                             mono output (right eye only)
                 NOTE:  To use either of the interleaved-rows output formats to display full-screen on a row-interleaved 3D display, you will need
                 to scale the video to the correct height first using the "scale" filter, if it is not already the right height.  Typically,  that
                 is 1080 rows (so use e.g.  "-vf scale=1440:1080,stereo3d=sbsl:irl" for a 720p side-by-side encoded movie).

       gradfun[=strength[:radius]]
              Fix the banding artifacts that are sometimes introduced into nearly flat regions by truncation to 8bit colordepth.  Interpolates the
              gradients that should go where the bands are, and dithers them.

              This filter is designed for playback only.  Do not use it prior to lossy compression, because compression tends to lose  the  dither
              and bring back the bands.

                 <strength>
                      Maximum  amount  by  which  the filter will change any one pixel.  Also the threshold for detecting nearly flat regions (de‐
                      fault: 1.2).

                 <radius>
                      Neighborhood to fit the gradient to.  Larger radius makes for smoother gradients, but also prevents the filter from  modify‐
                      ing pixels near detailed regions (default: 16).

       fixpts[=options]
              Fixes  the presentation timestamps (PTS) of the frames.  By default, the PTS passed to the next filter is dropped, but the following
              options can change that:

                 print
                      Print the incoming PTS.

                 fps=<fps>
                      Specify a frame per second value.

                 start=<pts>
                      Specify an initial value for the PTS.

                 autostart=<n>
                      Uses the nth incoming PTS as the initial PTS.  All previous PTS are kept, so setting a huge value or -1 keeps  the  PTS  in‐
                      tact.

                 autofps=<n>
                      Uses the nth incoming PTS after the end of autostart to determine the framerate.

              EXAMPLE:
                 -vf fixpts=fps=24000/1001,ass,fixpts
                      Generates  a  new  sequence  of PTS, uses it for ASS subtitles, then drops it.  Generating a new sequence is useful when the
                      timestamps are reset during the program; this is frequent on DVDs.  Dropping it may be  necessary  to  avoid  confusing  en‐
                      coders.

              NOTE: Using this filter together with any sort of seeking (including -ss and EDLs) may make demons fly out of your nose.

GENERAL ENCODING OPTIONS (MENCODER ONLY)
       -audio-delay <any floating-point number>
              Delays  either audio or video by setting a delay field in the header (default: 0.0).  This does not delay either stream while encod‐
              ing, but the player will see the delay field and compensate accordingly.  Positive values delay the audio, and negative values delay
              the video.  Note that this is the exact opposite of the -delay option.  For example, if a video plays correctly with -delay 0.2, you
              can fix the video with MEncoder by using -audio-delay -0.2.

              Currently, this option only works with the default muxer (-of avi).  If you are using a different muxer, then you  must  use  -delay
              instead.

       -audio-density <1-50>
              Number of audio chunks per second (default is 2 for 0.5s long audio chunks).
              NOTE: CBR only, VBR ignores this as it puts each packet in a new chunk.

       -audio-preload <0.0-2.0>
              Sets up the audio buffering time interval (default: 0.5s).

       -fafmttag <format>
              Can be used to override the audio format tag of the output file.

              EXAMPLE:
                 -fafmttag 0x55
                      Will have the output file contain 0x55 (mp3) as audio format tag.

       -ffourcc <fourcc>
              Can be used to override the video fourcc of the output file.

              EXAMPLE:
                 -ffourcc div3
                      Will have the output file contain 'div3' as video fourcc.

       -force-avi-aspect <0.2-3.0>
              Override the aspect stored in the AVI OpenDML vprp header.  This can be used to change the aspect ratio with '-ovc copy'.

       -frameno-file <filename> (DEPRECATED)
              Specify the name of the audio file with framenumber mappings created in the first (audio only) pass of a special three pass encoding
              mode.
              NOTE: Using this mode will most likely give you A-V desync.  Do not use it.  It is kept for backwards compatibility  only  and  will
              possibly be removed in a future version.

       -hr-edl-seek
              Use  a  more  precise, but much slower method for skipping areas.  Areas marked for skipping are not seeked over, instead all frames
              are decoded, but only the necessary frames are encoded.  This allows starting at non-keyframe boundaries.
              NOTE: Not guaranteed to work right with '-ovc copy'.

       -info <option1:option2:...> (AVI only)
              Specify the info header of the resulting AVI file.

              Available options are:

                 help
                      Show this description.

                 name=<value>
                      title of the work

                 artist=<value>
                      artist or author of the work

                 genre=<value>
                      original work category

                 subject=<value>
                      contents of the work

                 copyright=<value>
                      copyright information

                 srcform=<value>
                      original format of the digitized material

                 comment=<value>
                      general comments about the work

       -noautoexpand
              Do not automatically insert the expand filter into the MEncoder filter chain.  Useful to control at which point of the filter  chain
              subtitles are rendered when hardcoding subtitles onto a movie.

       -noencodedups
              Do  not  attempt  to  encode duplicate frames in duplicate; always output zero-byte frames to indicate duplicates.  Zero-byte frames
              will be written anyway unless a filter or encoder capable of doing duplicate encoding is loaded.  Currently the only such filter  is
              harddup.

       -noodml (-of avi only)
              Do not write OpenDML index for AVI files >1GB.

       -noskip
              Do not skip frames.

       -o <filename>
              Outputs to the given filename.
              If you want a default output filename, you can put this option in the MEncoder config file.

       -oac <codec name>
              Encode with the given audio codec (no default set).
              NOTE: Use -oac help to get a list of available audio codecs.

              EXAMPLE:
                 -oac copy
                      no encoding, just streamcopy
                 -oac pcm
                      Encode to uncompressed PCM.
                 -oac mp3lame
                      Encode to MP3 (using LAME).
                 -oac lavc
                      Encode with a libavcodec codec.

       -of <format> (BETA CODE!)
              Encode to the specified container format (default: AVI).
              NOTE: Use -of help to get a list of available container formats.

              EXAMPLE:
                 -of avi
                      Encode to AVI.
                 -of mpeg
                      Encode to MPEG (also see -mpegopts).
                 -of lavf
                      Encode with libavformat muxers (also see -lavfopts).
                 -of rawvideo
                      raw video stream (no muxing - one video stream only)
                 -of rawaudio
                      raw audio stream (no muxing - one audio stream only)

       -ofps <fps>
              Specify  a  frames per second (fps) value for the output file, which can be different from that of the source material.  Must be set
              for variable fps (ASF, some MOV) and progressive (30000/1001 fps telecined MPEG) files.

       -ovc <codec name>
              Encode with the given video codec (no default set).
              NOTE: Use -ovc help to get a list of available video codecs.

              EXAMPLE:
                 -ovc copy
                      no encoding, just streamcopy
                 -ovc raw
                      Encode to an arbitrary uncompressed format (use '-vf format' to select).
                 -ovc lavc
                      Encode with a libavcodec codec.

       -passlogfile <filename>
              Dump first pass information to <filename> instead of the default divx2pass.log in two pass encoding mode.

       -skiplimit <value>
              Specify the maximum number of frames that may be skipped after encoding one frame (-noskiplimit for unlimited).

       -vobsubout <basename>
              Specify the basename for the output .idx and .sub files.  This turns off subtitle rendering in the encoded movie and diverts  it  to
              VOBsub subtitle files.

       -vobsuboutid <langid>
              Specify the language two letter code for the subtitles.  This overrides what is read from the DVD or the .ifo file.

       -vobsuboutindex <index>
              Specify the index of the subtitles in the output files (default: 0).

       -force-key-frames <time>,<time>,...
              Force key frames at the specified timestamps, more precisely at the first frame after each specified time.

              This option can be used to ensure that a seek point is present at a chapter mark or any other designated place in the output file.

              The timestamps must be specified in ascending order.

              Since MEncoder does not send timestamps along the filter chain, you probably need to use the fixpts filter for this option to work.

              Not all codecs support forced key frames.  Currently, support is only implemented for the following encoders: lavc, x264, xvid.

CODEC SPECIFIC ENCODING OPTIONS (MENCODER ONLY)
       You can specify codec specific encoding parameters using the following syntax:

       -<codec>opts <option1[=value1]:option2[=value2]:...>

       Where <codec> may be: lavc, xvidenc, mp3lame, toolame, twolame, nuv, xvfw, faac, x264enc, mpeg, lavf.

   mp3lame (-lameopts)
       help
              get help

       vbr=<0-4>
              variable bitrate method
                 0    cbr
                 1    mt
                 2    rh (default)
                 3    abr
                 4    mtrh

       abr
              average bitrate

       cbr
              constant bitrate Also forces CBR mode encoding on subsequent ABR presets modes.

       br=<0-1024>
              bitrate in kbps (CBR and ABR only)

       q=<0-9>
              quality (0 - highest, 9 - lowest) (VBR only)

       aq=<0-9>
              algorithmic quality (0 - best/slowest, 9 - worst/fastest)

       ratio=<1-100>
              compression ratio

       vol=<0-10>
              audio input gain

       mode=<0-3>
              (default: auto)
                 0    stereo
                 1    joint-stereo
                 2    dualchannel
                 3    mono

       padding=<0-2>
                 0    none
                 1    all
                 2    adjust

       fast
              Switch on faster encoding on subsequent VBR presets modes.  This results in slightly lower quality and higher bitrates.

       highpassfreq=<freq>
              Set  a highpass filtering frequency in Hz.  Frequencies below the specified one will be cut off.  A value of -1 will disable filter‐
              ing, a value of 0 will let LAME choose values automatically.

       lowpassfreq=<freq>
              Set a lowpass filtering frequency in Hz.  Frequencies above the specified one will be cut off.  A value of -1 will  disable  filter‐
              ing, a value of 0 will let LAME choose values automatically.

       preset=<value>
              preset values

                 help
                      Print additional options and information about presets settings.

                 medium
                      VBR encoding, good quality, 150-180 kbps bitrate range

                 standard
                      VBR encoding, high quality, 170-210 kbps bitrate range

                 extreme
                      VBR encoding, very high quality, 200-240 kbps bitrate range

                 insane
                      CBR encoding, highest preset quality, 320 kbps bitrate

                 <8-320>
                      ABR encoding at average given kbps bitrate

              EXAMPLES:
                 fast:preset=standard
                      suitable for most people and most music types and already quite high quality
                 cbr:preset=192
                      Encode with ABR presets at a 192 kbps forced constant bitrate.
                 preset=172
                      Encode with ABR presets at a 172 kbps average bitrate.
                 preset=extreme
                      for people with extremely good hearing and similar equipment

   toolame and twolame (-toolameopts and -twolameopts respectively)
       br=<32-384>
              In  CBR  mode  this parameter indicates the bitrate in kbps, when in VBR mode it is the minimum bitrate allowed per frame.  VBR mode
              will not work with a value below 112.

       vbr=<-50-50> (VBR only)
              variability range; if negative the encoder shifts the average bitrate towards the lower limit, if positive towards the higher.  When
              set to 0 CBR is used (default).

       maxvbr=<32-384> (VBR only)
              maximum bitrate allowed per frame, in kbps

       mode=<stereo | jstereo | mono | dual>
              (default: mono for 1-channel audio, stereo otherwise)

       psy=<-1-4>
              psychoacoustic model (default: 2)

       errprot=<0 | 1>
              Include error protection.

       debug=<0-10>
              debug level

   faac (-faacopts)
       br=<bitrate>
              average bitrate in kbps (mutually exclusive with quality)

       quality=<1-1000>
              quality mode, the higher the better (mutually exclusive with br)

       object=<1-4>
              object type complexity
                 1    MAIN (default)
                 2    LOW
                 3    SSR
                 4    LTP (extremely slow)

       mpeg=<2|4>
              MPEG version (default: 4)

       tns
              Enables temporal noise shaping.

       cutoff=<0-sampling_rate/2>
              cutoff frequency (default: sampling_rate/2)

       raw
              Stores  the bitstream as raw payload with extradata in the container header (default: 0, corresponds to ADTS).  Do not set this flag
              if not explicitly required or you will not be able to remux the audio stream later on.

   lavc (-lavcopts)
       Many libavcodec (lavc for short) options are tersely documented.  Read the source for full details.

       EXAMPLE:
                 vcodec=msmpeg4:vbitrate=1800:vhq:keyint=250

       o=<key>=<value>[,<key>=<value>[,...]]
              Pass AVOptions to libavcodec encoder.  Note, a patch to make the o= unneeded and pass all unknown options through the AVOption  sys‐
              tem  is  welcome.   A full list of AVOptions can be found in the FFmpeg manual.  Note that some AVOptions may conflict with MEncoder
              options.

              EXAMPLE:
                 o=bt=100k

       acodec=<value>
              audio codec (default: mp2)
                 ac3
                      Dolby Digital (AC-3)
                 adpcm_*
                      Adaptive PCM formats - see the HTML documentation for details.
                 flac
                      Free Lossless Audio Codec (FLAC)
                 g726
                      G.726 ADPCM
                 libfaac
                      Advanced Audio Coding (AAC) - using FAAC
                 libmp3lame
                      MPEG-1 audio layer 3 (MP3) - using LAME
                 mp2
                      MPEG-1 audio layer 2 (MP2)
                 pcm_*
                      PCM formats - see the HTML documentation for details.
                 roq_dpcm
                      Id Software RoQ DPCM
                 sonic
                      experimental simple lossy codec
                 sonicls
                      experimental simple lossless codec
                 vorbis
                      Vorbis
                 wmav1
                      Windows Media Audio v1
                 wmav2
                      Windows Media Audio v2

       abitrate=<value>
              audio bitrate in kbps (default: 224)

       atag=<value>
              Use the specified Windows audio format tag (e.g. atag=0x55).

       bit_exact
              Use only bit exact algorithms (except (I)DCT).  Additionally bit_exact disables several optimizations and thus should only  be  used
              for  regression  tests,  which  need binary identical files even if the encoder version changes.  This also suppresses the user_data
              header in MPEG-4 streams.  Do not use this option unless you know exactly what you are doing.

       threads=<1-8>
              Maximum number of threads to use (default: 1).  May have a slight negative effect on motion estimation.

       vcodec=<value>
              Employ the specified codec (default: mpeg4).
                 asv1
                      ASUS Video v1
                 asv2
                      ASUS Video v2
                 dvvideo
                      Sony Digital Video
                 ffv1
                      FFmpeg's lossless video codec
                 ffvhuff
                      nonstandard 20% smaller HuffYUV using YV12
                 flv
                      Sorenson H.263 used in Flash Video
                 h261
                      H.261
                 h263
                      H.263
                 h263p
                      H.263+
                 huffyuv
                      HuffYUV
                 libtheora
                      Theora
                 libx264
                      x264 H.264/AVC MPEG-4 Part 10
                 libxvid
                      Xvid MPEG-4 Part 2 (ASP)
                 ljpeg
                      Lossless JPEG
                 mjpeg
                      Motion JPEG
                 mpeg1video
                      MPEG-1 video
                 mpeg2video
                      MPEG-2 video
                 mpeg4
                      MPEG-4 (DivX 4/5)
                 msmpeg4
                      DivX 3
                 msmpeg4v2
                      MS MPEG4v2
                 roqvideo
                      ID Software RoQ Video
                 rv10
                      an old RealVideo codec
                 snow (also see: vstrict)
                      FFmpeg's experimental wavelet-based codec
                 svq1
                      Apple Sorenson Video 1
                 wmv1
                      Windows Media Video, version 1 (AKA WMV7)
                 wmv2
                      Windows Media Video, version 2 (AKA WMV8)

       vqmin=<1-31>
              minimum quantizer

                 1    Not recommended (much larger file, little quality difference and weird side effects: msmpeg4, h263 will be very low quality,
                      ratecontrol will be confused resulting in lower quality and some decoders will not be able to decode it).

                 2    Recommended for normal mpeg4/mpeg1video encoding (default).

                 3    Recommended for h263(p)/msmpeg4.  The reason for preferring 3 over 2 is that 2 could lead to overflows.  (This will be fixed
                      for h263(p) by changing the quantizer per MB in the future, msmpeg4 cannot be fixed as it does not support that.)

       lmin=<0.01-255.0>
              Minimum frame-level Lagrange multiplier for ratecontrol (default: 2.0).  Lavc will rarely use quantizers below the  value  of  lmin.
              Lowering  lmin  will make lavc more likely to choose lower quantizers for some frames, but not lower than the value of vqmin.  Like‐
              wise, raising lmin will make lavc less likely to choose low quantizers, even if vqmin would have allowed them.  You probably want to
              set  lmin  approximately  equal  to vqmin.  When adaptive quantization is in use, changing lmin/lmax may have less of an effect; see
              mblmin/mblmax.

       lmax=<0.01-255.0>
              maximum Lagrange multiplier for ratecontrol (default: 31.0)

       mblmin=<0.01-255.0>
              Minimum macroblock-level Lagrange multiplier for ratecontrol (default:2.0).  This parameter affects  adaptive  quantization  options
              like qprd, lumi_mask, etc..

       mblmax=<0.01-255.0>
              Maximum macroblock-level Lagrange multiplier for ratecontrol (default: 31.0).

       vqscale=<0-31>
              Constant  quantizer / constant quality encoding (selects fixed quantizer mode).  A lower value means better quality but larger files
              (default: -1).  In case of snow codec, value 0 means lossless encoding.  Since the other codecs do not support this, vqscale=0  will
              have an undefined effect.  1 is not recommended (see vqmin for details).

       vqmax=<1-31>
              Maximum quantizer, 10-31 should be a sane range (default: 31).

       vqdiff=<1-31>
              maximum quantizer difference between consecutive I- or P-frames (default: 3)

       vmax_b_frames=<0-4>
              maximum number of B-frames between non-B-frames:
                 0    no B-frames (default)
                 0-2  sane range for MPEG-4

       vme=<0-5>
              motion estimation method.  Available methods are:
                 0    none (very low quality)
                 1    full (slow, currently unmaintained and disabled)
                 2    log (low quality, currently unmaintained and disabled)
                 3    phods (low quality, currently unmaintained and disabled)
                 4    EPZS: size=1 diamond, size can be adjusted with the *dia options (default)
                 5    X1 (experimental, currently aliased to EPZS)
                 8    iter (iterative overlapped block, only used in snow)

              NOTE: 0-3 currently ignores the amount of bits spent, so quality may be low.

       me_range=<0-9999>
              motion estimation search range (default: 0 (unlimited))

       mbd=<0-2> (also see *cmp, qpel)
              Macroblock  decision  algorithm (high quality mode), encode each macro block in all modes and choose the best.  This is slow but re‐
              sults in better quality and file size.  When mbd is set to 1 or 2, the value of mbcmp is ignored  when  comparing  macroblocks  (the
              mbcmp  value  is still used in other places though, in particular the motion search algorithms).  If any comparison setting (precmp,
              subcmp, cmp, or mbcmp) is nonzero, however, a slower but better half-pel motion search will be used, regardless of what mbd  is  set
              to.  If qpel is set, quarter-pel motion search will be used regardless.
                 0    Use comparison function given by mbcmp (default).
                 1    Select the MB mode which needs the fewest bits (=vhq).
                 2    Select the MB mode which has the best rate distortion.

       vhq
              Same as mbd=1, kept for compatibility reasons.

       v4mv
              Allow 4 motion vectors per macroblock (slightly better quality).  Works better if used with mbd>0.

       obmc
              overlapped block motion compensation (H.263+)

       loop
              loop filter (H.263+) note, this is broken

       keyint=<0-300>
              maximum  interval  between keyframes in frames (default: 250 or one keyframe every ten seconds in a 25fps movie.  This is the recom‐
              mended default for MPEG-4).  Most codecs require regular keyframes in order to limit the accumulation of mismatch error.   Keyframes
              are  also needed for seeking, as seeking is only possible to a keyframe - but keyframes need more space than other frames, so larger
              numbers here mean slightly smaller files but less precise seeking.  0 is equivalent to 1, which makes every frame a keyframe.   Val‐
              ues >300 are not recommended as the quality might be bad depending upon decoder, encoder and luck.  It is common for MPEG-1/2 to use
              values <=30.

       sc_threshold=<-1000000000-1000000000>
              Threshold for scene change detection.  A keyframe is inserted by libavcodec when it detects a scene change.   You  can  specify  the
              sensitivity  of the detection with this option.  -1000000000 means there is a scene change detected at every frame, 1000000000 means
              no scene changes are detected (default: 0).

       sc_factor=<any positive integer>
              Causes frames with higher quantizers to be more likely to trigger a scene change detection and make libavcodec use an  I-frame  (de‐
              fault:  1).  1-16 is a sane range.  Values between 2 and 6 may yield increasing PSNR (up to approximately 0.04 dB) and better place‐
              ment of I-frames in high-motion scenes.  Higher values than 6 may give very slightly better PSNR (approximately 0.01  dB  more  than
              sc_factor=6), but noticably worse visual quality.

       vb_strategy=<0-2> (pass one only)
              strategy to choose between I/P/B-frames:
                 0    Always use the maximum number of B-frames (default).
                 1    Avoid B-frames in high motion scenes.  See the b_sensitivity option to tune this strategy.
                 2    Places  B-frames  more or less optimally to yield maximum quality (slower).  You may want to reduce the speed impact of this
                      option by tuning the option brd_scale.

       b_sensitivity=<any integer greater than 0>
              Adjusts how sensitively vb_strategy=1 detects motion and avoids using B-frames (default: 40).  Lower sensitivities  will  result  in
              more  B-frames.   Using  more  B-frames usually improves PSNR, but too many B-frames can hurt quality in high-motion scenes.  Unless
              there is an extremely high amount of motion, b_sensitivity can safely be lowered below the default; 10 is a reasonable value in most
              cases.

       brd_scale=<0-10>
              Downscales  frames for dynamic B-frame decision (default: 0).  Each time brd_scale is increased by one, the frame dimensions are di‐
              vided by two, which improves speed by a factor of four.  Both dimensions of the fully downscaled frame  must  be  even  numbers,  so
              brd_scale=1 requires the original dimensions to be multiples of four, brd_scale=2 requires multiples of eight, etc.  In other words,
              the dimensions of the original frame must both be divisible by 2^(brd_scale+1) with no remainder.

       bidir_refine=<0-4>
              Refine the two motion vectors used in bidirectional macroblocks, rather than re-using vectors from the forward and backward  search‐
              es.  This option has no effect without B-frames.
                 0    Disabled (default).
                 1-4  Use a wider search (larger values are slower).

       vpass=<1-3>
              Activates internal two (or more) pass mode, only specify if you wish to use two (or more) pass encoding.
                 1    first pass (also see turbo)
                 2    second pass
                 3    Nth pass (second and subsequent passes of N-pass encoding)
              Here is how it works, and how to use it:
              The first pass (vpass=1) writes the statistics file.  You might want to deactivate some CPU-hungry options, like "turbo" mode does.
              In two pass mode, the second pass (vpass=2) reads the statistics file and bases ratecontrol decisions on it.
              In  N-pass  mode, the second pass (vpass=3, that is not a typo) does both: It first reads the statistics, then overwrites them.  You
              might want to backup divx2pass.log before doing this if there is any possibility that you will have to cancel MEncoder.  You can use
              all encoding options, except very CPU-hungry options like "qns".
              You  can run this same pass over and over to refine the encode.  Each subsequent pass will use the statistics from the previous pass
              to improve.  The final pass can include any CPU-hungry encoding options.
              If you want a 2 pass encode, use first vpass=1, and then vpass=2.
              If you want a 3 or more pass encode, use vpass=1 for the first pass and then vpass=3 and then vpass=3 again and again until you  are
              satisfied with the encode.

              huffyuv:
                 pass 1
                      Saves statistics.
                 pass 2
                      Encodes with an optimal Huffman table based upon statistics from the first pass.

       turbo (two pass only)
              Dramatically  speeds up pass one using faster algorithms and disabling CPU-intensive options.  This will probably reduce global PSNR
              a little bit (around 0.01dB) and change individual frame type and PSNR a little bit more (up to 0.03dB).

       aspect=<x/y>
              Store movie aspect internally, just like with MPEG files.  Much nicer than rescaling, because quality is not decreased.  Only MPlay‐
              er will play these files correctly, other players will display them with wrong aspect.  The aspect parameter can be given as a ratio
              or a floating point number.

              EXAMPLE:
                 aspect=16/9 or aspect=1.78

       autoaspect
              Same as the aspect option, but automatically computes aspect, taking into account all the adjustments (crop/expand/scale/etc.)  made
              in the filter chain.  Does not incur a performance penalty, so you can safely leave it always on.

       vbitrate=<value>
              Specify bitrate (default: 800).
              WARNING: 1kbit = 1000 bits
                 4-16000
                      (in kbit)
                 16001-24000000
                      (in bit)

       vratetol=<value>
              approximated file size tolerance in kbit.  1000-100000 is a sane range.  (warning: 1kbit = 1000 bits) (default: 8000)
              NOTE: vratetol should not be too large during the second pass or there might be problems if vrc_(min|max)rate is used.

       vrc_maxrate=<value>
              maximum bitrate in kbit/sec (default: 0, unlimited)

       vrc_minrate=<value>
              minimum bitrate in kbit/sec (default: 0, unlimited)

       vrc_buf_size=<value>
              buffer size in kbit For MPEG-1/2 this also sets the vbv buffer size, use 327 for VCD, 917 for SVCD and 1835 for DVD.

       vrc_buf_aggressivity
              currently useless

       vrc_strategy
              Ratecontrol method.  Note that some of the ratecontrol-affecting options will have no effect if vrc_strategy is not set to 0.
                 0    Use internal lavc ratecontrol (default).
                 1    Use Xvid ratecontrol (experimental; requires MEncoder to be compiled with support for Xvid 1.1 or higher).

       vb_qfactor=<-31.0-31.0>
              quantizer factor between B- and non-B-frames (default: 1.25)

       vi_qfactor=<-31.0-31.0>
              quantizer factor between I- and non-I-frames (default: 0.8)

       vb_qoffset=<-31.0-31.0>
              quantizer offset between B- and non-B-frames (default: 1.25)

       vi_qoffset=<-31.0-31.0>
              (default: 0.0)
              if v{b|i}_qfactor > 0
              I/B-frame quantizer = P-frame quantizer * v{b|i}_qfactor + v{b|i}_qoffset
              else
              do normal ratecontrol (do not lock to next P-frame quantizer) and set q= -q * v{b|i}_qfactor + v{b|i}_qoffset
              HINT:  To  do  constant  quantizer  encoding  with  different  quantizers  for I/P- and B-frames you can use: lmin= <ip_quant>:lmax=
              <ip_quant>:vb_qfactor= <b_quant/ip_quant>.

       vqblur=<0.0-1.0> (pass one)
              Quantizer blur (default: 0.5), larger values will average the quantizer more over time (slower change).
                 0.0  Quantizer blur disabled.
                 1.0  Average the quantizer over all previous frames.

       vqblur=<0.0-99.0> (pass two)
              Quantizer gaussian blur (default: 0.5), larger values will average the quantizer more over time (slower change).

       vqcomp=<0.0-1.0>
              Quantizer compression, vrc_eq depends upon this (default: 0.5).  NOTE: Perceptual quality will be optimal somewhere in  between  the
              range's extremes.

       vrc_eq=<equation>
              main ratecontrol equation

                 1+(tex/avgTex-1)*qComp
                      approximately the equation of the old ratecontrol code

                 tex^qComp
                      with qcomp 0.5 or something like that (default)

              infix operators:

                 +,-,*,/,^

              variables:

                 tex
                      texture complexity

                 iTex,pTex
                      intra, non-intra texture complexity

                 avgTex
                      average texture complexity

                 avgIITex
                      average intra texture complexity in I-frames

                 avgPITex
                      average intra texture complexity in P-frames

                 avgPPTex
                      average non-intra texture complexity in P-frames

                 avgBPTex
                      average non-intra texture complexity in B-frames

                 mv
                      bits used for motion vectors

                 fCode
                      maximum length of motion vector in log2 scale

                 iCount
                      number of intra macroblocks / number of macroblocks

                 var
                      spatial complexity

                 mcVar
                      temporal complexity

                 qComp
                      qcomp from the command line

                 isI, isP, isB
                      Is 1 if picture type is I/P/B else 0.

                 Pi,E
                      See your favorite math book.

              functions:

                 max(a,b),min(a,b)
                      maximum / minimum

                 gt(a,b)
                      is 1 if a>b, 0 otherwise

                 lt(a,b)
                      is 1 if a<b, 0 otherwise

                 eq(a,b)
                      is 1 if a==b, 0 otherwise

                 sin, cos, tan, sinh, cosh, tanh, exp, log, abs

       vrc_override=<options>
              User  specified  quality  for specific parts (ending, credits, ...).  The options are <start-frame>, <end-frame>, <quality>[/<start-
              frame>, <end-frame>, <quality>[/...]]:
                 quality (2-31)
                      quantizer
                 quality (-500-0)
                      quality correction in %

       vrc_init_cplx=<0-1000>
              initial complexity (pass 1)

       vrc_init_occupancy=<0.0-1.0>
              initial buffer occupancy, as a fraction of vrc_buf_size (default: 0.9)

       vqsquish=<0|1>
              Specify how to keep the quantizer between qmin and qmax.
                 0    Use clipping.
                 1    Use a nice differentiable function (default).

       vlelim=<-1000-1000>
              Sets single coefficient elimination threshold for luminance.  Negative values will also consider the DC coefficient  (should  be  at
              least -4 or lower for encoding at quant=1):
                 0    disabled (default)
                 -4   JVT recommendation

       vcelim=<-1000-1000>
              Sets  single coefficient elimination threshold for chrominance.  Negative values will also consider the DC coefficient (should be at
              least -4 or lower for encoding at quant=1):
                 0    disabled (default)
                 7    JVT recommendation

       vstrict=<-2|-1|0|1>
              strict standard compliance
                 0    disabled
                 1    Only recommended if you want to feed the output into the MPEG-4 reference decoder.
                 -1   Allow libavcodec specific extensions (default).
                 -2   Enables experimental codecs and features which may not be playable with future MPlayer versions (snow).

       vdpart
              Data partitioning.  Adds 2 Bytes per video packet, improves  error-resistance  when  transferring  over  unreliable  channels  (e.g.
              streaming over the internet).  Each video packet will be encoded in 3 separate partitions:
                 1. MVs
                      movement
                 2. DC coefficients
                      low res picture
                 3. AC coefficients
                      details
              MV  &  DC  are  most important, losing them looks far worse than losing the AC and the 1. & 2. partition.  (MV & DC) are far smaller
              than the 3. partition (AC) meaning that errors will hit the AC partition much more often than the MV &  DC  partitions.   Thus,  the
              picture will look better with partitioning than without, as without partitioning an error will trash AC/DC/MV equally.

       vpsize=<0-10000> (also see vdpart)
              Video packet size, improves error-resistance.
                 0
                      disabled (default)
                 100-1000
                      good choice

       ss
              slice structured mode for H.263+

       gray
              grayscale only encoding (faster)

       vfdct=<0-10>
              DCT algorithm
                 0    Automatically select a good one (default).
                 1    fast integer
                 2    accurate integer
                 3    MMX
                 4    mlib
                 5    AltiVec
                 6    floating point AAN

       idct=<0-99>
              IDCT algorithm
              NOTE: To the best of our knowledge all these IDCTs do pass the IEEE1180 tests.
                 0    Automatically select a good one (default).
                 1    JPEG reference integer
                 2    simple
                 3    simplemmx
                 4    libmpeg2mmx (inaccurate, do not use for encoding with keyint >100)
                 5    ps2
                 6    mlib
                 7    arm
                 8    AltiVec
                 9    sh4
                 10   simplearm
                 11   H.264
                 12   VP3
                 13   IPP
                 14   xvidmmx
                 15   CAVS
                 16   simplearmv5te
                 17   simplearmv6

       lumi_mask=<0.0-1.0>
              Luminance masking is a 'psychosensory' setting that is supposed to make use of the fact that the human eye tends to notice fewer de‐
              tails in very bright parts of the picture.  Luminance masking compresses bright areas stronger than medium ones,  so  it  will  save
              bits that can be spent again on other frames, raising overall subjective quality, while possibly reducing PSNR.
              WARNING: Be careful, overly large values can cause disastrous things.
              WARNING: Large values might look good on some monitors but may look horrible on other monitors.
                 0.0
                      disabled (default)
                 0.0-0.3
                      sane range

       dark_mask=<0.0-1.0>
              Darkness  masking is a 'psychosensory' setting that is supposed to make use of the fact that the human eye tends to notice fewer de‐
              tails in very dark parts of the picture.  Darkness masking compresses dark areas stronger than medium ones, so  it  will  save  bits
              that can be spent again on other frames, raising overall subjective quality, while possibly reducing PSNR.
              WARNING: Be careful, overly large values can cause disastrous things.
              WARNING: Large values might look good on some monitors but may look horrible on other monitors / TV / TFT.
                 0.0
                      disabled (default)
                 0.0-0.3
                      sane range

       tcplx_mask=<0.0-1.0>
              Temporal  complexity  masking (default: 0.0 (disabled)).  Imagine a scene with a bird flying across the whole scene; tcplx_mask will
              raise the quantizers of the bird's macroblocks (thus decreasing their quality), as the human eye usually does not have time  to  see
              all  the  bird's details.  Be warned that if the masked object stops (e.g. the bird lands) it is likely to look horrible for a short
              period of time, until the encoder figures out that the object is not moving and needs refined blocks.  The saved bits will be  spent
              on other parts of the video, which may increase subjective quality, provided that tcplx_mask is carefully chosen.

       scplx_mask=<0.0-1.0>
              Spatial complexity masking.  Larger values help against blockiness, if no deblocking filter is used for decoding, which is maybe not
              a good idea.
              Imagine a scene with grass (which usually has great spatial complexity), a blue sky and a house; scplx_mask will raise the  quantiz‐
              ers of the grass' macroblocks, thus decreasing its quality, in order to spend more bits on the sky and the house.
              HINT: Crop any black borders completely as they will reduce the quality of the macroblocks (also applies without scplx_mask).
                 0.0
                      disabled (default)
                 0.0-0.5
                      sane range

              NOTE: This setting does not have the same effect as using a custom matrix that would compress high frequencies harder, as scplx_mask
              will reduce the quality of P blocks even if only DC is changing.  The result of scplx_mask will probably not look as good.

       p_mask=<0.0-1.0> (also see vi_qfactor)
              Reduces the quality of inter blocks.  This is equivalent to increasing the quality of intra blocks, because the same average bitrate
              will be distributed by the rate controller to the whole video sequence (default: 0.0 (disabled)).  p_mask=1.0 doubles the bits allo‐
              cated to each intra block.

       border_mask=<0.0-1.0>
              border-processing for MPEG-style encoders.  Border processing increases the quantizer for macroblocks which are less than  1/5th  of
              the frame width/height away from the frame border, since they are often visually less important.

       naq
              Normalize  adaptive  quantization  (experimental).   When  using adaptive quantization (*_mask), the average per-MB quantizer may no
              longer match the requested frame-level quantizer.  Naq will attempt to adjust the per-MB quantizers to maintain the proper average.

       ildct
              Use interlaced DCT.

       ilme
              Use interlaced motion estimation (mutually exclusive with qpel).

       alt
              Use alternative scantable.

       top=<-1-1>
                 -1   automatic
                 0    bottom field first
                 1    top field first

       format=<value>
                 YV12
                      default
                 444P
                      for ffv1
                 422P
                      for HuffYUV, lossless JPEG, dv and ffv1
                 411P
                      for lossless JPEG, dv and ffv1
                 YVU9
                      for lossless JPEG, ffv1 and svq1
                 BGR32
                      for lossless JPEG and ffv1

       pred
              (for HuffYUV)
                 0    left prediction
                 1    plane/gradient prediction
                 2    median prediction

       pred
              (for lossless JPEG)
                 0    left prediction
                 1    top prediction
                 2    topleft prediction
                 3    plane/gradient prediction
                 6    mean prediction

       coder
              (for ffv1)
                 0    vlc coding (Golomb-Rice)
                 1    arithmetic coding (CABAC)

       context
              (for ffv1)
                 0    small context model
                 1    large context model

              (for ffvhuff)
                 0    predetermined Huffman tables (builtin or two pass)
                 1    adaptive Huffman tables

       qpel
              Use quarter pel motion compensation (mutually exclusive with ilme).
              HINT: This seems only useful for high bitrate encodings.

       mbcmp=<0-2000>
              Sets the comparison function for the macroblock decision, has only an effect if mbd=0.  This is also used  for  some  motion  search
              functions, in which case it has an effect regardless of mbd setting.
                 0 (SAD)
                      sum of absolute differences, fast (default)
                 1 (SSE)
                      sum of squared errors
                 2 (SATD)
                      sum of absolute Hadamard transformed differences
                 3 (DCT)
                      sum of absolute DCT transformed differences
                 4 (PSNR)
                      sum of squared quantization errors (avoid, low quality)
                 5 (BIT)
                      number of bits needed for the block
                 6 (RD)
                      rate distortion optimal, slow
                 7 (ZERO)
                      0
                 8 (VSAD)
                      sum of absolute vertical differences
                 9 (VSSE)
                      sum of squared vertical differences
                 10 (NSSE)
                      noise preserving sum of squared differences
                 11 (W53)
                      5/3 wavelet, only used in snow
                 12 (W97)
                      9/7 wavelet, only used in snow
                 +256
                      Also use chroma, currently does not work (correctly) with B-frames.

       ildctcmp=<0-2000>
              Sets the comparison function for interlaced DCT decision (see mbcmp for available comparison functions).

       precmp=<0-2000>
              Sets the comparison function for motion estimation pre pass (see mbcmp for available comparison functions) (default: 0).

       cmp=<0-2000>
              Sets the comparison function for full pel motion estimation (see mbcmp for available comparison functions) (default: 0).

       subcmp=<0-2000>
              Sets the comparison function for sub pel motion estimation (see mbcmp for available comparison functions) (default: 0).

       skipcmp=<0-2000>
              FIXME: Document this.

       nssew=<0-1000000>
              This  setting  controls  NSSE  weight, where larger weights will result in more noise.  0 NSSE is identical to SSE You may find this
              useful if you prefer to keep some noise in your encoded video rather than filtering it away before encoding (default: 8).

       predia=<-99-6>
              diamond type and size for motion estimation pre-pass

       dia=<-99-6>
              Diamond type & size for motion estimation.  Motion search is an iterative process.  Using a small diamond does not limit the  search
              to finding only small motion vectors.  It is just somewhat more likely to stop before finding the very best motion vector, especial‐
              ly when noise is involved.  Bigger diamonds allow a wider search for the best motion vector, thus are slower but  result  in  better
              quality.
              Big normal diamonds are better quality than shape-adaptive diamonds.
              Shape-adaptive diamonds are a good tradeoff between speed and quality.
              NOTE: The sizes of the normal diamonds and shape adaptive ones do not have the same meaning.

                 -3   shape adaptive (fast) diamond with size 3

                 -2   shape adaptive (fast) diamond with size 2

                 -1   uneven multi-hexagon search (slow)

                 1    normal size=1 diamond (default) =EPZS type diamond
                            0
                           000
                            0

                 2    normal size=2 diamond
                            0
                           000
                          00000
                           000
                            0

       trell
              Trellis searched quantization.  This will find the optimal encoding for each 8x8 block.  Trellis searched quantization is quite sim‐
              ply an optimal quantization in the PSNR versus bitrate sense (Assuming that there would be no rounding errors introduced by the  ID‐
              CT, which is obviously not the case.).  It simply finds a block for the minimum of error and lambda*bits.
                 lambda
                      quantization parameter (QP) dependent constant
                 bits
                      amount of bits needed to encode the block
                 error
                      sum of squared errors of the quantization

       cbp
              Rate distorted optimal coded block pattern.  Will select the coded block pattern which minimizes distortion + lambda*rate.  This can
              only be used together with trellis quantization.

       mv0
              Try to encode each MB with MV=<0,0> and choose the better one.  This has no effect if mbd=0.

       mv0_threshold=<any non-negative integer>
              When surrounding motion vectors are <0,0> and the motion estimation score of the current block is less than mv0_threshold, <0,0>  is
              used  for  the motion vector and further motion estimation is skipped (default: 256).  Lowering mv0_threshold to 0 can give a slight
              (0.01dB) PSNR increase and possibly make the encoded video look slightly better; raising mv0_threshold past 320  results  in  dimin‐
              ished  PSNR and visual quality.  Higher values speed up encoding very slightly (usually less than 1%, depending on the other options
              used).
              NOTE: This option does not require mv0 to be enabled.

       qprd (mbd=2 only)
              rate distorted optimal quantization parameter (QP) for the given lambda of each macroblock

       last_pred=<0-99>
              amount of motion predictors from the previous frame
                 0    (default)
                 a    Will use 2a+1 x 2a+1 macroblock square of motion vector predictors from the previous frame.

       preme=<0-2>
              motion estimation pre-pass
                 0    disabled
                 1    only after I-frames (default)
                 2    always

       subq=<1-8>
              subpel refinement quality (for qpel) (default: 8 (high quality))
              NOTE: This has a significant effect on speed.

       refs=<1-8>
              number of reference frames to consider for motion compensation (Snow only) (default: 1)

       psnr
              print the PSNR (peak signal to noise ratio) for the whole video after encoding and store the per frame PSNR in a file  with  a  name
              like 'psnr_hhmmss.log'.  Returned values are in dB (decibel), the higher the better.

       mpeg_quant
              Use MPEG quantizers instead of H.263.

       aic
              Enable  AC  prediction  for MPEG-4 or advanced intra prediction for H.263+.  This will improve quality very slightly (around 0.02 dB
              PSNR) and slow down encoding very slightly (about 1%).
              NOTE: vqmin should be 8 or larger for H.263+ AIC.

       aiv
              alternative inter vlc for H.263+

       umv
              unlimited MVs (H.263+ only) Allows encoding of arbitrarily long MVs.

       ibias=<-256-256>
              intra quantizer bias (256 equals 1.0, MPEG style quantizer default: 96, H.263 style quantizer default: 0)
              NOTE: The H.263 MMX quantizer cannot handle positive biases (set vfdct=1 or 2), the MPEG MMX quantizer cannot handle negative biases
              (set vfdct=1 or 2).

       pbias=<-256-256>
              inter quantizer bias (256 equals 1.0, MPEG style quantizer default: 0, H.263 style quantizer default: -64)
              NOTE: The H.263 MMX quantizer cannot handle positive biases (set vfdct=1 or 2), the MPEG MMX quantizer cannot handle negative biases
              (set vfdct=1 or 2).
              HINT: A more positive bias (-32 - -16 instead of -64) seems to improve the PSNR.

       nr=<0-100000>
              Noise reduction, 0 means disabled.  0-600 is a useful range for typical content, but you may want to turn it up a bit more for  very
              noisy  content  (default:  0).  Given its small impact on speed, you might want to prefer to use this over filtering noise away with
              video filters like denoise3d or hqdn3d.

       qns=<0-3>
              Quantizer noise shaping.  Rather than choosing quantization to most closely match the source video in the  PSNR  sense,  it  chooses
              quantization  such  that noise (usually ringing) will be masked by similar-frequency content in the image.  Larger values are slower
              but may not result in better quality.  This can and should be used together with trellis quantization, in  which  case  the  trellis
              quantization (optimal for constant weight) will be used as startpoint for the iterative search.
                 0    disabled (default)
                 1    Only lower the absolute value of coefficients.
                 2    Only change coefficients before the last non-zero coefficient + 1.
                 3    Try all.

       inter_matrix=<comma separated matrix>
              Use custom inter matrix.  It needs a comma separated string of 64 integers.

       intra_matrix=<comma separated matrix>
              Use custom intra matrix.  It needs a comma separated string of 64 integers.

       vqmod_amp
              experimental quantizer modulation

       vqmod_freq
              experimental quantizer modulation

       dc
              intra DC precision in bits (default: 8).  If you specify vcodec=mpeg2video this value can be 8, 9, 10 or 11.

       cgop (also see sc_threshold)
              Close all GOPs.  Currently it only works if scene change detection is disabled (sc_threshold=1000000000).

       gmc
              Enable Global Motion Compensation.

       (no)lowdelay
              Sets the low delay flag for MPEG-1/2 (disables B-frames).

       vglobal=<0-3>
              Control writing global video headers.
                 0    Codec decides where to write global headers (default).
                 1    Write global headers only in extradata (needed for .mp4/MOV/NUT).
                 2    Write global headers only in front of keyframes.
                 3    Combine 1 and 2.

       aglobal=<0-3>
              Same as vglobal for audio headers.

       level=<value>
              Set CodecContext Level.  Use 31 or 41 to play video on a Playstation 3.

       skip_exp=<0-1000000>
              FIXME: Document this.

       skip_factor=<0-1000000>
              FIXME: Document this.

       skip_threshold=<0-1000000>
              FIXME: Document this.

   nuv (-nuvopts)
       Nuppel  video is based on RTJPEG and LZO.  By default frames are first encoded with RTJPEG and then compressed with LZO, but it is possible
       to disable either or both of the two passes.  As a result, you can in fact output raw i420, LZO compressed i420, RTJPEG, or the default LZO
       compressed RTJPEG.
       NOTE: The nuvrec documentation contains some advice and examples about the settings to use for the most common TV encodings.

       c=<0-20>
              chrominance threshold (default: 1)

       l=<0-20>
              luminance threshold (default: 1)

       lzo
              Enable LZO compression (default).

       nolzo
              Disable LZO compression.

       q=<3-255>
              quality level (default: 255)

       raw
              Disable RTJPEG encoding.

       rtjpeg
              Enable RTJPEG encoding (default).

   xvidenc (-xvidencopts)
       There are three modes available: constant bitrate (CBR), fixed quantizer and two pass.

       pass=<1|2>
              Specify the pass in two pass mode.

       turbo (two pass only)
              Dramatically  speeds up pass one using faster algorithms and disabling CPU-intensive options.  This will probably reduce global PSNR
              a little bit and change individual frame type and PSNR a little bit more.

       bitrate=<value> (CBR or two pass mode)
              Sets the bitrate to be used in kbits/second if <16000 or in bits/second if >16000.  If <value> is negative, Xvid will use its  abso‐
              lute value as the target size (in kBytes) of the video and compute the associated bitrate automagically (default: 687 kbits/s).

       fixed_quant=<1-31>
              Switch to fixed quantizer mode and specify the quantizer to be used.

       zones=<zone0>[/<zone1>[/...]] (CBR or two pass mode)
              User specified quality for specific parts (ending, credits, ...).  Each zone is <start-frame>,<mode>,<value> where <mode> may be
                 q    Constant quantizer override, where value=<2.0-31.0> represents the quantizer value.
                 w    Ratecontrol weight override, where value=<0.01-2.00> represents the quality correction in %.

              EXAMPLE:
                 zones=90000,q,20
                      Encodes all frames starting with frame 90000 at constant quantizer 20.
                 zones=0,w,0.1/10001,w,1.0/90000,q,20
                      Encode frames 0-10000 at 10% bitrate, encode frames 90000 up to the end at constant quantizer 20.  Note that the second zone
                      is needed to delimit the first zone, as without it everything up until frame 89999 would be encoded at 10% bitrate.

       me_quality=<0-6>
              This option controls the motion estimation subsystem.  The higher the value, the more precise the estimation should be (default: 6).
              The  more  precise the motion estimation is, the more bits can be saved.  Precision is gained at the expense of CPU time so decrease
              this setting if you need realtime encoding.

       (no)qpel
              MPEG-4 uses a half pixel precision for its motion search by default.  The standard proposes a mode where encoders are allowed to use
              quarter  pixel precision.  This option usually results in a sharper image.  Unfortunately it has a great impact on bitrate and some‐
              times the higher bitrate use will prevent it from giving a better image quality at a fixed bitrate.  It is better to test  with  and
              without this option and see whether it is worth activating.

       (no)gmc
              Enable Global Motion Compensation, which makes Xvid generate special frames (GMC-frames) which are well suited for Pan/Zoom/Rotating
              images.  Whether or not the use of this option will save bits is highly dependent on the source material.

       (no)trellis
              Trellis Quantization is a kind of adaptive quantization method that saves bits by modifying quantized coefficients to make them more
              compressible  by  the  entropy  encoder.  Its impact on quality is good, and if VHQ uses too much CPU for you, this setting can be a
              good alternative to save a few bits (and gain quality at fixed bitrate) at a lesser cost than with VHQ (default: on).

       (no)cartoon
              Activate this if your encoded sequence is an anime/cartoon.  It modifies some Xvid internal thresholds so Xvid  takes  better  deci‐
              sions on frame types and motion vectors for flat looking cartoons.

       (no)chroma_me
              The  usual  motion  estimation algorithm uses only the luminance information to find the best motion vector.  However for some video
              material, using the chroma planes can help find better vectors.  This setting toggles the use of chroma planes for motion estimation
              (default: on).

       (no)chroma_opt
              Enable  a  chroma  optimizer  prefilter.   It will do some extra magic on color information to minimize the stepped-stairs effect on
              edges.  It will improve quality at the cost of encoding speed.  It reduces PSNR by nature, as  the  mathematical  deviation  to  the
              original  picture  will  get  bigger, but the subjective image quality will raise.  Since it works with color information, you might
              want to turn it off when encoding in grayscale.

       (no)hq_ac
              Activates high-quality prediction of AC coefficients for intra frames from neighbor blocks (default: on).

       vhq=<0-4>
              The motion search algorithm is based on a search in the usual color domain and tries to find a motion vector that minimizes the dif‐
              ference  between  the  reference  frame and the encoded frame.  With this setting activated, Xvid will also use the frequency domain
              (DCT) to search for a motion vector that minimizes not only the spatial difference but  also  the  encoding  length  of  the  block.
              Fastest to slowest:
                 0    off
                 1    mode decision (inter/intra MB) (default)
                 2    limited search
                 3    medium search
                 4    wide search

       (no)lumi_mask
              Adaptive  quantization  allows  the macroblock quantizers to vary inside each frame.  This is a 'psychosensory' setting that is sup‐
              posed to make use of the fact that the human eye tends to notice fewer details in very bright and very dark parts  of  the  picture.
              It  compresses  those  areas  more  strongly than medium ones, which will save bits that can be spent again on other frames, raising
              overall subjective quality and possibly reducing PSNR.

       (no)grayscale
              Make Xvid discard chroma planes so the encoded video is grayscale only.  Note that this does not speed up encoding, it just prevents
              chroma data from being written in the last stage of encoding.

       (no)interlacing
              Encode the fields of interlaced video material.  Turn this option on for interlaced content.
              NOTE:   Should   you   rescale   the   video,  you  would  need  an  interlace-aware  resizer,  which  you  can  activate  with  -vf
              scale=<width>:<height>:1.

       min_iquant=<0-31>
              minimum I-frame quantizer (default: 2)

       max_iquant=<0-31>
              maximum I-frame quantizer (default: 31)

       min_pquant=<0-31>
              minimum P-frame quantizer (default: 2)

       max_pquant=<0-31>
              maximum P-frame quantizer (default: 31)

       min_bquant=<0-31>
              minimum B-frame quantizer (default: 2)

       max_bquant=<0-31>
              maximum B-frame quantizer (default: 31)

       min_key_interval=<value> (two pass only)
              minimum interval between keyframes (default: 0)

       max_key_interval=<value>
              maximum interval between keyframes (default: 10*fps)

       quant_type=<h263|mpeg>
              Sets the type of quantizer to use.  For high bitrates, you will find that MPEG quantization preserves  more  detail.   For  low  bi‐
              trates, the smoothing of H.263 will give you less block noise.  When using custom matrices, MPEG quantization must be used.

       quant_intra_matrix=<filename>
              Load a custom intra matrix file.  You can build such a file with xvid4conf's matrix editor.

       quant_inter_matrix=<filename>
              Load a custom inter matrix file.  You can build such a file with xvid4conf's matrix editor.

       keyframe_boost=<0-1000> (two pass mode only)
              Shift  some bits from the pool for other frame types to intra frames, thus improving keyframe quality.  This amount is an extra per‐
              centage, so a value of 10 will give your keyframes 10% more bits than normal (default: 0).

       kfthreshold=<value> (two pass mode only)
              Works together with kfreduction.  Determines the minimum distance below which you consider that two frames are  considered  consecu‐
              tive and treated differently according to kfreduction (default: 10).

       kfreduction=<0-100> (two pass mode only)
              The above two settings can be used to adjust the size of keyframes that you consider too close to the first (in a row).  kfthreshold
              sets the range in which keyframes are reduced, and kfreduction determines the bitrate reduction they get.  The last I-frame will get
              treated normally (default: 30).

       max_bframes=<0-4>
              Maximum number of B-frames to put between I/P-frames (default: 2).

       bquant_ratio=<0-1000>
              quantizer ratio between B- and non-B-frames, 150=1.50 (default: 150)

       bquant_offset=<-1000-1000>
              quantizer offset between B- and non-B-frames, 100=1.00 (default: 100)

       bf_threshold=<-255-255>
              This  setting allows you to specify what priority to place on the use of B-frames.  The higher the value, the higher the probability
              of B-frames being used (default: 0).  Do not forget that B-frames usually have a higher quantizer, and therefore aggressive  produc‐
              tion of B-frames may cause worse visual quality.

       (no)closed_gop
              This option tells Xvid to close every GOP (Group Of Pictures bounded by two I-frames), which makes GOPs independent from each other.
              This just implies that the last frame of the GOP is either a P-frame or a N-frame but not a B-frame.  It is usually a good  idea  to
              turn this option on (default: on).

       (no)packed
              This  option  is  meant  to  solve frame-order issues when encoding to container formats like AVI that cannot cope with out-of-order
              frames.  In practice, most decoders (both software and hardware) are able to deal with frame-order themselves, and may get  confused
              when this option is turned on, so you can safely leave if off, unless you really know what you are doing.
              WARNING: This will generate an illegal bitstream, and will not be decodable by ISO-MPEG-4 decoders except DivX/libavcodec/Xvid.
              WARNING: This will also store a fake DivX version in the file so the bug autodetection of some decoders might be confused.

       frame_drop_ratio=<0-100> (max_bframes=0 only)
              This  setting  allows the creation of variable framerate video streams.  The value of the setting specifies a threshold under which,
              if the difference of the following frame to the previous frame is below or equal to this threshold, a frame gets  not  coded  (a  so
              called n-vop is placed in the stream).  On playback, when reaching an n-vop the previous frame will be displayed.
              WARNING: Playing with this setting may result in a jerky video, so use it at your own risks!

       rc_reaction_delay_factor=<value>
              This  parameter  controls the number of frames the CBR rate controller will wait before reacting to bitrate changes and compensating
              for them to obtain a constant bitrate over an averaging range of frames.

       rc_averaging_period=<value>
              Real CBR is hard to achieve.  Depending on the video material, bitrate can be variable, and hard to predict.  Therefore Xvid uses an
              averaging  period  for which it guarantees a given amount of bits (minus a small variation).  This settings expresses the "number of
              frames" for which Xvid averages bitrate and tries to achieve CBR.

       rc_buffer=<value>
              size of the rate control buffer

       curve_compression_high=<0-100>
              This setting allows Xvid to take a certain percentage of bits away from high bitrate scenes and give them back to the bit reservoir.
              You  could also use this if you have a clip with so many bits allocated to high-bitrate scenes that the low(er)-bitrate scenes start
              to look bad (default: 0).

       curve_compression_low=<0-100>
              This setting allows Xvid to give a certain percentage of extra bits to the low bitrate scenes, taking a few  bits  from  the  entire
              clip.  This might come in handy if you have a few low-bitrate scenes that are still blocky (default: 0).

       overflow_control_strength=<0-100>
              During pass one of two pass encoding, a scaled bitrate curve is computed.  The difference between that expected curve and the result
              obtained during encoding is called overflow.  Obviously, the two pass rate controller tries to compensate for  that  overflow,  dis‐
              tributing  it  over the next frames.  This setting controls how much of the overflow is distributed every time there is a new frame.
              Low values allow lazy overflow control, big rate bursts are compensated for more slowly (could lead to lack of precision  for  small
              clips).  Higher values will make changes in bit redistribution more abrupt, possibly too abrupt if you set it too high, creating ar‐
              tifacts (default: 5).
              NOTE: This setting impacts quality a lot, play with it carefully!

       max_overflow_improvement=<0-100>
              During the frame bit allocation, overflow control may increase the frame size.  This parameter specifies the maximum  percentage  by
              which the overflow control is allowed to increase the frame size, compared to the ideal curve allocation (default: 5).

       max_overflow_degradation=<0-100>
              During  the  frame bit allocation, overflow control may decrease the frame size.  This parameter specifies the maximum percentage by
              which the overflow control is allowed to decrease the frame size, compared to the ideal curve allocation (default: 5).

       container_frame_overhead=<0...>
              Specifies a frame average overhead per frame, in bytes.  Most of the time users express their target bitrate for  video  w/o  taking
              care  of  the  video  container  overhead.  This small but (mostly) constant overhead can cause the target file size to be exceeded.
              Xvid allows users to set the amount of overhead per frame the container generates (give only an average per frame).  0 has a special
              meaning, it lets Xvid use its own default values (default: 24 - AVI average overhead).

       profile=<profile_name>
              Restricts  options  and  VBV (peak bitrate over a short period) according to the Simple, Advanced Simple and DivX profiles.  The re‐
              sulting videos should be playable on standalone players adhering to these profile specifications.
                 unrestricted
                      no restrictions (default)
                 sp0
                      simple profile at level 0
                 sp1
                      simple profile at level 1
                 sp2
                      simple profile at level 2
                 sp3
                      simple profile at level 3
                 sp4a
                      simple profile at level 4a
                 sp5
                      simple profile at level 5
                 sp6
                      simple profile at level 6
                 asp0
                      advanced simple profile at level 0
                 asp1
                      advanced simple profile at level 1
                 asp2
                      advanced simple profile at level 2
                 asp3
                      advanced simple profile at level 3
                 asp4
                      advanced simple profile at level 4
                 asp5
                      advanced simple profile at level 5
                 dxnhandheld
                      DXN handheld profile
                 dxnportntsc
                      DXN portable NTSC profile
                 dxnportpal
                      DXN portable PAL profile
                 dxnhtntsc
                      DXN home theater NTSC profile
                 dxnhtpal
                      DXN home theater PAL profile
                 dxnhdtv
                      DXN HDTV profile
              NOTE: These profiles should be used in conjunction with an appropriate -ffourcc.  Generally DX50 is applicable, as some  players  do
              not recognize Xvid but most recognize DivX.

       par=<mode>
              Specifies  the  Pixel  Aspect Ratio mode (not to be confused with DAR, the Display Aspect Ratio).  PAR is the ratio of the width and
              height of a single pixel.  So both are related like this: DAR = PAR * (width/height).
              MPEG-4 defines 5 pixel aspect ratios and one extended one, giving the opportunity to specify a specific pixel aspect ratio.  5 stan‐
              dard modes can be specified:
                 vga11
                      It is the usual PAR for PC content.  Pixels are a square unit.
                 pal43
                      PAL standard 4:3 PAR.  Pixels are rectangles.
                 pal169
                      same as above
                 ntsc43
                      same as above
                 ntsc169
                      same as above (Do not forget to give the exact ratio.)
                 ext
                      Allows you to specify your own pixel aspect ratio with par_width and par_height.
              NOTE: In general, setting aspect and autoaspect options is enough.

       par_width=<1-255> (par=ext only)
              Specifies the width of the custom pixel aspect ratio.

       par_height=<1-255> (par=ext only)
              Specifies the height of the custom pixel aspect ratio.

       aspect=<x/y | f (float value)>
              Store movie aspect internally, just like MPEG files.  Much nicer solution than rescaling, because quality is not decreased.  MPlayer
              and a few others players will play these files correctly, others will display them with the wrong aspect.  The aspect parameter  can
              be given as a ratio or a floating point number.

       (no)autoaspect
              Same  as the aspect option, but automatically computes aspect, taking into account all the adjustments (crop/expand/scale/etc.) made
              in the filter chain.

       psnr
              Print the PSNR (peak signal to noise ratio) for the whole video after encoding and store the per frame PSNR in a file  with  a  name
              like 'psnr_hhmmss.log' in the current directory.  Returned values are in dB (decibel), the higher the better.

       debug
              Save per-frame statistics in ./xvid.dbg. (This is not the two pass control file.)

       The following options are only available in Xvid 1.1.x and later.

       bvhq=<0|1>
              This  setting  allows  vector candidates for B-frames to be used for the encoding chosen using a rate distortion optimized operator,
              which is what is done for P-frames by the vhq option.  This produces nicer-looking B-frames while incurring  almost  no  performance
              penalty (default: 1).

       vbv_bufsize=<0...> (two pass mode only)
              Specify  the  video buffering verifier (VBV) buffer size in bits (default: 0 - VBV check disabled).  VBV allows restricting peak bi‐
              trate to make the video play properly on hardware players.  For example, the Home profile  uses  vbv_bufsize=3145728.   If  you  set
              vbv_bufsize  you  should set also vbv_maxrate.  Note that there is no vbv_peakrate because Xvid does not actually use it for bitrate
              controlling; the other VBV options are enough to restrict the peak bitrate.

       vbv_initial=<0...vbv_bufsize> (two pass mode only)
              Specify the initial fill of the VBV buffer in bits (default: 75% of vbv_bufsize).  The default is probably what you want.

       vbv_maxrate=<0...> (two pass mode only)
              Specify the maximum processing rate in bits/s (default: 0).  For example, the Home profile uses vbv_maxrate=4854000.

       The following option is only available in Xvid 1.2.x and later.

       threads=<0-n>
              Create n threads to run the motion estimation (default: 0).  The maximum number of threads that can be used is  the  picture  height
              divided by 16.

   x264enc (-x264encopts)
       bitrate=<value>
              Sets  the  average  bitrate to be used in kbits/second (default: off).  Since local bitrate may vary, this average may be inaccurate
              for very short videos (see ratetol).  Constant bitrate can be achieved by combining this with vbv_maxrate, at significant  reduction
              in quality.

       qp=<0-51>
              This  selects the quantizer to use for P-frames.  I- and B-frames are offset from this value by ip_factor and pb_factor, respective‐
              ly.  20-40 is a useful range.  Lower values result in better fidelity, but higher bitrates.  0 is lossless.  Note that  quantization
              in  H.264 works differently from MPEG-1/2/4: H.264's quantization parameter (QP) is on a logarithmic scale.  The mapping is approxi‐
              mately H264QP = 12 + 6*log2(MPEGQP).  For example, MPEG at QP=2 is equivalent to H.264 at QP=18.  Generally, this option  should  be
              avoided and crf should be used instead as crf will yield better visual results for the same size.

       crf=<1.0-50.0>
              Enables constant quality mode, and selects the quality.  The scale is similar to QP.  Like the bitrate-based modes, this allows each
              frame to use a different QP based on the frame's complexity.  This option should generally be used instead of qp.

       crf_max=<float>
              With CRF and VBV, limit RF to this value (may cause VBV underflows!).

       pass=<1-3>
              Enable 2 or 3-pass mode.  It is recommended to always encode in 2 or 3-pass mode as it leads to a better bit  distribution  and  im‐
              proves overall quality.
                 1    first pass
                 2    second pass (of two pass encoding)
                 3    Nth pass (second and third passes of three pass encoding)
              Here is how it works, and how to use it:
              The  first  pass  (pass=1) collects statistics on the video and writes them to a file.  You might want to deactivate some CPU-hungry
              options, apart from the ones that are on by default.
              In two pass mode, the second pass (pass=2) reads the statistics file and bases ratecontrol decisions on it.
              In three pass mode, the second pass (pass=3, that is not a typo) does both: It first reads the  statistics,  then  overwrites  them.
              You can use all encoding options, except very CPU-hungry options.
              The  third  pass  (pass=3) is the same as the second pass, except that it has the second pass' statistics to work from.  You can use
              all encoding options, including CPU-hungry ones.
              The first pass may use either average bitrate or constant quantizer.  ABR is recommended, since it does not require guessing a quan‐
              tizer.  Subsequent passes are ABR, and must specify bitrate.

       profile=<name>
              Constrain options to be compatible with an H.264 profile.
                 baseline
                      no8x8dct bframes=0 nocabac cqm=flat weightp=0 nointerlaced qp>0
                 main no8x8dct cqm=flat qp>0
                 high qp>0 (default)

       preset=<name>
              Use a preset to select encoding settings.
                 ultrafast
                      no8x8dct  aq_mode=0 b_adapt=0 bframes=0 nodeblock nombtree me=dia nomixed_refs partitions=none ref=1 scenecut=0 subq=0 trel‐
                      lis=0 noweight_b weightp=0
                 superfast
                      nombtree me=dia nomixed_refs partitions=i8x8,i4x4 ref=1 subq=1 trellis=0 weightp=0
                 veryfast
                      nombtree nomixed_refs ref=1 subq=2 trellis=0 weightp=0
                 faster
                      nomixed_refs rc_lookahead=20 ref=5 subq=4 weightp=1
                 fast rc_lookahead=30 ref=2 subq=6
                 medium
                      Default settings apply.
                 slow b_adapt=2 direct=auto me=umh rc_lookahead=50 ref=5 subq=8
                 slower
                      b_adapt=2 direct=auto me=umh partitions=all rc_lookahead=60 ref=8 subq=9 trellis=2
                 veryslow
                      b_adapt=2 b_frames=8 direct=auto me=umh me_range=24 partitions=all ref=16 subq=10 trellis=2 rc_lookahead=60
                 placebo
                      bframes=16 b_adapt=2 direct=auto nofast_pskip me=tesa me_range=24 partitions=all rc_lookahead=60 ref=16 subq=10 trellis=2

       tune=<name,[name,...]>
              Tune the settings for a particular type of source or situation.  All tuned settings are overridden by explicit user-settings.   Mul‐
              tiple tunings are separated by commas, but only one psy tuning can be used at a time.
                 film (psy tuning)
                      deblock=-1,-1 psy-rd=<unset>,0.15
                 animation (psy tuning)
                      b_frames={+2} deblock=1,1 psy-rd=0.4:<unset> aq_strength=0.6 ref={double if >1 else 1}
                 grain (psy tuning)
                      aq_strength=0.5  nodct_decimate  deadzone_inter=6 deadzone_intra=6 deblock=-2,-2 ipratio=1.1 pbratio=1.1 psy-rd=<unset>,0.25
                      qcomp=0.8
                 stillimage (psy tuning)
                      aq_strength=1.2 deblock=-3,-3 psy-rd=2.0,0.7
                 psnr (psy tuning)
                      aq_mode=0 nopsy
                 ssim (psy tuning)
                      aq_mode=2 nopsy
                 fastdecode
                      nocabac nodeblock noweight_b weightp=0
                 zerolatency
                      bframes=0 force_cfr rc_lookahead=0 sync_lookahead=0 sliced_threads

       slow_firstpass
              Disables the following faster options with pass=1: no_8x8dct me=dia partitions=none ref=1 subq={2 if >2  else  unchanged}  trellis=0
              fast_pskip.  These settings significantly improve encoding speed while having little or no impact on the quality of the final pass.
              This option is implied with preset=placebo.

       keyint=<value>
              Sets maximum interval between IDR-frames (default: 250).  Larger values save bits, thus improve quality, at the cost of seeking pre‐
              cision.  Unlike MPEG-1/2/4, H.264 does not suffer from DCT drift with large values of keyint.

       keyint_min=<1-keyint/2>
              Sets minimum interval between IDR-frames (default: auto).  If scenecuts appear within this interval, they are still  encoded  as  I-
              frames,  but do not start a new GOP.  In H.264, I-frames do not necessarily bound a closed GOP because it is allowable for a P-frame
              to be predicted from more frames than just the one frame before it (also see frameref).  Therefore,  I-frames  are  not  necessarily
              seekable.  IDR-frames restrict subsequent P-frames from referring to any frame prior to the IDR-frame.

       scenecut=<-1-100>
              Controls how aggressively to insert extra I-frames (default: 40).  With small values of scenecut, the codec often has to force an I-
              frame when it would exceed keyint.  Good values of scenecut may find a better location for the I-frame.  Large values  use  more  I-
              frames  than  necessary,  thus wasting bits.  -1 disables scene-cut detection, so I-frames are inserted only once every other keyint
              frames, even if a scene-cut occurs earlier.  This is not recommended and wastes bitrate as scenecuts encoded as P-frames are just as
              big as I-frames, but do not reset the "keyint counter".

       (no)intra_refresh
              Periodic intra block refresh instead of keyframes (default: disabled).  This option disables IDR-frames, and, instead, uses a moving
              vertical bar of intra-coded blocks. This reduces compression efficiency but benefits low-latency streaming and resilience to  packet
              loss.

       frameref=<1-16>
              Number  of previous frames used as predictors in B- and P-frames (default: 3).  This is effective in anime, but in live-action mate‐
              rial the improvements usually drop off very rapidly above 6 or so reference frames.  This has no effect on decoding speed, but  does
              increase the memory needed for decoding.  Some decoders can only handle a maximum of 15 reference frames.

       bframes=<0-16>
              maximum number of consecutive B-frames between I- and P-frames (default: 3)

       (no)b_adapt
              Automatically  decides  when  to use B-frames and how many, up to the maximum specified above (default: on).  If this option is dis‐
              abled, then the maximum number of B-frames is used.

       b_bias=<-100-100>
              Controls the decision performed by b_adapt.  A higher b_bias produces more B-frames (default: 0).

       b_pyramid=<normal|strict|none>
              Allows B-frames to be used as references for predicting other frames.  For example, consider 3 consecutive B-frames: I0 B1 B2 B3 P4.
              Without  this option, B-frames follow the same pattern as MPEG-[124].  So they are coded in the order I0 P4 B1 B2 B3, and all the B-
              frames are predicted from I0 and P4.  With this option, they are coded as I0 P4 B2 B1 B3.  B2 is the same as above, but B1  is  pre‐
              dicted  from  I0  and  B2,  and B3 is predicted from B2 and P4.  This usually results in slightly improved compression, at almost no
              speed cost.  However, this is an experimental option: it is not fully tuned and may not always help.  Requires bframes >= 2.  Disad‐
              vantage: increases decoding delay to 2 frames.
                 normal
                      Allow B-frames as references as described above (not Blu-ray compatible).
                 strict
                      Disallow P-frames referencing B-frames. Gives worse compression, but is required for Blu-ray compatibility.
                 none
                      Disable using B-frames as references.

       (no)open_gop
              Use recovery points to close GOPs; only available with bframes.

       (no)bluray_compat
              Enable compatibility hacks for Blu-Ray support.

       (no)fake_interlaced
              Flag  stream  as  interlaced but encode progressive. Makes it posssible to encode 25p and 30p Blu-Ray streams. Ignored in interlaced
              mode.

       frame_packing=<0-5>
              Define frame arrangement for stereoscopic videos.
                 0    Checkerboard - pixels are alternately from L and R.
                 1    Column alternation - L and R are interlaced by column.
                 2    Row alternation - L and R are interlaced by row.
                 3    Side by side - L is on the left, R is on the right.
                 4    Top-bottom - L is on top, R is on the bottom.
                 5    Frame alternation - one view per frame.

       (no)deblock
              Use deblocking filter (default: on).  As it takes very little time compared to its quality gain, it is not  recommended  to  disable
              it.

       deblock=<-6-6>,<-6-6>
              The  first parameter is AlphaC0 (default: 0).  This adjusts thresholds for the H.264 in-loop deblocking filter.  First, this parame‐
              ter adjusts the maximum amount of change that the filter is allowed to cause on any one pixel.  Secondly, this parameter affects the
              threshold  for difference across the edge being filtered.  A positive value reduces blocking artifacts more, but will also smear de‐
              tails.
              The second parameter is Beta (default: 0).  This affects the detail threshold.  Very detailed blocks are  not  filtered,  since  the
              smoothing caused by the filter would be more noticeable than the original blocking.
              The  default  behavior  of  the  filter almost always achieves optimal quality, so it is best to either leave it alone, or make only
              small adjustments.  However, if your source material already has some blocking or noise which you would like to remove, it may be  a
              good idea to turn it up a little bit.

       (no)cabac
              Use  CABAC  (Context-Adaptive  Binary  Arithmetic Coding) (default: on).  Slightly slows down encoding and decoding, but should save
              10-15% bitrate.  Unless you are looking for decoding speed, you should not disable it.

       qp_min=<1-51> (ABR or two pass)
              Minimum quantizer, 10-30 seems to be a useful range (default: 10).

       qp_max=<1-51> (ABR or two pass)
              maximum quantizer (default: 51)

       qp_step=<1-50> (ABR or two pass)
              maximum value by which the quantizer may be incremented/decremented between frames (default: 4)

       (no)mbtree
              Enable macroblock tree ratecontrol (default: enabled).  Use a large lookahead to track temporal propagation of data and weight qual‐
              ity accordingly.  In multi-pass mode, this writes to a separate stats file named <passlogfile>.mbtree.

       rc_lookahead=<0-250>
              Adjust  the  mbtree  lookahead  distance (default: 40).  Larger values will be slower and cause x264 to consume more memory, but can
              yield higher quality.

       ratetol=<0.1-100.0> (ABR or two pass)
              allowed variance in average bitrate (no particular units) (default: 1.0)

       vbv_maxrate=<value> (ABR or two pass)
              maximum local bitrate, in kbits/second (default: disabled)

       vbv_bufsize=<value> (ABR or two pass)
              averaging period for vbv_maxrate, in kbits (default: none, must be specified if vbv_maxrate is enabled)

       vbv_init=<0.0-1.0> (ABR or two pass)
              initial buffer occupancy, as a fraction of vbv_bufsize (default: 0.9)

       ip_factor=<value>
              quantizer factor between I- and P-frames (default: 1.4)

       pb_factor=<value>
              quantizer factor between P- and B-frames (default: 1.3)

       qcomp=<0-1> (ABR or two pass)
              quantizer compression (default: 0.6).  A lower value makes the bitrate more constant, while a higher value  makes  the  quantization
              parameter more constant.

       cplx_blur=<0-999> (two pass only)
              Temporal  blur of the estimated frame complexity, before curve compression (default: 20).  Lower values allow the quantizer value to
              jump around more, higher values force it to vary more smoothly.  cplx_blur ensures that each I-frame has quality comparable  to  the
              following  P-frames, and ensures that alternating high and low complexity frames (e.g. low fps animation) do not waste bits on fluc‐
              tuating quantizer.

       qblur=<0-99> (two pass only)
              Temporal blur of the quantization parameter, after curve compression (default: 0.5).  Lower values allow the quantizer value to jump
              around more, higher values force it to vary more smoothly.

       zones=<zone0>[/<zone1>[/...]]
              User  specified quality for specific parts (ending, credits, ...).  Each zone is <start-frame>,<end-frame>,<option> where option may
              be
                 q=<0-51>
                      quantizer
                 b=<0.01-100.0>
                      bitrate multiplier
              NOTE: The quantizer option is not strictly enforced.  It affects only the planning stage of ratecontrol, and  is  still  subject  to
              overflow compensation and qp_min/qp_max.

       direct_pred=<name>
              Determines the type of motion prediction used for direct macroblocks in B-frames.
                 none Direct macroblocks are not used.
                 spatial
                      Motion vectors are extrapolated from neighboring blocks.  (default)
                 temporal
                      Motion vectors are extrapolated from the following P-frame.
                 auto The codec selects between spatial and temporal for each frame.
              Spatial  and  temporal  are  approximately  the  same speed and PSNR, the choice between them depends on the video content.  Auto is
              slightly better, but slower.  Auto is most effective when combined with multipass.  direct_pred=none is both slower and lower quali‐
              ty.

       weightp
              Weighted P-frame prediction mode (default: 2).
                 0    disabled (fastest)
                 1    weighted refs (better quality)
                 2    weighted refs + duplicates (best)

       (no)weight_b
              Use weighted prediction in B-frames.  Without this option, bidirectionally predicted macroblocks give equal weight to each reference
              frame.  With this option, the weights are determined by the temporal position of the B-frame relative to the  references.   Requires
              bframes > 1.

       partitions=<list>
              Enable some optional macroblock types (default: p8x8,b8x8,i8x8,i4x4).
                 p8x8 Enable types p16x8, p8x16, p8x8.
                 p4x4 Enable types p8x4, p4x8, p4x4.  p4x4 is recommended only with subq >= 5, and only at low resolutions.
                 b8x8 Enable types b16x8, b8x16, b8x8.
                 i8x8 Enable type i8x8.  i8x8 has no effect unless 8x8dct is enabled.
                 i4x4 Enable type i4x4.
                 all  Enable all of the above types.
                 none Disable all of the above types.
              Regardless of this option, macroblock types p16x16, b16x16, and i16x16 are always enabled.
              The  idea is to find the type and size that best describe a certain area of the picture.  For example, a global pan is better repre‐
              sented by 16x16 blocks, while small moving objects are better represented by smaller blocks.

       (no)8x8dct
              Adaptive spatial transform size: allows macroblocks to choose between 4x4 and 8x8 DCT.  Also allows the i8x8 macroblock type.  With‐
              out this option, only 4x4 DCT is used.

       me=<name>
              Select fullpixel motion estimation algorithm.
                 dia  diamond search, radius 1 (fast)
                 hex  hexagon search, radius 2 (default)
                 umh  uneven multi-hexagon search (slow)
                 esa  exhaustive search (very slow, and no better than umh)

       me_range=<4-64>
              radius of exhaustive or multi-hexagon motion search (default: 16)

       subq=<0-11>
              Adjust subpel refinement quality.  This parameter controls quality versus speed tradeoffs involved in the motion estimation decision
              process.  subq=5 can compress up to 10% better than subq=1.
                 0    Runs fullpixel precision motion estimation on all candidate macroblock types.  Then selects the best type  with  SAD  metric
                      (faster than subq=1, not recommended unless you're looking for ultra-fast encoding).
                 1    Does as 0, then refines the motion of that type to fast quarterpixel precision (fast).
                 2    Runs  halfpixel precision motion estimation on all candidate macroblock types.  Then selects the best type with SATD metric.
                      Then refines the motion of that type to fast quarterpixel precision.
                 3    As 2, but uses a slower quarterpixel refinement.
                 4    Runs fast quarterpixel precision motion estimation on all candidate macroblock types.  Then selects the best type with  SATD
                      metric.  Then finishes the quarterpixel refinement for that type.
                 5    Runs  best  quality  quarterpixel  precision  motion estimation on all candidate macroblock types, before selecting the best
                      type.  Also refines the two motion vectors used in bidirectional macroblocks with SATD metric, rather than  reusing  vectors
                      from the forward and backward searches.
                 6    Enables rate-distortion optimization of macroblock types in I- and P-frames.
                 7    Enables rate-distortion optimization of macroblock types in all frames (default).
                 8    Enables rate-distortion optimization of motion vectors and intra prediction modes in I- and P-frames.
                 9    Enables rate-distortion optimization of motion vectors and intra prediction modes in all frames.
                 10   QP-RD; requires trellis=2 and aq_mode=1 or higher (best).
                 11   Full RD; disable all early terminations.
              In the above, "all candidates" does not exactly mean all enabled types: 4x4, 4x8, 8x4 are tried only if 8x8 is better than 16x16.

       (no)chroma_me
              Takes into account chroma information during subpixel motion search (default: enabled).  Requires subq>=5.

       (no)mixed_refs
              Allows  each  8x8  or 16x8 motion partition to independently select a reference frame.  Without this option, a whole macroblock must
              use the same reference.  Requires frameref>1.

       trellis=<0-2> (cabac only)
              rate-distortion optimal quantization
                 0    disabled
                 1    enabled only for the final encode (default)
                 2    enabled during all mode decisions (slow, requires subq>=6)

       psy-rd=rd[,trell]
              Sets the strength of the psychovisual optimization.
                 rd=<0.0-10.0>
                      psy optimization strength (requires subq>=6) (default: 1.0)
                 trell=<0.0-10.0>
                      trellis (requires trellis, experimental) (default: 0.0)

       (no)psy
              Enable psychovisual optimizations that hurt PSNR and SSIM but ought to look better (default: enabled).

       deadzone_inter=<0-32>
              Set the size of the inter luma quantization deadzone for non-trellis quantization (default: 21).  Lower values help to preserve fine
              details and film grain (typically useful for high bitrate/quality encode), while higher values help filter out these details to save
              bits that can be spent again on other macroblocks and frames (typically useful for bitrate-starved encodes).  It is recommended that
              you start by tweaking deadzone_intra before changing this parameter.

       deadzone_intra=<0-32>
              Set the size of the intra luma quantization deadzone for non-trellis quantization (default: 11).  This option has the same effect as
              deadzone_inter except that it affects intra frames.  It is recommended that you start by tweaking  this  parameter  before  changing
              deadzone_inter.

       (no)fast_pskip
              Performs  early skip detection in P-frames (default: enabled).  This usually improves speed at no cost, but it can sometimes produce
              artifacts in areas with no details, like sky.

       (no)dct_decimate
              Eliminate dct blocks in P-frames containing only a small single coefficient (default: enabled).  This will remove some  details,  so
              it  will  save  bits  that can be spent again on other frames, hopefully raising overall subjective quality.  If you are compressing
              non-anime content with a high target bitrate, you may want to disable this to preserve as much detail as possible.

       nr=<0-100000>
              Noise reduction, 0 means disabled.  100-1000 is a useful range for typical content, but you may want to turn it up a  bit  more  for
              very  noisy  content  (default: 0).  Given its small impact on speed, you might want to prefer to use this over filtering noise away
              with video filters like denoise3d or hqdn3d.

       chroma_qp_offset=<-12-12>
              Use a different quantizer for chroma as compared to luma.  Useful values are in the range <-2-2> (default: 0).

       aq_mode=<0-2>
              Defines how adaptive quantization (AQ) distributes bits:
                 0    disabled
                 1    Avoid moving bits between frames.
                 2    Move bits between frames (by default).

       aq_strength=<positive float value>
              Controls how much adaptive quantization (AQ) reduces blocking and blurring in flat and textured areas (default: 1.0).   A  value  of
              0.5 will lead to weak AQ and less details, when a value of 1.5 will lead to strong AQ and more details.

       cqm=<flat|jvt|<filename>>
              Either uses a predefined custom quantization matrix or loads a JM format matrix file.
                 flat
                      Use the predefined flat 16 matrix (default).
                 jvt
                      Use the predefined JVT matrix.
                 <filename>
                      Use the provided JM format matrix file.
              NOTE: Windows CMD.EXE users may experience problems with parsing the command line if they attempt to use all the CQM lists.  This is
              due to a command line length limitation.  In this case it is recommended the lists be put into a JM format CQM file  and  loaded  as
              specified above.

       cqm4iy=<list> (also see cqm)
              Custom 4x4 intra luminance matrix, given as a list of 16 comma separated values in the 1-255 range.

       cqm4ic=<list> (also see cqm)
              Custom 4x4 intra chrominance matrix, given as a list of 16 comma separated values in the 1-255 range.

       cqm4py=<list> (also see cqm)
              Custom 4x4 inter luminance matrix, given as a list of 16 comma separated values in the 1-255 range.

       cqm4pc=<list> (also see cqm)
              Custom 4x4 inter chrominance matrix, given as a list of 16 comma separated values in the 1-255 range.

       cqm8iy=<list> (also see cqm)
              Custom 8x8 intra luminance matrix, given as a list of 64 comma separated values in the 1-255 range.

       cqm8py=<list> (also see cqm)
              Custom 8x8 inter luminance matrix, given as a list of 64 comma separated values in the 1-255 range.

       level_idc=<10-51>
              Set  the  bitstream's level as defined by annex A of the H.264 standard (default: 51 - level 5.1).  This is used for telling the de‐
              coder what capabilities it needs to support.  Use this parameter only if you know what it means, and you have a need to set it.

       (no)cpu_independent
              Ensure exact reproducibility across different CPUs instead of chosing different algorithms when available/better (default:enabled).

       threads=<0-16>
              Spawn threads to encode in parallel on multiple CPUs (default: 0).  This has a slight penalty to compression quality.  0  or  'auto'
              tells x264 to detect how many CPUs you have and pick an appropriate number of threads.

       (no)sliced_threads
              Use slice-based threading (default: disabled).  Unlike normal threading, this option adds no encoding latency, but is slightly slow‐
              er and less effective at compression.

       slice_max_size=<0 or positive integer>
              Maximum slice size in bytes (default: 0).  A value of zero disables the maximum.

       slice_max_mbs=<0 or positive integer>
              Maximum slice size in number of macroblocks (default: 0).  A value of zero disables the maximum.

       slices=<0 or positive integer>
              Maximum number of slices per frame (default: 0).  A value of zero disables the maximum.

       sync_lookahead=<0-250>
              Adjusts the size of the threaded lookahead buffer (default: 0).  0 or 'auto' tells x264 to automatically determine buffer size.

       (no)deterministic
              Use only deterministic optimizations with multithreaded encoding (default: enabled).

       (no)global_header
              Causes SPS and PPS to appear only once, at the beginning of the bitstream (default: disabled).  Some players, such as the Sony  PSP,
              require the use of this option.  The default behavior causes SPS and PPS to repeat prior to each IDR frame.

       (no)tff
              Enable interlaced mode, top field first (default: disabled)

       (no)bff
              Enable interlaced mode, bottom field first (default: disabled)

       nal_hrd=<none|vbr|cbr>
              Signal HRD information (requires vbv_bufsize) (default: none).

       (no)pic_struct
              Force pic_struct in Picture Timing SEI (default: disabled).

       (no)constrained_intra
              Enable constrained intra prediction (default: disabled).  This significantly reduces compression, but is required for the base layer
              of SVC encodes.

       output_csp=<i420|i422|i444|rgb>
              Specify output colorspace (default: i420).

       (no)aud
              Write access unit delimeters to the stream (default: disabled).  Enable this only if your target container  format  requires  access
              unit delimiters.

       overscan=<undef|show|crop>
              Include VUI overscan information in the stream (default: disabled).  See doc/vui.txt in the x264 source code for more information.

       videoformat=<component|pal|ntsc|secam|mac|undef>
              Include  VUI  video  format  information in the stream (default: disabled).  This is a purely informative setting for describing the
              original source.  See doc/vui.txt in the x264 source code for more information.

       (no)fullrange
              Include VUI full range information in the stream (default: disabled).  Use this option if your source video is  not  range  limited.
              See doc/vui.txt in the x264 source code for more information.

       colorprim=<bt709|bt470m|bt470bg|smpte170m|smpte240m|film|undef>
              Include color primaries information (default: disabled).  This can be used for color correction.  See doc/vui.txt in the x264 source
              code for more information.

       transfer=<bt709|bt470m|bt470bg|linear|log100|log316|smpte170m|smpte240m>
              Include VUI transfer characteristics information in the stream (default: disabled).  This can be used  for  color  correction.   See
              doc/vui.txt in the x264 source code for more information.

       colormatrix=<bt709|fcc|bt470bg|smpte170m|smpte240m|GBR|YCgCo>
              Include  VUI  matrix coefficients in the stream (default: disabled).  This can be used for color correction.  See doc/vui.txt in the
              x264 source code for more information.

       chromaloc=<0-5>
              Include VUI chroma sample location information in the stream (default: disabled).  Use this option to ensure alignment of the chroma
              and luma planes after color space conversions.  See doc/vui.txt in the x264 source code for more information.

       log=<-1-3>
              Adjust the amount of logging info printed to the screen.
                 -1   none
                  0   Print errors only.
                  1   warnings
                  2   PSNR and other analysis statistics when the encode finishes (default)
                  3   PSNR, QP, frametype, size, and other statistics for every frame

       (no)psnr
              Print signal-to-noise ratio statistics.
              NOTE: The 'Y', 'U', 'V', and 'Avg' PSNR fields in the summary are not mathematically sound (they are simply the average of per-frame
              PSNRs).  They are kept only for comparison to the JM reference codec.  For all other purposes, please use either the 'Global'  PSNR,
              or the per-frame PSNRs printed by log=3.

       (no)ssim
              Print  the  Structural  Similarity  Metric results.  This is an alternative to PSNR, and may be better correlated with the perceived
              quality of the compressed video.

       (no)visualize
              Enable x264 visualizations during encoding.  If the x264 on your system supports it, a new window will be opened during the encoding
              process,  in which x264 will attempt to present an overview of how each frame gets encoded.  Each block type on the visualized movie
              will be colored as follows:

       dump_yuv=<file name>
              Dump YUV frames to the specified file.  For debugging use.
                 red/pink
                      intra block
                 blue
                      inter block
                 green
                      skip block
                 yellow
                      B-block
              This feature can be considered experimental and subject to change.  In particular, it depends on x264 being compiled with visualiza‐
              tions enabled.  Note that as of writing this, x264 pauses after encoding and visualizing each frame, waiting for the user to press a
              key, at which point the next frame will be encoded.

   xvfw (-xvfwopts)
       Encoding with Video for Windows codecs is mostly obsolete unless you wish to encode to some obscure fringe codec.

       codec=<name>
              The name of the binary codec file with which to encode.

       compdata=<file>
              The name of the codec settings file (like firstpass.mcf) created by vfw2menc.

   MPEG muxer (-mpegopts)
       The MPEG muxer can generate 5 types of streams, each of which has reasonable default parameters that the  user  can  override.   Generally,
       when  generating  MPEG  files,  it is advisable to disable MEncoder's frame-skip code (see -noskip, -mc as well as the harddup and softskip
       video filters).

       EXAMPLE:
                 format=mpeg2:tsaf:vbitrate=8000

       format=<mpeg1 | mpeg2 | xvcd | xsvcd | dvd | pes1 | pes2>
              stream format (default: mpeg2).  pes1 and pes2 are very broken formats (no pack header and no padding), but VDR uses  them;  do  not
              choose them unless you know exactly what you are doing.

       size=<up to 65535>
              Pack size in bytes, do not change unless you know exactly what you are doing (default: 2048).

       muxrate=<int>
              Nominal muxrate in kbit/s used in the pack headers (default: 1800 kb/s).  Will be updated as necessary in the case of 'format=mpeg1'
              or 'mpeg2'.

       tsaf
              Sets timestamps on all frames, if possible; recommended when format=dvd.  If dvdauthor complains with a message like "..audio sector
              out of range...", you probably did not enable this option.

       interleaving2
              Uses  a  better  algorithm  to interleave audio and video packets, based on the principle that the muxer will always try to fill the
              stream with the largest percentage of free space.

       vdelay=<1-32760>
              Initial video delay time, in milliseconds (default: 0), use it if you want to delay video with respect to audio.   It  doesn't  work
              with :drop.

       adelay=<1-32760>
              Initial audio delay time, in milliseconds (default: 0), use it if you want to delay audio with respect to video.

       drop
              When used with vdelay the muxer drops the part of audio that was anticipated.

       vwidth, vheight=<1-4095>
              Set the video width and height when video is MPEG-1/2.

       vpswidth, vpsheight=<1-4095>
              Set pan and scan video width and height when video is MPEG-2.

       vaspect=<1 | 4/3 | 16/9 | 221/100>
              Sets the display aspect ratio for MPEG-2 video.  Do not use it on MPEG-1 or the resulting aspect ratio will be completely wrong.

       vbitrate=<int>
              Sets the video bitrate in kbit/s for MPEG-1/2 video.

       vframerate=<24000/1001 | 24 | 25 | 30000/1001 | 30 | 50 | 60000/1001 | 60 >
              Sets the framerate for MPEG-1/2 video.  This option will be ignored if used with the telecine option.

       telecine
              Enables  3:2  pulldown soft telecine mode: The muxer will make the video stream look like it was encoded at 30000/1001 fps.  It only
              works with MPEG-2 video when the output framerate is 24000/1001 fps, convert it with -ofps if necessary.  Any other framerate is in‐
              compatible with this option.

       film2pal
              Enables FILM to PAL and NTSC to PAL soft telecine mode: The muxer will make the video stream look like it was encoded at 25 fps.  It
              only works with MPEG-2 video when the output framerate is 24000/1001 fps, convert it with -ofps if necessary.  Any  other  framerate
              is incompatible with this option.

       tele_src and tele_dest
              Enables  arbitrary telecining using Donand Graft's DGPulldown code.  You need to specify the original and the desired framerate; the
              muxer will make the video stream look like it was encoded at the desired framerate.  It only works with MPEG-2 video when the  input
              framerate is smaller than the output framerate and the framerate increase is <= 1.5.

              EXAMPLE:
                 tele_src=25,tele_dest=30000/1001
                      PAL to NTSC telecining

       vbuf_size=<40-1194>
              Sets the size of the video decoder's buffer, expressed in kilobytes.  Specify it only if the bitrate of the video stream is too high
              for the chosen format and if you know perfectly well what you are doing.  A too high value may lead to an unplayable movie,  depend‐
              ing on the player's capabilities.  When muxing HDTV video a value of 400 should suffice.

       abuf_size=<4-64>
              Sets the size of the audio decoder's buffer, expressed in kilobytes.  The same principle as for vbuf_size applies.

   FFmpeg libavformat demuxers (-lavfdopts)
       analyzeduration=<value>
              Maximum length in seconds to analyze the stream properties.

       format=<value>
              Force a specific libavformat demuxer.

       o=<key>=<value>[,<key>=<value>[,...]]
              Pass AVOptions to libavformat demuxer.  Note, a patch to make the o= unneeded and pass all unknown options through the AVOption sys‐
              tem is welcome.  A full list of AVOptions can be found in the FFmpeg manual.  Note that some options may conflict with  MPlayer/MEn‐
              coder options.

              EXAMPLE:
                 o=ignidx

       probesize=<value>
              Maximum  amount  of data to probe during the detection phase.  In the case of MPEG-TS this value identifies the maximum number of TS
              packets to scan.

       cryptokey=<hexstring>
              Encryption key the demuxer should use.  This is the raw binary data of the key converted to a hexadecimal string.

   FFmpeg libavformat muxers (-lavfopts) (also see -of lavf)
       delay=<value>
              Currently only meaningful for MPEG[12]: Maximum allowed distance, in seconds, between the reference timer of the output stream (SCR)
              and  the  decoding timestamp (DTS) for any stream present (demux to decode delay).  Default is 0.7 (as mandated by the standards de‐
              fined by MPEG).  Higher values require larger buffers and must not be used.

       format=<container_format>
              Override which container format to mux into (default: autodetect from output file extension).
                 mpg
                      MPEG-1 systems and MPEG-2 PS
                 asf
                      Advanced Streaming Format
                 avi
                      Audio Video Interleave file
                 wav
                      Waveform Audio
                 swf
                      Macromedia Flash
                 flv
                      Macromedia Flash video files
                 rm
                      RealAudio and RealVideo
                 au
                      SUN AU format
                 nut
                      NUT open container format (experimental)
                 mov
                      QuickTime
                 mp4
                      MPEG-4 format
                 ipod
                      MPEG-4 format with extra header flags required by Apple iPod firmware
                 dv
                      Sony Digital Video container
                 matroska
                      Matroska

       muxrate=<rate>
              Nominal bitrate of the multiplex, in bits per second; currently it is meaningful only for MPEG[12].  Sometimes raising it is  neces‐
              sary in order to avoid "buffer underflows".

       o=<key>=<value>[,<key>=<value>[,...]]
              Pass AVOptions to libavformat muxer.  Note, a patch to make the o= unneeded and pass all unknown options through the AVOption system
              is welcome.  A full list of AVOptions can be found in the FFmpeg manual.  Note that some options may conflict with MEncoder options.

              EXAMPLE:
                 o=packetsize=100

       packetsize=<size>
              Size, expressed in bytes, of the unitary packet for the chosen format.  When muxing to MPEG[12] implementations the  default  values
              are: 2324 for [S]VCD, 2048 for all others formats.

       preload=<distance>
              Currently only meaningful for MPEG[12]: Initial distance, in seconds, between the reference timer of the output stream (SCR) and the
              decoding timestamp (DTS) for any stream present (demux to decode delay).

ENVIRONMENT VARIABLES
       There are a number of environment variables that can be used to control the behavior of MPlayer and MEncoder.

       MPLAYER_CHARSET (also see -msgcharset)
              Convert console messages to the specified charset (default: autodetect).  A value of "noconv" means no conversion.

       MPLAYER_HOME
              Directory where MPlayer looks for user settings.

       MPLAYER_VERBOSE (also see -v and -msglevel)
              Set the initial verbosity level across all message modules (default: 0).  The resulting verbosity corresponds to that of -msglevel 5
              plus the value of MPLAYER_VERBOSE.

   libaf:
       LADSPA_PATH
              If  LADSPA_PATH  is  set, it searches for the specified file.  If it is not set, you must supply a fully specified pathname.  FIXME:
              This is also mentioned in the ladspa section.

   libdvdcss:
       DVDCSS_CACHE
              Specify a directory in which to store title key values.  This will speed up descrambling of DVDs which are in the cache.  The  DVDC‐
              SS_CACHE directory is created if it does not exist, and a subdirectory is created named after the DVD's title or manufacturing date.
              If DVDCSS_CACHE is not set or is empty, libdvdcss will use the default value which is "${HOME}/.dvdcss/" under  Unix  and  "C:\Docu‐
              ments and Settings\$USER\Application Data\dvdcss\" under Win32.  The special value "off" disables caching.

       DVDCSS_METHOD
              Sets the authentication and decryption method that libdvdcss will use to read scrambled discs.  Can be one of title, key or disc.
                 key
                      is  the  default  method.  libdvdcss will use a set of calculated player keys to try and get the disc key.  This can fail if
                      the drive does not recognize any of the player keys.
                 disc
                      is a fallback method when key has failed.  Instead of using player keys, libdvdcss will crack the disc  key  using  a  brute
                      force algorithm.  This process is CPU intensive and requires 64 MB of memory to store temporary data.
                 title
                      is  the fallback when all other methods have failed.  It does not rely on a key exchange with the DVD drive, but rather uses
                      a crypto attack to guess the title key.  On rare cases this may fail because there is not enough encrypted data on the  disc
                      to  perform  a statistical attack, but in the other hand it is the only way to decrypt a DVD stored on a hard disc, or a DVD
                      with the wrong region on an RPC2 drive.

       DVDCSS_RAW_DEVICE
              Specify the raw device to use.  Exact usage will depend on your operating system, the Linux utility to set up raw devices is  raw(8)
              for instance.  Please note that on most operating systems, using a raw device requires highly aligned buffers: Linux requires a 2048
              bytes alignment (which is the size of a DVD sector).

       DVDCSS_VERBOSE
              Sets the libdvdcss verbosity level.
                 0    Outputs no messages at all.
                 1    Outputs error messages to stderr.
                 2    Outputs error messages and debug messages to stderr.

       DVDREAD_NOKEYS
              Skip retrieving all keys on startup.  Currently disabled.

       HOME   FIXME: Document this.

   libao2:
       AO_SUN_DISABLE_SAMPLE_TIMING
              FIXME: Document this.

       AUDIODEV
              FIXME: Document this.

       AUDIOSERVER
              Specifies the Network Audio System server to which the nas audio output driver should connect and the transport that should be used.
              If  unset  DISPLAY is used instead.  The transport can be one of tcp and unix.  Syntax is tcp/<somehost>:<someport>, <somehost>:<in‐
              stancenumber> or [unix]:<instancenumber>.  The NAS base port is 8000 and <instancenumber> is added to that.

              EXAMPLES:
                 AUDIOSERVER=somehost:0
                      Connect to NAS server on somehost using default port and transport.
                 AUDIOSERVER=tcp/somehost:8000
                      Connect to NAS server on somehost listening on TCP port 8000.
                 AUDIOSERVER=(unix)?:0
                      Connect to NAS server instance 0 on localhost using unix domain sockets.

       DISPLAY
              FIXME: Document this.

   vidix:
       VIDIX_CRT
              FIXME: Document this.

       VIDIXIVTVALPHA
              Set this to 'disable' in order to stop the VIDIX driver from controlling alphablending settings.  You can then manipulate  it  your‐
              self with 'ivtvfbctl'.

   osdep:
       TERM   FIXME: Document this.

   libvo:
       DISPLAY
              FIXME: Document this.

       FRAMEBUFFER
              FIXME: Document this.

       HOME   FIXME: Document this.

   libmpdemux:
       HOME   FIXME: Document this.

       HOMEPATH
              FIXME: Document this.

       http_proxy
              FIXME: Document this.

       LOGNAME
              FIXME: Document this.

       USERPROFILE
              FIXME: Document this.

   GUI:
       DISPLAY
              The name of the display to which the GUI should connect.

       HOME   The home directory of the current user.

   libavformat:
       AUDIO_FLIP_LEFT
              FIXME: Document this.

       BKTR_DEV
              FIXME: Document this.

       BKTR_FORMAT
              FIXME: Document this.

       BKTR_FREQUENCY
              FIXME: Document this.

       http_proxy
              FIXME: Document this.

       no_proxy
              FIXME: Document this.

FILES
       /usr/local/etc/mplayer/mplayer.conf
              MPlayer system-wide settings

       /usr/local/etc/mplayer/mencoder.conf
              MEncoder system-wide settings

       ~/.mplayer/config
              MPlayer user settings

       ~/.mplayer/mencoder.conf
              MEncoder user settings

       ~/.mplayer/input.conf
              input bindings (see '-input keylist' for the full list)

       ~/.mplayer/gui.conf
              GUI configuration file

       ~/.mplayer/gui.history
              GUI directory history

       ~/.mplayer/gui.pl
              GUI playlist

       ~/.mplayer/gui.url
              GUI URL list

       ~/.mplayer/font/
              font directory (There must be a font.desc file and files with .RAW extension.)

       ~/.mplayer/DVDkeys/
              cached CSS keys

EXAMPLES OF MPLAYER USAGE
       Quickstart Blu-ray playing:
       mplayer br:////path/to/disc
       mplayer br:// -bluray-device /path/to/disc

       Quickstart DVD playing:
       mplayer dvd://1

       Play in Japanese with English subtitles:
       mplayer dvd://1 -alang ja -slang en

       Play only chapters 5, 6, 7:
       mplayer dvd://1 -chapter 5-7

       Play only titles 5, 6, 7:
       mplayer dvd://5-7

       Play a multiangle DVD:
       mplayer dvd://1 -dvdangle 2

       Play from a different DVD device:
       mplayer dvd://1 -dvd-device /dev/dvd2

       Play DVD video from a directory with VOB files:
       mplayer dvd://1 -dvd-device /path/to/directory/

       Copy a DVD title to hard disk, saving to file title1.vob :
       mplayer dvd://1 -dumpstream -dumpfile title1.vob

       Play a DVD with dvdnav from path /dev/sr1:
       mplayer dvdnav:////dev/sr1

       Stream from HTTP:
       mplayer http://mplayer.hq/example.avi

       Stream using RTSP:
       mplayer rtsp://server.example.com/streamName

       Convert subtitles to MPsub format:
       mplayer dummy.avi -sub source.sub -dumpmpsub

       Convert subtitles to MPsub format without watching the movie:
       mplayer /dev/zero -rawvideo pal:fps=xx -demuxer rawvideo -vc null -vo null -noframedrop -benchmark -sub source.sub -dumpmpsub

       input from standard V4L:
       mplayer tv:// -tv driver=v4l:width=640:height=480:outfmt=i420 -vc rawi420 -vo xv

       Playback on Zoran cards (old style, deprecated):
       mplayer -vo zr -vf scale=352:288 file.avi

       Playback on Zoran cards (new style):
       mplayer -vo zr2 -vf scale=352:288,zrmjpeg file.avi

       Play DTS-CD with passthrough:
       mplayer -ac hwdts -rawaudio format=0x2001 -cdrom-device /dev/cdrom cdda://
       You can also use -afm hwac3 instead of -ac hwdts.  Adjust '/dev/cdrom' to match the CD-ROM device on your system.  If your external receiv‐
       er supports decoding raw DTS streams, you can directly play it via cdda:// without setting format, hwac3 or hwdts.

       Play a 6-channel AAC file with only two speakers:
       mplayer -rawaudio format=0xff -demuxer rawaudio -af pan=2:.32:.32:.39:.06:.06:.39:.17:-.17:-.17:.17:.33:.33 adts_he-aac160_51.aac
       You might want to play a bit with the pan values (e.g multiply with a value) to increase volume or avoid clipping.

       checkerboard invert with geq filter:
       mplayer -vf geq='128+(p(X\,Y)-128)*(0.5-gt(mod(X/SW\,128)\,64))*(0.5-gt(mod(Y/SH\,128)\,64))*4'

EXAMPLES OF MENCODER USAGE
       Encode DVD title #2, only selected chapters:
       mencoder dvd://2 -chapter 10-15 -o title2.avi -oac copy -ovc lavc -lavcopts vcodec=mpeg4

       Encode DVD title #2, resizing to 640x480:
       mencoder dvd://2 -vf scale=640:480 -o title2.avi -oac copy -ovc lavc -lavcopts vcodec=mpeg4

       Encode DVD title #2, resizing to 512xHHH (keep aspect ratio):
       mencoder dvd://2 -vf scale -zoom -xy 512 -o title2.avi -oac copy -ovc lavc -lavcopts vcodec=mpeg4

       The same, but with bitrate set to 1800kbit and optimized macroblocks:
       mencoder dvd://2 -o title2.avi -oac copy -ovc lavc -lavcopts vcodec=mpeg4:mbd=1:vbitrate=1800

       The same, but with MJPEG compression:
       mencoder dvd://2 -o title2.avi -oac copy -ovc lavc -lavcopts vcodec=mjpeg:mbd=1:vbitrate=1800

       Encode all *.jpg files in the current directory:
       mencoder "mf://*.jpg" -mf fps=25 -o output.avi -ovc lavc -lavcopts vcodec=mpeg4

       Encode from a tuner (specify a format with -vf format):
       mencoder -tv driver=v4l:width=640:height=480 tv:// -o tv.avi -ovc raw

       Encode from a pipe:
       rar p test-SVCD.rar | mencoder -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=800 -ofps 24 -

BUGS
       Don't panic.  If you find one, report it to us, but please make sure you have read all of the documentation first.  Also look out for  smi‐
       leys. :) Many bugs are the result of incorrect setup or parameter usage.  The bug reporting section of the documentation (http://www.mplay‐
       erhq.hu/DOCS/HTML/en/bugreports.html) explains how to create useful bug reports.

AUTHORS
       MPlayer was initially written by Arpad Gereoffy.  See the AUTHORS file for a list of some of the many other contributors.

       MPlayer is (C) 2000-2016 The MPlayer Team

       This man page was written mainly by Gabucino, Jonas Jermann and Diego Biurrun.  It is maintained by Diego Biurrun.  Please send mails about
       it to the MPlayer-DOCS mailing list.  Translation specific mails belong on the MPlayer-translations mailing list.

The MPlayer Project                                                 2015-02-13                                                          MPlayer(1)
