spice-vdagent(1)                                                                        General Commands Manual                                                                       spice-vdagent(1)

NAME
       spice-vdagent - Spice guest agent X11 session agent

SYNOPSIS
       spice-vdagent [OPTIONS]

DESCRIPTION
       The spice guest agent for Linux consists of 2 parts, a system wide daemon spice-vdagentd and a X11 session agent spice-vdagent of which there is one per X11 session.
       spice-vdagent gets automatically started in desktop environments which honor /etc/xdg/autostart, and under gdm.

FEATURES
       The spice guest agent adds the following features to spice Linux guests:

       Client mouse mode (no need to grab mouse by client, no mouse lag)

       Automatic adjustment of the X11 session's number of virtual monitors, and their resolution, to the number of client windows and their resolution

       Support of copy and paste (text and images) between the active X11 session and the client, this supports both the primary selection and the clipboard

       Support for transferring files from the client to the agent

OPTIONS
       -h     Print a short description of all command line options

       -d     Log debug messages

       -s port
              Set virtio serial port (default: /dev/virtio-ports/com.redhat.spice.0)

       -x     Don't daemonize

       -f dir|xdg-desktop|xdg-download
              Set  directory where to save files send from the client, this can be either an arbitrary dir or one of the special values of xdg-desktop or xdg-download to select the default xdg Desk‐
              top resp. xdg Download directory. If no value is specified the default is xdg-desktop when running under a Desktop Environment which has icons on the  desktop  and  xdg-download  under
              other Desktop Environments

       -o 0|1 Disable/enable  opening  the  file save directory with xdg-open (showing the directory in the file manager) when a file transfer from the client completes. If no value is specified the
              default is 0 when running under a Desktop Environment which has icons on the desktop and 1 under other Desktop Environments

SEE ALSO
       spice-vdagentd(1)

COPYRIGHT
       Copyright 2010-2013 Red Hat, Inc. License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

spice-vdagent 0.17.0                                                                          April 2013                                                                              spice-vdagent(1)
