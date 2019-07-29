KEY.DNS_RESOLVER(8)                                       Linux Key Management Utilities                                       KEY.DNS_RESOLVER(8)

NAME
       key.dns_resolver - Upcall for request-key to handle dns_resolver keys

SYNOPSIS
       /sbin/key.dns_resolver <key>
       /sbin/key.dns_resolver -D [-v] [-v] <keydesc> <calloutinfo>

DESCRIPTION
       This  program is invoked by request-key on behalf of the kernel when kernel services (such as NFS, CIFS and AFS) want to perform a hostname
       lookup and the kernel does not have the key cached.  It is not ordinarily intended to be called directly.

       It can be called in debugging mode to test its functionality by passing a -D flag on the command line.  For this to work, the key  descrip‐
       tion and the callout information must be supplied.  Verbosity can be increased by supplying one or more -v flags.

ERRORS
       All errors will be logged to the syslog.

SEE ALSO
       request-key(8), request-key.conf(5)

Linux                                                               04 Mar 2011                                                KEY.DNS_RESOLVER(8)
