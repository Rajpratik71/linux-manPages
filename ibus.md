IBUS(1)                                                                                       User Commands                                                                                       IBUS(1)

NAME
       ibus - command line utility for ibus

SYNOPSIS
       ibus COMMAND [OPTION]...

DESCRIPTION
       IBus is an Intelligent Input Bus. It is a new input framework for Linux OS. It provides full featured and user friendly input method user interface.  It also may help developers to develop input
       method easily.

       ibus is a command line utility which can restart or exit ibus-daemon, get or set the current ibus engine or list the ibus engines.

       Homepage: https://github.com/ibus/ibus/wiki

COMMAND
       help   Show the commands list.

       engine [ENGINE_NAME]
              Show the curent ibus engine when ENGINE_NAME is not given. Set ENGINE_NAME to the current ibus engine.

       exit   Exit ibus-daemon.

       list-engine
              Show ibus engines list.

       restart
              Restart ibus-daemon.

       version
              Show the ibus version.

       read-cache [--system|--file=FILE]
              Show the content of the user registry cache if --system is not given.  Show the content of the system registry cache if --system is given.  Show the content of the custom  registry  cache
              FILE if --file=FILE is given.

       write-cache [--system|--file=FILE]
              Save the user registry cache if --system is not given.  Save the system registry cache if --system is given.  Save the custom registry cache FILE if --file=FILE is given.

              By  default,  it reads the component XML files from the standard component directory (/usr/share/ibus/component), you can set IBUS_COMPONENT_PATH environment variable for custom component
              directories, separated by ':'.

       address
              Show the D-Bus address of ibus-daemon.

       read-config
              Print the setting values in a gsettings configuration file.

       reset-config
              Reset the user setting values to the default ones in a gsettings configuration file.

       watch  Under construction.

       BUGS   If you find a bug, please report it at https://github.com/ibus/ibus/issues

1.5.11                                                                                           May 2013                                                                                         IBUS(1)
