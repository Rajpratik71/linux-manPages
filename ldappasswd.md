LDAPPASSWD(1)                                                 General Commands Manual                                                LDAPPASSWD(1)

NAME
       ldappasswd - change the password of an LDAP entry

SYNOPSIS
       ldappasswd [-V[V]] [-d debuglevel] [-n] [-v] [-A] [-a oldPasswd] [-t oldpasswdfile] [-S] [-s newPasswd] [-T newpasswdfile] [-x] [-D binddn]
       [-W] [-w passwd] [-y passwdfile] [-H ldapuri] [-h ldaphost] [-p ldapport] [-e [!]ext[=extparam]] [-E [!]ext[=extparam]] [-o opt[=optparam]]
       [-O security-properties] [-I] [-Q] [-N] [-U authcid] [-R realm] [-X authzid] [-Y mech] [-Z[Z]] [user]

DESCRIPTION
       ldappasswd is a tool to set the password of an LDAP user.  ldappasswd uses the LDAPv3 Password Modify (RFC 3062) extended operation.

       ldappasswd  sets  the  password of associated with the user [or an optionally specified user].  If the new password is not specified on the
       command line and the user doesn't enable prompting, the server will be asked to generate a password for the user.

       ldappasswd is neither designed nor intended to be a replacement for passwd(1) and should not be installed as such.

OPTIONS
       -V[V]  Print version info.  If -VV is given, only the version information is printed.

       -d debuglevel
              Set the LDAP debugging level to debuglevel.  ldappasswd must be compiled with LDAP_DEBUG defined for this option to have any effect.

       -n     Do not set password. (Can be useful when used in conjunction with -v or -d)

       -v     Increase the verbosity of output.  Can be specified multiple times.

       -A     Prompt for old password.  This is used instead of specifying the password on the command line.

       -a oldPasswd
              Set the old password to oldPasswd.

       -t oldPasswdFile
              Set the old password to the contents of oldPasswdFile.

       -S     Prompt for new password.  This is used instead of specifying the password on the command line.

       -s newPasswd
              Set the new password to newPasswd.

       -T newPasswdFile
              Set the new password to the contents of newPasswdFile.

       -x     Use simple authentication instead of SASL.

       -D binddn
              Use the Distinguished Name binddn to bind to the LDAP directory.  For SASL binds, the server is expected to ignore this value.

       -W     Prompt for bind password.  This is used instead of specifying the password on the command line.

       -w passwd
              Use passwd as the password to bind with.

       -y passwdfile
              Use complete contents of passwdfile as the password for simple authentication.

       -H ldapuri
              Specify URI(s) referring to the ldap server(s); only the protocol/host/port fields are allowed; a list of URI, separated  by  white‐
              space or commas is expected.

       -h ldaphost
              Specify an alternate host on which the ldap server is running.  Deprecated in favor of -H.

       -p ldapport
              Specify an alternate TCP port where the ldap server is listening.  Deprecated in favor of -H.

       -e [!]ext[=extparam]

       -E [!]ext[=extparam]

              Specify general extensions with -e and passwd modify extensions with -E.  ´!´ indicates criticality.

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

              Passwd Modify extensions:
                (none)

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
              u:<username>.

       -Y mech
              Specify the SASL mechanism to be used for authentication. If it's not specified, the program will  choose  the  best  mechanism  the
              server knows.

       -Z[Z]  Issue  StartTLS (Transport Layer Security) extended operation. If you use -ZZ, the command will require the operation to be success‐
              ful

SEE ALSO
       ldap_sasl_bind(3), ldap_extended_operation(3), ldap_start_tls_s(3)

AUTHOR
       The OpenLDAP Project <http://www.openldap.org/>

ACKNOWLEDGEMENTS
       OpenLDAP Software is developed and maintained by The OpenLDAP Project <http://www.openldap.org/>.  OpenLDAP Software is derived  from  Uni‐
       versity of Michigan LDAP 3.3 Release.

OpenLDAP                                                            2015/08/14                                                       LDAPPASSWD(1)
