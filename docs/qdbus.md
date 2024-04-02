
qdbus(1)                                                           User commands                                                          qdbus(1)

NAME
       qdbus - a communication-interface for qt-based applications

SYNOPSIS
       qdbus [--system] [--literal] [servicename] [path] [method] [args]

DESCRIPTION
       qdbus  provides  an  interface  to  Qt-based applications communicating over D-Bus.  See http://www.freedesktop.org/software/dbus/ for more
       information about the big picture.

       By default qdbus will list all service names of services that are running and you can manipulate at the moment.  You  can  also  manipulate
       and run several types of methods for each dbus-enabled application.

       servicename
              the service to connect to (e.g., org.freedesktop.DBus)

       path   the path to the object (e.g., /)

       method the method to call, with or without the interface

       args   arguments to pass to the call

OPTIONS
       --system
              connect to the system bus

       --literal
              print replies literally

EXAMPLE
       Here is an example of using qdbus to list all status information about a service:
       % qdbus org.ktorrent.ktorrent

SEE ALSO
       dbus-cleanup-sockets(1), dbus-launch(1), dbus-send(1), dbus-daemon(1), dbus-monitor(1), dbus-uuidgen(1)

                                                          Tue, 02 Feb 2010 23:35:52 +0100                                                 qdbus(1)
