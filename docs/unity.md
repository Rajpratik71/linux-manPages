unity(1)                                                                                   Linux User's Manual                                                                                   unity(1)

NAME
       unity - wrapper for starting the unity shell and handling fallback

SYNOPSIS
       unity [options]

DESCRIPTION
       The unity program can be used to start the Unity shell as a compiz module, and to specify how to handle logging, debugging, as well as how to deal with the user's profile.

OPTIONS
       --advanced-debug
              Runs unity under debugging (using gdb or another debugger tool) to help tracking issues. Should only be used on request from a developer following a bug report.

       --compiz-path COMPIZ_PATH
              Runs the compositor from a non-standard location.

       --debug
              Runs Unity under gdb and prints a stack trace on crash.

       -h, --help
              Prints a usage message and exits.

       --log filename
              This parameter, followed by a path or filename, tells the Unity shell to store logs in the specified file.

       --replace
              Deprecated option for backwards compatibility.  Has no effect.

       --reset-icons
              Resets the default Launcher icons.

       -v, --version
              Shows the program version number and exits.

       --verbose

SEE ALSO
       unity-panel-service (1)

                                                                                              09 August 2014                                                                                     unity(1)
