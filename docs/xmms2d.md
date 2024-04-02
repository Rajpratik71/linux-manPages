XMMS2D(1)                                                     General Commands Manual                                                    XMMS2D(1)

NAME
       xmms2d - XMMS2 daemon which handles the playback of music and storage of music metadata

SYNOPSIS
       xmms2d [-v|-q] [-p dir] [-o plugin] [-i url] [-c file] [-s fd] [--yes-run-as-root]
       xmms2d -?
       xmms2d -V

DESCRIPTION
       XMMS2 is a redesign of the XMMS (http://legacy.xmms2.org) music player. It features a client-server model, allowing multiple (even simulta‐
       neous!) user interfaces, both textual and graphical. All common audio formats are supported using plugins. On top of this, there is a flex‐
       ible media library to organise your music.

       xmms2d  is the daemon through which XMMS2 clients playback and manage music. A client library provided allows third parties to easily write
       XMMS2 clients, especially using the Python and Ruby bindings.

       xmms2d uses a three part method to playback music. Music is accessed from disk or network using a transport plugin, the data is then passed
       on to a decoder plugin which decodes the audio into a form that can be played back by an output plugin.

OPTIONS
   General options
       -v, --verbose
              Increase verbosity.

       -q, --quiet
              Decrease verbosity.

       -p dir, --plugindir=dir
              Use plugin directory dir.

       -o plugin, --output=plugin
              Use output plugin plugin.

       -i url, --ipc-socket=url
              Listen to socket at url.  Multiple sockets can be specified separated by ;-characters.  See section IPC SOCKET.

       -c file, --conf=file
              Use configuration file file.

       -s fd, --status-fd=fd
              Write  to  filedescriptor  fd  when started. This can be used to wait until inter-process communication (IPC) is up, as for instance
              xmms2-launcher(1) does.

       --yes-run-as-root
              Allow xmms2d to be run as root.

   Getting help
       -h, -?, --help
              Display basic help information and exit.

       -V, --version
              Display version information.

IPC SOCKET
       XMMS2 clients use IPC sockets to communicate with xmms2d.  These IPC sockets are specified in an  URL  based  format  with  three  possible
       transport methods: unix, tcp, and tcp6.

       The TCP methods allow clients to connect over IPv4 and IPv6 to xmms2d and therefore allow remote control of XMMS2. A typical IPC socket url
       using TCP is tcp://127.0.0.1:9667.

       The UNIX transport method is for local clients only and creates a file through which XMMS2 clients can access xmms2d.  A typical IPC socket
       path using the UNIX transport is unix:///tmp/xmms-ipc-foobar.

FILES
       Below  CONFDIR  is  $XDG_CONFIG_HOME/xmms2  on UNIX if the XDG_CONFIG_HOME-environment variable is set. Otherwise it is $HOME/.config/xmms2
       (UNIX except Darwin), or $HOME/Library/xmms2 (Darwin).  On Win32 it is %APPDATA%/xmms2.

       CONFDIR/xmms2.conf
              An XML formatted configuration file that allows changing the settings of xmms2d.

       CONFDIR/startup.d/
              A directory populated with programs that are run when xmms2d is executed.  An alternative location can be specified in the  configu‐
              ration file.

       CONFDIR/shutdown.d/
              A directory populated with programs that are run when xmms2d is shutdown correctly.  An alternative location can be specified in the
              configuration file.

       CONFDIR/medialib.db
              An sqlite3(1) database that includes information about each song that has been added the the XMMS2 media  library.   An  alternative
              location can be specified in the configuration file.

       CONFDIR/bindata/
              A  directory  that contains files with binary data entrusted to the XMMS2 media library, such as cover art.  An alternative location
              can be specified in the configuration file.

       /tmp/xmms-ipc-USER
              The typical location for the UNIX IPC Socket. Here USER is the name of the user that executed xmms2d.

ENVIRONMENT
       XDG_CONFIG_HOME
              The path where the XMMS2 configuration files and resources are located.

       XMMS_PATH
              The url of the first socket that xmms2d listens to. This environment variable is set for programs in the startup and shutdown direc‐
              tories.

       XMMS_PATH_FULL
              A  ;-seperated  list  of  paths  to  which xmms2d listens. This environment variable is set for programs in the startup and shutdown
              directories.

SEE ALSO
       xmms2(1), xmms2-launcher(1), http://xmms2.org/.

HISTORY
       The XMMS2 Project was started by Tobias Rundström and Anders Waldenborg. It is developed by a small group of contributers from all over the
       world.

AUTHOR
       This  manual  page was originally written by Alexander Botero-Lowry <alex@foxybanana.com>. It was reformatted and slightly extended by Erik
       Massop <e.massop@hccnet.nl>.

                                                                                                                                         XMMS2D(1)
