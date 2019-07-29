blackbox(1)                                                   General Commands Manual                                                  blackbox(1)

NAME
       blackbox - a window manager for X11

SYNOPSIS
       blackbox -help | -version
       blackbox [ -rc rcfile ] [ -display display ]

DESCRIPTION
       Blackbox is a window manager for the Open Group's X Window System, Version 11 Release 6 and above.  Its design is meant to be visually min‐
       imalist and fast.

       Blackbox is similar to the NeXT interface and Windowmaker. Applications are launched using a menu which is accessed by  right  clicking  on
       the root window. Workspaces, a system of virtual desktops are controlled via a menu which is accessed by middle clicking on the root window
       and by using the toolbar. Individual windows can be controlled by buttons on the title bar and more options are available by right clicking
       on the title bar.

       Blackbox is able to generate beautiful window decorations on the fly at high speed. Themes, called styles in Blackbox terminology, are very
       flexible but the use of pixmaps has been purposefully avoided to eliminate dependencies and excess memory usage.

       Blackbox itself does not directly handle key bindings like most other window managers. This task is handled by a  separate  utility  called
       bbkeys.  Although Blackbox has a built-in workspace (paging) system, bbpager, which provides a graphical pager, is popular with many users.
       bbkeys, bbpager and several other bbtools can be found by going to
       http://bbtools.thelinuxcommunity.org/
       The slit is an edge of the screen which can hold specially designed programs called dock apps (from Windowmaker). In addition, the  popular
       program  gkrellm  will also run in the slit.  There is a huge selection of dockapps available and they run the gamut from must-have gadgets
       to utterly useless (but cute and/or funny) eye candy.
       http://www.bensinclair.com/dockapp/
       http://dockapps.org/

OPTIONS
       Blackbox supports the following command line options:

       -help  Display command line options, compiled-in features, and exit.

       -version
              Display version and exit.

       -rc rcfile
              Use an alternate resource file.

       -display display
              Start Blackbox on the specified display, and set the DISPLAY environment variable to this value for programs started by Blackbox.

STARTING AND EXITING BLACKBOX
       The most common method for starting Blackbox is to place the the command "blackbox" (no quotes) at the end of your ~/.xinitrc  or  ~/.xses‐
       sion  file.   The  advantage of putting Blackbox at the end of the file is that the X Server will shutdown when you exit Blackbox. Blackbox
       can also be started from the command line of a terminal program like xterm in an X session that does not already have a window manager run‐
       ning.

       On  startup, Blackbox will look for ~/.blackboxrc and use the resource session.menuFile to determine where to get the menu for the session.
       If this file is not found Blackbox will use /etc/X11/blackbox/blackbox-menu as the menu file. If that fails as well  Blackbox  will  use  a
       default menu that contains commands to start an xterm as well as restart and exit the window manager.  The other resources available in the
       ~/.blackboxrc file are discussed later in this manual under the heading RESOURCE FILE.

       On exit, Blackbox writes its current configuration to ~/.blackboxrc.
       NOTE:
       If ~/.blackboxrc is modified during a Blackbox
       session, Blackbox must be restarted with the
       "restart" command on the main menu or the changes
       will be lost on exit. Restart causes Blackbox to
       re-read ~/.blackboxrc and apply the changes immediately.
       Blackbox can be exited by selecting "exit" on the main menu (discussed shortly), killing it gently from a terminal or by the X Window  Sys‐
       tem shutdown hot key combo Ctrl+Alt+BackSpace.

USING BLACKBOX
       A three button mouse has the following functions when clicking on the root window:

       Button Two  (Middle Button)
              Open workspace menu

       Button Three  (Right Button)
              Open main menu

       Note that Button One (Left Button) is not used.

       Main Menu
              The  default  installation assumes you have a number of common X Window System programs in their typical locations. The default menu
              is defined by a plain text file named 'menu'. It is heavily commented and covers a number of details of menu file syntax. This  file
              can  also  be edited graphically by using the extension program bbconf which makes menu creation very easy. Menu file syntax is dis‐
              cussed later in this manual.
              Caveat:
              Menus can run arbitrary command lines, but
              if you wish to use a complex command line
              it is best to place it in a shell script.
              Remember to put #!/bin/sh on the first
              line and chmod 755 on the file to make it
              executable.

       Workspace Menu
              This menu gives the user control of the workspace system. The user can create a new workspace, remove the last workspace or go to an
              application  via either the icon menu or a workspace entry.  Workspaces are listed by name. Clicking on the workspace name will take
              you to that workspace with focus on the program under the mouse. If there are programs already running in the workspace,  they  will
              appear in a pop-out menu.  Clicking on the application name will jump to the workspace and focus that application. If a middle click
              is used the window will be brought to the current workspace.

              Blackbox uses an external program, bbpager, to provide a traditional, graphical paging  interface  to  the  workspace  system.  Many
              Blackbox users run another extension program - bbkeys - to provide keyboard shortcuts for workspace control.
              Caveat:
              To name a workspace the user must right
              click on the toolbar, select "Edit current
              workspace name," type the workspace name,
              And_Press_Enter to finish.
              Workspaces can also be named in the .blackboxrc file as described in RESOURCES.

       The Slit
              The  Slit  provides a user positionable window for running utility programs called "dockapps". To learn more about dockapps refer to
              the web sites mentioned in the Description. Dockapps automatically run in the slit in most cases, but may require a special  command
              switch.  Often, -w is used for "withdrawn" into the slit.

              gkrellm  is  a  very useful and modern dockapp that gives the user near real time information on machine performance. Other dockapps
              include clocks, notepads, pagers, key grabbers, fishbowls, fire places and many, many others.

              Only mouse button three is captured by the Blackbox slit. This menu allows the user to change the position of the slit, and sets the
              state of Always on top, and Auto hide. These all do what the user expects.

              Caveat:
              When starting Dockapps from an external script
              a race condition can take place where the shell
              rapidly forks all of the dockapps, which then
              take varied and random times to draw themselves
              for the first time. To get the dockapps to start
              in a given order, follow each dockapp with
              sleep 2; This ensures that each dockapp is placed
              in the correct order by the slit.
              i.e.
              #!/bin/sh
              speyes -w & sleep 2
              gkrellm -w & sleep 2

       The Toolbar
              The  toolbar  provides an alternate method for cycling through multiple workspaces and applications. The left side of the toolbar is
              the workspace control, the center is the application control, and the right side is a clock. The format of the  clock  can  be  con‐
              trolled as described under RESOURCES.

              Mouse  button  3 raises a menu that allows configuration of the toolbar. It can be positioned either at the top or the bottom of the
              screen and can be set to auto hide and/or to always be on top.

              Caveat:
              The toolbar is a permanent fixture. It
              can only be removed by modifying the source and
              rebuilding, which is beyond the scope of this
              document. Setting the toolbar to auto hide is
              the next best thing.

       Window Decorations
              Window decorations include handles at the bottom of each window, a title bar, and three control buttons.  The handles at the  bottom
              of  the  window are divided into three sections.  The two corner sections are resizing handles The center section is a window moving
              handle. The bottom center handle and the title bar respond to a number of mouse clicks and key + mouse click combinations. The three
              buttons in the title bar, left to right, are iconify, maximize, and close. The resize button has special behavior detailed below.

       Button One  (Left Button)
              Click  and  drag  on  titlebar to move or resize from bottom corners.  Click the iconify button to move the window to the icon list.
              Click the maximize button to fully maximize the window.  Click the close button to close the window and  application.   Double-Click
              the title bar to shade the window.

       Alt + Button One
              Click anywhere on client window and drag to move the window.

       Button Two  (Middle Button)
              Click the titlebar to lower the window.  Click the maximize button to maximize the window vertically.

       Button Three  (Right Button)
              Click  on  title  bar  or bottom center handle pulls down a control menu.  Click the maximize button to maximize the window horizon‐
              tally.

       Alt + Button Three
              Click anywhere on client window and drag to resize the window.

       The control menu contains:

       Send To ...
              Button One  (Left Button)
              Click to send this window to another workspace.
              Button Two  (Middle Button)
              Click to send this window to another workspace, change
              to that workspace and keep the application focused.
              as well.

       Shade  This is the same action as Double-Click with Button One.

       Iconify
              Hide the window.  It can be accessed with the icon menu.

       Maximize
              Toggle window maximization.

       Raise  Bring window to the front above the other windows and
              focus it.

       Lower  Drop the window below the other ones.

       Stick  Stick this window to the glass on the inside of
              the monitor so it does not hide when you change
              workspaces.

       Kill Client
              This kills the client program with -SIGKILL (-9)
              Only use this as a last resort.

       Close  Send a close signal to the client application.

STYLES
       Styles are a collection of colors, fonts, and textures that control the appearance of Blackbox. These characteristics are recorded in style
       files.  The default system style files are located in /usr/share/blackbox/styles.  The menu system will identify the style by its filename,
       and styles can be sorted into different directories at the user's discretion.

       There are over 700 styles available for Blackbox. The official distribution point for Blackbox styles is

       http://blackbox.themes.org/

       All themes should install by simply downloading them to ~/.blackbox/ then unzip it, and de-tar it.

       On open Unixes this will be:

       tar zxvf stylename.tar.gz

       On commercial Unixes this will be something like:

       gunzip stylename.tar.gz && tar xvf stylename.tar

       Check your system manuals for specifics or check with your network administrator.

       An entry should appear in the styles menu immediately.
       Security Warning
       Style files can execute shell scripts and other
       executables. It would is wise to check the
       rootCommand in the style file and make sure that
       it is benign.

       Things that go wrong.

       1. The theme is pre Blackbox 0.51.
              Style file syntax changed with version 0.51

       2. The style tarball was formatted incorrectly.
              Some styles use the directories ~/.blackbox/Backgrounds and ~/.blackbox/Styles

              This can fixed by adding a [stylemenu] (~/.blackbox/Styles) to your menu file. To be a complete purist, hack the style file with the
              correct paths and move the files into the correct directories

       3. The rootCommmand line is broken.
              The  rootCommand  line  in the style file will run an arbitrary executable. It is important that this executable be set to bsetbg to
              maintain portability between systems with different graphics software. In addition bsetbg can execute a shell script and do it in  a
              portable fashion as well.

       The documented method for creating styles is as follows:

       1. Create or acquire the background for the style if
              it will not be using bsetroot to draw a patterned background for the root window.

              NOTE:
              Blackbox runs on a wide variety
              of systems ranging from PCs with 640x480 256 color
              displays to ultra high speed workstations with 25"
              screens and extreme resolution. For best results a
              style graphic should be at least 1024x768.

       2. Create a style file.
              The best way to do this is to make a copy of a similar style and then edit it.

              The style file is a list of X resources and other external variables. Manipulating these variables allows users to completely change
              the appearance of Blackbox. The user can also change the root window image by using the wrapper program bsetbg.

              bsetbg knows how to use a number of programs to set the root window image. This makes styles much more portable since various  plat‐
              forms have different graphics software. For more info see bsetbg (1).

       3. Background images should be placed in
              ~/.blackbox/backgrounds The style file should be placed in ~/.blackbox/styles any other information about the style should be placed
              in ~/.blackbox/about/STYLE_NAME/.  This would include README files, licenses, etc.

              Previous versions of Blackbox put backgrounds and styles in different directories. The directories listed above are the  only  offi‐
              cially supported directories.  However you may put them whereever you like as long as you update your menu file so it knows where to
              find your styles.

       4. To create a consistent experience and to ensure
              portability between all systems it is important to use the following format to create your style archive.

              first create a new directory named after your style NEW_STYLE

              In this directory create the directories
              backgrounds
              styles
              about/NEW_STYLE
              Next put everything for the theme in these locations. Finally type

              tar cvzf NEW_STYLE.tar.gz *

              If you are using commercial Unix you may need to use gzip and tar separately.

              Now when a user downloads a new style file she knows that all she has to do is put the tarball in her Blackbox directory, unzip->un-
              tar it and then click on it in her style menu.

       Style File Syntax and Details

              By  far  the  easiest  way  to create a new style is to use bbconf. bbconf allows complete control of every facet of style files and
              gives immediate updates of the current style as changes are made.

              The style file format is not currently documented in a man page.  There is a readme document included with the Blackbox source  con‐
              taining this information.

MENU FILE
       The  default  menu  file is installed in /etc/X11/blackbox/blackbox-menu.  This menu can be customized as a system default menu or the user
       can create a personal menu.

       To create a personal menu copy the default menu to a file in your home directory.  Then, open ~/.blackboxrc and add or modify the  resource
       session.menuFile:  ~/.blackbox/menu

       Next,  edit  the  new menu file. This can be done during a Blackbox session and the menu will automatically be updated when the code checks
       for file changes.

       The default menu included with Blackbox has numerous comments describing the use of all menu commands. Menu commands  follow  this  general
       form:

       [command]  (label|filename) {shell command|filename}

       Blackbox menu commands:

          #    string...
              Hash  (or pound or number sign) is used as the comment delimiter. It can be used as a full line comment or as an end of line comment
              after a valid command statement.

       [begin]  (string)
              This tag is used only once at the beginning of the menu file. "string" is the name or description used at the top of the menu.

       [end]
              This tag is used at the end of the menu file and at the end of a submenu block.

       [exec]  (label string) {command string}
              This is a very flexible tag that allows the user to run an arbitrary shell command including shell scripts.  If  a  command  is  too
              large to type on the command line by hand it is best to put it in a shell script.

       [nop]  (label string)
              This tag is used to put a divider in the menu.  label string is an optional description.

       [submenu]  (submenu name) {title string}
              This  creates  a  sub-menu  with  the  name  submenu name and if given, the string title string will be the title of the pop up menu
              itself.

       [include]  (filename)
              This command inserts filename into the menu file at the point at which it is called.  filename should not contain a begin end  pair.
              This feature can be used to include the system menu or include a piece of menu that is updated by a separate program.

       [stylesdir]  (description) (path)
              Causes Blackbox to search path for style files. Blackbox lists styles in the menu by their file name as returned by the OS.

       [stylesmenu]  (description) {path}
              This  command  creates  a submenu with the name description with the contents of path.  By creating a submenu and then populating it
              with stylesmenu entries the user can create an organized library of styles.

       [workspaces]  (description)
              Inserts a link into the main menu to the workspace menu. If used, description is an optional description.

       [config]  (label)
              This command causes Blackbox to insert a menu that gives the user control over focus models, dithering and other system preferences.

       [reconfig]  (label) {shell command}
              The reconfig command causes Blackbox to reread its configuration files. This does not include ~/.blackboxrc  which  is  only  reread
              when  Blackbox is restarted. If shell command is included Blackbox will run this command or shell script before rereading the files.
              This can be used to switch between multiple configurations

       [restart]  (label) {shell command}
              This command is actually an exit command that defaults to restarting Blackbox. If provided shell command is run instead of Blackbox.
              This  can be used to change versions of Blackbox. Not that you would ever want to do this but, it could also be used to start a dif‐
              ferent window manager.

       [exit]  (label)
              Shuts down Blackbox. If Blackbox is the last command in your ~/.xinitrc file, this action will also shutdown X.
              Here is a working example of a menu file:
              [begin] (MenuName)
                 [exec] (xterm) {xterm -ls -bg black -fg green}
                 [submenu] (X utilities)
                    [exec] (xcalc) {xcalc}
                 [end]
                 [submenu] (styles)
                    [stylesmenu] (built-in styles) {/usr/share/blackbox/styles}
                    [stylesmenu] (custom styles) {~/.blackbox/styles}
                 [end]
                 [workspaces] (workspace list)
                 [config] (configure)
                 [reconfig] (config play desktop) {play-config-blackbox}
                 [reconfig] (config work desktop) {work-config-blackbox}
                 [restart] (start Blackbox beta 7) {blackbox-beta7}
                 [restart] (start Blackbox cvs) {blackbox-cvs}
                 [restart] (restart)
                 [exit] (exit)
              [end]

RESOURCE FILE
       $HOME/.blackboxrc These options are stored in the ~/.blackboxrc file.  They control various features of Blackbox and most can be  set  from
       menus. Some of these can only be set by editing .blackboxrc directly.

       NOTE:  Blackbox  only reads this file during start up. To make changes take effect during a Blackbox session the user must choose "restart"
       on the main menu.  If you do not do so, your changes will be lost when Blackbox exits.

       Some resources are named with a <num> after screen. This should be replaced with the number of the screen that  is  being  configured.  The
       default is 0 (zero).

       Menu Configurable  (Slit Menu):
          Right click (button 3) on the slit border.

       session.screen<num>.slit.placement  SEE BELOW
          Determines the position of the slit.  Certain combinations of slit.placement with slit.direction are not terribly useful, i.e. TopCenter
          with Vertical direction puts the slit through the middle of your screen. Certainly some will think that is cool if only  to  be  differ‐
          ent...
          Default is CenterLeft.
          [  TopLeft  |   TopCenter  |   TopRight  |
           CenterLeft |              | CenterRight |
           BottomLeft | BottomCenter | BottomRight ]

       session.screen<num>.slit.direction  [Horizontal|Vertical]
          Determines the direction of the slit.
          Default is Vertical.

       session.screen<num>.slit.onTop  [True|False]
          Determines whether the slit is always visible over windows or if the focused window can hide the slit.
          Default is True.

       session.screen<num>.slit.autoHide  [True|False]
          Determines  whether  the slit hides when not in use.  The session.autoRaiseDelay time determines how long you must hover to get the slit
          to raise and how long it stays visible after mouse out.
          Default is False.

       Menu Configurable  (Main Menu):

       session.screen<num>.focusModel  SEE BELOW
          Sloppy focus (mouse focus) is the conventional X Window behavior and can be modified with AutoRaise or Click-Raise.

          AutoRaise causes the window to automatically raise after session.autoRaiseDelay milliseconds.

          ClickRaise causes the window to raise if you click anywhere inside the client area of the window.

          Sloppy focus alone requires a click on the titlebar, border or lower grip to raise the window.

          ClickToFocus requires a click on a Blackbox decoration or in the client area to focus and raise the window.  ClickToFocus cannot be mod‐
          ified by AutoRaise or ClickRaise.
          Default is SloppyFocus
          [SloppyFocus [[AutoRaise & ClickRaise]  |
                        [AutoRaise | ClickRaise]] |
          ClickToFocus]

       session.screen<num>.windowPlacement  SEE BELOW
          RowSmartPlacement  tries  to fit new windows in empty space by making rows.  Direction depends on session.screen<num>.rowPlacementDirec‐
          tion

          ColSmartPlacement tries to fit new windows in empty space by making columns Direction depends on  session.screen<num>.colPlacementDirec‐
          tion

          CascadePlacement places the new window down and to the right of the most recently created window.
          Default is RowSmartPlacement.
          [RowSmartPlacement | ColSmartPlacement | CascadePlacement]

       session.screen<num>.rowPlacementDirection  [LeftToRight|RightToLeft]
          Determines placement direction for new windows.
          Default is LeftToRight.

       session.screen<num>.colPlacementDirection  [TopToBottom|BottomToTop]
          Determines placement direction for new windows.
          Default is TopToBottom.

       session.imageDither  [True|False]
          This  setting  is  only  used when running in low color modes. Image Dithering helps one to show an image properly even if there are not
          enough colors available in the system.
          Default is False.

       session.opaqueMove  [True|False]
          Determines whether the window's contents are drawn as it is moved.  When False the behavior is to draw a box representing the window.
          Default is False.

       session.screen<num>.fullMaximization  [True|False]
          Determines if the maximize button will cause an application to maximize over the slit and toolbar.
          Default is False.

       session.screen<num>.focusNewWindows  [True|False]
          Determines if newly created windows are given focus after they initially draw themselves.
          Default is False.

       session.screen<num>.focusLastWindow  [True|False]
          This is actually "when moving between workspaces, remember which window has focus when leaving a workspace and return the focus to  that
          window when I return to that workspace."
          Default is False.

       session.screen<num>.disableBindingsWithScrollLock  [True|False]
          When this resource is enabled, turning on scroll lock keeps Blackbox from grabbing the Alt and Ctrl keys that it normally uses for mouse
          controls. This feature allows users of drawing and modeling programs which use keystrokes to modify mouse actions to maintain their san‐
          ity.   *NOTE*  this  has  _no_ affect on bbkeys.  If you need bbkeys to also behave this way it has a similar option in its config file.
          Refer to the bbkeys manpage for details.
          Default is False.

       Menu Configurable  (Workspace Menu):
          Middle click (button 2) on the root window (AKA Desktop) to reach this menu

       session.screen<num>.workspaces  [integer]
          Workspaces may be created or deleted by middle clicking on the desktop and choosing "New Workspace" or "Remove Last". After  creating  a
          workspace, right click on the toolbar to name it.
          Default is 1

       Menu Configurable  (Toolbar Menu):

       session.screen<num>.workspaceNames  [string[, string...]]
          Workspaces  are  named  in  the order specified in this resource. Names should be delimited by commas. If there are more workspaces than
          explicit names, un-named workspaces will be named as "Workspace [number]".
          Default is
          Workspace 1.

       session.screen<num>.toolbar.placement  SEE BELOW
          Set toolbar screen position.
          Default is BottomCenter
          [  TopLeft  |   TopCenter  |   TopRight  |
           BottomLeft | BottomCenter | BottomRight ]

       session.screen<num>.toolbar.onTop  [True|False]
          Determines whether the toolbar is always visible over windows or if the focused window can hide the toolbar.
          Default is True.

       session.screen<num>.toolbar.autoHide  [True|False]
          Determines whether the toolbar hides when not in use.  The session.autoRaiseDelay time determines how long you must  hover  to  get  the
          toolbar to raise, and how long it stays visible after mouse out.
          Default is False.

       Configurable in  ~/.Blackboxrc only:

       session.screen<num>.toolbar.widthPercent  [1-100]
          Percentage  of screen used by the toolbar.  A number from 1-100 that sets the width of the toolbar.  0 (zero) does not cause the toolbar
          to disappear, instead the toolbar is set to the default. If you want to lose the toolbar there are patches that can remove it.
          Default is 66.

       session.screen<num>.strftimeFormat  [string]
          A C language date format string, any combination of specifiers can be used. The default is %I:%M %p which generates a 12 hour clock with
          minutes and an am/pm indicator appropriate to the locale.
          24 hours and minutes    %H:%M
          12 hours and minute     %I:%M %p
          month/day/year          %m/%d/%y
          day/month/year          %d/%m/%y
          Default is hours:minutes am/pm
          See
          strftime 3
          for more details.

       session.screen<num>.dateFormat  [American|European]
          NOTE: Only used if the strftime() function is not available on  your system.
          Default is American, (mon/day/year).

       session.screen<num>.clockFormat  [12/24]
          NOTE: Only used if the strftime() function is not available on your system.
          Default is 12-hour format.

       session.screen<num>.edgeSnapThreshold  [integer]
          When  set  to  0  this  turns off edge snap. When set to one or greater edge snap will cause a window that is being moved to snap to the
          nearest screen edge, the slit, or or the toolbar. Windows will not snap to each other.  The value represents a number in pixels which is
          the distance between the window and a screen edge which is required before the window is snapped to the screen edge.  If you prefer this
          functionality values between 6 - 10 work nicely.
          Default value is 0

       session.menuFile  [filepath]
          Full path to the current menu file.
          Default is /etc/X11/blackbox/blackbox-menu

       session.colorsPerChannel  [2-6]
          The number of colors taken from the X server for use on pseudo color displays. This value must be set to 4 for 8 bit displays.
          Default is 4.

       session.doubleClickInterval  [integer]
          This is the maximum time that Blackbox will wait after one click to catch a double click. This only applies to Blackbox actions, such as
          double click shading, not to the X server in general.
          Default is 250 milliseconds.

       session.autoRaiseDelay  [integer]
          This is the time in milliseconds used for auto raise and auto hide behaviors. More than about 1000 ms is likely useless.
          Default is 250 millisecond.

       session.cacheLife  [integer]
          Determines the maximum number of minutes that the X server will cache unused decorations.
          Default is 5 minutes

       session.cacheMax  [integer]
          Determines  how many kilobytes that Blackbox may take from the X server for storing decorations. Increasing this number may enhance your
          performance if you have plenty of memory and use lots of different windows.
          Default is 200 Kilobytes

ENVIRONMENT
       HOME   Blackbox uses $HOME to find its .blackboxrc rc file and its .blackbox directory for menus and style directories.

       DISPLAY
              If a display is not specified on the command line, Blackbox will use the value of $DISPLAY.

FILES
       blackbox
              Application binary

       ~/.blackboxrc
              User's startup and resource file.

       /etc/X11/blackbox/blackbox-menu
              Default system wide menu

WEB SITES
       General info website:
            http://blackboxwm.sourceforge.net/

       Development website:
            http://sourceforge.net/projects/blackboxwm/

BUGS
       If you think you have found a bug, please help by going to the development website and select "Bugs" in the upper menu. Check the bug  list
       to see if your problem has already been reported. If it has please read the summary and add any information that you believe would help. If
       your bug has not been submitted select "Submit New" and fill out the form.

AUTHORS AND HISTORY
       Sean Shaleh Perry  <shaleh@debian.org> is the current maintainer and is actively working together with Brad to keep Blackbox up-to-date and
       stable as a rock.

       Brad  Hughes   <bhughes@trolltech.com> originally designed and coded Blackbox in 1997 with the intent of creating a memory efficient window
       manager with no dependencies on external libraries.  Brad's original idea has become a popular alternative to other window managers.

       Jeff Raven  <jraven@psu.edu> then picked up the torch for the 0.61.x series after Brad took a full time job at TrollTech.

       This manual page was written by: R.B. Brig Young  <secretsaregood@yahoo.com> he is solely responsible for errors or  omissions.   Comments,
       corrections, and suggestions are welcomed.

SEE ALSO
       bsetbg(1), bsetroot(1),
       bbkeys(1), bbconf(1)

0.65.0                                                          September 18, 2002                                                     blackbox(1)
