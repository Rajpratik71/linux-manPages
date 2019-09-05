vncserver(1)                                                                              Virtual Network Computing                                                                              vncserver(1)



NAME
       vncserver - start or stop a VNC server

SYNOPSIS
       vncserver [:display#] [-name desktop-name] [-geometry widthxheight] [-depth depth] [-pixelformat format] [-fp font-path] [-fg] [-autokill] [-noxstartup] [-xstartup script] [Xvnc-options...]
       vncserver -kill :display#
       vncserver -list

DESCRIPTION
       vncserver  is used to start a VNC (Virtual Network Computing) desktop.  vncserver is a Perl script which simplifies the process of starting an Xvnc server.  It runs Xvnc with appropriate options and
       starts a window manager on the VNC desktop.

       vncserver can be run with no options at all. In this case it will choose the first available display number (usually :1), start Xvnc with that display number, and start the default window manager in
       the Xvnc session.  You can also specify the display number, in which case vncserver will attempt to start Xvnc with that display number and exit if the display number is not available.  For example:

              vncserver :13

       Editing the file $HOME/.vnc/xstartup allows you to change the applications run at startup (but note that this will not affect an existing VNC session.)


OPTIONS
       You  can  get  a  list of options by passing -h as an option to vncserver.  In addition to the options listed below, any unrecognised options will be passed to Xvnc - see the Xvnc man page, or "Xvnc
       -help", for details.


       -name desktop-name
              Each VNC desktop has a name which may be displayed by the viewer. The desktop name defaults to "host:display# (username)", but you can change it with this option.  The desktop name option  is
              passed to the xstartup script via the $VNCDESKTOP environment variable, which allows you to run a different set of applications depending on the name of the desktop.

       -geometry widthxheight
              Specify the size of the VNC desktop to be created. Default is 1024x768.

       -depth depth
              Specify  the  pixel  depth  (in bits) of the VNC desktop to be created. Default is 24.  Other possible values are 8, 15 and 16 - anything else is likely to cause strange behaviour by applica-
              tions.

       -pixelformat format
              Specify pixel format for Xvnc to use (BGRnnn or RGBnnn).  The default for depth 8 is BGR233 (meaning the most significant two bits represent blue, the next three green, and the least signifi-
              cant three represent red), the default for depth 16 is RGB565, and the default for depth 24 is RGB888.

       -cc 3  As  an  alternative to the default TrueColor visual, this allows you to run an Xvnc server with a PseudoColor visual (i.e. one which uses a color map or palette), which can be useful for run-
              ning some old X applications which only work on such a display.  Values other than 3 (PseudoColor) and 4 (TrueColor) for the -cc option may result in strange behaviour, and PseudoColor  desk-
              tops must have an 8-bit depth.

       -kill :display#
              This kills a VNC desktop previously started with vncserver.  It does this by killing the Xvnc process, whose process ID is stored in the file "$HOME/.vnc/host:display#.pid".  The -kill option
              ignores anything preceding the first colon (":") in the display argument.  Thus, you can invoke "vncserver -kill $DISPLAY", for example at the end of your xstartup  file  after  a  particular
              application exits.

       -fp font-path
              If  the vncserver script detects that the X Font Server (XFS) is running, it will attempt to start Xvnc and configure Xvnc to use XFS for font handling.  Otherwise, if XFS is not running, the
              vncserver script will attempt to start Xvnc and allow Xvnc to use its own preferred method of font handling (which may be a hard-coded font path or, on more recent systems, a  font  catalog.)
              In any case, if Xvnc fails to start, the vncserver script will then attempt to determine an appropriate X font path for this system and start Xvnc using that font path.

              The -fp argument allows you to override the above fallback logic and specify a font path for Xvnc to use.

       -fg    Runs Xvnc as a foreground process.  This has two effects: (1) The VNC server can be aborted with CTRL-C, and (2) the VNC server will exit as soon as the user logs out of the window manager in
              the VNC session.  This may be necessary when launching TigerVNC from within certain grid computing environments.

       -autokill
              Automatically kill Xvnc whenever the xstartup script exits.  In most cases, this has the effect of terminating Xvnc when the user logs out of the window manager.

       -noxstartup
              Do not run the %HOME/.vnc/xstartup script after launching Xvnc.  This option allows you to manually start a window manager in your TigerVNC session.

       -xstartup script
              Run a custom startup script, instead of %HOME/.vnc/xstartup, after launching Xvnc. This is useful to run full-screen applications.

       -list  Lists all VNC desktops started by vncserver.


FILES
       Several VNC-related files are found in the directory $HOME/.vnc:

       $HOME/.vnc/xstartup
              A shell script specifying X applications to be run when a VNC desktop is started.  If this file does not exist, then vncserver will create a default xstartup script which attempts  to  launch
              your chosen window manager.

       $HOME/.vnc/config
              An  optional server config file wherein options to be passed to Xvnc are listed to avoid hard-coding them to the physical invocation. List options in this file one per line. For those requir-
              ing an argument, simply separate the option from the argument with an equal sign, for example: "geometry=2000x1200" or "securitytypes=vncauth,tlsvnc". Options without an argument  are  simply
              listed as a single word, for example: "localhost" or "alwaysshared".

       $HOME/.vnc/passwd
              The VNC password file.

       $HOME/.vnc/host:display#.log
              The log file for Xvnc and applications started in xstartup.

       $HOME/.vnc/host:display#.pid
              Identifies the Xvnc process ID, used by the -kill option.


SEE ALSO
       vncviewer(1), vncpasswd(1), vncconfig(1), Xvnc(1)
       http://www.tigervnc.org


AUTHOR
       Tristan Richardson, RealVNC Ltd., D. R. Commander and others.

       VNC  was  originally  developed by the RealVNC team while at Olivetti Research Ltd / AT&T Laboratories Cambridge.  TightVNC additions were implemented by Constantin Kaplinsky. Many other people have
       since participated in development, testing and support. This manual is part of the TigerVNC software suite.



TigerVNC                                                                                                                                                                                         vncserver(1)
