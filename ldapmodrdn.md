LDAPMODRDN(1)                                                 General Commands Manual                                                LDAPMODRDN(1)

NAME
       ldapmodrdn - LDAP rename entry tool

SYNOPSIS
       ldapmodrdn  [-V[V]]  [-d debuglevel]  [-n]  [-v]  [-r] [-s newsup] [-c] [-f file] [-M[M]] [-x] [-D binddn] [-W] [-w passwd] [-y passwdfile]
       [-H ldapuri] [-h ldaphost] [-p ldapport] [-P {2|3}] [-e [!]ext[=extparam]] [-E [!]ext[=extparam]] [-o opt[=optparam]]  [-O security-proper‐
       ties] [-I] [-Q] [-N] [-U authcid] [-R realm] [-X authzid] [-Y mech] [-Z[Z]] [dn rdn]

DESCRIPTION
       ldapmodrdn is a shell-accessible interface to the ldap_rename(3) library call.

       ldapmodrdn  opens  a  connection  to  an  LDAP server, binds, and modifies the RDN of entries.  The entry information is read from standard
       input, from file through the use of the -f option, or from the command-line pair dn and rdn.

OPTIONS
       -V[V]  Print version info.  If -VV is given, only the version information is printed.

       -d debuglevel
              Set the LDAP debugging level to debuglevel.  ldapmodrdn must be compiled with LDAP_DEBUG defined for this option to have any effect.

       -n     Show what would be done, but don't actually change entries.  Useful for debugging in conjunction with -v.

       -v     Use verbose mode, with many diagnostics written to standard output.

       -r     Remove old RDN values from the entry.  Default is to keep old values.

       -s newsup
              Specify a new superior entry. (I.e., move the target entry and make it a child of the new superior.)  This option is  not  supported
              in LDAPv2.

       -c     Continuous  operation  mode.   Errors   are  reported,  but ldapmodrdn will  continue  with  modifications.   The default is to exit
              after reporting an error.

       -f file
              Read the entry modification information from file instead of from standard input or the command-line.

       -M[M]  Enable manage DSA IT control.  -MM makes control critical.

       -x     Use simple authentication instead of SASL.

       -D binddn
              Use the Distinguished Name binddn to bind to the LDAP directory.  For SASL binds, the server is expected to ignore this value.

       -W     Prompt for simple authentication.  This is used instead of specifying the password on the command line.

       -w passwd
              Use passwd as the password for simple authentication.

       -y passwdfile
              Use complete contents of passwdfile as the password for simple authentication.

       -H ldapuri
              Specify URI(s) referring to the ldap server(s); only the protocol/host/port fields are allowed; a list of URI, separated  by  white‐
              space or commas is expected.

       -h ldaphost
              Specify an alternate host on which the ldap server is running.  Deprecated in favor of -H.

       -p ldapport
              Specify an alternate TCP port where the ldap server is listening.  Deprecated in favor of -H.

       -P {2|3}
              Specify the LDAP protocol version to use.

       -e [!]ext[=extparam]

       -E [!]ext[=extparam]

              Specify general extensions with -e and modrdn extensions with -E.  ´!´ indicates criticality.

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

              Modrdn extensions:
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
              Specify  the  requested  authorization  ID  for SASL bind.  authzid must be one of the following formats: dn:<distinguished name> or
              u:<username>

       -Y mech
              Specify the SASL mechanism to be used for authentication. If it's not specified, the program will  choose  the  best  mechanism  the
              server knows.

       -Z[Z]  Issue  StartTLS (Transport Layer Security) extended operation. If you use -ZZ, the command will require the operation to be success‐
              ful.

INPUT FORMAT
       If the command-line arguments dn and rdn are given, rdn will replace the RDN of the entry specified by the DN, dn.

       Otherwise, the contents of file (or standard input if no -f flag is given) should consist of one or more entries.

           Distinguished Name (DN)
           Relative Distinguished Name (RDN)

       One or more blank lines may be used to separate each DN/RDN pair.

EXAMPLE
       Assuming that the file /tmp/entrymods exists and has the contents:

           cn=Modify Me,dc=example,dc=com
           cn=The New Me

       the command:

           ldapmodrdn -r -f /tmp/entrymods

       will change the RDN of the "Modify Me" entry from "Modify Me" to "The New Me" and the old cn, "Modify Me" will be removed.

DIAGNOSTICS
       Exit status is 0 if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

SEE ALSO
       ldapadd(1), ldapdelete(1), ldapmodify(1), ldapsearch(1), ldap.conf(5), ldap(3), ldap_rename(3)

AUTHOR
       The OpenLDAP Project <http://www.openldap.org/>

ACKNOWLEDGEMENTS
       OpenLDAP Software is developed and maintained by The OpenLDAP Project <http://www.openldap.org/>.  OpenLDAP Software is derived  from  Uni‐
       versity of Michigan LDAP 3.3 Release.

OpenLDAP                                                            2015/08/14                                                       LDAPMODRDN(1)
