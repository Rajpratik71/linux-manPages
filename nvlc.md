VLC(1)                                  General Commands Manual                                 VLC(1)

NAME
       vlc, qvlc, svlc, nvlc, rvlc, cvlc - the VLC media player

SYNOPSIS
       vlc [OPTIONS] [ITEMS]...

DESCRIPTION
       This manual page documents briefly the VLC multimedia player and server.

OPTIONS
       VLC  follows  the  usual  GNU  command  line syntax, with long options starting with two dashes
       (`-').  For a precise description of options, please use "vlc --help".

       The complete list of VLC options depends on what plugins are installed because  they  automati‐
       cally  add  their  own  options.  Please use "vlc --longhelp --advanced" for a complete list of
       available options.

ITEMS
       VLC recognizes several URL-style items:

       *.mpg, *.vob, *.avi, *.mp3, *.ogg, *.opus
              Various multimedia file formats

       dvd://[<device>][@<raw device>][#[<title>][:[<chapter>][:<angle>]]]
              DVD device (for instance dvd:///dev/dvd). The raw device is optional and must have  been
              prepared beforehand.

       vcd://[<device>][@{E|P|E|T|S}[<number>]]
              VCD device (for instance vcd:///dev/cdrom).

       udp://[@[<multicast address>][:<local port>]]
              UDP stream, such as one sent by VLS or another VLC.  Usually "udp://" is enough.

       http://<server address>[:<server port>]/[<file>]
              HTTP stream

       rtsp://<server address>[:<server port>]/<stream name>
              RTSP Video On Demand stream

       vlc://<command>
              Execute  a  playlist  command. Commands are: pause (pause execution of other items), and
              quit (close VLC).

ENVIRONMENT VARIABLES
       The following environment variables may affect VLC:

       DISPLAY
              The X11 display server address.

       http_proxy
              The HTTP proxy server URL.

       OSSAUDIO_DEV
              The default audio output device, used by the OSSv4 output plugin.

       VLC_DATA_PATH
              The directory containing VLC run-time data files (e.g. /usr/share/vlc).

       VLC_PLUGIN_PATH
              An extra directory to load VLC plugins from.

       VLC_VERBOSE
              The level of verbosity for log messages (0: silent, 1: error/info, 2:  warning,  3:  de‐
              bug).

       XDG_CACHE_DIR XDG_CONFIG_DIR XDG_DATA_DIR
              The  directories to store user cached data, user configuration files and user data files
              respectively.

       XDG_DOCUMENTS_DIR XDG_DOWNLOAD_DIR XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_VIDEO_DIR
              The directories to fetch or store user text  files,  downloads,  music,  pictures  (i.e.
              snapshots), and video respectively.

       XDG_SESSION_COOKIE
              The unique identifier of the desktop session, used by the PulseAudio output plugin.

SEE ALSO
       Online documentation: http://www.videolan.org/doc/

AUTHOR
       This manual page was written by Sam Hocevar <sam@zoy.org>, for the Debian GNU/Linux system (but
       may be used by others).

                                             Feb 14, 2005                                       VLC(1)
