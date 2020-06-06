XWININFO(1)                                                                              General Commands Manual                                                                              XWININFO(1)

NAME
       xwininfo - window information utility for X

SYNOPSIS
       xwininfo [-help] [-id id] [-root] [-name name] [-int] [-children] [-tree] [-stats] [-bits] [-events] [-size] [-wm] [-shape] [-frame] [-all] [-english] [-metric] [-display display]

DESCRIPTION
       Xwininfo is a utility for displaying information about windows.  Various information is displayed depending on which options are selected.  If no options are chosen, -stats is assumed.

       The user has the option of selecting the target window with the mouse (by clicking any mouse button in the desired window) or by specifying its window id on the command line with the -id option.
       Or instead of specifying the window by its id number, the -name option may be used to specify which window is desired by name.  There is also a special -root option to quickly obtain information
       on the screen's root window.

OPTIONS
       -help   Print out the `Usage:' command syntax summary.

       -id id  This  option  allows  the user to specify a target window id on the command line rather than using the mouse to select the target window.  This is very useful in debugging X applications
               where the target window is not mapped to the screen or where the use of the mouse might be impossible or interfere with the application.

       -name name
               This option allows the user to specify that the window named name is the target window on the command line rather than using the mouse to select the target window.

       -root   This option specifies that X's root window is the target window.  This is useful in situations where the root window is completely obscured.

       -int    This option specifies that all X window ids should be displayed as integer values.  The default is to display them as hexadecimal values.

       -children
               This option causes the root, parent, and children windows' ids and names of the selected window to be displayed.

       -tree   This option is like -children but displays all children recursively.

       -stats  This option causes the display of various attributes pertaining to the location and appearance of the selected window.  Information displayed includes the location  of  the  window,  its
               width and height, its depth, border width, visual id and class, colormap id if any, map state, backing-store hint, and location of the corners.

       -bits   This  option  causes  the  display  of  various  attributes  pertaining to the selected window's raw bits and how the selected window is to be stored.  Displayed information includes the
               selected window's bit gravity, window gravity, backing-store hint, backing-planes value, backing pixel, and whether or not the window has save-under set.

       -events This option causes the selected window's event masks to be displayed.  Both the event mask of events wanted by some client and the event mask of events not to propagate are displayed.

       -size   This option causes the selected window's sizing hints to be displayed.  Displayed information includes: for both the normal size hints and the zoom size hints, the user supplied location
               if  any; the program supplied location if any; the user supplied size if any; the program supplied size if any; the minimum size if any; the maximum size if any; the resize increments if
               any; and the minimum and maximum aspect ratios if any.

       -wm     This option causes the selected window's window manager hints to be displayed.  Information displayed may include whether or not the application accepts input,  what  the  window's  icon
               window # and name is, where the window's icon should go, and what the window's initial state should be.

       -shape  This option causes the selected window's window and border shape extents to be displayed.

       -frame  This option causes window manager frames to be considered when manually selecting windows.

       -metric This  option  causes  all  individual  height, width, and x and y positions to be displayed in millimeters as well as number of pixels, based on what the server thinks the resolution is.
               Geometry specifications that are in +x+y form are not changed.

       -english
               This option causes all individual height, width, and x and y positions to be displayed in inches (and feet, yards, and miles if necessary) as well as number of pixels. -metric and  -eng‐
               lish may both be enabled at the same time.

       -all    This option is a quick way to ask for all information possible.

       -display display
               This option allows you to specify the server to connect to; see X(7).

EXAMPLE
       The following is a sample summary taken with no options specified:

       xwininfo: Window id: 0x60000f "xterm"

         Absolute upper-left X: 2
         Absolute upper-left Y: 85
         Relative upper-left X:  0
         Relative upper-left Y:  25
         Width: 579
         Height: 316
         Depth: 8
         Visual: 0x1e
         Visual Class: PseudoColor
         Border width: 0
         Class: InputOutput
         Colormap: 0x27 (installed)
         Bit Gravity State: NorthWestGravity
         Window Gravity State: NorthWestGravity
         Backing Store State: NotUseful
         Save Under State: no
         Map State: IsViewable
         Override Redirect State: no
         Corners:  +2+85  -699+85  -699-623  +2-623
         -geometry 80x24+0+58

ENVIRONMENT
       DISPLAY To get the default host and display number.

SEE ALSO
       X(7), xprop(1), xdpyinfo(1), xdriinfo(1), xvinfo(1), glxinfo(1)

BUGS
       Using -stats -bits shows some redundant information.

       The  -geometry  string  displayed must make assumptions about the window's border width and the behavior of the application and the window manager.  As a result, the location given is not always
       correct.

AUTHOR
       Mark Lillibridge, MIT Project Athena

X Version 11                                                                                  xwininfo 1.1.3                                                                                  XWININFO(1)
