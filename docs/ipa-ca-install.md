ipa-ca-install(1)                                                                              IPA Manual Pages                                                                             ipa-ca-install(1)



NAME
       ipa-ca-install - Install a CA on a server

SYNOPSIS
   DOMAIN LEVEL 0
       ipa-ca-install [OPTION]... [replica_file]

   DOMAIN LEVEL 1
       ipa-ca-install [OPTION]...

DESCRIPTION
       Adds a CA as an IPA-managed service. This requires that the IPA server is already installed and configured.

       In a domain at domain level 0, you can run ipa-ca-install without replica_file to upgrade from CA-less to CA-full, or with replica_file to install the CA service on the replica.

       The replica_file is created using the ipa-replica-prepare utility and should be the same one used when originally installing the replica.

       In a domain at domain level 1, ipa-ca-install can be used to upgrade from CA-less to CA-full or to install the CA service on a replica, and does not require any replica file.

OPTIONS
       -d, --debug Enable debug logging when more verbose output is needed

       -p DM_PASSWORD, --password=DM_PASSWORD
              Directory Manager (existing master) password

       -w ADMIN_PASSWORD, --admin-password=ADMIN_PASSWORD
              Admin user Kerberos password used for connection check

       --external-ca
              Generate a CSR for the IPA CA certificate to be signed by an external CA.

       --external-ca-type=TYPE
              Type of the external CA. Possible values are "generic", "ms-cs". Default value is "generic". Use "ms-cs" to include the template name required by Microsoft Certificate Services (MS CS) in the
              generated CSR (see --external-ca-profile for full details).


       --external-ca-profile=PROFILE_SPEC
              Specify the certificate profile or template to use at the external CA.

              When --external-ca-type is "ms-cs" the following specifiers may be used:


              <oid>:<majorVersion>[:<minorVersion>]
                     Specify a certificate template by OID and major version, optionally also specifying minor version.

              <name> Specify a certificate template by name.  The name cannot contain any : characters and cannot be an OID (otherwise the OID-based template specifier syntax takes precedence).

              default
                     If no template is specified, the template name "SubCA" is used.


       --external-cert-file=FILE
              File containing the IPA CA certificate and the external CA certificate chain. The file is accepted in PEM and DER certificate and PKCS#7 certificate chain formats. This  option  may  be  used
              multiple times.

       --ca-subject=SUBJECT
              The CA certificate subject DN (default CN=Certificate Authority,O=REALM.NAME).  RDNs are in LDAP order (most specific RDN first).

       --subject-base=SUBJECT
              The subject base for certificates issued by IPA (default O=REALM.NAME).  RDNs are in LDAP order (most specific RDN first).

       --ca-signing-algorithm=ALGORITHM
              Signing  algorithm of the IPA CA certificate. Possible values are SHA1withRSA, SHA256withRSA, SHA512withRSA. Default value is SHA256withRSA. Use this option with --external-ca if the external
              CA does not support the default signing algorithm.

       --no-host-dns
              Do not use DNS for hostname lookup during installation

       --skip-conncheck
              Skip connection check to remote master

       --skip-schema-check
              Skip check for updated CA DS schema on the remote master

       -U, --unattended
              An unattended installation that will never prompt for user input

EXIT STATUS
       0 if the command was successful

       1 if an error occurred



IPA                                                                                              Mar 30 2017                                                                                ipa-ca-install(1)
