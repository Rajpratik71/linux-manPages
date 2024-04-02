IPSEC(8)                                                                                     Executable programs                                                                                     IPSEC(8)



NAME
       ipsec - invoke IPsec utilities

SYNOPSIS
       ipsec command [argument...] ipsec --help
             ipsec --version
             ipsec --directory

DESCRIPTION
       ipsec invokes any of several utilities involved in controlling the IPsec encryption/authentication system, running the specified command with the specified arguments as if it had been invoked
       directly. This largely eliminates possible name collisions with other software, and also permits some centralized services.

       ipsec --help lists the available commands. Most have their own manual pages, e.g.  ipsec_auto(8) for auto.

       ipsec --version outputs the software version. A version code of the form ``Uxxx/Kyyy'' indicates that the user-level utilities are version xxx but the kernel portion appears to be version yyy (this
       form is used only if the two disagree). For the NETKEY/XFRM stack, the kernel version is used, always displaying the U/K split.

       ipsec --directory reports where ipsec thinks the IPsec commands are stored.

COMMANDS
       To get a list of supported commands, use ipsec --help. A few of the commonly used commands are described below

       ipsec setup start|stop|restart maps to the host init system. Supported init systems are sysv, systemd, upstart and openrc.

       ipsec barf dumps the internal system status to stdout for debugging

       ipsec auto is used to manually add, remove, up or down connections. For more information see 'man ipsec_auto

       ipsec whack is used to communicate direct commands to the pluto daemon using the whack interface. For more information see 'man ipsec_pluto'

       ipsec initnss initialises the NSS database that contains all the X.509 certificate information and private RSA keys

       ipsec checknss [--settrusts] is used to check the NSS database and initialize it when it is not present and optionally set trust bits for CA certificates.

       ipsec import is used to import PKCS#12 X.509 files into the NSS database

       ipsec checknflog is used to initialise iptables rules for the nflog devices when specified via the nflog= or nflog-all= configuration options.

       ipsec stopnflog is used to delete iptables rules for the nflog devices.

RETURN CODE
       The ipsec command passes the return code of the sub-command back to the caller. The only exception is when ipsec pluto is used without --nofork, as it will fork into the background and the ipsec
       command returns success while the pluto daemon may in fact exit with an error code after the fork.

FILES
       /usr/libexec/ipsec usual utilities directory

SEE ALSO
       ipsec.conf(5), ipsec.secrets(5), ipsec_auto(8), ipsec_checknss(8), ipsec_initnss(8), ipsec_setup(8), ipsec_showhostkey(8)

AUTHOR
       Henry Spencer



libreswan                                                                                         07/03/2019                                                                                         IPSEC(8)
