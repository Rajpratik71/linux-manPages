lchsh(1)                                                                                   General Commands Manual                                                                                   lchsh(1)



NAME
       lchsh - Change login shell


SYNOPSIS
       lchsh [OPTION]... [user]


DESCRIPTION
       Displays and allows changing login shell of user.

       If the user argument is not provided, username of the invoking user is used; the user argument is ignored if lchsh is run set-uid to a different user.

       Entering an empty string (by pressing Enter) at the "New Shell" prompt is interpreted as accepting the current value.


OPTIONS
       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


EXIT STATUS
       The exit status is 0 on success, 1 on error.


BUGS
       lchsh ignores /etc/shells.



libuser                                                                                          Sep 20 2004                                                                                         lchsh(1)
