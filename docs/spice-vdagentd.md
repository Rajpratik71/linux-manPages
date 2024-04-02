spice-vdagentd(1)                                                                       General Commands Manual                                                                      spice-vdagentd(1)

NAME
       spice-vdagentd - Spice guest agent daemon

SYNOPSIS
       spice-vdagent [OPTIONS]

DESCRIPTION
       The spice guest agent for Linux consists of 2 parts, a system wide daemon spice-vdagentd and a X11 session agent spice-vdagent of which there is one per X11 session.
       spice-vdagentd gets started through a Sys-V initscript or a systemd unit.

FEATURES
       The spice guest agent adds the following features to spice Linux guests:

       Client mouse mode (no need to grab mouse by client, no mouse lag)

       Automatic adjustment of the X11 session's number of virtual monitors, and their resolution, to the number of client windows and their resolution

       Support of copy and paste (text and images) between the active X11 session and the client, this supports both the primary selection and the clipboard

       Support for transferring files from the client to the agent

OPTIONS
       -h     Print a short description of all command line options

       -d     Log debug messages (use twice for extra info)

       -f     Treat uinput device as fake; no ioctls.  This is useful in combination with Xspice.

       -o     The daemon will exit after processing a single session.

       -s port
              Set virtio serial port (default: /dev/virtio-ports/com.redhat.spice.0)

       -u device
              Set uinput device (default: /dev/uinput)

       -x     Don't daemonize

       -X     Disable  session  info  usage, spice-vdagentd needs to know which spice-vdagent is in the currently active X11 session.  spice-vdagentd uses console kit or systemd-logind (compile time
              option) for this; The -X option disables this, if no session info is available only one spice-vdagent is allowed

FILES
       The Sys-V initscript or systemd unit parses the following files:

       /etc/default/spice-vdagentd
              Default cmdline options can be passed to spice-vdagentd by setting them in the SPICE_VDAGENTD_EXTRA_ARGS variable in this file

SEE ALSO
       spice-vdagent(1)

COPYRIGHT
       Copyright 2010-2013 Red Hat, Inc. License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

spice-vdagent 0.17.0                                                                          April 2013                                                                             spice-vdagentd(1)
