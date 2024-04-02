fish(1)                                                                fish                                                                fish(1)

NAME
       fish -- the friendly interactive shell

   Synopsis
       fish [OPTIONS] [-c command] [FILE [ARGUMENTS...]]

   Description
       fish is a command-line shell written mainly with interactive use in mind. The full manual is available in HTML by using the help command
       from inside fish.

       The following options are available:

       · -c or --command=COMMANDS evaluate the specified commands instead of reading from the commandline

       · -d or --debug-level=DEBUG_LEVEL specify the verbosity level of fish. A higher number means higher verbosity. The default level is 1.

       · -i or --interactive specify that fish is to run in interactive mode

       · -l or --login specify that fish is to run as a login shell

       · -n or --no-execute do not execute any commands, only perform syntax checking

       · -p or --profile=PROFILE_FILE when fish exits, output timing information on all executed commands to the specified file

       · -v or --version display version and exit

       The fish exit status is generally the exit status of the last foreground command. If fish is exiting because of a parse error, the exit
       status is 127.

Version 2.2.0                                                     Wed Dec 16 2015                                                          fish(1)
