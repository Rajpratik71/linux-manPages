xscreensaver(1)                                                 XScreenSaver manual                                                xscreensaver(1)

NAME
       xscreensaver - extensible screen saver and screen locking framework

SYNOPSIS
       xscreensaver [-display host:display.screen] [-verbose] [-no-splash] [-no-capture-stderr] [-log filename]

DESCRIPTION
       The  xscreensaver  program  waits until the keyboard and mouse have been idle for a period, and then runs a graphics demo chosen at random.
       It turns off as soon as there is any mouse or keyboard activity.

       This program can lock your terminal in order to prevent others from using it, though its default mode of operation  is  merely  to  display
       pretty pictures on your screen when it is not in use.

       It also provides configuration and control of your monitor's power-saving features.

GETTING STARTED
       For the impatient, try this:
       xscreensaver &
       xscreensaver-demo
       The  xscreensaver-demo(1)  program  pops  up a dialog box that lets you configure the screen saver, and experiment with the various display
       modes.

       Note that xscreensaver has a client-server model: the xscreensaver program is a daemon that runs in the background; it is controlled by the
       foreground xscreensaver-demo(1) and xscreensaver-command(1) programs.

CONFIGURATION
       The  easiest way to configure xscreensaver is to simply run the xscreensaver-demo(1) program, and change the settings through the GUI.  The
       rest of this manual page describes lower level ways of changing settings.

       I'll repeat that because it's important:

           The easy way to configure xscreensaver is to run the xscreensaver-demo(1) program.  You  shouldn't  need  to  know  any  of  the  stuff
           described in this manual unless you are trying to do something tricky, like customize xscreensaver for site-wide use or something.

       Options to xscreensaver are stored in one of two places: in a .xscreensaver file in your home directory; or in the X resource database.  If
       the .xscreensaver file exists, it overrides any settings in the resource database.

       The syntax of the .xscreensaver file is similar to that of the .Xdefaults file; for example, to set the timeout parameter in the  .xscreen‐
       saver file, you would write the following:
       timeout: 5
       whereas, in the .Xdefaults file, you would write
       xscreensaver.timeout: 5
       If  you  change  a setting in the .xscreensaver file while xscreensaver is already running, it will notice this, and reload the file.  (The
       file will be reloaded the next time the screen saver needs to take some action, such as blanking or unblanking the screen, or picking a new
       graphics mode.)

       If  you  change  a  setting in your X resource database, or if you want xscreensaver to notice your changes immediately instead of the next
       time it wakes up, then you will need to reload your .Xdefaults file, and then tell the running xscreensaver process to restart itself, like
       so:
       xrdb < ~/.Xdefaults
       xscreensaver-command -restart
       If  you  want to set the system-wide defaults, then make your edits to the xscreensaver app-defaults file, which should have been installed
       when xscreensaver itself was installed.  The app-defaults file will usually be named /usr/lib/X11/app-defaults/XScreenSaver, but  different
       systems might keep it in a different place (for example, /usr/openwin/lib/app-defaults/XScreenSaver on Solaris).

       When  settings  are changed in the Preferences dialog box (see above) the current settings will be written to the .xscreensaver file.  (The
       .Xdefaults file and the app-defaults file will never be written by xscreensaver itself.)

COMMAND-LINE OPTIONS
       xscreensaver also accepts a few command-line options, mostly for use when debugging: for normal operation, you should configure things  via
       the ~/.xscreensaver file.

       -display host:display.screen
               The X display to use.  For displays with multiple screens, XScreenSaver will manage all screens on the display simultaniously.

       -verbose
               Same as setting the verbose resource to true: print diagnostics on stderr and on the xscreensaver window.

       -no-capture-stderr
               Do not redirect the stdout and stderr streams to the xscreensaver window itself.  If xscreensaver is crashing, you might need to do
               this in order to see the error message.

       -log filename
               This is exactly the same as redirecting stdout and stderr to the given file (for append).  This is useful when reporting bugs.

HOW IT WORKS
       When it is time to activate the screensaver, a full-screen black window is created on each screen of the display.  Each window  is  created
       in such a way that, to any subsequently-created programs, it will appear to be a "virtual root" window.  Because of this, any program which
       draws on the root window (and which understands virtual roots) can be used as a screensaver.  The various graphics demos are, in fact, just
       standalone programs that know how to draw on the provided window.

       When  the user becomes active again, the screensaver windows are unmapped, and the running subprocesses are killed by sending them SIGTERM.
       This is also how the subprocesses are killed when the screensaver decides that it's time to run a different demo: the old one is killed and
       a new one is launched.

       You can control a running screensaver process by using the xscreensaver-command(1) program (which see).

POWER MANAGEMENT
       Modern  X  servers contain support to power down the monitor after an idle period.  If the monitor has powered down, then xscreensaver will
       notice this (after a few minutes), and will not waste CPU by drawing graphics demos on a black screen.  An attempt will  also  be  made  to
       explicitly power the monitor back up as soon as user activity is detected.

       The  ~/.xscreensaver  file  controls the configuration of your display's power management settings: if you have used xset(1) to change your
       power management settings, then xscreensaver will override those changes with the values specified in ~/.xscreensaver (or with its built-in
       defaults, if there is no ~/.xscreensaver file yet).

       To  change  your  power management settings, run xscreensaver-demo(1) and change the various timeouts through the user interface.  Alterna‐
       tively, you can edit the ~/.xscreensaver file directly.

       If the power management section is grayed out in the xscreensaver-demo(1) window,  then that means that your X server does not support  the
       XDPMS extension, and so control over the monitor's power state is not available.

       If  you're  using a laptop, don't be surprised if changing the DPMS settings has no effect: many laptops have monitor power-saving behavior
       built in at a very low level that is invisible to Unix and X.  On such systems, you can typically adjust the power-saving  delays  only  by
       changing settings in the BIOS in some hardware-specific way.

       If  DPMS  seems not to be working with XFree86, make sure the "DPMS" option is set in your /etc/X11/XF86Config file.  See the XF86Config(5)
       manual for details.

USING GNOME OR UNITY
       For the better part of a decade, GNOME shipped xscreensaver as-is, and everything just worked out of  the  box.   In  2005,  however,  they
       decided to re-invent the wheel and ship their own replacement for the xscreensaver daemon called "gnome-screensaver", rather than improving
       xscreensaver and contributing their changes back.  As a result, the "gnome-screensaver" program is insecure, bug-ridden, and  missing  many
       features of xscreensaver.  You shouldn't use it.

       To replace gnome-screensaver with xscreensaver:

           1: Fully uninstall the gnome-screensaver package.
              sudo apt-get remove gnome-screensaver
              or possibly
              sudo dpkg -P gnome-screensaver

           2: Launch xscreensaver at login.
              Select "Startup Applications" from the menu (or manually launch "gnome-session-properties") and add "xscreensaver".

              Do this as your normal user account, not as root.  (This should go without saying, because you should never, ever, ever be logged in
              to the graphical desktop as user "root".)

           3: Make GNOME's "Lock Screen" use xscreensaver.
              sudo ln -sf /usr/bin/xscreensaver-command \
                          /usr/bin/gnome-screensaver-command
              That doesn't work under Unity, though.  Apparently it has its own built-in screen locker which is not gnome-screensaver, and  cannot
              be  removed,  and yet still manages to be bug-addled and insecure.  Keep reinventing that wheel, guys!  (If you have figured out how
              to replace Unity's locking "feature" with xscreensaver, let me know.)

           4: Turn off Unity's built-in blanking.
              Open "System Settings / Brightness & Lock";
              Un-check "Start Automatically";
              Set "Turn screen off when inactive for" to "Never".

USING KDE
       Like GNOME, KDE also decided to invent their own screen saver framework from scratch instead of simply using xscreensaver.  To replace  the
       KDE screen saver with xscreensaver, do the following:

           1: Turn off KDE's screen saver.
              Open the "Control Center" and select the "Appearance & Themes / Screensaver" page.  Un-check "Start Automatically".

              Or possibly: Open "System Settings" and select "Screen Locking".  Un-check "Lock Screen Automatically".

           2: Find your Autostart directory.
              Open  the  "System  Administration  /  Paths" page, and see what your "Autostart path" is set to: it will probably be something like
              ~/.kde/Autostart/ or ~/.config/autostart/

              If that doesn't work, then try this:

              Open "System Settings / Startup/Shutdown / Autostart", and then add "/usr/bin/xscreensaver".

              If you are lucky, that will create a xscreensaver.desktop" file for you in ~/.config/autostart/ or ~/.kde/Autostart/.

           3: Make xscreensaver be an Autostart program.
              If it does not already exist, create a file in your autostart directory called xscreensaver.desktop that contains the following  six
              lines:
              [Desktop Entry]
              Exec=xscreensaver
              Name=XScreenSaver
              Type=Application
              StartupNotify=false
              X-KDE-StartupNotify=false

           4: Make the various "lock session" buttons call xscreensaver.
              The  file  you want to replace next has moved around over the years. It might be called /usr/libexec/kde4/kscreenlocker, or it might
              be  called  "kdesktop_lock"  or  "krunner_lock"  or  "kscreenlocker_greet",  and  it  might  be  in  /usr/lib/kde4/libexec/  or   in
              /usr/kde/3.5/bin/ or even in /usr/bin/, depending on the distro and phase of the moon.  Replace the contents of that file with these
              two lines:
              #!/bin/sh
              xscreensaver-command -lock
              Make sure the file is executable (chmod a+x).

       Now use xscreensaver normally, controlling it via the usual xscreensaver-demo(1) and xscreensaver-command(1) mechanisms.

USING SYSTEMD
       If the above didn't do it, and your system has systemd(1), then give this a try:

       1: Create a service.
          Create the file ~/.config/systemd/user/xscreensaver.service containing:
          [Unit]
          Description=XScreenSaver
          [Service]
          ExecStart=/usr/bin/xscreensaver
          [Install]
          WantedBy=default.target

       2. Enable it.
          systemctl --user enable xscreensaver
          Then restart X11.

USING UPSTART
       If it's still not working, but on your distro, that newfangled systemd(1) nonsense has already fallen out of favor?  Then maybe  this  will
       work: launch the "Startup Applications" applet, click "Add", enter these lines, then restart X11:
       Name: XScreenSaver
       Command: xscreensaver
       Comment: xscreensaver

USING GDM
       You  can  run  xscreensaver from your gdm(1) session, so that the screensaver will run even when nobody is logged in on the console.  To do
       this, run gdmconfig(1).

       On the General page set the Local Greeter to Standard Greeter.

       On the Background page, type the command "xscreensaver -nosplash" into the Background Program field.  That will cause gdm to  run  xscreen‐
       saver  while nobody is logged in, and kill it as soon as someone does log in.  (The user will then be responsible for starting xscreensaver
       on their own, if they want.)

       If that doesn't work, you can edit the config file directly. Edit /etc/X11/gdm/gdm.conf to include:
       Greeter=/usr/bin/gdmlogin
       BackgroundProgram=xscreensaver -nosplash
       RunBackgroundProgramAlways=true
       In this situation, the xscreensaver process will probably be running as user gdm instead of root.  You can configure the settings for  this
       nobody-logged-in state (timeouts, DPMS, etc.) by editing the ~gdm/.xscreensaver file.

       It  is  safe  to run xscreensaver as root (as xdm or gdm may do).  If run as root, xscreensaver changes its effective user and group ids to
       something safe (like "nobody") before connecting to the X server or launching user-specified programs.

       An unfortunate side effect of this (important) security precaution is that it may conflict with cookie-based authentication.

       If you get "connection refused" errors when running xscreensaver from gdm, then this probably means that you have xauth(1)  or  some  other
       security  mechanism  turned  on.   For  information  on the X server's access control mechanisms, see the man pages for X(1), Xsecurity(1),
       xauth(1), and xhost(1).

BUGS
       Bugs?  There are no bugs.  Ok, well, maybe.  If you find one, please let me know.  https://www.jwz.org/xscreensaver/bugs.html explains  how
       to construct the most useful bug reports.

       Locking and root logins
           In  order  for  it to be safe for xscreensaver to be launched by xdm, certain precautions had to be taken, among them that xscreensaver
           never runs as root.  In particular, if it is launched as root (as xdm is likely to do), xscreensaver will disavow its  privileges,  and
           switch itself to a safe user id (such as nobody).

           An implication of this is that if you log in as root on the console, xscreensaver will refuse to lock the screen (because it can't tell
           the difference between root being logged in on the console, and a normal user being logged in on the console  but  xscreensaver  having
           been launched by the xdm(1) Xsetup file).

           The  solution  to this is simple: you shouldn't be logging in on the console as root in the first place!  (What, are you crazy or some‐
           thing?)

           Proper Unix hygiene dictates that you should log in as yourself, and su(1) to root as necessary.  People who spend their day logged  in
           as root are just begging for disaster.

       XAUTH and XDM
           For xscreensaver to work when launched by xdm(1) or gdm(1), programs running on the local machine as user "nobody" must be able to con‐
           nect to the X server.  This means that if you want to run xscreensaver on the console while nobody is logged in, you may need  to  dis‐
           able cookie-based access control (and allow all users who can log in to the local machine to connect to the display).

           You should be sure that this is an acceptable thing to do in your environment before doing it.  See the "Using GDM" section, above, for
           more details.

       Passwords
           If you get an error message at startup like "couldn't get password of user" then this probably means that you're on a system  in  which
           the  getpwent(3)  library  routine  can  only be effectively used by root.  If this is the case, then xscreensaver must be installed as
           setuid to root in order for locking to work.  Care has been taken to make this a safe thing to do.

           It also may mean that your system uses shadow passwords instead of the standard getpwent(3) interface; in that case, you  may  need  to
           change some options with configure and recompile.

           If  you  change your password after xscreensaver has been launched, it will continue using your old password to unlock the screen until
           xscreensaver is restarted.  On some systems, it may accept both your old and new passwords.  So, after you change your password, you'll
           have to do
           xscreensaver-command -restart
           to make xscreensaver notice.

       PAM Passwords
           If  your system uses PAM (Pluggable Authentication Modules), then in order for xscreensaver to use PAM properly, PAM must be told about
           xscreensaver.  The xscreensaver installation process should update the PAM data (on Linux, by creating the file /etc/pam.d/xscreensaver
           for you, and on Solaris, by telling you what lines to add to the /etc/pam.conf file).

           If  the PAM configuration files do not know about xscreensaver, then you might be in a situation where xscreensaver will refuse to ever
           unlock the screen.

           This is a design flaw in PAM (there is no way for a client to tell the difference between PAM responding "I have never  heard  of  your
           module", and responding, "you typed the wrong password").  As far as I can tell, there is no way for xscreensaver to automatically work
           around this, or detect the problem in advance, so if you have PAM, make sure it is configured correctly!

       Machine Load
           Although this program "nices" the subprocesses that it starts, graphics-intensive subprograms can still overload the machine by causing
           the  X  server  process  itself  (which  is  not  "niced") to consume many cycles.  Care has been taken in all the modules shipped with
           xscreensaver to sleep periodically, and not run full tilt, so as not to cause appreciable load.

           However, if you are running the OpenGL-based screen savers on a machine that does not have a video card with 3D acceleration, they will
           make your machine slow, despite nice(1).

           Your  options are: don't use the OpenGL display modes; or, collect the spare change hidden under the cushions of your couch, and use it
           to buy a video card manufactured after 1998.  (It doesn't even need to be fast 3D hardware: the problem will be fixed if there  is  any
           3D hardware at all.)

       Magic Backdoor Keystrokes
           The  XFree86  X  server  and the Linux kernel both trap certain magic keystrokes before X11 client programs ever see them.  If you care
           about keeping your screen locked, this is a big problem.

           Ctrl+Alt+Backspace
              This keystroke kills the X server, and on some systems, leaves you at a text console.  If the user launched X11 manually, that  text
              console  will  still  be  logged  in.   To disable this keystroke globally and permanently, you need to set the DontZap flag in your
              xorg.conf or XF86Config or XF86Config-4 file, depending which is in use on your system.  See XF86Config(5) for details.

           Ctrl-Alt-F1, Ctrl-Alt-F2, etc.
              These keystrokes will switch to a different virtual console, while leaving the console that X11 is running on locked.  If you left a
              shell  logged  in on another virtual console, it is unprotected.  So don't leave yourself logged in on other consoles.  You can dis‐
              able VT switching globally and permanently by setting DontVTSwitch in your xorg.conf, but that might make your system harder to use,
              since VT switching is an actual useful feature.

              There is no way to disable VT switching only when the screen is locked.  It's all or nothing.

           Ctrl-Alt-KP_Multiply
              This  keystroke  kills  any  X11 app that holds a lock, so typing this will kill xscreensaver and unlock the screen.  This so-called
              "feature" showed up in the X server in 2008, and as of 2011, some vendors are shipping it turned on by default.  How nice.  You  can
              disable it by turning off AllowClosedownGrabs in xorg.conf.

           Alt-SysRq-F
              This  is  the  Linux kernel "OOM-killer" keystroke.  It shoots down random long-running programs of its choosing, and so might might
              target and kill xscreensaver, and there's no way for xscreensaver to protect itself from that.  You can disable it globally with:
              echo 176 > /proc/sys/kernel/sysrq
       There's little that I can do to make the screen locker be secure so long as the kernel and X11  developers  are  actively  working  against
       security  like this.  The strength of the lock on your front door doesn't matter much so long as someone else in the house insists on leav‐
       ing a key under the welcome mat.

       Dangerous Backdoor Server Extensions
           Many distros enable by default several X11 server extensions that can be used to bypass grabs, and thus snoop on you while you're  typ‐
           ing  your  password.   These  extensions are nominally for debugging and automation, but they are also security-circumventing keystroke
           loggers.  If your server is configured to load the RECORD, XTRAP or XTEST extensions, you absolutely should disable those, 100% of  the
           time.  Look for them in xorg.conf or whatever it is called.

X RESOURCES
       These  are  the  X  resources  use by the xscreensaver program.  You probably won't need to change these manually (that's what the xscreen‐
       saver-demo(1) program is for).

       timeout (class Time)
               The screensaver will activate (blank the screen) after the keyboard and mouse have been idle for this  many  minutes.   Default  10
               minutes.

       cycle (class Time)
               After  the screensaver has been running for this many minutes, the currently running graphics-hack sub-process will be killed (with
               SIGTERM), and a new one started.  If this is 0, then the graphics hack will never be changed: only one  demo  will  run  until  the
               screensaver is deactivated by user activity.  Default 10 minutes.

               The  running  saver  will  be  restarted  every cycle minutes even when mode is one, since some savers tend to converge on a steady
               state.

       lock (class Boolean)
               Enable locking: before the screensaver will turn off, it will require you to type the password of the logged-in user  (really,  the
               person  who  ran xscreensaver), or the root password.  (Note: this doesn't work if the screensaver is launched by xdm(1) because it
               can't know the user-id of the logged-in user.  See the "Using XDM(1)" section, below.

       lockTimeout (class Time)
               If locking is enabled, this controls the length of the "grace period" between when the screensaver activates, and when  the  screen
               becomes  locked.   For example, if this is 5, and -timeout is 10, then after 10 minutes, the screen would blank.  If there was user
               activity at 12 minutes, no password would be required to un-blank the screen.  But, if there was user activity  at  15  minutes  or
               later (that is, -lock-timeout minutes after activation) then a password would be required.  The default is 0, meaning that if lock‐
               ing is enabled, then a password will be required as soon as the screen blanks.

       passwdTimeout (class Time)
               If the screen is locked, then this is how many seconds the password dialog box should be  left  on  the  screen  before  giving  up
               (default  30  seconds).   This should not be too large: the X server is grabbed for the duration that the password dialog box is up
               (for security purposes) and leaving the server grabbed for too long can cause problems.

       dpmsEnabled (class Boolean)
               Whether power management is enabled.

       dpmsStandby (class Time)
               If power management is enabled, how long until the monitor goes solid black.

       dpmsSuspend (class Time)
               If power management is enabled, how long until the monitor goes into power-saving mode.

       dpmsOff (class Time)
               If power management is enabled, how long until the monitor powers down completely.  Note that these settings will  have  no  effect
               unless  both  the X server and the display hardware support power management; not all do.  See the Power Management section, below,
               for more information.

       dpmsQuickOff (class Boolean)
               If mode is blank and this is true, then the screen will be powered down immediately upon blanking, regardless of  other  power-man‐
               agement settings.

       visualID (class VisualID)
               This is an historical artifacts left over from when 8-bit displays were still common.  You should probably ignore this.

               Specify which X visual to use by default.  (Note carefully that this resource is called visualID, not merely visual; if you set the
               visual resource instead, things will malfunction in obscure ways for obscure reasons.)

               Legal values for the VisualID resource are:

               default Use the screen's default visual (the visual of the root window).  This is the default.

               best    Use the visual which supports the most colors.  Note, however, that the visual with the most colors might  be  a  TrueColor
                       visual,  which  does  not support colormap animation.  Some programs have more interesting behavior when run on PseudoColor
                       visuals than on TrueColor.

               mono    Use a monochrome visual, if there is one.

               gray    Use a grayscale or staticgray visual, if there is one and it has more than one plane (that is, it's not monochrome).

               color   Use the best of the color visuals, if there are any.

               GL      Use the visual that is best for OpenGL programs.  (OpenGL programs have somewhat different requirements than other  X  pro‐
                       grams.)

               class   where class is one of StaticGray, StaticColor, TrueColor, GrayScale, PseudoColor, or DirectColor.  Selects the deepest vis‐
                       ual of the given class.

               number  where number (decimal or hex) is interpreted as a visual id number, as reported by the xdpyinfo(1) program; in this way you
                       can  have  finer  control  over exactly which visual gets used, for example, to select a shallower one than would otherwise
                       have been chosen.

               Note that this option specifies only the default visual that will be used: the visual used may be overridden on  a  program-by-pro‐
               gram basis.  See the description of the programs resource, below.

       installColormap (class Boolean)
               On  PseudoColor (8-bit) displays, install a private colormap while the screensaver is active, so that the graphics hacks can get as
               many colors as possible.  This is the default.  (This only applies when the screen's default  visual  is  being  used,  since  non-
               default visuals get their own colormaps automatically.)  This can also be overridden on a per-hack basis: see the discussion of the
               default-n name in the section about the programs resource.

               This does nothing if you have a TrueColor (16-bit or deeper) display.  (Which, in this century, you do.)

       verbose (class Boolean)
               Whether to print diagnostics.  Default false.

       timestamp (class Boolean)
               Whether to print the time of day along with any other diagnostic messages.  Default true.

       splash (class Boolean)
               Whether to display a splash screen at startup.  Default true.

       splashDuration (class Time)
               How long the splash screen should remain visible; default 5 seconds.

       helpURL (class URL)
               The splash screen has a Help button on it.  When you press it, it will display the web page indicated here in your web browser.

       loadURL (class LoadURL)
               This is the shell command used to load a URL into your web browser.  The default setting will load it into Mozilla/Netscape  if  it
               is already running, otherwise, will launch a new browser looking at the helpURL.

       demoCommand (class DemoCommand)
               This is the shell command run when the Demo button on the splash window is pressed.  It defaults to xscreensaver-demo(1).

       prefsCommand (class PrefsCommand)
               This is the shell command run when the Prefs button on the splash window is pressed.  It defaults to xscreensaver-demo -prefs.

       newLoginCommand (class NewLoginCommand)
               If set, this is the shell command that is run when the "New Login" button is pressed on the unlock dialog box, in order to create a
               new desktop session without logging out the user who has locked the screen.  Typically this will  be  some  variant  of  gdmflexis‐
               erver(1), kdmctl(1), lxdm(1) or dm-tool(1).

       nice (class Nice)
               The sub-processes created by xscreensaver will be "niced" to this level, so that they are given lower priority than other processes
               on the system, and don't increase the load unnecessarily.  The default is 10.  (Higher numbers mean lower priority; see nice(1) for
               details.)

       fade (class Boolean)
               If this is true, then when the screensaver activates, the current contents of the screen will fade to black instead of simply wink‐
               ing out.  This only works on certain systems.  A fade will also be done  when  switching  graphics  hacks  (when  the  cycle  timer
               expires).  Default: true.

       unfade (class Boolean)
               If  this  is  true,  then  when the screensaver deactivates, the original contents of the screen will fade in from black instead of
               appearing immediately.  This only works on certain systems, and if fade is true as well.  Default false.

       fadeSeconds (class Time)
               If fade is true, this is how long the fade will be in seconds (default 3 seconds).

       fadeTicks (class Integer)
               If fade is true, this is how many times a second the colormap will be changed to effect a  fade.   Higher  numbers  yield  smoother
               fades, but may make the fades take longer than the specified fadeSeconds if your server isn't fast enough to keep up.  Default 20.

       captureStderr (class Boolean)
               Whether  xscreensaver  should  redirect  its  stdout and stderr streams to the window itself.  Since its nature is to take over the
               screen, you would not normally see error messages generated by xscreensaver or the sub-programs it runs; this resource  will  cause
               the  output of all relevant programs to be drawn on the screensaver window itself, as well as being written to the controlling ter‐
               minal of the screensaver driver process.  Default true.

       ignoreUninstalledPrograms (class Boolean)
               There may be programs in the list that are not installed on the system, yet are marked as "enabled".  If this preference  is  true,
               then  such  programs will simply be ignored.  If false, then a warning will be printed if an attempt is made to run the nonexistent
               program.  Also, the xscreensaver-demo(1) program will suppress the non-existent programs from the list if this is  true.   Default:
               false.

       authWarningSlack (class Integer)
               If  all failed unlock attempts (incorrect password entered) were made within this period of time, the usual dialog that warns about
               such attempts after a successful login will be suppressed. The assumption is that incorrect passwords entered within a few  seconds
               of a correct one are user error, rather than hostile action.  Default 20 seconds.

       GetViewPortIsFullOfLies (class Boolean)
               Set  this  to  true  if the xscreensaver window doesn't cover the whole screen.  This works around a longstanding XFree86 bug #421.
               See the xscreensaver FAQ for details.

       font (class Font)
               The font used for the stdout/stderr text, if captureStderr is true.  Default *-medium-r-*-140-*-m-* (a 14 point fixed-width font).

       mode (class Mode)
               Controls the behavior of xscreensaver.  Legal values are:

               random  When blanking the screen, select a random display mode from among those that are  enabled  and  applicable.   This  is  the
                       default.

               random-same
                       Like  random,  but if there are multiple screens, each screen will run the same random display mode, instead of each screen
                       running a different one.

               one     When blanking the screen, only ever use one particular display mode (the one indicated by the selected setting).

               blank   When blanking the screen, just go black: don't run any graphics hacks.

               off     Don't ever blank the screen, and don't ever allow the monitor to power down.

       selected (class Integer)
               When mode is set to one, this is the one, indicated by its index in the programs list.  You're crazy if you count them and set this
               number by hand: let xscreensaver-demo(1) do it for you!

       programs (class Programs)
               The graphics hacks which xscreensaver runs when the user is idle.  The value of this resource is a multi-line string, one sh-syntax
               command per line.  Each line must contain exactly one command: no semicolons, no ampersands.

               When the screensaver starts up, one of these is selected (according to the mode setting), and run.  After the cycle period expires,
               it is killed, and another is selected and run.

               If  a  line  begins  with a dash (-) then that particular program is disabled: it won't be selected at random (though you can still
               select it explicitly using the xscreensaver-demo(1) program).

               If all programs are disabled, then the screen will just be made blank, as when mode is set to blank.

               To disable a program, you must mark it as disabled with a dash instead of removing it from the list.  This is because  the  system-
               wide  (app-defaults) and per-user (.xscreensaver) settings are merged together, and if a user just deletes an entry from their pro‐
               grams list, but that entry still exists in the system-wide list, then it will come back.  However, if the user  disables  it,  then
               their setting takes precedence.

               If  the display has multiple screens, then a different program will be run for each screen.  (All screens are blanked and unblanked
               simultaneously.)

               Note that you must escape the newlines; here is an example of how you might set this in your ~/.xscreensaver file:

               programs:  \
                      qix -root                          \n\
                      ico -r -faces -sleep 1 -obj ico    \n\
                      xdaliclock -builtin2 -root         \n\
                      xv -root -rmode 5 image.gif -quit  \n
               Make sure your $PATH environment variable is set up correctly before xscreensaver is launched, or it won't be able to find the pro‐
               grams listed in the programs resource.

               To  use a program as a screensaver, two things are required: that that program draw on the root window (or be able to be configured
               to draw on the root window); and that that program understand "virtual root" windows, as used by virtual window  managers  such  as
               tvtwm(1).  (Generally, this is accomplished by just including the "vroot.h" header file in the program's source.)

               Visuals:

               Because  xscreensaver  was  created back when dinosaurs roamed the earth, it still contains support for some things you've probably
               never seen, such as 1-bit monochrome monitors, grayscale monitors, and  monitors  capable  of  displaying  only  8-bit  colormapped
               images.

               If  there are some programs that you want to run only when using a color display, and others that you want to run only when using a
               monochrome display, you can specify that like this:
                      mono:   mono-program  -root        \n\
                      color:  color-program -root        \n\
               More generally, you can specify the kind of visual that should be used for the window on which the program will  be  drawing.   For
               example,  if  one  program  works best if it has a colormap, but another works best if it has a 24-bit visual, both can be accommo‐
               dated:
                      PseudoColor: cmap-program  -root   \n\
                      TrueColor:   24bit-program -root   \n\
               In addition to the symbolic visual names described above (in the discussion of the visualID resource) one other visual name is sup‐
               ported in the programs list:

                default-n
                    This  is like default, but also requests the use of the default colormap, instead of a private colormap.  (That is, it behaves
                    as if the -no-install command-line option was specified, but only for this particular hack.)  This is  provided  because  some
                    third-party  programs  that draw on the root window (notably: xv(1), and xearth(1)) make assumptions about the visual and col‐
                    ormap of the root window: assumptions which xscreensaver can violate.

               If you specify a particular visual for a program, and that visual does not exist on the screen, then that program will not be  cho‐
               sen to run.  This means that on displays with multiple screens of different depths, you can arrange for appropriate hacks to be run
               on each.  For example, if one screen is color and the other is monochrome, hacks that look good in mono can  be  run  on  one,  and
               hacks that only look good in color will show up on the other.

       You shouldn't ever need to change the following resources:

       pointerPollTime (class Time)
               When  server  extensions  are  not in use, this controls how frequently xscreensaver checks to see if the mouse position or buttons
               have changed.  Default 5 seconds.

       pointerHysteresis (class Integer)
               If the mouse moves less than this-many pixels in a second, ignore it (do not consider that to be "activity").  This is so that  the
               screen doesn't un-blank (or fail to blank) just because you bumped the desk.  Default: 10 pixels.

       windowCreationTimeout (class Time)
               When  server  extensions  are  not  in  use, this controls the delay between when windows are created and when xscreensaver selects
               events on them.  Default 30 seconds.

       initialDelay (class Time)
               When server extensions are not in use, xscreensaver will wait this many seconds before selecting events on existing windows,  under
               the  assumption  that  xscreensaver is started during your login procedure, and the window state may be in flux.  Default 0.  (This
               used to default to 30, but that was back in the days when slow machines and X terminals were more common...)

       procInterrupts (class Boolean)
               This resource controls whether the /proc/interrupts file should be consulted to decide whether the  user  is  idle.   This  is  the
               default if xscreensaver has been compiled on a system which supports this mechanism (i.e., Linux systems).

               The  benefit  to doing this is that xscreensaver can note that the user is active even when the X console is not the active one: if
               the user is typing in another virtual console, xscreensaver will notice that and will fail to activate.   For  example,  if  you're
               playing Quake in VGA-mode, xscreensaver won't wake up in the middle of your game and start competing for CPU.

               The  drawback  to  doing  this is that perhaps you really do want idleness on the X console to cause the X display to lock, even if
               there is activity on other virtual consoles.  If you want that, then set this option to False.  (Or just lock the X  console  manu‐
               ally.)

               The default value for this resource is True, on systems where it works.

       overlayStderr (class Boolean)
               If  captureStderr  is True, and your server supports "overlay" visuals, then the text will be written into one of the higher layers
               instead of into the same layer as the running screenhack.  Set this to False to disable that (though you shouldn't need to).

       overlayTextForeground (class Foreground)
               The foreground color used for the stdout/stderr text, if captureStderr is true.  Default: Yellow.

       overlayTextBackground (class Background)
               The background color used for the stdout/stderr text, if captureStderr is true.  Default: Black.

       bourneShell (class BourneShell)
               The pathname of the shell that xscreensaver uses to start subprocesses.  This must be whatever your local variant of /bin/sh is: in
               particular, it must not be csh.

ENVIRONMENT
       DISPLAY to get the default host and display number, and to inform the sub-programs of the screen on which to draw.

       XSCREENSAVER_WINDOW
               Passed  to  sub-programs  to  indicate the ID of the window on which they should draw.  This is necessary on Xinerama/RANDR systems
               where multiple physical monitors share a single X11 "Screen".

       PATH    to find the sub-programs to run.

       HOME    for the directory in which to read the .xscreensaver file.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

UPGRADES
       The latest version of xscreensaver, an online version of this manual, and a FAQ can always be found at https://www.jwz.org/xscreensaver/

SEE ALSO
       X(1), Xsecurity(1), xauth(1), xdm(1), gdm(1), xhost(1), xscreensaver-demo(1), xscreensaver-command(1), xscreensaver-gl-helper(1),  xscreen‐
       saver-getimage(1), xscreensaver-text(1).

COPYRIGHT
       Copyright © 1991-2018 by Jamie Zawinski.  Permission to use, copy, modify, distribute, and sell this software and its documentation for any
       purpose is hereby granted without fee, provided that the above copyright notice appear in all copies and that both  that  copyright  notice
       and  this permission notice appear in supporting documentation.  No representations are made about the suitability of this software for any
       purpose.  It is provided "as is" without express or implied warranty.

AUTHOR
       Jamie Zawinski <jwz@jwz.org>.  Written in late 1991; version 1.0 posted to comp.sources.x on 17-Aug-1992.

       Please let me know if you find any bugs or make any improvements.

       And a huge thank you to the hundreds of people who have contributed, in large ways and small, to the xscreensaver collection over the  past
       two decades!

X Version 11                                                    5.40 (12-Aug-2018)                                                 xscreensaver(1)
