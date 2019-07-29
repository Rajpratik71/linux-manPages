P11-KIT(8)                                                        System Commands                                                       P11-KIT(8)

NAME
       p11-kit - Tool for operating on configured PKCS#11 modules

SYNOPSIS
       p11-kit list-modules

       p11-kit extract ...

DESCRIPTION
       p11-kit is a command line tool that can be used to perform operations on PKCS#11 modules configured on the system.

       See the various sub commands below. The following global options can be used:

       -v, --verbose
           Run in verbose mode with debug output.

       -q, --quiet
           Run in quiet mode without warning or failure messages.

LIST MODULES
       List system configured PKCS#11 modules.

           $ p11-kit list-modules

       The modules, information about them and the tokens present in the PKCS#11 modules will be displayed.

EXTRACT
       Extract certificates from configured PKCS#11 modules.

       See trust(1) for more information

EXTRACT TRUST
       Extract standard trust information files.

       See trust(1) for more information

REMOTE
       Run a PKCS#11 module remotely.

           $ p11-kit remote /path/to/pkcs11-module.so

       This is not meant to be run directly from a terminal. But rather in a remote option in a pkcs11.conf(5) file.

BUGS
       Please send bug reports to either the distribution bug tracker or the upstream bug tracker at
       https://bugs.freedesktop.org/enter_bug.cgi?product=p11-glue&component=p11-kit.

SEE ALSO
       pkcs11.conf(5)

       Further details available in the p11-kit online documentation at http://p11-glue.freedesktop.org/doc/p11-kit/.

p11-kit                                                                                                                                 P11-KIT(8)
