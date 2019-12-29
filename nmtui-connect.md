NMTUI(1)                                General Commands Manual                               NMTUI(1)

NAME
       nmtui - Text User Interface for controlling NetworkManager

SYNOPSIS
       nmtui-edit | nmtui edit  {name | id}

       nmtui-connect | nmtui connect  {name | uuid | device | SSID}

       nmtui-hostname | nmtui hostname

DESCRIPTION
       nmtui is a curses‐based TUI application for interacting with NetworkManager. When starting
       nmtui, the user is prompted to choose the activity to perform unless it was specified as the
       first argument.

       The supported activities are:

       edit
           Show a connection editor that supports adding, modifying, viewing and deleting connections.
           It provides similar functionality as nm-connection-editor.

       connect
           Show a list of available connections, with the option to activate or deactivate them. It
           provides similar functionality as nm-applet.

       hostname
           Set the system hostname.

       Corresponding to above activities, nmtui also comes with binaries named nmtui-edit,
       nmtui-connect, and nmtui-hostname to skip the selection of the activities.

SEE ALSO
       nmcli(1), nm-applet(1), nm-connection-editor(1), NetworkManager(8).

NetworkManager 1.20.4                                                                         NMTUI(1)
