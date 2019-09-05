pacmd(1)                                                                                General Commands Manual                                                                               pacmd(1)

NAME
       pacmd - Reconfigure a PulseAudio sound server during runtime

SYNOPSIS
       pacmd

       pacmd --help

       pacmd --version

DESCRIPTION
       This  tool  can be used to introspect or reconfigure a running PulseAudio sound server during runtime. It connects to the sound server and offers a simple live shell that can be used to enter
       the commands also understood in the default.pa configuration scripts.

       To exit the live shell, use ctrl+d. Note that the 'exit' command inside the shell will tell the PulseAudio daemon itself to shutdown!

       If any arguments are passed on the command line, they will be passed into the live shell which will process the command and exit.

OPTIONS
       -h | --help
              Show help.

       --version
              Show version information.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulse-cli-syntax(5), pulseaudio(1), pactl(1), default.pa(5)

Manuals                                                                                          User                                                                                         pacmd(1)
