padsp(1)                                                                                 General Commands Manual                                                                                 padsp(1)

NAME
       padsp - PulseAudio OSS Wrapper

SYNOPSIS
       padsp [options] PROGRAM [ARGUMENTS ...]

       padsp -h

DESCRIPTION
       padsp starts the specified program and redirects its access to OSS compatible audio devices (/dev/dsp and auxiliary devices) to a PulseAudio sound server.

       padsp uses the $LD_PRELOAD environment variable that is interpreted by ld.so(8) and thus does not work for SUID binaries and statically built executables.

       Equivalent to using padsp is starting an application with $LD_PRELOAD set to libpulsedsp.so

OPTIONS
       -h | --help
              Show help.

       -s SERVER
              Set the PulseAudio server to connect to.

       -n NAME
              The client application name that shall be passed to the server when connecting.

       -m NAME
              The stream name that shall be passed to the server when creating a stream.

       -M     Disable /dev/mixer emulation.

       -S     Disable /dev/sndstat emulation.

       -D     Disable /dev/dsp emulation.

       -d     Enable debug output.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulseaudio(1), pasuspender(1), ld.so(8)

Manuals                                                                                            User                                                                                          padsp(1)
