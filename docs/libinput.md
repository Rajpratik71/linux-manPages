libinput(1)                                                                                    libinput Manual                                                                                    libinput(1)



NAME
       libinput - tool to interface with libinput

SYNOPSIS
       libinput [--help|--version] <command> [<args>]

DESCRIPTION
       libinput is a library to handle input devices and provides device detection and input device event processing for most Wayland compositors and the X.Org xf86-input-libinput driver.

       The  libinput  tools  are  a set of tools to debug, interface with and analyze data for libinput. These tools create libinput contexts separate from that of the compositor/X server and cannot change
       settings in a running session.  See section COMMANDS for a list of available commands.

       libinput's API documentation and details on features and various high-level concepts are available online at https://wayland.freedesktop.org/libinput/doc/latest/

       The man page for the X.Org xf86-input-libinput driver is libinput(4).

OPTIONS
       --help  Print help and exit

       --version
               Print the version and exit

COMMANDS
       libinput-debug-events(1)
               Print all events as seen by libinput

       libinput-debug-gui(1)
               Show a GUI to visualize libinput's events

       libinput-list-devices(1)
               List all devices recognized by libinput

       libinput-measure(1)
               Measure various properties of devices

       libinput-measure-touch-size(1)
               Measure touch size and orientation

       libinput-measure-touchpad-tap(1)
               Measure tap-to-click time

       libinput-measure-touchpad-pressure(1)
               Measure touch pressure

       libinput-measure-trackpoint-range(1)
               Measure the delta range of a trackpoint

LIBINPUT
       Part of the libinput(1) suite

SEE ALSO
       libinput(4)

       libinput's online documentation https://wayland.freedesktop.org/libinput/doc/latest/



libinput 1.10.7                                                                                                                                                                                   libinput(1)
