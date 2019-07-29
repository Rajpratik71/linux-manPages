LDAPWHOAMI(1)                                                 General Commands Manual                                                LDAPWHOAMI(1)

NAME
       ldapwhoami - LDAP who am i? tool

SYNOPSIS
       ldapwhoami  [-V[V]]  [-d debuglevel]  [-n]  [-v] [-x] [-D binddn] [-W] [-w passwd] [-y passwdfile] [-H ldapuri] [-h ldaphost] [-p ldapport]
       [-e [!]ext[=extparam]]  [-E [!]ext[=extparam]]  [-o opt[=optparam]]  [-O security-properties]  [-I]  [-Q]  [-N]   [-U authcid]   [-R realm]
       [-X authzid] [-Y mech] [-Z[Z]]

DESCRIPTION
       ldapwhoami implements the LDAP "Who Am I?" extended operation.

       ldapwhoami opens a connection to an LDAP server, binds, and performs a whoami operation.

OPTIONS
       -V[V]  Print version info.  If -VV is given, only the version information is printed.

       -d debuglevel
              Set the LDAP debugging level to debuglevel.  ldapwhoami must be compiled with LDAP_DEBUG defined for this option to have any effect.

       -n     Show what would be done, but don't actually perform the whoami operation.  Useful for debugging in conjunction with -v.

       -v     Run in verbose mode, with many diagnostics written to standard output.

       -x     Use simple authentication instead of SASL.

       -D binddn
              Use the Distinguished Name binddn to bind to the LDAP directory.  For SASL binds, the server is expected to ignore this value.

       -W     Prompt for simple authentication.  This is used instead of specifying the password on the command line.

       -w passwd
              Use passwd as the password for simple authentication.

       -y passwdfile
              Use complete contents of passwdfile as the password for simple authentication.

       -H ldapuri
              Specify  URI(s)  referring to the ldap server(s); only the protocol/host/port fields are allowed; a list of URI, separated by white‐
              space or commas is expected.

       -h ldaphost
              Specify an alternate host on which the ldap server is running.  Deprecated in favor of -H.

       -p ldapport
              Specify an alternate TCP port where the ldap server is listening.  Deprecated in favor of -H.

       -e [!]ext[=extparam]

       -E [!]ext[=extparam]

              Specify general extensions with -e and whoami extensions with -E.  ´!´ indicates criticality.

              General extensions:
                [!]assert=<filter>    (an RFC 4515 Filter)
                !authzid=<authzid>    ("dn:<dn>" or "u:<user>")
                [!]bauthzid           (RFC 3829 authzid control)
                [!]chaining[=<resolve>[/<cont>]]
                [!]manageDSAit
                [!]noop
                ppolicy
                [!]postread[=<attrs>] (a comma-separated attribute list)
                [!]preread[=<attrs>]  (a comma-separated attribute list)
                [!]relax
                sessiontracking
                abandon,cancel,ignore (SIGINT sends abandon/cancel,
                or ignores response; if critical, doesn't wait for SIGINT.
                not really controls)

              WhoAmI extensions:
                (none)

       -o opt[=optparam]

              Specify general options.

              General options:
                nettimeout=<timeout>  (in seconds, or "none" or "max")
                ldif-wrap=<width>     (in columns, or "no" for no wrapping)

       -O security-properties
              Specify SASL security properties.

       -I     Enable SASL Interactive mode.  Always prompt.  Default is to prompt only as needed.

       -Q     Enable SASL Quiet mode.  Never prompt.

       -N     Do not use reverse DNS to canonicalize SASL host name.

       -U authcid
              Specify the authentication ID for SASL bind. The form of the ID depends on the actual SASL mechanism used.

       -R realm
              Specify the realm of authentication ID for SASL bind. The form of the realm depends on the actual SASL mechanism used.

       -X authzid
              Specify the requested authorization ID for SASL bind.  authzid must be one of the  following  formats:  dn:<distinguished  name>  or
              u:<username>

       -Y mech
              Specify  the  SASL  mechanism  to  be used for authentication. If it's not specified, the program will choose the best mechanism the
              server knows.

       -Z[Z]  Issue StartTLS (Transport Layer Security) extended operation. If you use -ZZ, the command will require the operation to be  success‐
              ful.

EXAMPLE
           ldapwhoami -x -D "cn=Manager,dc=example,dc=com" -W

SEE ALSO
       ldap.conf(5), ldap(3), ldap_extended_operation(3)

AUTHOR
       The OpenLDAP Project <http://www.openldap.org/>

ACKNOWLEDGEMENTS
       OpenLDAP  Software  is developed and maintained by The OpenLDAP Project <http://www.openldap.org/>.  OpenLDAP Software is derived from Uni‐
       versity of Michigan LDAP 3.3 Release.

OpenLDAP                                                            2015/08/14                                                       LDAPWHOAMI(1)
