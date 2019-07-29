xscreensaver-demo(1)                                            XScreenSaver manual                                           xscreensaver-demo(1)

NAME
       xscreensaver-demo - interactively control the background xscreensaver daemon

SYNOPSIS
       xscreensaver-demo [-display host:display.screen] [-prefs] [--debug]

DESCRIPTION
       The  xscreensaver-demo  program  is  a graphical front-end for setting the parameters used by the background xscreensaver(1) daemon.  It is
       essentially two things: a tool for editing the ~/.xscreensaver file; and a tool for demoing the various graphics hacks  that  the  xscreen‐
       saver daemon will launch.

       The  main window consists of a menu bar and two tabbed pages.  The first page is for editing the list of demos, and the second is for edit‐
       ing various other parameters of the screensaver.

MENU COMMANDS
       All of these commands are on either the File or Help menus:

       Blank Screen Now
           Activates the background xscreensaver daemon, which will then run a demo at random.  This is  the  same  as  running  xscreensaver-com‐
           mand(1) with the -activate option.

       Lock Screen Now
           Just  like Blank Screen Now, except the screen will be locked as well (even if it is not configured to lock all the time.)  This is the
           same as running xscreensaver-command(1) with the -lock option.

       Kill Daemon
           If the xscreensaver daemon is running on this screen, kill it.  This is the same as  running  xscreensaver-command(1)  with  the  -exit
           option.

       Restart Daemon
           If the xscreensaver daemon is running on this screen, kill it.  Then launch it again.  This is the same as doing ``xscreensaver-command
           -exit'' followed by ``xscreensaver''.

           Note that it is not the same as doing ``xscreensaver-command -restart''.

       Exit
           Exits the xscreensaver-demo program (this program) without affecting the background xscreensaver daemon, if any.

       About...
           Displays the version number of this program, xscreensaver-demo.

       Documentation...
           Opens up a web browser looking at the XScreenSaver web page, where  you  can  find  online  copies  of  the  xscreensaver(1),  xscreen‐
           saver-demo(1), and xscreensaver-command(1) manuals.

DISPLAY MODES TAB
       This  page  contains  a list of the names of the various display modes, a preview area, and some fields that let you configure screen saver
       behavior.

       Mode
           This option menu controls the activation behavior of the screen saver.  The options are:

           Disable Screen Saver
               Don't ever blank the screen, and don't ever allow the monitor to power down.

           Blank Screen Only
               When blanking the screen, just go black: don't run any graphics.

           Only One Screen Saver
               When blanking the screen, only ever use one particular display mode (the one selected in the list.)

           Random Screen Saver
               When blanking the screen, select a random display mode from among those that are enabled and applicable.   If  there  are  multiple
               monitors connected, run a different display mode on each one.  This is the default.

           Random Same Saver
               This  is  just  like Random Screen Saver, except that the same randomly-chosen display mode will be run on all monitors, instead of
               different ones on each.

       Demo List
           Double-clicking in the list on the left will let you try out the indicated demo.  The screen will go black, and the program will run in
           full-screen  mode,  just  as  it would if the xscreensaver daemon had launched it.  Clicking the mouse again will stop the demo and un-
           blank the screen.

           Single-clicking in the list will run it in the small preview pane on the right.  (But beware: many of the display modes behave somewhat
           differently when running in full-screen mode, so the scaled-down view might not give an accurate impression.)

           When  Mode  is  set to Random Screen Saver, each name in the list has a checkbox next to it: this controls whether this display mode is
           enabled.  If it is unchecked, then that mode will not be chosen.  (Though you can still run it explicitly  by  double-clicking  on  its
           name.)

       Arrow Buttons
           Beneath the list are a pair of up and down arrows. Clicking on the down arrow will select the next item in the list, and then run it in
           full-screen mode, just as if you had double-clicked on it.  The up arrow goes the other way.  This is just a shortcut  for  trying  out
           all of the display modes in turn.

       Blank After
           After the user has been idle this long, the xscreensaver daemon will blank the screen.

       Cycle After
           After  the  screensaver  has been running for this long, the currently running graphics demo will be killed, and a new one started.  If
           this is 0, then the graphics demo will never be changed: only one demo will run until the screensaver is deactivated by user activity.

           The running saver will be restarted every this-many minutes even in Only One Screen Saver mode, since some savers tend to converge on a
           steady state.

       Lock Screen
           When this is checked, the screen will be locked when it activates.

       Lock Screen After
           This controls the length of the ``grace period'' between when the screensaver activates, and when the screen becomes locked.  For exam‐
           ple, if this is 5 minutes, and Blank After is 10 minutes, then after 10 minutes, the screen would blank.  If there was user activity at
           12  minutes,  no  password  would be required to un-blank the screen.  But, if there was user activity at 15 minutes or later (that is,
           Lock Screen After minutes after activation) then a password would be required.  The default is 0, meaning that if locking  is  enabled,
           then a password will be required as soon as the screen blanks.

       Preview
           This button, below the small preview window, runs the demo in full-screen mode so that you can try it out.  This is the same thing that
           happens when you double-click an element in the list.  Click the mouse to dismiss the full-screen preview.

       Settings
           This button will pop up a dialog where you can configure settings specific to the display mode selected in the list.

SETTINGS DIALOG
       When you click on the Settings button on the Display Modes tab, a configuration dialog will pop up that lets you customize settings of  the
       selected display mode.  Each display mode has its own custom configuration controls on the left side.

       On  the  right  side is a paragraph or two describing the display mode.  Below that is a Documentation button that will display the display
       mode's manual page, if it has one, in a new window (since each of the display modes is actually a separate program, they  each  have  their
       own manual.)

       The Advanced button reconfigures the dialog box so that you can edit the display mode's command line directly, instead of using the graphi‐
       cal controls.

ADVANCED TAB
       This tab lets you change various settings used by the xscreensaver daemon itself, as well as some global options shared by all of the  dis‐
       play modes.

       Image Manipulation

       Some  of  the graphics hacks manipulate images.  These settings control where those source images come from.  (All of these options work by
       invoking the xscreensaver-getimage(1) program, which is what actually does the work.)

           Grab Desktop Images
               If this option is selected, then they are allowed to manipulate the desktop image, that is, a display mode might draw a picture  of
               your  desktop  melting,  or being distorted in some way.  The security-paranoid might want to disable this option, because if it is
               set, it means that the windows on your desktop will occasionally be visible while your screen is locked.  Others will not  be  able
               to do anything, but they may be able to see whatever you left on your screen.

           Grab Video Frames
               If  your system has a video capture card, selecting this option will allow the image-manipulating modes to capture a frame of video
               to operate on.

           Choose Random Image
               If this option is set, then the image-manipulating modes will select a random image file to operate on, from the specified  source.
               That  source may be a local directory, which will be recursively searched for images.  Or, it may be the URL of an RSS or Atom feed
               (e.g., a Flickr gallery), in which case a random image from that feed will be selected instead.  The contents of the feed  will  be
               cached locally and refreshed periodically as needed.

           If  more  than  one  of the above image-related options are selected, then one will be chosen at random.  If none of them are selected,
           then an image of video colorbars will be used instead.

       Text Manipulation

       Some of the display modes display and manipulate text.  The following options control how that text is generated.  (These  parameters  con‐
       trol the behavior of the xscreensaver-text(1) program, which is what actually does the work.)

           Host Name and Time
               If this checkbox is selected, then the text used by the screen savers will be the local host name, OS version, date, time, and sys‐
               tem load.

           Text
               If this checkbox is selected, then the literal text typed in the field to its  right  will  be  used.   If  it  contains  %  escape
               sequences, they will be expanded as per strftime(2).

           Text File
               If this checkbox is selected, then the contents of the corresponding file will be displayed.

           Program
               If this checkbox is selected, then the given program will be run, repeatedly, and its output will be displayed.

           URL If  this checkbox is selected, then the given HTTP URL will be downloaded and displayed repeatedly.  If the document contains HTML,
               RSS, or Atom, it will be converted to plain-text first.

               Note: this re-downloads the document every time the screen saver runs out of text, so it will probably be hitting that  web  server
               multiple times a minute.  Be careful that the owner of that server doesn't consider that to be abusive.

       Power Management Settings

       These settings control whether, and when, your monitor powers down.

           Power Management Enabled
               Whether the monitor should be powered down after a period of inactivity.

               If  this option is grayed out, it means your X server does not support the XDPMS extension, and so control over the monitor's power
               state is not available.

               If you're using a laptop, don't be surprised if this has no effect: many laptops have monitor power-saving behavior built in  at  a
               very low level that is invisible to Unix and X.  On such systems, you can typically only adjust the power-saving delays by changing
               settings in the BIOS in some hardware-specific way.

           Standby After
               If Power Management Enabled is selected, the monitor will go black after this much idle time.  (Graphics demos will  stop  running,
               also.)

           Suspend After
               If  Power  Management  Enabled  is  selected,  the monitor will go into power-saving mode after this much idle time.  This duration
               should be greater than or equal to Standby.

           Off After
               If Power Management Enabled is selected, the monitor will fully power down after this much idle  time.   This  duration  should  be
               greater than or equal to Suspend.

           Quick Power-off in Blank Only Mode
               If  the  display mode is set to Blank Screen Only and this is checked, then the monitor will be powered off immediately upon blank‐
               ing, regardless of the other power-management settings.  In this way, the power management idle-timers can be completely  disabled,
               but the screen will be powered off when black.  (This might be preferable on laptops.)

       Fading and Colormaps

       These options control how the screen fades to or from black when a screen saver begins or ends.

           Fade To Black When Blanking
               If  selected,  then when the screensaver activates, the current contents of the screen will fade to black instead of simply winking
               out.  (Note: this doesn't work with all X servers.)  A fade will also be done when switching graphics hacks (when the  Cycle  After
               expires.)

           Unfade From Black When Unblanking
               The  complement to Fade Colormap: if selected, then when the screensaver deactivates, the original contents of the screen will fade
               in from black instead of appearing immediately.  This is only done if Fade Colormap is also selected.

           Fade Duration
               When fading or unfading are selected, this controls how long the fade will take.

           Install Colormap
               On 8-bit screens, whether to install a private colormap while the screensaver is active, so that the graphics hacks can get as many
               colors as possible.  This does nothing if you are running in 16-bit or better.

       There  are  more  settings  than  these  available, but these are the most commonly used ones; see the manual for xscreensaver(1) for other
       parameters that can be set by editing the ~/.xscreensaver file, or the X resource database.

COMMAND-LINE OPTIONS
       xscreensaver-demo accepts the following command line options.

       -display host:display.screen
               The X display to use.  The xscreensaver-demo program will open its window on that display, and also control the xscreensaver daemon
               that is managing that same display.

       -prefs  Start up with the Advanced tab selected by default instead of the Display Modes tab.

       -debug  Causes lots of diagnostics to be printed on stderr.

       It  is  important  that  the xscreensaver and xscreensaver-demo processes be running on the same machine, or at least, on two machines that
       share a file system.  When xscreensaver-demo writes a new version of the ~/.xscreensaver file, it's important  that  the  xscreensaver  see
       that same file.  If the two processes are seeing different ~/.xscreensaver files, things will malfunction.

ENVIRONMENT
       DISPLAY to get the default host and display number.

       PATH    to  find  the  sub-programs  to  run.  However, note that the sub-programs are actually launched by the xscreensaver daemon, not by
               xscreensaver-demo itself.  So, what matters is what $PATH that the xscreensaver program sees.

       HOME    for the directory in which to read and write the .xscreensaver file.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

       HTTP_PROXY or http_proxy
               to get the default HTTP proxy host and port.

UPGRADES
       The latest version of xscreensaver, an online version of this manual, and a FAQ can always be found at https://www.jwz.org/xscreensaver/

SEE ALSO
       X(1), xscreensaver(1), xscreensaver-command(1), xscreensaver-getimage(1), xscreensaver-text(1)

COPYRIGHT
       Copyright © 1992-2015 by Jamie Zawinski.  Permission to use, copy, modify, distribute, and sell this software and its documentation for any
       purpose  is  hereby  granted without fee, provided that the above copyright notice appear in all copies and that both that copyright notice
       and this permission notice appear in supporting documentation.  No representations are made about the suitability of this software for  any
       purpose.  It is provided "as is" without express or implied warranty.

AUTHOR
       Jamie Zawinski <jwz@jwz.org>, 13-aug-92.

       Please let me know if you find any bugs or make any improvements.

X Version 11                                                    5.40 (12-Aug-2018)                                            xscreensaver-demo(1)
