RIFLE(1)                                                           rifle manual                                                           RIFLE(1)

NAME
       rifle - ranger's file opener

SYNOPSIS
       rifle [--help] [-f FLAGS] [-l] [-p KEYWORD] [-w PROGRAM] files

DESCRIPTION
       rifle is a powerful file executor that allows for complex file type checking, written to meet the needs of the file manager ranger.
       rifle's strength lies in automatically determining file types, depending on which programs are installed on the system, even without any
       user interaction.

OPTIONS
       -f FLAGS      Specify flags for opening the files.  Flags are letters that changes how the program is executed.  Any combination of flags
                     will work.  Writing uppercase flags will negate the effect of all previously used lowercase flags of the same letter.

                     Table of all flags:
                      f   fork program to background
                      r   run program as root, using sudo
                      t   run program in a separate terminal, as specified by $TERMCMD

       -l            List all possible ways to open the specified files.  Each line will contain information in the format of
                     id:label:flags:command. id is the identification number. label is an arbitrary string that was specified for this command,
                     flags are the flags that are used by default, and command is the command that is going to be executed.

       -p KEYWORD    Pick a method to open the files.

                     KEYWORD is either the ID number listed by "rifle -l" or a string that matches a label in the configuration file.

       -w PROGRAM    Open the files with the program PROGRAM

       -h, --help    Print a list of options and exit.

FILES
       rifle shares configuration files with ranger, though ranger is not required in order to use rifle.  The configuration file rifle.conf is
       expected to be at ~/.config/ranger/rifle.conf.

       This file specifies patterns for determining the commands to open files with.  The syntax is described in the comments of the default
       rifle.conf that ships with ranger.  To obtain it, you need to run: "ranger --copy-config=rifle"

ENVIRONMENT
       EDITOR  Determines which editor to use for editing files (in the default rifle.conf).

       PAGER   Determines which pager to use for displaying files (in the default rifle.conf).

       TERMCMD Determines the terminal emulator command for use with the t flag.  It is required that the value is the path to an executable file
               which accepts the "-e COMMAND" argument.

       XDG_CONFIG_HOME
               Specifies the directory for configuration files. Defaults to $HOME/.config.

EXAMPLES
       List all the different methods:

        $ rifle -l helloworld.py
        0:editor::"$EDITOR" -- "$@"
        1:pager::"$PAGER" -- "$@"
        2:::python -- "$1"

       Display its content by opening it with "cat":

        $ rifle -w cat helloworld.py
        print("Hello World!")

       Run it by picking the method 2, which calls 'python -- "$1"':

        $ rifle -p 2 helloworld.py
        Hello World!

       Display the file in a pager inside a new terminal, run as root:

        $ rifle -p 1 -f tr helloworld.py

05/04/2015                                                          rifle-1.7.1                                                           RIFLE(1)
