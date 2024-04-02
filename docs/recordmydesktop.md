RECORDMYDESKTOP(1)                                            General Commands Manual                                           RECORDMYDESKTOP(1)

NAME
       recordMyDesktop - record desktop sessions to an Ogg-Theora-Vorbis file.

SYNOPSIS
       recordmydesktop [ Options ]^ filename

DESCRIPTION
               recordMyDesktop produces a file(default out.ogv) that contains a video and audio recording
       of a linux desktop session. The default behavior of recording is to mark areas that have changed(through libxdamage)
       and update the frame. This behavior can be changed (option --full-shots ) to produce a more accurate result
       or capture windows that do not generate events on change(windows with accelerated 3d context)
       but this will notably increase the workload.
       recordMyDesktop doesn't have a commandline interface.
       After startup, it can be controled only through the following signals:
       SIGUSR1 causes the program to pause if it's currently recording, and vice-versa.
       SIGTERM causes normal termination of the recording.
       SIGINT also causes normal termination.
       SIGABRT terminates the program and removes the specified output file.
       This signals can also be delivered on the application, with the use of shortcuts.
       See --pause-shortcut and --stop-shortcut , on the Misc.  section of Options bellow.

       A typical scenario of recording can be a command as simple as:
       ~$ recordmydesktop
       which will produce a fullscreen recording named out.ogv
       while a command like:
       ~$ recordmydesktop foo.ogv
       will write output to foo.ogv
       Since version 0.3, encoding will happen right after the recording finishes.
       While this behavior saves a lot of CPU, you can revert to the old one by entering the --on-the-fly-encoding switch.
       To specify a region for recording you can type this:
       ~$ recordmydesktop -x X_pos -y Y_pos --width WIDTH --height HEIGHT -o foo.ogv
       where X_pos and Y_pos specify the offset in pixels from the upper left
       corner of your screen and WIDTH and HEIGHT the size of the window to be recorded(again in pixels).
       If the area extends beyond your current resolution, you will be notified appropriately and nothing will happen.
       Notice also, that if any option is entered you have to specify the output file with the -o switch.
       If  you  try  to  save  under  a  filename  that already exists, the name will be post-fixed with a number (incremented if that name exists
       already)
       To normally end a recording you can press ctl-c.
       (which will send a SIGINT to the program).
       For further manipulation of the end result look at the OPTIONS and NOTES sections.

EXIT STATUS
       0 is success
       Non-zero means an error occurred, which is printed in stderr.
       The following error codes indicate the nature of the error:
       1 Error while parsing the arguments.
       2 Initializing the encoder failed(either vorbis or theora).
       3 Could not open/configure sound card.
       4 Xdamage extension not present.
       5 Shared memory extension not present.
       6 Xfixes extension not present.
       7 XInitThreads failed.
       8 No $DISPLAY environment variable and none specified as argument.
       9 Cannot connect to Xserver.
       10 Color depth is not 32, 24 or 16bpp.
       11 Improper window specification.
       12 Cannot attach shared memory to proccess.
       13 Cannot open file for writting.
       14 Cannot load the Jack library ( UNUSED SINCE 0.3.8 ).
       15 Cannot create new client.
       16 Cannot activate client.
       17 Port registration/connection failure.

OPTIONS
       Generic Options:

           -h or --help
                  Print help summary and exit.

           --version
                  Print program version and exit.

           --print-config
                  Print info about options selected during compilation and exit.

       Image Options:

           --windowid id_of_window
                  id of window to be recorded.

           --display DISPLAY
                  Display to connect to.

           -x X
                  Offset in x direction.

           -y Y
                  Offset in y direction.

           --width N
                  Width of recorded window.

           --height N
                  Height of recorded window.

           --dummy-cursor color
                  Draw a dummy cursor, instead of the normal one.Value of color can be "black" or "white".

           --no-cursor
                  Disable drawing of the cursor.

           --no-shared
                  Disable usage of MIT-shared memory extension (Not Recommended).

           --full-shots
                  Take full screenshot at every frame(Not recomended!).

           --follow-mouse
                  When this option is enabled, the capture area follows the mouse cursor. This
                  is meaningfull only when the selected area is a subset of the full screen.
                  This option auto-enables --full-shots.

           --quick-subsampling
                  Do subsampling of the chroma planes by discarding extra pixels.

           --fps N(number>0.0)
                  A positive number denoting desired framerate.

       Sound Options:

           --channels N(number>0)
                  A positive number denoting desired sound channels in recording.

           --freq N(number>0)
                  A positive number denoting desired sound frequency.

           --buffer-size N(number>0)
                  A positive number denoting the desired sound buffer size(in frames, when using ALSA or OSS).

           --ring-buffer-size N(float number>0)
                  A float number denoting the desired ring buffer size (in seconds,when using JACK only).
                  The overall size of the buffer in bytes will be:
                  ring_buffer_size * samplerate * number_of_ports * sizeof(jack_default_audio_sample_t),
                  where sizeof(jack_default_audio_sample_t) is normally 4.

           --device SOUND_DEVICE
                  Sound device(default hw:0,0 or /dev/dsp, depending on whether ALSA or OSS is used).

           --use-jack port1 port2... portn
                  Record audio from the specified list of space-separated jack ports.
                  When using this option, all the rest audio related ones(except --no-sound) are not taken into account.

           --no-sound
                  Do not record sound.

       Encoding Options:

           --on-the-fly-encoding
                  Encode the audio-video data, while recording.

           --v_quality n
                  A number from 0 to 63 for desired encoded video quality(default 63).

           --v_bitrate n
                  A number from 45000 to 2000000 for desired encoded video bitrate(default 45000).

           --s_quality n
                  Desired audio quality(-1 to 10).

       Misc Options:

           --rescue path_to_data
                  Encode cache data from a previous session, into an Ogg/Theora+Vorbis
                  file. The filename will be the one that was chosen initially.
                  Any other option specified with this one will be implicitly ignored
                  and recordMyDesktop will exit after the end of the encoding.
                  This option was added in recordMyDesktop 0.3.7 and it will not
                  work with cache files produced from earlier versions.
                  When using this option, remember that recordMyDesktop's cache is
                  not safe, in respect to type-sizes and endianness.

           --print-config
                  Print compilation time options. Currently prints whether Jack capture is
                  enabled and if ALSA or OSS is used (may contain more information
                  in the future).

           --no-wm-check
                  When a 3d compositing window manager is detected the program will function as if the
                  --full-shots option has been specified. This option disables that
                  behavior alltogether.

           --no-frame
                  Normally, around the recording area, there is drawn a frame to assist
                  the user in identifying what does and what doesn't get captured.
                  This frame will also follow around the mouse, when --follow-mouse
                  is used. The frame might cause problems for drag and drop. If you do
                  not wish this frame to appear, use this option.

           --pause-shortcut MOD+KEY
                  Shortcut that will be used for pausing or unpausing the recording.
                  MOD can be any combination of the following modifier keys:
                  Control, Shift and Mod1 to Mod5. The modifiers can be separated
                  with any character( except SPACE ) or none at all. KEY can be any key defined in
                  /usr/include/X11/keysymdef.h without the XK_ prefix.
                  The list of modifiers must be separated from the key with a plus('+')
                  sign.
                  Default is Control+Mod1+p (Mod1 usually corresponds to left Alt).

           --stop-shortcut MOD+KEY
                  Shortcut that will be used to stop the recording.
                  For more, see -pause-shortcut above.
                  Default is Control+Mod1+s.

           --compress-cache
                  Image data are cached with a light compression.

           --workdir DIR
                  Location where a temporary directory will be created to hold project files(default /tmp).

           --delay n[H|h|M|m]
                  Number of secs(default),minutes or hours before capture starts(number can be float).

           --overwrite
                  If there is already a file with the same name, delete it.
                  Default action is to add a number postfix to the new file.
                  For example when not specifying a name, if out.ogv exists,
                  the new file will be out-1.ogv and if that exists too, out-2.ogv
                  and so on (no ad-infinitum though, more like ad-short-integer...)

           -o filename
                  Name of recorded video(default out.ogv).

       If no other option is specified, filename can be given without the -o switch.

USAGE
       recordmydesktop [OPTIONS]^filename

ENVIRONMENT
       DISPLAY
              Display environment variable, specifying X server to connect to.

NOTES
           Recording a window using the --windowid option, doesn't track the window itself, but the region that it covers.
       Also when using that option the -x,-y,--width and --height options are relative to the specified window area.
       An easy way to find out the id of a window, is by using the xwininfo program.
       Running a command like :
       xwininfo | awk ´/Window id:/ {print $4}´
       will give you only the id of the window(which should look like this: 0x4800005)
       More conviniently you can put all that in the command that launches recordMyDesktop like this:
       ~$recordmydesktop --windowid $(xwininfo | awk ´/Window id:/ {print $4}´)
           Also, the lower quality you select on a video recording ( -v_quality option), the highest CPU-power that you will need.
       So if you are doing the encoding on the fly ,it's better to start with default values and manipulate the end-result with another program.
       An excellent converter is the vlc media player, which can perform a variety of transcoding
       operations, either using the graphical interface, or the commandline for more flexibility.
       vlc is a complex piece of software, so you should consult it's documentation, before
       using it.
       An example follows, which will resize a recording named out.ogv to 512x384:
       vlc -I dummy out.ogv vlc:quit --sout "#transcode{ vcodec = theo, width = 512, height = 384 }:duplicate{ dst = std{ access = file,  mux=ogg,
       dst = \"out_512x384.ogv\" }}"
       If you wish to change the video quality you can append the --sout-theora-quality=n, with n in the range [1,10] e.g:
       vlc  -I dummy out.ogv vlc:quit --sout "#transcode{ vcodec = theo, width = 512, height = 384 }:duplicate{ dst = std{ access = file, mux=ogg,
       dst = \"out_512x384.ogv\" }}" --sout-theora-quality=3
       which will give a file of a video quality 18 (in a range of 0-63), thus appropriate for web-publishing.
       Another option is ffmpeg2theora , which despite its name is also a theora to theora converter.
       Changing the quality of a recordng with it, can be as simple as :
       ffmpeg2theora infile.ogv -v 3 -a 4 -o outfile.ogv
       It can even perform resizing on the size of the recording, or change the overall duration.

BUGS
       Does not record 3d windows, if --full-shots isn't specified.
       Saving 65536 files with the same name, will result in upredictable behavior,
       which might manifest as an endless loop, or a segmentation fault.

AUTHORS
       John Varouhakis(johnvarouhakis@gmail.com)

SEE ALSO
       xwininfo(1)
       vlc(1)
       ffmpeg2theora(1)
       jack_lsp(1)

Linux                                                                13/7/2006                                                  RECORDMYDESKTOP(1)
