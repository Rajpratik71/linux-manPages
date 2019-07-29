LDAPMODIFY(1)                                                 General Commands Manual                                                LDAPMODIFY(1)

NAME
       ldapmodify, ldapadd - LDAP modify entry and LDAP add entry tools

SYNOPSIS
       ldapmodify  [-V[V]]  [-d debuglevel]  [-n]  [-v]  [-a]  [-c]  [-f file] [-S file] [-M[M]] [-x] [-D binddn] [-W] [-w passwd] [-y passwdfile]
       [-H ldapuri] [-h ldaphost] [-p ldapport] [-P {2|3}] [-e [!]ext[=extparam]] [-E [!]ext[=extparam]] [-o opt[=optparam]]  [-O security-proper‐
       ties] [-I] [-Q] [-N] [-U authcid] [-R realm] [-X authzid] [-Y mech] [-Z[Z]]

       ldapadd  [-V[V]]  [-d debuglevel] [-n] [-v] [-c] [-f file] [-S file] [-M[M]] [-x] [-D binddn] [-W] [-w passwd] [-y passwdfile] [-H ldapuri]
       [-h ldaphost] [-p ldapport] [-P {2|3}] [-e [!]ext[=extparam]] [-E [!]ext[=extparam]] [-o opt[=optparam]] [-O security-properties] [-I] [-Q]
       [-N] [-U authcid] [-R realm] [-X authzid] [-Y mech] [-Z[Z]]

DESCRIPTION
       ldapmodify  is  a  shell-accessible  interface  to the ldap_add_ext(3), ldap_modify_ext(3), ldap_delete_ext(3) and ldap_rename(3).  library
       calls.  ldapadd is implemented as a hard link to the ldapmodify tool.  When invoked as ldapadd the -a (add new entry)  flag  is  turned  on
       automatically.

       ldapmodify opens a connection to an LDAP server, binds, and modifies or adds entries.  The entry information is read from standard input or
       from file through the use of the -f option.

OPTIONS
       -V[V]  Print version info.  If -VV is given, only the version information is printed.

       -d debuglevel
              Set the LDAP debugging level to debuglevel.  ldapmodify must be compiled with LDAP_DEBUG defined for this option to have any effect.

       -n     Show what would be done, but don't actually modify entries.  Useful for debugging in conjunction with -v.

       -v     Use verbose mode, with many diagnostics written to standard output.

       -a     Add new entries.  The default for ldapmodify is to modify existing entries.  If invoked as ldapadd, this flag is always set.

       -c     Continuous operation mode.  Errors are reported, but ldapmodify will continue with modifications.  The  default  is  to  exit  after
              reporting an error.

       -f file
              Read the entry modification information from file instead of from standard input.

       -S file
              Add  or  change records which were skipped due to an error are written to file and the error message returned by the server is added
              as a comment. Most useful in conjunction with -c.

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

              Specify general extensions with -e and modify extensions with -E.  ´!´ indicates criticality.

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

              Modify extensions:
                [!]txn[=abort|commit]

       -o opt[=optparam]]

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
       The contents of file (or standard input if no -f flag is given on the command line) must conform to the format defined in ldif(5) (LDIF  as
       defined in RFC 2849).

EXAMPLES
       Assuming that the file /tmp/entrymods exists and has the contents:

           dn: cn=Modify Me,dc=example,dc=com
           changetype: modify
           replace: mail
           mail: modme@example.com
           -
           add: title
           title: Grand Poobah
           -
           add: jpegPhoto
           jpegPhoto:< file:///tmp/modme.jpeg
           -
           delete: description
           -

       the command:

           ldapmodify -f /tmp/entrymods

       will  replace the contents of the "Modify Me" entry's mail attribute with the value "modme@example.com", add a title of "Grand Poobah", and
       the contents of the file "/tmp/modme.jpeg" as a jpegPhoto, and completely remove the description attribute.

       Assuming that the file /tmp/newentry exists and has the contents:

           dn: cn=Barbara Jensen,dc=example,dc=com
           objectClass: person
           cn: Barbara Jensen
           cn: Babs Jensen
           sn: Jensen
           title: the world's most famous mythical manager
           mail: bjensen@example.com
           uid: bjensen

       the command:

           ldapadd -f /tmp/newentry

       will add a new entry for Babs Jensen, using the values from the file /tmp/newentry.

       Assuming that the file /tmp/entrymods exists and has the contents:

           dn: cn=Barbara Jensen,dc=example,dc=com
           changetype: delete

       the command:

           ldapmodify -f /tmp/entrymods

       will remove Babs Jensen's entry.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

SEE ALSO
       ldapadd(1), ldapdelete(1), ldapmodrdn(1), ldapsearch(1), ldap.conf(5), ldap(3),  ldap_add_ext(3),  ldap_delete_ext(3),  ldap_modify_ext(3),
       ldap_modrdn_ext(3), ldif(5).

AUTHOR
       The OpenLDAP Project <http://www.openldap.org/>

ACKNOWLEDGEMENTS
       OpenLDAP  Software  is developed and maintained by The OpenLDAP Project <http://www.openldap.org/>.  OpenLDAP Software is derived from Uni‐
       versity of Michigan LDAP 3.3 Release.

OpenLDAP                                                            2015/08/14                                                       LDAPMODIFY(1)
