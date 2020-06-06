UNIX_CHKPWD(8)                                                                               Linux-PAM Manual                                                                              UNIX_CHKPWD(8)

NAME
       unix_chkpwd - Helper binary that verifies the password of the current user

SYNOPSIS
       unix_chkpwd [...]

DESCRIPTION
       unix_chkpwd is a helper program for the pam_unix module that verifies the password of the current user. It also checks password and account expiration dates in shadow. It is not intended to be
       run directly from the command line and logs a security violation if done so.

       It is typically installed setuid root or setgid shadow.

       The interface of the helper - command line options, and input/output data format are internal to the pam_unix module and it should not be called directly from applications.

SEE ALSO
       pam_unix(8)

AUTHOR
       Written by Andrew Morgan and other various people.

Linux-PAM Manual                                                                                09/19/2013                                                                                 UNIX_CHKPWD(8)
