X0VNCSERVER(1)                                                                                 TigerVNC Manual                                                                                 X0VNCSERVER(1)



NAME
       x0vncserver - TigerVNC Server for X displays

SYNOPSIS
       x0vncserver [options]
       x0vncserver -version

DESCRIPTION
       x0vncserver  is  a  TigerVNC  Server  which  makes any X display remotely accessible via VNC, TigerVNC or compatible viewers.  Unlike Xvnc(1), it does not create a virtual display.  Instead, it just
       shares an existing X server (typically, that one connected to the physical screen).

       XDamage will be used if the existing X server supports it. Otherwise x0vncserver will fall back to polling the screen for changes.


OPTIONS
       x0vncserver interprets the command line as a list of parameters with optional values.  Running x0vncserver -h will show a list of all valid parameters with short descriptions.   All  parameters  are
       optional, but normally you would have to use the PasswordFile parameter (see its description below).

       There are several forms of specifying parameters in the command line (here we use `SomeParameter' as an example parameter name):


       -SomeParameter
              Enable the parameter, turn the feature on.  This form can be used with parameters that simply enable or disable some feature.

       -SomeParameter=0
              Disable the parameter, turn the feature off.

       -SomeParameter=value
              Assign the specified value to the parameter.  The leading dash can be omitted, or it can be doubled if desired (like in GNU-style long options).

       Parameter names are case-insensitive, their order in the command line can be arbitrary.


PARAMETERS
       display
              The X display name.  If not specified, it defaults to the value of the DISPLAY environment variable.

       rfbport
              TCP port to listen for incoming VNC connections (RFB protocol).  The default port is 5900.

       Log    Specifies  which  log output should be directed to which target logger, and the level of output to log.  Format is log:target:level.  Default is *:stderr:30 (log everything to stderr, set log
              level to 30).  Log level should be a value between 0 and 100, higher levels produce more output.

       HostsFile
              This parameter allows to specify a file name with IP access control rules.  The file should include one rule per line, and the rule format is one of  the  following:  +address/prefix  (accept
              connections from the specified address group), -address/prefix (reject connections) or ?address/prefix (query the local user).  The first rule matching the IP address determines the action to
              be performed.  Rules that include only an action sign (+, - or ?) will match any IP address.  Prefix is optional and is specified as a number of bits (e.g. /24).  Default is to accept connec-
              tions from any IP address.

       SecurityTypes
              Specify  which  security  scheme to use for incoming connections.  Valid values are a comma separated list of None, VncAuth, Plain, TLSNone, TLSVnc, TLSPlain, X509None, X509Vnc and X509Plain.
              Default is VncAuth,TLSVnc.

       rfbauth, PasswordFile
              Password file for VNC authentication.  There is no default, you should specify the password file explicitly.  Password file should be created with the vncpasswd(1) utility.

       Password
              Obfuscated binary encoding of the password which clients must supply to access the server.  Using this parameter is insecure, use PasswordFile parameter instead.

       PlainUsers
              A comma separated list of user names that are allowed to authenticate via any of the "Plain" security types (Plain, TLSPlain, etc.). Specify * to allow any user  to  authenticate  using  this
              security type. Default is to deny all users.

       pam_service, PAMService
              PAM service name to use when authentication users using any of the "Plain" security types. Default is vnc.

       X509Cert
              Path to a X509 certificate in PEM format to be used for all X509 based security types (X509None, X509Vnc, etc.).

       X509Key
              Private key counter part to the certificate given in X509Cert. Must also be in PEM format.

       BlacklistThreshold
              The number of unauthenticated connection attempts allowed from any individual host before that host is black-listed.  Default is 5.

       BlacklistTimeout
              The initial timeout applied when a host is first black-listed.  The host cannot re-attempt a connection until the timeout expires.  Default is 10.

       QueryConnect
              Prompt the local user to accept or reject incoming connections.  Default is off.

       QueryConnectTimeout
              Number of seconds to show the Accept Connection dialog before rejecting the connection.  Default is 10.

       AlwaysShared
              Always treat incoming connections as shared, regardless of the client-specified setting.  Default is off.

       NeverShared
              Never treat incoming connections as shared, regardless of the client-specified setting.  Default is off.

       DisconnectClients
              Disconnect existing clients if an incoming connection is non-shared.  If combined with NeverShared then new connections will be refused while there is a client active.  Default is on.

       AcceptKeyEvents
              Accept key press and release events from clients.  Default is on.

       AcceptPointerEvents
              Accept pointer events from clients.  Default is on.

       RemapKeys
              Comma-separated list of incoming keysyms to remap.  Mappings are expressed as two hex values, prefixed by 0x, and separated by -> (`dash' and `greater than' characters).

       Protocol3.3
              Always use RFB protocol version 3.3 for backwards compatibility with badly-behaved clients.  Default is off.

       Geometry
              This  option  specifies the screen area that will be shown to VNC clients.  The format is widthxheight+xoffset+yoffset , where `+' signs can be replaced with `-' signs to specify offsets from
              the right and/or from the bottom of the screen.  Offsets are optional, +0+0 is assumed by default (top left corner).  If the argument is empty, full screen is shown to VNC  clients  (this  is
              the default).

       MaxProcessorUsage
              Maximum percentage of CPU time to be consumed when polling the screen.  Default is 35.

       PollingCycle
              Milliseconds per one polling cycle.  Actual interval may be dynamically adjusted to satisfy MaxProcessorUsage setting.  Default is 30.

       DeferUpdate
              x0vncserver  uses  a  "deferred  update" mechanism which enhances performance in many cases. After any change to the framebuffer, x0vncserver waits for this number of milliseconds (default 1)
              before sending an update to any waiting clients. This means that more changes tend to get coalesced together in a single update. Setting it to 0 results in the same behaviour as earlier  ver-
              sions of x0vncserver, where the first change to the framebuffer causes an immediate update to any waiting clients.

       AlwaysSetDeferUpdateTimer
              Keep delaying sending the screen update to the client(s) each time the screen is updated. Otherwise the delay is from the first update. Default is off.

       CompareFB
              Perform pixel comparison on framebuffer to reduce unnecessary updates. Can be either 0 (off), 1 (always) or 2 (auto). Default is 2.

       UseSHM Use MIT-SHM extension if available.  Using that extension accelerates reading the screen.  Default is on.

       OverlayMode
              Use overlay mode in IRIX or Solaris (does not have effect in other systems).  This enables system-specific access to complete full-color version of the screen (the default X visual often pro-
              vides 256 colors).  Also, in overlay mode, x0vncserver can show correct mouse cursor.  Default is on.

       ZlibLevel
              Zlib compression level for ZRLE encoding (it does not affect Tight encoding).  Acceptable values are between 0 and 9.  Default is to use the standard compression level provided by the zlib(3)
              compression library.

       ImprovedHextile
              Use improved compression algorithm for Hextile encoding which achieves better compression ratios by the cost of using slightly more CPU time.  Default is on.

       IdleTimeout
              The number of seconds after which an idle VNC connection will be dropped (zero means no timeout).  Default is 0.

       MaxDisconnectionTime
              Terminate when no client has been connected for N seconds.  Default is 0.

       MaxConnectionTime
              Terminate when a client has been connected for N seconds.  Default is 0.

       MaxIdleTime
              Terminate after N seconds of user inactivity.  Default is 0.

       ClientWaitTimeMillis
              The number of milliseconds to wait for a client which is no longer responding.  Default is 20000.

       AcceptCutText
       SendCutText
       MaxCutText
              Currently unused.


SEE ALSO
       Xvnc(1), vncpasswd(1),
       http://www.tigervnc.org/


AUTHOR
       Constantin Kaplinsky and others.

       VNC  was  originally  developed by the RealVNC team while at Olivetti Research Ltd / AT&T Laboratories Cambridge.  TightVNC additions were implemented by Constantin Kaplinsky. Many other people have
       since participated in development, testing and support. This manual is part of the TigerVNC software suite.



TigerVNC                                                                                                                                                                                       X0VNCSERVER(1)
