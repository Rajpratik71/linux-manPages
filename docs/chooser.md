XDM(1)                                                                                     General Commands Manual                                                                                     XDM(1)



NAME
       xdm - X Display Manager with support for XDMCP, host chooser

SYNOPSIS
       xdm [ -config configuration_file ] [ -nodaemon ] [ -debug debug_level ] [ -error error_log_file ] [ -resources resource_file ] [ -server server_entry ] [ -session session_program ]

DESCRIPTION
       Xdm  manages  a  collection of X displays, which may be on the local host or remote servers.  The design of xdm was guided by the needs of X terminals as well as The Open Group standard XDMCP, the X
       Display Manager Control Protocol.  Xdm provides services similar to those provided by init, getty and login on character terminals: prompting for login name and password,  authenticating  the  user,
       and running a ``session.''

       A  ``session''  is  defined  by the lifetime of a particular process; in the traditional character-based terminal world, it is the user's login shell.  In the xdm context, it is an arbitrary session
       manager.  This is because in a windowing environment, a user's login shell process does not necessarily have any terminal-like interface with which to connect.  When a real session  manager  is  not
       available, a window manager or terminal emulator is typically used as the ``session manager,'' meaning that termination of this process terminates the user's session.

       When the session is terminated, xdm resets the X server and (optionally) restarts the whole process.

       When  xdm  receives  an  Indirect query via XDMCP, it can run a chooser process to perform an XDMCP BroadcastQuery (or an XDMCP Query to specified hosts) on behalf of the display and offer a menu of
       possible hosts that offer XDMCP display management.  This feature is useful with X terminals that do not offer a host menu themselves.

       Xdm can be configured to ignore BroadcastQuery messages from selected hosts.  This is useful when you don't want the host to appear in menus produced by chooser or X terminals themselves.

       Because xdm provides the first interface that users will see, it is designed to be simple to use and easy to customize to the needs of a particular site.  Xdm has many options, most  of  which  have
       reasonable  defaults.   Browse  through  the various sections of this manual, picking and choosing the things you want to change.  Pay particular attention to the Session Program section, which will
       describe how to set up the style of session desired.

OVERVIEW
       xdm is highly configurable, and most of its behavior can be controlled by resource files and shell scripts.  The names of these files themselves are resources read from the file  xdm-config  or  the
       file named by the -config option.

       xdm  offers  display  management two different ways.  It can manage X servers running on the local machine and specified in Xservers, and it can manage remote X servers (typically X terminals) using
       XDMCP (the XDM Control Protocol) as specified in the Xaccess file.

       The resources of the X clients run by xdm outside the user's session, including xdm's own login window, can be affected by setting resources in the Xresources file.

       For X terminals that do not offer a menu of hosts to get display management from, xdm can collect willing hosts and run the chooser program to offer the user a menu.  For X displays  attached  to  a
       host, this step is typically not used, as the local host does the display management.

       After resetting the X server, xdm runs the Xsetup script to assist in setting up the screen the user sees along with the xlogin widget.

       The xlogin widget, which xdm presents, offers the familiar login and password prompts.

       After the user logs in, xdm runs the Xstartup script as root.

       Then  xdm  runs  the  Xsession  script  as the user.  This system session file may do some additional startup and typically runs the .xsession script in the user's home directory.  When the Xsession
       script exits, the session is over.

       At the end of the session, the Xreset script is run to clean up, the X server is reset, and the cycle starts over.

       The file  /var/log/xdm.log will contain error messages from xdm and anything output to stderr by Xsetup, Xstartup, Xsession or Xreset.  When you have trouble getting xdm working, check this file  to
       see if xdm has any clues to the trouble.

OPTIONS
       All of these options, except -config itself, specify values that can also be specified in the configuration file as resources.

       -config configuration_file
              Names the configuration file, which specifies resources to control the behavior of xdm.  /etc/X11/xdm/xdm-config is the default.  See the section Configuration File.

       -nodaemon
              Specifies  ``false''  as the value for the DisplayManager.daemonMode resource.  This suppresses the normal daemon behavior, which is for xdm to close all file descriptors, disassociate itself
              from the controlling terminal, and put itself in the background when it first starts up.

       -debug debug_level
              Specifies the numeric value for the DisplayManager.debugLevel resource.  A non-zero value causes xdm to print lots of debugging statements to the terminal; it also  disables  the  DisplayMan-
              ager.daemonMode  resource,  forcing  xdm  to  run  synchronously.  To interpret these debugging messages, a copy of the source code for xdm is almost a necessity.  No attempt has been made to
              rationalize or standardize the output.

       -error error_log_file
              Specifies the value for the DisplayManager.errorLogFile resource.  This file contains errors from xdm as well as anything written to stderr by the various scripts and programs run during  the
              progress of the session.

       -resources resource_file
              Specifies the value for the DisplayManager*resources resource.  This file is loaded using xrdb(1) to specify configuration parameters for the authentication widget.

       -server server_entry
              Specifies the value for the DisplayManager.servers resource.  See the section Local Server Specification for a description of this resource.

       -udpPort port_number
              Specifies  the  value for the DisplayManager.requestPort resource.  This sets the port-number which xdm will monitor for XDMCP requests.  If set to 0, xdm will not listen for XDMCP or Chooser
              requests.  As XDMCP uses the registered well-known UDP port 177, this resource should not be changed to a value other than 0, except for debugging.

       -session session_program
              Specifies the value for the DisplayManager*session resource.  This indicates the program to run as the session after the user has logged in.

       -xrm resource_specification
              Allows an arbitrary resource to be specified, as in most X Toolkit applications.

RESOURCES
       At many stages the actions of xdm can be controlled through the use of its configuration file, which is in the X resource format.  Some resources modify the behavior of xdm on  all  displays,  while
       others  modify  its  behavior  on a single display.  Where actions relate to a specific display, the display name is inserted into the resource name between ``DisplayManager'' and the final resource
       name segment.

       For local displays, the resource name and class are as read from the Xservers file.

       For remote displays, the resource name is what the network address of the display resolves to.  See the removeDomain resource.  The name must match exactly; xdm is  not  aware  of  all  the  network
       aliases that might reach a given display.  If the name resolve fails, the address is used.  The resource class is as sent by the display in the XDMCP Manage request.

       Because  the resource manager uses colons to separate the name of the resource from its value and dots to separate resource name parts, xdm substitutes underscores for both dots and colons when gen-
       erating the resource name.  For example, DisplayManager.expo_x_org_0.startup is the name of the resource which defines the startup shell file for the ``expo.x.org:0'' display.

       DisplayManager.servers
              This resource either specifies a file name full of server entries, one per line (if the value starts with a slash), or a single server entry.  See the section Local Server  Specification  for
              the details.

       DisplayManager.requestPort
              This indicates the UDP port number which xdm uses to listen for incoming XDMCP requests.  Unless you need to debug the system, leave this with its default value of 177.

       DisplayManager.errorLogFile
              Error  output  is  normally directed at the system console.  To redirect it, set this resource to a file name.  A method to send these messages to syslog should be developed for systems which
              support it; however, the wide variety of interfaces precludes any system-independent implementation.  This file also contains any output directed to stderr by the Xsetup,  Xstartup,  Xsession
              and Xreset files, so it will contain descriptions of problems in those scripts as well.

       DisplayManager.debugLevel
              If  the  integer value of this resource is greater than zero, reams of debugging information will be printed.  It also disables daemon mode, which would redirect the information into the bit-
              bucket, and allows non-root users to run xdm, which would normally not be useful.

       DisplayManager.daemonMode
              Normally, xdm attempts to make itself into a daemon process unassociated with any terminal.  This is accomplished by forking and leaving the parent process to exit, then closing file descrip-
              tors and releasing the controlling terminal.  In some environments this is not desired (in particular, when debugging).  Setting this resource to ``false'' will disable this feature.

       DisplayManager.pidFile
              The  filename specified will be created to contain an ASCII representation of the process-id of the main xdm process.  Xdm also uses file locking on this file to attempt to eliminate multiple
              daemons running on the same machine, which would cause quite a bit of havoc.

       DisplayManager.lockPidFile
              This is the resource which controls whether xdm uses file locking to keep multiple display managers from running amok.  On System V, this uses the lockf library call, while  on  BSD  it  uses
              flock.

       DisplayManager.authDir
              This  names a directory under which xdm stores authorization files while initializing the session.  The default value is  /var/lib/xdm.  Can be overridden for specific displays by DisplayMan-
              ager.DISPLAY.authFile.

       DisplayManager.autoRescan
              This boolean controls whether xdm rescans the configuration, servers, access control and authentication keys files after a session terminates and the files have changed.   By  default  it  is
              ``true.''  You can force xdm to reread these files by sending a SIGHUP to the main process.

       DisplayManager.removeDomainname
              When  computing  the display name for XDMCP clients, the name resolver will typically create a fully qualified host name for the terminal.  As this is sometimes confusing, xdm will remove the
              domain name portion of the host name if it is the same as the domain name of the local host when this variable is set.  By default the value is ``true.''

       DisplayManager.keyFile
              XDM-AUTHENTICATION-1 style XDMCP authentication requires that a private key be shared between xdm and the terminal.  This resource specifies the file containing those values.  Each  entry  in
              the  file consists of a display name and the shared key.  By default, xdm does not include support for XDM-AUTHENTICATION-1, as it requires DES which is not generally distributable because of
              United States export restrictions.

       DisplayManager.accessFile
              To prevent unauthorized XDMCP service and to allow forwarding of XDMCP IndirectQuery requests, this file contains a database of hostnames which  are  either  allowed  direct  access  to  this
              machine, or have a list of hosts to which queries should be forwarded to.  The format of this file is described in the section XDMCP Access Control.

       DisplayManager.exportList
              A list of additional environment variables, separated by white space, to pass on to the Xsetup, Xstartup, Xsession, and Xreset programs.

       DisplayManager.randomFile
              A file to checksum to generate the seed of authorization keys.  This should be a file that changes frequently.  The default is /dev/mem.

       DisplayManager.randomDevice
              A  file  to  read  8 bytes from to generate the seed of authorization keys.  The default is  /dev/urandom . If this file cannot be read, or if a read blocks for more than 5 seconds, xdm falls
              back to using a checksum of DisplayManager.randomFile to generate the seed.

       DisplayManager.prngdSocket

       DisplayManager.prngPort
              A UNIX domain socket name or a TCP socket port number on local host on which a Pseudo-Random Number Generator Daemon, like EGD (http://egd.sourceforge.net) is listening, in order to  generate
              the autorization keys. Either a non null port or a valid socket name must be specified. The default is to use the Unix-domain socket /tmp/entropy.

       On systems that don't have such a daemon, a fall-back entropy gathering system, based on various log file contents hashed by the MD5 algorithm is used instead.

       DisplayManager.greeterLib
              On systems that support a dynamically-loadable greeter library, the name of the library.  The default is
               /usr/lib64/X11/xdm/libXdmGreet.so.

       DisplayManager.choiceTimeout
              Number  of  seconds  to wait for display to respond after user has selected a host from the chooser.  If the display sends an XDMCP IndirectQuery within this time, the request is forwarded to
              the chosen host.  Otherwise, it is assumed to be from a new session and the chooser is offered again.  Default is 15.

       DisplayManager.sourceAddress
              Use the numeric IP address of the incoming connection on multihomed hosts instead of the host name. This is to avoid trying to connect on the wrong interface which might be down at this time.

       DisplayManager.willing
              This specifies a program which is run (as) root when an an XDMCP BroadcastQuery is received and this host is configured to offer XDMCP display management. The output of this  program  may  be
              displayed on a chooser window.  If no program is specified, the string Willing to manage is sent.

       DisplayManager.DISPLAY.resources
              This  resource specifies the name of the file to be loaded by xrdb as the resource database onto the root window of screen 0 of the display.  The Xsetup program, the Login widget, and chooser
              will use the resources set in this file.  This resource data base is loaded just before the authentication procedure is started, so it can control the appearance of the login window.  See the
              section Authentication Widget, which describes the various resources that are appropriate to place in this file.  There is no default value for this resource, but
               /etc/X11/xdm/Xresources is the conventional name.

       DisplayManager.DISPLAY.chooser
              Specifies the program run to offer a host menu for Indirect queries redirected to the special host name CHOOSER.
               /usr/lib64/X11/xdm/chooser  is the default.  See the sections XDMCP Access Control and Chooser.

       DisplayManager.DISPLAY.xrdb
              Specifies the program used to load the resources.  By default, xdm uses  /usr/bin/xrdb.

       DisplayManager.DISPLAY.cpp
              This specifies the name of the C preprocessor which is used by xrdb.

       DisplayManager.DISPLAY.setup
              This  specifies  a program which is run (as root) before offering the Login window.  This may be used to change the appearance of the screen around the Login window or to put up other windows
              (e.g., you may want to run xconsole here).  By default, no program is run.  The conventional name for a file used here is Xsetup.  See the section Setup Program.

       DisplayManager.DISPLAY.startup
              This specifies a program which is run (as root) after the authentication process succeeds.  By default, no program is run.  The conventional name for a file used here is  Xstartup.   See  the
              section Startup Program.

       DisplayManager.DISPLAY.session
              This specifies the session to be executed (not running as root).  By default,  /usr/bin/xterm is run.  The conventional name is Xsession.  See the section Session Program.

       DisplayManager.DISPLAY.reset
              This specifies a program which is run (as root) after the session terminates.  By default, no program is run.  The conventional name is Xreset.  See the section Reset Program.

       DisplayManager.DISPLAY.openDelay

       DisplayManager.DISPLAY.openRepeat

       DisplayManager.DISPLAY.openTimeout

       DisplayManager.DISPLAY.startAttempts

       DisplayManager.DISPLAY.reservAttempts
              These  numeric  resources control the behavior of xdm when attempting to open intransigent servers.  openDelay is the length of the pause in seconds between successive attempts, openRepeat is
              the number of attempts to make, openTimeout is the amount of time to wait while actually attempting the open (i.e., the maximum time spent in the connect(2) system call) and startAttempts  is
              the number of times this entire process is done before giving up on the server.  After openRepeat attempts have been made, or if openTimeout seconds elapse in any particular attempt, xdm ter-
              minates and restarts the server, attempting to connect again.  This process is repeated startAttempts times, at which point the display is declared dead and disabled.  Although this  behavior
              may  seem arbitrary, it has been empirically developed and works quite well on most systems.  The bound reservAttempts is the number of times a successful connect is allowed to be followed by
              a fatal error.  When reached, the display is disabled.  The default values are openDelay: 15, openRepeat: 5, openTimeout: 120, startAttempts: 4 and reservAttempts: 2.

       DisplayManager.DISPLAY.pingInterval

       DisplayManager.DISPLAY.pingTimeout
              To discover when remote displays disappear, xdm occasionally pings them, using an X connection and XSync calls.  pingInterval specifies the time (in minutes) between each ping attempt,  ping-
              Timeout  specifies  the maximum amount of time (in minutes) to wait for the terminal to respond to the request.  If the terminal does not respond, the session is declared dead and terminated.
              By default, both are set to 5 minutes.  If you frequently use X terminals which can become isolated from the managing host, you may wish to increase this value.  The only worry is  that  ses-
              sions will continue to exist after the terminal has been accidentally disabled.  xdm will not ping local displays.  Although it would seem harmless, it is unpleasant when the workstation ses-
              sion is terminated as a result of the server hanging for NFS service and not responding to the ping.

       DisplayManager.DISPLAY.terminateServer
              This boolean resource specifies whether the X server should be terminated when a session terminates (instead of resetting it).  This option can be used when the server tends to  grow  without
              bound over time, in order to limit the amount of time the server is run.  The default value is ``false.''

       DisplayManager.DISPLAY.userPath
              Xdm  sets  the  PATH  environment  variable  for  the  session  to  this  value.   It  should be a colon separated list of directories; see sh(1) for a full description.  The default value is
              ``/bin:/usr/bin:/usr/bin:/usr/ucb''.

       DisplayManager.DISPLAY.systemPath
              Xdm sets the PATH environment variable for the startup and reset scripts to the value of this resource.  The default for this resource is ``/etc:/bin:/usr/bin:/usr/bin:/usr/ucb''.   Note  the
              absence of ``.'' from this entry.  This is a good practice to follow for root; it avoids many common Trojan Horse system penetration schemes.

       DisplayManager.DISPLAY.systemShell
              Xdm sets the SHELL environment variable for the startup and reset scripts to the value of this resource.  It is /bin/sh by default.

       DisplayManager.DISPLAY.failsafeClient
              If  the  default  session  fails  to execute, xdm will fall back to this program.  This program is executed with no arguments, but executes using the same environment variables as the session
              would have had (see the section Session Program).  By default,  /usr/bin/xterm is used.

       DisplayManager.DISPLAY.grabServer

       DisplayManager.DISPLAY.grabTimeout
              To improve security, xdm grabs the server and keyboard while reading the login name and password.  The grabServer resource specifies if the server should be  held  for  the  duration  of  the
              name/password  reading.   When  ``false,''  the  server  is  ungrabbed  after the keyboard grab succeeds, otherwise the server is grabbed until just before the session begins.  The default is
              ``false.''  The grabTimeout resource specifies the maximum time xdm will wait for the grab to succeed.  The grab may fail if some other client has the server grabbed, or possibly if the  net-
              work  latencies are very high.  This resource has a default value of 3 seconds; you should be cautious when raising it, as a user can be spoofed by a look-alike window on the display.  If the
              grab fails, xdm kills and restarts the server (if possible) and the session.

       DisplayManager.DISPLAY.authorize

       DisplayManager.DISPLAY.authName
              authorize is a boolean resource which controls whether xdm generates and uses authorization for the local server connections.  If authorization is used, authName is a  list  of  authorization
              mechanisms  to  use, separated by white space.  XDMCP connections dynamically specify which authorization mechanisms are supported, so authName is ignored in this case.  When authorize is set
              for a display and authorization is not available, the user is informed by having a different message displayed in the login widget.  By default, authorize is  ``true,''   authName  is  ``MIT-
              MAGIC-COOKIE-1,'' or, if XDM-AUTHORIZATION-1 is available, ``XDM-AUTHORIZATION-1 MIT-MAGIC-COOKIE-1.''

       DisplayManager.DISPLAY.authFile
              This file is used to communicate the authorization data from xdm to the server, using the -auth server command line option.  It should be kept in a directory which is not world-writable as it
              could easily be removed, disabling the authorization mechanism in the server.  If not specified, a name is generated from DisplayManager.authDir and the name of the display.

       DisplayManager.DISPLAY.authComplain
              If set to ``false,'' disables the use of the unsecureGreeting in the login window.  See the section Authentication Widget.  The default is ``true.''

       DisplayManager.DISPLAY.resetSignal
              The number of the signal xdm sends to reset the server.  See the section Controlling the Server.  The default is 1 (SIGHUP).

       DisplayManager.DISPLAY.termSignal
              The number of the signal xdm sends to terminate the server.  See the section Controlling the Server.  The default is 15 (SIGTERM).

       DisplayManager.DISPLAY.resetForAuth
              The original implementation of authorization in the sample server reread the authorization file at server reset time, instead of when checking the initial connection.  As  xdm  generates  the
              authorization information just before connecting to the display, an old server would not get up-to-date authorization information.  This resource causes xdm to send SIGHUP to the server after
              setting up the file, causing an additional server reset to occur, during which time the new authorization information will be read.  The default is ``false,'' which  will  work  for  all  MIT
              servers.

       DisplayManager.DISPLAY.userAuthDir
              When  xdm  is  unable  to write to the usual user authorization file ($HOME/.Xauthority), it creates a unique file name in this directory and points the environment variable XAUTHORITY at the
              created file.  It uses /tmp by default.

CONFIGURATION FILE
       First, the xdm configuration file should be set up.  Make a directory (usually  /etc/X11/xdm) to contain all of the relevant files.

       Here is a reasonable configuration file, which could be named xdm-config:


            DisplayManager.servers:            /etc/X11/xdm/Xservers
            DisplayManager.errorLogFile:       /var/log/xdm.log
            DisplayManager*resources:          /etc/X11/xdm/Xresources
            DisplayManager*startup:            /etc/X11/xdm/Xstartup
            DisplayManager*session:            /etc/X11/xdm/Xsession
            DisplayManager.pidFile:            /var/run/xdm-pid
            DisplayManager._0.authorize:       true
            DisplayManager*authorize:          false


       Note that this file mostly contains references to other files.  Note also that some of the resources are specified with ``*'' separating the components.  These resources can be made unique for  each
       different display, by replacing the ``*'' with the display-name, but normally this is not very useful.  See the Resources section for a complete discussion.

XDMCP ACCESS CONTROL
       The database file specified by the DisplayManager.accessFile provides information which xdm uses to control access from displays requesting XDMCP service.  This file contains three types of entries:
       entries which control the response to Direct and Broadcast queries, entries which control the response to Indirect queries, and macro definitions.

       The format of the Direct entries is simple, either a host name or a pattern, which is distinguished from a host name by the inclusion of one or more meta characters (`*' matches any sequence of 0 or
       more characters, and `?' matches any single character) which are compared against the host name of the display device.  If the entry is a host name, all comparisons are done using network addresses,
       so any name which converts to the correct network address may be used.  For patterns, only canonical host names are used in the comparison, so ensure that you do not attempt to match aliases.   Pre-
       ceding either a host name or a pattern with a `!' character causes hosts which match that entry to be excluded.

       To  only  respond  to  Direct  queries  for a host or pattern, it can be followed by the optional ``NOBROADCAST'' keyword.  This can be used to prevent an xdm server from appearing on menus based on
       Broadcast queries.

       An Indirect entry also contains a host name or pattern, but follows it with a list of host names or macros to which indirect queries should be sent.

       A macro definition contains a macro name and a list of host names and other macros that the macro expands to.  To distinguish macros from hostnames, macro names start with a `%'  character.   Macros
       may be nested.

       Indirect entries may also specify to have xdm run chooser to offer a menu of hosts to connect to.  See the section Chooser.

       When checking access for a particular display host, each entry is scanned in turn and the first matching entry determines the response.  Direct and Broadcast entries are ignored when scanning for an
       Indirect entry and vice-versa.

       Blank lines are ignored, `#' is treated as a comment delimiter causing the rest of that line to be ignored, and `\newline' causes the newline to be ignored, allowing indirect host lists to span mul-
       tiple lines.

       Here is an example Xaccess file:

       #
       # Xaccess - XDMCP access control file
       #

       #
       # Direct/Broadcast query entries
       #

       !xtra.lcs.mit.edu   # disallow direct/broadcast service for xtra
       bambi.ogi.edu       # allow access from this particular display
       *.lcs.mit.edu       # allow access from any display in LCS

       *.deshaw.com        NOBROADCAST         # allow only direct access
       *.gw.com                                # allow direct and broadcast

       #
       # Indirect query entries
       #

       %HOSTS              expo.lcs.mit.edu xenon.lcs.mit.edu \
                           excess.lcs.mit.edu kanga.lcs.mit.edu

       extract.lcs.mit.edu xenon.lcs.mit.edu   #force extract to contact xenon
       !xtra.lcs.mit.edu   dummy               #disallow indirect access
       *.lcs.mit.edu       %HOSTS              #all others get to choose

       If compiled with IPv6 support, multicast address groups may also be included in the list of addresses indirect queries are set to.  Multicast addresses may be followed by an optional / character and
       hop count. If no hop count is specified, the multicast hop count defaults to 1, keeping the packet on the local network. For IPv4 multicasting, the hop count is used as the TTL.

       Examples:

       rincewind.sample.net ff02::1                 #IPv6 Multicast to ff02::1
                                                    #with a hop count of 1
       ponder.sample.net    CHOOSER 239.192.1.1/16  #Offer a menu of hosts
                                                    #who respond to IPv4 Multicast
                                                    # to 239.192.1.1 with a TTL of 16

CHOOSER
       For X terminals that do not offer a host menu for use with Broadcast or Indirect queries, the chooser program can do this for them.  In the Xaccess file, specify ``CHOOSER'' as the  first  entry  in
       the Indirect host list.  Chooser will send a Query request to each of the remaining host names in the list and offer a menu of all the hosts that respond.

       The  list may consist of the word ``BROADCAST,'' in which case chooser will send a Broadcast instead, again offering a menu of all hosts that respond.  Note that on some operating systems, UDP pack-
       ets cannot be broadcast, so this feature will not work.

       Example Xaccess file using chooser:

       extract.lcs.mit.edu  CHOOSER %HOSTS          #offer a menu of these hosts
       xtra.lcs.mit.edu     CHOOSER BROADCAST       #offer a menu of all hosts

       The program to use for chooser is specified by the DisplayManager.DISPLAY.chooser resource.  For more flexibility at this step, the chooser could be a shell script.  Chooser is the  session  manager
       here; it is run instead of a child xdm to manage the display.

       Resources for this program can be put into the file named by DisplayManager.DISPLAY.resources.

       When the user selects a host, chooser prints the host chosen, which is read by the parent xdm, and exits.  xdm closes its connection to the X server, and the server resets and sends another Indirect
       XDMCP request.  xdm remembers the user's choice (for DisplayManager.choiceTimeout seconds) and forwards the request to the chosen host, which starts a session on that display.

LISTEN
       The following configuration directive is also defined for the Xaccess configuration file:

       LISTEN interface [list of multicast group addresses]
              interface may be a hostname or IP address representing a network interface on this machine, or the wildcard * to represent all available network interfaces.

       If one or more LISTEN lines are specified, xdm only listens for XDMCP connections on the specified interfaces. If multicast group addresses are listed on a  listen  line,  xdm  joins  the  multicast
       groups on the given interface.

       If  no  LISTEN  lines  are given, the original behavior of listening on all interfaces is preserved for backwards compatibility.  Additionally, if no LISTEN is specified, xdm joins the default XDMCP
       IPv6 multicast group, when compiled with IPv6 support.

       To disable listening for XDMCP connections altogther, a line of LISTEN with no addresses may be specified, or the previously supported method of setting DisplayManager.requestPort to 0 may be used.

       Examples:
       LISTEN * ff02::1    # Listen on all interfaces and to the
                           # ff02::1 IPv6 multicast group.
       LISTEN 10.11.12.13  # Listen only on this interface, as long
                           # as no other listen directives appear in
                           # file.

IPv6 MULTICAST ADDRESS SPECIFICATION
       The Internet Assigned Numbers Authority has has assigned ff0X:0:0:0:0:0:0:12b as the permanently assigned range of multicast addresses for XDMCP. The X in the prefix may be  replaced  by  any  valid
       scope  identifier,  such  as 1 for Interface-Local, 2 for Link-Local, 5 for Site-Local, and so on.  (See IETF RFC 4291 or its replacement for further details and scope definitions.)  xdm defaults to
       listening on the Link-Local scope address ff02:0:0:0:0:0:0:12b to most closely match the old IPv4 subnet broadcast behavior.

LOCAL SERVER SPECIFICATION
       The resource DisplayManager.servers gives a server specification or, if the values starts with a slash (/), the name of a file containing server specifications, one per line.

       Each specification indicates a display which should constantly be managed and which is not using XDMCP.  This method is used typically for local servers only.  If the resource or the file  named  by
       the resource is empty, xdm will offer XDMCP service only.

       Each  specification consists of at least three parts:  a display name, a display class, a display type, and (for local servers) a command line to start the server.  A typical entry for local display
       number 0 would be:

         :0 Digital-QV local /usr/bin/X :0

       The display types are:

       local     local display: xdm must run the server
       foreign   remote display: xdm opens an X connection to a running server


       The display name must be something that can be passed in the -display option to an X program.  This string is used to generate the display-specific resource names, so be careful to match  the  names
       (e.g.,  use ``:0 Sun-CG3 local /usr/bin/X :0'' instead of ``localhost:0 Sun-CG3 local /usr/bin/X :0'' if your other resources are specified as ``DisplayManager._0.session'').  The display class por-
       tion is also used in the display-specific resources, as the class of the resource.  This is useful if you have a large collection of similar displays (such as a corral of X terminals) and would like
       to  set  resources  for groups of them.  When using XDMCP, the display is required to specify the display class, so the manual for your particular X terminal should document the display class string
       for your device.  If it doesn't, you can run xdm in debug mode and look at the resource strings which it generates for that device, which will include the class string.

       When xdm starts a session, it sets up authorization data for the server.  For local servers, xdm passes ``-auth filename'' on the server's command line to point it at its  authorization  data.   For
       XDMCP servers, xdm passes the authorization data to the server via the Accept XDMCP request.

RESOURCES FILE
       The  Xresources  file is loaded onto the display as a resource database using xrdb.  As the authentication widget reads this database before starting up, it usually contains parameters for that wid-
       get:

            xlogin*login.translations: #override\
                 Ctrl<Key>R: abort-display()\n\
                 <Key>F1: set-session-argument(failsafe) finish-field()\n\
                 <Key>Return: set-session-argument() finish-field()
            xlogin*borderWidth: 3
            xlogin*greeting: CLIENTHOST
            #ifdef COLOR
            xlogin*greetColor: CadetBlue
            xlogin*failColor: red
            #endif


       Please note the translations entry; it specifies a few new translations for the widget which allow users to escape from the default session (and avoid troubles that may occur in it).  Note  that  if
       #override  is  not  specified,  the  default  translations  are removed and replaced by the new value, not a very useful result as some of the default translations are quite useful (such as ``<Key>:
       insert-char ()'' which responds to normal typing).

       This file may also contain resources for the setup program and chooser.

SETUP PROGRAM
       The Xsetup file is run after the server is reset, but before the Login window is offered.  The file is typically a shell script.  It is run as root, so should be careful about security.  This is the
       place to change the root background or bring up other windows that should appear on the screen along with the Login widget.

       In addition to any specified by DisplayManager.exportList, the following environment variables are passed:

            DISPLAY        the associated display name
            PATH           the value of DisplayManager.DISPLAY.systemPath
            SHELL          the value of DisplayManager.DISPLAY.systemShell
            XAUTHORITY     may be set to an authority file

       Note that since xdm grabs the keyboard, any other windows will not be able to receive keyboard input.  They will be able to interact with the mouse, however; beware of potential security holes here.
       If DisplayManager.DISPLAY.grabServer is set, Xsetup will not be able to connect to the display at all.  Resources for this program can be put into the file named by DisplayManager.DISPLAY.resources.

       Here is a sample Xsetup script:

            #!/bin/sh
            # Xsetup_0 - setup script for one workstation
            xcmsdb < /etc/X11/xdm/monitors/alex.0
            xconsole -geometry 480x130-0-0 -notify -verbose -exitOnFail &


AUTHENTICATION WIDGET
       The authentication widget prompts the user for the username, password, and/or other required authentication data from the keyboard.  Nearly every  imaginable  parameter  can  be  controlled  with  a
       resource.   Resources  for  this  widget should be put into the file named by DisplayManager.DISPLAY.resources.  All of these have reasonable default values, so it is not necessary to specify any of
       them.

       The resource file is loaded with xrdb(1) so it may use the substitutions defined by that program such as CLIENTHOST for the client hostname in the login message, or C pre-processor #ifdef statements
       to produce different displays depending on color depth or other variables.

       Xdm can be compiled with support for the Xft(3) library for font rendering.   If this support is present, font faces are specified using the resources with names ending in ``face'' in the fontconfig
       face format described in the Font Names section of fonts.conf(5).  If not, then fonts are specified using the resources with names ending in ``font'' in the traditional X  Logical  Font  Description
       format described in the Font Names section of X(7).

       xlogin.Login.width, xlogin.Login.height, xlogin.Login.x, xlogin.Login.y
              The geometry of the Login widget is normally computed automatically.  If you wish to position it elsewhere, specify each of these resources.

       xlogin.Login.foreground
              The color used to display the input typed by the user.

       xlogin.Login.face
              The face used to display the input typed by the user when built with Xft support.  The default is ``Serif-18''.

       xlogin.Login.font
              The font used to display the input typed by the user when not built with Xft support.

       xlogin.Login.greeting
              A string which identifies this window.  The default is ``X Window System.''

       xlogin.Login.unsecureGreeting
              When X authorization is requested in the configuration file for this display and none is in use, this greeting replaces the standard greeting.  The default is ``This is an unsecure session''

       xlogin.Login.greetFace
              The face used to display the greeting when built with Xft support.  The default is ``Serif-24:italic''.

       xlogin.Login.greetFont
              The font used to display the greeting when not built with Xft support.

       xlogin.Login.greetColor
              The color used to display the greeting.

       xlogin.Login.namePrompt
              The  string  displayed  to prompt for a user name.  Xrdb strips trailing white space from resource values, so to add spaces at the end of the prompt (usually a nice thing), add spaces escaped
              with backslashes.  The default is ``Login:  ''

       xlogin.Login.passwdPrompt
              The string displayed to prompt for a password, when not using an authentication system such as PAM that provides its own prompts.  The default is ``Password:  ''

       xlogin.Login.promptFace
              The face used to display prompts when built with Xft support.  The default is ``Serif-18:bold''.

       xlogin.Login.promptFont
              The font used to display prompts when not built with Xft support.

       xlogin.Login.promptColor
              The color used to display prompts.

       xlogin.Login.changePasswdMessage
              A message which is displayed when the users password has expired.  The default is ``Password Change Required''

       xlogin.Login.fail
              A message which is displayed when the authentication fails, when not using an authentication system such as PAM that provides its own prompts.  The default is ``Login incorrect''

       xlogin.Login.failFace
              The face used to display the failure message when built with Xft support.  The default is ``Serif-18:bold''.

       xlogin.Login.failFont
              The font used to display the failure message when not built with Xft support.

       xlogin.Login.failColor
              The color used to display the failure message.

       xlogin.Login.failTimeout
              The number of seconds that the failure message is displayed.  The default is 10.

       xlogin.Login.logoFileName
              Name of an XPM format pixmap to display in the greeter window, if built with XPM support.   The default is no pixmap.

       xlogin.Login.logoPadding
              Number of pixels of space between the logo pixmap and other elements of the greeter window, if the pixmap is displayed.  The default is 5.

       xlogin.Login.useShape
              If set to ``true'', when built with XPM support, attempt to use the X Non-Rectangular Window Shape Extension to set the window shape.  The default is ``true''.

       xlogin.Login.hiColor, xlogin.Login.shdColor
              Raised appearance bezels may be drawn around the greeter frame and text input boxes by setting these resources.  hiColor is the highlight color, used on the top and left sides of  the  frame,
              and  the  bottom  and  right  sides  of text input areas.   shdColor is the shadow color, used on the bottom and right sides of the frame, and the top and left sides of text input areas.  The
              default for both is the foreground color, providing a flat appearance.

       xlogin.Login.frameWidth
              frameWidth is the width in pixels of the area around the greeter frame drawn in hiColor and shdColor.

       xlogin.Login.innerFramesWidth
              innerFramesWidth is the width in pixels of the area around text input areas drawn in hiColor and shdColor.

       xlogin.Login.sepWidth
              sepWidth is the width in pixels of the bezeled line between the greeting and input areas drawn in hiColor and shdColor.

       xlogin.Login.allowRootLogin
              If set to ``false'', don't allow root (and any other user with uid = 0) to log in directly.  The default is ``true''.  This setting is only checked by some of the authentication  backends  at
              this time.

       xlogin.Login.allowNullPasswd
              If  set  to  ``true'',  allow  an  otherwise  failing password match to succeed if the account does not require a password at all.  The default is ``false'', so only users that have passwords
              assigned can log in.

       xlogin.Login.echoPasswd
              If set to ``true'', a placeholder character (echoPasswdChar) will be shown for fields normally set to not echo, such as password input.  The default is ``false''.

       xlogin.Login.echoPasswdChar
              Character to display if echoPasswd is true.  The default is ``*''.  If set to an empty value, the cursor will advance for each character input, but no text will be drawn.

       xlogin.Login.translations
              This specifies the translations used for the login widget.  Refer to the X Toolkit documentation for a complete discussion on translations.  The default translation table is:

                   Ctrl<Key>H:    delete-previous-character() \n\
                   Ctrl<Key>D:    delete-character() \n\
                   Ctrl<Key>B:    move-backward-character() \n\
                   Ctrl<Key>F:    move-forward-character() \n\
                   Ctrl<Key>A:    move-to-begining() \n\
                   Ctrl<Key>E:    move-to-end() \n\
                   Ctrl<Key>K:    erase-to-end-of-line() \n\
                   Ctrl<Key>U:    erase-line() \n\
                   Ctrl<Key>X:    erase-line() \n\
                   Ctrl<Key>C:    restart-session() \n\
                   Ctrl<Key>\\:   abort-session() \n\
                   <Key>BackSpace:delete-previous-character() \n\
                   <Key>Delete:   delete-previous-character() \n\
                   <Key>Return:   finish-field() \n\
                   <Key>:         insert-char() \


       The actions which are supported by the widget are:

       delete-previous-character
              Erases the character before the cursor.

       delete-character
              Erases the character after the cursor.

       move-backward-character
              Moves the cursor backward.

       move-forward-character
              Moves the cursor forward.

       move-to-begining
              (Apologies about the spelling error.)  Moves the cursor to the beginning of the editable text.

       move-to-end
              Moves the cursor to the end of the editable text.

       erase-to-end-of-line
              Erases all text after the cursor.

       erase-line
              Erases the entire text.

       finish-field
              If the cursor is in the name field, proceeds to the password field; if the cursor is in the password field, checks the current name/password pair.  If the name/password  pair  is  valid,  xdm
              starts the session.  Otherwise the failure message is displayed and the user is prompted again.

       abort-session
              Terminates and restarts the server.

       abort-display
              Terminates  the server, disabling it.  This action is not accessible in the default configuration.  There are various reasons to stop xdm on a system console, such as when shutting the system
              down, when using xdmshell, to start another type of server, or to generally access the console.  Sending xdm a SIGHUP will restart the display.  See the section Controlling XDM.

       restart-session
              Resets the X server and starts a new session.  This can be used when the resources have been changed and you want to test them or when the screen has been overwritten with system messages.

       insert-char
              Inserts the character typed.

       set-session-argument
              Specifies a single word argument which is passed to the session at startup.  See the section Session Program.

       allow-all-access
              Disables access control in the server.  This can be used when the .Xauthority file cannot be created by xdm.  Be very careful using this; it might be better to disconnect the machine from the
              network before doing this.

       On some systems (OpenBSD) the user's shell must be listed in /etc/shells to allow login through xdm. The normal password and account expiration dates are enforced too.

STARTUP PROGRAM
       The  Xstartup  program is run as root when the user logs in.  It is typically a shell script.  Since it is run as root, Xstartup should be very careful about security.  This is the place to put com-
       mands which add entries to utmp or wtmp files, (the sessreg program may be useful here), mount users' home directories from file servers, or abort the session if logins are not allowed.

       In addition to any specified by DisplayManager.exportList, the following environment variables are passed:

            DISPLAY        the associated display name
            HOME           the initial working directory of the user
            LOGNAME        the user name
            USER           the user name
            PATH           the value of DisplayManager.DISPLAY.systemPath
            SHELL          the value of DisplayManager.DISPLAY.systemShell
            XAUTHORITY     may be set to an authority file
            WINDOWPATH     may be set to the "window path" leading to the X server


       No arguments are passed to the script.  Xdm waits until this script exits before starting the user session.  If the exit value of this script is non-zero, xdm discontinues  the  session  and  starts
       another authentication cycle.

       The sample Xstartup file shown here prevents login while the file /etc/nologin exists.  Thus this is not a complete example, but simply a demonstration of the available functionality.

       Here is a sample Xstartup script:

            #!/bin/sh
            #
            # Xstartup
            #
            # This program is run as root after the user is verified
            #
            if [ -f /etc/nologin ]; then
                 xmessage -file /etc/nologin -timeout 30 -center
                 exit 1
            fi
            sessreg -a -l $DISPLAY -x /etc/X11/xdm/Xservers $LOGNAME
            /etc/X11/xdm/GiveConsole
            exit 0

SESSION PROGRAM
       The Xsession program is the command which is run as the user's session.  It is run with the permissions of the authorized user.

       In addition to any specified by DisplayManager.exportList, the following environment variables are passed:

            DISPLAY        the associated display name
            HOME           the initial working directory of the user
            LOGNAME        the user name
            USER           the user name
            PATH           the value of DisplayManager.DISPLAY.userPath
            SHELL          the user's default shell (from getpwnam)
            XAUTHORITY     may be set to a non-standard authority file
            KRB5CCNAME     may be set to a Kerberos credentials cache name
            WINDOWPATH     may be set to the "window path" leading to the X server


       At  most  installations,  Xsession  should look in $HOME for a file .xsession, which contains commands that each user would like to use as a session.  Xsession should also implement a system default
       session if no user-specified session exists.

       An argument may be passed to this program from the authentication widget using the `set-session-argument' action.  This can be used to select different styles of session.  One good use of this  fea-
       ture is to allow the user to escape from the ordinary session when it fails.  This allows users to repair their own .xsession if it fails, without requiring administrative intervention.  The example
       following demonstrates this feature.

       This example recognizes the special ``failsafe'' mode, specified in the translations in the Xresources file, to provide an escape from the ordinary session.  It also requires that the .xsession file
       be executable so we don't have to guess what shell it wants to use.

            #!/bin/sh
            #
            # Xsession
            #
            # This is the program that is run as the client
            # for the display manager.

            case $# in
            1)
                 case $1 in
                 failsafe)
                      exec xterm -geometry 80x24-0-0
                      ;;
                 esac
            esac

            startup=$HOME/.xsession
            resources=$HOME/.Xresources

            if [ -f "$startup" ]; then
                 exec "$startup"
            else
                 if [ -f "$resources" ]; then
                      xrdb -load "$resources"
                 fi
                 twm &
                 xman -geometry +10-10 &
                 exec xterm -geometry 80x24+10+10 -ls
            fi


       The user's .xsession file might look something like this example.  Don't forget that the file must have execute permission.
            #! /bin/csh
            # no -f in the previous line so .cshrc gets run to set $PATH
            twm &
            xrdb -merge "$HOME/.Xresources"
            emacs -geometry +0+50 &
            xbiff -geometry -430+5 &
            xterm -geometry -0+50 -ls

RESET PROGRAM
       Symmetrical with Xstartup, the Xreset script is run after the user session has terminated.  Run as root, it should contain commands that undo the effects of commands in Xstartup, updating entries in
       utmp or wtmp files, or unmounting directories from file servers.  The environment variables that were passed to Xstartup are also passed to Xreset.

       A sample Xreset script:
            #!/bin/sh
            #
            # Xreset
            #
            # This program is run as root after the session ends
            #
            sessreg -d -l $DISPLAY -x /etc/X11/xdm/Xservers $LOGNAME
            /etc/X11/xdm/TakeConsole
            exit 0

CONTROLLING THE SERVER
       Xdm controls local servers using POSIX signals.  SIGHUP is expected to reset the server, closing all client connections and performing other cleanup duties.  SIGTERM is  expected  to  terminate  the
       server.  If these signals do not perform the expected actions, the resources DisplayManager.DISPLAY.resetSignal and DisplayManager.DISPLAY.termSignal can specify alternate signals.

       To  control  remote  terminals not using XDMCP, xdm searches the window hierarchy on the display and uses the protocol request KillClient in an attempt to clean up the terminal for the next session.
       This may not actually kill all of the clients, as only those which have created windows will be noticed.  XDMCP provides a more sure mechanism; when xdm closes its initial connection, the session is
       over and the terminal is required to close all other connections.

CONTROLLING XDM
       Xdm  responds to two signals: SIGHUP and SIGTERM.  When sent a SIGHUP, xdm rereads the configuration file, the access control file, and the servers file.  For the servers file, it notices if entries
       have been added or removed.  If a new entry has been added, xdm starts a session on the associated display.  Entries which have been removed are disabled immediately, meaning  that  any  session  in
       progress will be terminated without notice and no new session will be started.

       When sent a SIGTERM, xdm terminates all sessions in progress and exits.  This can be used when shutting down the system.

       Xdm  attempts  to  mark  its various sub-processes for ps(1) by editing the command line argument list in place.  Because xdm can't allocate additional space for this task, it is useful to start xdm
       with a reasonably long command line (using the full path name should be enough).  Each process which is servicing a display is marked -display.

ADDITIONAL LOCAL DISPLAYS
       To add an additional local display, add a line for it to the Xservers file.  (See the section Local Server Specification.)

       Examine the display-specific resources in xdm-config (e.g., DisplayManager._0.authorize) and consider which of them should be copied for the new display.  The default xdm-config has all  the  appro-
       priate lines for displays :0 and :1.

OTHER POSSIBILITIES
       You can use xdm to run a single session at a time, using the 4.3 init options or other suitable daemon by specifying the server on the command line:

            xdm -server “:0 SUN-3/60CG4 local /usr/bin/X :0”


       Or, you might have a file server and a collection of X terminals.  The configuration for this is identical to the sample above, except the Xservers file would look like

            extol:0 VISUAL-19 foreign
            exalt:0 NCD-19 foreign
            explode:0 NCR-TOWERVIEW3000 foreign


       This directs xdm to manage sessions on all three of these terminals.  See the section Controlling Xdm for a description of using signals to enable and disable these terminals in a manner reminiscent
       of init(8).

LIMITATIONS
       One thing that xdm isn't very good at doing is coexisting with other window systems.  To use multiple window systems on the same hardware, you'll probably be more interested in xinit.

FILES
       /etc/X11/xdm/xdm-config
                           the default configuration file

       $HOME/.Xauthority   user authorization file where xdm stores keys for clients to read

       /usr/lib64/X11/xdm/chooser
                           the default chooser

       /usr/bin/xrdb       the default resource database loader

       /usr/bin/X          the default server

       /usr/bin/xterm      the default session program and failsafe client

       /var/lib/xdm/A<display>-<suffix>
                           the default place for authorization files

       /tmp/K5C<display>   Kerberos credentials cache

SEE ALSO
       X(7), xinit(1), xauth(1), xrdb(1), Xsecurity(7), sessreg(1), Xserver(1), xdmshell(1), fonts.conf(5).
       X Display Manager Control Protocol
       IETF RFC 4291: IP Version 6 Addressing Architecture.

AUTHOR
       Keith Packard, MIT X Consortium



X Version 11                                                                                      xdm 1.1.11                                                                                           XDM(1)
