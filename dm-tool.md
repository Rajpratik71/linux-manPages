DM-TOOL(1)                                                                               General Commands Manual                                                                               DM-TOOL(1)

NAME
       dm-tool - a tool to control the display manager

SYNOPSIS
       dm-tool [ OPTIONS ] COMMAND [ ARGS ]

DESCRIPTION
       dm-tool is a tool to communicate with the LightDM display manager.

OPTIONS
       -h, --help
              Show help options

       --version
              Show release version

       --session-bus
              Attempt  to  connect to the display manager using the session bus.  This is useful if you are running a display manager in a test mode.  If this option is not present dm-tool will connect
              using the system bus.

       The following commands are available:

       switch-to-greeter
              Switch to the greeter suitable for logging into a new session.

       switch-to-user USERNAME [SESSION]
              Switch to a user session.  If this user is already logged in then the display manager will switch to that session, otherwise a new session is started.  If  authentication  is  required  a
              greeter will start to collect this.  If the session option is provided then this session type will be used, otherwise the default for this user is used.

       switch-to-guest [SESSION]
              Switch  to a guest session.  If the guest session is already active the display manager will switch to that session, otherwise the guest session is started.  If the session option is pro‐
              vided then this session type will be used, otherwise the default for the guest user is used.

       lock   Lock the current seat.  This will switch to a greeter with a hint that the screen is locked.  You can return to this session by authenticating in the greeter.

       list-seats
              List the active seats and sessions that are running.

       add-nested-seat
              Start an X server inside a session and connect it to a display manager.

       add-local-x-seat DISPLAY_NUMBER
              Connect an existing X server to the display manager.

       add-seat TYPE [NAME=VALUE...]
              Add a dynamic seat.

SEE ALSO
       lightdm(1)

                                                                                             7 November 2013                                                                                   DM-TOOL(1)
