SOLISTEN(8)                                                   System Manager's Manual                                                  SOLISTEN(8)

NAME
       solisten - Trace listening socket

SYNOPSIS
       usage: solisten [-h] [--show-netns] [-p PID] [-n NETNS]

DESCRIPTION
       All IPv4 and IPv6 listen attempts are traced, even if they ultimately fail or the listening program is not willing to accept().

   optional arguments:
       -h, --help
              show this help message and exit

       --show-netns
              show network namespace

       -p PID, --pid PID
              trace this PID only

       -n NETNS, --netns NETNS
              trace this Network Namespace only

EXAMPLES
       Stream socket listen:
              # solisten

       Stream socket listen for specified PID only
              # solisten -p 1234

       Stream socket listen for the specified network namespace ID only
              # solisten --netns 4242

       Show network ns ID (useful for containers)
              # solisten --show-netns

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

USER COMMANDS                                                       2019-07-29                                                         SOLISTEN(8)
