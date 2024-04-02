SSR-GLINJECT(1)                                                    User Commands                                                   SSR-GLINJECT(1)

NAME
       ssr-glinject - Run a command while injecting the SimpleScreenRecorder GLInject library.

SYNOPSIS
       ssr-glinject [OPTIONS] [--] COMMAND

DESCRIPTION
       This script uses LD_PRELOAD to inject the GLInject library into the given command, so that SimpleScreenRecorder can record it. It should be
       safe to use this on all applications (including command-line programs and shell scripts).  If the program doesn't  use  OpenGL,  it  should
       have no effect. If you find a program that crashes or behaves incorrectly when GLInject is used, please submit a bug report.

OPTIONS
       --help Show help message.

       --glx-debug
              Enables GLX debugging. This may reduce the performance and print lots of error messages, but it is useful to track down bugs.

       --relax-permissions
              Uses  mode  666 instead of 600 for shared memory, so that other users can record the stream. This is insecure and should not be used
              on a computer that can be accessed by other users that you don't trust.

       --channel=CHANNEL
              Channel name to use. The default is 'channel-USERNAME'.

SEE ALSO
       More documentation can be found at http://www.maartenbaert.be/simplescreenrecorder/.

SimpleScreenRecorder                                                March 2015                                                     SSR-GLINJECT(1)
