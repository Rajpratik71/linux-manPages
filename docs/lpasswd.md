lpasswd(1)                                                                                 General Commands Manual                                                                                 lpasswd(1)



NAME
       lpasswd - Change group or user password


SYNOPSIS
       lpasswd [OPTION]... [name]


DESCRIPTION
       Changes password of user or group name.

       If the name argument is not provided, username of the invoking user is used; the name argument is ignored if lpasswd is run set-uid to a different user.

       Entering an empty password (by pressing Enter) aborts the password setting operation.


OPTIONS
       -F, --plainpassword-fd=fd
              Read password from file descriptor fd, terminated by end of file, '\r' or '\n'.


       -f, --password-fd=fd
              Read password hash from file descriptor fd, terminated by end of file, '\r' or '\n'.


       -g, --group
              Change password of group name.  By default the password of user name is changed.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -P, --plainpassword=password
              Set the password to password.  Note that the password can be viewed while running lpasswd using tools such as ps(1).


       -p, --password=encrypted
              Set the password to the password represented by the hash encrypted.  Note that the hash can be viewed while running lpasswd using tools such as ps(1).


EXIT STATUS
       The exit status is 0 on success, nonzero on error.



libuser                                                                                          Jan 12 2005                                                                                       lpasswd(1)
