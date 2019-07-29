pax11publish(1)                                                                         General Commands Manual                                                                        pax11publish(1)

NAME
       pax11publish - PulseAudio X11 Credential Utility

SYNOPSIS
       pax11publish -h

       pax11publish [options] [-d]

       pax11publish [options] -e

       pax11publish [options] -i

       pax11publish [options] -r

DESCRIPTION
       The pax11publish utility can be used to dump or manipulate the PulseAudio server credentials that can be stored as properties on the X11 root window.

       Please note that the loadable module module-x11-publish exports the same information directly from the PulseAudio sound server, and should in most cases be used in preference over this tool.

       Use the following command to dump the raw PulseAudio-specific data that is stored in your X11 root window:

       xprop -root | grep ^PULSE_

OPTIONS
       -h     Show help.

       -d     Read  the  PulseAudio  server  credentials  currently  set  on  the  X11  root  window and dump them in a human readable form. This reads the PULSE_SERVER, PULSE_SINK, PULSE_SOURCE and
              PULSE_COOKIE properties.

       -i     Similar to -d, however dumps them in a Bourne shell compatible format so they may be used together with the eval shell command to  set  the  $PULSE_SERVER,  $PULSE_SINK,  $PULSE_SOURCE
              environment variables. Also reads the authentication cookie from the root window and stores it in ~/.config/pulse/cookie.

       -e     Export  the  currently  locally used sound server, sink, source configuration to the X11 root window. This takes the data from the $PULSE_SERVER, $PULSE_SINK, $PULSE_SOURCE environment
              variables and combines them with the data from ~/.config/pulse/client.conf (or /etc/pulse/client.conf if that file does not exist). If specific options are passed on the  command  line
              (-S, -O, -I, -c, see below), they take precedence. Also uploads the local authentication cookie ~/.config/pulse/cookie to the X11 server.

       -r     Removes the configured PulseAudio configuration from the X11 root window.

       -D DISPLAY
              Connect to the specified X11 display, instead of the default one configured in $DISPLAY.

       -S SERVER
              Only valid for -e: export the specified PulseAudio server as default to the X11 display instead of the one configured via local configuration.

       -O SINK
              Only valid for -e: export the specified sink as default sink to the X11 display instead of the one configured via local configuration.

       -I SOURCE
              Only valid for -e: export the specified source as default to the X11 display instead of the one configured via local configuration.

       -c FILE
              Only valid for -e: export the PulseAudio authentication cookie stored in the specified file to the X11 display instead of the one stored in ~/.config/pulse/cookie.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulseaudio(1), xprop(1)

Manuals                                                                                          User                                                                                  pax11publish(1)
