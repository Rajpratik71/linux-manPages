lchage(1)                                                                                  General Commands Manual                                                                                  lchage(1)



NAME
       lchage - Display or change user password policy


SYNOPSIS
       lchage [OPTION]... user


DESCRIPTION
       Displays or allows changing password policy of user.


OPTIONS
       -d, --date=days
              Set the date of last password change to days after Jan 1 1970.

              Set days to -1 to disable password expiration (i.e. to ignore --mindays, and --maxdays and related settings).

              Set days to 0 to enforce password change on next login.  (This also disables password expiration until the password is changed.)


       -E, --expire=days
              Set the account expiration date to days after Jan 1 1970.  Set days to -1 to disable account expiration.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -I, --inactive=days
              Disable the account after days after password expires (after the user is required to change the password).  Set days to -1 to keep the account enabled indefinitely after password expiration.


       -l, --list
              Only list current user's policy and make no changes.


       -m, --mindays=days
              Require at least days days between password changes.  Set days to 0 or -1 to disable this requirement.

              If this value is larger than the value set by --maxdays, the user cannot change the pasword.


       -M, --maxdays=days
              Require changing the password after days since last password change.  Set days to -1 to disable password expiration.


       -W, --warndays=days
              Start warning the user days before password expires (before the user is required to change the password).  Set days to 0 or -1 to disable the warning.


EXIT STATUS
       The exit status is 0 on success, nonzero on error.


NOTES
       Note  that  “account  expiration”  (set  by --expire) is distinct from “password expiration” (set by --maxdays).  Account expiration happens on a fixed date regardless of password changes.  Password
       expiration is relative to the date of last password change.



libuser                                                                                           Nov 8 2012                                                                                        lchage(1)
