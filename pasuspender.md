pasuspender(1)                                                                           General Commands Manual                                                                           pasuspender(1)

NAME
       pasuspender - Temporarily suspend PulseAudio

SYNOPSIS
       pasuspender [options] -- PROGRAM [ARGUMENTS ...]

       pasuspender --help

       pasuspender --version

DESCRIPTION
       pasuspender  is  a tool that can be used to tell a local PulseAudio sound server to temporarily suspend access to the audio devices, to allow other applications access them directly. pasuspender
       will suspend access to the audio devices, fork a child process, and when the child process terminates, resume access again.

       Make sure to include -- in your pasuspender command line before passing the subprocess command line (as shown above). Otherwise pasuspender itself might end  up  interpreting  the  command  line
       switches and options you intended to pass to the subprocess.

OPTIONS
       -h | --help
              Show help.

       --version
              Show version information.

       -s | --server=SERVER
              Specify the sound server to connect to.

AUTHORS
       The PulseAudio Developers <pulseaudio-discuss (at) lists (dot) freedesktop (dot) org>; PulseAudio is available from http://pulseaudio.org/

SEE ALSO
       pulseaudio(1), padsp(1), pacmd(1), pactl(1)

Manuals                                                                                            User                                                                                    pasuspender(1)
