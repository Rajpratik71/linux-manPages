ICEAUTH(1)                                                                               General Commands Manual                                                                               ICEAUTH(1)

NAME
       iceauth - ICE authority file utility

SYNOPSIS
       iceauth [ -f authfile ] [ -vqib ] [ command arg ... ]

DESCRIPTION
       The  iceauth  program  is  used to edit and display the authorization information used in connecting with ICE.  This program is usually used to extract authorization records from one machine and
       merge them in on another (as is the case when using remote logins or granting access to other users).  Commands (described below) may be entered interactively, on the iceauth command line, or in
       scripts.

OPTIONS
       -f authfile  Name of the authority file to use. Will default to
                    the file currently in use by the session.

       -v           Turns on extra messages (verbose mode)

       -q           Turns off extra messages (quiet mode)

       -i           Ignore the locks on the authority file

       -b           Break the locks on the authority file

       -u           Print basic usage instructions

       -V           Print version and exit

USAGE
       When iceauth is run it will allow the following set of commands to be entered interactively or in scripts.

       ?

       List available commands.

       help

       Print help information. You may supply a command name to help to get specific information about it.

       info

       Print information about the entries in the authority file.

       list

       List (print) entries in the authority file. You may specify optional modifiers as below to specify which entries are listed.

       list [ protocol_name ] [ protocol_data ] [ netid ] [ authname ]

       add

       Add an entry to the authority file. This must be in the format

       add protocol_name protocol_data netid authname authdata

       remove

       Remove entries from the authority file.

       remove [ protocol_name ] [ protocol_data ] [ netid ] [ authname ]

       extract

       Extract  entries from the authority file in to a destination file. You must supply the path to the destination to this command as in the following format. Optional specifiers allow you to narrow
       which entries are extracted.

       extract filename [ protocol_name ] [ protocol_data ] [ netid ] [ authname ]

       merge

       Merge entries from other files in to the authority file selected by the program. You may supply any number of file paths to this command as follows:

       merge filename1 [ filename2 ] [ filename3 ] ...

       exit

       Save changes and exit the program.

       quit

       Abort changes and exit the program without saving.

       source

       Read and execute commands from a file.

       source filename

AUTHOR
       Ralph Mor, X Consortium

X Version 11                                                                                  iceauth 1.0.7                                                                                    ICEAUTH(1)
