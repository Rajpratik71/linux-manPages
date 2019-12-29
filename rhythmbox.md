rhythmbox(1)                            General Commands Manual                           rhythmbox(1)

NAME
       rhythmbox - music player and library for tagged files using GStreamer

SYNOPSIS
       rhythmbox [option...]

DESCRIPTION
       rhythmbox  is  a  very  easy  to use music playing and management program which supports a wide
       range of audio formats (including mp3 and ogg). Originally inspired by Apple's iTunes, the cur‐
       rent  version  also  supports  Internet Radio and Last.fm integration, iPod syncing and generic
       portable audio player support. Audio CD playback, ripping and encoding, music sharing, and Pod‐
       casts.

       For performance reasons, the remote control abilities have been moved from the rhythmbox binary
       to a separate program. See rhythmbox-client and the corresponding man page for documentation.

OPTIONS
       -d, --debug
              Enable debug output

       -D, --debug-match=match
              Enable debug output matching a specified string

       --no-update
              Do not update the library with file changes

       -n, --no-registration
              Do not register the shell

       --dry-run
              Don't save any data permanently (implies --no-registration)

       --rhythmdb-file=file
              Path for database file to use

       --playlists-file=file
              Path for playlists file to use

       --display=DISPLAY
              X display to use

       -?, --help
              Show help options

       --help-all
              Show all help options

       --help-gst
              Show GStreamer Options

       --help-gtk
              Show GTK+ Options

       --help-sm-client
              Show session management options

AUTHOR
       This manual page was written by Sven Arvidsson <sa@whiz.se>, for the Debian system (but may  be
       used by others).

SEE ALSO
       rhythmbox-client(1).

       The online documentation available through the program's Help menu.

GNOME                                         2006-12-24                                  rhythmbox(1)
