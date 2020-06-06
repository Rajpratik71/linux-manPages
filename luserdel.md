luserdel(1)                                                                                General Commands Manual                                                                                luserdel(1)



NAME
       luserdel - Delete an user


SYNOPSIS
       luserdel [OPTION]... user


DESCRIPTION
       Deletes the user with name user.


OPTIONS
       -G, --dontremovegroup
              By default the user's primary group is removed if it has group name user (user's private group).  This option disables this behavior.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -r, --removehome
              Remove user's home directory and mail spool after deleting the user.


EXIT STATUS
       The exit status is 0 on success, nonzero on error.



libuser                                                                                            May 2009                                                                                       luserdel(1)
