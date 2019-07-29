XKILL(1)                                                      General Commands Manual                                                     XKILL(1)

NAME
       xkill - kill a client by its X resource

SYNOPSIS
       xkill [-display displayname] [-id resource] [-button number] [-frame] [-all] [-version]

DESCRIPTION
       Xkill  is  a  utility for forcing the X server to close connections to clients.  This program is very dangerous, but is useful for aborting
       programs that have displayed undesired windows on a user's screen.  If no resource identifier is given with -id, xkill will display a  spe‐
       cial  cursor  as  a prompt for the user to select a window to be killed.  If a pointer button is pressed over a non-root window, the server
       will close its connection to the client that created the window.

OPTIONS
       -display displayname
               This option specifies the name of the X server to contact.

       -id resource
               This option specifies the X identifier for the resource whose creator is to be aborted.  If no resource is  specified,  xkill  will
               display a special cursor with which you should select a window to be kill.

       -button number
               This  option specifies the number of pointer button that should be used in selecting a window to kill.  If the word "any" is speci‐
               fied, any button on the pointer may be used.  By default, the first button in the pointer map (which is usually the  leftmost  but‐
               ton) is used.

       -all    This  option  indicates  that  all clients with top-level windows on the screen should be killed.  Xkill will ask you to select the
               root window with each of the currently defined buttons to give you several chances to abort.  Use of this option is highly discour‐
               aged.

       -frame  This  option  indicates that xkill should ignore the standard conventions for finding top-level client windows (which are typically
               nested inside a window manager window), and simply believe that you want to kill direct children of the root.

       -version
               This option makes xkill print its version and exit without killing anything.

CAVEATS
       This command does not provide any warranty that the application whose connection to the X server is closed will abort nicely, or even abort
       at  all. All this command does is to close the connection to the X server. Many existing applications do indeed abort when their connection
       to the X server is closed, but some can choose to continue.

XDEFAULTS
       Button  Specifies a specific pointer button number or the word "any" to use when selecting windows.

SEE ALSO
       X(7), xwininfo(1), XKillClient(3), XGetPointerMapping(3), KillClient in the X Protocol Specification

AUTHOR
       Jim Fulton, MIT X Consortium
       Dana Chee, Bellcore

X Version 11                                                        xkill 1.0.4                                                           XKILL(1)
