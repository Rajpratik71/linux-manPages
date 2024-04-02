selinuxconlist(1)                                                                     SELinux Command Line documentation                                                                    selinuxconlist(1)



NAME
       selinuxconlist - list all SELinux context reachable for user

SYNOPSIS
       selinuxconlist [-l level] user [context]


DESCRIPTION
       selinuxconlist reports the list of context reachable for user from the current context or specified context

       -l level mcs/mls level


AUTHOR
       This manual page was written by Dan Walsh <dwalsh@redhat.com>.


SEE ALSO
       secon(8), selinuxdefcon(8)



dwalsh@redhat.com                                                                                 7 May 2008                                                                                selinuxconlist(1)
