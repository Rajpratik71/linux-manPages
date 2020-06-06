RECON-RPC(1)                           General Commands Manual                           RECON-RPC(1)

NAME
       recon-rpc - RPC interface for recon-ng

SYNOPSIS
       recon-rpc [-h] [-t [jsonrpc|xmlrpc]] [-a address] [-p port]

DESCRIPTION
       Provide  3rd  party  tools  with  a  standardized protocol for accessing the data gathered and
       stored by the framework. Both JSONRPC and XMLRPC protocols are supported, as well as MultiCall
       objects, and session IDs are used to provide a multi-user environment

OPTIONS
       -h, --help
              show options message and exit

       -t [jsonrpc|xmlrpc]
              Set RPC server type

       -a address
              Set RPC server bind address

       -p port
              Set RPC server port

AUTHOR
       Anthony Miller-Rhodes (@amillerrhodes)

                                                                                         RECON-RPC(1)
