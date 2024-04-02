WMCTRL(1)                                                     General Commands Manual                                                    WMCTRL(1)

NAME
       wmctrl - interact with a EWMH/NetWM compatible X Window Manager.

SYNOPSIS
       wmctrl [ options | actions ]...

DESCRIPTION
       wmctrl is a command that can be used to interact with an X Window manager that is compatible with the EWMH/NetWM specification.  wmctrl can
       query the window manager for information, and it can request that certain window management actions be taken.

       wmctrl is controlled entirely by its command line arguments. The command line arguments are used to specify  the  action  to  be  performed
       (with options that modify behavior) and any arguments that might be needed to perform the actions.

       The  following sections define the supported actions and options. Arguments to the actions and options are written in the form <ARGNAME> in
       the descriptions below. The detailed syntax for writing arguments are in a single section dedicated to that purpose.

ACTIONS
       The following command line arguments can be specified to invoke a wmctrl action. Only one action can be executed with the invocation of the
       wmctrl command.

       -a <WIN>
              Switch to the desktop containing the window <WIN>, raise the window, and give it focus.

       -b  ( add | remove | toggle),prop1 [,prop2 ]
              Add,  remove,  or  toggle up to two window properties simultaneously. The window that is being modified must be identified with a -r
              action. The property change is achived by using the EWMH _NET_WM_STATE request. The supported property names (for prop1  and  prop2)
              are modal, sticky, maximized_vert, maximized_horz, shaded, skip_taskbar, skip_pager, hidden, fullscreen, above and below.  Two prop‐
              erties are supported to allow operations like maximizing a window to full screen mode. Note that this action is made up  of  exactly
              two shell command line arguments.

       -c <WIN>
              Close the window <WIN> gracefully.

       -d     List  all  desktops managed by the window manager. One line is output for each desktop, with the line broken up into space separated
              columns. The first column contains an integer desktop number. The second column contains a '*' character for  the  current  desktop,
              otherwise  it  contains  a  '-'  character.  The  next  two  columns  contain  the fixed string DG: and then the desktop geometry as
              '<width>x<height>' (e.g. '1280x1024'). The following two columns contain the fixed string VP: and then the viewport position in  the
              format  '<y>,<y>'  (e.g.  '0,0').  The  next  three  columns  after this contains the fixed string WA: and then two columns with the
              workarea geometry as 'X,Y and WxH' (e.g. '0,0 1280x998'). The rest of the line contains the name of the desktop (possibly containing
              multiple spaces).

       -e <MVARG>
              Resize and move a window that has been specified with a -r action according to the <MVARG> argument.

       -g w,h Change  the geometry (common size) of all desktops so they are w pixels wide and h pixels high. w and h must be positive integers. A
              window manager may ignore this request.

       -h     Print help text about program usage.

       -I name
              Set the icon name (short title) of the window specified by a -r action to name.

       -k  ( on  |  off  )
              Turn on or off the window manager's "show the desktop" mode (if the window manager implements this feature).

       -l     List the windows being managed by the window manager. One line is output for each window, with the line broken up into  space  sepa‐
              rated columns.  The first column always contains the window identity as a hexadecimal integer, and the second column always contains
              the desktop number (a -1 is used to identify a sticky window). If the -p option is specified the next column will  contain  the  PID
              for  the window as a decimal integer. If the -G option is specified then four integer columns will follow: x-offset, y-offset, width
              and height. The next column always contains the client machine name. The remainder of the line contains the window  title  (possibly
              with multiple spaces in the title).

       -m     Display information about the window manager and the environment.

       -n N   Change the number of desktops to N (a non-negative integer).

       -N name
              Set the name (long title) of the window specified by a -r action to name.

       -o x,y Change the viewport for the current desktop. The values x and y are numeric offsets that specify the position of the top left corner
              of the viewport. A window manager may ignore this request.

       -r <WIN>
              Specify a target window for an action.

       -R <WIN>
              Move the window <WIN> to the current desktop, raise the window, and give it focus.

       -s <DESK>
              Switch to the desktop <DESK>.

       -t <DESK>
              Move a window that has been specified with the -r action to the desktop <DESK>.

       -T name
              Set the both the name (long title) and icon name (short title) of the window specified by a -r action to name.  This action is  like
              using  the  -N  and  -I  actions at the same time (which would otherwise be impossible since wmctrl can execute only one action at a
              time).

OPTIONS
       The following options modify the default actions, or they modify the interpretation of arguments.

       -F     Window name arguments (<WIN>) are to be treated as exact window titles that are case sensitive. Without this options  window  titles
              are considered to be case insensitive substrings of the full window title.

       -G     Include geometry information in the output of the -l action.

       -i     Interpret window arguments (<WIN>) as a numeric value rather than a string name for the window. If the numeric value starts with the
              prefix '0x' it is assumed to be a hexadecimal number.

       -p     Include PIDs in the window list printed by the -l action. Prints a PID of '0' if the application owning the window does not  support
              it.

       -u     Override auto-detection and force UTF-8 mode.

       -v     Provide verbose output. This is really useful when debugging wmctrl itself.

       -w [ <WORKAROUND>[,<WORKAROUND>]... ]
              Use workarounds specified in the argument.

       -x     Include WM_CLASS in the window list or interpret <WIN> as the WM_CLASS name.

ARGUMENTS
       <DESK> A Desktop is always specified by an integer which represents the desktop numbers. Desktop numbers start at 0.

       <MVARG>
              A  move and resize argument has the format 'g,x,y,w,h'.  All five components are integers. The first value, g, is the gravity of the
              window, with 0 being the most common value (the default value for the window). Please see the EWMH specification for other values.

              The four remaining values are a standard geometry specification: x,y is the position of the top left corner of the window,  and  w,h
              is  the width and height of the window, with the exception that the value of -1 in any position is interpreted to mean that the cur‐
              rent geometry value should not be modified.

       <WIN>  This argument specifies a window that is the target of an action. By default the argument is treated as if were a string,  and  win‐
              dows  are  examined until one is found with a title the contains the specified string as a substring. The substring matching is done
              in a case insensitive manner. The -F option may be used to force exact, case sensitive title matching. The option -i may be used  to
              interpret the window target as a numeric window identity instead of a string.

              The  window name string :SELECT: is treated specially. If this window name is used then wmctrl waits for the user to select the tar‐
              get window by clicking on it.

              The window name string :ACTIVE: may be used to instruct wmctrl to use the currently active window for the action.

       <WORKAROUND>
              There is only one work around currently implemeted. It is specified by using the string DESKTOP_TITLES_INVALID_UTF8  and  it  causes
              the printing of non-ASCII desktop tiles correctly when using Window Maker.

EXAMPLES
       Getting a list of windows managed by the window manager

              wmctrl -l

       Getting a list of windows with PID and geometry information.

              wmctrl -p -G -l

       Going to the window with a name containing 'emacs' in it

              wmctrl -a emacs

       Shade a window with a title that contains the word 'mozilla'

              wmctrl -r mozilla -b add,shaded

       Close a very specifically titled window sticky

              wmctrl -F -c 'Debian bug tracking system - Mozilla'

       Toggle the 'stickiness' of a window with a specific window identity

              wmctrl -i -r 0x0120002 -b add,sticky

       Change the title of window to a specified string but choose the window by clicking on it

              wmctrl -r :SELECT: -T "Selected Window"

SEE ALSO
       zenity(1) is a useful dialog program for building scripts with wmctrl.

       Some examples of EWMH/NetWM compatible window managers include recent versions of Enlightenment, Icewm, Kwin, Sawfish and Xfce.

AUTHOR
       wmctrl was written by Tomas Styblo <tripie@cpan.org>.

       This manual page was written by Shyamal Prasad <shyamal@member.fsf.org> for the Debian project (but may be used by others).

                                                                 December 12, 2004                                                       WMCTRL(1)
