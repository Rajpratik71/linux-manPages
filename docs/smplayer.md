smplayer(1)                                                          SMPlayer                                                          smplayer(1)

NAME
       SMPlayer - The best GUI frontend for MPlayer

SYNOPSIS
       smplayer   [-minigui]   [-mpcgui]   [-defaultgui]   [-config-path   <directory>]   [-send-action  <action_name>]  [-actions  <action_list>]
       [[-no]-close-at-end] [[-no]-fullscreen] [-sub <subtitle_file>] [-pos <x> <y>] [-size <width> <height>] [-add-to-playlist] [-disable-server]
       [-help|--help|-h|-?] [<media1>] [<media2>]...

DESCRIPTION
       SMPlayer is a GUI media player based on Qt 4, using mplayer(1) as its backend.

OPTIONS
       -minigui
              Open the mini GUI instead of the default one.

       -mpcgui
              Open the mpc GUI instead of the default one.

       -defaultgui
              Open the default gui.

       -config-path <directory>
              Specify the directory for the configuration files (smplayer.ini, smplayer_files.ini...).

       -send-action <action_name>
              Try to make a connection to another running instance and send to it the specified action.

              Example: smplayer -send-action pause

              The rest of options (if any) will be ignored and the application will exit. It will return 0 on success or -1 on failure.

       -actions <action_list>
              <action_list>  is  a  list  of actions separated by spaces. The actions will be executed just after loading the file (if any) in the
              same order as input. For switchable actions you can pass true or false as parameter.

              Example: smplayer -actions.br "fullscreen compact true"

              Quotes are necessary in case you pass more than one action.

       -close-at-end
              Close the main window when the file/playlist finishes.

       -no-close-at-end
              Do not close the main window when the file/playlist finishes.

       -fullscreen
              Play the video in fullscreen mode.

       -no-fullscreen
              Play the video in windowed mode.

       -sub   Specify the subtitle file to be loaded (for the first video only).

       -pos <x> <y>
              Specify the coordinates where the main window will be displayed.

       -size <width> <height>
              Specify the size of the main window.

       -h, -help, --help, -?
              Show the help message and then exit.

       -add-to-playlist
              If there is another instance running, the media will be added to that instance's playlist. If  there  is  no  other  instance,  this
              option will be ignored and the files will be opened in a new instance.

       -disable-server
              Disables the server used to communicate with other instances.  This also disables the possibility to use a single instance.

       <media1> <media2> ...
              Any  kind  of  file  that SMPlayer can open. It can be a local file, a DVD (e.g. dvd://1), an Internet stream (e.g. mms://....) or a
              local playlist in format m3u or pls.

SEE ALSO
       mplayer(1)

AUTHOR
       The author of SMPlayer is Ricardo Villalba <rvm@users.sourceforge.net>.

       This manual page was written by Matvey Kozhev <sikon@lucidfox.org> for the Ubuntu project (but may be used by others).  Has been updated by
       greengreat <gmeildeno@gmail.com> for the SMPlayer project (July 2009).

       Permission  is  granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or any
       later version published by the Free Software Foundation. On Debian systems, the complete text of the GNU  General  Public  License  can  be
       found in /usr/share/common-licenses/GPL.

BUGS
       Please submit bugs to http://sourceforge.net/projects/smplayer.

The SMPlayer Project                                               January 2012                                                        smplayer(1)
