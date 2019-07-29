certtool(1)                                                        User Commands                                                       certtool(1)

NAME
       certtool - GnuTLS certificate tool

SYNOPSIS
       certtool [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       Tool  to parse and generate X.509 certificates, requests and private keys.  It can be used interactively or non interactively by specifying
       the template command line option.

       The tool accepts files or URLs supported by GnuTLS. In case PIN is required for the URL access you can provide  it  using  the  environment
       variables GNUTLS_PIN and GNUTLS_SO_PIN.

OPTIONS
       -d number, --debug=number
              Enable debugging.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 9999

              Specifies the debug level.

       -V, --verbose
              More verbose output.  This option may appear an unlimited number of times.

       --infile=file
              Input file.

       --outfile=string
              Output file.

       -s, --generate-self-signed
              Generate a self-signed certificate.

       -c, --generate-certificate
              Generate a signed certificate.

       --generate-proxy
              Generates a proxy certificate.

       --generate-crl
              Generate a CRL.

              This option generates a CRL. When combined with --load-crl it would use the loaded CRL as base for the generated (i.e., all revoked
              certificates in the base will be copied to the new CRL).

       -u, --update-certificate
              Update a signed certificate.

       -p, --generate-privkey
              Generate a private key.

       -q, --generate-request
              Generate a PKCS #10 certificate request.  This option must not appear in combination with any of the following options: infile.

              Will generate a PKCS #10 certificate request. To specify a private key use --load-privkey.

       -e, --verify-chain
              Verify a PEM encoded certificate chain.

              The last certificate in the chain must be a self signed one. It can be combined with --verify-purpose or --verify-hostname.

       --verify
              Verify a PEM encoded certificate chain using a trusted list.

              The trusted certificate list can be loaded with --load-ca-certificate. If no certificate list is provided, then the system's cer‐
              tificate list is used. Note that during verification multiple paths may be explored. On a successful verification the successful
              path will be the last one. It can be combined with --verify-purpose or --verify-hostname.

       --verify-crl
              Verify a CRL using a trusted list.  This option must appear in combination with the following options: load-ca-certificate.

              The trusted certificate list must be loaded with --load-ca-certificate.

       --verify-hostname=string
              Specify a hostname to be used for certificate chain verification.

              This is to be combined with one of the verify certificate options.

       --verify-email=string
              Specify a email to be used for certificate chain verification.  This option must not appear in combination with any of the following
              options: verify-hostname.

              This is to be combined with one of the verify certificate options.

       --verify-purpose=string
              Specify a purpose OID to be used for certificate chain verification.

              This object identifier restricts the purpose of the certificates to be verified. Example purposes are 1.3.6.1.5.5.7.3.1 (TLS WWW),
              1.3.6.1.5.5.7.3.4 (EMAIL) etc. Note that a CA certificate without a purpose set (extended key usage) is valid for any purpose.

       --generate-dh-params
              Generate PKCS #3 encoded Diffie-Hellman parameters.

       --get-dh-params
              Get the included PKCS #3 encoded Diffie-Hellman parameters.

              Returns stored DH parameters in GnuTLS. Those parameters are used in the SRP protocol. The parameters returned by fresh generation
              are more efficient since GnuTLS 3.0.9.

       --dh-info
              Print information PKCS #3 encoded Diffie-Hellman parameters.

       --load-privkey=string
              Loads a private key file.

              This can be either a file or a PKCS #11 URL

       --load-pubkey=string
              Loads a public key file.

              This can be either a file or a PKCS #11 URL

       --load-request=string
              Loads a certificate request file.

       --load-certificate=string
              Loads a certificate file.

              This can be either a file or a PKCS #11 URL

       --load-ca-privkey=string
              Loads the certificate authority's private key file.

              This can be either a file or a PKCS #11 URL

       --load-ca-certificate=string
              Loads the certificate authority's certificate file.

              This can be either a file or a PKCS #11 URL

       --load-crl=string
              Loads the provided CRL.

       --load-data=string
              Loads auxilary data.

       --password=string
              Password to use.

              You can use this option to specify the password in the command line instead of reading it from the tty. Note, that the command line
              arguments are available for view in others in the system. Specifying password as '' is the same as specifying no password.

       --null-password
              Enforce a NULL password.

              This option enforces a NULL password. This is different than the empty or no password in schemas like PKCS #8.

       --empty-password
              Enforce an empty password.

              This option enforces an empty password. This is different than the NULL or no password in schemas like PKCS #8.

       --hex-numbers
              Print big number in an easier format to parse.

       --cprint
              In certain operations it prints the information in C-friendly format.

              In certain operations it prints the information in C-friendly format, suitable for including into C programs.

       -i, --certificate-info
              Print information on the given certificate.

       --fingerprint
              Print the fingerprint of the given certificate.

              This is a simple hash of the DER encoding of the certificate. It can be combined with the --hash parameter. However, it is recom‐
              mended for identification to use the key-id which depends only on the certificate's key.

       --key-id
              Print the key ID of the given certificate.

              This is a hash of the public key of the given certificate. It identifies the key uniquely, remains the same on a certificate renewal
              and depends only on signed fields of the certificate.

       --certificate-pubkey
              Print certificate's public key.

       --pgp-certificate-info
              Print information on the given OpenPGP certificate.

       --pgp-ring-info
              Print information on the given OpenPGP keyring structure.

       -l, --crl-info
              Print information on the given CRL structure.

       --crq-info
              Print information on the given certificate request.

       --no-crq-extensions
              Do not use extensions in certificate requests.

       --p12-info
              Print information on a PKCS #12 structure.

              This option will dump the contents and print the metadata of the provided PKCS #12 structure.

       --p12-name=string
              The PKCS #12 friendly name to use.

              The name to be used for the primary certificate and private key in a PKCS #12 file.

       --p7-generate
              Generate a PKCS #7 structure.

              This option generates a PKCS #7 certificate container structure. To add certificates in the structure use --load-certificate and
              --load-crl.

       --p7-sign
              Signs using a PKCS #7 structure.

              This option generates a PKCS #7 structure containing a signature for the provided data. The data are stored within the structure.
              The signer certificate has to be specified using --load-certificate and --load-privkey.

       --p7-detached-sign
              Signs using a detached PKCS #7 structure.

              This option generates a PKCS #7 structure containing a signature for the provided data. The signer certificate has to be specified
              using --load-certificate and --load-privkey.

       --p7-include-cert, - Fl -no-p7-include-cert
              The signer's certificate will be included in the cert list..  The no-p7-include-cert form will disable the option.  This option is
              enabled by default.

              This options works with --p7-sign or --p7-detached-sign and will include or exclude the signer's certificate into the generated sig‐
              nature.

       --p7-time
              Will include a timestamp in the PKCS #7 structure.

              This option will include a timestamp in the generated signature

       --p7-show-data, - Fl -no-p7-show-data
              Will show the embedded data in the PKCS #7 structure.  The no-p7-show-data form will disable the option.

              This option can be combined with --p7-verify and will display the embedded signed data in the PKCS #7 structure.

       --p7-info
              Print information on a PKCS #7 structure.

       --p7-verify
              Verify the provided PKCS #7 structure.

              This option verifies the signed PKCS #7 structure. The certificate list to use for verification can be specified with --load-ca-cer‐
              tificate. When no certificate list is provided, then the system's certificate list is used. Alternatively a direct signer can be
              provided using --load-certificate. A key purpose can be enforced with the --verify-purpose option, and the --load-data option will
              utilize detached data.

       --p8-info
              Print information on a PKCS #8 structure.

              This option will print information about encrypted PKCS #8 structures. That option does not require the decryption of the structure.

       --smime-to-p7
              Convert S/MIME to PKCS #7 structure.

       -k, --key-info
              Print information on a private key.

       --pgp-key-info
              Print information on an OpenPGP private key.

       --pubkey-info
              Print information on a public key.

              The option combined with --load-request, --load-pubkey, --load-privkey and --load-certificate will extract the public key of the
              object in question.

       --v1   Generate an X.509 version 1 certificate (with no extensions).

       --to-p12
              Generate a PKCS #12 structure.  This option must appear in combination with the following options: load-certificate.

              It requires a certificate, a private key and possibly a CA certificate to be specified.

       --to-p8
              Generate a PKCS #8 structure.

       -8, --pkcs8
              Use PKCS #8 format for private keys.

       --rsa  Generate RSA key.

              When combined with --generate-privkey generates an RSA private key.

       --dsa  Generate DSA key.

              When combined with --generate-privkey generates a DSA private key.

       --ecc  Generate ECC (ECDSA) key.

              When combined with --generate-privkey generates an elliptic curve private key to be used with ECDSA.

       --ecdsa
              This is an alias for the --ecc option.

       --hash=string
              Hash algorithm to use for signing.

              Available hash functions are SHA1, RMD160, SHA256, SHA384, SHA512.

       --inder, - Fl -no-inder
              Use DER format for input certificates, private keys, and DH parameters .  The no-inder form will disable the option.

              The input files will be assumed to be in DER or RAW format.  Unlike options that in PEM input would allow multiple input data (e.g.
              multiple certificates), when reading in DER format a single data structure is read.

       --inraw
              This is an alias for the --inder option.

       --outder, - Fl -no-outder
              Use DER format for output certificates, private keys, and DH parameters.  The no-outder form will disable the option.

              The output will be in DER or RAW format.

       --outraw
              This is an alias for the --outder option.

       --bits=number
              Specify the number of bits for key generate.  This option takes an integer number as its argument.

       --curve=string
              Specify the curve used for EC key generation.

              Supported values are secp192r1, secp224r1, secp256r1, secp384r1 and secp521r1.

       --sec-param=security parameter
              Specify the security level [low, legacy, medium, high, ultra].

              This is alternative to the bits option.

       --disable-quick-random
              No effect.

       --template=string
              Template file to use for non-interactive operation.

       --stdout-info
              Print information to stdout instead of stderr.

       --ask-pass
              Enable interaction for entering password when in batch mode..

              This option will enable interaction to enter password when in batch mode. That is useful when the template option has been speci‐
              fied.

       --pkcs-cipher=cipher
              Cipher to use for PKCS #8 and #12 operations.

              Cipher may be one of 3des, 3des-pkcs12, aes-128, aes-192, aes-256, rc2-40, arcfour.

       --provider=string
              Specify the PKCS #11 provider library.

              This will override the default options in /etc/gnutls/pkcs11.conf

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

FILES
       Certtool's template file format
       A template file can be used to avoid the interactive questions of certtool. Initially create a file named 'cert.cfg' that contains the
       information about the certificate. The template can be used as below:

           $ certtool --generate-certificate --load-privkey key.pem     --template cert.cfg --outfile cert.pem    --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem

       An example certtool template file that can be used to generate a certificate request or a self signed certificate follows.

           # X.509 Certificate options
           #
           # DN options

           # The organization of the subject.
           organization = "Koko inc."

           # The organizational unit of the subject.
           unit = "sleeping dept."

           # The locality of the subject.
           # locality =

           # The state of the certificate owner.
           state = "Attiki"

           # The country of the subject. Two letter code.
           country = GR

           # The common name of the certificate owner.
           cn = "Cindy Lauper"

           # A user id of the certificate owner.
           #uid = "clauper"

           # Set domain components
           #dc = "name"
           #dc = "domain"

           # If the supported DN OIDs are not adequate you can set
           # any OID here.
           # For example set the X.520 Title and the X.520 Pseudonym
           # by using OID and string pairs.
           #dn_oid = 2.5.4.12 Dr.
           #dn_oid = 2.5.4.65 jackal

           # This is deprecated and should not be used in new
           # certificates.
           # pkcs9_email = "none@none.org"

           # An alternative way to set the certificate's distinguished name directly
           # is with the "dn" option. The attribute names allowed are:
           # C (country), street, O (organization), OU (unit), title, CN (common name),
           # L (locality), ST (state), placeOfBirth, gender, countryOfCitizenship,
           # countryOfResidence, serialNumber, telephoneNumber, surName, initials,
           # generationQualifier, givenName, pseudonym, dnQualifier, postalCode, name,
           # businessCategory, DC, UID, jurisdictionOfIncorporationLocalityName,
           # jurisdictionOfIncorporationStateOrProvinceName,
           # jurisdictionOfIncorporationCountryName, XmppAddr, and numeric OIDs.

           #dn = "cn = Nikos,st = New Something,C=GR,surName=Mavrogiannopoulos,2.5.4.9=Arkadias"

           # The serial number of the certificate
           # Comment the field for a time-based serial number.
           serial = 007

           # In how many days, counting from today, this certificate will expire.
           # Use -1 if there is no expiration date.
           expiration_days = 700

           # Alternatively you may set concrete dates and time. The GNU date string
           # formats are accepted. See:
           # http://www.gnu.org/software/tar/manual/html_node/Date-input-formats.html

           #activation_date = "2004-02-29 16:21:42"
           #expiration_date = "2025-02-29 16:24:41"

           # X.509 v3 extensions

           # A dnsname in case of a WWW server.
           #dns_name = "www.none.org"
           #dns_name = "www.morethanone.org"

           # A subject alternative name URI
           #uri = "http://www.example.com"

           # An IP address in case of a server.
           #ip_address = "192.168.1.1"

           # An email in case of a person
           email = "none@none.org"

           # Challenge password used in certificate requests
           challenge_password = 123456

           # Password when encrypting a private key
           #password = secret

           # An URL that has CRLs (certificate revocation lists)
           # available. Needed in CA certificates.
           #crl_dist_points = "http://www.getcrl.crl/getcrl/"

           # Whether this is a CA certificate or not
           #ca

           # Subject Unique ID (in hex)
           #subject_unique_id = 00153224

           # Issuer Unique ID (in hex)
           #issuer_unique_id = 00153225

           #### Key usage

           # The following key usage flags are used by CAs and end certificates

           # Whether this certificate will be used to sign data (needed
           # in TLS DHE ciphersuites). This is the digitalSignature flag
           # in RFC5280 terminology.
           signing_key

           # Whether this certificate will be used to encrypt data (needed
           # in TLS RSA ciphersuites). Note that it is preferred to use different
           # keys for encryption and signing. This is the keyEncipherment flag
           # in RFC5280 terminology.
           encryption_key

           # Whether this key will be used to sign other certificates. The
           # keyCertSign flag in RFC5280 terminology.
           #cert_signing_key

           # Whether this key will be used to sign CRLs. The
           # cRLSign flag in RFC5280 terminology.
           #crl_signing_key

           # The keyAgreement flag of RFC5280. It's purpose is loosely
           # defined. Not use it unless required by a protocol.
           #key_agreement

           # The dataEncipherment flag of RFC5280. It's purpose is loosely
           # defined. Not use it unless required by a protocol.
           #data_encipherment

           # The nonRepudiation flag of RFC5280. It's purpose is loosely
           # defined. Not use it unless required by a protocol.
           #non_repudiation

           #### Extended key usage (key purposes)

           # The following extensions are used in an end certificate
           # to clarify its purpose. Some CAs also use it to indicate
           # the types of certificates they are purposed to sign.

           # Whether this certificate will be used for a TLS client;
           # this sets the id-kp-serverAuth (1.3.6.1.5.5.7.3.1) of
           # extended key usage.
           #tls_www_client

           # Whether this certificate will be used for a TLS server;
           # This sets the id-kp-clientAuth (1.3.6.1.5.5.7.3.2) of
           # extended key usage.
           #tls_www_server

           # Whether this key will be used to sign code. This sets the
           # id-kp-codeSigning (1.3.6.1.5.5.7.3.3) of extended key usage
           # extension.
           #code_signing_key

           # Whether this key will be used to sign OCSP data. This sets the
           # id-kp-OCSPSigning (1.3.6.1.5.5.7.3.9) of extended key usage extension.
           #ocsp_signing_key

           # Whether this key will be used for time stamping. This sets the
           # id-kp-timeStamping (1.3.6.1.5.5.7.3.8) of extended key usage extension.
           #time_stamping_key

           # Whether this key will be used for email protection. This sets the
           # id-kp-emailProtection (1.3.6.1.5.5.7.3.4) of extended key usage extension.
           #email_protection_key

           # Whether this key will be used for IPsec IKE operations (1.3.6.1.5.5.7.3.17).
           #ipsec_ike_key

           ## adding custom key purpose OIDs

           # for microsoft smart card logon
           # key_purpose_oid = 1.3.6.1.4.1.311.20.2.2

           # for email protection
           # key_purpose_oid = 1.3.6.1.5.5.7.3.4

           # for any purpose (must not be used in intermediate CA certificates)
           # key_purpose_oid = 2.5.29.37.0

           ### end of key purpose OIDs

           # When generating a certificate from a certificate
           # request, then honor the extensions stored in the request
           # and store them in the real certificate.
           #honor_crq_extensions

           # Path length contraint. Sets the maximum number of
           # certificates that can be used to certify this certificate.
           # (i.e. the certificate chain length)
           #path_len = -1
           #path_len = 2

           # OCSP URI
           # ocsp_uri = http://my.ocsp.server/ocsp

           # CA issuers URI
           # ca_issuers_uri = http://my.ca.issuer

           # Certificate policies
           #policy1 = 1.3.6.1.4.1.5484.1.10.99.1.0
           #policy1_txt = "This is a long policy to summarize"
           #policy1_url = http://www.example.com/a-policy-to-read

           #policy2 = 1.3.6.1.4.1.5484.1.10.99.1.1
           #policy2_txt = "This is a short policy"
           #policy2_url = http://www.example.com/another-policy-to-read

           # Name constraints

           # DNS
           #nc_permit_dns = example.com
           #nc_exclude_dns = test.example.com

           # EMAIL
           #nc_permit_email = "nmav@ex.net"

           # Exclude subdomains of example.com
           #nc_exclude_email = .example.com

           # Exclude all e-mail addresses of example.com
           #nc_exclude_email = example.com

           # Options for proxy certificates
           #proxy_policy_language = 1.3.6.1.5.5.7.21.1

           # Options for generating a CRL

           # The number of days the next CRL update will be due.
           # next CRL update will be in 43 days
           #crl_next_update = 43

           # this is the 5th CRL by this CA
           # Comment the field for a time-based number.
           #crl_number = 5

           # Specify the update dates more precisely.
           #crl_this_update_date = "2004-02-29 16:21:42"
           #crl_next_update_date = "2025-02-29 16:24:41"

           # The date that the certificates will be made seen as
           # being revoked.
           #crl_revocation_date = "2025-02-29 16:24:41"

EXAMPLES
       Generating private keys
       To create an RSA private key, run:
           $ certtool --generate-privkey --outfile key.pem --rsa

       To create a DSA or elliptic curves (ECDSA) private key use the above command combined with 'dsa' or 'ecc' options.

       Generating certificate requests
       To create a certificate request (needed when the certificate is  issued  by another party), run:
           certtool --generate-request --load-privkey key.pem    --outfile request.pem

       If the private key is stored in a smart card you can generate a request by specifying the private key object URL.
           $ ./certtool --generate-request --load-privkey "pkcs11:..."   --load-pubkey "pkcs11:..." --outfile request.pem

       Generating a self-signed certificate
       To create a self signed certificate, use the command:
           $ certtool --generate-privkey --outfile ca-key.pem
           $ certtool --generate-self-signed --load-privkey ca-key.pem    --outfile ca-cert.pem

       Note that a self-signed certificate usually belongs to a certificate authority, that signs other certificates.

       Generating a certificate
       To generate a certificate using the previous request, use the command:
           $ certtool --generate-certificate --load-request request.pem    --outfile cert.pem --load-ca-certificate ca-cert.pem    --load-ca-privkey ca-key.pem

       To generate a certificate using the private key only, use the command:
           $ certtool --generate-certificate --load-privkey key.pem    --outfile cert.pem --load-ca-certificate ca-cert.pem    --load-ca-privkey ca-key.pem

       Certificate information
       To view the certificate information, use:
           $ certtool --certificate-info --infile cert.pem

       PKCS #12 structure generation
       To generate a PKCS #12 structure using the previous key and certificate, use the command:
           $ certtool --load-certificate cert.pem --load-privkey key.pem    --to-p12 --outder --outfile key.p12

       Some tools (reportedly web browsers) have problems with that file because it does not contain the CA certificate for the certificate.  To
       work around that problem in the tool, you can use the --load-ca-certificate parameter as follows:

           $ certtool --load-ca-certificate ca.pem   --load-certificate cert.pem --load-privkey key.pem   --to-p12 --outder --outfile key.p12

       Diffie-Hellman parameter generation
       To generate parameters for Diffie-Hellman key exchange, use the command:
           $ certtool --generate-dh-params --outfile dh.pem --sec-param medium

       Proxy certificate generation
       Proxy certificate can be used to delegate your credential to a temporary, typically short-lived, certificate.  To create one from the pre‐
       viously created certificate, first create a temporary key and then generate a proxy certificate for it, using the commands:

           $ certtool --generate-privkey > proxy-key.pem
           $ certtool --generate-proxy --load-ca-privkey key.pem   --load-privkey proxy-key.pem --load-certificate cert.pem   --outfile proxy-cert.pem

       Certificate revocation list generation
       To create an empty Certificate Revocation List (CRL) do:

           $ certtool --generate-crl --load-ca-privkey x509-ca-key.pem            --load-ca-certificate x509-ca.pem

       To create a CRL that contains some revoked certificates, place the certificates in a file and use --load-certificate as follows:

           $ certtool --generate-crl --load-ca-privkey x509-ca-key.pem   --load-ca-certificate x509-ca.pem --load-certificate revoked-certs.pem

       To verify a Certificate Revocation List (CRL) do:

           $ certtool --verify-crl --load-ca-certificate x509-ca.pem < crl.pem

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
           p11tool (1)

AUTHORS
       Nikos Mavrogiannopoulos, Simon Josefsson and others; see /usr/share/doc/gnutls/AUTHORS for a complete list.

COPYRIGHT
       Copyright (C) 2000-2016 Free Software Foundation, and others all rights reserved.  This program is released under the terms of the GNU Gen‐
       eral Public License, version 3 or later.

BUGS
       Please send bug reports to: bugs@gnutls.org

NOTES
       This manual page was AutoGen-erated from the certtool option definitions.

3.4.10                                                              2019-05-28                                                         certtool(1)
