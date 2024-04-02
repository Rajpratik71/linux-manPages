SYNTAX-VALIDATE.PL(8)                                                                      System Manager's Manual                                                                      SYNTAX-VALIDATE.PL(8)



NAME
       syntax-validate.pl - Directory Server perl script for validating attribute syntax.

SYNOPSIS
       syntax-validate.pl [-Z serverID] [-D rootdn] { -w password | -w - | -j filename } -b baseDN [-f filter] [-P protocol] [-h]

DESCRIPTION
       Syntax  validation  checks  every modification to attributes to make sure that the new value has the required syntax for that attribute type. All attribute syntaxes are validated against the defini‐
       tions in RFC 4514.

OPTIONS
       A summary of options is included below:

       -Z Server Identifier
              The server ID of the Directory Server instance.  If there is only one instance on the system, this option can be skipped.

       -D Root DN
              The Directory Manager DN, or root DN.  If not specified, the script will search the server instance configuration for the value.

       -w password
              The rootdn password.

       -w -
              Prompt for the rootdn password.

       -j password filename
              The name of the file that contains the root DN password.

       -b baseDN
              Gives the base DN for the entries to validate.

       -f filter
              Contains a search filter to use to select a subset of entries to validate. If this is not given, then all entries under the base DN are checked.

       -P protocol
              The connection protocol to connect to the Directory Server.  Protocols are STARTTLS, LDAPS, LDAPI, and LDAP.  If this option is skipped, the most secure protocol that is  available  is  used.
              For LDAPI, AUTOBIND is also available for the root user.

       -h
              Display usage

EXAMPLE
       syntax-validate.pl -Z instance2 -D 'cn=directory manager' -w password -b 'dc=example,dc=com' -f 'cn=*' -P STARTTLS

              Note: security must be enabled to use protocol STARTTLS.  If STARTTLS is not available it will default to next strongest/available protocol automatically.

DIAGNOSTICS
       Exit status is zero if no errors occur.  Errors result in a non-zero exit status and a diagnostic message being written to standard error.

AUTHOR
       syntax-validate.pl was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                March 31, 2017                                                                          SYNTAX-VALIDATE.PL(8)
