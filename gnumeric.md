GNUMERIC(1)                                                            GNOME                                                           GNUMERIC(1)

NAME
       gnumeric - a GNOME spreadsheet application.

SYNOPSIS
       gnumeric [OPTIONS] [files ... ]

DESCRIPTION
       Gnumeric is a powerful spreadsheet program created by the GNOME project. Gnumeric intends to compete with commercial spreadsheets by becom‐
       ing fully compatible with Microsoft Excel(TM) and through the support of most popular spreadsheet file formats  such  as  Excel(TM),  Lotus
       1-2-3(TM), Applix(TM), Sylk(TM), XBase(TM), Oleo(TM) and OpenOffice.org formats.

       Gnumeric  supports  advanced calculations using statistical, financial and database access functions. Plotting data is supported through an
       incomplete but powerful plotting system. A plugin system extends gnumeric ,  for  instance  enabling  the  export  of  data  to  the  LaTeX
       \longtable  format. Plugins can be used to define custom functionality. A rudimentary scripting API for the Python language exists and will
       be extended in the near future. Since gnumeric is free software, gnumeric can also be extended directly at the source  code  level  by  any
       competent programmer.

       The  program can be started from the command line as gnumeric or from one of the menus provided by the underlying platform. When started on
       the command line, gnumeric may be followed by the options listed below and possibly the names of files in various spreadsheet formats which
       will then be opened immediately. For instance, the command:

           gnumeric myfile.gnumeric

       will  launch  gnumeric  and open the file called "myfile.gnumeric". The default gnumeric file format is in extensible markup language (XML)
       which subsequently has been compressed with gzip.

USER OPTIONS
       This program follows the usual GNU command line syntax, with single letter options starting with a single dash  (`-')  and  longer  options
       starting with two dashes (`--').

   Help options
       -?, --help Show help message.

       --usage
              Displays a brief usage message.

   Gnumeric options
       -v, --version
              Displays the version number of the installed instance of gnumeric.

       --no-splash
              Start gnumeric without showing the splash screen.  The splash screen is normally shown if loading files takes too long.

       -L, --lib-dir=STRING
              Set the root library directory to STRING which should be a pathname.

       -D, --data-dir=STRING
              Adjust the root data directory to STRING which should be a pathname.

   Options for window placement
       -g, --geometry=WIDTHxHEIGHT+XOFF+YOFF
              Set the size and position of the first window. All units are in pixels. The X offset is from the left hand side of the screen, the Y
              offset is from the top of the screen. For example, -g=800x600+20+30 will open a gnumeric window 800 pixels wide by 600 pixels  high,
              with  the  left  edge  of  gnumeric 20 pixels from the left of the screen and the top edge of gnumeric 30 pixels from the top of the
              screen.

       --display=DISPLAY
              X display to use, where DISPLAY has the form machinename:Xdisplay.Screen. Note  that  the  machine  displaying  gnumeric  must  have
              granted the machine running gnumeric the right to display (see xhost).

       --screen=SCREEN
              X screen to use, a more compact form of the functionality described above.

ADVANCED OPTIONS
   GNOME options
       --disable-sound
              Disable sound server usage.

       --enable-sound
              Enable sound server usage.

       --espeaker=HOSTNAME:PORT
              Host:port on which the sound server to use is running.

       --disable-crash-dialog
              Disable the bug submission dialog which appears if Gnumeric crashes.

   GTK options
       --gdk-debug=FLAGS
              Gdk debugging flags to set.

       --gdk-no-debug=FLAGS
              Gdk debugging flags to unset.

       --sync Make X calls synchronous.

       --name=NAME
              Program name as used by the window manager.

       --class=CLASS
              Program class as used by the window manager.

       --gxid_host=HOST
              The  host  on  which to contact the gxid daemon. This overrides the GXID_HOST environment variable. This option is only available if
              GTK+ has been configured with --gdk-target=x11.

       --gxid_port=PORT
              The port for the connection to gxid. This overrides the GXID_PORT environment variable. This option is only available  if  GTK+  has
              been configured with --gdk-target=x11.

       --gtk-debug=FLAGS
              Gtk+ debugging flags to set.

       --gtk-no-debug=FLAGS
              Gtk+ debugging flags to unset.

       --g-fatal-warnings
              Make all warnings fatal.

       --gtk-module=MODULE
              Load an additional Gtk module.

   Session management options
       --sm-client-id=ID
              Specify session management ID.

       --sm-config-prefix=PREFIX
              Specify prefix of saved configuration.

       --sm-disable
              Disable connection to session manager.

VERSION
       This manual page describes gnumeric version 1.8.

BUGS
       For the list of known gnumeric bugs, or to report new ones please visit http://bugzilla.gnome.org.

SEE ALSO
       ssconvert(1), ssindex(1), ssdiff(1) ssgrep(1)

       The Gnumeric Manual Available through the Help menu or online ⟨http://www.gnome.org/projects/gnumeric/doc/gnumeric.shtml⟩.

       The Gnumeric Homepage ⟨http://www.gnome.org/projects/gnumeric/⟩.

       The GNOME project page ⟨http://www.gnome.org/⟩.

LICENSE
       Gnumeric  is  licensed  under  the  terms  of the General Public License (GPL), version 2 or 3. For information on this license look at the
       source code that came with the software or see the GNU project page ⟨http://www.gnu.org/⟩.

COPYRIGHT
       The copyright on the gnumeric software and source code is held by the individual authors as is documented in the source code.

AUTHORS
   Gnumeric
       Jody Goldberg <jody@gnome.org>
       Miguel de Icaza <miguel@gnome.org>
       Morten Welinder <terra@gnome.org>

       -- and many others.  For a more complete list, see the About dialog.

   This manual page
       Jan Schaumann <jschauma@netmeister.org>
       Adrian Custer <acuster@gnome.org>

gnumeric                                                            2009-02-08                                                         GNUMERIC(1)
