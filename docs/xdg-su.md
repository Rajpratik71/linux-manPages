XDG-SU(1)                                                                                       xdg-su Manual                                                                                       XDG-SU(1)



NAME
       xdg-su - run a GUI program as root after prompting for the root password

SYNOPSIS
       xdg-su [-u user] -c command

       xdg-su {--help | --manual | --version}

DESCRIPTION
       xdg-su provides a graphical dialog that prompts the user for a password to run command as user or as root if no user was specified.

       xdg-su is for use inside a desktop session only.

       xdg-su discards any stdout and stderr output from command.

OPTIONS
       -u user
           run command as user. The default is to run as root.

       --help
           Show command synopsis.

       --manual
           Show this manual page.

       --version
           Show the xdg-utils version information.

EXIT CODES
       An exit code of 0 indicates success while a non-zero exit code indicates failure. The following failure codes can be returned:

       1
           Error in command line syntax.

       2
           One of the files passed on the command line did not exist.

       3
           A required tool could not be found.

       4
           The action failed.

SEE ALSO
       su(1)

EXAMPLES
           xdg-su -u root -c "/opt/shinythings/bin/install-GUI --install fast"

       Runs the /opt/shinythings/bin/install-GUI command with root permissions.

AUTHORS
       Kevin Krammer
           Author.

       Jeremy White
           Author.

COPYRIGHT
       Copyright © 2006



This is release 0.5 of the xdg                                                                    01/24/2015                                                                                        XDG-SU(1)
