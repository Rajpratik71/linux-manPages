Xvnc(1)                                                                                   Virtual Network Computing                                                                                   Xvnc(1)



NAME
       Xvnc - the X VNC server

SYNOPSIS
       Xvnc [options] :display#

DESCRIPTION
       Xvnc is the X VNC (Virtual Network Computing) server.  It is based on a standard X server, but it has a "virtual" screen rather than a physical one.  X applications display themselves on it as if it
       were a normal X display, but they can only be accessed via a VNC viewer - see vncviewer(1).

       So Xvnc is really two servers in one. To the applications it is an X server, and to the remote VNC users it is a VNC server. By convention we have arranged that the VNC server display number will be
       the same as the X server display number, which means you can use eg. snoopy:2 to refer to display 2 on machine "snoopy" in both the X world and the VNC world.

       The  best  way of starting Xvnc is via the vncserver script.  This sets up the environment appropriately and runs some X applications to get you going.  See the manual page for vncserver(1) for more
       information.


OPTIONS
       Xvnc takes lots of options - running Xvnc -help gives a list.  Many of these are standard X server options, which are described in the Xserver(1) manual page.  In addition to options which can  only
       be set via the command-line, there are also "parameters" which can be set both via the command-line and through the vncconfig(1) program.


       -geometry widthxheight
              Specify the size of the desktop to be created. Default is 1024x768.

       -depth depth
              Specify the pixel depth in bits of the desktop to be created. Default is 24, other possible values are 8, 15, and 16 - anything else is likely to cause strange behaviour by applications.

       -pixelformat format
              Specify  pixel  format for server to use (BGRnnn or RGBnnn).  The default for depth 8 is BGR233 (meaning the most significant two bits represent blue, the next three green, and the least sig‐
              nificant three represent red), the default for depth 16 is RGB565 and for depth 24 is RGB888.

       -interface IP address
              Listen on interface. By default Xvnc listens on all available interfaces.

       -inetd This significantly changes Xvnc's behaviour so that it can be launched from inetd.  See the section below on usage with inetd.

       -help  List all the options and parameters


PARAMETERS
       VNC parameters can be set both via the command-line and through the vncconfig(1) program, and with a VNC-enabled Xorg server via Options entries in the xorg.conf file.

       Parameters can be turned on with -param or off with -param=0.  Parameters which take a value can be specified as -param value.  Other valid forms are param=value -param=value --param=value.  Parame‐
       ter names are case-insensitive.


       -desktop desktop-name
              Each desktop has a name which may be displayed by the viewer. It defaults to "x11".

       -rfbport port
              Specifies the TCP port on which Xvnc listens for connections from viewers (the protocol used in VNC is called RFB - "remote framebuffer").  The default is 5900 plus the display number.

       -UseIPv4
              Use IPv4 for incoming and outgoing connections. Default is on.

       -UseIPv6
              Use IPv6 for incoming and outgoing connections. Default is on.

       -rfbwait time, -ClientWaitTimeMillis time
              Time  in  milliseconds to wait for a viewer which is blocking the server. This is necessary because the server is single-threaded and sometimes blocks until the viewer has finished sending or
              receiving a message - note that this does not mean an update will be aborted after this time.  Default is 20000 (20 seconds).

       -httpd directory
              Run a mini-HTTP server which serves files from the given directory.  Normally the directory will contain the classes for the Java viewer.  In addition, files with a .vnc extension  will  have
              certain substitutions made so that a single installation of the Java VNC viewer can be served by separate instances of Xvnc.

       -httpPort port
              Specifies the port on which the mini-HTTP server runs.  Default is 5800 plus the display number.

       -rfbauth passwd-file, -PasswordFile passwd-file
              Password  file  for  VNC  authentication.   There  is no default, you should specify the password file explicitly.  Password file should be created with the vncpasswd(1) utility.  The file is
              accessed each time a connection comes in, so it can be changed on the fly.

       -AcceptCutText
              Accept clipboard updates from clients. Default is on.

       -MaxCutText bytes
              The maximum size of a clipboard update that will be accepted from a client.  Default is 262144.

       -SendCutText
              Send clipboard changes to clients. Default is on.

       -SendPrimary
              Send the primary selection and cut buffer to the server as well as the clipboard selection. Default is on.

       -SetPrimary
              Set the PRIMARY as well as the CLIPBOARD selection. Default is on.

       -AcceptPointerEvents
              Accept pointer press and release events from clients. Default is on.

       -AcceptKeyEvents
              Accept key press and release events from clients. Default is on.

       -AcceptSetDesktopSize
              Accept requests to resize the size of the desktop. Default is on.

       -DisconnectClients
              Disconnect existing clients if an incoming connection is non-shared. Default is on. If DisconnectClients is false, then a new non-shared connection will be refused while  there  is  a  client
              active.  When combined with NeverShared this means only one client is allowed at a time.

       -NeverShared
              Never treat incoming connections as shared, regardless of the client-specified setting. Default is off.

       -AlwaysShared
              Always treat incoming connections as shared, regardless of the client-specified setting. Default is off.

       -Protocol3.3
              Always use protocol version 3.3 for backwards compatibility with badly-behaved clients. Default is off.

       -FrameRate fps
              The  maximum number of updates per second sent to each client. If the screen updates any faster then those changes will be aggregated and sent in a single update to the client. Note that this
              only controls the maximum rate and a client may get a lower rate when resources are limited. Default is 60.

       -CompareFB mode
              Perform pixel comparison on framebuffer to reduce unnecessary updates. Can be either 0 (off), 1 (always) or 2 (auto). Default is 2.

       -ZlibLevel level
              Zlib compression level for ZRLE encoding (it does not affect Tight encoding).  Acceptable values are between 0 and 9.  Default is to use the standard compression level provided by the zlib(3)
              compression library.

       -ImprovedHextile
              Use improved compression algorithm for Hextile encoding which achieves better compression ratios by the cost of using slightly more CPU time.  Default is on.

       -SecurityTypes sec-types
              Specify  which  security  scheme to use for incoming connections.  Valid values are a comma separated list of None, VncAuth, Plain, TLSNone, TLSVnc, TLSPlain, X509None, X509Vnc and X509Plain.
              Default is VncAuth,TLSVnc.

       -Password password
              Obfuscated binary encoding of the password which clients must supply to access the server.  Using this parameter is insecure, use PasswordFile parameter instead.

       -PlainUsers user-list
              A comma separated list of user names that are allowed to authenticate via any of the "Plain" security types (Plain, TLSPlain, etc.). Specify * to allow any user  to  authenticate  using  this
              security type. Default is to deny all users.

       -pam_service name, -PAMService name
              PAM service name to use when authentication users using any of the "Plain" security types. Default is vnc.

       -X509Cert path
              Path to a X509 certificate in PEM format to be used for all X509 based security types (X509None, X509Vnc, etc.).

       -X509Key path
              Private key counter part to the certificate given in X509Cert. Must also be in PEM format.

       -GnuTLSPriority priority
              GnuTLS priority string that controls the TLS session’s handshake algorithms.  See the GnuTLS manual for possible values. Default is NORMAL.

       -BlacklistThreshold count
              The number of unauthenticated connection attempts allowed from any individual host before that host is black-listed.  Default is 5.

       -BlacklistTimeout seconds
              The initial timeout applied when a host is first black-listed.  The host cannot re-attempt a connection until the timeout expires.  Default is 10.

       -IdleTimeout seconds
              The number of seconds after which an idle VNC connection will be dropped.  Default is 0, which means that idle connections will never be dropped.

       -MaxDisconnectionTime seconds
              Terminate when no client has been connected for N seconds.  Default is 0.

       -MaxConnectionTime seconds
              Terminate when a client has been connected for N seconds.  Default is 0.

       -MaxIdleTime seconds
              Terminate after N seconds of user inactivity.  Default is 0.

       -QueryConnect
              Prompts the user of the desktop to explicitly accept or reject incoming connections. Default is off.

              The vncconfig(1) program must be running on the desktop in order for QueryConnect to be supported.

       -QueryConnectTimeout seconds
              Number of seconds to show the Accept Connection dialog before rejecting the connection.  Default is 10.

       -localhost
              Only allow connections from the same machine. Useful if you use SSH and want to stop non-SSH connections from any other hosts.

       -Log logname:dest:level
              Configures the debug log settings.  dest can currently be stderr, stdout or syslog, and level is between 0 and 100, 100 meaning most verbose output.  logname is usually * meaning all, but you
              can target a specific source file if you know the name of its "LogWriter".  Default is *:stderr:30.

       -RemapKeys mapping
              Sets up a keyboard mapping.  mapping is a comma-separated string of character mappings, each of the form char->char, or char<>char, where  char  is  a  hexadecimal  keysym.  For  example,  to
              exchange the " and @ symbols you would specify the following:

                 RemapKeys=0x22<>0x40

       -AvoidShiftNumLock
              Key  affected  by NumLock often require a fake Shift to be inserted in order for the correct symbol to be generated. Turning on this option avoids these extra fake Shift events but may result
              in a slightly different symbol (e.g. a Return instead of a keypad Enter).

       -AllowOverride
              Comma separated list of parameters that can be modified using VNC extension.  Parameters can be modified for example using vncconfig(1) program from inside a running session.

              Allowing override of parameters such as PAMService or PasswordFile can negatively impact security if Xvnc runs under different user than the programs allowed to override the parameters.

              When NoClipboard parameter is set, allowing override of SendCutText and AcceptCutText has no effect.

              Default is desktop,AcceptPointerEvents,SendCutText,AcceptCutText,SendPrimary,SetPrimary.


USAGE WITH INETD
       By configuring the inetd(1) service appropriately, Xvnc can be launched on demand when a connection comes in, rather than having to be started manually.  When given the  -inetd  option,  instead  of
       listening for TCP connections on a given port it uses its standard input and standard output.  There are two modes controlled by the wait/nowait entry in the inetd.conf file.

       In  the  nowait mode, Xvnc uses its standard input and output directly as the connection to a viewer.  It never has a listening socket, so cannot accept further connections from viewers (it can how‐
       ever connect out to listening viewers by use of the vncconfig program).  Further viewer connections to the same TCP port result in inetd spawning off a new Xvnc to deal with each  connection.   When
       the  connection to the viewer dies, the Xvnc and any associated X clients die.  This behaviour is most useful when combined with the XDMCP options -query and -once.  An typical example in inetd.conf
       might be (all on one line):

       5950   stream   tcp nowait nobody  /usr/local/bin/Xvnc Xvnc -inetd -query localhost -once securitytypes=none

       In this example a viewer connection to :50 will result in a new Xvnc for that connection which should display the standard XDM login screen on that machine.  Because the user needs to login via XDM,
       it is usually OK to accept connections without a VNC password in this case.

       In  the wait mode, when the first connection comes in, inetd gives the listening socket to Xvnc.  This means that for a given TCP port, there is only ever one Xvnc at a time.  Further viewer connec‐
       tions to the same port are accepted by the same Xvnc in the normal way.  Even when the original connection is broken, the Xvnc will continue to run.  If this is used with the  XDMCP  options  -query
       and  -once,  the Xvnc and associated X clients will die when the user logs out of the X session in the normal way.  It is important to use a VNC password in this case.  A typical entry in inetd.conf
       might be:

       5951   stream   tcp wait   james     /usr/local/bin/Xvnc Xvnc -inetd -query localhost -once passwordFile=/home/james/.vnc/passwd

       In fact typically, you would have one entry for each user who uses VNC regularly, each of whom has their own dedicated TCP port which they use.  In this example, when user "james" connects  to  :51,
       he  enters  his VNC password, then gets the XDM login screen where he logs in in the normal way.  However, unlike the previous example, if he disconnects, the session remains persistent, and when he
       reconnects he will get the same session back again.  When he logs out of the X session, the Xvnc will die, but of course a new one will be created automatically the next time he connects.


SEE ALSO
       vncconfig(1), vncpasswd(1), vncserver(1), vncviewer(1), Xserver(1), inetd(1)
       http://www.tigervnc.org


AUTHOR
       Tristan Richardson, RealVNC Ltd. and others.

       VNC was originally developed by the RealVNC team while at Olivetti Research Ltd / AT&T Laboratories Cambridge.  TightVNC additions were implemented by Constantin Kaplinsky. Many  other  people  have
       since participated in development, testing and support. This manual is part of the TigerVNC software suite.



TigerVNC                                                                                                                                                                                              Xvnc(1)
