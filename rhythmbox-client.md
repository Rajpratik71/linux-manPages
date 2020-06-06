rhythmbox(1)                                                                             General Commands Manual                                                                             rhythmbox(1)

NAME
       rhythmbox-client - controls a running instance of rhythmbox

SYNOPSIS
       rhythmbox-client [option...][file...]

DESCRIPTION
       rhythmbox-client  is  a tool for controlling an already running instance of rhythmbox.  It's useful for remote control scripting, adding specific files to the library from the shell, or printing
       details of what's playing. It also has an interactive mode, useful for controlling playback remotely via ssh. Any files specified after the option arguments will be added to the library.  If the
       --enqueue option is given, the files will also be added to the play queue.

OPTIONS
       -?,--help
              Show help options

       --debug
              Enable debug output

       --no-start
              Do not start a new instance of rhythmbox

       --quit Quit rhythmbox

       -i,--interactive
              Start interactive mode --no-present Don't present an existing rhythmbox window

       --next Jump to next song

       --previous
              Jump to previous song

       --play Resume playback if currently paused

       --pause
              Pause playback if currently playing

       --play-pause
              Toggle play/pause mode

       --stop Stop playback if currently playing

       --play-uri=URI
              Play a specified URI, importing it if necessary

       --enqueue
              Add specified tracks already in the library to the play queue

       --clear-queue
              Empty the play queue before adding new tracks

       --print-playing
              Print the title and artist of the playing song

       --print-playing-format=format
              Print formatted details of the song (see FORMAT OPTIONS below).

       --set-volume
              Set the playback volume

       --volume-up
              Increase the playback volume

       --volume-down
              Decrease the playback volume

       --print-volume
              Print the current playback volume

       --select-source=URI
              Select the source corresponding to a URI (device or mount point)

       --activate-source=URI
              Select the source corresponding to a URI (device or mount point) and start playing from it if not already playing.

       --play-source=URI
              Select the source corresponding to a URI (device or mount point) and start playing from it.

FORMAT OPTIONS
       %at    album title

       %aa    album artist

       %aA    album artist (lowercase)

       %as    album artist sortname

       %aS    album artist sortname (lowercase)

       %ay    album year

       %ag    album genre

       %aG    album genre (lowercase)

       %an    album disc number

       %aN    album disc number, zero padded

       %st    stream title

       %tn    track number (i.e 8)

       %tN    track number, zero padded (i.e 08)

       %tt    track title

       %ta    track artist

       %tA    track artist (lowercase)

       %ts    track artist sortname

       %tS    track artist sortname (lowercase)

       %td    track duration

       %te    track elapsed time

       Variables can be combined using quotes. For example "%tn %aa %tt", will print the track number followed by the artist and the title of the track.

AUTHOR
       This manual page was written by Sven Arvidsson <sa@whiz.se>, for the Debian system (but may be used by others).

SEE ALSO
       rhythmbox(1).

GNOME                                                                                           2007-06-28                                                                                   rhythmbox(1)
