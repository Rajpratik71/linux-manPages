NM-CONNECTION-EDITOR(1)                                                                  General Commands Manual                                                                  NM-CONNECTION-EDITOR(1)

NAME
       nm-connection-editor - network connection editor for NetworkManager

SYNOPSIS
       nm-connection-editor  [ OPTIONS ]

DESCRIPTION
       nm-connection-editor  is a GTK‐based application to add, remove, and modify network connections stored by NetworkManager.  NetworkManager must be running for any network connections to be added,
       removed, or modified.

OPTIONS
       -t, --type=<type>
              Type of connection to create or show.  Values are NetworkManager setting names, eg "802-3-ethernet", "802-11-wireless", "bridge", "bond",  "infiniband",  "vlan",  etc.   Does  nothing  if
              --create or --show is not given.

       -s, --show
              Expand or collapse the network list to highlight the network connection type given by --type.

       -c, --create
              Create a new connection of the type given by --type and allow the user to modify connection details.

       -e, --edit=<uuid>
              Show the network connection edit window for the connection of the given UUID.

SEE ALSO
       nmcli(1), NetworkManager(8), nm-applet(1).

                                                                                             15 February 2013                                                                     NM-CONNECTION-EDITOR(1)
