pam_console_apply(8)                                                                    System Administrator's Manual                                                                    pam_console_apply(8)



NAME
       pam_console_apply - set or revoke permissions for users at the system console

SYNOPSIS
       pam_console_apply [-f <fstab file>] [-c <console.perms file>] [-r] [-t <tty>] [-s] [-d] [<device file> ...]

DESCRIPTION
       pam_console_apply is a helper executable which sets or resets permissions on device nodes.
       If  /var/run/console.lock  exists,  pam_console_apply  will  grant  permissions  to the user listed therein.  If the lock file does not exist, permissions are reset according to defaults set in con‐
       sole.perms files, normally configured to set permissions on devices so that root owns them.

       When initializing its configuration it first parses the /etc/security/console.perms file and then it searches for files ending with the .perms suffix in the /etc/security/console.perms.d  directory.
       These files are parsed in the lexical order in "C" locale.  Permission rules are appended to a global list, console and device class definitions override previous definitions of the same class.

ARGUMENTS
       -c     Load other console.perms file than the default one.

       -f     Load other fstab file than the default one (/etc/fstab).

       -r     Signals  pam_console_apply  to reset permissions.  The default is to set permissions so that the user listed in /var/run/console.lock has access to the devices, and to reset permissions if no
              such file exists.

       -t     Use <tty> to match console class in console.perms file. The default is tty0.

       -s     Write error messages to the system log instead of stderr.

       -d     Log/display messages useful for debugging.

       The optional <device file> arguments constrain what files should be affected by pam_console_apply. If they aren't specified permissions are changed on all files specified in the console.perms file.

FILES
       /var/run/console.lock
       /etc/security/console.perms
       /etc/security/console.perms.d/50-default.perms

SEE ALSO
       pam_console(8)
       console.perms(5)

BUGS
       Let's hope not, but if you find any, please report them via the "Bug Track" link at http://bugzilla.redhat.com/bugzilla/

AUTHORS
       Nalin Dahyabhai <nalin@redhat.com>, using code shamelessly stolen from parts of pam_console.
       Support of console.perms.d and other improvements by Tomas Mraz <tmraz@redhat.com>.



Red Hat                                                                                            2005/5/2                                                                              pam_console_apply(8)
