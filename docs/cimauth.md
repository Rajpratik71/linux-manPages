cimauth(8)                                                                                                                                                                                         cimauth(8)



NAME
       cimauth - add, modify, remove, or list CIM namespace authorizations of users

SYNOPSIS
       cimauth -a -u username -n namespace [ -R ] [ -W ]

       cimauth -m -u username -n namespace [ -R ] [ -W ]

       cimauth -r -u username [ -n namespace ]

       cimauth -l

       cimauth -h

       cimauth --help

       cimauth --version


DESCRIPTION
       The cimauth command manages read and write CIM namespace authorizations of users. The operations are executed on the local host by submitting requests to the CIM Server.  If the value of the config‐
       uration property enableNamespaceAuthorization is True , the CIM Server restricts access to namespaces based on user authorizations configured via cimauth .  Changes to "Dynamic" authorization param‐
       eters  does  not require the CIM Server to be restarted. "Non Dynamic" configuration properties (E.g. enableNamespaceAuthorization ) can only be set as planned configuration and the CIM Server needs
       to be restarted to realize the change.  (See cimconfig (8) for information on configuring the CIM Server.)

   Options
       The cimauth command recognizes the following options:

              -a             Adds read and/or write authorizations to the specified user on the specified namespace.  If neither the -R nor the -W option is specified, adds a read authorization by default.

              -h, --help     Display command usage information.

              -l             Lists all the authorizations configured in the CIM Server.

              -m             Modifies authorizations of the specified user on the specified namespace.  If neither the -R nor the -W option is specified, modifies the authorization to be a read  authoriza‐
                             tion by default.

              -n namespace   Specifies the R namespace for the operation.

              -r             Removes authorizations of the specified user on the specified namespace.  If no namespaces are specified, removes authorizations on all namespaces for the specified user.

              -R             Specifies read authorization on the namespace.

              -u username    Specifies the user for the operation.  The specified R username must represent a valid user on the local host.

              --version      Display CIM Server version number.

              -W             Specifies write authorization on the namespace.

EXIT STATUS
       When an error occurs, an error message is written to stderr and an error value of 1 is returned. The following return values are returned:

              0      Successful completion
              1      Error

USAGE NOTE
       The cimauth command requires that the CIM Server is running.

EXAMPLES
       Add read authorizations to user "guest" on namespace "root/cimv2".

              cimauth -a -u guest -n root/cimv2 -R

       Add read and write authorizations to user "guest" on namespace "root/system".

              cimauth -a -u guest -n root/system -R -W

       Modify authorizations of the user "guest" on namespace "root/system" to read only.

              cimauth -m -u guest -n root/system -R

       Remove the authorizations of the user "guest" on namespace "root/system".

              cimauth -r -u guest -n root/system

       List all the authorizations configured in the CIM Server.

              cimauth -l

SEE ALSO
       cimserver(8), cimconfig(8).



                                                                                                                                                                                                   cimauth(8)
