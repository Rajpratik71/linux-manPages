pkidestroy(8)                                                                            PKI Instance Removal Utility                                                                           pkidestroy(8)



NAME
       pkidestroy - Removes a subsystem from an instance of Certificate Server.


SYNOPSIS
       pkidestroy -s <subsystem> -i <instance> [-u <secutiry domain username>] [-W <security domain password file>] [-h] [-v] [-p <prefix>]


DESCRIPTION
       Removes a subsystem from an instance of Certificate Server.  This utility removes any of the Java-based Certificate Server subsystems (CA, KRA, OCSP, and TKS).

       An instance can contain multiple subsystems, although it may contain at most one of each type of subsystem.  So, for example, an instance could contain CA and KRA subsystems,  but not two CA subsys‐
       tems.  If pkidestroy is invoked on the last subsystem in the instance, then that instance is removed.  Typically, as subsystems need to contact the CA to update the security domain, the CA  instance
       should be the last instance to be removed.


OPTIONS
       -s <subsystem>
              Specifies the subsystem to be removed, where <subsystem> is CA, KRA, OCSP, or TKS. If this option is not specified, pkidestroy will prompt for its value.

       -i <instance>
              Specifies the name of the instance from which the subsystem should be removed.  The instance is located at /var/log/pki/<instance>. If this option is not specified, pkidestroy will prompt for
              its value.

       -u <security domain username>
              Specifies the username of the security domain of the subsystem. This is an optional parameter.

       -W <security domain password file>
              Specifies the file containing the password of the security domain of the subsystem. This is an optional parameter.

       -h, --help
              Prints additional help information.

       -v     Displays verbose information about the installation.  This flag can be provided multiple times to increase verbosity.  See pkidestroy -h for details.



BUGS
       Report bugs to http://bugzilla.redhat.com.


AUTHORS
       Ade Lee <alee@redhat.com>.  pkidestroy was written by the Certificate Server project.


COPYRIGHT
       Copyright (c) 2012 Red Hat, Inc. This  is  licensed  under  the  GNU  General  Public  License,  version  2  (GPLv2).  A  copy  of  this  license  is  available  at  http://www.gnu.org/licenses/old-
       licenses/gpl-2.0.txt.


SEE ALSO
       pkispawn(8)



version 1.0                                                                                   December 13, 2012                                                                                 pkidestroy(8)
