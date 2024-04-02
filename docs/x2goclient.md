x2goclient(1)               X2Go Client (Qt4)              x2goclient(1)

NAME
       x2goclient  -  Client application to launch server-side X2Go ses‐
       sions.

SYNOPSIS
       x2goclient  <options>

DESCRIPTION
       x2goclient is a GUI application for launching server-side X2Go
       sessions.

HELP AND DEBUG OPTIONS
       x2goclient has the following help and debugging options:

       --help Show available command line options.

       --help-pack
              Show available pack methods and exit.

       -v, --version
              Output X2Go Client version to stderr.

       --debug
              Enable extensive console output for debugging X2Go Client.

       --changelog
              Show changelog file.

       --git-info
              Show Git commit history (not available on all X2Go Client
              builds).

GUI OPTIONS
       The following options can be used for controlling the GUI
       behaviour:

       --no-menu
              Hide menu-/toolbar (default: false).

       --maximize
              Start client maximized (default: false).

       --hide Hide client (start hidden, default: false).

       --keep-trayicon
              Always keep the "accelerated X" icon in the system tray.
              Without this option the default behaviour is: Switch the
              tray icon to the session's icon on successful session
              startup/resumption.

       --tray-icon
              Show tray icon (default: false). This option overrides the
              global tray icon settings and also forces the tray icon to
              be shown in hidden X2Go Client mode.

       --hide-foldersharing
              Hide all elements in X2Go Client GUI that are related to
              folder sharing.

       --close-disconnect
              Close X2Go Client after a session got disconnected.

       --client-ssh-port
              Local ssh port (for filesystem export, default: 22).

       --autostart=<app>
              Launch <app> by session start in "published applications"
              mode. This parameter should go along with
              --session=<session-profile-name>, where the given session
              profile should be configured as a session profile of type
              "Published Applications".

       --support-menu=<html-file>
              Add a "Support..." submenu item to X2Go Client's "Help"
              menu.

              The support information is provided via a simple HTML
              file. Example:

                   <html><body>
                   <h1>IT-Support for X2Go</h1>
                   DAS-NETZWERKTEAM | Mike Gabriel:<br />
                   <a href="mailto:support@das-netzwerkteam.de">
                       support@das-netzwerkteam.de
                   </a><br />
                   <br />
                   Thanks for using X2Go...
                   </body></html>

       --background=<svg-file>
              Use a custom/branded background image (SVG format) for
              X2Go Client's main window (i.e. replace the blue gradient
              area in X2Go Client by some background of your own
              (business/workgroup/project).

SESSION PROFILE DEFAULTS
       You can set certain defaults for session profiles via command
       line switches using the following options:

       --user Pre-selection of user at client startup (LDAP mode only).

       --command=<default-command>
              Default command for session startup.

       --ssh-port
              Use this default TCP/IP port for connection (default: 22).

       --ssh-key
              Use this SSH private key file by default.

       --autologin
              By default, search for standard SSH key file names or try
              using an SSH agent.

       --link Set default link type (modem,isdn,adsl,wan or lan,
              default: adsl).

       --pack Set default pack method (default: '16m-jpeg').

       --quality
              Set default image quality(0-9, default: 9).

       --set-kbd
              Overwrite current keyboard settings, no override by
              default.

       --kbd-layout
              Set keyboard layout (default: 'de').

       --kbd-type
              Set keyboard type (default: pc105/us, depend on our
              clients language setup, though).

       --clipboard=<both|client|server|none>
              Set default clipboard mode.

       --geometry=<W>x<H>|fullscreen
              Set default geometry, default '800x600'.

       --dpi=<dpi>
              set DPI of X2Go Agent to <dpi>, default set to same as
              local display.

       --sound
              Activate sound for session, not enabled by default.

       --sound-system
              Which soundsystem to use: arts, esd, pulse (default:
              pulse).

       --xinerama
              Use Xinerama by default.

       --session-icon=<128x128px-icon-png-file>
              Use a custom session icon by default.

THIN CLIENT OPTIONS
       The following command line options are primarily interesting if
       x2goclient is used as a login manager on X2Go thin clients.

       --thinclient
              Let X2Go Client run without window manager.

       --sessionid=<session-profile-id>
              Pre-selection of a session profile (by its session profile
              ID) at client startup.

       --session=<session-profile-name>
              Pre-selection of a session profile (by its session profile
              name) at client startup.

       --no-session-edit
              Disable session editing.

       --pgp-card
              Use openPGP Card authentication (default: false).

       --external-login=<smartcard-logins>
              Authenticate via SMART card, path to login notification
              file.

       --add-to-known-hosts
              Add DSA/RSA host key fingerprint to .ssh/known_hosts in
              case of "authenticity of server can't be established".

       --read-exports-from
              Specifies a directory where some external mechanism (e.g.
              script) can notify x2goclient on new block devices
              (CD/DVDs, USB sticks, etc.).

       --haltbt
              Show a "Shutdown" button in the top left corner of X2Go
              Client. When pressed, X2Go Client will create the file
              $HOME/.halt. An external script has to watch for this file
              and trigger a thinclient shutdown once it appears.

PORTABLE OPTIONS
       X2Go Client can be installed on a USB-Flashdrive as a portable
       applications. If installed that way, the following options
       support the portable setup of X2Go Client:

       --portable
              Start X2Go Client in "portable" mode. This implies...
              (TODO).

       --home=<dir>
              Set the users home directory. This is the directory where
              X2Go Client will store settings and cache files.

       --session-conf=<file>
              Path to alternative session profile config (default:
              $HOME/.x2goclient/sessions).

       --clean-all-files
              In portable mode, X2Go Client removes several directories
              it has created (and probably directories you don't want to
              have removed on a normal system):

                      $HOME/.ssh
                      $HOME/ssh
                      $HOME/.x2go

              If --clean-all-files is used on the command line, also the
              directory containing the configuration files of X2Go
              Client gets removed:

                      $HOME/.x2goclient

BROKER OPTIONS
       In case you want to retrieve x2goclient session profiles from an
       X2Go Session Broker use the following options:

       --broker-url=<URL>
              Specify the <URL> of the X2Go Session Broker. X2Go Client
              can access http:// and ssh:// style URLs.

              Syntax of <URL> for HTTP brokerage:

              http(s)://<user>:<password>@<hostname>:<port>/path/to/broker

              Syntax of <URL> for  SSH brokerage:

              ssh://<user>:<password>@<hostname>:<port>/usr/bin/x2gobroker
              (or any executable that provides the broker via SSH).

       --broker-cacertfile=</path/to/cafile.crt>
              Specify a special (self-signed) root-CACert file that
              shall get used when connecting to an X2Go Session Broker
              via https (SSL).

       --broker-noauth
              The X2Go Session Broker is accessible without
              authentication.

       --broker-krblogin
              Login to X2Go Session Broker via GSSAPI. Only supported
              with ssh:// broker URLs.

       --auth-id=<USERNAME>
              Use this <USERNAME> for authenticating against the X2Go
              Session Broker. This option mostly makes sense together
              with --broker-autologin or --broker-ssh-key.

       --broker-autologin
              For SSH based X2Go Session Brokers. If an SSH agent is
              available or default key files exist then try those for
              authentication against the X2Go Session Broker.

       --broker-autologoff
              Enforce re-authentication against X2Go Session Broker
              after a session has been suspended or terminated.

       --broker-ssh-key=<SSHPRIVKEY>
              For SSH based X2Go Session Brokers. Full path to a valid
              SSH private key file.

       --broker-name=<NAME>
              Currently unused...

       --connectivity-test
              Run a connectivity test against X2Go Session Broker. Not
              supported by all broker implementations.

       --change-broker-pass
              Send a change-password request to an X2Go Session Broker.
              Not supported by all broker implementations.

       --broker-noauth-with-session-username
              Informs the broker to use the username you entered for
              X2Go Server authentication when selecting a
              server/session. Only has functionality if --broker-noauth
              is used.

LDAP OPTIONS (deprecated)
       NOTE: LDAP support won't be continued in X2Go Client 2 (next
       generation of X2Go Client).

       A slightly different approach than X2Go Client's LDAP
       functionality is available via the X2Go Session Brokerage
       feature.

       In case you want to control x2goclient via an LDAP server use the
       following options:

       --ldap=<host:port:dn>
              Start with LDAP support (disabled by default). Example:
              --ldap=ldapserver:389:o=organization,c=de

       --ldap1=<host:port:dn>
              Failover LDAP URI No. 1.

       --ldap2=<host:port:dn>
              Failover LDAP URI No. 2.

       --ldap-printing
              Allow client side printing in LDAP mode.

AUTHOR
       This manual has been written by Mike Gabriel <mike.gabriel@das-
       netzwerkteam.de> for the X2Go project (http://www.x2go.org).

Version 4.0.5.1                 May 2015                   x2goclient(1)
