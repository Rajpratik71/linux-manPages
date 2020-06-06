ssvnc(1)                          SSVNC                         ssvnc(1)

NAME
       ssvnc - a GUI wrapper for SSL and SSH VNC connections.

SYNOPSIS
       ssvnc
       ssvnc [host][:display]
       ssvnc [saved-profile-name]
       ssvnc [options] [host-or-profile]
       ssvnc -cmd [ssvnc_cmd-args]
       ssvnc -viewer [viewer-args]
       ssvnc --help

DESCRIPTION
       ssvnc is a tcl/tk gui wrapper that runs on Unix, MacOSX, and Win‐
       dows.  It sets up an SSL or SSH tunnel to the remote  VNC  Server
       and  then  launches  the  VNC  viewer (either the one provided or
       another one that you have specified) to use that encrypted tunnel
       to connect to the VNC Server.  The use of Proxies and Gateways to
       make the connections is implemented.

       Once you have started the SSVNC gui, you can click on the buttons
       "Help",  "Options -> Help", "Certs -> Help", etc. for much infor‐
       mation on how to use and configure the tool.

       In short, you supply a VNC server "hostname:display" in the  "VNC
       Host:Display"  entry  box  and then press the "Connect" button to
       connect to the server via SSL (stunnel).  E.g. "far-away.east:0".
       Port numbers are also allowed, e.g. far-away.east:5905.

       Or  supply  user@hostname:display  and  click  on  the  "Use SSH"
       option, then press the "Connect" button to connect to the  server
       via an SSH tunnel.  E.g. "fred@far-away.east:0".

       Note it is also possible to disable the use of SSL/SSH encryption
       tunnels by using a vnc:// or Vnc:// prefix  before  host:display.
       Shift+Ctrl-E  is  a  short-cut  to  add/remove  it.  See also the
       -noenc option below for the 'No Encryption' button.

       Normally you do not specify any command line options.  You simply
       run ssvnc and use the GUI that starts up.

       However,  as  shortcuts  you  can  supply  a VNC host:display (or
       host:port) on the command line to connect to immediately (the GUI
       is started and the connection is initiated).  For example, "ssvnc
       far-away.east:0" Instead of a  host:display, you can specify  the
       name  of  a  saved profile to automatically load that profile and
       then connect to its server.  For  example  "ssvnc  far",  if  you
       named  the  profile  "far".   You can use the -profiles option to
       list the profiles you have saved.

       The related commands sshvnc and tsvnc start up the GUI in simpli‐
       fied  modes:  SSH  Only Mode, and Terminal Services Mode, respec‐
       tively.  See below and the application Help for more  information
       on the modes.

       You  can  also place certain settings in your ~/.ssvncrc, see the
       SSVNC Help panel ('Tips') for more info.

       The -cmd option does not start the GUI, it runs the command  line
       utility  ssvnc_cmd  directly with the given arguments.  ssvnc_cmd
       can launch the viewer directly (-viewer ...)  or, by default, the
       ss_vncviewer  SSL/SSH tunnel wrapper script.  See its help output
       for more information.

       There are also some command line options described as follows.

OPTIONS
       -help, -h
              Prints out to the terminal a  brief  description  and  the
              options.

       --help Starts  up the GUI as though the 'Help' button was pressed
              to show the main Help panel.

       -cmd [ssvnc_cmd-args]
              Launch the ssvnc_cmd utility  command  directly  (no  GUI)
              with the given arguments (for use when ssvnc_cmd is not in
              one's PATH.) If neither ssvnc_cmd nor  ssvncviewer  is  in
              PATH,  one  can launch the viewer directly via: ssvnc -cmd
              -viewer [viewer-args] See the next option -viewer  for  an
              alias.

       -viewer [viewer-args]
              Shorthand for ssvnc -cmd -viewer [viewer-args].

       -profiles
              List the saved SSVNC profiles you have created.  A profile
              is a destination host with specific parameter settings.

       -list  Same as -profiles

       -ssh   Start in "SSH Only Mode".  No SSL aspects are shown.  Same
              as running the command sshvnc

       -ts    Start in "Terminal Services Mode".  This is like "SSH Only
              Mode", but simpler and assumes x11vnc is available on  the
              remote  side to start and manage X and VNC sessions.  Same
              as running the command tsvnc

       -tso   Same as -ts "Terminal Services Mode",  however  never  let
              the  user  leave  this  mode (no button to switch modes is
              provided.)  Same as SSVNC_TS_ALWAYS=1.

       -ssl   Force the full GUI Mode: both SSL and SSH.   This  is  the
              default.  Same as -ss.

       -nv    Toggle the "Verify All Certs" button to be off at startup.

       -nvb   Never  show  the  "Verify  All  Certs"  button.   Same  as
              SSVNC_NO_VERIFY_ALL_BUTTON=1.

       -bigger
              Make the Profile Selection Dialog window bigger.  Same  as
              SSVNC_BIGGER_DIALOG=1.

       -noenc Start  off  in a mode where a 'No Encryption' check button
              is present.  You can toggle the mode with Ctrl-E.  Same as
              SSVNC_DISABLE_ENCRYPTION_BUTTON=1.  Or noenc=1 in ~/.ssvn‐
              crc.  Selecting no encryption is the same  as  the  vnc://
              and  Vnc://  prefixes described below.  The -noenc mode is
              now the default, use -enc  or  noenc=0  for  the  opposite
              behavior.

       -killstunnel
              On  Windows,  automatically  terminate the STUNNEL process
              when the viewer exits instead of prompting  you  (same  as
              killstunnel=1 in ssvnc_rc or toggle in Options menu)

       -nokillstunnel
              On  Windows, disable -killstunnel mode.  Same as killstun‐
              nel=0 in ssvnc_rc or toggle in Options  menu.   Note  that
              -killstunnel mode is now the default.

       -mycert /path/to/mycert.pem
              Set  the default "MyCert" to be /path/to/mycert.pem.  Same
              as -cert.  If the file does  not  exist,  ~/.vnc/certs  is
              prefixed and tried.  You can also set mycert=/path/to/myc‐
              ert.pem in ~/.ssvncrc.

       -cacert /path/to/cacert.crt
              Set the default "ServerCert"  to  be  /path/to/cacert.crt.
              Same  as -ca.  If the file does not exist, ~/.vnc/certs is
              prefixed and tried.  You can also set cacert=/path/to/cac‐
              ert.crt in ~/.ssvncrc.

       -crl /path/to/mycrl.pem
              Set   the   default  Certificate  Revocation  List  to  be
              /path/to/mycrl.pem.   If  the   file   does   not   exist,
              ~/.vnc/certs  is  prefixed  and  tried.   You can also set
              crl=/path/to/mycrl.pem in ~/.ssvncrc.

URL NOTATION
       Here are all of our URL-like prefixes that you can put  in  front
       of host:display (or host:port):

       For SSL:  vncs:// vncssl:// and vnc+ssl://

       For SSH:  vncssh:// and vnc+ssh://

       For No Encryption:  vnc:// and Vnc://

       Examples:

       To quickly make an SSL connection: ssvnc vncs://snoopy.com:0

       To      quickly     make     an     SSH     connection:     ssvnc
       vnc+ssh://fred@snoopy.com:0

       To quickly make a direct connection: ssvnc Vnc://snoopy.com:0

       The above will also work in the "VNC Host:Display" entry  box  in
       the GUI.  Press the "Connect" button after entering them.

       The  difference  between vnc:// and Vnc:// is that the latter one
       will not prompt you whether you really  want  to  make  an  unen‐
       crypted connection or not.

FILES
       Your  SSVNC  vnc  profiles  are stored in the $HOME/.vnc/profiles
       directory.  They end in suffix .vnc

       Your  SSVNC  vnc  certificates  and  keys  are  stored   in   the
       $HOME/.vnc/certs  directory.   They  typically  end in .pem (both
       certificate and private key) or .crt (certificate only).

       You can put a few global parameters (e.g.  mode=sshvnc)  in  your
       $HOME/.ssvncrc  file  (ssvnc_rc  on Windows); see the application
       Help for more information.

FONTS
       The following is from Tip 18 in the Help panel.

       Fonts: To change the tk fonts, set  these  environment  variables
       before     starting     up    ssvnc:    SSVNC_FONT_DEFAULT    and
       SSVNC_FONT_FIXED.  For example:

       % env SSVNC_FONT_DEFAULT='helvetica -20 bold' ssvnc

       % env SSVNC_FONT_FIXED='courier -14' ssvnc

       or set both of them at once.

       To achieve the same effect, you can also set parameters  in  your
       ~/.ssvncrc file, for example:

       font_default=helvetica -20 bold

       font_fixed=courier -14

SEE ALSO
       ssvncviewer(1), vncviewer(1), stunnel(8), ssh(1), x11vnc(1), vnc‐
       server(1)    http://www.karlrunge.com/x11vnc     http://www.karl‐
       runge.com/x11vnc/ssvnc.html

AUTHORS
       Karl  J. Runge <runge@karlrunge.com> wrote the SSVNC gui (tcl/tk)
       and associated wrapper scripts, and added features  to  the  unix
       vncviewer source code.

                              January 2011                      ssvnc(1)
