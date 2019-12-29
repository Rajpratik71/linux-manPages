P11-KIT(8)                                  System Commands                                 P11-KIT(8)

NAME
       p11-kit - Tool for operating on configured PKCS#11 modules

SYNOPSIS
       p11-kit list-modules

       p11-kit extract ...

       p11-kit server ...

DESCRIPTION
       p11-kit is a command line tool that can be used to perform operations on PKCS#11 modules
       configured on the system.

       See the various sub commands below. The following global options can be used:

       -v, --verbose
           Run in verbose mode with debug output.

       -q, --quiet
           Run in quiet mode without warning or failure messages.

LIST MODULES
       List system configured PKCS#11 modules.

           $ p11-kit list-modules

       The modules, information about them and the tokens present in the PKCS#11 modules will be
       displayed.

EXTRACT
       Extract certificates from configured PKCS#11 modules.

       This operation has been moved to a separate command trust extract. See trust(1) for more
       information

SERVER
       Run a server process that exposes PKCS#11 module remotely.

           $ p11-kit server pkcs11:token1 pkcs11:token2 ...
           $ p11-kit server --provider /path/to/pkcs11-module.so pkcs11:token1 pkcs11:token2 ...

       This launches a server that exposes the given PKCS#11 tokens on a local socket. The tokens must
       belong to the same module. To access the socket, use p11-kit-client.so module. The server
       address and PID are printed as a shell-script snippet which sets the appropriate environment
       variable: P11_KIT_SERVER_ADDRESS and P11_KIT_SERVER_PID.

EXTRACT TRUST
       Extract standard trust information files.

       This operation has been moved to a separate command trust extract-compat. See trust(1) for more
       information

REMOTE
       Run a PKCS#11 module remotely.

           $ p11-kit remote /path/to/pkcs11-module.so
           $ p11-kit remote pkcs11:token1 pkcs11:token2 ...

       This is not meant to be run directly from a terminal. But rather in a remote option in a
       pkcs11.conf(5) file.

       This exposes the given PKCS#11 module or tokens over standard input and output. Those two
       forms, whether to expose a module or tokens, are mutually exclusive and if the second form is
       used, the tokens must belong to the same module.

BUGS
       Please send bug reports to either the distribution bug tracker or the upstream bug tracker at
       https://github.com/p11-glue/p11-kit/issues/.

SEE ALSO
       pkcs11.conf(5)

       Further details available in the p11-kit online documentation at
       https://p11-glue.github.io/p11-glue/p11-kit/manual/.

p11-kit                                                                                     P11-KIT(8)
