REQUEST-KEY(8)                                            Linux Key Management Utilities                                            REQUEST-KEY(8)

NAME
       request-key - Handle key instantiation callback requests from the kernel

SYNOPSIS
       /sbin/request-key <op> <key> <uid> <gid> <threadring> <processring>      <sessionring> [<info>]

DESCRIPTION
       This  program  is invoked by the kernel when the kernel is asked for a key that it doesn't have immediately available. The kernel creates a
       partially set up key and then calls out to this program to instantiate it. It is not intended to be called directly.

ERRORS
       All errors will be logged to the syslog.

FILES
       /etc/request-key.conf Instantiation handler configuration file.

       /etc/request-key.d/<keytype>.conf Keytype specific configuration file.

SEE ALSO
       keyctl(1), request-key.conf(5)

Linux                                                               15 Nov 2011                                                     REQUEST-KEY(8)
