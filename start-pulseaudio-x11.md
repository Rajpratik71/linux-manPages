start-pulseaudio-x11(1)                                       General Commands Manual                                      start-pulseaudio-x11(1)

NAME
       start-pulseaudio-x11 - PulseAudio Sound Server X11 Startup Script

SYNOPSIS
       start-pulseaudio-x11 [pulseaudio options]

DESCRIPTION
       This  script starts pulseaudio (if not already running) and loads modules to publish access credentials to the PulseAudio server in the X11
       root window and to synthesize X11 media key events on cork/uncork requests. Additionally it registers PulseAudio to the  X11  Session  Man‐
       ager.

       All arguments are directly passed to pulseaudio.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulseaudio(1)

Manuals                                                                User                                                start-pulseaudio-x11(1)
