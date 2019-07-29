LDAPURL(1)                                                    General Commands Manual                                                   LDAPURL(1)

NAME
       ldapurl - LDAP URL formatting tool

SYNOPSIS
       ldapurl  [-a attrs]  [-b searchbase]  [-e [!]ext[=extparam]]  [-E [!]ext[=extparam]]  [-f filter]  [-H ldapuri] [-h ldaphost] [-p ldapport]
       [-s {base|one|sub|children}] [-S scheme]

DESCRIPTION
       ldapurl is a command that allows to either compose or decompose LDAP URIs.

       When invoked with the -H option, ldapurl extracts the components of the ldapuri option argument, unescaping hex-escaped chars as  required.
       It  basically  acts  as a frontend to the ldap_url_parse(3) call.  Otherwise, it builds an LDAP URI based on the components passed with the
       appropriate options, performing the inverse operation.  Option -H is incompatible with options -a, -b, -E, -f, -H, -h, -p, -S, and -s.

OPTIONS
       -a attrs
              Set a comma-separated list of attribute selectors.

       -b searchbase
              Set the searchbase.

       -e [!]ext[=extparam]

              Specify general extensions with -e ´!´ indicates criticality.

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

       -E [!]ext[=extparam]
              Set URL extensions; incompatible with -H.

       -f filter
              Set the URL filter.  No particular check on conformity with RFC 4515 LDAP filters is performed, but  the  value  is  hex-escaped  as
              required.

       -H ldapuri
              Specify URI to be exploded.

       -h ldaphost
              Set the host.

       -p ldapport
              Set the TCP port.

       -S scheme
              Set the URL scheme.  Defaults for other fields, like ldapport, may depend on the value of scheme.

       -s {base|one|sub|children}
              Specify  the  scope of the search to be one of base, one, sub, or children to specify a base object, one-level, subtree, or children
              search.  The default is sub.  Note: children scope requires LDAPv3 subordinate feature extension.

OUTPUT FORMAT
       If the -H option is used, the ldapuri supplied is exploded in its components, which are printed to standard output in an LDIF-like form.

       Otherwise, the URI built using the values passed with the other options is printed to standard output.

EXAMPLE
       The following command:

           ldapurl -h ldap.example.com -b dc=example,dc=com -s sub -f "(cn=Some One)"

       returns

           ldap://ldap.example.com:389/dc=example,dc=com??sub?(cn=Some%20One)

       The command:

           ldapurl -H ldap://ldap.example.com:389/dc=example,dc=com??sub?(cn=Some%20One)

       returns

           scheme: ldap
           host: ldap.example.com
           port: 389
           dn: dc=example,dc=com
           scope: sub
           filter: (cn=Some One)

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

SEE ALSO
       ldap(3), ldap_url_parse(3),

AUTHOR
       The OpenLDAP Project <http://www.openldap.org/>

ACKNOWLEDGEMENTS
       OpenLDAP Software is developed and maintained by The OpenLDAP Project <http://www.openldap.org/>.  OpenLDAP Software is derived  from  Uni‐
       versity of Michigan LDAP 3.3 Release.

OpenLDAP                                                            2015/08/14                                                          LDAPURL(1)
