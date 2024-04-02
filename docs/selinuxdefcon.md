selinuxdefcon(1)                                                                      SELinux Command Line documentation                                                                     selinuxdefcon(1)



NAME
       selinuxdefcon - report default SELinux context for user


SYNOPSIS
       selinuxdefcon [-l level] user fromcon


DESCRIPTION
       selinuxdefcon reports the default context for the specified user from the specified context

       -l level mcs/mls level


EXAMPLE
       # selinuxdefcon jsmith system_u:system_r:sshd_t:s0
       unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023


AUTHOR
       This manual page was written by Dan Walsh <dwalsh@redhat.com>.


SEE ALSO
       secon(8), selinuxconlist(8)



dwalsh@redhat.com                                                                                 7 May 2008                                                                                 selinuxdefcon(1)
