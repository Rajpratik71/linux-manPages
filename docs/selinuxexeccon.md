selinuxexeccon(8)                                                                     SELinux Command Line documentation                                                                    selinuxexeccon(8)



NAME
       selinuxexeccon - report SELinux context used for this executable

SYNOPSIS
       selinuxexeccon command [fromcon]

DESCRIPTION
       selinuxexeccon reports the SELinux process context for the specified command from the specified context or the current context.

EXAMPLE
       # selinuxexeccon /usr/bin/passwd
       staff_u:staff_r:passwd_t:s0-s0:c0.c1023

       # selinuxexeccon /usr/sbin/sendmail system_u:system_r:httpd_t:s0
       system_u:system_r:system_mail_t:s0

AUTHOR
       This manual page was written by Dan Walsh <dwalsh@redhat.com>.

SEE ALSO
       secon(8)



dwalsh@redhat.com                                                                                14 May 2011                                                                                selinuxexeccon(8)
