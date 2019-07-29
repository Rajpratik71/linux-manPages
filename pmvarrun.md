pmvarrun(8)                                                                                       pam_mount                                                                                       pmvarrun(8)



Name
       pmvarrun - updates /var/run/pam_mount/user

Syntax
       pmvarrun -u user [options]

Description
       A  separate  program  is needed so that /var/run/pam_mount/user may be created with a pam_mount-specific security context (otherwise SELinux policy will conflict with gdm, which also creates file in
       /var/run).

       pmvarrun is flexible and can run in a number of different security setups:

   root-root
       When pmvarrun is invoked as root, /var/run/pam_mount's permission settings can be as strict as needed; usually (0755,root,root) is a good pick as it gives users the debug  control  over  their  ref-
       count. Refcount files are given their respective owners (chowned to the user who logs in).

   user-user
       When  invoked  as the user who logs in, /var/run/pam_mount needs appropriate permissions to create a file, which means the write bit must be set. It is also highly suggested to set the sticky bit in
       this case, so other users do not tamper with your refcount.

   root-user
       Some programs or login helpers incorrectly call the PAM stack in a way that the login phase is done as root and the logout phase as a normal user.  Nevertheless, pmvarrun supports this, and the same
       permissions as in root-root can be used. While the user may not be able to unlink his file from /var/run/pam_mount, it will be truncated to indicate the same state.

Options
       --help, -h
              Display help.

       --user user, -u user
              User to handle, must be a valid username.

       --operation number, -o number
              Increase volume count by number.

       -d     Turn on debugging.

Files
       /var/run/pam_mount/user

Author
       This manpage was originally written by Bastian Kleineidam <calvin@debian.org> for the Debian distribution of libpam-mount but may be used by others.

       See /usr/share/doc/packages/pam_mount/AUTHORS for the list of original authors of pam_mount.



pam_mount                                                                                         2008-10-08                                                                                      pmvarrun(8)
