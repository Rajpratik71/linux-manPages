lchfn(1)                                                                                   General Commands Manual                                                                                   lchfn(1)



NAME
       lchfn - Change finger information


SYNOPSIS
       lchfn [OPTION]... [user]


DESCRIPTION
       Displays and allows changing information about user that is available using the finger(1) command (usually stored in the "gecos" field of /etc/passwd).

       If the user argument is not provided, username of the invoking user is used; the user argument is ignored if lchfn is run set-uid to a different user.

       Entering  an  empty  string  (by pressing Enter) at a prompt is interpreted as accepting a default value; to erase an attribute (or to use an empty string as the attribute value), enter a single dot
       character.


OPTIONS
       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


EXIT STATUS
       The exit status is 0 on success, 1 on error.



libuser                                                                                          Sep 20 2004                                                                                         lchfn(1)
