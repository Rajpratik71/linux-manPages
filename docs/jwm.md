jwm(1)                                                        General Commands Manual                                                       jwm(1)

NAME
       JWM - Joe's Window Manager

SYNOPSIS
       jwm [options]

DESCRIPTION
       JWM is a window manager for the X11 Window System.

OPTIONS
       -display display
              This option specifies the display to use; see X(1).

       -exit
              Exit JWM by sending _JWM_EXIT to the root window.

       -f file
              Specify an alternate configuration file to use.

       -h
              Display a help message and exit.

       -p
              Parse the configuration file and exit.  It is a good idea to use this after making modifications to the configuration file to ensure
              there are no errors.

       -restart
              Restart JWM by sending _JWM_RESTART to the root window.

       -reload
              Reload menus by sending _JWM_RELOAD to the root window.

       -v
              Display version information and exit.

FILES
       /etc/system.jwmrc
              The default JWM configuration file.

       ~/.jwmrc
              Default local configuration file. Copy the default configuration file to this location to make  user-specific  changes.   See  also,
              option -f.

CONFIGURATION
       OVERVIEW
              Configuration  of JWM is done by editing ".jwmrc" (or the configuration file specified with the -f option).  This file is XML making
              it easy to edit, either by hand or programmatically. The example.jwmrc gives an example configuration file.  Before restarting  JWM,
              it  is  a  good idea to run "jwm -p" to make sure the configuration file is free of errors.  Otherwise you may end up without a root
              menu.

       ROOT MENU
              The root menu in JWM is the primary way of starting programs.  It also provides a way to restart or exit the  window  manager.   The
              outer most tag is RootMenu. The following attributes are supported:

              onroot list
                     Determine  which buttons on the root window activate the menu.  This is a list of integers specifying buttons. The default is
                     "123".  Note that multiple root menus may be specified by using different buttons for different menus. The range of  possible
                     values  is 0 to 9 inclusive as well as a to z inclusive, providing for up to 36 menus.  Note that only the numeric values map
                     to mouse buttons.

              height int
                     Height of each menu item in pixels. 0 indicates the largest menu item will determine the height. The default is 0.

              labeled bool
                     Determines if a label appears at the top of the menu. Default is false.

              label string
                     The label to display at the top of the menu. Default is "JWM".

              dynamic string
                     A dynamically loaded menu. If the text starts with exec:, the output of the specified program is used.

              Within the RootMenu tag, the following tags are supported:

              Menu
                     This tag creates a submenu item. Any of the tags allowed within the RootMenu tag, including the Menu tag are  allowed  within
                     this element. The following attributes are supported:

                     height int
                            Height of each menu item in pixels. 0 indicates the largest menu item will determine the height. The default is inher‐
                            ited from the parent menu.

                     label string
                            The label to use. No default.

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this menu. No default.

                     labeled bool
                            Determines if a label appears at the top of the menu. Default is false.

              Dynamic
                     Dynamically include the contents of a file or executable into a submenu.  The file must start with a "JWM" tag. The  file  is
                     specified by the text of the tag. If the text starts with "exec:" then the output of a program is used. This tag supports the
                     same attributes as Menu.

              Include
                     Include the contents of a file into the menu structure. The file must start with a "JWM" tag. The file is  specified  by  the
                     text of the tag.  If the text starts with "exec:" then the output of a program is used.

              Program
                     The  Program  tag provides a way to start an external program. The text in this tag is the command used to start the program.
                     The following attributes are supported:

                     label string
                            The label to display. Default is the text of the tag.

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use. No default.

              Separator
                     This tag simply puts a line in the menu allowing menu divisions.  No text or attributes are used.

              Desktops
                     Add a desktop menu. This will add a submenu with a list of desktops that can be used to change the current desktop.  The fol‐
                     lowing attributes are supported:

                     label string
                            The label to use for the menu. The default is "Desktops".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              SendTo
                     Add a "send to" menu to the menu. After selecting an item from this menu, a window may be selected to send that window to the
                     selected desktop.  The following attributes are supported:

                     label string
                            The label to use. The default is "SendTo".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Stick
                     Add a stick/unstick window operation to the menu. After selecting this item a window may be selected  to  toggle  the  sticky
                     state of that window.  The following attributes are supported:

                     label string
                            The label to use. The default is "Stick".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Maximize
                     Add a maximize window operation to the menu. After selecting this item a window may be selected to toggle the maximized state
                     of that window.  The following attributes are supported:

                     label string
                            The label to use. The default is "Maximize".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Minimize
                     Add a minimize window operation to the menu. After selecting this item a window may be selected to minimize that window.  The
                     following attributes are supported:

                     label string
                            The label to use. The default is "Minimize".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Shade
                     Add  a  shade/unshade  window  operation to the menu. After selecting this item a window may be selected to toggle the shaded
                     status of that window.  The following attributes are supported:

                     label string
                            The label to use. The default is "Shade".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Move
                     Add a move window operation to the menu. After selecting this item a window may be selected to move that window.  The follow‐
                     ing attributes are supported:

                     label string
                            The label to use. The default is "Move".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Resize
                     Add  a  resize  window  operation to the menu. After selecting this item a window may be selected to resize that window.  The
                     following attributes are supported:

                     label string
                            The label to use. The default is "Resize".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Kill
                     Add a kill window operation to the menu. After selecting this item a window may be selected to kill that window.  The follow‐
                     ing attributes are supported:

                     label string
                            The label to use. The default is "Kill".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Close
                     Add  a close window operation to the menu. After selecting this item a window may be selected to close that window.  The fol‐
                     lowing attributes are supported:

                     label string
                            The label to use. The default is "Close".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use for this item. No default.

              Restart
                     This tag adds a menu item to restart the window manager.  The following attributes are supported:

                     label string
                            The label to use. The default is "Restart".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use. No default.

              Exit
                     This tag adds a menu item to exit the window manager. If text is present within this tag, it is interpreted as a  command  to
                     run when JWM exits. This can be used to start another window manager.  The following attributes are supported:

                     label string
                            The label to use. The default is "Exit".

                     tooltip string
                            A tooltip to display. No default.

                     icon string
                            The icon to use. No default.

                     confirm bool
                            Determine if a confirm dialog appears before exiting. Default is true.

                     Note that confirm dialogs can be disabled completely at the compile-time.

       TRAYS
              One or more trays may be created via the Tray tag.  This tag supports the following attributes:

              autohide string
                     Specifies  the location to hide the tray when not activated. Default is "off" to disable hiding.  Possible values are "left",
                     "right", "top", "bottom", "off", and "on".

              x int
                     The x-coordinate of the tray. This may be negative to indicate an offset from the right of the screen.

              y int
                     The y-coordinate of the tray. This may be negative to indicate an offset from the bottom of the screen.

              width int
                     The width of the tray. 0 indicates that the tray should compute an optimal width depending on what it contains and  the  lay‐
                     out. A negative value subtracts from with screen width. 0 is the default.

              height int
                     The height of the tray. 0 indicates that the tray should compute an optimal height depending on what it contains and the lay‐
                     out. A negative value subtracts from the screen height. 0 is the default.

              layer { below | normal | above }
                     The layer of the tray. The default is above.

              layout { vertical | horizontal }
                     The layout of the tray. The default is horizontal.

              valign { fixed | top | center | bottom }
                     The vertical alignment of the tray. The default is fixed.

              halign { fixed | left | center | right }
                     The horizontal alignment of the tray. The default is fixed.

              Within this tag the following tags are supported:

              Clock
                     Add a clock to the tray. The text of this tag determines what action to take when the clock is clicked.  Optionally,  one  or
                     more  Button  tags  may be specified to bind actions to specific mouse buttons specified via the mask attribute.  By default,
                     the button mask is "123".  The following actions are supported:

                     root:n
                            Show root menu n.  Note that the default TrayButton action is root:1.

                     exec: string
                            Execute a command.

                     showdesktop
                            Minimize all windows on the current desktop.

                     This tag supports the following attributes:

                     format string
                            The format of the clock. See strftime(3).

                     zone string
                            The time zone of the clock.  See tzset(3).

                     width int
                            The width of the clock. 0 indicates that the width should be determined from the length of the text to be displayed.

                     height int
                            The height of the clock. 0 indicates that the height should be determined from the font used.

              Dock
                     Add a dock for system notifications. This can be used by those programs that use the _NET_SYSTEM_TRAY_Sn selection. The  size
                     of  the  Dock  is  dynamic  based  on  the  size of the tray and the number of items contained.  Only one Dock is allowed per
                     instance of JWM. This tag supports the following attributes:

                     width int
                            The maximum width of an item contained in the dock. This defaults to the width or height of  the  tray  (whichever  is
                            smaller).

                     spacing int
                            The spacing of items contained in the dock (in pixels).  This defaults to 0.

              Pager
                     Add  a pager to the tray.  A pager shows a miniature representation of a desktop.  When over the pager, the scroll wheel will
                     switch desktops.  Holding down the right mouse button allows you to drag a window around in the pager which changes its posi‐
                     tion  on  the real desktop.  You can also drag a window in the pager from one desktop to another.  This tag supports the fol‐
                     lowing attributes:

                     labeled bool
                            Determines if the pager has text labels. Default is false.

                     Also see the PAGER STYLE section for more information.

              Spacer
                     Add empty space to the tray.  This tag supports the following attributes:

                     width int
                            The width of the spacer (0 to fill all available space).  0 is the default.

                     height int
                            The height of the spacer (0 to fill all available space).  0 is the default.

              Swallow
                     Swallow a program into the tray. The text of this tag gives the command to run.  This tag supports the following attributes:

                     name string
                            The name of the program to swallow. This attribute is required.

                     width int
                            The width of the swallowed program. 0 indicates that the width should be determined from the tray and  size  requested
                            from the program. 0 is the default.

                     height int
                            The  height  of  the  swallowed  program.  0 indicates that the height should be determined from the tray and the size
                            requested from the program. 0 is the default.

              TaskList
                     Add a task list to the tray.  This tag supports the following attributes:

                     height int
                            The height of an item in the task list. 0 indicates that the height should be taken from the tray.  The default is 0.

                     labeled bool
                            Determines if a label is shown for items in the task list.  The default is true.

                     maxwidth int
                            The maximum width of an item in the task list. 0 indicates no maximum.  The default is 0.

              TrayButton
                     Add a button to the tray. The text of this tag determines what action to take when the button is clicked. Optionally, one  or
                     more  Button  tags  may be specified to bind actions to specific mouse buttons specified via the mask attribute.  By default,
                     the button mask is "123".  The following actions are supported:

                     root:n
                            Show root menu n.  Note that the default TrayButton action is root:1.

                     exec: string
                            Execute a command.

                     showdesktop
                            Minimize all windows on the current desktop.

                     This tag supports the following attributes:

                     label string
                            A label to display. No default.

                     popup string
                            A string to be displayed for a popup. This will default to the value specified for  label,  if  provided.  If  neither
                            popup nor label are specified no popup will be shown.

                     icon string
                            An icon to display. No default.

       INCLUDES
              Other  configuration  files  or  the  output of programs may be included under the JWM tag via the Include tag. The text of this tag
              specifies the location of an additional configuration file or program. The path may be relative to the location JWM was started,  an
              absolute path, or a path referencing an environment variable (using '$').  If the text starts with "exec:", the specified program is
              executed and its output is used.  The format of the configuration file or program output is the same as the main configuration file.

       GROUP SETTINGS
              Program groups allow one to specify options which apply to a group of programs by name and/or class. A program group is created with
              the  Group  tag.  As  many  program groups can be created as desired.  If one or more Name tags is specified, at least one name must
              match.  Likewise, if one or more Class tags is specified, at least one class must match.  JWM matches using extended  POSIX  regular
              expressions for both Name and Class tags.  See regex(7).  Within the Group tag the following tags are supported:

              Name
                     The window name of a program to match to be in this group (the first string in WM_CLASS).
              Class
                     The window class for a program to match to be in this group (the second string in WM_CLASS).
              Option
                     An option for this group. Possible options are:

                     aerosnap
                            Enable auto-maximization when a window is dragged to the corner of the screen.

                     border
                            Causes windows in this group to have a border.

                     centered
                            Center windows in this group upon initial placement instead of using cascaded placement.

                     constrain
                            Constrain windows in this group to the screen.

                     desktop:#
                            The desktop on which windows in this group will be started.

                     drag
                            Do not pass mouse events to the window.  Instead, use the mouse to move/resize the window.

                     fixed
                            Fix  windows  in  this  group  to their initial desktop.  This causes the current desktop to change when the window is
                            activated rather than the default behavior of bringing the window to the current desktop.

                     fullscreen
                            Make windows in this group initially fullscreen.

                     height:#
                            Set the initial window height (in pixels).

                     hmax
                            Make windows in this group maximize horizontally.

                     icon:string
                            The icon to be used for windows in this group.

                     ilist
                            Ignore the program-specified list setting for windows in this group.  If specified with nolist, windows  will  not  be
                            listed in the task list, otherwise windows will be listed.

                     iignore
                            Ignore the size increment hint when maximizing windows in this group.

                     ipager
                            Ignore  the program-specified pager setting for windows in this group.  If specified with nopager, windows will not be
                            shown in the pager, otherwise windows will be shown.

                     layer:string
                            The layer on which windows in this group will be started.  Valid options are below, normal, and above

                     maximized
                            Make windows in this group initially maximized.

                     minimized
                            Make windows in this group initially minimized.

                     noborder
                            Causes windows in this group to be displayed without a border.

                     noclose
                            Prevent windows in this group from being closed.

                     nodrag
                            Disable mod1+drag moving/resizing for windows in this group.

                     nofocus
                            Prevents windows in the group from grabbing the focus when mapped.

                     nofullscreen
                            Prevent windows in this group from being fullscreen.

                     nolist
                            Causes the tray to ignore windows in this group when the window is initially mapped.

                     nopager
                            Causes the pager to ignore windows in this group.

                     nomax
                            Prevent windows in this group from being maximized.

                     nomin
                            Prevent windows in this group from being minimized.

                     nomove
                            Prevent windows in this group from being moved.

                     noresize
                            Prevent windows in this group from being resized.

                     noshade
                            Prevent windows in this group from being shaded.

                     notitle
                            Causes windows in this group to be displayed without a title bar.

                     noturgent
                            Ignore the urgent hint for windows in this group.

                     opacity:#
                            Set the opacity for windows in this group.  The value is a number between 0.0 and 1.0 inclusive.

                     pignore
                            Ignore initial window position requested by program.

                     shaded
                            Make windows in this group initially shaded.

                     sticky
                            Make windows in this group sticky.

                     tiled
                            Attempt to tile windows in this group upon initial placement.  If tiled placement fails, windows  will  fall  back  to
                            cascaded placement (the default) or centered if specified.

                     title
                            Forces windows in this group to have a title bar.

                     vmax
                            Make windows in this group maximize vertically.

                     width:#
                            Set the initial window width (in pixels).

                     x:#
                            Set  the initial x-coordinate of the window. Negative numbers indicate that the value is relative to the right side of
                            the screen.

                     y:#
                            Set the initial y-coordinate of the window. Negative numbers indicate that the value is relative to the bottom of  the
                            screen.

       WINDOW STYLE
              The WindowStyle tag controls the look of window borders.  This tag supports the following attribute:

              decorations
                     The window decorations to use. Valid options are flat and motif. flat is the default.

              Within this tag, the following tags are supported:

              Font
                     The font used for title bars. See the FONTS section for more information.  This tag supports the following attribute:

                     align
                            The window title alignment.  Valid options are left, right, and center.  left is the default.

              Width
                     The width of window borders in pixels. The default is 4, the minimum is 1, and the maximum is 128.

              Height
                     The  height  of  window title bars in pixels. By default this is set to the size of the title font. The minimum is 1, and the
                     maximum is 256.

              Corner
                     The corner width of the window border for rounded window borders.  The default is 4, the minimum is 0 (rectangular), and  the
                     maximum is 5 (most rounded).

              Active
                     The  colors/opacity used for the active window. See the COLORS section for more information on colors. The following tags are
                     supported:

                     Foreground
                            The color of the text and buttons in the title bar.  The default is white.

                     Background
                            The color of the title bar (gradients are supported).  The default is #CC7700:#884400.

                     Opacity
                            The opacity of the window. This is a floating point value between 0.0 and 1.0.  The default is 1.0.  Note that a  com‐
                            posite manager, such as xcompmgr, is required for this.

                     Outline
                            The color of the window outline.  The default is a darkened version of the window background.  If motif window decora‐
                            tions are specified, two colors may be given separated by a ':' to set the down and up colors respectively.

              Foreground
                     The color of text and buttons in the title bar of inactive windows.  The default is white.

              Background
                     The color of the title bar (gradients are supported) of inactive windows.  The default is #333333:#111111.

              Opacity
                     The opacity of inactive windows. This is a floating point value between 0.0 and 1.0.  The default is 0.75.  Note that a  com‐
                     posite manager, such as xcompmgr, is required for this.

              Outline
                     The  color of the window outline for inactive windows.  The default is a darkened version of the window background.  If motif
                     window decorations are specified, two colors may be given separated by a ':' to set the down and up colors respectively.

       TRAY STYLE
              The TrayStyle tag controls the look of trays.  The following attribute is supported:

              decorations
                     The type of decorations to use for trays.  Possible values are flat and motif. The default is flat.

              Within this tag the following tags are supported:

              Font
                     The default tray font to use. See the FONTS section for more information.

              Foreground
                     The default foreground color. See the COLORS section for more information.

              Background
                     The default background color. See the COLORS section for more information.

              Outline
                     The color of the tray outline. See the COLORS section for more information.  The default is a darkened version  of  the  tray
                     background.  If motif tray decorations are specified, this may be given as two colors separated by a ':' to indicate the down
                     and up colors respectively.

              Opacity
                     The opacity of trays. This is a floating point value between 0.0 and 1.0.  Note that a composite manager, such  as  xcompmgr,
                     is required for this.

              Active
                     The  default  colors for active items on the tray.  See the COLORS section for more information.  The following tags are sup‐
                     ported:

                     Foreground
                            The default foreground color for active items.

                     Background
                            The default background color for active items.

                     Outline
                            The default outline color for active items. See the COLORS section for more information.  The default  is  a  darkened
                            version  of  the  background.  If motif tray decorations are specified, this may be given as two colors separated by a
                            ':' to indicate the down and up colors respectively.

       TASK LIST STYLE
              The TaskListStyle tag controls the look of task lists.  The following attributea are supported:

              decorations
                     The window decorations to use. Valid options are flat and motif. The default is inherited from TrayStyle.

              group
                     Determines if windows are grouped by class when shown in task bars.  Possible values are  true  and  false.  The  default  is
                     false.

              list
                     Determines which windows are shown in task bars.  Possible values are desktop and all. The default is desktop.

              Within this tag the following tags are supported:

              Font
                     The font to use. See the FONTS section for more information.

              Foreground
                     The foreground color. See the COLORS section for more information.

              Background
                     The background color. See the COLORS section for more information.

              Outline
                     The color of the button outline. See the COLORS section for more information.  The default is a darkened version of the back‐
                     ground.  If motif tray decorations are specified, this may be given as two colors separated by a ':' to indicate the down and
                     up colors respectively.

              Active
                     The colors for the active items.  See the COLORS section for more information.  The following tags are supported:

                     Foreground
                            The foreground color for active items.

                     Background
                            The background color for active items.

                     Outline
                            The outline color for active items. See the COLORS section for more information.  The default is a darkened version of
                            the background.  If motif tray decorations are specified, this may be given as two colors separated by a ':' to  indi‐
                            cate the down and up colors respectively.

       TRAY BUTTON STYLE
              The TrayButtonStyle tag controls the look of tray buttons.

              Within this tag the following tags are supported:

              Font
                     The font to use. See the FONTS section for more information.

              Foreground
                     The foreground color. See the COLORS section for more information.

              Background
                     The background color. See the COLORS section for more information.

              Outline
                     The color of the button outline. See the COLORS section for more information.  The default is a darkened version of the back‐
                     ground.  If motif tray decorations are specified, this may be given as two colors separated by a ':' to indicate the down and
                     up colors respectively.

              Active
                     The colors for pressed buttons.  See the COLORS section for more information.  The following tags are supported:

                     Foreground
                            The foreground color for pressed buttons.

                     Background
                            The background color for pressed buttons.

                     Outline
                            The outline color for pressed buttons. See the COLORS section for more information.  The default is a darkened version
                            of the background.  If motif tray decorations are specified, this may be given as two colors separated  by  a  ':'  to
                            indicate the down and up colors respectively.

       PAGER STYLE
              The PagerStyle tag controls the look of pagers.  Within this tag, the following tags are supported:

              Outline
                     The color of the outline around windows shown in the pager. See the COLORS section for more information.

              Foreground
                     The color of inactive windows shown in the pager. See the COLORS section for more information.

              Background
                     The background color of inactive desktops shown in the pager. See the COLORS section for more information.

              Active
                     The  colors  used  for  active items in the pager.  See the COLORS section for more information.  The following tags are sup‐
                     ported:

                     Foreground
                            The color of active windows shown in the pager.

                     Background
                            The background color of active desktops shown in the pager.

              Text
                     The color to use for pager labels. See the COLORS section for more information.

              Font
                     The font to use for pager labels. See the COLORS section for more information.

       CLOCK STYLE
              The ClockStyle tag controls the look of clocks.  Within this tag, the following tags are supported:

              Font
                     The font to use for clocks.  This defaults to the tray font.  See the COLORS section for more information.
              Foreground
                     The foreground (text) color of clocks.  This defaults to the tray foreground color.  See the COLORS section for more informa‐
                     tion.
              Background
                     The  background  color of clocks (gradients are supported).  This defaults to the tray background color.  See the COLORS sec‐
                     tion for more information.

       MENU STYLE
              The MenuStyle tag controls the look of the menus in JWM (this includes the root menu and window menus).  The following attribute  is
              supported:

              decorations
                     The type of decorations to use for menus.  Possible values are flat and motif. The default is flat.
              Within this tag the following tags are supported:

              Font
                     The font used on menus See the FONTS section for more information.

              Foreground
                     The text color of inactive menu items. See the COLORS section for more information.

              Background
                     The background color of inactive menu items. See the COLORSsection for more information.

              Outline
                     The  color  of  the menu outline. See the COLORS section for more information.  The default is a darkened version of the menu
                     background.  If motif decorations are used, this may be given as two colors separated by a ':' to indicate the  down  and  up
                     colors respectively.

              Active

                     The colors used for active menu items.  See the COLORS section for more information.  The following tags are supported:

                     Foreground
                            The text color of active menu items.

                     Background
                            Text background color of active menu items (gradients are supported).

              Opacity
                     The  opacity  of menus. This is a floating point value between 0.0 and 1.0.  Note that a composite manager, such as xcompmgr,
                     is required for this.

       POPUP STYLE
              The PopupStyle tag controls the look of popup windows such as those shown when the mouse sits over a task list item.  This tag  sup‐
              ports the following attributes:

              delay int
                     The delay in milliseconds before popups activate.  The default is 600.

              enabled string
                     Determine  if popups are shown. This is a comma-separated list of one or more of the following: true (all enabled), false (no
                     popups enabled), button (tray buttons), clock (clocks), menu (menus), pager  (pagers),  and  task  (task  list  items).   The
                     default is true.

              Within this tag the following tags are supported:

              Font
                     The font to use. See the FONTS section for more information.

              Outline
                     The color of the window outline. See the COLORS section for more information.  The default is black.

              Foreground
                     The text color. See the COLORS section for more information.

              Background
                     The background color. See the COLORS section for more information.

       FONTS
              Fonts for various parts of JWM are specified within a Font tag. The text of this tag determines the font to use.  This can be either
              a standard X font string or, if compiled with XFT support, an XFT font string.

       COLORS
              Colors for various parts of JWM are specified within specific tags (described above). Colors may either be hex triplets in RGB  for‐
              mat (for example, #FF0000 is red) or by a name recognized by the X server.  For components that support gradients, two colors may be
              specified separated by a colon.

       ICONS
              Icons for windows that don't supply an icon via the _NET_WM_ICON hint are located by searching the icon search path(s) for  an  icon
              whose  name (minus the ".xpm" or ".png" extension) matches the instance name of the window as returned in the WM_CLASS hint. If this
              lookup fails, a default icon is supplied. This icon will be displayed for the window on it's title bar and on the task  list.  Icons
              that are not an appropriate size will be scaled. Square icons work best.

              For  menu  items,  the icon path is searched for a match. the icon specified for a menu item must be the exact name of the icon file
              with the extension.  If no match is found, a blank area will appear where the icon should appear.  If an icon is not  specified  for
              any menu item in a menu, no space will be allocated for icons.

              Zero  or  more  IconPath tags may be specified. The text of this tag is assumed to be an absolute directory path to a directory con‐
              taining XPM, PNG, and/or JPEG icons.  When searching for icons, if multiple paths are provided, they will be searched in order until
              a match is made.  Note that icon, PNG, JPEG, and XPM support are compile-time options.

       KEY BINDINGS
              Keyboard  bindings  in JWM are specified in Key tags.  Either the key or keycode attributes must be specified to determine which key
              will cause an action. The optional attribute, mask, specifies what key mask, if any, must be in effect for  the  binding  to  match.
              Finally, the text of the Key tag is the action to perform.

              One or more of the following key masks may be specified for mask (see xmodmap(1)):

                     A      The "Alt" key (mod1).

                     C      Control

                     S      Shift

                     1      mod1

                     2      mod2

                     3      mod3

                     4      mod4

                     5      mod5

              The  key  specified  in  the key attribute must contain a valid key string for XStringToKeysym(3). These values are usually what one
              would expect (for example, the escape key is called "Escape").

              Valid actions for a key binding are:

                     up     Move up.

                     down   Move down.

                     right  Move right.

                     left   Move left.

                     escape Stop a move/resize, exit a menu, or cancel an action.

                     fullscreen
                            Toggle between fullscreen and not fullscreen.

                     select Make a menu selection or confirm an action.

                     next   Move to the next window in the task list.

                     nextstacked
                            Move to the next window in the stacking order.

                     prev   Move to the previous window in the task list.

                     prevstacked
                            Move to the previous window in the stacking order.

                     close  Close the active window.

                     minimize
                            Minimize the active window.

                     maximize
                            Maximize the active window.

                     maxv   Maximize the active window vertically.

                     maxh   Maximize the active window horizontally.

                     maxtop Maximize the active window to the top of the screen.

                     maxbottom
                            Maximize the active window to the bottom of the screen.

                     maxleft
                            Maximize the active window to the left of the screen.

                     maxright
                            Maximize the active window to the right of the screen.

                     restore
                            Restore a maximized window.

                     send#  Send the active window to the specified desktop.  To use this, "#" must be specified in the key section.  The number 1
                            to the number of desktops configured are then substituted for "#".

                     sendl  Send the active window left.

                     sendr  Send the active window right.

                     sendu  Send the active window up.

                     sendd  Send the active window down.

                     shade  Shade the active window.

                     stick  Stick/unstick the active window.

                     move   Move the active window.

                     resize Resize the active window.

                     root:n Show root menu n.

                     window Show the window menu for the active window.

                     desktop#
                            Switch  to  a  specific  desktop. To use this, "#" must be specified in the key section. The number 1 to the number of
                            desktops configured are then substituted for "#".

                     rdesktop
                            Move one desktop to the right.

                     ldesktop
                            Move one desktop to the left.

                     udesktop
                            Move up one desktop.

                     ddesktop
                            Move down one desktop.

                     showdesktop
                            Show/hide the desktop (maximize/minimize all windows).

                     showtray
                            Unhide the tray (when using autohide).

                     exec:command
                            Execute command.

                     restart
                            Restart JWM.

              Note that there are no default key bindings.  It is possible to bind multiple key combinations to the same action.

       MOUSE BINDINGS
              Mouse bindings are configured using Mouse tags.  The context attribute determines the context in which the binding applies, the but‐
              ton  attribute  species  the  mouse button, and the (optional) mask specifies the key mask that must be in effect for the binding to
              match.  Finally, the text of the Mouse tag determines the action to perform (see KEY BINDINGS for a list of actions).  The button is
              a  mouse button number, starting at 1 (typically the left button). A positive value for the button indicates that the action applies
              on mouse press and a negative value indicates that the action applies on release. The button number can be repeated to bind to  dou‐
              ble clicks. The following mouse contexts are supported:

              border
                     The window border.

              close
                     The close button on a window.

              icon
                     The icon button on a window.

              maximize
                     The maximize button on a window.

              minimize
                     The minimize button on a window.

              root
                     The root window.

              title
                     The title bar of a window.

              Other bindings:

              Button 1 (typically the left button):
                     Over  the  close  button,  clicking  closes  the  window.   Over a task bar, restores or minimizes the window.  Over a pager,
                     switches the active desktop.

              Button 2 (typically the middle button):
                     Over a pager, switches the active desktop.

              Button 3 (typically the right button):
                     Over a task bar, shows the window menu.  Over a pager, dragging while holding button 3 will move a window.

              When a menu is open, the scroll wheel will move through menu items.  When over the pager, the scroll  wheel  will  switch  desktops.
              When over a task list, the scroll wheel will switch windows.

       DESKTOPS
              Virtual desktops are controlled with the Desktops tag.  Within this tag the following attribute is supported:

              width int
                     The number of virtual desktops in the horizontal direction.  The default is 4.

              height int
                     The number of virtual desktops in the vertical direction.  The default is 1.

              Within the Desktops tag the following tags are supported:

              Background
                     The  default background for desktops. The type attribute determines the type of background and the text contained within this
                     tag is the value. Valid types are:

                     solid
                            A solid color. See the COLORS section for more information.  This is the default.
                     gradient
                            A gradient color. See the COLORS section for more information.
                     image
                            A stretched image. This may be an XPM, PNG, or JPEG image. Note that support for XPM, PNG, and  JPEG  images  must  be
                            compiled in and icon support is required.
                     tile
                            A tiled image. Like image, but the image is tiled instead of stretched.
                     scale
                            A scaled image. Like image, but the aspect ratio of the image is preserved.
                     command
                            A command to run for setting the background.

              Desktop
                     Desktop-specific  data.  The  name attribute may be specified to name the desktop (the default is the desktop number). Within
                     this tag a Background tag may be specified for a desktop-specific background.  See Background above for more information.

       OTHER SETTINGS

              The following tags may also be supplied:

              ButtonClose
                     An icon to display for the close button on client windows instead of the default.
              ButtonMax
                     An icon to display for the maximize button on client windows instead of the default.
              ButtonMaxActive
                     An icon to display for the maximize button on maximized client windows instead of the default.
              ButtonMenu
                     An icon to display for the menu button on client windows instead of the default. This is used for client windows that do  not
                     specify an icon.
              ButtonMin
                     An icon to display for the minimize button on client windows instead of the default.
              DefaultIcon
                     An icon to display for windows that do not specify an icon.
              DoubleClickDelta
                     The  number  of  pixels the mouse can move during a double click.  The default is 2. Valid values are between 0 and 32 inclu‐
                     sive.

              DoubleClickSpeed
                     The maximum number of milliseconds between clicks for a double click.  The default is 400. Valid values  are  between  1  and
                     2000 inclusive.

              FocusModel
                     The focus model to be used. The default is "sloppy". Valid values are:

                     click
                            Click to focus and raise.

                     clicktitle
                            Click to focus. Click the title bar to raise.

                     sloppy
                            Focus follows mouse. Click to raise.

                     sloppytitle
                            Focus follows mouse. Click the title bar to raise.

              MoveMode
                     The move mode. The default is "opaque". Valid values are "opaque" and "outline".  This tag supports the following attributes:

                     coordinates { off | corner | window | screen }
                            The location of the status window. The default is screen.

                     delay int
                            The  delay in milliseconds before moving a window to a different desktop.  Setting this to 0 disables dragging windows
                            between desktops.  The default is 1000.

                     mask string
                            The key mask of the modifier that, when held, allows one to move the window by dragging it.  The default is "A".

              ResizeMode
                     The resize mode. The default is "opaque". Valid values are "opaque" and "outline". The optional coordinates attribute  deter‐
                     mines the location of the move status window. Possible values are: This tag supports the following attribute:

                     coordinates { off | corner | window | screen }
                            The location of the status window. The default is screen.

              RestartCommand
                     A command to run when JWM restarts.

              SnapMode
                     The  snap mode. The default is "border". Valid values are "none" (for no snapping), "screen" (for snapping to the edge of the
                     screen), and "border" (for snapping to the borders of windows and the screen).  An optional  attribute,  distance,  specifies
                     the distance for snapping. The default is 5. Valid values are between 1 and 32 inclusive.

              StartupCommand
                     A command to run when JWM starts.

              ShutdownCommand
                     A command to run when JWM exits.

              TitleButtonOrder
                     Change  the  order  of  buttons in title bars.  This is a string of zero or more of the following characters to determine the
                     order of items in the window title bar:

                            m Maximize button

                            i Minimize (iconify) button

                            t Window title

                            w Window menu button

                            x Close button

AUTHOR
       Joe Wingbermuehle <joewing@joewing.net>

SEE ALSO
       X(1)

v2.4.0                                                              2017-08-14                                                              jwm(1)
