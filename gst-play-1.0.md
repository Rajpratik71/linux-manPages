GStreamer(1)                                                                              GStreamer(1)

NAME
       gst-play-1.0 - Simple command line playback testing tool

SYNOPSIS
       gst-play-1.0 FILE|DIRECTORY|URI [FILE2|DIRECTORY2|URI2]

DESCRIPTION
       gst-play-1.0  is  a command line tool that can be used to test basic playback using the playbin
       element. You can pass it individual files, URIs or whole directories (in which case it will re‐
       curse into sub-directories as well).

OPTIONS
       gst-play-1.0 accepts the following options:

       --help  Print help synopsis and available command line options

       --version
               Print version and exit

       --audiosink=SOMESINK
               Use the SOMESINK element as audio sink instead of autoaudiosink

       --videosink=SOMESINK
               Use the SOMESINK element as video sink instead of autovideosink

       --volume=VOLUME
               Set initial playback volume to VOLUME, where 0.0=silent and 1.0=unchanged

       --shuffle
               Shuffle playlist (play files in random order)

       --no-interactive
               Disable control through keyboard interaction in terminal (see below)

       --gapless
               Enable gapless playback

       -v, --flags
               Control playback behaviour setting playbin 'flags' property

       -v, --verbose
               Output status information and property notifications

       -q, --quiet
               Do not print any output (apart from errors)

       --use-playbin3
               Use playbin3 pipeline (default varies depending on 'USE_PLAYBIN' env variable)

       --wait-on-eos
               Keep  showing  the  last frame on EOS until quit or playlist change command (gapless is
               ignored)

INTERACTIVE KEYBOARD CONTROL
       SPACE   Pause/Resume playback

       ARROW UP/DOWN
               Volume up/down

       ARROW LEFT/RIGHT
               Seek back/forward

       +/-     Increase/decrease playback rate

       d       Reverse playback direction

       t       Cycle through trick modes

       a       Switch audio track

       s       Switch subtitle track

       v       Switch video track

       > or n  Skip to next item in playlist

       < or b  Go back to previous item in playlist

       0       Seek back to beginning of current track

       Q, ESC  Quit

SEE ALSO
       gst-inspect-1.0(1), gst-launch-1.0(1), gst-discoverer-1.0(1),

AUTHOR
       The GStreamer team at http://gstreamer.freedesktop.org/

                                              April 2014                                  GStreamer(1)
