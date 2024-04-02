PWHISTORY_HELPER(8)                                                                            Linux-PAM Manual                                                                           PWHISTORY_HELPER(8)



NAME
       pwhistory_helper - Helper binary that transfers password hashes from passwd or shadow to opasswd

SYNOPSIS
       pwhistory_helper [...]

DESCRIPTION
       pwhistory_helper is a helper program for the pam_pwhistory module that transfers password hashes from passwd or shadow file to the opasswd file and checks a password supplied by user against the
       existing hashes in the opasswd file.

       The purpose of the helper is to enable tighter confinement of login and password changing services. The helper is thus called only when SELinux is enabled on the system.

       The interface of the helper - command line options, and input/output data format are internal to the pam_pwhistory module and it should not be called directly from applications.

SEE ALSO
       pam_pwhistory(8)

AUTHOR
       Written by Tomas Mraz based on the code originally in pam_pwhistory and pam_unix modules.



Linux-PAM Manual                                                                                  04/11/2018                                                                              PWHISTORY_HELPER(8)
