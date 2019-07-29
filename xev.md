XEV(1)                                                        General Commands Manual                                                       XEV(1)

NAME
       xev - print contents of X events

SYNOPSIS
       xev  [-display  displayname]  [-geometry  geom] [-bw pixels] [-bs {NotUseful,WhenMapped,Always}] [-id windowid] [-root] [-s] [-name string]
       [-rv] [-version] [-event event_mask [-event event_mask ...]]

DESCRIPTION
       Xev creates a window and then asks the X server to send it events whenever anything happens to the window (such as it being moved, resized,
       typed  in,  clicked  in,  etc.).  You can also attach it to an existing window.  It is useful for seeing what causes events to occur and to
       display the information that they contain; it is essentially a debugging and development tool, and should not be needed in normal usage.

OPTIONS
       -display display
               This option specifies the X server to contact.

       -geometry geom
               This option specifies the size and/or location of the window, if a window is to be created.

       -bw pixels
               This option specifies the border width for the window.

       -bs {NotUseful,WhenMapped,Always}
               This option specifies what kind of backing store to give the window.  The default is NotUseful. Backing store  refers  to  the  the
               pixels  saved off-screen when the X server maintains the contents of a window; NotUseful means that the xev process will redraw its
               contents itself, as necessary.

       -id windowid
               This option specifies that the window with the given id should be monitored, instead of creating a new window.

       -root   This option specifies that the root window should be monitored, instead of creating a new window.

       -s      This option specifies that save-unders should be enabled on the window. Save unders are similar to backing store,  but  they  refer
               rather  to  the  saving of pixels off-screen when the current window obscures other windows. Save unders are only advisory, and are
               normally set for popup dialogs and other transient windows.

       -name string
               This option specifies the name to assign to the created window.

       -rv     This option specifies that the window should be in reverse video.

       -event event_mask
               Select which events to display.  The -event option can be specified multiple times to select multiple types of  events.   When  not
               specified,  all events are selected.  Available event masks: keyboard mouse expose visibility structure substructure focus property
               colormap owner_grab_button randr button

       -version
               This option prints the program version and exits.

SEE ALSO
       X(7), xwininfo(1), xdpyinfo(1), Xlib Programmers Manual, X Protocol Specification
       See X(7) for a full statement of rights and permissions.

AUTHOR
       Jim Fulton, MIT X Consortium

X Version 11                                                         xev 1.2.2                                                              XEV(1)
