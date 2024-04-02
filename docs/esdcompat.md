esdcompat(1)                                                                               General Commands Manual                                                                               esdcompat(1)



NAME
       esdcompat - PulseAudio ESD wrapper script

SYNOPSIS
       esdcompat [options]

       esdcompat --help

       esdcompat --version

DESCRIPTION
       esdcompat is a compatibility script that takes the same arguments as the ESD sound daemon esd(1), but uses them to start a the PulseAudio sound server with the appropriate parameters. It is required
       to make PulseAudio a drop-in replacement for esd, i.e. it can be used to make gnome-session(1) start up PulseAudio instead of esd.

       It is recommended to make esd a symbolic link to this script.

OPTIONS
       -h | --help
              Show help.

       --version
              Show version information.

       -tcp | -promiscuous | -d | -b | -r | -as | -unix | -public | -terminate | -nobeeps | -trust | -port | -bind
              These options understood by the original esd are ignored by esdcompat.

       -spawnpid | -spawnfd
              These internally used options understood by the original esd are properly handled by esdcompat, however are not to be used manually.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulseaudio(1), esd(1)



Manuals                                                                                              User                                                                                        esdcompat(1)
