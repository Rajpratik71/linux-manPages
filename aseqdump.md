ASEQDUMP(1)                                                                              General Commands Manual                                                                              ASEQDUMP(1)

NAME
       aseqdump - show the events received at an ALSA sequencer port

SYNOPSIS
       aseqdump [-p client:port,...]

DESCRIPTION
       aseqdump is a command-line utility that prints the sequencer events it receives as text.

       To stop receiving, press Ctrl+C.

OPTIONS
       -h,--help
              Prints a list of options.

       -V,--version
              Prints the current version.

       -l,--list
              Prints a list of possible input ports.

       -p,--port=client:port,...
              Sets the sequencer port(s) from which events are received.

              A  client  can  be  specified  by its number, its name, or a prefix of its name.  A port is specified by its number; for port 0 of a client, the ":0" part of the port specification can be
              omitted.

AUTHOR
       Clemens Ladisch <clemens@ladisch.de>

                                                                                               19 Feb 2005                                                                                    ASEQDUMP(1)
