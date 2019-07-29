SMPROXY(1)                                                                              General Commands Manual                                                                             SMPROXY(1)

NAME
       smproxy - Session Manager Proxy

SYNOPSIS
       smproxy [-clientId id] [-restore saveFile] [-version]

OPTIONS
       -clientId id
               Specifies the session ID used by smproxy in the previous session.

       -restore saveFile
               Specifies the file used by smproxy to save state in the previous session.

       -version
               Prints the program version and exits.

DESCRIPTION
       smproxy allows X applications that do not support X11R6 session management to participate in an X11R6 session.

       In order for smproxy to act as a proxy for an X application, one of the following must be true:

       - The application maps a top level window containing the WM_CLIENT_LEADER property.  This property provides a pointer to the client leader window which contains the WM_CLASS, WM_NAME, WM_COM‐
       MAND, and WM_CLIENT_MACHINE properties.

       or ...

       - The application maps a top level window which does  not  contain  the  WM_CLIENT_LEADER  property.   However,  this  top  level  window  contains  the  WM_CLASS,  WM_NAME,  WM_COMMAND,  and
       WM_CLIENT_MACHINE properties.

       An application that support the WM_SAVE_YOURSELF protocol will receive a WM_SAVE_YOURSELF client message each time the session manager issues a checkpoint or shutdown.  This allows the appli‐
       cation to save state.  If an application does not support the WM_SAVE_YOURSELF protocol, then the proxy will provide enough information to the  session  manager  to  restart  the  application
       (using WM_COMMAND), but no state will be restored.

SEE ALSO
       xsm(1)

AUTHOR
       Ralph Mor, X Consortium

X Version 11                                                                                 smproxy 1.0.6                                                                                  SMPROXY(1)
