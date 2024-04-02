COCKPIT-BRIDGE(1)                                                                               cockpit-bridge                                                                              COCKPIT-BRIDGE(1)



NAME
       cockpit-bridge - Cockpit Host Bridge

SYNOPSIS
       cockpit-bridge [--help] [--packages]

DESCRIPTION
       The cockpit-bridge program is used by Cockpit to relay messages and commands from the Web front end to the server. Among other things it relays DBus, and spawns processes on behalf of the Web user
       interface.

       This program is not routinely run by users or administrators. It is in the $PATH so that Cockpit can find it when connecting between hosts. However there are some diagnostics available when running
       from the command line.

OPTIONS
       --help
           Show help options.

       --interact=boundary
           Interact with the raw cockpit1 protocol. Useful for debugging and testing. Specify a boundary which should be on an empty line between messages.

       --packages
           List all available Cockpit packages and exit. Note this includes packages available to the user running this command.

BUGS
       Please send bug reports to either the distribution bug tracker or the upstream bug tracker[1].

AUTHOR
       Cockpit has been written by many contributors[2].

SEE ALSO
       cockpit-ws(8)

NOTES
        1. upstream bug tracker
           https://github.com/cockpit-project/cockpit/issues/new

        2. contributors
           https://github.com/cockpit-project/cockpit/



cockpit                                                                                           09/15/2019                                                                                COCKPIT-BRIDGE(1)
