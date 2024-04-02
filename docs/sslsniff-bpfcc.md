sslsniff(8)                                                   System Manager's Manual                                                  sslsniff(8)

NAME
       sslsniff - Print data passed to OpenSSL, GnuTLS or NSS. Uses Linux eBPF/bcc.

SYNOPSIS
       sslsniff [-h] [-p PID] [-c COMM] [-o] [-g] [-n] [-d]

DESCRIPTION
       sslsniff  prints  data sent to write/send and read/recv functions of OpenSSL, GnuTLS and NSS, allowing us to read plain text content before
       encryption (when writing) and after decryption (when reading).

       This works reading the second parameter of both functions (*buf).

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Print all calls to SSL write/send and read/recv system-wide:
              # sslsniff

FIELDS
       FUNC   Which function is being called (write/send or read/recv)

       TIME   Time of the command, in seconds.

       COMM   Entered command.

       PID    Process ID calling SSL.

       LEN    Bytes written or read by SSL functions.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHORS
       Adrian Lopez and Mark Drayton

SEE ALSO
       trace(8)

USER COMMANDS                                                       2016-08-16                                                         sslsniff(8)
