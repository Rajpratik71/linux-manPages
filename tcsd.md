tcsd(8)                                                                                    System Manager's Manual                                                                                    tcsd(8)



                                                                                             TCG Software Stack

NAME
       tcsd - daemon that manages Trusted Computing resources

SYNOPSIS
       tcsd [-f] [-e] [-c <configfile> ] [-h]


DESCRIPTION
       Trousers is an open-source TCG Software Stack (TSS), released under the BSD License. Trousers aims to be compliant with the current (1.1b) and upcoming (1.2) TSS specifications available from the
       Trusted Computing Group website: http://www.trustedcomputinggroup.org.

       tcsd is a user space daemon that should be (according to the TSS spec) the only portal to the TPM device driver. At boot time, tcsd should be started, it should open the TPM device driver and from
       that point on, all requests to the TPM should go through the TSS stack. The tcsd manages TPM resources and handles requests from TSP's both local and remote.


       -f, --foreground
              run the daemon in the foreground


       -e     attempt to connect to software TPMs over TCP


       -c, --config <configfile>
              use the provided configuration file rather than the default configuration file


       -h, --help
              display help message


ACCESS CONTROL
       There are two types of access control for the tcsd, access to the daemon's socket itself and access to specific commands internal to the tcsd. Access to the tcsd's port should be controlled by the
       system administrator using firewall rules.  If using iptables, the following rule will allow a specific host access to the tcsd:

       # iptables -A INPUT -s $IP_ADDRESS -p tcp --destination-port 30003 -j ACCEPT

       Access to individual commands internal to the tcsd is configured by the tcsd configuration file's "remote_ops" directive. Each function call in the TCS API is reachable by a unique ordinal.  Each
       labeled "remote op" actually defines a set of ordinals (usually more than one) necessary to accomplish the operation. So, for example, the "random" operation enables the ordinals for opening and
       closing a context, calling TCS_StirRandom and TCS_GetRandom, as well as TCS_FreeMemory. By default, connections from localhost will allow any ordinals.


DATA FILES
       TSS applications have access to 2 different kinds of 'persistant' storage. 'User' persistant storage has the lifetime of that of the application using it and therefore is destroyed when an
       application exits.  User PS is controlled by the TSP of the application.  'System' persistent storage is controlled by the TCS and stays valid across application lifetimes, tcsd restarts and system
       resets. Data registered in system PS stays valid until an application requests that it be removed. User PS files are by default stored as /var/lib/tpm/user.{pid} and the system PS file by default is
       /var/lib/tpm/system.data.  The system PS file is initially created when ownership of the TPM is first taken.


CONFIGURATION
       tcsd configuration is stored by default in /etc/tcsd.conf


DEBUG OUTPUT
       If TrouSerS has been compiled with debugging enabled, the debugging output can be supressed by setting the TSS_DEBUG_OFF environment variable.


DEVICE DRIVERS
       tcsd is compatible with the IBM Research TPM device driver available from http://ibmswtpm.sourceforge.net/ and the TPM device driver available from http://sf.net/projects/tpmdd, which is also
       available in the upstream Linux kernel and many Linux distros.


CONFORMING TO
       tcsd conforms to the Trusted Computing Group Software Specification version 1.1 Golden


SEE ALSO
       tcsd.conf(5)


AUTHOR
       Kent Yoder


REPORTING BUGS
       Report bugs to <trousers-tech@lists.sf.net>



TSS 1.1                                                                                           2005-03-15                                                                                          tcsd(8)
