lid(1)                                                                                     General Commands Manual                                                                                     lid(1)



NAME
       lid - Display user's groups or group's users


SYNOPSIS
       lid [OPTION]... [name]


DESCRIPTION
       Displays information about groups containing user name, or users contained in group name.

       By default lid lists groups containing user name, or groups containing the invoking user if name is not specified; the mode of operation can be changed using the -g option.


OPTIONS
       -g, --group
              List users in a group name, or in the invoking user's primary group if name is not specified.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -n, --onlynames
              List only group or user names.  By default the corresponging user or group IDs are listed too.


EXIT STATUS
       The exit status is 0 on success, 1 on error.



libuser                                                                                           Dec 6 2007                                                                                           lid(1)
