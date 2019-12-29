totem(1)                                General Commands Manual                               totem(1)

NAME
       Totem - GNOME desktop movie player based on GStreamer

SYNOPSIS
       totem [option...] [filenames|URI]

DESCRIPTION
       Totem is a movie player for the GNOME desktop.  Through use of the GStreamer backend many popu‐
       lar file and streaming formats are supported including: MPEG audio and  video  (MP3/MPV),  Ogg,
       AVI,  ASF,  MOV, WMV, QuickTime, and more.  Playing of DVD and VCD media is also possible.  Al‐
       though primarily intended as a movie player, Totem can also play many audio formats.

       For additional documentation on interactive use of Totem select  the  Help  menu  option.   The
       menus allow access to some features not available through keybindings or command-line options.

OPTIONS
       -?, --help
              Output  a  longer  help message then quit.  (Any discrepancies between this man page and
              the output of totem --help should be reported as a documentation bug.)

       --version
              Output version information then quit.

       The following options command an already-running instance of Totem to do  something;  they  are
       useful  for  remote-control  scripting.  If  Totem  is not already running, these commands will
       launch a new instance of Totem but will not do anything further.

       --play-pause
              Tell an already-running instance of Totem to toggle between play and pause.

       --play Tell an already-running instance of Totem to play (has no effect if already playing)

       --pause
              Tell an already-running instance of Totem to pause (has no effect if already paused)

       --next Tell an already-running instance of Totem to skip to the next movie or  chapter  in  the
              playlist.

       --previous
              Tell  an already-running instance of Totem to return to the previous movie or chapter in
              the playlist.

       --seek-fwd
              Tell an already-running instance of Totem to seek forwards 15  seconds  in  the  current
              movie.

       --seek-bwd
              Tell  an  already-running  instance of Totem to seek backwards 15 seconds in the current
              movie.

       --volume-up
              Tell an already-running instance of Totem to raise the volume by 8%.

       --volume-down
              Tell an already-running instance of Totem to lower the volume by 8%.

       --mute Tell an already-running instance of Totem to toggle between muted and unmuted audio.

       --fullscreen
              Tell an already-running instance of Totem to toggle fullscreen mode.

       --quit Tell an already-running instance of Totem to quit.

       --enqueue filename|URI
              Tell an already-running instance of Totem to add a new stream to the playlist.

       --replace filename|URI
              Tell an already-running instance of Totem to play from the playlist.

KEYBINDINGS
       Global keybindings for Totem:

       a            cycle between aspect ratios
       p            toggle between play and pause
       Esc          exit full screen mode
       f            toggle full screen
       h            toggle display of on-screen controls
       0            resize window to 50% original size
       1            resize window to 100% original size
       2            resize window to 200% original size
       r            zoom in the video
       t            zoom out the video
       d            start and stop the telestrator (drawing) mode
       e            erase the drawing
       Left-arrow        skip back 15 seconds
       Right-arrow       skip forward 60 seconds
       Shift+Left-arrow  skip back 5 seconds
       Shift+Right-arrow skip forward 15 seconds
       Ctrl+Left-arrow   skip back 3 minutes
       Ctrl+Right arrow  skip forward 10 minutes
       Up-arrow     increase volume by 8%
       Down-arrow   decrease volume by 8%
       b            jump back to previous chapter/movie in playlist
       n            jump to next chapter/movie in playlist
       q            quit
       Ctrl+E          eject the playing optical media
       Ctrl+O       open a new file
       Ctrl+L       open a new URI
       F9           toggle display of the playlist
       m            show the DVD menu
       c            show the DVD chapter menu

FILES
       /usr/lib/totem/plugins/
              The global plugins directory, which contains all the system-installed plugins.
       ~/.local/share/totem/plugins/
              The user plugins directory, containing plugins available only to that user.  It  is  al‐
              ways in the "totem/plugins" subdirectory of your XDG_DATA_HOME directory.
       ~/.config/totem/state.ini
              The configuration file for the main window's appearance, stored in a simple INI format.

BUGS
       Totem cannot play files using some proprietary codecs.

AUTHOR
       Totem was written by Bastien Nocera <hadess@hadess.net>.  This manual page was written by Andre
       Lehovich for the Debian Project.

DISTRIBUTION
       The latest  version  of  Totem  may  be  downloaded  from  <https://wiki.gnome.org/Apps/Videos>
       ⟨https://wiki.gnome.org/Apps/Videos⟩

SEE ALSO
       totem-video-thumbnailer(1),

       The online documentation available through the program's Help menu.

GNOME                                         2008-08-25                                      totem(1)
