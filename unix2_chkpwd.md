UNIX2_CHKPWD(8)                                                                                Linux-PAM Manual                                                                               UNIX2_CHKPWD(8)



NAME
       unix2_chkpwd - helper binary that verifies the password of the current user

SYNOPSIS
       /sbin/unix2_chkpwd servicename username


DESCRIPTION
       unix2_chkpwd  is  a helper program for applications that verifies the password of the current user.  It is not intended to be run directly from the command line and logs a security violation if done
       so.

       It is typically installed setuid root or setgid shadow and called by applications, which only wishes to do an user authentification and nothing more.


OPTIONS
       unix2_chkpwd requires the following arguments:

       pam_service
              The name of the service using unix2_chkpwd. This is required to be one of the services in /etc/pam.d

       username
              The name of the user whose password you want to verify.


INPUTS
       unix2_chkpwd expects the password via stdin.


RETURN CODES
       unix2_chkpwd has the following return codes:

       1      unix2_chkpwd was inappropriately called from the command line or the password is incorrect.


       0      The password is correct.


HISTORY
       Written by Olaf Kirch loosely based on unix_chkpwd by Andrew Morgan


SEE ALSO
       pam(8)


AUTHOR
       Emily Ratliff.



Linux-PAM 0.76                                                                                    2003-03-21                                                                                  UNIX2_CHKPWD(8)
