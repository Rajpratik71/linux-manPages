MKHOMEDIR_HELPER(8)                        Linux-PAM Manual                        MKHOMEDIR_HELPER(8)

NAME
       mkhomedir_helper - Helper binary that creates home directories

SYNOPSIS
       mkhomedir_helper {user} [umask [ path-to-skel ]]

DESCRIPTION
       mkhomedir_helper is a helper program for the pam_mkhomedir module that creates home directories
       and populates them with contents of the specified skel directory.

       The default value of umask is 0022 and the default value of path-to-skel is /etc/skel.

       The helper is separated from the module to not require direct access from login SELinux domains
       to the contents of user home directories. The SELinux domain transition happens when the module
       is executing the mkhomedir_helper.

       The helper never touches home directories if they already exist.

SEE ALSO
       pam_mkhomedir(8)

AUTHOR
       Written by Tomas Mraz based on the code originally in pam_mkhomedir module.

Linux-PAM Manual                              05/18/2017                           MKHOMEDIR_HELPER(8)
