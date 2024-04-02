LOAD_POLICY(8)                                                                                       NSA                                                                                       LOAD_POLICY(8)



NAME
       load_policy - load a new SELinux policy into the kernel


SYNOPSIS
       load_policy [-qi]

DESCRIPTION
       load_policy  loads  the  installed policy file into the kernel.  The existing policy boolean values are automatically preserved across policy reloads rather than being reset to the default values in
       the policy file.


OPTIONS
       -q     suppress warning messages.

       -i     initial policy load. Only use this if this is the first time policy is being loaded since boot (usually called from initramfs).


EXIT STATUS
       0      Success

       1      Invalid option

       2      Policy load failed

       3      Initial policy load failed and enforcing mode requested

SEE ALSO
       booleans (8),

AUTHORS
       This manual page was written by Dan Walsh <dwalsh@redhat.com>.
       The program was written by Stephen Smalley <sds@epoch.ncsc.mil>.



Security Enhanced Linux                                                                            May 2003                                                                                    LOAD_POLICY(8)
