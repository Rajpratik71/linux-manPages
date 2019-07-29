NOLOGIN(8)                                                                                  System Administration                                                                                  NOLOGIN(8)



NAME
       nologin - politely refuse a login

SYNOPSIS
       nologin [-V] [-h]

DESCRIPTION
       nologin displays a message that an account is not available and exits non-zero.  It is intended as a replacement shell field to deny login access to an account.

       If the file /etc/nologin.txt exists, nologin displays its contents to the user instead of the default message.

       The exit code returned by nologin is always 1.

OPTIONS
       -h, --help
              Display help text and exit.

       -V, --version
              Display version information and exit.

NOTES
       nologin is a per-account way to disable login (usually used for system accounts like http or ftp).  nologin(8) uses /etc/nologin.txt as an optional source for a non-default message, the login access
       is always refused independently of the file.

       pam_nologin(8) PAM module usually prevents all non-root users from logging into the system.  pam_nologin(8) functionality is controlled by /var/run/nologin or the /etc/nologin file.

AUTHORS
       Karel Zak ⟨kzak@redhat.com⟩

SEE ALSO
       login(1), passwd(5), pam_nologin(8)

HISTORY
       The nologin command appeared in 4.4BSD.

AVAILABILITY
       The nologin command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                      September 2013                                                                                     NOLOGIN(8)
